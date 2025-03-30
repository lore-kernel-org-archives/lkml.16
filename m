Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A845D12E7F;
	Sun, 30 Mar 2025 06:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743314488; cv=none; b=emS8wIgPyDAg9RuvsfZB0ZWpFisGdmsxHEqrMet9ONOTWT+fh5pgyCAHjhI2fjqBCq3dyhZaEYOlMhtm25/50dcJKoCGtdpkRPkjbjCzktAjHVTGhvv2jbRHMKM8XC6RMGylX2rVFWFxxF+Rtko2KWszrWelpVfttHVw6cy8i1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743314488; c=relaxed/simple;
	bh=mpvLj5o0eRchsqYfx2Ut0j5DUulMZXbMKPcgYlQF9IE=;
	h=Content-Type:Mime-Version:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=aquO1WfKBdoC1MD2LM/cpk21t6e2jHiDUeXWJXM+xkkxScPzOue/Mldf8WrRr/x4gFAQV7GACCVJ+AcXtk0Vtwj7D9+3LlRpAx3UI1C4aOJLpe2VmAviLS0d4wyh7/9aIQ9g8WyYVwhtKB7sOqai0TnwzoVVcVx14/GtQmZ1FgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcTdMQTO; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcTdMQTO"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22622ddcc35so37877675ad.2;
        Sat, 29 Mar 2025 23:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743314486; x=1743919286; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+sgU8HaRXIJesp5E97y8azCrs6LCW88w6l5IyOtefGM=;
        b=XcTdMQTOio7drRgHYwYIPiR/I4FCHgqHUgTOak43USIH8SC84T/L24lw2kBD8APq6z
         pYgPenvhe5qBY08OZQ1y46KLFe+gR1+HtuTFO0ZP1Fo6kTP1bW9WGuM+Bpq9ra/ZQAaA
         jxU6pL2ND0EYQQIjMscxnxoD855Zr7l6ooM273DqzVru40Bxs5P9Sgdi4S3G/6Fv6508
         YzPrrB7F92ag4vAve5E31ATaFZNtWeBWotZEzhRRMl42DyQF0HFw4fuZcRK41r35y3XK
         7jw8BoZLN7g5iCLAOm3Sa1rqktOLH/7wqwJKRW7C3MSbTupMsSDqQoVh9QDQ02vPUd3l
         ZvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743314486; x=1743919286;
        h=in-reply-to:references:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+sgU8HaRXIJesp5E97y8azCrs6LCW88w6l5IyOtefGM=;
        b=Kc29INYOndugqri3za74eoLsOdDtfz3OPrfIjA2P0sTz3qIo0JRw3JsVoTqM0+X9zU
         WOsGIGA/38iV43KI7AJB62W0t5llH2WJK+Sx049RnEsugFoYnHSifrmM9qcoSt4UQ/Pc
         w6Qtk93RZKDqbrG5SjIOmNNUOSUiONoYBLbNXbbkMPYT5/zSbMH8i38KGI7wM0m0O7aE
         7AYNhxd1vPQ+htNsodHpU/0all1Y+O0qvL9wWudiZIarXNV66xipHCoX98k5AvFHFgUK
         XrFlv0hB7Mxgmn4NvhRVmgLuEv+BbADOa91h63YumWp+ANFlDbx4LslJ0a22moviVXEs
         bYPA==
X-Forwarded-Encrypted: i=1; AJvYcCVA1sdrPyVQZRrdEWJfmziA2xHTpaYdQAbaiqYndB0sWmeVV4R2utYbPtee8RfwfcL4dS4CApTOh4BCFGU/xQBvUgyN4w==@vger.kernel.org, AJvYcCWyd+8N1BlsIBrcOVPOKrFSsHjsOHe3Jw2gnIubW9Ybm0bmmt3z9wt0jvi48dsCeRNiIBD+cKPCkG7SRVU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj8PRj6MXjiUzwRUl57wmDeg1gIo4jcWSfHa7ae9pnQmJ8+Afk
	E/po7U0GOFUbPVp++0Mjhzm1WASXfJK2ysV71aIYeYsa36RIYkuF
