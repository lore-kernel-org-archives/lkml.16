Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55636270569
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776283; cv=none; b=jZ4EAB8264cmyCr+I6w5GNqCAJrCB7W+P718yAtrUIIJ+d0PWLKcWB3ZGBRhZvlDCKeetTvDgl/Aqff8gxC/mFvPAxoYBykfINClwOQIcgvq5eCrW0FSkJ4/LISqrJ3xMz5ZLWIuWJZLnImN0SkhNWNMzCSlcV07psMhmUlxPpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776283; c=relaxed/simple;
	bh=tNJ4HJu02Ck+PZ/lsKGVR1hENMaJKR0GJvTq5g/OR1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RLGrXNpCcTtnQVL2h9lqEp4F3HYt/buYCvbyfDtIRxhFTjFntmV7Au0Ge4lQuK89gnL38qZVvbjCQY5zxslLMH6zNQg5yNE3yerMx+t+6WGwFmE95ziAJV/qrjFsQKm6gKGk4+KFfm0le/A2XUy/Uly0OTlBPsv3gVgidzxF0RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=M8P6Cw7E; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="M8P6Cw7E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746776279;
	bh=tNJ4HJu02Ck+PZ/lsKGVR1hENMaJKR0GJvTq5g/OR1g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M8P6Cw7E5GoouWFLX0oGjHGTMGPxTpohCC/NeB6jSTzU45sTvqa1RHq45A7oy6+eF
	 m78piA/iPK76g/0Male8iZaRoVoe+Cgz0YWqxaGJXdLaOKGkuPu1RH4ULUwBJ5iRWa
	 251d9tFJo+gdpCimJAofkKG71I0WlKVzw7VxSCziMfK2t9CI/1gH6HOEyg2GojYAAR
	 MYWj+fEdwp1GDrUaZAALV9PwnzBd1eT5kfwWo2LD6UdOt66uWUp34strMNOgByTv7u
	 O2G2ws5e+AyRApba9fW8+MyNey36HOLHE6cdPHO2nGqU72VMaCv7RionZPt7MnB4Wr
	 jLJFhJe0yIENg==
Received: from [192.168.50.250] (unknown [171.76.80.110])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E0CB117E07E4;
	Fri,  9 May 2025 09:37:56 +0200 (CEST)
Message-ID: <45450eeb-1866-4bf6-a83b-1f28e26f311c@collabora.com>
Date: Fri, 9 May 2025 13:07:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: x86: Boot failure on select chromebooks with v6.15-rc5
To: Ingo Molnar <mingo@kernel.org>
Cc: dmukhin@ford.com, mingo@redhat.com, andriy.shevchenko@linux.intel.com,
 x86@kernel.org, daniels <daniels@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>, robdclark <robdclark@gmail.com>,
 lumag@kernel.org, linux-kernel <linux-kernel@vger.kernel.org>
References: <a8638f85-1cc2-4f51-97ba-7106a4662885@collabora.com>
 <aB2bStp8efMHPjet@gmail.com>
 <d966d626-458b-4a29-abe1-b645317e15d2@collabora.com>
 <aB2itc2-5h3LEJi6@gmail.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <aB2itc2-5h3LEJi6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ingo,

On 09/05/25 12:07, Ingo Molnar wrote:
> 
> * Vignesh Raman <vignesh.raman@collabora.com> wrote:
> 
>>> What boot cmdline does your kernel have? The MMIO-UART patches should
>>> only have an effect if the feature is specifically enabled via a boot
>>> option:
>>>
>>> +               if (!strncmp(buf, "mmio32", 6)) {
>>> +			buf += 6;
>>> +                       early_mmio_serial_init(buf);
>>> +                       early_console_register(&early_serial_console, keep);
>>> +                       buf += 4;
>>> +               }
>>>
>>
>> amdgpu:stoney:
>> earlyprintk=uart8250,mmio32,0xfedc6000,115200n8  console=ttyS0,115200n8
>> root=/dev/nfs rw nfsroot=192.168.201.1:/var/lib/lava/dispatcher/tmp/18598802/extract-nfsrootfs-wgn1xjer,tcp,hard,v3
>> init=/init rootwait usbcore.quirks=0bda:8153:k ip=dhcp
>> tftpserverip=192.168.201.1
>>
>> i915:amly:
>> earlyprintk=uart8250,mmio32,0xde000000,115200n8  console=ttyS0,115200n8
>> root=/dev/nfs rw nfsroot=192.168.201.1:/var/lib/lava/dispatcher/tmp/18598804/extract-nfsrootfs-5rlm_b6z,tcp,hard,v3
>> init=/init rootwait usbcore.quirks=0bda:8153:k ip=dhcp
>> tftpserverip=192.168.201.1
>>
>> i915:whl:
>> earlyprintk=uart8250,mmio32,0xde000000,115200n8  console=ttyS0,115200n8
>> root=/dev/nfs rw nfsroot=192.168.201.1:/var/lib/lava/dispatcher/tmp/18598833/extract-nfsrootfs-3w0w5_mi,tcp,hard,v3
>> init=/init rootwait usbcore.quirks=0bda:8153:k ip=dhcp
>> tftpserverip=192.168.201.1
> 
> Well, if you remove the earlyprintk option then it will boot fine,
> right?

Yes, it works when mmio32 option is removed.

https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76005338

earlyprintk=uart8250,0xde000000,115200n8  console=ttyS0,115200n8 
root=/dev/nfs rw 
nfsroot=192.168.201.1:/var/lib/lava/dispatcher/tmp/18599938/extract-nfsrootfs-neuejjq0,tcp,hard,v3 
init=/init rootwait usbcore.quirks=0bda:8153:k ip=dhcp 
tftpserverip=192.168.201.1

> 
> The earlyprintk=mmio32 in v6.15 is a new debugging feature that was
> tested on a single board by Denis Mukhin AFAIK, and it may or may not
> work on your particular UART - even assuming that all the parameters
> are correct.

So the earlyprintk=mmio32 debugging feature is needed only for v6.15 and 
is not necessary in previous kernels (e.g., v6.14 and earlier). Is my 
understanding correct?

Regards,
Vignesh

> 
> Thanks,
> 
> 	Ingo

