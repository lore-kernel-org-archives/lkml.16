Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C57922D9F2
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 06:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746771724; cv=none; b=SYndv2uO1ds3ak8P+FejMTXNkT57MkVKoMzBbE7EGyVuQw+iaNtuoLvq2w3A1xK7IbICFEZlr80Q+tVM2jfSOrnTxHzo5gyKWiWxF3xCX3wlX90FM1omCtHzh0LHOj0loh+WCyWk1hZunPa4SvcJc5XVJRdy4zYe1+yzPy3I5q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746771724; c=relaxed/simple;
	bh=CmLYtpzwVxAxuk65EfmYjPByyNXJ6YX48p/mpCI6xRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DmjIwfTEbtoP0nmEP6C19Z+rnAwO9XpWWohAaI7OwPNyr9Qt2HeoQ21vpCAmoqoMLQkIYy7AK9t4dJMfaJRs5fsDPFpntM9aXwccOXUspxY7i0bgngCyaVAar2Qh1GSh8mIpuU5SziTm43RiijBQ7R3k0GjWQli9Pj//cCbNLys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=X/sTh9x9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="X/sTh9x9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746771720;
	bh=CmLYtpzwVxAxuk65EfmYjPByyNXJ6YX48p/mpCI6xRs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X/sTh9x9eOpvcPd+3P6n0pKqRI4UEpYZfbxioY2blhJWDq59jiptxpl36q7BYkga0
	 lXVRt9x2hQPTfi/YvwYlQUnpVp4+FtZtXRe2F18yqPz/mlECxfbcXHQcoZO50fYKcB
	 5ak4dEzt9mwUVX32rG8P8MGsJh9Kj8YdjIGI21ZRnzEoxbOs/0WHmtcOPqr0WpNqWs
	 ayeG7DWbXclQiKiypqmp3yBrwmAQjnCbaGyAbNvW8cCSC+i+tjCpfOEH/WJQINetOg
	 ylQ0u5WVR37FkA//7zra6G/5O2RO16Z+No1693tZJeGjpMhR9eAkMtTon1yW0E7sCA
	 lyIWSx2bdP6zQ==
Received: from [192.168.50.250] (unknown [171.76.80.110])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 851FC17E07E5;
	Fri,  9 May 2025 08:21:58 +0200 (CEST)
Message-ID: <d966d626-458b-4a29-abe1-b645317e15d2@collabora.com>
Date: Fri, 9 May 2025 11:51:54 +0530
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
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <aB2bStp8efMHPjet@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ingo,

On 09/05/25 11:36, Ingo Molnar wrote:
> 
> * Vignesh Raman <vignesh.raman@collabora.com> wrote:
> 
>> Hi,
>>
>> With v6.15-rc5, the below chromebooks were not booting with the following
>> message. These tests were run in drm-ci.
>>
>> Starting kernel ...
>> [    1.843801]  ? __pfx_kernel_init+0x10/0x10
>> [    1.909838]  ? __pfx_kernel_init+0x10/0x10
>>
>> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1420485
>>
>> Failing jobs:
>> amdgpu:stoney (AMD Stoney Ridge chipset):
>> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76000926
>>
>> i915:amly (64 bit Intel Whiskey Lake):
>> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76000929
>>
>> i915:whl (64 bit Intel Amber Lake):
>> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76000931
>>
>> These tests were passing till v6.14-rc7, and the issue was seen starting in
>> v6.15-rc1. This issue is seen only with these 3 boards and does not affect
>> other chromebooks (the pipeline log shows the other i915 driver tests).
>>
>> On bisecting the commits, the commit which introduced this issue is,
>> 3181424aeac2f6596534bf43021a10eae294a9b0 x86/early_printk: Add support for
>> MMIO-based UARTs
>>
>> After reverting the below commits in v6.15-rc5, the board boots and tests
>> are executed:
>> 3181424aeac2 x86/early_printk: Add support for MMIO-based UARTs
>> 996457176bb7 x86/early_printk: Use 'mmio32' for consistency, fix comments
>> (this fixes 3181424aeac2)
> 
> What boot cmdline does your kernel have? The MMIO-UART patches should
> only have an effect if the feature is specifically enabled via a boot
> option:
> 
> +               if (!strncmp(buf, "mmio32", 6)) {
> +			buf += 6;
> +                       early_mmio_serial_init(buf);
> +                       early_console_register(&early_serial_console, keep);
> +                       buf += 4;
> +               }
> 

amdgpu:stoney:
earlyprintk=uart8250,mmio32,0xfedc6000,115200n8  console=ttyS0,115200n8 
root=/dev/nfs rw 
nfsroot=192.168.201.1:/var/lib/lava/dispatcher/tmp/18598802/extract-nfsrootfs-wgn1xjer,tcp,hard,v3 
init=/init rootwait usbcore.quirks=0bda:8153:k ip=dhcp 
tftpserverip=192.168.201.1

i915:amly:
earlyprintk=uart8250,mmio32,0xde000000,115200n8  console=ttyS0,115200n8 
root=/dev/nfs rw 
nfsroot=192.168.201.1:/var/lib/lava/dispatcher/tmp/18598804/extract-nfsrootfs-5rlm_b6z,tcp,hard,v3 
init=/init rootwait usbcore.quirks=0bda:8153:k ip=dhcp 
tftpserverip=192.168.201.1

i915:whl:
earlyprintk=uart8250,mmio32,0xde000000,115200n8  console=ttyS0,115200n8 
root=/dev/nfs rw 
nfsroot=192.168.201.1:/var/lib/lava/dispatcher/tmp/18598833/extract-nfsrootfs-3w0w5_mi,tcp,hard,v3 
init=/init rootwait usbcore.quirks=0bda:8153:k ip=dhcp 
tftpserverip=192.168.201.1

Regards,
Vignesh

> The only other change I can see is the moving of an #if line.
> 
> Thanks,
> 
> 	Ingo

