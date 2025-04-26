Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A051322E;
	Sat, 26 Apr 2025 19:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745694023; cv=none; b=kkiq+ADJl0DK9pL4pIOZhoDDUWWAptouDBeYWzdTpzv6AemXhlPvzZ8AV07rs7URi/Jk0dCnxA4yPc5uxBm0ZA2cwHZKoKALTQLlSjlfRS7jcaPnt1NJIVmQo0HaXl9iwv+jFoZDE+9anqHP1F7MmoRHdm0E8rr9HlCHIq3lLdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745694023; c=relaxed/simple;
	bh=oMvo2Q4QvQ6hGBRBFqvcR26R0gurT5fH4zEktGNCcxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rm4qpgLVoUnD2FYkd+RHTCvQTSnHY5hYgt41Lp3ZPIYDZfno6X1zM8H893z+noplzCjrka+XSULP2F6tqL8D/S8tt6nzM8rtyvrX1q9QiwaRO4qjFZalE8A9t01VuoPYUZGxNKq5aGP2Kqd+Gq5wLuzL2QGo62tlywKirWSJDMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7zm4oYl; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7zm4oYl"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so5288534a12.3;
        Sat, 26 Apr 2025 12:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745694019; x=1746298819; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4t0fZTCxirqCF5UUYYChpMmbNwtS0AnPcQA/kqjNxco=;
        b=X7zm4oYlcBfHkzLY8fOaxgWTsU28Ke2bjiqZspNtNPb6OfPmQgcHVpnK3NRE5zOQBO
         wQePS19huRTAmLo/jUtopRL3eT5phOBmJ4c106YqOvunhxK/DsNOYir6HL4wYZhqWd3Z
         4hL/5Jo5766kaahskpMPR3FsjP/B4vVbAZFRyrKdZvzwwTH+TkeGjlUj/7jdm2ftmYPR
         B4PjAANI8LhVFyzUiWYzfJS0bl4Iuic19NhmB7gwR0gafqQh1Fg0lUkWZ608tFCSLzhi
         Hd5LKANv/kgtRfCsZ9Ay4YGn7gQCijioHV2JL1RBPAU5OeFyuoNG54Ik3LMnkZk54B5/
         zPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745694019; x=1746298819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4t0fZTCxirqCF5UUYYChpMmbNwtS0AnPcQA/kqjNxco=;
        b=wGgInGDitnUsrRF2riMX8tdAjg7wkKF61SGpkmKtLsfKZXiZnZIubPVeB29la9chfg
         zg/A3w1Y7+4Dw2q4ZaDDO95j+iEk8/2CifGuFXWENrl9Ao/8VHd0q4B62+sUL2VeO2Uu
         ysM+3xiCs/qO6k0QsuLo5U1WjnGHMVhU/HQdlH0EumrFQ72cdHi+2G/KUhHF9NOtYR84
         NikrIruq0EKbT+ZEDb22TJ+MSv3fNpsYmRRPSlW25W5enCgiP4LeJK81est7lmGXdSNX
         lF7N7XhquA3S5E4SYRocYdyOZr7AbHrY65Af2UnYQEI+1hFMPt8wJ0zy8Mwow8oyGz7G
         QwhA==
X-Forwarded-Encrypted: i=1; AJvYcCV0/eKTHGaCVfniOsSvJKxHD/zRgvfVoq5Mp8TMiZYaY+bniCGmbVLziNz31Lcuj2YDkiQ1O5yFacckefE=@vger.kernel.org, AJvYcCXDDyGwL/O+GOHTo4lB746JTGkC7CXrJe6EyTReYHr0SPf7jr7eFpKvEULcaxesJe39HnR/+FgMlpgMmNg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVRkpja2pq46WLNEsUpMOux0fMR1ZIEGh9DX65OU2V6iLwMGxQ
	HRLqlfMANR1fpAR6Q5Ab2ONoM/wPMLxEBNhtHkSs/kNMLA0M76Wtu87xvQ==