X-Gm-Gg: ASbGnctuUP6wRsoB5n14JquuQCVEjLEoFXK4vF6mIQvd/r9gyWy8FTzudmMhe6LRaX8
	AbHN4kJ+Gn6x+/tpx2mTUb3T+Yjhv+pMOSYtZRZJcKvYxcWleju8h/ij4LA6qnbBJSpAGyEvWqT
	6f8gZVkMO3m0IcH2HCv5uGSguHW75erzVPklOBC329f7YeHz4Zv+MIpJ22y+kG1YOQUtkEP7Fve
	txTUg7+MM5WYAtCqppUf67hMlgF392y4fZ4+O+oEodmCK+TdfIjtDCfG6OMV8oLXqFeCvDmnwU7
	YtpJRtWNFpdGSxvGkHeMS/3jn7pN1fpERb6nhQ==
X-Google-Smtp-Source: AGHT+IEcNBXjkCNExKu1GUC47KMVGc6/NJxa+VhcsGSB0f31Uj4oUh92UHmXrLDZTWffUarjYQo2Yw==
X-Received: by 2002:a17:903:2b0d:b0:224:5a8:ba2c with SMTP id d9443c01a7336-2292fa0c7c8mr72143305ad.52.1743314485715;
        Sat, 29 Mar 2025 23:01:25 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1f9584sm46095885ad.224.2025.03.29.23.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Mar 2025 23:01:25 -0700 (PDT)
Content-Type: multipart/mixed;
 boundary=b5741c32863495125bc3e6e69091048cdf82c302e929ed9b8c429c35757e
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Sun, 30 Mar 2025 03:01:22 -0300
Message-Id: <D8TDEP8ZEYE6.24AVWSGXURB4I@gmail.com>
Subject: Re: Kernel Null Pointer Dereference on Fedora with thinkpad_acpi
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Damian Tometzki" <damian@riscv-rocks.de>, <hmh@hmh.eng.br>,
 <ibm-acpi-devel@lists.sourceforge.net>,
 <platform-driver-x86@vger.kernel.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <CAL=B37kdL1orSQZD2A3skDOevRXBzF__cJJgY_GFh9LZO3FMsw@mail.gmail.com>
In-Reply-To: <CAL=B37kdL1orSQZD2A3skDOevRXBzF__cJJgY_GFh9LZO3FMsw@mail.gmail.com>

--b5741c32863495125bc3e6e69091048cdf82c302e929ed9b8c429c35757e
Content-Type: multipart/alternative;
 boundary=0ed7ef243de2d2c32701ab40e36b4b2ad9c8ee469d17dc1cd6e44a016486

--0ed7ef243de2d2c32701ab40e36b4b2ad9c8ee469d17dc1cd6e44a016486
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Content-Type: text/plain; charset=UTF-8

Hi Damian,

On Sun Mar 30, 2025 at 2:19 AM -03, Damian Tometzki wrote:
> Hi together,
>
> I encountered a kernel crash on a Lenovo ThinkPad (BIOS N32ET95W 1.71)
> running Fedora with kernel 6.15 (merge window) 7f2ff7b62617. The issue
> is a NULL pointer dereference during initialization of the
> thinkpad_acpi module. The crash occurs in kobject_get() while handling
> RFKill device registration (tpacpi_new_rfkill =E2=86=92 rfkill_register =
=E2=86=92
> device_add).
> With kernel 6.14 system boot=C2=B4s fine
>
> Let me know if further logs or debugging info are needed. Below the short=
 dump
