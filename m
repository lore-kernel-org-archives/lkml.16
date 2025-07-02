Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E795928691;
	Wed,  2 Jul 2025 02:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751422367; cv=none; b=esNYAdLIyfmjRSxUhKU7iejOC0ItapXYZl8tM8I8GUywZ/uEQn4t9Kn0KjS+n+Bx5mgnE1lj9t88o5W4L87JebBpJypMXxrZP6pft+xDZdvqao+c0nMTtNeCDPOln9v506h5IkFuJGP3kxvyWMuo37rSwl7gc6Hi9MrXfKci8Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751422367; c=relaxed/simple;
	bh=mBi3lhsvWZUchgssvzG29TI3T5AfIe0ZrX7JhUKsHW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OB51a6cBRE4GoIjzZtOzoVwlTl7lAAZXnJhMctvmQe3odVmuZcBYLD3rUwK7u96LZBNIFXLyMTP7XJ+GyjMFSFrlRyuh1MKXmyr44O/ikX0WtTf8eZGlm4MgHr3b6wXD/0c1f9wzHZjj7yKc3PuDa3phse97pA+zQvc6rCikxO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=bqeKLghw; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bqeKLghw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=O8mOntubmk3h40n+UJfi7N5Atv/N2A4C+NcyXsbwmIQ=;
	b=bqeKLghwyqvbklwpnviKFdhg6gYYW7r2XFQ1gtXDt8oMuvl3aP3K7VW5kDdyO6
	aTdXxOz/VNMKPlwh6DbWRxxQFHKwD0BxWMxkPykxb663i6CGwOqh/kDo0XITLYoz
	XzEKVcI0O4D8+i3BTQ24JuQwwCGwezl/EbmM7MYNwlFk0=
