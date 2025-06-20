Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BEF27FD6D;
	Fri, 20 Jun 2025 09:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750411195; cv=none; b=B/j7jQHsTF5mMht77UDJa4Ph158zHvvFVkxhqYhv/C436+hliOcQoFTWETR77jnTxfdZa+Gs7AoCdAtRVPkd10vHMLx11hpBz9S8jbJt8ssanJNONT1lJXK3HgCoymLJLnGL/4sdcY4a1TEe06TGyJ1FjUCLOXJo1boOTdS76Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750411195; c=relaxed/simple;
	bh=vP0fc3TzCtBVwLfvGk9UEI9JOSs+hbFuxkv7gvF18Ms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iMstGSNTTBzw8s6jAka+y5vxqKOZCFSqpaS/ixbzWN66Z7O1S99tMd+yULqaN+hvwmiEQVlGWuZyYpZyjWG0mBzASGW4JFAurDTDKOJ9ybs5Bz8aASdG2jehgrooiUOBoYxZNTSU91Z6zRdQJaR8pLdDCvtAirbm7HM/oFp46mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TgFPF5WE; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TgFPF5WE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=e4VtYTu1vknHIVj4povD3h+Ci+kpMZER4RskT3rQmUw=;
	b=TgFPF5WEvtfBqnMmPQs4Qbx/cPIvVtabLqMcH9kSVdIQ5SaqVMuiswXLjRZdJu
	MOo6yW77aiydyqiwP0xAIfmaKcqanrQLOooIYI43P/kCmLlgk4j0n/4CF5NWwMQ2
	qVxtAfeOVcD94cedajNaOVUD4agtGm7nIz149uVNv6AoY=
Received: from [10.42.12.155] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDX3qulJ1VoWdx4AQ--.21834S2;
	Fri, 20 Jun 2025 17:19:34 +0800 (CST)
Message-ID: <9d95bb75-586c-48dc-9e34-432cc13fd99f@163.com>
Date: Fri, 20 Jun 2025 17:19:33 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usbip: convert to use faux_device
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: shuah@kernel.org, valentina.manea.m@gmail.com, i@zenithal.me,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 zhouzongmin@kylinos.cn
References: <2a327b520760271471717fff9b222cdc34967489.1746662386.git.zhouzongmin@kylinos.cn>
 <20250604065410.76069-1-min_halo@163.com>
 <2025061926-paycheck-footnote-a2b8@gregkh>
 <c7a2cc26-794e-49e1-bf8c-35617bb8060f@163.com>
 <2025062010-hardiness-flashily-cb0f@gregkh>
From: Zongmin Zhou <min_halo@163.com>
In-Reply-To: <2025062010-hardiness-flashily-cb0f@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgDX3qulJ1VoWdx4AQ--.21834S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxur1fJry7Zr15ZFWUXFykAFb_yoWrKF13pF
	ZxJFZYkr4qkF42gFsFgF1xXw1Fkw4Sy3y5Cr9rJry7X3yYkr95uFy7Kry5C393trWIkwnI
	vr4DKas8WFyUZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U-6pQUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/1tbixxFyq2hUvbrrkwACsO


