Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C451FC7E7
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215387; cv=none; b=PgAi3Uml0sTuU3JYdzFB8CZEwETDJ5iPruq/aJXouf1gHQN+NJW+gOQta4ZmJItz32SZrMc/oM9O60PJPpOY6CBzrlyToz8Wqe78zBOELoRfZW3AwoGzCNs23+jUF4P/t0v3ZetBFU/ShRHHhcrhysyPOrrPdMKB7aiMP01kXYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215387; c=relaxed/simple;
	bh=WsUpKh0jFlrZUEdFtK5gAGnp8UK4rihuv//4tsWo8+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fWzKBHP6T7Qw6cQICQ4e7Z+us9MWLY1tV8YS1hYlBda/BIiMBvHOQqZZTmIEMwuZms2jOLccrwo547cLGs5jSQzAxyijuBeqGUX7P4tBCnu5mOGQ0BPz/MhCTyafdoSziW2tdYW7Srmk0afwpVQcEjPD/m0M3+9pax4OEi1tyCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Y+DhdTS7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Y+DhdTS7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747215383;
	bh=WsUpKh0jFlrZUEdFtK5gAGnp8UK4rihuv//4tsWo8+E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y+DhdTS7jNVGBQdcWzrHJFILvdLIT88gTy9Y7Kr9NjX19jFsK//8u8vF2KMP+sKCF
	 FZHaAYkbI8xz0EsyhGMVNIGT9HREydFlytz5zLkRZgPHv9Lv+cEh5/nk9D/PVofPoQ
	 H3C7Y3xzLHN/aGkDJWnZregDakcXEEM5YYkn9c+NemU/EXH89evC4Ix831WWMl4Snd
	 vohUZeDwtdIW6nJYW5bGwuaRznwQtdgoP7d9bfoGd5tMMtPLDTfAe5woZPL9qpAp8l
	 vt39pFLpaABDAlvDWQhJ4CM8gnlckrJWXHZxgOoNdfqNHKMsW7ey5EnY6kxhMzUz4o
	 2YAfyU/A5Y5Yg==
Received: from [192.168.50.250] (unknown [171.76.80.110])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9BD9B17E120C;
	Wed, 14 May 2025 11:36:21 +0200 (CEST)
Message-ID: <ffe67dc5-f694-4780-83c3-7d671dfc4a4f@collabora.com>
Date: Wed, 14 May 2025 15:06:18 +0530
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
 <714a719a-9e56-4158-a8ce-118b7ddb97b3@collabora.com>
 <919fa7f1-d198-429b-8f31-70f085a4c79f@linaro.org>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <919fa7f1-d198-429b-8f31-70f085a4c79f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Neil,

