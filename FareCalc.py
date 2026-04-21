def fare_cal(kms, vehicle,tym):
    rates ={
        "Economy" : 10,
        "Premium":18,
        "Suv":25
    }
    if vehicle not in rates:
        return None,"Service not available"
    
    basic_fare = kms*rates[vehicle]

    #surge
    if 17<= tym <=20:
        total_fare = basic_fare *1.5
        surge_applied = True
    else:
        total_fare = basic_fare
        surge_applied = False
    return total_fare, surge_applied

def main():
    print(" Cab fare calculator")

    try:
        kms = float(input("enter distance in km :  "))
        vehicle = input("enter the vehicle type(Economy/Premium/Suv) :  ")
        tym = int(input("enter time(0-23) :  "))

        fare,status = fare_cal(kms,vehicle,tym)

        if fare is None:
            print(f"wrong {status}")
            return
        
        print(" Your ride receipt")
        print(f"Distance      : {kms} kms ")
        print(f"vehicle_type  : {vehicle}")
        print(f"Travel time   : {tym}")

        if status: 
            print("Surge pricing :Applied (1.5x)")
        else:
            print("Surge pricing  : not applied")

        print(f"Total fare is  : {fare:.2f}")


    except ValueError:
        print("Invalid input ,please enter the correct values")

if __name__ == "__main__":
    main()