>
> Mar 29 17:43:16.173712 fedora kernel: thinkpad_acpi: Disabling
> thinkpad-acpi brightness events by default...
> Mar 29 17:43:16.175636 fedora kernel: ACPI: bus type thunderbolt register=
ed
> Mar 29 17:43:16.179626 fedora kernel: BUG: kernel NULL pointer
> dereference, address: 000000000000004c
> Mar 29 17:43:16.179689 fedora kernel: #PF: supervisor read access in kern=
el mode
> Mar 29 17:43:16.180235 fedora kernel: #PF: error_code(0x0000) - not-prese=
nt page
> Mar 29 17:43:16.180290 fedora kernel: PGD 0 P4D 0
> Mar 29 17:43:16.180325 fedora kernel: Oops: Oops: 0000 [#1] SMP NOPTI
> Mar 29 17:43:16.180340 fedora kernel: CPU: 6 UID: 0 PID: 1015 Comm:
> (udev-worker) Not tainted 6.14.0 #355 PREEMPT(lazy)
> Mar 29 17:43:16.180449 fedora kernel: Hardware name: LENOVO
> 20XWCTO1WW/20XWCTO1WW, BIOS N32ET95W (1.71 ) 10/24/2024
> Mar 29 17:43:16.180469 fedora kernel: RIP: 0010:kobject_get+0xd/0x70
> Mar 29 17:43:16.180491 fedora kernel: Code: 66 66 2e 0f 1f 84 00 00 00
> 00 00 66 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e
> fa 53 48 89 fb 48 85 ff 74 1f <f6> 47 3c 01 74 22 48 8d 7b 38 b8 01
> 00>
> Mar 29 17:43:16.180506 fedora kernel: RSP: 0018:ffffd3d200b5f750
> EFLAGS: 00010202
> Mar 29 17:43:16.180523 fedora kernel: RAX: ffff8ebbc10fac00 RBX:
> 0000000000000010 RCX: 0000000000000000
> Mar 29 17:43:16.180534 fedora kernel: RDX: 0000000000000000 RSI:
> ffffffff9aebafa0 RDI: 0000000000000010
> Mar 29 17:43:16.180547 fedora kernel: RBP: ffff8ebbd49f4b88 R08:
> 0000000000000100 R09: 0000000000000000
> Mar 29 17:43:16.180559 fedora kernel: R10: ffffd3d200b5f760 R11:
> 0000000000000008 R12: 0000000000000010
> Mar 29 17:43:16.180573 fedora kernel: R13: ffff8ebbc8b12388 R14:
> ffffffffc14a7500 R15: 0000000000000000
> Mar 29 17:43:16.180587 fedora kernel: FS:  00007f1aa7c15040(0000)
> GS:ffff8ebf72546000(0000) knlGS:0000000000000000
> Mar 29 17:43:16.180606 fedora kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
> 0000000080050033
> Mar 29 17:43:16.180630 fedora kernel: CR2: 000000000000004c CR3:
> 0000000113948001 CR4: 0000000000f70ef0
> Mar 29 17:43:16.180642 fedora kernel: PKRU: 55555554
> Mar 29 17:43:16.180654 fedora kernel: Call Trace:
> Mar 29 17:43:16.180664 fedora kernel:  <TASK>
> Mar 29 17:43:16.180676 fedora kernel:  ? show_trace_log_lvl+0x1d2/0x2f0
> Mar 29 17:43:16.180688 fedora kernel:  ? show_trace_log_lvl+0x1d2/0x2f0
> Mar 29 17:43:16.180704 fedora kernel:  ? show_trace_log_lvl+0x1d2/0x2f0
> Mar 29 17:43:16.180712 fedora kernel:  ? device_add+0x8f/0x6e0
> Mar 29 17:43:16.180724 fedora kernel:  ? __die_body.cold+0x8/0x12
> Mar 29 17:43:16.180739 fedora kernel:  ? page_fault_oops+0x146/0x180
> Mar 29 17:43:16.180748 fedora kernel:  ? exc_page_fault+0x7e/0x1a0
> Mar 29 17:43:16.180758 fedora kernel:  ? asm_exc_page_fault+0x26/0x30
> Mar 29 17:43:16.180769 fedora kernel:  ? __pfx_klist_children_get+0x10/0x=
10
> Mar 29 17:43:16.180781 fedora kernel:  ? kobject_get+0xd/0x70
> Mar 29 17:43:16.180792 fedora kernel:  device_add+0x8f/0x6e0
> Mar 29 17:43:16.180804 fedora kernel:  rfkill_register+0xbc/0x2c0 [rfkill=
]
> Mar 29 17:43:16.180813 fedora kernel:  tpacpi_new_rfkill+0x185/0x230
> [thinkpad_acpi]
> Mar 29 17:43:16.180826 fedora kernel:  ibm_init+0x66/0x2a0 [thinkpad_acpi=
]
> Mar 29 17:43:16.180840 fedora kernel:
> tpacpi_pdriver_probe+0x160/0x250 [thinkpad_acpi]
> Mar 29 17:43:16.180852 fedora kernel:  platform_probe+0x41/0xa0
> Mar 29 17:43:16.180887 fedora kernel:  really_probe+0xdb/0x340
> Mar 29 17:43:16.180900 fedora kernel:  ? pm_runtime_barrier+0x55/0x90
> Mar 29 17:43:16.180912 fedora kernel:  ? __pfx___driver_attach+0x10/0x10
> Mar 29 17:43:16.180920 fedora kernel:  __driver_probe_device+0x78/0x140
> Mar 29 17:43:16.180932 fedora kernel:  driver_probe_device+0x1f/0xa0
> Mar 29 17:43:16.180942 fedora kernel:  __driver_attach+0xb8/0x1d0
> Mar 29 17:43:16.180954 fedora kernel:  bus_for_each_dev+0x82/0xd0
> Mar 29 17:43:16.180966 fedora kernel:  bus_add_driver+0x12f/0x210
> Mar 29 17:43:16.180976 fedora kernel:  driver_register+0x72/0xd0
> Mar 29 17:43:16.180988 fedora kernel:  __platform_driver_probe+0x45/0x90
> Mar 29 17:43:16.180999 fedora kernel:  __platform_create_bundle+0xe7/0x10=
0
> Mar 29 17:43:16.181011 fedora kernel:  ?
> __pfx_tpacpi_pdriver_probe+0x10/0x10 [thinkpad_acpi]
> Mar 29 17:43:16.181025 fedora kernel:  ?
> __pfx_thinkpad_acpi_module_init+0x10/0x10 [thinkpad_acpi]
> Mar 29 17:43:16.181035 fedora kernel:
> thinkpad_acpi_module_init+0x37e/0x430 [thinkpad_acpi]
> Mar 29 17:43:16.181045 fedora kernel:  do_one_initcall+0x58/0x300
> Mar 29 17:43:16.181053 fedora kernel:  do_init_module+0x82/0x240
> Mar 29 17:43:16.181065 fedora kernel:  init_module_from_file+0x8b/0xe0
> Mar 29 17:43:16.181073 fedora kernel:  idempotent_init_module+0x113/0x310
> Mar 29 17:43:16.181083 fedora kernel:  __x64_sys_finit_module+0x67/0xc0
> Mar 29 17:43:16.181093 fedora kernel:  do_syscall_64+0x7f/0x170
> Mar 29 17:43:16.181103 fedora kernel:  ? syscall_exit_to_user_mode+0x1d5/=
0x210
> Mar 29 17:43:16.181112 fedora kernel:  ? do_syscall_64+0x8c/0x170
> Mar 29 17:43:16.181124 fedora kernel:  ?
> syscall_exit_to_user_mode_prepare+0x14a/0x180
> Mar 29 17:43:16.181135 fedora kernel:  ? syscall_exit_to_user_mode+0x10/0=
x210
> Mar 29 17:43:16.181144 fedora kernel:  ? do_syscall_64+0x8c/0x170
> Mar 29 17:43:16.181152 fedora kernel:  ?
> syscall_exit_to_user_mode_prepare+0x14a/0x180
> Mar 29 17:43:16.181163 fedora kernel:  ? syscall_exit_to_user_mode+0x10/0=
x210
> Mar 29 17:43:16.181173 fedora kernel:  ? do_syscall_64+0x8c/0x170
> Mar 29 17:43:16.181182 fedora kernel:  ? seq_read_iter+0x20e/0x480
> Mar 29 17:43:16.181198 fedora kernel:  ? vfs_read+0x29b/0x370
> Mar 29 17:43:16.181217 fedora kernel:  ? __seccomp_filter+0x41/0x4e0
> Mar 29 17:43:16.181233 fedora kernel:  ?
> syscall_exit_to_user_mode_prepare+0x14a/0x180
> Mar 29 17:43:16.181250 fedora kernel:  ? syscall_exit_to_user_mode+0x10/0=
x210
> Mar 29 17:43:16.181264 fedora kernel:  ? do_syscall_64+0x8c/0x170
> Mar 29 17:43:16.181280 fedora kernel:  ? do_syscall_64+0x8c/0x170
> Mar 29 17:43:16.181292 fedora kernel:  ?
> syscall_exit_to_user_mode_prepare+0x14a/0x180
> Mar 29 17:43:16.181316 fedora kernel:  ? syscall_exit_to_user_mode+0x10/0=
x210
> Mar 29 17:43:16.181331 fedora kernel:  ? clear_bhb_loop+0x35/0x90
> Mar 29 17:43:16.181341 fedora kernel:  ? clear_bhb_loop+0x35/0x90
> Mar 29 17:43:16.181351 fedora kernel:  ? clear_bhb_loop+0x35/0x90
> Mar 29 17:43:16.181360 fedora kernel:  entry_SYSCALL_64_after_hwframe+0x7=
6/0x7e
> Mar 29 17:43:16.181372 fedora kernel: RIP: 0033:0x7f1aa84c5a8d
> Mar 29 17:43:16.181381 fedora kernel: Code: ff c3 66 2e 0f 1f 84 00 00
> 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2
> 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d
> 4b>
> Mar 29 17:43:16.181392 fedora kernel: RSP: 002b:00007ffe5ca79bc8
> EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> Mar 29 17:43:16.181406 fedora kernel: RAX: ffffffffffffffda RBX:
> 00005610a8c7deb0 RCX: 00007f1aa84c5a8d
> Mar 29 17:43:16.181419 fedora kernel: RDX: 0000000000000000 RSI:
> 00007f1aa7b88965 RDI: 0000000000000032
> Mar 29 17:43:16.181431 fedora kernel: RBP: 00007ffe5ca79c80 R08:
> 0000000000000000 R09: 00007ffe5ca79c30
> Mar 29 17:43:16.181441 fedora kernel: R10: 0000000000000000 R11:
> 0000000000000246 R12: 0000000000020000
> Mar 29 17:43:16.181448 fedora kernel: R13: 00005610a8c7f880 R14:
> 00007f1aa7b88965 R15: 0000000000000000
> Mar 29 17:43:16.181458 fedora kernel:  </TASK>
> Mar 29 17:43:16.181472 fedora kernel: Modules linked in: cfg80211(+)
> thunderbolt(+) thinkpad_acpi(+) igen6_edac intel_soc_dts_iosf
> platform_profile snd soundcore int3403_thermal int340x_thermal_zone
> soc_button_>
> Mar 29 17:43:16.181784 fedora kernel: CR2: 000000000000004c
> Mar 29 17:43:16.181806 fedora kernel: ---[ end trace 0000000000000000 ]--=
-
>
> Best regards
> Damian

Hmmm - I have a feeling about this one.

Can you apply and test the attached proposed patch? If you do please
verify if the problem persist and if the driver has all the features
present before the regression.

If everything goes nicely, feel free to add a Tested-by: tag for when I
submit this.

--=20
 ~ Kurt

--0ed7ef243de2d2c32701ab40e36b4b2ad9c8ee469d17dc1cd6e44a016486--

--b5741c32863495125bc3e6e69091048cdf82c302e929ed9b8c429c35757e
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename=0001-platform-x86-thinkpad_acpi-Fix-rfkill-null-pointer-d.patch
Content-Type: text/x-patch; charset=utf-8;
 name=0001-platform-x86-thinkpad_acpi-Fix-rfkill-null-pointer-d.patch

RnJvbSA2NzFiNjg3NzQyYWJmNjZiZmE3NTVhMjUzZWUzM2RkMDYxYjJlMzVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLdXJ0IEJvcmphIDxrdXVydGJAZ21haWwuY29tPgpEYXRlOiBT
dW4sIDMwIE1hciAyMDI1IDAyOjUzOjI2IC0wMzAwClN1YmplY3Q6IFtQQVRDSF0gcGxhdGZvcm0v
eDg2OiB0aGlua3BhZF9hY3BpOiBGaXggcmZraWxsIG51bGwgcG9pbnRlciBkZXJlZgoKU2lnbmVk
LW9mZi1ieTogS3VydCBCb3JqYSA8a3V1cnRiQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3BsYXRm
b3JtL3g4Ni90aGlua3BhZF9hY3BpLmMgfCAxOSArKysrKysrKysrKysrKy0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3BsYXRmb3JtL3g4Ni90aGlua3BhZF9hY3BpLmMgYi9kcml2ZXJzL3BsYXRmb3JtL3g4
Ni90aGlua3BhZF9hY3BpLmMKaW5kZXggMDM4NGNmMzExODc4Li4xZDRlOWZhMjE4MDggMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L3RoaW5rcGFkX2FjcGkuYworKysgYi9kcml2ZXJz
L3BsYXRmb3JtL3g4Ni90aGlua3BhZF9hY3BpLmMKQEAgLTM2Nyw2ICszNjcsNyBAQCBzdGF0aWMg
c3RydWN0IHsKIAl1MzIgYmVlcF9uZWVkc190d29fYXJnczoxOwogCXUzMiBtaXhlcl9ub19sZXZl
bF9jb250cm9sOjE7CiAJdTMyIGJhdHRlcnlfZm9yY2VfcHJpbWFyeToxOworCXUzMiBwbGF0Zm9y
bV9kcnZfcmVnaXN0ZXJlZDoxOwogCXUzMiBob3RrZXlfcG9sbF9hY3RpdmU6MTsKIAl1MzIgaGFz
X2FkYXB0aXZlX2tiZDoxOwogCXUzMiBrYmRfbGFuZzoxOwpAQCAtMTE4MjAsMTAgKzExODIxLDEw
IEBAIHN0YXRpYyB2b2lkIHRoaW5rcGFkX2FjcGlfbW9kdWxlX2V4aXQodm9pZCkKIAkJcGxhdGZv
cm1fZGV2aWNlX3VucmVnaXN0ZXIodHBhY3BpX3NlbnNvcnNfcGRldik7CiAJfQogCi0JaWYgKHRw
YWNwaV9wZGV2KSB7CisJaWYgKHRwX2ZlYXR1cmVzLnBsYXRmb3JtX2Rydl9yZWdpc3RlcmVkKQog
CQlwbGF0Zm9ybV9kcml2ZXJfdW5yZWdpc3RlcigmdHBhY3BpX3Bkcml2ZXIpOworCWlmICh0cGFj
cGlfcGRldikKIAkJcGxhdGZvcm1fZGV2aWNlX3VucmVnaXN0ZXIodHBhY3BpX3BkZXYpOwotCX0K
IAogCWlmIChwcm9jX2RpcikKIAkJcmVtb3ZlX3Byb2NfZW50cnkoVFBBQ1BJX1BST0NfRElSLCBh
Y3BpX3Jvb3RfZGlyKTsKQEAgLTExOTY1LDE2ICsxMTk2NiwyNCBAQCBzdGF0aWMgaW50IF9faW5p
dCB0aGlua3BhZF9hY3BpX21vZHVsZV9pbml0KHZvaWQpCiAJCXRwX2ZlYXR1cmVzLnF1aXJrcyA9
IGRtaV9pZC0+ZHJpdmVyX2RhdGE7CiAKIAkvKiBEZXZpY2UgaW5pdGlhbGl6YXRpb24gKi8KLQl0
cGFjcGlfcGRldiA9IHBsYXRmb3JtX2NyZWF0ZV9idW5kbGUoJnRwYWNwaV9wZHJpdmVyLCB0cGFj
cGlfcGRyaXZlcl9wcm9iZSwKLQkJCQkJICAgICBOVUxMLCAwLCBOVUxMLCAwKTsKKwl0cGFjcGlf
cGRldiA9IHBsYXRmb3JtX2RldmljZV9yZWdpc3Rlcl9zaW1wbGUoVFBBQ1BJX0RSVlJfTkFNRSwg
UExBVEZPUk1fREVWSURfTk9ORSwKKwkJCQkJCSAgICAgIE5VTEwsIDApOwogCWlmIChJU19FUlIo
dHBhY3BpX3BkZXYpKSB7CiAJCXJldCA9IFBUUl9FUlIodHBhY3BpX3BkZXYpOwogCQl0cGFjcGlf
cGRldiA9IE5VTEw7Ci0JCXByX2VycigidW5hYmxlIHRvIHJlZ2lzdGVyIHBsYXRmb3JtIGRldmlj
ZS9kcml2ZXIgYnVuZGxlXG4iKTsKKwkJcHJfZXJyKCJ1bmFibGUgdG8gcmVnaXN0ZXIgcGxhdGZv
cm0gZGV2aWNlXG4iKTsKIAkJdGhpbmtwYWRfYWNwaV9tb2R1bGVfZXhpdCgpOwogCQlyZXR1cm4g
cmV0OwogCX0KIAorCXJldCA9IHBsYXRmb3JtX2RyaXZlcl9wcm9iZSgmdHBhY3BpX3Bkcml2ZXIs
IHRwYWNwaV9wZHJpdmVyX3Byb2JlKTsKKwlpZiAocmV0KSB7CisJCXByX2VycigidW5hYmxlIHRv
IHJlZ2lzdGVyIG1haW4gcGxhdGZvcm0gZHJpdmVyXG4iKTsKKwkJdGhpbmtwYWRfYWNwaV9tb2R1
bGVfZXhpdCgpOworCQlyZXR1cm4gcmV0OworCX0KKwl0cF9mZWF0dXJlcy5wbGF0Zm9ybV9kcnZf
cmVnaXN0ZXJlZCA9IDE7CisKIAl0cGFjcGlfc2Vuc29yc19wZGV2ID0gcGxhdGZvcm1fY3JlYXRl
X2J1bmRsZSgmdHBhY3BpX2h3bW9uX3Bkcml2ZXIsCiAJCQkJCQkgICAgIHRwYWNwaV9od21vbl9w
ZHJpdmVyX3Byb2JlLAogCQkJCQkJICAgICBOVUxMLCAwLCBOVUxMLCAwKTsKLS0gCjIuNDkuMAoK
--b5741c32863495125bc3e6e69091048cdf82c302e929ed9b8c429c35757e--
