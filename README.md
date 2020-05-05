# getvmip

Get VirtualBox VM IPs via VirtualBox guestcontrol

## Usage

**Args**

- 1: VM name
- 2: Username
- 3: Password

**Example**

```
CMD> getvmips.bat srv Administrator password

Guest OS:                    Windows 2016 (64-bit)

IPAddress
---------
10.0.0.1
```

# vmcopy

Copies file from one vm to another through the host

*note: uses hardcoded credentials and paths - use is for test vms only*

## Usage 

**Args**

- 1: file on VM1

**Example**

```
CMD> vmcopy.bat /tmp/foo.zip
```