X-Gm-Gg: ASbGncttKBfRC063sSpyY08psiQ2n61XPXYF600KoKMh30BLYPDQdBOfi1BcTYuKy6q
	H5rZk6mudNwz8d6iXeF7d5o4qec5WM6MIidK02RNTav+Kq02eX9PLajmIDFy+5Twf8tC4o0BVMG
	1cZNf//KG9TB0jGDE7Ue2F5jeqANLkfLBYwWgwVno47m/T3KNPWbu5mLdz8HOX4FtWAhnN5SbtQ
	fC0mgk4X8UFAvN9PyF5uoFEVH1PBmOMPcX/v+Cr61+U2xQR/P42/FMDBpYvOc1byeIKDGnQVY6N
	KlubvkpWtU4vI7udNmi1+IqVZ+zeUlxtos2MW0O5R9tchxOhyQ9oFJgALLCPue2GGGXMmCh8KrW
	rZmDC+wYgKrG7BTpEphpMQynmgOdMxg==
X-Google-Smtp-Source: AGHT+IHfARFNZusnhabNQC7PrvKFbebtPFDOLZaVSRXgWq4D3d+eHLPF5gqIAWMivJuv+NoLTBtohQ==
X-Received: by 2002:a17:907:96aa:b0:acb:6472:c444 with SMTP id a640c23a62f3a-ace7116617amr599328566b.32.1745694018207;
        Sat, 26 Apr 2025 12:00:18 -0700 (PDT)
