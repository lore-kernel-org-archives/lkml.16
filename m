Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F3525EF9C
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747216689; cv=none; b=W/PLtEDcpiUcua2+DZzke+NcsE+QSaixf2jX7cE/6ppqYEkM7urj4LGsNLcCNlWp+lAE7/3F0XOAuFwkqMHzeOHa5koQJSqe0JipsI7inR1Ftkcm+/hGbLO8H4RnMCGv2m7WQ+CRUgrZGG+AJarfz0vxIwucWUhWvunTbg3Gb7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747216689; c=relaxed/simple;
	bh=8qzF0dnibpzSwk28HHXwMXKVCE2C0IRgQqjSRLDXxF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I0uFrAdL2YWEEHO4JRFoJJRcAMZxD5ZVfMDZlDciD6quVJIYM8dqRu1OyonPfK+hgO9uFnavvOjE4+wj5w65e7GnPQBBGYFD50GvsTptE7WQStjs/noYHm8wxVZ0Jjnp4stmTCfBTC+DmZnSb1kFPXMO3DTt2vX+iW3YtKGMPI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hP94fQbW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hP94fQbW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747216680;
	bh=8qzF0dnibpzSwk28HHXwMXKVCE2C0IRgQqjSRLDXxF4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hP94fQbWKz+uhHQTs97vAzBtt43GNsf3+oV5qJLFjImHMUcnAeII1j72Jav5HgM9W
	 VogXJD/dblDIFTonYJh+gA0jY+6ozilq60FrDX9PoRoY1c/GNPKEJaUCwzBO7PJTHI
	 IZuZPC16pSZvijRdp5G/9Tz+Q9+ZssJ9Mw9IwgERok5Mp66Yna3oPlZC8acOJNNAlx
	 nSmTuWV3fE3VXaxK74TjedgXI5eT7u53uFVsX/IWF/+QOgRKz+X4uAHwuzq5YBtk7i
	 jS/JROnuzjbwRLpwUbG2sQDHuX0aNDrLiJLjm5gpBcx+3jlP5XXPtGaf+HofiMgQ4f
	 yGB9VfG6WFl+w==
Received: from [192.168.50.250] (unknown [171.76.80.110])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 010DD17E153D;
	Wed, 14 May 2025 11:57:57 +0200 (CEST)
Message-ID: <6c187b50-8ac0-42ac-af46-5357a26cb830@collabora.com>
Date: Wed, 14 May 2025 15:27:55 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: x86: Boot failure on select chromebooks with v6.15-rc5
To: dmkhn@proton.me
Cc: Ingo Molnar <mingo@kernel.org>, dmukhin@ford.com, mingo@redhat.com,
 andriy.shevchenko@linux.intel.com, x86@kernel.org,
 daniels <daniels@collabora.com>, Daniel Stone <daniel@fooishbar.org>,
 robdclark <robdclark@gmail.com>, lumag@kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <a8638f85-1cc2-4f51-97ba-7106a4662885@collabora.com>
 <aB2bStp8efMHPjet@gmail.com>
 <d966d626-458b-4a29-abe1-b645317e15d2@collabora.com>
 <aB2itc2-5h3LEJi6@gmail.com>
 <45450eeb-1866-4bf6-a83b-1f28e26f311c@collabora.com>
 <aCIwQHABCPufAQWr@kraken>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <aCIwQHABCPufAQWr@kraken>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Denis

On 12/05/25 23:00, dmkhn@proton.me wrote:
> Hi,
> 
> On Fri, May 09, 2025 at 01:07:54PM +0530, Vignesh Raman wrote:
>> Hi Ingo,
>>
>> On 09/05/25 12:07, Ingo Molnar wrote:
>>>
>>> * Vignesh Raman <vignesh.raman@collabora.com> wrote:
>>>
>>>>> What boot cmdline does your kernel have? The MMIO-UART patches should
>>>>> only have an effect if the feature is specifically enabled via a boot
>>>>> option:
>>>>>
>>>>> +               if (!strncmp(buf, "mmio32", 6)) {
>>>>> +			buf += 6;
>>>>> +                       early_mmio_serial_init(buf);
>>>>> +                       early_console_register(&early_serial_console, keep);
>>>>> +                       buf += 4;
>>>>> +               }
>>>>>
>>>>
>>>> amdgpu:stoney:
>>>> earlyprintk=uart8250,mmio32,0xfedc6000,115200n8  console=ttyS0,115200n8
>>>> root=/dev/nfs rw nfsroot=192.168.201.1:/var/lib/lava/dispatcher/tmp/18598802/extract-nfsrootfs-wgn1xjer,tcp,hard,v3
>>>> init=/init rootwait usbcore.quirks=0bda:8153:k ip=dhcp
>>>> tftpserverip=192.168.201.1
>>>>
>>>> i915:amly:
>>>> earlyprintk=uart8250,mmio32,0xde000000,115200n8  console=ttyS0,115200n8
>>>> root=/dev/nfs rw nfsroot=192.168.201.1:/var/lib/lava/dispatcher/tmp/18598804/extract-nfsrootfs-5rlm_b6z,tcp,hard,v3
>>>> init=/init rootwait usbcore.quirks=0bda:8153:k ip=dhcp
>>>> tftpserverip=192.168.201.1
>>>>
>>>> i915:whl:
>>>> earlyprintk=uart8250,mmio32,0xde000000,115200n8  console=ttyS0,115200n8
>>>> root=/dev/nfs rw nfsroot=192.168.201.1:/var/lib/lava/dispatcher/tmp/18598833/extract-nfsrootfs-3w0w5_mi,tcp,hard,v3
>>>> init=/init rootwait usbcore.quirks=0bda:8153:k ip=dhcp
>>>> tftpserverip=192.168.201.1
>>>
>>> Well, if you remove the earlyprintk option then it will boot fine,
>>> right?
>>
>> Yes, it works when mmio32 option is removed.
>>
>> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76005338
>>
>> earlyprintk=uart8250,0xde000000,115200n8  console=ttyS0,115200n8
>> root=/dev/nfs rw nfsroot=192.168.201.1:/var/lib/lava/dispatcher/tmp/18599938/extract-nfsrootfs-neuejjq0,tcp,hard,v3
>> init=/init rootwait usbcore.quirks=0bda:8153:k ip=dhcp
>> tftpserverip=192.168.201.1
> 
> For the above example, can you please try something like
> 
>    earlyprintk=mmio32,0xde000000,nocfg
> 
> ?

This option didn’t work. For now, we’ll use earlycon instead of 
earlyprintk to fix the issue.

Thanks.

Regards,
Vignesh

> 
> In my case, configuring exact baud rate did not work. I started to dig that,
> but did not finish, because `nocfg` worked (firmware happened to configure the
> UART correctly). Using `nocfg` was sufficient for the system bringup debugging.
> 
>>
>>>
>>> The earlyprintk=mmio32 in v6.15 is a new debugging feature that was
>>> tested on a single board by Denis Mukhin AFAIK, and it may or may not
>>> work on your particular UART - even assuming that all the parameters
>>> are correct.
> 
> Correct, I have tested with one board only and with limited UART configuration
> combinations.
> 
>>
>> So the earlyprintk=mmio32 debugging feature is needed only for v6.15 and is
>> not necessary in previous kernels (e.g., v6.14 and earlier). Is my
>> understanding correct?
>>
>> Regards,
>> Vignesh
>>
>>>
>>> Thanks,
>>>
>>> 	Ingo
>>
> 
> Thanks,
> Denis
> 