On 13/05/25 21:25, Neil Armstrong wrote:
> On 13/05/2025 16:26, Vignesh Raman wrote:
>> Hi Neil,
>>
>> On 13/05/25 15:25, neil.armstrong@linaro.org wrote:
>>> Hi,
>>>
>>> On 13/05/2025 11:41, Vignesh Raman wrote:
>>>> Hi,
>>>>
>>>> The Amlogic Meson G12B (A311D) SoC board (meson-g12b-a311d-khadas- 
>>>> vim3) fails to boot with the following logs,
>>>>
>>>> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76210200
>>>>
>>>> 02:58:27.819: Starting kernel ...
>>>> 02:58:27.819: "Synchronous Abort" handler, esr 0x96000010, far 
>>>> 0x51000d8
>>>> 02:58:27.819: "Synchronous Abort" handler, esr 0x96000010, far 
>>>> 0x51000c8
>>>> 02:58:27.819: elr: 0000000001002a48 lr : 0000000001002c88 (reloc)
>>>> 02:58:27.819: elr: 00000000f2f26a48 lr : 00000000f2f26c88
>>>> 02:58:27.819: x0 : 00000000050fffc0 x1 : 0000000001004383
>>>> 02:58:27.819: x2 : 00000000f2f6a358 x3 : 000000000000003f
>>>> 02:58:27.819: x4 : 00000000f4fefffc x5 : 0000000000000010
>>>> 02:58:27.819: x6 : 00000000f4e5b000 x7 : 00000000050fffa0
>>>> 02:58:27.819: x8 : 0000000000000008 x9 : 0000000000000001
>>>> 02:58:27.820: x10: 0000000000000010 x11: 0000000000000004
>>>> 02:58:27.820: x12: 00000000f4fefc00 x13: 0000000000000000
>>>> 02:58:27.820: x14: 00000000f4fefc00 x15: 0000000000000000
>>>> 02:58:27.820: x16: 00000000f2f6d0e0 x17: 0000000000c0c0c0
>>>> 02:58:27.820: x18: 00000000f0f21d90 x19: 00000000050fffc0
>>>> 02:58:27.820: x20: 0000000000000000 x21: 000000007ffe9000
>>>> 02:58:27.820: x22: 0000000000001710 x23: 00000000f0f0e8c0
>>>> 02:58:27.820: x24: 0000000000000000 x25: 0000000000000000
>>>> 02:58:27.820: x26: 0000000000000000 x27: 0000000000000000
>>>> 02:58:27.820: x28: 00000000f0f4f790 x29: 00000000050fff60
>>>> 02:58:27.820: Code: a9025bf5 f9001bf7 f9400641 36000141 (f9408663)
>>>> 02:58:27.820: Resetting CPU ...
>>>>
>>>
>>> Could you boot with earlycon enabled to at least have a clue of 
>>> what's happening ?
>>
>> There is a synchronous abort right after 'Starting kernel...'. Maybe 
>> this prevents any early console logs from appearing.
>>
>> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76243455
>>
>> 13:54:02.013: => setenv bootargs 'console=ttyAML0,115200n8 root=/dev/ 
>> nfs rw nfsroot=192.168.201.1:/var/lib/lava/dispatcher/tmp/18641665/ 
>> extract-nfsrootfs-h2fjsmdc,tcp,hard,v3 init=/init rootwait 
>> usbcore.quirks=0bda:8153:k earlycon=meson,0xff803000 keep_bootcon  
>> ip=dhcp'
>> 13:54:02.014: $ booti 0x1080000 - 0x1000000
>> 13:54:02.014: => booti 0x1080000 - 0x1000000
>> 13:54:02.014: Moving Image from 0x1080000 to 0x1200000, end=5160000
>> 13:54:02.014: ## Flattened Device Tree blob at 01000000
>> 13:54:02.014:    Booting using the fdt blob at 0x1000000
>> 13:54:02.014: Working FDT set to 1000000
>> 13:54:02.014: ERROR: reserving fdt memory region failed (addr=5000000 
>> size=300000 flags=4)
>> 13:54:02.014:    Loading Device Tree to 000000007ffe9000, end 
>> 000000007ffff57c ... OK
>> 13:54:02.014: Working FDT set to 7ffe9000
>> 13:54:02.014: Starting kernel ...
>> 13:54:02.014: "Synchronous Abort" handler, esr 0x96000010, far 0x51000d8
>> 13:54:02.014: "Synchronous Abort" handler, esr 0x96000010, far 0x51000c8
>> 13:54:02.014: elr: 0000000001002a48 lr : 0000000001002c88 (reloc)
>> 13:54:02.014: elr: 00000000f2f26a48 lr : 00000000f2f26c88
>> 13:54:02.014: x0 : 00000000050fffc0 x1 : 0000000001004383
>> 13:54:02.014: x2 : 00000000f2f6a358 x3 : 000000000000003f
>> 13:54:02.014: x4 : 00000000f4fefffc x5 : 0000000000000010
>> 13:54:02.014: x6 : 00000000f4e5b000 x7 : 00000000050fffa0
>> 13:54:02.014: x8 : 0000000000000008 x9 : 0000000000000001
>> 13:54:02.014: x10: 0000000000000010 x11: 0000000000000004
>> 13:54:02.014: x12: 00000000f4fefc00 x13: 0000000000000000
>> 13:54:02.014: x14: 00000000f4fefc00 x15: 0000000000000000
>> 13:54:02.014: x16: 00000000f2f6d0e0 x17: 0000000000c0c0c0
>> 13:54:02.014: x18: 00000000f0f21d90 x19: 00000000050fffc0
>> 13:54:02.014: x20: 0000000000000000 x21: 000000007ffe9000
>> 13:54:02.014: x22: 0000000000001710 x23: 00000000f0f0e8c0
>> 13:54:02.014: x24: 0000000000000000 x25: 0000000000000000
>> 13:54:02.014: x26: 0000000000000000 x27: 0000000000000000
>> 13:54:02.014: x28: 00000000f0f566a0 x29: 00000000050fff60
>> 13:54:02.014: Code: a9025bf5 f9001bf7 f9400641 36000141 (f9408663)
>> 13:54:02.014: Resetting CPU ...
> 
> In fact, this is an U-boot fault, not Linux. I guess perhaps the Linux 
> kernel is too big, can you check the size difference since v6.14 ?

Yes, looks like the kernel image size causes this issue. I disabled a 
few configs in drm-ci, and the kernel image size was around 49M. It 
booted fine with v6.15-rc1.

In previous tests, v6.14-rc7 kernel image size was 52M, and v6.15-rc1 
kernel image size was 53M.

Thanks for the pointers.

Regards,
Vignesh

> 
>>
>> Successful logs with v6.14-rc7,
>> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76248143
>>
>>>
>>> BPI-M2S (A311D) is booting fine on v6.15-rc, see https://gitlab.com/ 
>>> amlogic-foss/abcd-linux-test/-/jobs/10004997032
>>>
>>> But perhaps something specific to the VIM3 is breaking, do you change 
>>> the kernel config for the DRM ?
>>
>> Yes, we change the config. Please see the config used to build the 
>> kernel,
>> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76243439/ 
>> artifacts/file/artifacts/testing:arm64_config
>>
>> Regards,
>> Vignesh
>>
>>>
>>> Neil
>>>
>>>
>>>> The board boots successfully in v6.14-rc7, but the issue appears 
>>>> starting from v6.15-rc1. These tests were run in drm-ci.
>>>>
>>>> On bisecting the kernel, the first bad commit identified by git 
>>>> biscet is,
>>>>
>>>> 59c35416f4246aee66b5f5523fdc950b83325d82 is the first bad commit
>>>> commit 59c35416f4246aee66b5f5523fdc950b83325d82
>>>> Merge: 472863ab2aca e988adcb5dee
>>>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>>>> Date:   Sat Mar 29 17:23:34 2025 -0700
>>>>
>>>>      Merge tag 'clk-for-linus' of git://git.kernel.org/pub/scm/ 
>>>> linux/ kernel/git/clk/linux
>>>>
>>>> Please could you look into this issue. Thank you.
>>>>
>>>> Regards,
>>>> Vignesh
>>>
>>
> 

