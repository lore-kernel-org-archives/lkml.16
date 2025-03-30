Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103F979D2;
	Sun, 30 Mar 2025 06:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743317240; cv=none; b=gVAiM4IVZ2/PAZ806OEtjdPuT+EffCcgdJSSHoWsoihc9D6b5izP6/jvW+YwFpsJh1MTz/FmGHtRp81ivETVsDAnwwx1unycJZBb7W6BCzQiZiXRC3KriMYYLyK9VuyWe0EZYAaagIEJB5fhxPhuXSx1bBqACskr8+SaH4LnvMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743317240; c=relaxed/simple;
	bh=sTckKZ3h8outMG4sJb0/XbE0wZd7TuU1I0LLZSTHt/Y=;
	h=Content-Type:Mime-Version:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=sJ/KKdr31yd5f7oW17IowXSutRfNrrp5VdzNsGIKELeKQBH/r01UBKdbEgkBp8p3V2RMij77xd6x5RcbPppdEEVMC5nj2UOQcqjQIXHolg+hU6jfXZ3cHQbK4AO/FGk96hxyJ3uke11LBJtUqTZbxnxE2JUj5gUuwqTNSCaIrZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8q8yhWI; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8q8yhWI"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3014678689aso4926283a91.0;
        Sat, 29 Mar 2025 23:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743317235; x=1743922035; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=22y4giyu9s3lISJspN+oUPcidv79Ve4vDL2m69ZCJgk=;
        b=F8q8yhWImwEiCxrVKw9q92rb/UCLwIvjocNZsPrMfx9h0TE1tk91XBQbOMCgFrLpIZ
         JaHhZAHvTSzYsCXMwSszEmkvD8HUJ4O1nmlUbFsL+SGavV1kTFRe399evJTiuwxiDWSF
         nlcBPlqr54Z8dlb0JGp2+yMhmYgSTuDI6jegcYQzszTiDGKzcaVG/jbKAcy4UkPH1/Iv
         rWgysWUkhwmdZqAbVubIb/ciEVCd8a5IW3dakLuKbXNlCs1Rdit1jGsGrtdhbWZ4JtqH
         AqWZhJjn37RPeVDId0bpomV9/aMHCu/rxk6NSbywrxdBNT6qbuQr858jgCv8PeA6JshG
         +v5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743317235; x=1743922035;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=22y4giyu9s3lISJspN+oUPcidv79Ve4vDL2m69ZCJgk=;
        b=aC7U9g4jd8psuUe6SWcailB6d7BYEQfzjjy7wN2C4nmxa1RrqDIQNnsiwzoITUENEq
         Sql55+5ro6Lea9Qex9M30YsmRg/mNgM6mIpf4eNprxc1hxIuclzbTcAKtH3L8FTSZKGQ
         /eS/cKLsv43GTSknhi12ek0I0AaN+Otgga+JP1lynIQTDEnsKaG16yWFmmqZpifmgBFS
         VYlWf8vP12mKBaEr05JCF7FLI2fe7f9svyT0hxxrZy+Km7bmuJanKLPqdfDBq2svzyr1
         4Zk+m92GbkjLPrZDe+XebIMo6JgX1FWgz5uq0gLk7I9xshPeLL3PfYaYpqklgE9rrLFh
         WYFA==
X-Forwarded-Encrypted: i=1; AJvYcCWxf9fOI0LHT22RcFLgyTGQvycNP1wEkQ1mEOwAP6RElst2VRN1ArXDtsTRuTmZF0ZgvlkjTr53V8WaOAM=@vger.kernel.org, AJvYcCXuiN0Nsvy0MP8oYlUDrRiFNGtXdHBEzkFO5iC59QzQjkkAFuvMqZ+EuA4rjQoau6fuy4LDAvZ/la7ZM9eQU3XERehctA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdq+uUNLs0fMPGooB7X77pl2/5AX6JePgwB9MxqihJP9UOBLr3
	ilvA+bMz6uKlhrez7GqLjBjwTjbxPXEQrOq+G3xSeODyblBlUYKe
