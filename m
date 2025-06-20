Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26577450EE;
	Fri, 20 Jun 2025 02:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750385817; cv=none; b=SE8BHHC7rjAm91TrPCURt3pEOHge1/M0lZaTm/oQBPVMyMXs1LgAqtbzkwGN76dzHyO4kkstgF3RrfS1XxUl8tpQ2AE9uzbRnVH+5hLTZg1XIGSwvNSS26WHmb8s80gYNdS5G3MDH7oT42TBmsdXJIcsp+N5EhRMl1A9RPnJEGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750385817; c=relaxed/simple;
	bh=O+MCyM3Cxz5sWUQ66OxBKvk7kzwuF8sbo1dhdzjIfDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=evKzw1PSJPZGaoiYz341oFRN1bsVJI+sjwK4S/rOe9hoIE0J/XatGc6ROhkgTMEAY0P1ixe3qiyq2uTB+Ktge+AFf7vmyWJFqk4jT8A4pgikIhyoSw4tUkrN2GaTNyuxrBPS04s/tHawag9XKn63L/IW9/CMDyXDIHEnA4gLbxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=dY/ON7BY; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="dY/ON7BY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=dddU8SQMwKyWLwSUA3HDzNyoq3hFA/VcuWgu/ai403Y=;
	b=dY/ON7BYaFM2fMI1rb/YVH6H0uSiZoOz9ahWbuFVTQLugQxqVeG+vI7jn6+2QI
	GHfX8muUajb9gdZAN2/o15pMPEm3Ivy5RxhE2oIQUcnaUfyDoeTO/FvxPIsI4akc
	237QRhlMkZwR+ga5qJd7WGVChROmvwgUYHZo7dEhrwYDw=
Received: from [10.42.12.155] (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wA3nVxwxFRoEsFNAg--.1447S2;
	Fri, 20 Jun 2025 10:16:17 +0800 (CST)
Message-ID: <c7a2cc26-794e-49e1-bf8c-35617bb8060f@163.com>
Date: Fri, 20 Jun 2025 10:16:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usbip: convert to use faux_device
To: Greg KH <gregkh@linuxfoundation.org>
Cc: shuah@kernel.org, valentina.manea.m@gmail.com, i@zenithal.me,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 zhouzongmin@kylinos.cn
References: <2a327b520760271471717fff9b222cdc34967489.1746662386.git.zhouzongmin@kylinos.cn>
 <20250604065410.76069-1-min_halo@163.com>
 <2025061926-paycheck-footnote-a2b8@gregkh>
Content-Language: en-US
From: Zongmin Zhou <min_halo@163.com>
In-Reply-To: <2025061926-paycheck-footnote-a2b8@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wA3nVxwxFRoEsFNAg--.1447S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww18uw4kGw1UAw1DXrWUArb_yoW8Zw13pF
	WfJFZIkrWUGFsFqrsrWF4Ut34ftwsay3yYyry3J397Ww4jyr98uF17Gr1Fk39xtry0ywnF
	qr4DKas8GFyUuFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uf-BiUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/1tbixxhxq2hT6U90lgABs7


On 2025/6/19 19:01, Greg KH wrote:
> On Wed, Jun 04, 2025 at 02:54:10PM +0800, Zongmin Zhou wrote:
>> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>
>> The vhci driver does not need to create a platform device,
>> it only did so because it was simple to do that in order to
>> get a place in sysfs to hang some device-specific attributes.
>> Now the faux device interface is more appropriate,change it
>> over to use the faux bus instead.
>>
>> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
>> ---
>> Changes in v2:
>> - don't change faux create api,just call probe on vhci_hcd_init.
>>
>>   drivers/usb/usbip/vhci.h             |  4 +-
>>   drivers/usb/usbip/vhci_hcd.c         | 86 +++++++++++-----------------
>>   drivers/usb/usbip/vhci_sysfs.c       | 68 +++++++++++-----------
>>   tools/usb/usbip/libsrc/vhci_driver.h |  2 +-
>>   4 files changed, 72 insertions(+), 88 deletions(-)
> I get the following build errors from this patch:
>
> drivers/usb/usbip/vhci_hcd.c:1462:12: error: ‘vhci_hcd_resume’ defined but not used [-Werror=unused-function]
>   1462 | static int vhci_hcd_resume(struct faux_device *fdev)
>        |            ^~~~~~~~~~~~~~~
> drivers/usb/usbip/vhci_hcd.c:1418:12: error: ‘vhci_hcd_suspend’ defined but not used [-Werror=unused-function]
>   1418 | static int vhci_hcd_suspend(struct faux_device *fdev, pm_message_t state)
>        |            ^~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
>
> Are you sure you tested this?
I apologize for not enabling -Werror, which resulted in missing this 
error warning.
I have tested usbip feature use the new patch,but not test system 
suspend/resume.
The faux bus type don't add pm function,and vhci-hcd driver can't 
register it.
Maybe have to add suspend/resume for it.like below:
static const struct bus_type faux_bus_type = {
     .name        = "faux",
     .match        = faux_match,
     .probe        = faux_probe,
     .remove        = faux_remove,
     .resume     = faux_resume,
     .suspend    = faux_suspend,
};

Is that right?
Your expertise would be greatly valued.
Thanks very much.
>
> thanks,
>
> greg k-h

