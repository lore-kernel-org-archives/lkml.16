Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D35E56A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750440375; cv=none; b=p35JxFox2mueujziLj2doKzXzBHIjMHmN1E23KlmjZ16/TZTvLSonzQT3Nr3LrNJ/bozHqY8/++ltTguv6XLEYfveB/vAiHL270jPDNC55gvrvI/aao9NSur5uNXQJmDveckxTev6xd+zzxiqIcoxMtzLLWAWgiWNUXc6vckcUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750440375; c=relaxed/simple;
	bh=DMDp7KdSg0OADmqXMvg+hhhIHuQ3+bHuc1JTtsSwrkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lkndpjqJKxqWo3X2QWHl8bcWR9YdiepRT5uy9y53cMqnfRs6Jw08bf6NwWvwRj5uct7U/ifcre4GFtPsQNsdzjgXza7VrJYnIYGh5iAFtlqzeDZGhlajN5IzWGK3/9RfdPa+2Hd5YRRk/xAqkJCcOI5OOz+r6GBzYGknug+fyiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D6KCD2ZG; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D6KCD2ZG"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-876231b81d5so160786739f.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750440372; x=1751045172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qMdgn8VeeI3SGgeQXZkzCb+QOrUsQueKBj98VA1GvRo=;
        b=D6KCD2ZGhxNZkKRy/ghsKIDKOMElOtUg7zH0N2/SMptp+uehuSsPsA5xgruyysugoF
         Ydxr+btzmrm+aGFk/aQTyOhX0+8UVlJR8PqxhphUL9W830Yfjjby6rM/DuJAN5/bg9FY
         1EsX+TNl0AmwsgtW5/TW9OJU3QsiJ0AAq6LDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750440372; x=1751045172;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qMdgn8VeeI3SGgeQXZkzCb+QOrUsQueKBj98VA1GvRo=;
        b=nSZporHcdzWmQJy9M0th4HyzxqnA/AaTUe4MgzLdWZkuTvxrabPH2NqqClr6vS1LAb
         IQ+elosRt0Oti4B/04IaHNZ1oHEmdXEj2r/BCI7VSnSGRtWqlgyqci9G2Qm3RfDpRgTS
         K5324CV7yumx2eDw75BdTmKLddHh9hDVf06OiqsuDkfCTlTIySGlRKpxGVlnpkmShKZA
         D1Jv77plPpIlFO6ECLgaH2vgofxTyg7TiMIBH5MHbnlmYYdR3VV4ff/6YNuRPLUd21t5
         yEuWONGE55uNVrBb4htx4W83qNcEUqPdSwW5OypzE1jzfLPRZuPnQTx5fcuTDC5xiGOL
         WL6A==
X-Forwarded-Encrypted: i=1; AJvYcCWzYAF8vELIuYYxxLrZmVYJOoH/EgMzpMyONmdYIhXav/5M6Uq2OHtCR4aoQLcGaVaK+ngetbBDgtZKXAc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3wypyyiQ2TaHAq/K5XTU0HeMNWpHPNUFMU5y2x9qecg8F+yY/
	8eQqkoKdS1HBWeeQX2K0kyjftKmEefYqDrNxVa6xljwGLeoualL2Z9gtKRE7nS0FiEo=
X-Gm-Gg: ASbGncudRMpnMm0p/kQJt58M7pLMY2x760lfwsZqYegRvF5TN+ZXAQia4EK3MrfM9Hv
	gUyWKXCwvi6I4jpfDXQ7vBxg1HXbwuHnkpAC/CdidZDa2LRGPyCoHXRLIWGFoeHkzQGM4A9N1Rz
	ajUV7R0gC1AGifIN+5A/BYZEi1W8QWaX5iA/7iDDh+pvAgHl0LqSnGteeZVkwuSHEhgDYzEmpTO
	S39WB1RJTlWQgwkFFD+rBw80UmKJtgpOZ7017ArnSOhYPndDQm0o0UPFt1QQ99oKAn8uNGoruc1
	QIdzu80oJRtt9mWYDffLQKJmOxZvIEw6JjrrXgtt2TfxJfh/jXRvVh79iaBWykKFju4rCprdOw=
	=
X-Google-Smtp-Source: AGHT+IGPqrLcEbc+zJorqkrwKIBd+2amU6zwdAIEOSPTFzmh/L/RFTuNfBUdby9GSMEYeFYE0aSWoQ==
X-Received: by 2002:a05:6e02:3a03:b0:3de:251c:211e with SMTP id e9e14a558f8ab-3de38cbf701mr36839325ab.17.1750440372219;
        Fri, 20 Jun 2025 10:26:12 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5019e05048dsm473385173.83.2025.06.20.10.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 10:26:11 -0700 (PDT)
Message-ID: <2e0bbc5a-e74a-4fb5-884c-686dbaf99caf@linuxfoundation.org>
Date: Fri, 20 Jun 2025 11:26:11 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usbip: convert to use faux_device
To: Greg KH <gregkh@linuxfoundation.org>, Zongmin Zhou <min_halo@163.com>
Cc: shuah@kernel.org, valentina.manea.m@gmail.com, i@zenithal.me,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 zhouzongmin@kylinos.cn, Shuah Khan <skhan@linuxfoundation.org>
References: <2a327b520760271471717fff9b222cdc34967489.1746662386.git.zhouzongmin@kylinos.cn>
 <20250604065410.76069-1-min_halo@163.com>
 <2025061926-paycheck-footnote-a2b8@gregkh>
 <c7a2cc26-794e-49e1-bf8c-35617bb8060f@163.com>
 <2025062010-hardiness-flashily-cb0f@gregkh>
 <9d95bb75-586c-48dc-9e34-432cc13fd99f@163.com>
 <2025062004-navy-emboss-4743@gregkh>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <2025062004-navy-emboss-4743@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/20/25 03:27, Greg KH wrote:
> On Fri, Jun 20, 2025 at 05:19:33PM +0800, Zongmin Zhou wrote:
>>
>> On 2025/6/20 12:29, Greg KH wrote:
>>> On Fri, Jun 20, 2025 at 10:16:16AM +0800, Zongmin Zhou wrote:
>>>> On 2025/6/19 19:01, Greg KH wrote:
>>>>> On Wed, Jun 04, 2025 at 02:54:10PM +0800, Zongmin Zhou wrote:
>>>>>> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>>>>>
>>>>>> The vhci driver does not need to create a platform device,
>>>>>> it only did so because it was simple to do that in order to
>>>>>> get a place in sysfs to hang some device-specific attributes.
>>>>>> Now the faux device interface is more appropriate,change it
>>>>>> over to use the faux bus instead.
>>>>>>
>>>>>> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>>>>> ---
>>>>>> Changes in v2:
>>>>>> - don't change faux create api,just call probe on vhci_hcd_init.
>>>>>>
>>>>>>     drivers/usb/usbip/vhci.h             |  4 +-
>>>>>>     drivers/usb/usbip/vhci_hcd.c         | 86 +++++++++++-----------------
>>>>>>     drivers/usb/usbip/vhci_sysfs.c       | 68 +++++++++++-----------
>>>>>>     tools/usb/usbip/libsrc/vhci_driver.h |  2 +-
>>>>>>     4 files changed, 72 insertions(+), 88 deletions(-)
>>>>> I get the following build errors from this patch:
>>>>>
>>>>> drivers/usb/usbip/vhci_hcd.c:1462:12: error: ‘vhci_hcd_resume’ defined but not used [-Werror=unused-function]
>>>>>     1462 | static int vhci_hcd_resume(struct faux_device *fdev)
>>>>>          |            ^~~~~~~~~~~~~~~
>>>>> drivers/usb/usbip/vhci_hcd.c:1418:12: error: ‘vhci_hcd_suspend’ defined but not used [-Werror=unused-function]
>>>>>     1418 | static int vhci_hcd_suspend(struct faux_device *fdev, pm_message_t state)
>>>>>          |            ^~~~~~~~~~~~~~~~
>>>>> cc1: all warnings being treated as errors
>>>>>
>>>>> Are you sure you tested this?
>>>> I apologize for not enabling -Werror, which resulted in missing this error
>>>> warning.
>>>> I have tested usbip feature use the new patch,but not test system
>>>> suspend/resume.
>>>> The faux bus type don't add pm function,and vhci-hcd driver can't register
>>>> it.
>>>> Maybe have to add suspend/resume for it.like below:
>>>> static const struct bus_type faux_bus_type = {
>>>>       .name        = "faux",
>>>>       .match        = faux_match,
>>>>       .probe        = faux_probe,
>>>>       .remove        = faux_remove,
>>>>       .resume     = faux_resume,
>>>>       .suspend    = faux_suspend,
>>>> };
>>>>
>>>> Is that right?
>>>> Your expertise would be greatly valued.
>>> As this is not real hardware, why do you need the suspend/resume
>>> callbacks at all?  What is happening here that requires them?
>> @greg,
>> The vhci_hcd_suspend/vhci_hcd_resume interfaces are not designed for this
>> faux device, but rather to
>> manipulate the HCD_FLAG_HW_ACCESSIBLE bit in the hcd flags associated with
>> the faux device.
>> For example:
>> During system standby: clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags)
>> During system wakeup: set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags)
>>
>> Previously, these two functions were registered through platform_driver,
>> but faux bus does not have the relevant interface, so they were not called,
>> resulting in this compilation warning error.
>>
>> This raises the question: Should the faux bus implement PM-related
>> interface?
>> I'm uncertain whether these functions are essential for the vhci-hcd driver
>> or if they can be safely removed.
>>
>> However, during system standby/wakeup tests with remote USB devices bound to
>> the vhci-hcd driver,
>> I observed consistent failure scenarios across both the original platform
>> bus and faux bus patch implementations.

suspend and resume hooks have been in the code from beginning
in the CONFIG_PM path. The original authors are skeptical about
what should happen during suspend"

/* what should happen for USB/IP under suspend/resume? */
suspend hook checks for active connections and sends EBBUSY
back to pm core.

Active connection means any of the ports are in USB_PORT_STAT_CONNECTION
state. So as long as there are active connections between vhci client
and the host, suspend won't work. So we really don't know what happens
to the active connections if there are no suspend/resume hooks.

If there are no active connections, then it will clear the HCD_FLAG_HW_ACCESSIBLE
bit and returns to pm core to continue with suspend.

resume sets the HCD_FLAG_HW_ACCESSIBLE flag to indicate hardware is accessible
and initiates port status poll.

- suspend hook prevents suspend

With faux device since there is no suspend and resume hook, I would expect
these hooks are not a factor in suspend and resume.

vhci_hcd is a special case virtual driver as it is a proxy for controlling
hardware on the host.

Zongmin,

Do suspend/resume work when vhci_hcd is not loaded?
What happens when when system suspends and resumes with faux device?
Can you send me dmesg logs and pm logs?

thanks,
-- Shuah




