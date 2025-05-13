Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4B8292080
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146407; cv=none; b=gtiudeg86eR466xAAqBu8FFnk5Vu9fNeKduBbhpQy+LCoLqTrlt+LcOLEh7wNW7nZQsjE8xlOWrHgCyk8gYXx/oxTFudZbNPTdx7CEG7oyKyzGlrk1NSpdWFEXT+iMolH4fC0WeWXSGTqCbdnF4gO0hyfkgUw31lhc4THX3gRC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146407; c=relaxed/simple;
	bh=qYsRr27KyrzorRZGruY/mzik8/noi2HJgHEFtl9lCDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D4w/6mrtdNLiRJkrpSmZgBipH2TqiRu+7Ll+5TLn90OrbRc9/HxwWCHwb3RUMYwc4pJj/BfqMTkGvnx3dSTa4YnbUkO5+UEsERHXND76gKLfujEGtGhumrNKb0V+cuY+XS7jwM9qALcZhpyN1C7CZs5vThuNM7aJEIxXG3Rdewo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NaqflHUz; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NaqflHUz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747146402;
	bh=qYsRr27KyrzorRZGruY/mzik8/noi2HJgHEFtl9lCDw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NaqflHUzrjEmu83Eqdfz5vLp3EilaB2O8KPNvY/sTINp3b2J4o5wHRZqljmqVRHPx
	 TeVF5AcuzpPhIVekv8CFOpJOZ9DOfuwDUzBHhM/yXBOyG8bx/Zvr5nho2SVKiTx1ql
	 /qNsZl1ujKNzhm96njzQwruku+sC32EX2KPdD5XeoG5tSvTdRCWR1cVBy7YuYY05mR
	 Q75J20j6QqMg10Zbv486KCoDTgxHE/fTppHbI+92pKiCxTSeCDw4jczEDWxeoD4wU8
	 2jBNrGQfXx8Jqu516PEzb6+Hqk7ZoYYyb3jnsY3FCmjHnDzionLtLxHko5F/rl2Hsr
	 P/KZgNU5s1ZdA==
Received: from [192.168.50.250] (unknown [171.76.80.110])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4A75C17E07E4;
	Tue, 13 May 2025 16:26:40 +0200 (CEST)
Message-ID: <714a719a-9e56-4158-a8ce-118b7ddb97b3@collabora.com>
Date: Tue, 13 May 2025 19:56:29 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: amlogic: Synchronous Abort with v6.15-rc6
To: Neil Armstrong <neil.armstrong@linaro.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>
Cc: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, sboyd@kernel.org,
 daniels <daniels@collabora.com>, Daniel Stone <daniel@fooishbar.org>,
 lumag@kernel.org, robdclark <robdclark@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <eb9281cc-de91-48a4-bbd6-f67ddc67a9dd@collabora.com>
 <b090cef6-5b9e-4149-872d-0316666f9e90@linaro.org>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <b090cef6-5b9e-4149-872d-0316666f9e90@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Neil,

On 13/05/25 15:25, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 13/05/2025 11:41, Vignesh Raman wrote:
>> Hi,
>>
>> The Amlogic Meson G12B (A311D) SoC board (meson-g12b-a311d-khadas- 
>> vim3) fails to boot with the following logs,
>>
>> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76210200
>>
>> 02:58:27.819: Starting kernel ...
>> 02:58:27.819: "Synchronous Abort" handler, esr 0x96000010, far 0x51000d8
>> 02:58:27.819: "Synchronous Abort" handler, esr 0x96000010, far 0x51000c8
>> 02:58:27.819: elr: 0000000001002a48 lr : 0000000001002c88 (reloc)
>> 02:58:27.819: elr: 00000000f2f26a48 lr : 00000000f2f26c88
>> 02:58:27.819: x0 : 00000000050fffc0 x1 : 0000000001004383
>> 02:58:27.819: x2 : 00000000f2f6a358 x3 : 000000000000003f
>> 02:58:27.819: x4 : 00000000f4fefffc x5 : 0000000000000010
>> 02:58:27.819: x6 : 00000000f4e5b000 x7 : 00000000050fffa0
>> 02:58:27.819: x8 : 0000000000000008 x9 : 0000000000000001
>> 02:58:27.820: x10: 0000000000000010 x11: 0000000000000004
>> 02:58:27.820: x12: 00000000f4fefc00 x13: 0000000000000000
>> 02:58:27.820: x14: 00000000f4fefc00 x15: 0000000000000000
>> 02:58:27.820: x16: 00000000f2f6d0e0 x17: 0000000000c0c0c0
>> 02:58:27.820: x18: 00000000f0f21d90 x19: 00000000050fffc0
>> 02:58:27.820: x20: 0000000000000000 x21: 000000007ffe9000
>> 02:58:27.820: x22: 0000000000001710 x23: 00000000f0f0e8c0
>> 02:58:27.820: x24: 0000000000000000 x25: 0000000000000000
>> 02:58:27.820: x26: 0000000000000000 x27: 0000000000000000
>> 02:58:27.820: x28: 00000000f0f4f790 x29: 00000000050fff60
>> 02:58:27.820: Code: a9025bf5 f9001bf7 f9400641 36000141 (f9408663)
>> 02:58:27.820: Resetting CPU ...
>>
> 
> Could you boot with earlycon enabled to at least have a clue of what's 
> happening ?

