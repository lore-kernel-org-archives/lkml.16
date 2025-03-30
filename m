Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9957938F80
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 06:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743316150; cv=none; b=lJoAgnhd1mxnZSYOpvlT/zp0DHAUvQerjbAhyujq/EFzvCNFqZRrgULkj6Y/6P80K+QJKL49dSMGJpBQ5xCsC0EWqjVMIgn0CGBkBATCDlsDdyBgfdrhmLD2aCIKtjtwXCt/BEpblrw+WuC1dkKcDIYo/lk8IuB9wEIani8AjZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743316150; c=relaxed/simple;
	bh=J8rimUaUNS+Y4Qq/MpH5VEIs5k5+c/rN/RYhnLsF4VM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d8KrnkySlDzaCPK6h8afPomIUGgAW5oPmb5QvryEOUwVOXXwwGQbdj8OAfszjt7XYQl+wyZHBp+tRmiu4kwN2g5g26Sv/4Ik3pdc6QPRUReDiyeWf77vggxTw+NlRLugj8KLbbTJdjTG5c2n56rdxfnwXI399zvudB2GpH2QPRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=riscv-rocks.de; spf=pass smtp.mailfrom=tometzki.de; dkim=pass (2048-bit key) header.d=riscv-rocks.de header.i=@riscv-rocks.de header.b=JduzeRO2; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=riscv-rocks.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tometzki.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscv-rocks.de header.i=@riscv-rocks.de header.b="JduzeRO2"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-523de5611a3so1577897e0c.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 23:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscv-rocks.de; s=google; t=1743316145; x=1743920945; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jA4pVNGJXtoqbkP1YhZMkKt1x27TqkJE+73ve4PCg0=;
        b=JduzeRO2AeTxDdECGInnFdaubeBfzrwxvPZndY3YQbeRQ5vOjs1Cf00n/3vWbvbWwd
         AJyvSJlKrrvWff0Eb9mRM/srLZ2Ps8s/HKvFQGs5MlGfPi0POlx1rtoVwR59zzejUig6
         jGmStsEX6j46mLUzr+cJLbh6sOK+DG4EU0kYGVwkc2jo6n6LsS7ECO+PKnwsGEllskx4
         ++Tvgt0XghfqoOqpFrJIRsE5Pw9dKyBLTfzaU/v7bqCQlYZdrhQnQXAzjCqtOQBeOxZr
         QCCrhAt9Tf+xKwktp2tLq8g92gKF0aW3QfZS7QR4cAezuO/GVGoG1/ZE/M3M4v8Lvk6Q
         qE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743316145; x=1743920945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jA4pVNGJXtoqbkP1YhZMkKt1x27TqkJE+73ve4PCg0=;
        b=LLmU1HMwT4xNogyQjQqYn5vEfJFRxjuMQb2V1xURveynlGFAZAYpRbxqv2waaMumqt
         jLd/zRHwW/aVemb3sogdAuXDbB9oYWVxF8TssRSBSiyrzb/i3tzJ3XyuO4LFYKKXXfB1
         bPPDmI08w17InyMnwBz7g/4iSjmR8PEyJ4KYMQpTwotAJED5Jk1oqliWA5LsB+Upr9Cv
         seFZXuBEIaGR5Jeq2aES25jVCc4/aGZC6aCgG9lEV93KHYjCLOlVEhUlupQs7xECrH1V
         n5+HNY9jsnOXCtm19RgnK6lRcWmj/QS39HbzjwI2Ul0DWmlt1T9bCoRTb1BuerRNGXGz
         uG1w==
X-Forwarded-Encrypted: i=1; AJvYcCV5nhPEwnunEcWxBqltpMgErxWq0MDY5HGezrPpHYASrFsQ/JpEg/gG5YuXT3ltkLIVxzYGi/6Tr2cS0wk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxwzwdKgkLI+6tMM8P+3AMYKcWrMsJwhTe+jNQVjLaExKOMiUH
	/r3naR5gyenUvIwblNEsr/6HAC6svu1cwNSpx9pcXsjHzcbXiuaB+i7qHJiTGCsbuHIZzf0jwy/
	c5HpSgdVfOBehw+J6/IV//nvla2NtxZVPWVsQHg==