X-Gm-Gg: ASbGncstjM5kISiffA7MkG3hd8n26gedi7W97nEJOoS2YZNxhH+OvZ7QEmJPWqV9F9E
	NeV70vrxQfYSkiZwQ6Zwn0otcgECntipXW2e1tm5EH491B2+E7zlRf1QyoaqiKHGr5dngpnRIoV
	QaUs04FJ9GlDfYJs44VRdbcgvncL8AqRTiOTaxFHZDFVS/TfCXolcxyMxu7opcNSU0uTuJAg7so
	HOk6o4Sky5ylryAu94Lu+e9wZHOstWZcoyBueObJuCh4NkRNUD5+qhfIgfFNJGlxf6HTqCe683L
	jsCsiADUjyz6OWcDbQQNVlw09vv4MqLS/MuSAg==
X-Google-Smtp-Source: AGHT+IHdbR8qBUKxeCUR8zbDcxkSHJkWwnQXNaSwR77I/0FWFmpZHAGhKKAqgUKiBzgBx+OTG2VGww==
X-Received: by 2002:a17:90b:1f8d:b0:2ff:64a0:4a57 with SMTP id 98e67ed59e1d1-3053214bce7mr6580890a91.26.1743317235114;
        Sat, 29 Mar 2025 23:47:15 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30516d3e640sm4853716a91.10.2025.03.29.23.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Mar 2025 23:47:14 -0700 (PDT)
Content-Type: multipart/mixed;
 boundary=fd80139cf565fe2f9a40a130f3c71afbf8d96a4329d8b97e6ad13ecda252
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Sun, 30 Mar 2025 03:47:11 -0300
Message-Id: <D8TEDS91VAGU.1UVZWWWWMRRNG@gmail.com>
To: "Damian Tometzki" <damian@riscv-rocks.de>
Cc: <hmh@hmh.eng.br>, <ibm-acpi-devel@lists.sourceforge.net>,
 <platform-driver-x86@vger.kernel.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>
Subject: Re: Kernel Null Pointer Dereference on Fedora with thinkpad_acpi
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <CAL=B37kdL1orSQZD2A3skDOevRXBzF__cJJgY_GFh9LZO3FMsw@mail.gmail.com> <D8TDEP8ZEYE6.24AVWSGXURB4I@gmail.com> <CAL=B37ko7Zyr6gJxYTvsFKsfXKNTPw80UvjNgbQ+B6EZ9GGfaw@mail.gmail.com>
In-Reply-To: <CAL=B37ko7Zyr6gJxYTvsFKsfXKNTPw80UvjNgbQ+B6EZ9GGfaw@mail.gmail.com>

--fd80139cf565fe2f9a40a130f3c71afbf8d96a4329d8b97e6ad13ecda252
Content-Type: multipart/alternative;
 boundary=f60a597f5abb5ceccc8775c625348678a0f9b300e4ced9c6612a91eaee34

--f60a597f5abb5ceccc8775c625348678a0f9b300e4ced9c6612a91eaee34
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Content-Type: text/plain; charset=UTF-8