Received: from [10.42.12.155] (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnD919lWRo54OhBw--.20606S2;
	Wed, 02 Jul 2025 10:12:14 +0800 (CST)
Message-ID: <a29703bd-08b7-489b-8fb0-15838a1245ab@163.com>
Date: Wed, 2 Jul 2025 10:12:12 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usbip: convert to use faux_device
Content-Language: en-US
To: Shuah Khan <skhan@linuxfoundation.org>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: shuah@kernel.org, valentina.manea.m@gmail.com, i@zenithal.me,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 zhouzongmin@kylinos.cn
References: <2a327b520760271471717fff9b222cdc34967489.1746662386.git.zhouzongmin@kylinos.cn>
 <20250604065410.76069-1-min_halo@163.com>
 <2025061926-paycheck-footnote-a2b8@gregkh>
 <c7a2cc26-794e-49e1-bf8c-35617bb8060f@163.com>
 <2025062010-hardiness-flashily-cb0f@gregkh>
 <9d95bb75-586c-48dc-9e34-432cc13fd99f@163.com>
 <2025062004-navy-emboss-4743@gregkh>
 <2e0bbc5a-e74a-4fb5-884c-686dbaf99caf@linuxfoundation.org>
 <48ab511e-2847-4daa-98de-a234b8584b78@163.com>
 <fac026d8-12c8-4c1f-96a7-264ced8391f1@linuxfoundation.org>
From: Zongmin Zhou <min_halo@163.com>
In-Reply-To: <fac026d8-12c8-4c1f-96a7-264ced8391f1@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnD919lWRo54OhBw--.20606S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jr1DtF15Kr1kGw4DGFyfJFb_yoW3GF1UpF
	W2yF4jyr4UJr12yrs29w1Ut3WFyw4rt3y5Zr98J3srW34qyr93WF47Jry5CFZrtr1xCw1j
	vr4jgasrXryUZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U3UUbUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/1tbiLAJ9q2hkYZl+KQABsa


On 2025/7/2 06:56, Shuah Khan wrote:
> On 6/23/25 21:21, Zongmin Zhou wrote:
>>
>> On 2025/6/21 01:26, Shuah Khan wrote:
>>> On 6/20/25 03:27, Greg KH wrote:
>>>> On Fri, Jun 20, 2025 at 05:19:33PM +0800, Zongmin Zhou wrote:
>>>>>
>>>>> On 2025/6/20 12:29, Greg KH wrote:
>>>>>> On Fri, Jun 20, 2025 at 10:16:16AM +0800, Zongmin Zhou wrote:
>>>>>>> On 2025/6/19 19:01, Greg KH wrote:
>>>>>>>> On Wed, Jun 04, 2025 at 02:54:10PM +0800, Zongmin Zhou wrote:
>>>>>>>>> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>>>>>>>>
>>>>>>>>> The vhci driver does not need to create a platform device,
>>>>>>>>> it only did so because it was simple to do that in order to
>>>>>>>>> get a place in sysfs to hang some device-specific attributes.
>>>>>>>>> Now the faux device interface is more appropriate,change it
>>>>>>>>> over to use the faux bus instead.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>>>>>>>> ---
>>>>>>>>> Changes in v2:
>>>>>>>>> - don't change faux create api,just call probe on vhci_hcd_init.
>>>>>>>>>
>>>>>>>>>     drivers/usb/usbip/vhci.h             |  4 +-
>>>>>>>>>     drivers/usb/usbip/vhci_hcd.c         | 86 
>>>>>>>>> +++++++++++-----------------
>>>>>>>>>     drivers/usb/usbip/vhci_sysfs.c       | 68 
>>>>>>>>> +++++++++++-----------
>>>>>>>>>     tools/usb/usbip/libsrc/vhci_driver.h |  2 +-
>>>>>>>>>     4 files changed, 72 insertions(+), 88 deletions(-)
>>>>>>>> I get the following build errors from this patch:
>>>>>>>>
>>>>>>>> drivers/usb/usbip/vhci_hcd.c:1462:12: error: ‘vhci_hcd_resume’ 
>>>>>>>> defined but not used [-Werror=unused-function]
>>>>>>>>     1462 | static int vhci_hcd_resume(struct faux_device *fdev)
>>>>>>>>          |            ^~~~~~~~~~~~~~~
>>>>>>>> drivers/usb/usbip/vhci_hcd.c:1418:12: error: ‘vhci_hcd_suspend’ 
>>>>>>>> defined but not used [-Werror=unused-function]
>>>>>>>>     1418 | static int vhci_hcd_suspend(struct faux_device 
>>>>>>>> *fdev, pm_message_t state)
>>>>>>>>          |            ^~~~~~~~~~~~~~~~
>>>>>>>> cc1: all warnings being treated as errors
>>>>>>>>
>>>>>>>> Are you sure you tested this?
>>>>>>> I apologize for not enabling -Werror, which resulted in missing 
>>>>>>> this error
>>>>>>> warning.
>>>>>>> I have tested usbip feature use the new patch,but not test system
>>>>>>> suspend/resume.
>>>>>>> The faux bus type don't add pm function,and vhci-hcd driver 
>>>>>>> can't register
>>>>>>> it.
>>>>>>> Maybe have to add suspend/resume for it.like below:
>>>>>>> static const struct bus_type faux_bus_type = {
>>>>>>>       .name        = "faux",
>>>>>>>       .match        = faux_match,
>>>>>>>       .probe        = faux_probe,
>>>>>>>       .remove        = faux_remove,
>>>>>>>       .resume     = faux_resume,
>>>>>>>       .suspend    = faux_suspend,
>>>>>>> };
>>>>>>>
>>>>>>> Is that right?
>>>>>>> Your expertise would be greatly valued.
>>>>>> As this is not real hardware, why do you need the suspend/resume
>>>>>> callbacks at all?  What is happening here that requires them?
>>>>> @greg,
>>>>> The vhci_hcd_suspend/vhci_hcd_resume interfaces are not designed 
>>>>> for this
>>>>> faux device, but rather to
>>>>> manipulate the HCD_FLAG_HW_ACCESSIBLE bit in the hcd flags 
>>>>> associated with
>>>>> the faux device.
>>>>> For example:
>>>>> During system standby: clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags)
>>>>> During system wakeup: set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags)
>>>>>
>>>>> Previously, these two functions were registered through 
>>>>> platform_driver,
>>>>> but faux bus does not have the relevant interface, so they were 
>>>>> not called,
>>>>> resulting in this compilation warning error.
>>>>>
>>>>> This raises the question: Should the faux bus implement PM-related
>>>>> interface?
>>>>> I'm uncertain whether these functions are essential for the 
>>>>> vhci-hcd driver
>>>>> or if they can be safely removed.
>>>>>
>>>>> However, during system standby/wakeup tests with remote USB 
>>>>> devices bound to
>>>>> the vhci-hcd driver,
>>>>> I observed consistent failure scenarios across both the original 
>>>>> platform
>>>>> bus and faux bus patch implementations.
>>>
>>> suspend and resume hooks have been in the code from beginning
>>> in the CONFIG_PM path. The original authors are skeptical about
>>> what should happen during suspend"
>>>
>>> /* what should happen for USB/IP under suspend/resume? */
>>> suspend hook checks for active connections and sends EBBUSY
>>> back to pm core.
>>>
>>> Active connection means any of the ports are in 
>>> USB_PORT_STAT_CONNECTION
>>> state. So as long as there are active connections between vhci client
>>> and the host, suspend won't work. So we really don't know what happens
>>> to the active connections if there are no suspend/resume hooks.
>>>
>>> If there are no active connections, then it will clear the 
>>> HCD_FLAG_HW_ACCESSIBLE
>>> bit and returns to pm core to continue with suspend.
>>>
>>> resume sets the HCD_FLAG_HW_ACCESSIBLE flag to indicate hardware is 
>>> accessible
>>> and initiates port status poll.
>>>
>>> - suspend hook prevents suspend
>>>
>>> With faux device since there is no suspend and resume hook, I would 
>>> expect
>>> these hooks are not a factor in suspend and resume.
>>>
>>> vhci_hcd is a special case virtual driver as it is a proxy for 
>>> controlling
>>> hardware on the host.
>>>
>>> Zongmin,
>>>
>>> Do suspend/resume work when vhci_hcd is not loaded?
>>> What happens when when system suspends and resumes with faux device?
>>> Can you send me dmesg logs and pm logs?
>>>
>> Hi Greg,shuah
>>
>> Yes, system with vhci_hcd unload or just load vhci_hcd driver
>> without usbip devices bound to vhci_hcd,system suspend/resume worked 
>> well.
>> Some logs for you.
>
> Sorry for the delay. I was at a conference last week.
> Thank you for sending these logs.
>
>> 1.system with vhci_hcd driver load,but don't bound any usbip devices 
>> to vhci_hcd,suspend/resume worked well.
>> see dmesg-faux bus-load.log
>
>
>>
>> 2.usbip device bound to vhci_hcd,and do system suspend 
>> action,suspend/resume worked failed.
>> I observed two distinct failure scenario:
>> Scenario 1: System failed to enter suspend state,and will auto resume;
>
>
>> the log for use platform bus:
>> dmesg-platform bus-device bound-auto resume.log
>
> This is clear from the suspend hook in the vhci_hcd.
> When it returns EBUSY, suspend will fail and move to
> auto resume.
>
>> the log for use faux bus:
>> dmesg-faux bus-device bound-auto resume.log
>
> It is good that the behavior is same with faux bus even though
> suspend hook isn't called. I will take a look at the log.
>
>>
>> Scenario 2: System resume failed with black screen freeze,a forced 
>> restart of the machine is require.
>> the log for use platform bus:
>> dmesg-platform bus-device bound-black screen.log
>> the log for use faux bus:
>> dmesg-faux bus-device bound-black screen.log
>
> That is bad. When does this happen? Is there a difference in
> configuration?
>
No, there's no difference. The same code is used for two different 
failure scenarios.
I just tested many times. These two different situations occur 
probabilistically.
But they both happened only when the USBIP device is bound to the 
vhci_hcd driver.
> The behavior same for platform bus and faux bus. Sounds like
> an existing problem that needs to be debugged separately.
>
> I will take a look at all these logs and get back to you in
> a day or two.
>
> thanks,
> -- Shuah