X-Gm-Gg: ASbGncvO3+ohJgFqKScVwTNH/cBG/HZj9bjNayqG7HE+d3xmOkcxjNS7VRwvFYU4EuL
	8o3GGjuAmFdeq9ChjNFIUKax69wMwWGiCwirw2n93gD9T2Mf+QnO9WidQPf7jk/rKQzeIA9BTNw
	RCqt5CK2p3JLhprgyj548X+IxLf3Et/sdasS5cUbor2ZWj59VQlVcXSgI50Q==
X-Google-Smtp-Source: AGHT+IHjXdLzLJ1YSkFObSvk0Y4P6bCD8j6TZMTbBKrAT5/D/Q5M80X4IXaB+nbeOlViBFttPvgyEYh7Lonkxd6cLsQ=
X-Received: by 2002:a05:6102:954:b0:4bb:c8e5:aa8b with SMTP id
 ada2fe7eead31-4c6d39feee0mr2983997137.22.1743316145270; Sat, 29 Mar 2025
 23:29:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAL=B37kdL1orSQZD2A3skDOevRXBzF__cJJgY_GFh9LZO3FMsw@mail.gmail.com>
 <D8TDEP8ZEYE6.24AVWSGXURB4I@gmail.com>
In-Reply-To: <D8TDEP8ZEYE6.24AVWSGXURB4I@gmail.com>
From: Damian Tometzki <damian@riscv-rocks.de>
Date: Sun, 30 Mar 2025 08:28:54 +0200
X-Gm-Features: AQ5f1JpZAppzgGDxZc-tHIgNorcfVoeh1Xlw4YGMYtH8MwTRqxT30emR9wEXvpI
Message-ID: <CAL=B37ko7Zyr6gJxYTvsFKsfXKNTPw80UvjNgbQ+B6EZ9GGfaw@mail.gmail.com>
Subject: Re: Kernel Null Pointer Dereference on Fedora with thinkpad_acpi
To: Kurt Borja <kuurtb@gmail.com>
Cc: hmh@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net, 
	platform-driver-x86@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 30, 2025 at 8:01=E2=80=AFAM Kurt Borja <kuurtb@gmail.com> wrote=