On Sun Mar 30, 2025 at 3:28 AM -03, Damian Tometzki wrote:
> On Sun, Mar 30, 2025 at 8:01=E2=80=AFAM Kurt Borja <kuurtb@gmail.com> wro=
te:
>>
>> Hi Damian,
>>
>> On Sun Mar 30, 2025 at 2:19 AM -03, Damian Tometzki wrote:
>> > Hi together,
>> >
>> > I encountered a kernel crash on a Lenovo ThinkPad (BIOS N32ET95W 1.71)
>> > running Fedora with kernel 6.15 (merge window) 7f2ff7b62617. The issue
>> > is a NULL pointer dereference during initialization of the
>> > thinkpad_acpi module. The crash occurs in kobject_get() while handling
>> > RFKill device registration (tpacpi_new_rfkill =E2=86=92 rfkill_registe=
r =E2=86=92
>> > device_add).
>> > With kernel 6.14 system boot=C2=B4s fine
>> >
>> > Let me know if further logs or debugging info are needed. Below the sh=
ort dump
>> >
>> > Mar 29 17:43:16.173712 fedora kernel: thinkpad_acpi: Disabling
>> > thinkpad-acpi brightness events by default...
>> > Mar 29 17:43:16.175636 fedora kernel: ACPI: bus type thunderbolt regis=
tered
>> > Mar 29 17:43:16.179626 fedora kernel: BUG: kernel NULL pointer
>> > dereference, address: 000000000000004c
>> > Mar 29 17:43:16.179689 fedora kernel: #PF: supervisor read access in k=
ernel mode
>> > Mar 29 17:43:16.180235 fedora kernel: #PF: error_code(0x0000) - not-pr=
esent page
>> > Mar 29 17:43:16.180290 fedora kernel: PGD 0 P4D 0
>> > Mar 29 17:43:16.180325 fedora kernel: Oops: Oops: 0000 [#1] SMP NOPTI
>> > Mar 29 17:43:16.180340 fedora kernel: CPU: 6 UID: 0 PID: 1015 Comm:
>> > (udev-worker) Not tainted 6.14.0 #355 PREEMPT(lazy)
>> > Mar 29 17:43:16.180449 fedora kernel: Hardware name: LENOVO
>> > 20XWCTO1WW/20XWCTO1WW, BIOS N32ET95W (1.71 ) 10/24/2024
>> > Mar 29 17:43:16.180469 fedora kernel: RIP: 0010:kobject_get+0xd/0x70
>> > Mar 29 17:43:16.180491 fedora kernel: Code: 66 66 2e 0f 1f 84 00 00 00
>> > 00 00 66 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e
>> > fa 53 48 89 fb 48 85 ff 74 1f <f6> 47 3c 01 74 22 48 8d 7b 38 b8 01
>> > 00>
>> > Mar 29 17:43:16.180506 fedora kernel: RSP: 0018:ffffd3d200b5f750
>> > EFLAGS: 00010202
>> > Mar 29 17:43:16.180523 fedora kernel: RAX: ffff8ebbc10fac00 RBX:
>> > 0000000000000010 RCX: 0000000000000000
>> > Mar 29 17:43:16.180534 fedora kernel: RDX: 0000000000000000 RSI:
>> > ffffffff9aebafa0 RDI: 0000000000000010
>> > Mar 29 17:43:16.180547 fedora kernel: RBP: ffff8ebbd49f4b88 R08:
>> > 0000000000000100 R09: 0000000000000000
>> > Mar 29 17:43:16.180559 fedora kernel: R10: ffffd3d200b5f760 R11:
>> > 0000000000000008 R12: 0000000000000010
>> > Mar 29 17:43:16.180573 fedora kernel: R13: ffff8ebbc8b12388 R14:
>> > ffffffffc14a7500 R15: 0000000000000000
>> > Mar 29 17:43:16.180587 fedora kernel: FS:  00007f1aa7c15040(0000)
>> > GS:ffff8ebf72546000(0000) knlGS:0000000000000000
>> > Mar 29 17:43:16.180606 fedora kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
>> > 0000000080050033
>> > Mar 29 17:43:16.180630 fedora kernel: CR2: 000000000000004c CR3:
>> > 0000000113948001 CR4: 0000000000f70ef0
>> > Mar 29 17:43:16.180642 fedora kernel: PKRU: 55555554
>> > Mar 29 17:43:16.180654 fedora kernel: Call Trace:
>> > Mar 29 17:43:16.180664 fedora kernel:  <TASK>
>> > Mar 29 17:43:16.180676 fedora kernel:  ? show_trace_log_lvl+0x1d2/0x2f=
0
>> > Mar 29 17:43:16.180688 fedora kernel:  ? show_trace_log_lvl+0x1d2/0x2f=
0
>> > Mar 29 17:43:16.180704 fedora kernel:  ? show_trace_log_lvl+0x1d2/0x2f=
0
>> > Mar 29 17:43:16.180712 fedora kernel:  ? device_add+0x8f/0x6e0
>> > Mar 29 17:43:16.180724 fedora kernel:  ? __die_body.cold+0x8/0x12
>> > Mar 29 17:43:16.180739 fedora kernel:  ? page_fault_oops+0x146/0x180
>> > Mar 29 17:43:16.180748 fedora kernel:  ? exc_page_fault+0x7e/0x1a0
>> > Mar 29 17:43:16.180758 fedora kernel:  ? asm_exc_page_fault+0x26/0x30
>> > Mar 29 17:43:16.180769 fedora kernel:  ? __pfx_klist_children_get+0x10=
/0x10
>> > Mar 29 17:43:16.180781 fedora kernel:  ? kobject_get+0xd/0x70
>> > Mar 29 17:43:16.180792 fedora kernel:  device_add+0x8f/0x6e0
>> > Mar 29 17:43:16.180804 fedora kernel:  rfkill_register+0xbc/0x2c0 [rfk=
ill]
>> > Mar 29 17:43:16.180813 fedora kernel:  tpacpi_new_rfkill+0x185/0x230
>> > [thinkpad_acpi]
>> > Mar 29 17:43:16.180826 fedora kernel:  ibm_init+0x66/0x2a0 [thinkpad_a=
cpi]
>> > Mar 29 17:43:16.180840 fedora kernel:
>> > tpacpi_pdriver_probe+0x160/0x250 [thinkpad_acpi]
>> > Mar 29 17:43:16.180852 fedora kernel:  platform_probe+0x41/0xa0
>> > Mar 29 17:43:16.180887 fedora kernel:  really_probe+0xdb/0x340
>> > Mar 29 17:43:16.180900 fedora kernel:  ? pm_runtime_barrier+0x55/0x90
>> > Mar 29 17:43:16.180912 fedora kernel:  ? __pfx___driver_attach+0x10/0x=
10
>> > Mar 29 17:43:16.180920 fedora kernel:  __driver_probe_device+0x78/0x14=
0
>> > Mar 29 17:43:16.180932 fedora kernel:  driver_probe_device+0x1f/0xa0
>> > Mar 29 17:43:16.180942 fedora kernel:  __driver_attach+0xb8/0x1d0
>> > Mar 29 17:43:16.180954 fedora kernel:  bus_for_each_dev+0x82/0xd0
>> > Mar 29 17:43:16.180966 fedora kernel:  bus_add_driver+0x12f/0x210
>> > Mar 29 17:43:16.180976 fedora kernel:  driver_register+0x72/0xd0
>> > Mar 29 17:43:16.180988 fedora kernel:  __platform_driver_probe+0x45/0x=
90
>> > Mar 29 17:43:16.180999 fedora kernel:  __platform_create_bundle+0xe7/0=
x100
>> > Mar 29 17:43:16.181011 fedora kernel:  ?
>> > __pfx_tpacpi_pdriver_probe+0x10/0x10 [thinkpad_acpi]
>> > Mar 29 17:43:16.181025 fedora kernel:  ?
>> > __pfx_thinkpad_acpi_module_init+0x10/0x10 [thinkpad_acpi]
>> > Mar 29 17:43:16.181035 fedora kernel:
>> > thinkpad_acpi_module_init+0x37e/0x430 [thinkpad_acpi]
>> > Mar 29 17:43:16.181045 fedora kernel:  do_one_initcall+0x58/0x300
>> > Mar 29 17:43:16.181053 fedora kernel:  do_init_module+0x82/0x240
>> > Mar 29 17:43:16.181065 fedora kernel:  init_module_from_file+0x8b/0xe0
>> > Mar 29 17:43:16.181073 fedora kernel:  idempotent_init_module+0x113/0x=
310
>> > Mar 29 17:43:16.181083 fedora kernel:  __x64_sys_finit_module+0x67/0xc=
0
>> > Mar 29 17:43:16.181093 fedora kernel:  do_syscall_64+0x7f/0x170
>> > Mar 29 17:43:16.181103 fedora kernel:  ? syscall_exit_to_user_mode+0x1=
d5/0x210
>> > Mar 29 17:43:16.181112 fedora kernel:  ? do_syscall_64+0x8c/0x170
>> > Mar 29 17:43:16.181124 fedora kernel:  ?
>> > syscall_exit_to_user_mode_prepare+0x14a/0x180
>> > Mar 29 17:43:16.181135 fedora kernel:  ? syscall_exit_to_user_mode+0x1=
0/0x210
>> > Mar 29 17:43:16.181144 fedora kernel:  ? do_syscall_64+0x8c/0x170
>> > Mar 29 17:43:16.181152 fedora kernel:  ?
>> > syscall_exit_to_user_mode_prepare+0x14a/0x180
>> > Mar 29 17:43:16.181163 fedora kernel:  ? syscall_exit_to_user_mode+0x1=
0/0x210
>> > Mar 29 17:43:16.181173 fedora kernel:  ? do_syscall_64+0x8c/0x170
>> > Mar 29 17:43:16.181182 fedora kernel:  ? seq_read_iter+0x20e/0x480
>> > Mar 29 17:43:16.181198 fedora kernel:  ? vfs_read+0x29b/0x370
>> > Mar 29 17:43:16.181217 fedora kernel:  ? __seccomp_filter+0x41/0x4e0
>> > Mar 29 17:43:16.181233 fedora kernel:  ?
>> > syscall_exit_to_user_mode_prepare+0x14a/0x180
>> > Mar 29 17:43:16.181250 fedora kernel:  ? syscall_exit_to_user_mode+0x1=
0/0x210
>> > Mar 29 17:43:16.181264 fedora kernel:  ? do_syscall_64+0x8c/0x170
>> > Mar 29 17:43:16.181280 fedora kernel:  ? do_syscall_64+0x8c/0x170
>> > Mar 29 17:43:16.181292 fedora kernel:  ?
>> > syscall_exit_to_user_mode_prepare+0x14a/0x180
>> > Mar 29 17:43:16.181316 fedora kernel:  ? syscall_exit_to_user_mode+0x1=
0/0x210
>> > Mar 29 17:43:16.181331 fedora kernel:  ? clear_bhb_loop+0x35/0x90
>> > Mar 29 17:43:16.181341 fedora kernel:  ? clear_bhb_loop+0x35/0x90
>> > Mar 29 17:43:16.181351 fedora kernel:  ? clear_bhb_loop+0x35/0x90
>> > Mar 29 17:43:16.181360 fedora kernel:  entry_SYSCALL_64_after_hwframe+=
0x76/0x7e
>> > Mar 29 17:43:16.181372 fedora kernel: RIP: 0033:0x7f1aa84c5a8d
>> > Mar 29 17:43:16.181381 fedora kernel: Code: ff c3 66 2e 0f 1f 84 00 00
>> > 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2
>> > 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d
>> > 4b>
>> > Mar 29 17:43:16.181392 fedora kernel: RSP: 002b:00007ffe5ca79bc8
>> > EFLAGS: 00000246 ORIG_RAX: 0000000000000139
>> > Mar 29 17:43:16.181406 fedora kernel: RAX: ffffffffffffffda RBX:
>> > 00005610a8c7deb0 RCX: 00007f1aa84c5a8d
>> > Mar 29 17:43:16.181419 fedora kernel: RDX: 0000000000000000 RSI:
>> > 00007f1aa7b88965 RDI: 0000000000000032
>> > Mar 29 17:43:16.181431 fedora kernel: RBP: 00007ffe5ca79c80 R08:
>> > 0000000000000000 R09: 00007ffe5ca79c30
>> > Mar 29 17:43:16.181441 fedora kernel: R10: 0000000000000000 R11:
>> > 0000000000000246 R12: 0000000000020000
>> > Mar 29 17:43:16.181448 fedora kernel: R13: 00005610a8c7f880 R14:
>> > 00007f1aa7b88965 R15: 0000000000000000
>> > Mar 29 17:43:16.181458 fedora kernel:  </TASK>
>> > Mar 29 17:43:16.181472 fedora kernel: Modules linked in: cfg80211(+)
>> > thunderbolt(+) thinkpad_acpi(+) igen6_edac intel_soc_dts_iosf
>> > platform_profile snd soundcore int3403_thermal int340x_thermal_zone
>> > soc_button_>
>> > Mar 29 17:43:16.181784 fedora kernel: CR2: 000000000000004c
>> > Mar 29 17:43:16.181806 fedora kernel: ---[ end trace 0000000000000000 =
]---
>> >
>> > Best regards
>> > Damian
>>
>> Hmmm - I have a feeling about this one.
>>
>> Can you apply and test the attached proposed patch? If you do please
>> verify if the problem persist and if the driver has all the features
>> present before the regression.
>>
>> If everything goes nicely, feel free to add a Tested-by: tag for when I
>> submit this.
>>
>> --
>>  ~ Kurt
>
> Hi Kurt,
>
> many thnaks for the fast response.
> With this patch my system boot again but i have other dump in dmesg

Oh, makes sense. It's the same problem but it was hidden because of the
previous one.

The attached patch should fix it.

--=20
 ~ Kurt

--f60a597f5abb5ceccc8775c625348678a0f9b300e4ced9c6612a91eaee34--

--fd80139cf565fe2f9a40a130f3c71afbf8d96a4329d8b97e6ad13ecda252
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename=0001-platform-x86-thinkpad_acpi-Fix-rfkill-null-pointer-d.patch
Content-Type: text/x-patch; charset=utf-8;
 name=0001-platform-x86-thinkpad_acpi-Fix-rfkill-null-pointer-d.patch

RnJvbSA0Y2Q1Mzg2NzU4MGQ4NTEyOGVmODFiZDA3NmU0MjNmYWY0MDY5MDc2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLdXJ0IEJvcmphIDxrdXVydGJAZ21haWwuY29tPgpEYXRlOiBT
dW4sIDMwIE1hciAyMDI1IDAyOjUzOjI2IC0wMzAwClN1YmplY3Q6IFtQQVRDSF0gcGxhdGZvcm0v
eDg2OiB0aGlua3BhZF9hY3BpOiBGaXggcmZraWxsIG51bGwgcG9pbnRlciBkZXJlZgoKU2lnbmVk
LW9mZi1ieTogS3VydCBCb3JqYSA8a3V1cnRiQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3BsYXRm
b3JtL3g4Ni90aGlua3BhZF9hY3BpLmMgfCAyNCArKysrKysrKysrKysrKysrLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L3RoaW5rcGFkX2FjcGkuYyBiL2RyaXZlcnMvcGxhdGZv
cm0veDg2L3RoaW5rcGFkX2FjcGkuYwppbmRleCAwMzg0Y2YzMTE4NzguLmExN2VmYjY4NjY0YyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvdGhpbmtwYWRfYWNwaS5jCisrKyBiL2Ry
aXZlcnMvcGxhdGZvcm0veDg2L3RoaW5rcGFkX2FjcGkuYwpAQCAtMzY3LDYgKzM2Nyw3IEBAIHN0
YXRpYyBzdHJ1Y3QgewogCXUzMiBiZWVwX25lZWRzX3R3b19hcmdzOjE7CiAJdTMyIG1peGVyX25v
X2xldmVsX2NvbnRyb2w6MTsKIAl1MzIgYmF0dGVyeV9mb3JjZV9wcmltYXJ5OjE7CisJdTMyIHBs
YXRmb3JtX2Rydl9yZWdpc3RlcmVkOjE7CiAJdTMyIGhvdGtleV9wb2xsX2FjdGl2ZToxOwogCXUz
MiBoYXNfYWRhcHRpdmVfa2JkOjE7CiAJdTMyIGtiZF9sYW5nOjE7CkBAIC0xMTgyMCwxMCArMTE4
MjEsMTAgQEAgc3RhdGljIHZvaWQgdGhpbmtwYWRfYWNwaV9tb2R1bGVfZXhpdCh2b2lkKQogCQlw
bGF0Zm9ybV9kZXZpY2VfdW5yZWdpc3Rlcih0cGFjcGlfc2Vuc29yc19wZGV2KTsKIAl9CiAKLQlp
ZiAodHBhY3BpX3BkZXYpIHsKKwlpZiAodHBfZmVhdHVyZXMucGxhdGZvcm1fZHJ2X3JlZ2lzdGVy
ZWQpCiAJCXBsYXRmb3JtX2RyaXZlcl91bnJlZ2lzdGVyKCZ0cGFjcGlfcGRyaXZlcik7CisJaWYg
KHRwYWNwaV9wZGV2KQogCQlwbGF0Zm9ybV9kZXZpY2VfdW5yZWdpc3Rlcih0cGFjcGlfcGRldik7
Ci0JfQogCiAJaWYgKHByb2NfZGlyKQogCQlyZW1vdmVfcHJvY19lbnRyeShUUEFDUElfUFJPQ19E
SVIsIGFjcGlfcm9vdF9kaXIpOwpAQCAtMTE4OTMsOSArMTE4OTQsOCBAQCBzdGF0aWMgaW50IF9f
aW5pdCB0cGFjcGlfcGRyaXZlcl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
CiBzdGF0aWMgaW50IF9faW5pdCB0cGFjcGlfaHdtb25fcGRyaXZlcl9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogewotCXRwYWNwaV9od21vbiA9IGRldm1faHdtb25fZGV2aWNl
X3JlZ2lzdGVyX3dpdGhfZ3JvdXBzKAotCQkmdHBhY3BpX3NlbnNvcnNfcGRldi0+ZGV2LCBUUEFD
UElfTkFNRSwgTlVMTCwgdHBhY3BpX2h3bW9uX2dyb3Vwcyk7Ci0KKwl0cGFjcGlfaHdtb24gPSBk
ZXZtX2h3bW9uX2RldmljZV9yZWdpc3Rlcl93aXRoX2dyb3VwcygmcGRldi0+ZGV2LCBUUEFDUElf
TkFNRSwKKwkJCQkJCQkgICAgICBOVUxMLCB0cGFjcGlfaHdtb25fZ3JvdXBzKTsKIAlpZiAoSVNf
RVJSKHRwYWNwaV9od21vbikpCiAJCXByX2VycigidW5hYmxlIHRvIHJlZ2lzdGVyIGh3bW9uIGRl
dmljZVxuIik7CiAKQEAgLTExOTY1LDE2ICsxMTk2NSwyNCBAQCBzdGF0aWMgaW50IF9faW5pdCB0
aGlua3BhZF9hY3BpX21vZHVsZV9pbml0KHZvaWQpCiAJCXRwX2ZlYXR1cmVzLnF1aXJrcyA9IGRt
aV9pZC0+ZHJpdmVyX2RhdGE7CiAKIAkvKiBEZXZpY2UgaW5pdGlhbGl6YXRpb24gKi8KLQl0cGFj
cGlfcGRldiA9IHBsYXRmb3JtX2NyZWF0ZV9idW5kbGUoJnRwYWNwaV9wZHJpdmVyLCB0cGFjcGlf
cGRyaXZlcl9wcm9iZSwKLQkJCQkJICAgICBOVUxMLCAwLCBOVUxMLCAwKTsKKwl0cGFjcGlfcGRl
diA9IHBsYXRmb3JtX2RldmljZV9yZWdpc3Rlcl9zaW1wbGUoVFBBQ1BJX0RSVlJfTkFNRSwgUExB
VEZPUk1fREVWSURfTk9ORSwKKwkJCQkJCSAgICAgIE5VTEwsIDApOwogCWlmIChJU19FUlIodHBh
Y3BpX3BkZXYpKSB7CiAJCXJldCA9IFBUUl9FUlIodHBhY3BpX3BkZXYpOwogCQl0cGFjcGlfcGRl
diA9IE5VTEw7Ci0JCXByX2VycigidW5hYmxlIHRvIHJlZ2lzdGVyIHBsYXRmb3JtIGRldmljZS9k
cml2ZXIgYnVuZGxlXG4iKTsKKwkJcHJfZXJyKCJ1bmFibGUgdG8gcmVnaXN0ZXIgcGxhdGZvcm0g
ZGV2aWNlXG4iKTsKIAkJdGhpbmtwYWRfYWNwaV9tb2R1bGVfZXhpdCgpOwogCQlyZXR1cm4gcmV0
OwogCX0KIAorCXJldCA9IHBsYXRmb3JtX2RyaXZlcl9wcm9iZSgmdHBhY3BpX3Bkcml2ZXIsIHRw
YWNwaV9wZHJpdmVyX3Byb2JlKTsKKwlpZiAocmV0KSB7CisJCXByX2VycigidW5hYmxlIHRvIHJl
Z2lzdGVyIG1haW4gcGxhdGZvcm0gZHJpdmVyXG4iKTsKKwkJdGhpbmtwYWRfYWNwaV9tb2R1bGVf
ZXhpdCgpOworCQlyZXR1cm4gcmV0OworCX0KKwl0cF9mZWF0dXJlcy5wbGF0Zm9ybV9kcnZfcmVn
aXN0ZXJlZCA9IDE7CisKIAl0cGFjcGlfc2Vuc29yc19wZGV2ID0gcGxhdGZvcm1fY3JlYXRlX2J1
bmRsZSgmdHBhY3BpX2h3bW9uX3Bkcml2ZXIsCiAJCQkJCQkgICAgIHRwYWNwaV9od21vbl9wZHJp
dmVyX3Byb2JlLAogCQkJCQkJICAgICBOVUxMLCAwLCBOVUxMLCAwKTsKLS0gCjIuNDkuMAoK
--fd80139cf565fe2f9a40a130f3c71afbf8d96a4329d8b97e6ad13ecda252--