On 2025/6/20 12:29, Greg KH wrote:
> On Fri, Jun 20, 2025 at 10:16:16AM +0800, Zongmin Zhou wrote:
>> On 2025/6/19 19:01, Greg KH wrote:
>>> On Wed, Jun 04, 2025 at 02:54:10PM +0800, Zongmin Zhou wrote:
>>>> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>>>
>>>> The vhci driver does not need to create a platform device,
>>>> it only did so because it was simple to do that in order to
>>>> get a place in sysfs to hang some device-specific attributes.
>>>> Now the faux device interface is more appropriate,change it
>>>> over to use the faux bus instead.
>>>>
>>>> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>>> ---
>>>> Changes in v2:
>>>> - don't change faux create api,just call probe on vhci_hcd_init.
>>>>
>>>>    drivers/usb/usbip/vhci.h             |  4 +-
>>>>    drivers/usb/usbip/vhci_hcd.c         | 86 +++++++++++-----------------
>>>>    drivers/usb/usbip/vhci_sysfs.c       | 68 +++++++++++-----------
>>>>    tools/usb/usbip/libsrc/vhci_driver.h |  2 +-
>>>>    4 files changed, 72 insertions(+), 88 deletions(-)
>>> I get the following build errors from this patch:
>>>
>>> drivers/usb/usbip/vhci_hcd.c:1462:12: error: ‘vhci_hcd_resume’ defined but not used [-Werror=unused-function]
>>>    1462 | static int vhci_hcd_resume(struct faux_device *fdev)
>>>         |            ^~~~~~~~~~~~~~~
>>> drivers/usb/usbip/vhci_hcd.c:1418:12: error: ‘vhci_hcd_suspend’ defined but not used [-Werror=unused-function]
>>>    1418 | static int vhci_hcd_suspend(struct faux_device *fdev, pm_message_t state)
>>>         |            ^~~~~~~~~~~~~~~~
>>> cc1: all warnings being treated as errors
>>>
>>> Are you sure you tested this?
>> I apologize for not enabling -Werror, which resulted in missing this error
>> warning.
>> I have tested usbip feature use the new patch,but not test system
>> suspend/resume.
>> The faux bus type don't add pm function,and vhci-hcd driver can't register
>> it.
>> Maybe have to add suspend/resume for it.like below:
>> static const struct bus_type faux_bus_type = {
>>      .name        = "faux",
>>      .match        = faux_match,
>>      .probe        = faux_probe,
>>      .remove        = faux_remove,
>>      .resume     = faux_resume,
>>      .suspend    = faux_suspend,
>> };
>>
>> Is that right?
>> Your expertise would be greatly valued.
> As this is not real hardware, why do you need the suspend/resume
> callbacks at all?  What is happening here that requires them?
@greg,
The vhci_hcd_suspend/vhci_hcd_resume interfaces are not designed for 
this faux device, but rather to
manipulate the HCD_FLAG_HW_ACCESSIBLE bit in the hcd flags associated 
with the faux device.
For example:
During system standby: clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags)
During system wakeup: set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags)

Previously, these two functions were registered through platform_driver,
but faux bus does not have the relevant interface, so they were not called,
resulting in this compilation warning error.

This raises the question: Should the faux bus implement PM-related 
interface?
I'm uncertain whether these functions are essential for the vhci-hcd 
driver or if they can be safely removed.

However, during system standby/wakeup tests with remote USB devices 
bound to the vhci-hcd driver,
I observed consistent failure scenarios across both the original 
platform bus and faux bus patch implementations.

Failure Modes
a.Failed standby with auto-wakeup(Log excerpt):
[ 1449.065592][T10238] PM: suspend entry (s2idle)
[ 1449.106146][T10238] Filesystems sync: 0.040 seconds
[ 1449.216189][T10238] Freezing user space processes
[ 1449.219474][T10238] Freezing user space processes completed (elapsed 
0.002 seconds)
[ 1449.219887][T10238] OOM killer disabled.
[ 1449.220090][T10238] Freezing remaining freezable tasks
[ 1469.222372][T10238] Freezing remaining freezable tasks failed after 
20.002 seconds (0 tasks refusing to freeze, wq_busy=1):
[ 1469.225038][T10238] Showing freezable workqueues that are still busy:
[ 1469.226176][T10238] workqueue events_freezable_pwr_efficient: flags=0x86
[ 1469.227453][T10238]   pwq 20: cpus=0-3 node=0 flags=0x4 nice=0 
active=1 refcnt=2
[ 1469.227463][T10238]     in-flight: 268:disk_events_workfn
[ 1469.233559][T10238] Restarting kernel threads ... done.
[ 1469.235119][T10238] OOM killer enabled.
[ 1469.235849][T10238] Restarting tasks ... done.
[ 1469.240121][T10238] random: crng reseeded on system resumption
[ 1469.241176][T10238] PM: suspend exit

b.Failed standby with black screen freeze:
[ 1820.667073][T11454] PM: suspend entry (s2idle)

@Shuah，
I wonder if you has encountered this issue? When a USB device is 
attached to vhci-hcd,
is it not possible to put the system into standby mode?

Thanks.

> thanks,
>
> greg k-h