:
>
> Hi Damian,
>
> On Sun Mar 30, 2025 at 2:19 AM -03, Damian Tometzki wrote:
> > Hi together,
> >
> > I encountered a kernel crash on a Lenovo ThinkPad (BIOS N32ET95W 1.71)
> > running Fedora with kernel 6.15 (merge window) 7f2ff7b62617. The issue
> > is a NULL pointer dereference during initialization of the
> > thinkpad_acpi module. The crash occurs in kobject_get() while handling
> > RFKill device registration (tpacpi_new_rfkill =E2=86=92 rfkill_register=
 =E2=86=92
> > device_add).
> > With kernel 6.14 system boot=C2=B4s fine
> >
> > Let me know if further logs or debugging info are needed. Below the sho=
rt dump
> >
> > Mar 29 17:43:16.173712 fedora kernel: thinkpad_acpi: Disabling
> > thinkpad-acpi brightness events by default...
> > Mar 29 17:43:16.175636 fedora kernel: ACPI: bus type thunderbolt regist=
ered
> > Mar 29 17:43:16.179626 fedora kernel: BUG: kernel NULL pointer
> > dereference, address: 000000000000004c
> > Mar 29 17:43:16.179689 fedora kernel: #PF: supervisor read access in ke=
rnel mode
> > Mar 29 17:43:16.180235 fedora kernel: #PF: error_code(0x0000) - not-pre=
sent page
> > Mar 29 17:43:16.180290 fedora kernel: PGD 0 P4D 0
> > Mar 29 17:43:16.180325 fedora kernel: Oops: Oops: 0000 [#1] SMP NOPTI
> > Mar 29 17:43:16.180340 fedora kernel: CPU: 6 UID: 0 PID: 1015 Comm:
> > (udev-worker) Not tainted 6.14.0 #355 PREEMPT(lazy)
> > Mar 29 17:43:16.180449 fedora kernel: Hardware name: LENOVO
> > 20XWCTO1WW/20XWCTO1WW, BIOS N32ET95W (1.71 ) 10/24/2024
> > Mar 29 17:43:16.180469 fedora kernel: RIP: 0010:kobject_get+0xd/0x70
> > Mar 29 17:43:16.180491 fedora kernel: Code: 66 66 2e 0f 1f 84 00 00 00
> > 00 00 66 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e
> > fa 53 48 89 fb 48 85 ff 74 1f <f6> 47 3c 01 74 22 48 8d 7b 38 b8 01
> > 00>
> > Mar 29 17:43:16.180506 fedora kernel: RSP: 0018:ffffd3d200b5f750
> > EFLAGS: 00010202
> > Mar 29 17:43:16.180523 fedora kernel: RAX: ffff8ebbc10fac00 RBX:
> > 0000000000000010 RCX: 0000000000000000
> > Mar 29 17:43:16.180534 fedora kernel: RDX: 0000000000000000 RSI:
> > ffffffff9aebafa0 RDI: 0000000000000010
> > Mar 29 17:43:16.180547 fedora kernel: RBP: ffff8ebbd49f4b88 R08:
> > 0000000000000100 R09: 0000000000000000
> > Mar 29 17:43:16.180559 fedora kernel: R10: ffffd3d200b5f760 R11:
> > 0000000000000008 R12: 0000000000000010
> > Mar 29 17:43:16.180573 fedora kernel: R13: ffff8ebbc8b12388 R14:
> > ffffffffc14a7500 R15: 0000000000000000
> > Mar 29 17:43:16.180587 fedora kernel: FS:  00007f1aa7c15040(0000)
> > GS:ffff8ebf72546000(0000) knlGS:0000000000000000
> > Mar 29 17:43:16.180606 fedora kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
> > 0000000080050033
> > Mar 29 17:43:16.180630 fedora kernel: CR2: 000000000000004c CR3:
> > 0000000113948001 CR4: 0000000000f70ef0
> > Mar 29 17:43:16.180642 fedora kernel: PKRU: 55555554
> > Mar 29 17:43:16.180654 fedora kernel: Call Trace:
> > Mar 29 17:43:16.180664 fedora kernel:  <TASK>
> > Mar 29 17:43:16.180676 fedora kernel:  ? show_trace_log_lvl+0x1d2/0x2f0
> > Mar 29 17:43:16.180688 fedora kernel:  ? show_trace_log_lvl+0x1d2/0x2f0
> > Mar 29 17:43:16.180704 fedora kernel:  ? show_trace_log_lvl+0x1d2/0x2f0
> > Mar 29 17:43:16.180712 fedora kernel:  ? device_add+0x8f/0x6e0
> > Mar 29 17:43:16.180724 fedora kernel:  ? __die_body.cold+0x8/0x12
> > Mar 29 17:43:16.180739 fedora kernel:  ? page_fault_oops+0x146/0x180
> > Mar 29 17:43:16.180748 fedora kernel:  ? exc_page_fault+0x7e/0x1a0
> > Mar 29 17:43:16.180758 fedora kernel:  ? asm_exc_page_fault+0x26/0x30
> > Mar 29 17:43:16.180769 fedora kernel:  ? __pfx_klist_children_get+0x10/=
0x10
> > Mar 29 17:43:16.180781 fedora kernel:  ? kobject_get+0xd/0x70
> > Mar 29 17:43:16.180792 fedora kernel:  device_add+0x8f/0x6e0
> > Mar 29 17:43:16.180804 fedora kernel:  rfkill_register+0xbc/0x2c0 [rfki=
ll]
> > Mar 29 17:43:16.180813 fedora kernel:  tpacpi_new_rfkill+0x185/0x230
> > [thinkpad_acpi]
> > Mar 29 17:43:16.180826 fedora kernel:  ibm_init+0x66/0x2a0 [thinkpad_ac=
pi]
> > Mar 29 17:43:16.180840 fedora kernel:
> > tpacpi_pdriver_probe+0x160/0x250 [thinkpad_acpi]
> > Mar 29 17:43:16.180852 fedora kernel:  platform_probe+0x41/0xa0
> > Mar 29 17:43:16.180887 fedora kernel:  really_probe+0xdb/0x340
> > Mar 29 17:43:16.180900 fedora kernel:  ? pm_runtime_barrier+0x55/0x90
> > Mar 29 17:43:16.180912 fedora kernel:  ? __pfx___driver_attach+0x10/0x1=
0
> > Mar 29 17:43:16.180920 fedora kernel:  __driver_probe_device+0x78/0x140
> > Mar 29 17:43:16.180932 fedora kernel:  driver_probe_device+0x1f/0xa0
> > Mar 29 17:43:16.180942 fedora kernel:  __driver_attach+0xb8/0x1d0
> > Mar 29 17:43:16.180954 fedora kernel:  bus_for_each_dev+0x82/0xd0
> > Mar 29 17:43:16.180966 fedora kernel:  bus_add_driver+0x12f/0x210
> > Mar 29 17:43:16.180976 fedora kernel:  driver_register+0x72/0xd0
> > Mar 29 17:43:16.180988 fedora kernel:  __platform_driver_probe+0x45/0x9=
0
> > Mar 29 17:43:16.180999 fedora kernel:  __platform_create_bundle+0xe7/0x=
100
> > Mar 29 17:43:16.181011 fedora kernel:  ?
> > __pfx_tpacpi_pdriver_probe+0x10/0x10 [thinkpad_acpi]
> > Mar 29 17:43:16.181025 fedora kernel:  ?
> > __pfx_thinkpad_acpi_module_init+0x10/0x10 [thinkpad_acpi]
> > Mar 29 17:43:16.181035 fedora kernel:
> > thinkpad_acpi_module_init+0x37e/0x430 [thinkpad_acpi]
> > Mar 29 17:43:16.181045 fedora kernel:  do_one_initcall+0x58/0x300
> > Mar 29 17:43:16.181053 fedora kernel:  do_init_module+0x82/0x240
> > Mar 29 17:43:16.181065 fedora kernel:  init_module_from_file+0x8b/0xe0
> > Mar 29 17:43:16.181073 fedora kernel:  idempotent_init_module+0x113/0x3=
10
> > Mar 29 17:43:16.181083 fedora kernel:  __x64_sys_finit_module+0x67/0xc0
> > Mar 29 17:43:16.181093 fedora kernel:  do_syscall_64+0x7f/0x170
> > Mar 29 17:43:16.181103 fedora kernel:  ? syscall_exit_to_user_mode+0x1d=
5/0x210
> > Mar 29 17:43:16.181112 fedora kernel:  ? do_syscall_64+0x8c/0x170
> > Mar 29 17:43:16.181124 fedora kernel:  ?
> > syscall_exit_to_user_mode_prepare+0x14a/0x180
> > Mar 29 17:43:16.181135 fedora kernel:  ? syscall_exit_to_user_mode+0x10=
/0x210
> > Mar 29 17:43:16.181144 fedora kernel:  ? do_syscall_64+0x8c/0x170
> > Mar 29 17:43:16.181152 fedora kernel:  ?
> > syscall_exit_to_user_mode_prepare+0x14a/0x180
> > Mar 29 17:43:16.181163 fedora kernel:  ? syscall_exit_to_user_mode+0x10=
/0x210
> > Mar 29 17:43:16.181173 fedora kernel:  ? do_syscall_64+0x8c/0x170
> > Mar 29 17:43:16.181182 fedora kernel:  ? seq_read_iter+0x20e/0x480
> > Mar 29 17:43:16.181198 fedora kernel:  ? vfs_read+0x29b/0x370
> > Mar 29 17:43:16.181217 fedora kernel:  ? __seccomp_filter+0x41/0x4e0
> > Mar 29 17:43:16.181233 fedora kernel:  ?
> > syscall_exit_to_user_mode_prepare+0x14a/0x180
> > Mar 29 17:43:16.181250 fedora kernel:  ? syscall_exit_to_user_mode+0x10=
/0x210
> > Mar 29 17:43:16.181264 fedora kernel:  ? do_syscall_64+0x8c/0x170
> > Mar 29 17:43:16.181280 fedora kernel:  ? do_syscall_64+0x8c/0x170
> > Mar 29 17:43:16.181292 fedora kernel:  ?
> > syscall_exit_to_user_mode_prepare+0x14a/0x180
> > Mar 29 17:43:16.181316 fedora kernel:  ? syscall_exit_to_user_mode+0x10=
/0x210
> > Mar 29 17:43:16.181331 fedora kernel:  ? clear_bhb_loop+0x35/0x90
> > Mar 29 17:43:16.181341 fedora kernel:  ? clear_bhb_loop+0x35/0x90
> > Mar 29 17:43:16.181351 fedora kernel:  ? clear_bhb_loop+0x35/0x90
> > Mar 29 17:43:16.181360 fedora kernel:  entry_SYSCALL_64_after_hwframe+0=
x76/0x7e
> > Mar 29 17:43:16.181372 fedora kernel: RIP: 0033:0x7f1aa84c5a8d
> > Mar 29 17:43:16.181381 fedora kernel: Code: ff c3 66 2e 0f 1f 84 00 00
> > 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2
> > 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d
> > 4b>
> > Mar 29 17:43:16.181392 fedora kernel: RSP: 002b:00007ffe5ca79bc8
> > EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> > Mar 29 17:43:16.181406 fedora kernel: RAX: ffffffffffffffda RBX:
> > 00005610a8c7deb0 RCX: 00007f1aa84c5a8d
> > Mar 29 17:43:16.181419 fedora kernel: RDX: 0000000000000000 RSI:
> > 00007f1aa7b88965 RDI: 0000000000000032
> > Mar 29 17:43:16.181431 fedora kernel: RBP: 00007ffe5ca79c80 R08:
> > 0000000000000000 R09: 00007ffe5ca79c30
> > Mar 29 17:43:16.181441 fedora kernel: R10: 0000000000000000 R11:
> > 0000000000000246 R12: 0000000000020000
> > Mar 29 17:43:16.181448 fedora kernel: R13: 00005610a8c7f880 R14:
> > 00007f1aa7b88965 R15: 0000000000000000
> > Mar 29 17:43:16.181458 fedora kernel:  </TASK>
> > Mar 29 17:43:16.181472 fedora kernel: Modules linked in: cfg80211(+)
> > thunderbolt(+) thinkpad_acpi(+) igen6_edac intel_soc_dts_iosf
> > platform_profile snd soundcore int3403_thermal int340x_thermal_zone
> > soc_button_>
> > Mar 29 17:43:16.181784 fedora kernel: CR2: 000000000000004c
> > Mar 29 17:43:16.181806 fedora kernel: ---[ end trace 0000000000000000 ]=
---
> >
> > Best regards
> > Damian
>
> Hmmm - I have a feeling about this one.
>
> Can you apply and test the attached proposed patch? If you do please
> verify if the problem persist and if the driver has all the features
> present before the regression.
>
> If everything goes nicely, feel free to add a Tested-by: tag for when I
> submit this.
>
> --
>  ~ Kurt

Hi Kurt,

many thnaks for the fast response.
With this patch my system boot again but i have other dump in dmesg

3.719602] input: ThinkPad Extra Buttons as
/devices/platform/thinkpad_acpi/input/input14
[    3.720189] idma64 idma64.0: Found Intel integrated DMA 64-bit
[    3.737008] BUG: kernel NULL pointer dereference, address: 0000000000000=
2a0
[    3.737014] #PF: supervisor read access in kernel mode
[    3.737016] #PF: error_code(0x0000) - not-present page
[    3.737018] PGD 0 P4D 0
[    3.737022] Oops: Oops: 0000 [#1] SMP NOPTI
[    3.737026] CPU: 3 UID: 0 PID: 772 Comm: (udev-worker) Not tainted
6.14.0 #357 PREEMPT(lazy)
[    3.737029] Hardware name: LENOVO 20XWCTO1WW/20XWCTO1WW, BIOS
N32ET95W (1.71 ) 10/24/2024
[    3.737031] RIP: 0010:device_property_present+0x9/0x20
[    3.737039] Code: cc cc 31 c0 c3 cc cc cc cc 0f 1f 84 00 00 00 00
00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f
44 00 00 <48> 8b bf 90 02 00 00 e9 5b ff ff ff 66 66 2e 0f 1f 84 00 00
00 00
[    3.737042] RSP: 0018:ffffcfedc0deb7e8 EFLAGS: 00010202
[    3.737045] RAX: ffff8d37d5c05810 RBX: 0000000000000010 RCX: 00000000000=
00000
[    3.737047] RDX: 0000000000000000 RSI: ffffffff8feded5f RDI: 00000000000=
00010
[    3.737049] RBP: ffff8d37d5c05800 R08: 0000000000000400 R09: 00000000000=
00000
[    3.737050] R10: ffffcfedc0deb7f0 R11: 0000000000000000 R12: 00000000000=
00000
[    3.737052] R13: ffffffffc14c66c0 R14: ffffffffc14d9b8a R15: ffff8d37ccb=
0de68
[    3.737054] FS:  00007ff510cec040(0000) GS:ffff8d3b7e3c4000(0000)
knlGS:0000000000000000
[    3.737056] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.737058] CR2: 00000000000002a0 CR3: 0000000115b28001 CR4: 0000000000f=
70ef0
[    3.737060] PKRU: 55555554
[    3.737061] Call Trace:
[    3.737064]  <TASK>
[    3.737068]  ? show_trace_log_lvl+0x1d2/0x2f0
[    3.737073]  ? show_trace_log_lvl+0x1d2/0x2f0
[    3.737075]  ? show_trace_log_lvl+0x1d2/0x2f0
[    3.737079]  ? __hwmon_device_register+0x2cd/0x550
[    3.737084]  ? __die_body.cold+0x8/0x12
[    3.737087]  ? page_fault_oops+0x146/0x180
[    3.737093]  ? exc_page_fault+0x7e/0x1a0
[    3.737098]  ? asm_exc_page_fault+0x26/0x30
[    3.737104]  ? device_property_present+0x9/0x20
[    3.737106]  __hwmon_device_register+0x2cd/0x550
[    3.737111]  devm_hwmon_device_register_with_groups+0x6d/0xc0
[    3.737116]  tpacpi_hwmon_pdriver_probe+0x29/0x60 [thinkpad_acpi]
[    3.737132]  platform_probe+0x41/0xa0
[    3.737136]  really_probe+0xdb/0x340
[    3.737140]  ? pm_runtime_barrier+0x55/0x90
[    3.737144]  ? __pfx___driver_attach+0x10/0x10
[    3.737147]  __driver_probe_device+0x78/0x140
[    3.737149]  driver_probe_device+0x1f/0xa0
[    3.737153]  __driver_attach+0xb8/0x1d0
[    3.737156]  bus_for_each_dev+0x82/0xd0
[    3.737159]  bus_add_driver+0x12f/0x210
[    3.737162]  driver_register+0x72/0xd0
[    3.737165]  __platform_driver_probe+0x45/0x90
[    3.737167]  __platform_create_bundle+0xe7/0x100
[    3.737170]  ? __pfx_tpacpi_hwmon_pdriver_probe+0x10/0x10 [thinkpad_acpi=
]
[    3.737180]  ? __pfx_thinkpad_acpi_module_init+0x10/0x10 [thinkpad_acpi]
[    3.737190]  thinkpad_acpi_module_init+0x417/0x470 [thinkpad_acpi]
[    3.737201]  do_one_initcall+0x58/0x300
[    3.737207]  do_init_module+0x82/0x240
[    3.737211]  init_module_from_file+0x8b/0xe0
[    3.737215]  idempotent_init_module+0x113/0x310
[    3.737218]  __x64_sys_finit_module+0x67/0xc0
[    3.737221]  do_syscall_64+0x7f/0x170
[    3.737225]  ? syscall_exit_to_user_mode+0x1d5/0x210
[    3.737229]  ? do_syscall_64+0x8c/0x170
[    3.737231]  ? rseq_get_rseq_cs+0x1d/0x220
[    3.737236]  ? rseq_ip_fixup+0x8c/0x1d0
[    3.737239]  ? __seccomp_filter+0x41/0x4e0
[    3.737243]  ? syscall_exit_to_user_mode_prepare+0x14a/0x180
[    3.737246]  ? syscall_exit_to_user_mode+0x10/0x210
[    3.737249]  ? do_syscall_64+0x8c/0x170
[    3.737252]  ? __x64_sys_close+0x3d/0x80
[    3.737256]  ? kmem_cache_free+0x399/0x440
[    3.737261]  ? syscall_exit_to_user_mode_prepare+0x14a/0x180
[    3.737264]  ? syscall_exit_to_user_mode+0x10/0x210
[    3.737267]  ? do_syscall_64+0x8c/0x170
[    3.737270]  ? do_syscall_64+0x8c/0x170
[    3.737272]  ? clear_bhb_loop+0x35/0x90
[    3.737275]  ? clear_bhb_loop+0x35/0x90
[    3.737277]  ? clear_bhb_loop+0x35/0x90
[    3.737280]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[    3.737283] RIP: 0033:0x7ff5114ffa8d
[    3.737287] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e
fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24
08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 4b 63 0f 00 f7 d8 64 89
01 48
[    3.737289] RSP: 002b:00007ffe378c0848 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[    3.737291] RAX: ffffffffffffffda RBX: 0000564e7ff98630 RCX: 00007ff5114=
ffa8d
[    3.737293] RDX: 0000000000000000 RSI: 00007ff510c5f965 RDI: 00000000000=
0002d
[    3.737295] RBP: 00007ffe378c0900 R08: 0000000000000000 R09: 00007ffe378=
c08b0
[    3.737297] R10: 0000000000000000 R11: 0000000000000246 R12: 00000000000=
20000
[    3.737298] R13: 0000564e802a2620 R14: 00007ff510c5f965 R15: 00000000000=
00000
[    3.737301]  </TASK>
[    3.737303] Modules linked in: snd_pcm pcspkr(+) think_lmi(+)
snd_ctl_led spi_intel_pci intel_rapl_common i2c_i801
processor_thermal_wt_req processor_thermal_power_floor wmi_bmof
firmware_attributes_class cfg80211 idma64 snd_timer spi_intel mei
i2c_smbus processor_thermal_mbox thunderbolt(+) igen6_edac
intel_soc_dts_iosf thinkpad_acpi(+) platform_profile snd
soc_button_array soundcore int3403_thermal int340x_thermal_zone
intel_pmc_core intel_hid sparse_keymap int3400_thermal
acpi_thermal_rel pmt_telemetry acpi_pad pmt_class acpi_tad joydev loop
nfnetlink zram lz4hc_compress lz4_compress bnep xe drm_ttm_helper
drm_suballoc_helper gpu_sched drm_gpuvm drm_exec drm_gpusvm btusb
btrtl btintel btbcm btmtk bluetooth rfkill i915 hid_multitouch
polyval_clmulni nvme polyval_generic i2c_algo_bit nvme_core
ghash_clmulni_intel drm_buddy sha512_ssse3 video ttm sha256_ssse3
nvme_keyring sha1_ssse3 ucsi_acpi drm_display_helper nvme_auth
typec_ucsi i2c_hid_acpi intel_vsec cec typec i2c_hid wmi
pinctrl_tigerlake serio_raw fuse
[    3.737373] CR2: 00000000000002a0
[    3.737376] ---[ end trace 0000000000000000 ]---
[    3.737377] RIP: 0010:device_property_present+0x9/0x20
[    3.737381] Code: cc cc 31 c0 c3 cc cc cc cc 0f 1f 84 00 00 00 00
00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f
44 00 00 <48> 8b bf 90 02 00 00 e9 5b ff ff ff 66 66 2e 0f 1f 84 00 00
00 00
[    3.737383] RSP: 0018:ffffcfedc0deb7e8 EFLAGS: 00010202
[    3.737386] RAX: ffff8d37d5c05810 RBX: 0000000000000010 RCX: 00000000000=
00000
[    3.737388] RDX: 0000000000000000 RSI: ffffffff8feded5f RDI: 00000000000=
00010
[    3.737389] RBP: ffff8d37d5c05800 R08: 0000000000000400 R09: 00000000000=
00000
[    3.737391] R10: ffffcfedc0deb7f0 R11: 0000000000000000 R12: 00000000000=
00000
[    3.737393] R13: ffffffffc14c66c0 R14: ffffffffc14d9b8a R15: ffff8d37ccb=
0de68
[    3.737394] FS:  00007ff510cec040(0000) GS:ffff8d3b7e3c4000(0000)
knlGS:0000000000000000
[    3.737397] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.737398] CR2: 00000000000002a0 CR3: 0000000115b28001 CR4: 0000000000f=
70ef0
[    3.737400] PKRU: 55555554
[    3.737402] note: (udev-worker)[772] exited with irqs disabled
[    3.746619] mc: Linux media interface: v0.10
[    3.750063] input: PC Speaker as /devices/platform/pcspkr/input/input15
[    3.755922] resource: resource sanity check: requesting [mem
0x00000000fedc0000-0x00000000fedcdfff], which spans more than pnp
00:05 [mem 0xfedc0000-0xfedc7fff]
[    3.755929] caller uncore_get_box_mmio_addr+0xe6/0x150
[intel_uncore] mapping multiple BARs
[    3.796862] intel_rapl_msr: PL4 support detected.
[    3.796919] intel_rapl_common: Found RAPL domain package
[    3.796924] intel_rapl_common: Found RAPL domain core
[    3.796926] intel_rapl_common: Found RAPL domain uncore
[    3.796929] intel_rapl_common: Found RAPL domain psys
[    3.926269] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!

Best regards
Damian