There is a synchronous abort right after 'Starting kernel...'. Maybe 
this prevents any early console logs from appearing.

https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76243455

13:54:02.013: => setenv bootargs 'console=ttyAML0,115200n8 root=/dev/nfs 
rw 
nfsroot=192.168.201.1:/var/lib/lava/dispatcher/tmp/18641665/extract-nfsrootfs-h2fjsmdc,tcp,hard,v3 
init=/init rootwait usbcore.quirks=0bda:8153:k earlycon=meson,0xff803000 
keep_bootcon  ip=dhcp'
13:54:02.014: $ booti 0x1080000 - 0x1000000
13:54:02.014: => booti 0x1080000 - 0x1000000
13:54:02.014: Moving Image from 0x1080000 to 0x1200000, end=5160000
13:54:02.014: ## Flattened Device Tree blob at 01000000
13:54:02.014:    Booting using the fdt blob at 0x1000000
13:54:02.014: Working FDT set to 1000000
13:54:02.014: ERROR: reserving fdt memory region failed (addr=5000000 
size=300000 flags=4)
13:54:02.014:    Loading Device Tree to 000000007ffe9000, end 
000000007ffff57c ... OK
13:54:02.014: Working FDT set to 7ffe9000
13:54:02.014: Starting kernel ...
13:54:02.014: "Synchronous Abort" handler, esr 0x96000010, far 0x51000d8
13:54:02.014: "Synchronous Abort" handler, esr 0x96000010, far 0x51000c8
13:54:02.014: elr: 0000000001002a48 lr : 0000000001002c88 (reloc)
13:54:02.014: elr: 00000000f2f26a48 lr : 00000000f2f26c88
13:54:02.014: x0 : 00000000050fffc0 x1 : 0000000001004383
13:54:02.014: x2 : 00000000f2f6a358 x3 : 000000000000003f
13:54:02.014: x4 : 00000000f4fefffc x5 : 0000000000000010
13:54:02.014: x6 : 00000000f4e5b000 x7 : 00000000050fffa0
13:54:02.014: x8 : 0000000000000008 x9 : 0000000000000001
13:54:02.014: x10: 0000000000000010 x11: 0000000000000004
13:54:02.014: x12: 00000000f4fefc00 x13: 0000000000000000
13:54:02.014: x14: 00000000f4fefc00 x15: 0000000000000000
13:54:02.014: x16: 00000000f2f6d0e0 x17: 0000000000c0c0c0
13:54:02.014: x18: 00000000f0f21d90 x19: 00000000050fffc0
13:54:02.014: x20: 0000000000000000 x21: 000000007ffe9000
13:54:02.014: x22: 0000000000001710 x23: 00000000f0f0e8c0
13:54:02.014: x24: 0000000000000000 x25: 0000000000000000
13:54:02.014: x26: 0000000000000000 x27: 0000000000000000
13:54:02.014: x28: 00000000f0f566a0 x29: 00000000050fff60
13:54:02.014: Code: a9025bf5 f9001bf7 f9400641 36000141 (f9408663)
13:54:02.014: Resetting CPU ...

Successful logs with v6.14-rc7,
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76248143

> 
> BPI-M2S (A311D) is booting fine on v6.15-rc, see https://gitlab.com/ 
> amlogic-foss/abcd-linux-test/-/jobs/10004997032
> 
> But perhaps something specific to the VIM3 is breaking, do you change 
> the kernel config for the DRM ?

Yes, we change the config. Please see the config used to build the kernel,
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76243439/artifacts/file/artifacts/testing:arm64_config

Regards,
Vignesh

> 
> Neil
> 
> 
>> The board boots successfully in v6.14-rc7, but the issue appears 
>> starting from v6.15-rc1. These tests were run in drm-ci.
>>
>> On bisecting the kernel, the first bad commit identified by git biscet 
>> is,
>>
>> 59c35416f4246aee66b5f5523fdc950b83325d82 is the first bad commit
>> commit 59c35416f4246aee66b5f5523fdc950b83325d82
>> Merge: 472863ab2aca e988adcb5dee
>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>> Date:   Sat Mar 29 17:23:34 2025 -0700
>>
>>      Merge tag 'clk-for-linus' of git://git.kernel.org/pub/scm/linux/ 
>> kernel/git/clk/linux
>>
>> Please could you look into this issue. Thank you.
>>
>> Regards,
>> Vignesh
> 