Received: from [192.168.0.10] (ip-37-248-156-10.multi.internet.cyfrowypolsat.pl. [37.248.156.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf9a52sm330099766b.108.2025.04.26.12.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 12:00:17 -0700 (PDT)
Message-ID: <4a47ed4a-c43a-4520-bc68-7c28cf7ee92c@gmail.com>
Date: Sat, 26 Apr 2025 21:00:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Resume from suspend broken in 6.15-rc due to ACP
 changes.
To: Mario Limonciello <mario.limonciello@amd.com>,
 Mark Brown <broonie@kernel.org>, "Mukunda, Vijendar"
 <Vijendar.Mukunda@amd.com>
Cc: regressions@lists.linux.dev, linux-sound@vger.kernel.org,
 venkataprasad.potturu@amd.com, LKML <linux-kernel@vger.kernel.org>
References: <CADDYkjR0JG_JTQeQMAvUJvtb9RxFH6_LzV2Fr_1cnqPTgV_Z8w@mail.gmail.com>
 <99dce57f-8947-4c7a-abeb-2e27afdd0d65@sirena.org.uk>
 <c0c9205d-d1e3-4952-a13e-6d23656880e3@amd.com>
 <1b850037-8361-4c18-a32d-3ca50b69866e@amd.com>
 <691c35de-f054-40a1-98bb-2b602e256011@amd.com>
Content-Language: en-US, pl
From: =?UTF-8?Q?Jacek_=C5=81uczak?= <difrost.kernel@gmail.com>
In-Reply-To: <691c35de-f054-40a1-98bb-2b602e256011@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/23/25 9:27 PM, Mario Limonciello wrote:
> On 4/23/2025 2:12 PM, Mario Limonciello wrote:
>> On 4/23/2025 10:18 AM, Mario Limonciello wrote:
>>> On 4/23/2025 10:06 AM, Mark Brown wrote:
>>>> On Wed, Apr 16, 2025 at 01:20:33PM +0200, Jacek Luczak wrote:
>>>>> Hi,
>>>>>
>>>>> On my ASUS Vivobook S16 (and on similar ASUS HW - see [1]) on resume
>>>>> from suspend system dies (no logs available) soon after GPU completes
>>>>> resume - I can see the login screen, only power cycle left.
>>>>
>>>> Are there any updates on this from the AMD side?  As things stand my
>>>> inclination is to revert the bulk of the changes to the driver from 
>>>> the
>>>> past merge window, I don't really know anything about this hardware
>>>> specifically and "dies without logs" is obviously giving few hints.
>>>> None of the skipped commits looks immediately suspect, there's 
>>>> doubtless
>>>> some unintended change in there.
>>>
>>> This is the first I'm hearing of it; I expect we can dig in and find 
>>> a solution so we don't need to revert that whole series.
>>>
>>> Let me add Vijendar to check if this jumps out to him what went wrong.
>>>
>>> * Can we please see the full dmesg up to the failure?
>>> * journalctl -k -b-1 can fetch everything from the last boot up 
>>> until the freeze.
>>> * Any crash in /var/lib/systemd/pstore by chance?
>>>
>>>>
>>>> Adding Mario and leaving the context for his benefit.
>>>
>>> To double check - can you blacklist the ACP driver and 
>>> suspend/resume and everything is OK?
>>>
>>> If possible can you please capture a report with https:// 
>>> web.git.kernel.org/pub/scm/linux/kernel/git/superm1/amd-debug- 
>>> tools.git/ tree/amd_s2idle.py both in the case of ACP driver 
>>> blacklisted and not blacklisted?  I would like to compare.
>>>
>>> Also; can you put all these artifacts I'm asking for into somewhere 
>>> non ephemeral like a kernel bugzilla?  You can loop me and Vijendar 
>>> into it.
>>
>> FYI - We managed to track an S16 down and can reproduce the issue.
>> It's a NULL pointer deref happening on the resume path.
>>
>> <1>[   74.046372] BUG: kernel NULL pointer dereference, address: 
>> 0000000000000010
>> <1>[   74.046375] #PF: supervisor read access in kernel mode
>> <1>[   74.046377] #PF: error_code(0x0000) - not-present page
>> <6>[   74.046380] PGD 0 P4D 0
>> <4>[   74.046384] Oops: Oops: 0000 [#1] SMP NOPTI
>> <4>[   74.046389] CPU: 4 UID: 0 PID: 2563 Comm: rtcwake Not tainted 
>> 6.15.0-061500rc3-generic #202504202138 PREEMPT(voluntary)
>> Oops#1 Part4
>> <4>[   74.046394] Hardware name: ASUSTeK COMPUTER INC. ASUS Vivobook 
>> S 16 M5606KA_M5606KA/M5606KA, BIOS M5606KA.304 01/24/2025
>> <4>[   74.046396] RIP: 0010:acp70_pcm_resume+0x4f/0xe0 [snd_acp70]
>> <4>[   74.046405] Code: 48 89 45 d0 e8 c2 da 98 fc 49 8b 5d 50 49 39 
>> de 75 18 eb 7b 48 89 da 4c 89 ee 4c 89 ff e8 29 cc f6 ff 48 8b 1b 4c 
>> 39 f3 74 65 <4c> 8b 7b 10 4d 85 ff 74 ef 49 8b 97 c0 00 00 00 48 85 
>> d2 74 e3 8b
>> <4>[   74.046407] RSP: 0018:ffffd12644d13880 EFLAGS: 00010286
>> <4>[   74.046410] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 
>> 0000000000000000
>> <4>[   74.046412] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
>> 0000000000000000
>> <4>[   74.046413] RBP: ffffd12644d138b0 R08: 0000000000000000 R09: 
>> 0000000000000000
>> <4>[   74.046415] R10: 0000000000000000 R11: 0000000000000000 R12: 
>> ffffffffbd774fd0
>> <4>[   74.046416] R13: ffff8a9f13051e00 R14: ffff8a9f13051e50 R15: 
>> 0000000000000010
>> <4>[   74.046418] FS:  0000799af9db9740(0000) 
>> GS:ffff8aa486e9d000(0000) knlGS:0000000000000000
>> <4>[   74.046420] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> <4>[   74.046421] CR2: 0000000000000010 CR3: 000000016dfaa000 CR4: 
>> 0000000000f50ef0
>> <4>[   74.046423] PKRU: 55555554
>> <4>[   74.046425] Call Trace:
>> <4>[   74.046427]  <TASK>
>> <4>[   74.046432]  ? __pfx_platform_pm_resume+0x10/0x10
>> <4>[   74.046439]  platform_pm_resume+0x28/0x60
>> <4>[   74.046443]  dpm_run_callback+0x63/0x160
>> <4>[   74.046447]  device_resume+0x15c/0x260
>> <4>[   74.046450]  dpm_resume+0x15d/0x230
>> <4>[   74.046453]  dpm_resume_end+0x11/0x30
>> <4>[   74.046456]  suspend_devices_and_enter+0x1ea/0x2c0
>> <4>[   74.046460]  enter_state+0x223/0x560
>> Oops#1 Part3
>> <4>[   74.046463]  pm_suspend+0x4e/0x80
>>
>> We'll need some more time to dig into it, but I wanted to share the 
>> trace in case it makes it jump out to anyone what's going on.
>>
>> Just looking at git blame from that function is this perhaps 
>> 8fd0e127d8da856e34391399df40b33af2b307e0?
>
> Reverting a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90 seems to help the 
> issue on S16 here.
>
> Jacek - can you reproduce with that reverted?

I can confirm reverting a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90 on top 
of 6.15-rc3 brings back the resume:

[   58.550863] PM: suspend entry (s2idle)
[   58.571094] Filesystems sync: 0.020 seconds
[   58.695698] Freezing user space processes
[   58.697106] Freezing user space processes completed (elapsed 0.001 
seconds)
[   58.697110] OOM killer disabled.
[   58.697111] Freezing remaining freezable tasks
[   58.698239] Freezing remaining freezable tasks completed (elapsed 
0.001 seconds)
[   58.698242] printk: Suspending console(s) (use no_console_suspend to 
debug)
[   59.312291] queueing ieee80211 work while going to suspend
[   59.435066] ACPI: EC: interrupt blocked
[   86.788898] ACPI: EC: interrupt unblocked
[   86.954661] ACPI: button: The lid device is not compliant to SW_LID.
[   86.960225] [drm] PCIE GART of 512M enabled (table at 
0x0000008001900000).
[   86.960302] amdgpu 0000:63:00.0: amdgpu: SMU is resuming...
[   86.968534] amdgpu 0000:63:00.0: amdgpu: SMU is resumed successfully!
[   87.000143] nvme nvme0: 16/0/0 default/read/poll queues
[   87.336971] amdgpu 0000:63:00.0: amdgpu: ring gfx_0.0.0 uses VM inv 
eng 0 on hub 0
[   87.336978] amdgpu 0000:63:00.0: amdgpu: ring comp_1.0.0 uses VM inv 
eng 1 on hub 0
[   87.336979] amdgpu 0000:63:00.0: amdgpu: ring comp_1.1.0 uses VM inv 
eng 4 on hub 0
[   87.336980] amdgpu 0000:63:00.0: amdgpu: ring comp_1.2.0 uses VM inv 
eng 6 on hub 0
[   87.336981] amdgpu 0000:63:00.0: amdgpu: ring comp_1.3.0 uses VM inv 
eng 7 on hub 0
[   87.336982] amdgpu 0000:63:00.0: amdgpu: ring comp_1.0.1 uses VM inv 
eng 8 on hub 0
[   87.336982] amdgpu 0000:63:00.0: amdgpu: ring comp_1.1.1 uses VM inv 
eng 9 on hub 0
[   87.336983] amdgpu 0000:63:00.0: amdgpu: ring comp_1.2.1 uses VM inv 
eng 10 on hub 0
[   87.336984] amdgpu 0000:63:00.0: amdgpu: ring comp_1.3.1 uses VM inv 
eng 11 on hub 0
[   87.336985] amdgpu 0000:63:00.0: amdgpu: ring sdma0 uses VM inv eng 
12 on hub 0
[   87.336986] amdgpu 0000:63:00.0: amdgpu: ring vcn_unified_0 uses VM 
inv eng 0 on hub 8
[   87.336987] amdgpu 0000:63:00.0: amdgpu: ring jpeg_dec_0 uses VM inv 
eng 1 on hub 8
[   87.336988] amdgpu 0000:63:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM 
inv eng 13 on hub 0
[   87.336989] amdgpu 0000:63:00.0: amdgpu: ring vpe uses VM inv eng 4 
on hub 8
[   87.346719] [drm] ring gfx_32778.1.1 was added
[   87.347302] [drm] ring compute_32778.2.2 was added
[   87.347811] [drm] ring sdma_32778.3.3 was added
[   87.347870] [drm] ring gfx_32778.1.1 ib test pass
[   87.347907] [drm] ring compute_32778.2.2 ib test pass
[   87.347980] [drm] ring sdma_32778.3.3 ib test pass
[   87.353425] acp_mach acp-pdm-mach: 
devm_snd_soc_register_card(acp-pdm-mach) failed: -517
[   87.353543] OOM killer enabled.
[   87.353545] Restarting tasks ... done.
[   87.353954] random: crng reseeded on system resumption
[   87.361409] PM: suspend exit

Cheers,

-Jacek

>
>>
>>>
>>>>
>>>>> I've managed to bisect this as close as possible to following 
>>>>> commits:
>>>>> - [f8b4f3f525e82d78079a6ebbde68e4a0d79fd1c0] ASoC: amd: acp: Refactor
>>>>> acp70 platform resource structure
>>>>> - [c8b5f251f0e53edab220ac4edf444120815fed3c] ASoC: amd: acp: 
>>>>> Remove white line
>>>>> - [a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90] ASoC: amd: acp: Move
>>>>> spin_lock and list initialization to acp-pci driver
>>>>> - [e3933683b25e2cc94485da4909e3338e1a177b39] ASoC: amd: acp: Remove
>>>>> redundant acp_dev_data structure
>>>>> - [aaf7a668bb3814f084f9f6f673567f6aa316632f] ASoC: amd: acp: Add new
>>>>> interrupt handle callbacks in acp_common_hw_ops
>>>>>
>>>>> Attached lspci and bisection log.
>>>>>
>>>>> Regards,
>>>>> -jacek
>>>>>
>>>>> [1] https://bbs.archlinux.org/viewtopic.php?id=304816
>>>>
>>>>> git bisect start
>>>>> # status: waiting for both good and bad commits
>>>>> # good: [ed92bc5264c4357d4fca292c769ea9967cd3d3b6] ASoC: codecs: 
>>>>> wm0010: Fix error handling path in wm0010_spi_probe()
>>>>> git bisect good ed92bc5264c4357d4fca292c769ea9967cd3d3b6
>>>>> # status: waiting for bad commit, 1 good commit known
>>>>> # bad: [47c4f9b1722fd883c9745d7877cb212e41dd2715] Tidy up ASoC 
>>>>> control get and put handlers
>>>>> git bisect bad 47c4f9b1722fd883c9745d7877cb212e41dd2715
>>>>> # good: [74da545ec6a8b41de96b4c350bb59dfe45c0d822] ASoC: codec: 
>>>>> madera: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
>>>>> git bisect good 74da545ec6a8b41de96b4c350bb59dfe45c0d822
>>>>> # bad: [a935b3f981809272d2649ad9c27a751685137846] ASoC: SOF: ipc4- 
>>>>> topology: Allocate ref_params on stack
>>>>> git bisect bad a935b3f981809272d2649ad9c27a751685137846
>>>>> # good: [24056de9976dfc33801d2574c1672d91f840277a] ASoC: codecs: 
>>>>> Update device_id tables for Realtek
>>>>> git bisect good 24056de9976dfc33801d2574c1672d91f840277a
>>>>> # good: [a1462fb8b5dd1018e3477a6861822d75c6a59449] ASoC: Intel: 
>>>>> boards: updates for 6.15
>>>>> git bisect good a1462fb8b5dd1018e3477a6861822d75c6a59449
>>>>> # skip: [8a7e7a03e3c53cd9abbbf233899cc2e05b2c6ec0] ASoC: SOF: 
>>>>> Intel: Add support for ACE3+ mic privacy
>>>>> git bisect skip 8a7e7a03e3c53cd9abbbf233899cc2e05b2c6ec0
>>>>> # skip: [aaf7a668bb3814f084f9f6f673567f6aa316632f] ASoC: amd: acp: 
>>>>> Add new interrupt handle callbacks in acp_common_hw_ops
>>>>> git bisect skip aaf7a668bb3814f084f9f6f673567f6aa316632f
>>>>> # good: [c6141ba0110f98266106699aca071fed025c3d64] ASoC: Merge up 
>>>>> fixes
>>>>> git bisect good c6141ba0110f98266106699aca071fed025c3d64
>>>>> # skip: [ad5a0970f86d82e39ebd06d45a1f7aa48a1316f8] ASoC: cs35l41: 
>>>>> check the return value from spi_setup()
>>>>> git bisect skip ad5a0970f86d82e39ebd06d45a1f7aa48a1316f8
>>>>> # good: [269b844239149a9bbaba66518db99ebb06554a15] ASoC: dapm: Fix 
>>>>> changes to DECLARE_ADAU17X1_DSP_MUX_CTRL
>>>>> git bisect good 269b844239149a9bbaba66518db99ebb06554a15
>>>>> # skip: [89be3c15a58b2ccf31e969223c8ac93ca8932d81] ASoC: qcom: 
>>>>> sm8250: explicitly set format in sm8250_be_hw_params_fixup()
>>>>> git bisect skip 89be3c15a58b2ccf31e969223c8ac93ca8932d81
>>>>> # bad: [02e1cf7a352a3ba5f768849f2b4fcaaaa19f89e3] ASoC: amd: acp: 
>>>>> Fix for enabling DMIC on acp platforms via _DSD entry
>>>>> git bisect bad 02e1cf7a352a3ba5f768849f2b4fcaaaa19f89e3
>>>>> # good: [7a2ff0510c51462c0a979f5006d375a2b23d46e9] ASoC: soc-pcm: 
>>>>> reuse dpcm_state_string()
>>>>> git bisect good 7a2ff0510c51462c0a979f5006d375a2b23d46e9
>>>>> # good: [a8fed0bddf8fa239fc71dc5c035d2e078c597369] ASoC: dt- 
>>>>> bindings: add regulator support to dmic codec
>>>>> git bisect good a8fed0bddf8fa239fc71dc5c035d2e078c597369
>>>>> # bad: [ee7ab0fd540877fceb3d51f87016e6531d86406f] ASoC: amd: acp: 
>>>>> Refactor rembrant platform resource structure
>>>>> git bisect bad ee7ab0fd540877fceb3d51f87016e6531d86406f
>>>>> # good: [0d2d276f53ea3ba1686619cde503d9748f58a834] ASoC: SOF: 
>>>>> Intel: lnl/ptl: Only set dsp_ops which differs from MTL
>>>>> git bisect good 0d2d276f53ea3ba1686619cde503d9748f58a834
>>>>> # good: [8aeb7d2c3fc315e629d252cd601598a5af74bbb0] ASoC: SOF: 
>>>>> Intel: Create ptl.c as placeholder for Panther Lake features
>>>>> git bisect good 8aeb7d2c3fc315e629d252cd601598a5af74bbb0
>>>>> # skip: [ac5b4a24f16f2f56b5cc5092969930b867274edc] ASoC: Intel: 
>>>>> soc- acpi-intel-ptl-match: Add cs42l43 support
>>>>> git bisect skip ac5b4a24f16f2f56b5cc5092969930b867274edc
>>>>> # skip: [8ae746fe51041484e52eba99bed15a444c7d4372] ASoC: amd: acp: 
>>>>> Implement acp_common_hw_ops support for acp platforms
>>>>> git bisect skip 8ae746fe51041484e52eba99bed15a444c7d4372
>>>>> # good: [0978e8207b61ac6d51280e5d28ccfff75d653363] ASoC: SOF: 
>>>>> Intel: hda-mlink: Add support for mic privacy in VS SHIM registers
>>>>> git bisect good 0978e8207b61ac6d51280e5d28ccfff75d653363
>>>>> # good: [4a43c3241ec3465a501825ecaf051e5a1d85a60b] ASoC: SOF: 
>>>>> Intel: ptl: Add support for mic privacy
>>>>> git bisect good 4a43c3241ec3465a501825ecaf051e5a1d85a60b
>>>>> # skip: [1ec3f1dc215d4b3d3679ecdc4a549d4e82b3a609] ASoC: dmic: add 
>>>>> regulator support
>>>>> git bisect skip 1ec3f1dc215d4b3d3679ecdc4a549d4e82b3a609
>>>>> # good: [e2cda461765692757cd5c3b1fc80bd260ffe1394] ASoC: amd: acp: 
>>>>> Refactor dmic-codec platform device creation
>>>>> git bisect good e2cda461765692757cd5c3b1fc80bd260ffe1394
>>>>> # skip: [a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90] ASoC: amd: acp: 
>>>>> Move spin_lock and list initialization to acp-pci driver
>>>>> git bisect skip a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90
>>>>> # bad: [f8b4f3f525e82d78079a6ebbde68e4a0d79fd1c0] ASoC: amd: acp: 
>>>>> Refactor acp70 platform resource structure
>>>>> git bisect bad f8b4f3f525e82d78079a6ebbde68e4a0d79fd1c0
>>>>> # good: [6e60db74b69c29b528c8d10d86108f78f2995dcb] ASoC: amd: acp: 
>>>>> Refactor acp machine select
>>>>> git bisect good 6e60db74b69c29b528c8d10d86108f78f2995dcb
>>>>> # skip: [e3933683b25e2cc94485da4909e3338e1a177b39] ASoC: amd: acp: 
>>>>> Remove redundant acp_dev_data structure
>>>>> git bisect skip e3933683b25e2cc94485da4909e3338e1a177b39
>>>>> # skip: [c8b5f251f0e53edab220ac4edf444120815fed3c] ASoC: amd: acp: 
>>>>> Remove white line
>>>>> git bisect skip c8b5f251f0e53edab220ac4edf444120815fed3c
>>>>> # only skipped commits left to test
>>>>> # possible first bad commit: 
>>>>> [f8b4f3f525e82d78079a6ebbde68e4a0d79fd1c0] ASoC: amd: acp: 
>>>>> Refactor acp70 platform resource structure
>>>>> # possible first bad commit: 
>>>>> [c8b5f251f0e53edab220ac4edf444120815fed3c] ASoC: amd: acp: Remove 
>>>>> white line
>>>>> # possible first bad commit: 
>>>>> [a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90] ASoC: amd: acp: Move 
>>>>> spin_lock and list initialization to acp-pci driver
>>>>> # possible first bad commit: 
>>>>> [e3933683b25e2cc94485da4909e3338e1a177b39] ASoC: amd: acp: Remove 
>>>>> redundant acp_dev_data structure
>>>>> # possible first bad commit: 
>>>>> [aaf7a668bb3814f084f9f6f673567f6aa316632f] ASoC: amd: acp: Add new 
>>>>> interrupt handle callbacks in acp_common_hw_ops
>>>>
>>>>> 00:00.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Strix/ Strix Halo Root Complex [1022:1507]
>>>>> 00:00.2 IOMMU [0806]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Strix/Strix Halo IOMMU [1022:1508]
>>>>> 00:01.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Strix/ Strix Halo Dummy Host Bridge [1022:1509]
>>>>> 00:01.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Strix/ Strix Halo PCIe USB4 Bridge [1022:150a]
>>>>> 00:02.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Strix/ Strix Halo Dummy Host Bridge [1022:1509]
>>>>> 00:02.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Strix/ Strix Halo GPP Bridge [1022:150b]
>>>>> 00:02.3 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Strix/ Strix Halo GPP Bridge [1022:150b]
>>>>> 00:03.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Strix/ Strix Halo Dummy Host Bridge [1022:1509]
>>>>> 00:08.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Strix/ Strix Halo Dummy Host Bridge [1022:1509]
>>>>> 00:08.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Strix/ Strix Halo Internal GPP Bridge to Bus [C:A] [1022:150c]
>>>>> 00:08.2 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Strix/ Strix Halo Internal GPP Bridge to Bus [C:A] [1022:150c]
>>>>> 00:08.3 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Strix/ Strix Halo Internal GPP Bridge to Bus [C:A] [1022:150c]
>>>>> 00:14.0 SMBus [0c05]: Advanced Micro Devices, Inc. [AMD] FCH SMBus 
>>>>> Controller [1022:790b] (rev 71)
>>>>> 00:14.3 ISA bridge [0601]: Advanced Micro Devices, Inc. [AMD] FCH 
>>>>> LPC Bridge [1022:790e] (rev 51)
>>>>> 00:18.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Strix Data Fabric; Function 0 [1022:16f8]
>>>>> 00:18.1 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Strix Data Fabric; Function 1 [1022:16f9]
>>>>> 00:18.2 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Strix Data Fabric; Function 2 [1022:16fa]
>>>>> 00:18.3 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Strix Data Fabric; Function 3 [1022:16fb]
>>>>> 00:18.4 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Strix Data Fabric; Function 4 [1022:16fc]
>>>>> 00:18.5 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Strix Data Fabric; Function 5 [1022:16fd]
>>>>> 00:18.6 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Strix Data Fabric; Function 6 [1022:16fe]
>>>>> 00:18.7 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Strix Data Fabric; Function 7 [1022:16ff]
>>>>> 61:00.0 Non-Volatile memory controller [0108]: Micron Technology 
>>>>> Inc 2400 NVMe SSD (DRAM-less) [1344:5413] (rev 03)
>>>>> 62:00.0 Network controller [0280]: MEDIATEK Corp. MT7922 802.11ax 
>>>>> PCI Express Wireless Network Adapter [14c3:0616]
>>>>> 63:00.0 Display controller [0380]: Advanced Micro Devices, Inc. 
>>>>> [AMD/ ATI] Strix [Radeon 880M / 890M] [1002:150e] (rev c1)
>>>>> 63:00.1 Audio device [0403]: Advanced Micro Devices, Inc. 
>>>>> [AMD/ATI] Rembrandt Radeon High Definition Audio Controller 
>>>>> [1002:1640]
>>>>> 63:00.2 Encryption controller [1080]: Advanced Micro Devices, Inc. 
>>>>> [AMD] Strix/Krackan/Strix Halo CCP/ASP [1022:17e0]
>>>>> 63:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Device [1022:151e]
>>>>> 63:00.5 Multimedia controller [0480]: Advanced Micro Devices, Inc. 
>>>>> [AMD] ACP/ACP3X/ACP6x Audio Coprocessor [1022:15e2] (rev 70)
>>>>> 63:00.6 Audio device [0403]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Family 17h/19h/1ah HD Audio Controller [1022:15e3]
>>>>> 64:00.0 Non-Essential Instrumentation [1300]: Advanced Micro 
>>>>> Devices, Inc. [AMD] Strix/Strix Halo PCIe Dummy Function [1022:150d]
>>>>> 64:00.1 Signal processing controller [1180]: Advanced Micro 
>>>>> Devices, Inc. [AMD] Strix/Krackan/Strix Halo Neural Processing 
>>>>> Unit [1022:17f0] (rev 10)
>>>>> 65:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Device [1022:151f]
>>>>> 65:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Device [1022:151a]
>>>>> 65:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Device [1022:151b]
>>>>> 65:00.5 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 
>>>>> Device [1022:151c]
>>>
>>
>
