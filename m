Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7460F145B25;
	Fri,  4 Apr 2025 19:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743794786; cv=none; b=k2mCoz7iUWsdiwKrJymBIfZPfEjZzxXQL6zjh9TtxOZ04efro47ay836eHTEt17eY2LiF5LNexyvzkFvbLo/iv/0oU6HQzu7fJZhfD4JxRVFmgDAe2bq00x19sjcC4CEGGvk16qVBfpuEckuboTf4eyIMxMJCbBP1AiYGh4/Aag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743794786; c=relaxed/simple;
	bh=tqhWIdRz6Yd6Mjjk7E6yN/upVSgd5Y1266C4GGyPtws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aTog/os66NloGHkIAPvHDHGArwaMrcHkRyKiuiXUtp0SmEYem9AfDi4Nv9G6RP/mmTphrUMDlA0OoGDOc2aN/bGJvkVal95X/jsG183IXSk6ELXbgXdCGNEM3oiQkJ95w7rHfCDoYt6oHExO0bLocrlJhncQ52SrFYUo31mkiL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=d/xfkKOu; arc=none smtp.client-ip=217.72.192.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="d/xfkKOu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1743794767; x=1744399567; i=christian@heusel.eu;
	bh=0dVx25BV0PsW7nU4cYdODIe2zkvGMZNG02Hz1MPWNrw=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=d/xfkKOuxl4ogpun/XIdn3BvFY414KNYD69dZgiW+ALTZsCibgO+a/ptR/Jx8034
	 TntiWCrg0gBSA2Ium8850sy0h/kERO9+AIItMdUlLlwy5SuXG5+OeP4a/Wa4l/olv
	 9oVlLJ8qeUW6Wcmf0rFlwap/XvY5mb30nGLzwnLaOYKZa5iKEFpZareHrxGSBCxuv
	 DYTcRJyNKLJ8fymdeNMeWQjvvVgAuCrDjL/khoMGZvqPPrQXpboYvsl1uIh7ArRdL
	 DuuiCs7DhexgfCVq4JnFOApD6+wYGW6qnsWwzpXw4REBgOa5qbuPbY0mSZwz7UvLg
	 Ler7HShgkXblFv40HA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([80.187.64.231]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MHX3X-1tno923vQP-002DRn; Fri, 04 Apr 2025 21:20:20 +0200
Date: Fri, 4 Apr 2025 21:20:13 +0200
From: Christian Heusel <christian@heusel.eu>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Patil Rajesh Reddy <Patil.Reddy@amd.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, linux@frame.work, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: [REGRESSION][BISECTED] Firmware load error for TEE on Framework
 Desktop
Message-ID: <ae644428-5bf2-4b30-81ba-0b259ed3449b@heusel.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m7djchmvcgrcbqjn"
Content-Disposition: inline
X-Provags-ID: V03:K1:UG+Bx1iBxcLlJlLJgR46t0g1VwpIUPHK8mzPJ7z9i/upbBoyA0G
 L6zmwISYp32+reQQCg2RyxmAO7kf166hf2R8rcBp9mvwAkAvfITmv5b+xOcXAP+2NoDtV2u
 HgcIwtjt8yzVjdXdEnUZBJXLiAv7MM1sjv59kkWuAxlazzypagN8z6mOWs28ws+p2h0oo6d
 mdWf8MR0Q+0F9iKANclMQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Uj4hgVKLSrw=;/CQY/dnC1wiKshvgihkLw/fhH3E
 +bLdYSzVey8t9du+fbJqj0pZ5XvgdYArQW1S3pGBBnhoZIcwHVZsYOvlIQUuncizGWzOalNxV
 g2ZVyhukg+876WSd16DNdQaMg52yMLeMDkXo6W8Y+yzndjH62nJY6VJ1hRkO5vBsDCrseIxFj
 3YgQhowLMa+Lt3rqe4Gb6DSx/Qt4bRqW9fIoH/Q4Znt+oKUOG2LcC21s/YZowEQIh2m7Yh98e
 lXQBDCq+SylgdvwGcg0QITFW6tZIQLoVOQYF+Xpd+vRYgzsiR+7+qYD7LqBrCKLRPbm/Oivoo
 G4FJKfOdvAIe9egbVg0TRodN5aGPdkoEcqRQ7j/tjbjJ5q7DtZ2Ch6fIWRRDeoF2enWIyE5Kk
 V57aqpZ+Nyd6n1bVqaZGvnN46q0yQJeMF4F5UH3+9yw13nu/+1h4LfzOz9/DWXr7t/aOSFkue
 h//1JJAvJudW++OALmasy/ArZpjrcvhZBL3cTxMfiaqSilekQB+rBlFFedXG6+trDTuChXzpY
 rEvgVyWFOJkuarYtBlLrIe8h/RgS13XsxR6KXSOeEw08cgibe32V0fkq8GUQgfd73tbB5IjlX
 5ESYIkuWOX9H8W4qn8BE/c86jewlk1qEVof+n5O2cNDrx47NoQmKNNKiptC6vpX5R9xnUCdfM
 YprWHMHZ40huzpqJCFd1AC6oUooMXuNjbOyC2a4iIs5Ic716CwkTkAPP6VDNVyS8tntcbUijI
 Saj7GQ+O4ruqLQbtqRCr8lHP6OI2jjJjd9KxUDNkVFaaXbhoO+CVluzkt1lDDmQNGikJ13NI7
 X8c5re4UnFeswQ0MrpVJ8ygPd2NCV0g8J8YiU2clEG0QQIp4m/3ONa5v2B0FYgPRzHJrQ/j/e
 QlN6qR6A6ShKumLmORS4QnB95YC2qa3Qo6RCbM8NcuFhQ/Mr8vbPYM/NKdalyF0tVRs4AfquS
 ZAWjd8NYESvU2eEWaw0ktes4MImGTQ4jLC6r094eaA0V19iomXOs7EekVTM7vKBQr2gXVJ9wn
 HqjnLz7ZWnrI8KkYqQ1H52T33CypmrtNt3OicgYevHrNcRRBr3tFBihKLGOa8SkWkfqXL9LXI
 h1icGrBRRNmfvR/5XIRnEYOA65iXVGhWZ+oUJMYMPAwCEK9HyLPoVICRqFtW6G65QjhkwUhVK
 27U94tMlAbaPSy5pS6Buc2h3C1QkZPZP+N6VQitY7Ruy6Y39QCa+cqlLQ4RwGSxbG0zN9mC6e
 6otyYxIwGnNqALd4Tq5pbcy0czgrwWlkjkg8zBKjDyWJoWuY1Wie1C/RzbikDERj5XMqNxGBY
 lfoi9m0G3PwkQm2WD+IObaPBUxMo4xt9usWw/JaK5mqj4oPruUy2Ff35Hp9eX2lPWde3bH5R3
 IFRQmz7veE5/RLkg==


--m7djchmvcgrcbqjn
Content-Type: multipart/mixed; protected-headers=v1;
	boundary="637wz5agv4n5q4nk"
Content-Disposition: inline
Subject: [REGRESSION][BISECTED] Firmware load error for TEE on Framework
 Desktop
MIME-Version: 1.0


--637wz5agv4n5q4nk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello everyone,

I have recently noticed an issue on the Framework Desktop where the
following error pops up in dmesg after upgrading to any version beyond
v6.14:

[   12.136102] tee tee0: Direct firmware load for /amdtee/f29bb3d9-bd66-5441-afb88acc2b2b60d6.bin failed with error -2
[   12.141252] input: HD-Audio Generic HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:08.1/0000:c1:00.1/sound/card0/input8
[   12.141601] failed to load firmware /amdtee/f29bb3d9-bd66-5441-afb88acc2b2b60d6.bin
[   12.141843] input: HD-Audio Generic HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:08.1/0000:c1:00.1/sound/card0/input9
[   12.142005] failed to copy TA binary
[   12.185200] Failed to open TEE session err:0x0, rc:-12
[   12.185202] amd-pmf AMDI0105:00: Failed to open TA session (-12)

I have subsequently bisected the issue within the mainline kernel tree
to the following commit:

    376a8c2a1443 ("platform/x86/amd/pmf: Update PMF Driver for Compatibility with new PMF-TA")

The error is still present in the latest mainline release 6.14 and
sadly testing a revert is not trivially possible due to conflicts.

I also noticed that there is a commit with a fixes tag for the one we
have bisected to, but it's included in the same release and therefore
does not seem to fix the issue at hand:

    5b1122fc4995 ("platform/x86/amd/pmf: fix cleanup in amd_pmf_init_smart_pc()")

I have attached a dmesg output from a good boot and one from the 6.14
where the failure occurs. I'm happy to test any debug patches or provide
more information if needed.

Greeting,
Chris

---

#regzbot introduced: 376a8c2a1443
#regzbot title: x86/amd/pmf: Error on firmware load for TEE

--637wz5agv4n5q4nk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="6.14.dmesg"
Content-Transfer-Encoding: quoted-printable

[    0.000000] Linux version 6.14.0-arch1-1 (linux@archlinux) (gcc (GCC) 14=
=2E2.1 20250207, GNU ld (GNU Binutils) 2.44) #1 SMP PREEMPT_DYNAMIC Tue, 25=
 Mar 2025 01:21:22 +0000
[    0.000000] Command line: BOOT_IMAGE=3D/vmlinuz-linux root=3DUUID=3D4630=
8bde-204e-42aa-947e-08da42de7b3a rw rootflags=3Dsubvol=3Droot loglevel=3D9 =
console=3DttyS4,115200 console=3Dtty0
[    0.000000] x86/split lock detection: #DB: warning on user-space bus_loc=
ks
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009f000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000009afffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000009b00000-0x0000000009dfffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000009e00000-0x0000000009efffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000009f00000-0x0000000009f87fff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x0000000009f88000-0x0000000066b53fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000066b54000-0x000000006ad53fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000006ad54000-0x000000006ad66fff] usable
[    0.000000] BIOS-e820: [mem 0x000000006ad67000-0x000000006ad6bfff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000006ad6c000-0x0000000076f7efff] usable
[    0.000000] BIOS-e820: [mem 0x0000000076f7f000-0x000000007977efff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000007977f000-0x0000000079f7efff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x0000000079f7f000-0x0000000079ffefff] ACPI =
data
[    0.000000] BIOS-e820: [mem 0x0000000079fff000-0x0000000079ffffff] usable
[    0.000000] BIOS-e820: [mem 0x000000007a000000-0x000000007bffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000007d675000-0x00000000ffffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x0000001e7e0bffff] usable
[    0.000000] BIOS-e820: [mem 0x0000001e7e0c0000-0x00000020b01fffff] reser=
ved
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] APIC: Static calls initialized
[    0.000000] e820: update [mem 0x6ad73018-0x6ad77457] usable =3D=3D> usab=
le
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000009ef=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000000009f000-0x00000000000fff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x0000000009afff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000000009b00000-0x0000000009dfff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000009e00000-0x0000000009efff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000000009f00000-0x0000000009f87f=
ff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x0000000009f88000-0x0000000066b53f=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000000066b54000-0x000000006ad53f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x000000006ad54000-0x000000006ad66f=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000006ad67000-0x000000006ad6bf=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x000000006ad6c000-0x000000006ad730=
17] usable
[    0.000000] reserve setup_data: [mem 0x000000006ad73018-0x000000006ad774=
57] usable
[    0.000000] reserve setup_data: [mem 0x000000006ad77458-0x0000000076f7ef=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000000076f7f000-0x000000007977ef=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x000000007977f000-0x0000000079f7ef=
ff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x0000000079f7f000-0x0000000079ffef=
ff] ACPI data
[    0.000000] reserve setup_data: [mem 0x0000000079fff000-0x0000000079ffff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000007a000000-0x000000007bffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x000000007d675000-0x00000000ffffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000100000000-0x0000001e7e0bff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000001e7e0c0000-0x00000020b01fff=
ff] reserved
[    0.000000] efi: EFI v2.9 by INSYDE Corp.
[    0.000000] efi: ACPI=3D0x79ffe000 ACPI 2.0=3D0x79ffe014 TPMFinalLog=3D0=
x79f3e000 SMBIOS=3D0x77e75000 SMBIOS 3.0=3D0x77e72000 MEMATTR=3D0x6d116018 =
ESRT=3D0x73531d18 INITRD=3D0x6ad78b18 RNG=3D0x79f93018 TPMEventLog=3D0x79f9=
1018=20
[    0.000000] random: crng init done
[    0.000000] efi: Remove mem60: MMIO range=3D[0x80000000-0xffffffff] (204=
8MB) from e820 map
[    0.000000] e820: remove [mem 0x80000000-0xffffffff] reserved
[    0.000000] efi: Remove mem62: MMIO range=3D[0x2090000000-0x20b01fffff] =
(514MB) from e820 map
[    0.000000] e820: remove [mem 0x2090000000-0x20b01fffff] reserved
[    0.000000] SMBIOS 3.3.0 present.
[    0.000000] DMI: Framework Desktop (AMD Ryzen AI Max 300 Series)/FRANMFC=
P06, BIOS 01.06 03/06/2025
[    0.000000] DMI: Memory slots populated: 8/8
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 2894.486 MHz processor
[    0.000007] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.000008] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000013] last_pfn =3D 0x1e7e0c0 max_arch_pfn =3D 0x400000000
[    0.000019] MTRR map: 8 entries (3 fixed + 5 variable; max 20), built fr=
om 9 variable MTRRs
[    0.000021] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT=
 =20
[    0.000191] last_pfn =3D 0x7a000 max_arch_pfn =3D 0x400000000
[    0.003451] esrt: Reserving ESRT space from 0x0000000073531d18 to 0x0000=
000073531d50.
[    0.003459] e820: update [mem 0x73531000-0x73531fff] usable =3D=3D> rese=
rved
[    0.003472] Using GB pages for direct mapping
[    0.003676] Secure boot disabled
[    0.003677] RAMDISK: [mem 0x61c71000-0x62448fff]
[    0.003688] ACPI: Early table checksum verification disabled
[    0.003691] ACPI: RSDP 0x0000000079FFE014 000024 (v02 INSYDE)
[    0.003694] ACPI: XSDT 0x0000000079FA8228 00019C (v01 INSYDE EDK2     00=
000001      01000013)
[    0.003700] ACPI: FACP 0x0000000079FEE000 000114 (v06 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003705] ACPI: DSDT 0x0000000079FC6000 0074C5 (v02 INSYDE EDK2     00=
040000 ACPI 00040000)
[    0.003706] ACPI: FACS 0x0000000079E32000 000040
[    0.003708] ACPI: UEFI 0x0000000079F66000 0001CF (v01 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003709] ACPI: ASF! 0x0000000079FFC000 000085 (v32 INSYDE EDK2     00=
000002 ACPI 00040000)
[    0.003710] ACPI: SSDT 0x0000000079FF3000 008411 (v02 INSYDE EDK2     00=
000002 ACPI 00040000)
[    0.003712] ACPI: SSDT 0x0000000079FF2000 00033E (v02 INSYDE EDK2     00=
001000 ACPI 00040000)
[    0.003713] ACPI: ASF! 0x0000000079FF0000 0000A5 (v32 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003714] ACPI: BOOT 0x0000000079FEF000 000028 (v01 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003715] ACPI: HPET 0x0000000079FED000 000038 (v01 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003716] ACPI: MCFG 0x0000000079FEC000 00003C (v01 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003718] ACPI: SLIC 0x0000000079FEB000 000176 (v01 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003719] ACPI: APIC 0x0000000079FE1000 00016A (v06 INSYDE EDK2     00=
000002 ACPI 00040000)
[    0.003720] ACPI: SSDT 0x0000000079FE0000 000A6A (v02 INSYDE EDK2     00=
001000 ACPI 00040000)
[    0.003722] ACPI: SSDT 0x0000000079FD5000 00A8CE (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003723] ACPI: VFCT 0x0000000079FD0000 004484 (v01 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003724] ACPI: FPDT 0x0000000079FCF000 000044 (v01 INSYDE EDK2     00=
000002 ACPI 00040000)
[    0.003725] ACPI: SSDT 0x0000000079FCE000 0000FA (v02 INSYDE EDK2     00=
001000 ACPI 00040000)
[    0.003726] ACPI: SSDT 0x0000000079FE8000 0006A2 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003727] ACPI: SSDT 0x0000000079FE7000 0008F9 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003729] ACPI: SSDT 0x0000000079FE4000 001DB7 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003730] ACPI: SSDT 0x0000000079FFD000 000782 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003731] ACPI: SSDT 0x0000000079FE3000 00073F (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003732] ACPI: SSDT 0x0000000079FE2000 000CA9 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003734] ACPI: SSDT 0x0000000079FC3000 002AA6 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003735] ACPI: SSDT 0x0000000079FB9000 009A9F (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003736] ACPI: WSMT 0x0000000079FB7000 000028 (v01 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003737] ACPI: TPM2 0x0000000079FEA000 000050 (v05 INSYDE EDK2     20=
505348 ACPI 00040000)
[    0.003738] ACPI: SSDT 0x0000000079FB5000 001EE8 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003740] ACPI: SSDT 0x0000000079FE9000 00010D (v02 INSYDE EDK2     00=
000004 ACPI 00040000)
[    0.003741] ACPI: SSDT 0x0000000079FB4000 000051 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003742] ACPI: IVRS 0x0000000079FB3000 0001F6 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003743] ACPI: SSDT 0x0000000079FB2000 000B07 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003744] ACPI: SSDT 0x0000000079FB1000 00085D (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003746] ACPI: SSDT 0x0000000079FB0000 000AF4 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003747] ACPI: SSDT 0x0000000079FAF000 000CEE (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003748] ACPI: SSDT 0x0000000079FAE000 000CEE (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003749] ACPI: SSDT 0x0000000079FAD000 0004FC (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003750] ACPI: SSDT 0x0000000079FAC000 00005E (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003752] ACPI: SSDT 0x0000000079FAA000 00188C (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003753] ACPI: SSDT 0x0000000079FA9000 000500 (v02 INSYDE EDK2     00=
000002 ACPI 00040000)
[    0.003754] ACPI: SSDT 0x0000000079FA6000 0010BB (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003755] ACPI: SSDT 0x0000000079F9C000 0097A5 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003756] ACPI: SSDT 0x0000000079F97000 004608 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003757] ACPI: SSDT 0x0000000079FE6000 000A40 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003759] ACPI: SSDT 0x0000000079F96000 0009D0 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003760] ACPI: SSDT 0x0000000079F95000 00008D (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003761] ACPI: SSDT 0x0000000079F94000 000F5C (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003762] ACPI: BGRT 0x0000000079FB8000 000038 (v01 INSYDE EDK2     00=
000002 ACPI 00040000)
[    0.003763] ACPI: Reserving FACP table memory at [mem 0x79fee000-0x79fee=
113]
[    0.003764] ACPI: Reserving DSDT table memory at [mem 0x79fc6000-0x79fcd=
4c4]
[    0.003764] ACPI: Reserving FACS table memory at [mem 0x79e32000-0x79e32=
03f]
[    0.003764] ACPI: Reserving UEFI table memory at [mem 0x79f66000-0x79f66=
1ce]
[    0.003765] ACPI: Reserving ASF! table memory at [mem 0x79ffc000-0x79ffc=
084]
[    0.003765] ACPI: Reserving SSDT table memory at [mem 0x79ff3000-0x79ffb=
410]
[    0.003765] ACPI: Reserving SSDT table memory at [mem 0x79ff2000-0x79ff2=
33d]
[    0.003765] ACPI: Reserving ASF! table memory at [mem 0x79ff0000-0x79ff0=
0a4]
[    0.003765] ACPI: Reserving BOOT table memory at [mem 0x79fef000-0x79fef=
027]
[    0.003766] ACPI: Reserving HPET table memory at [mem 0x79fed000-0x79fed=
037]
[    0.003766] ACPI: Reserving MCFG table memory at [mem 0x79fec000-0x79fec=
03b]
[    0.003766] ACPI: Reserving SLIC table memory at [mem 0x79feb000-0x79feb=
175]
[    0.003766] ACPI: Reserving APIC table memory at [mem 0x79fe1000-0x79fe1=
169]
[    0.003767] ACPI: Reserving SSDT table memory at [mem 0x79fe0000-0x79fe0=
a69]
[    0.003767] ACPI: Reserving SSDT table memory at [mem 0x79fd5000-0x79fdf=
8cd]
[    0.003767] ACPI: Reserving VFCT table memory at [mem 0x79fd0000-0x79fd4=
483]
[    0.003767] ACPI: Reserving FPDT table memory at [mem 0x79fcf000-0x79fcf=
043]
[    0.003767] ACPI: Reserving SSDT table memory at [mem 0x79fce000-0x79fce=
0f9]
[    0.003768] ACPI: Reserving SSDT table memory at [mem 0x79fe8000-0x79fe8=
6a1]
[    0.003768] ACPI: Reserving SSDT table memory at [mem 0x79fe7000-0x79fe7=
8f8]
[    0.003768] ACPI: Reserving SSDT table memory at [mem 0x79fe4000-0x79fe5=
db6]
[    0.003768] ACPI: Reserving SSDT table memory at [mem 0x79ffd000-0x79ffd=
781]
[    0.003769] ACPI: Reserving SSDT table memory at [mem 0x79fe3000-0x79fe3=
73e]
[    0.003769] ACPI: Reserving SSDT table memory at [mem 0x79fe2000-0x79fe2=
ca8]
[    0.003769] ACPI: Reserving SSDT table memory at [mem 0x79fc3000-0x79fc5=
aa5]
[    0.003769] ACPI: Reserving SSDT table memory at [mem 0x79fb9000-0x79fc2=
a9e]
[    0.003770] ACPI: Reserving WSMT table memory at [mem 0x79fb7000-0x79fb7=
027]
[    0.003770] ACPI: Reserving TPM2 table memory at [mem 0x79fea000-0x79fea=
04f]
[    0.003770] ACPI: Reserving SSDT table memory at [mem 0x79fb5000-0x79fb6=
ee7]
[    0.003770] ACPI: Reserving SSDT table memory at [mem 0x79fe9000-0x79fe9=
10c]
[    0.003771] ACPI: Reserving SSDT table memory at [mem 0x79fb4000-0x79fb4=
050]
[    0.003771] ACPI: Reserving IVRS table memory at [mem 0x79fb3000-0x79fb3=
1f5]
[    0.003771] ACPI: Reserving SSDT table memory at [mem 0x79fb2000-0x79fb2=
b06]
[    0.003771] ACPI: Reserving SSDT table memory at [mem 0x79fb1000-0x79fb1=
85c]
[    0.003772] ACPI: Reserving SSDT table memory at [mem 0x79fb0000-0x79fb0=
af3]
[    0.003772] ACPI: Reserving SSDT table memory at [mem 0x79faf000-0x79faf=
ced]
[    0.003772] ACPI: Reserving SSDT table memory at [mem 0x79fae000-0x79fae=
ced]
[    0.003772] ACPI: Reserving SSDT table memory at [mem 0x79fad000-0x79fad=
4fb]
[    0.003772] ACPI: Reserving SSDT table memory at [mem 0x79fac000-0x79fac=
05d]
[    0.003773] ACPI: Reserving SSDT table memory at [mem 0x79faa000-0x79fab=
88b]
[    0.003773] ACPI: Reserving SSDT table memory at [mem 0x79fa9000-0x79fa9=
4ff]
[    0.003773] ACPI: Reserving SSDT table memory at [mem 0x79fa6000-0x79fa7=
0ba]
[    0.003773] ACPI: Reserving SSDT table memory at [mem 0x79f9c000-0x79fa5=
7a4]
[    0.003774] ACPI: Reserving SSDT table memory at [mem 0x79f97000-0x79f9b=
607]
[    0.003774] ACPI: Reserving SSDT table memory at [mem 0x79fe6000-0x79fe6=
a3f]
[    0.003774] ACPI: Reserving SSDT table memory at [mem 0x79f96000-0x79f96=
9cf]
[    0.003774] ACPI: Reserving SSDT table memory at [mem 0x79f95000-0x79f95=
08c]
[    0.003775] ACPI: Reserving SSDT table memory at [mem 0x79f94000-0x79f94=
f5b]
[    0.003775] ACPI: Reserving BGRT table memory at [mem 0x79fb8000-0x79fb8=
037]
[    0.003840] No NUMA configuration found
[    0.003841] Faking a node at [mem 0x0000000000000000-0x0000001e7e0bffff]
[    0.003845] NODE_DATA(0) allocated [mem 0x1e7e0952c0-0x1e7e0bffff]
[    0.003975] Zone ranges:
[    0.003976]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.003977]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.003978]   Normal   [mem 0x0000000100000000-0x0000001e7e0bffff]
[    0.003978]   Device   empty
[    0.003979] Movable zone start for each node
[    0.003979] Early memory node ranges
[    0.003980]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.003980]   node   0: [mem 0x0000000000100000-0x0000000009afffff]
[    0.003981]   node   0: [mem 0x0000000009e00000-0x0000000009efffff]
[    0.003981]   node   0: [mem 0x0000000009f88000-0x0000000066b53fff]
[    0.003981]   node   0: [mem 0x000000006ad54000-0x000000006ad66fff]
[    0.003982]   node   0: [mem 0x000000006ad6c000-0x0000000076f7efff]
[    0.003982]   node   0: [mem 0x0000000079fff000-0x0000000079ffffff]
[    0.003982]   node   0: [mem 0x0000000100000000-0x0000001e7e0bffff]
[    0.003987] Initmem setup node 0 [mem 0x0000000000001000-0x0000001e7e0bf=
fff]
[    0.003992] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.004000] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.004063] On node 0, zone DMA32: 768 pages in unavailable ranges
[    0.004695] On node 0, zone DMA32: 136 pages in unavailable ranges
[    0.004742] On node 0, zone DMA32: 16896 pages in unavailable ranges
[    0.004826] On node 0, zone DMA32: 5 pages in unavailable ranges
[    0.004861] On node 0, zone DMA32: 12416 pages in unavailable ranges
[    0.065256] On node 0, zone Normal: 24576 pages in unavailable ranges
[    0.065283] On node 0, zone Normal: 8000 pages in unavailable ranges
[    0.065817] ACPI: PM-Timer IO Port: 0x408
[    0.065828] ACPI: X2APIC_NMI (uid[0xffffffff] high level lint[0x1])
[    0.065830] ACPI: LAPIC_NMI (acpi_id[0xff] high level lint[0x1])
[    0.065843] IOAPIC[0]: apic_id 33, version 33, address 0xfec00000, GSI 0=
-23
[    0.065848] IOAPIC[1]: apic_id 34, version 33, address 0xfd280000, GSI 2=
4-55
[    0.065849] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.065850] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.065853] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.065854] ACPI: HPET id: 0x10228201 base: 0xfed00000
[    0.065866] e820: update [mem 0x6d146000-0x6d194fff] usable =3D=3D> rese=
rved
[    0.065879] CPU topo: Max. logical packages:   1
[    0.065880] CPU topo: Max. logical dies:       2
[    0.065880] CPU topo: Max. dies per package:   2
[    0.065882] CPU topo: Max. threads per core:   2
[    0.065883] CPU topo: Num. cores per package:    16
[    0.065883] CPU topo: Num. threads per package:  32
[    0.065883] CPU topo: Allowing 32 present CPUs plus 0 hotplug CPUs
[    0.065896] PM: hibernation: Registered nosave memory: [mem 0x00000000-0=
x00000fff]
[    0.065897] PM: hibernation: Registered nosave memory: [mem 0x0009f000-0=
x000fffff]
[    0.065897] PM: hibernation: Registered nosave memory: [mem 0x09b00000-0=
x09dfffff]
[    0.065898] PM: hibernation: Registered nosave memory: [mem 0x09f00000-0=
x09f87fff]
[    0.065899] PM: hibernation: Registered nosave memory: [mem 0x66b54000-0=
x6ad53fff]
[    0.065899] PM: hibernation: Registered nosave memory: [mem 0x6ad67000-0=
x6ad6bfff]
[    0.065900] PM: hibernation: Registered nosave memory: [mem 0x6ad73000-0=
x6ad73fff]
[    0.065900] PM: hibernation: Registered nosave memory: [mem 0x6ad77000-0=
x6ad77fff]
[    0.065901] PM: hibernation: Registered nosave memory: [mem 0x6d146000-0=
x6d194fff]
[    0.065901] PM: hibernation: Registered nosave memory: [mem 0x73531000-0=
x73531fff]
[    0.065902] PM: hibernation: Registered nosave memory: [mem 0x76f7f000-0=
x7977efff]
[    0.065902] PM: hibernation: Registered nosave memory: [mem 0x7977f000-0=
x79f7efff]
[    0.065902] PM: hibernation: Registered nosave memory: [mem 0x79f7f000-0=
x79ffefff]
[    0.065903] PM: hibernation: Registered nosave memory: [mem 0x7a000000-0=
x7bffffff]
[    0.065903] PM: hibernation: Registered nosave memory: [mem 0x7c000000-0=
x7d674fff]
[    0.065903] PM: hibernation: Registered nosave memory: [mem 0x7d675000-0=
x7fffffff]
[    0.065903] PM: hibernation: Registered nosave memory: [mem 0x80000000-0=
xffffffff]
[    0.065905] [mem 0x80000000-0xffffffff] available for PCI devices
[    0.065906] Booting paravirtualized kernel on bare hardware
[    0.065908] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 1910969940391419 ns
[    0.069393] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:32 nr_cpu_ids:32 =
nr_node_ids:1
[    0.069971] percpu: Embedded 67 pages/cpu s237568 r8192 d28672 u524288
[    0.069974] pcpu-alloc: s237568 r8192 d28672 u524288 alloc=3D1*2097152
[    0.069976] pcpu-alloc: [0] 00 01 02 03 [0] 04 05 06 07=20
[    0.069978] pcpu-alloc: [0] 08 09 10 11 [0] 12 13 14 15=20
[    0.069979] pcpu-alloc: [0] 16 17 18 19 [0] 20 21 22 23=20
[    0.069981] pcpu-alloc: [0] 24 25 26 27 [0] 28 29 30 31=20
[    0.069991] Kernel command line: BOOT_IMAGE=3D/vmlinuz-linux root=3DUUID=
=3D46308bde-204e-42aa-947e-08da42de7b3a rw rootflags=3Dsubvol=3Droot loglev=
el=3D9 console=3DttyS4,115200 console=3Dtty0
[    0.070037] Unknown kernel command line parameters "BOOT_IMAGE=3D/vmlinu=
z-linux", will be passed to user space.
[    0.070052] printk: log_buf_len individual max cpu contribution: 4096 by=
tes
[    0.070053] printk: log_buf_len total cpu_extra contributions: 126976 by=
tes
[    0.070054] printk: log_buf_len min size: 131072 bytes
[    0.070125] printk: log buffer data + meta data: 262144 + 917504 =3D 117=
9648 bytes
[    0.070126] printk: early log buf free: 112248(85%)
[    0.072095] Dentry cache hash table entries: 8388608 (order: 14, 6710886=
4 bytes, linear)
[    0.073115] Inode-cache hash table entries: 4194304 (order: 13, 33554432=
 bytes, linear)
[    0.073247] Fallback order for Node 0: 0=20
[    0.073254] Built 1 zonelists, mobility grouping on.  Total pages: 31394=
385
[    0.073254] Policy zone: Normal
[    0.073343] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.073395] software IO TLB: area num 32.
[    0.168695] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D32, =
Nodes=3D1
[    0.168738] ftrace: allocating 55505 entries in 217 pages
[    0.198177] ftrace: allocated 217 pages with 5 groups
[    0.198246] Dynamic Preempt: full
[    0.198326] rcu: Preemptible hierarchical RCU implementation.
[    0.198327] rcu:     RCU restricting CPUs from NR_CPUS=3D8192 to nr_cpu_=
ids=3D32.
[    0.198327] rcu:     RCU priority boosting: priority 1 delay 500 ms.
[    0.198328]  Trampoline variant of Tasks RCU enabled.
[    0.198329]  Rude variant of Tasks RCU enabled.
[    0.198329]  Tracing variant of Tasks RCU enabled.
[    0.198330] rcu: RCU calculated value of scheduler-enlistment delay is 1=
00 jiffies.
[    0.198330] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D32
[    0.198341] RCU Tasks: Setting shift to 5 and lim to 1 rcu_task_cb_adjus=
t=3D1 rcu_task_cpu_ids=3D32.
[    0.198344] RCU Tasks Rude: Setting shift to 5 and lim to 1 rcu_task_cb_=
adjust=3D1 rcu_task_cpu_ids=3D32.
[    0.198346] RCU Tasks Trace: Setting shift to 5 and lim to 1 rcu_task_cb=
_adjust=3D1 rcu_task_cpu_ids=3D32.
[    0.200852] NR_IRQS: 524544, nr_irqs: 1224, preallocated irqs: 16
[    0.201069] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    0.201188] kfence: initialized - using 2097152 bytes for 255 objects at=
 0x(____ptrval____)-0x(____ptrval____)
[    0.201222] Console: colour dummy device 80x25
[    0.201224] printk: legacy console [tty0] enabled
[    0.201422] ACPI: Core revision 20240827
[    0.201625] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, =
max_idle_ns: 133484873504 ns
[    0.201646] APIC: Switch to symmetric I/O mode setup
[    0.201862] AMD-Vi: ivrs, add hid:AMDI0020, uid:ID00, rdevid:0xa0
[    0.201864] AMD-Vi: ivrs, add hid:AMDI0020, uid:ID01, rdevid:0xa0
[    0.201865] AMD-Vi: ivrs, add hid:AMDI0020, uid:ID02, rdevid:0xa0
[    0.201866] AMD-Vi: ivrs, add hid:AMDI0020, uid:ID03, rdevid:0xa0
[    0.201867] AMD-Vi: ivrs, add hid:MSFT0201, uid:1, rdevid:0x60
[    0.201868] AMD-Vi: ivrs, add hid:AMDI0020, uid:ID04, rdevid:0xa0
[    0.201869] AMD-Vi: Using global IVHD EFR:0x246577efa2254afa, EFR2:0x10
[    0.203114] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    0.207651] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:=
 0x29b8ea1ed97, max_idle_ns: 440795276026 ns
[    0.207654] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 5788.97 BogoMIPS (lpj=3D2894486)
[    0.207672] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.207729] LVT offset 1 assigned for vector 0xf9
[    0.207918] LVT offset 2 assigned for vector 0xf4
[    0.207976] Last level iTLB entries: 4KB 64, 2MB 64, 4MB 32
[    0.207977] Last level dTLB entries: 4KB 128, 2MB 128, 4MB 64, 1GB 0
[    0.207979] process: using mwait in idle threads
[    0.207982] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user=
 pointer sanitization
[    0.207985] Spectre V2 : Mitigation: Enhanced / Automatic IBRS
[    0.207986] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on context switch
[    0.207989] Spectre V2 : mitigation: Enabling conditional Indirect Branc=
h Prediction Barrier
[    0.207990] Spectre V2 : User space: Mitigation: STIBP always-on protect=
ion
[    0.207992] Speculative Store Bypass: Mitigation: Speculative Store Bypa=
ss disabled via prctl
[    0.207994] Speculative Return Stack Overflow: Mitigation: IBPB on VMEXI=
T only
[    0.208000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
 registers'
[    0.208002] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.208003] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.208005] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
[    0.208006] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
[    0.208007] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256'
[    0.208008] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys Us=
er registers'
[    0.208009] x86/fpu: Supporting XSAVE feature 0x800: 'Control-flow User =
registers'
[    0.208011] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.208013] x86/fpu: xstate_offset[5]:  832, xstate_sizes[5]:   64
[    0.208014] x86/fpu: xstate_offset[6]:  896, xstate_sizes[6]:  512
[    0.208015] x86/fpu: xstate_offset[7]: 1408, xstate_sizes[7]: 1024
[    0.208016] x86/fpu: xstate_offset[9]: 2432, xstate_sizes[9]:    8
[    0.208017] x86/fpu: xstate_offset[11]: 2440, xstate_sizes[11]:   16
[    0.208018] x86/fpu: Enabled xstate features 0xae7, context size is 2456=
 bytes, using 'compacted' format.
[    0.226169] Freeing SMP alternatives memory: 48K
[    0.226172] pid_max: default: 32768 minimum: 301
[    0.227677] LSM: initializing lsm=3Dcapability,landlock,lockdown,yama,bpf
[    0.227740] landlock: Up and running.
[    0.227743] Yama: becoming mindful.
[    0.227906] LSM support for eBPF active
[    0.227964] Mount-cache hash table entries: 131072 (order: 8, 1048576 by=
tes, linear)
[    0.228007] Mountpoint-cache hash table entries: 131072 (order: 8, 10485=
76 bytes, linear)
[    0.331685] smpboot: CPU0: AMD Eng Sample: 100-000001243-50_Y (family: 0=
x1a, model: 0x70, stepping: 0x0)
[    0.331797] Performance Events: Fam17h+ 16-deep LBR, core perfctr, AMD P=
MU driver.
[    0.331820] ... version:                2
[    0.331821] ... bit width:              48
[    0.331821] ... generic registers:      6
[    0.331822] ... value mask:             0000ffffffffffff
[    0.331823] ... max period:             00007fffffffffff
[    0.331824] ... fixed-purpose events:   0
[    0.331824] ... event mask:             000000000000003f
[    0.331900] signal: max sigframe size: 3376
[    0.331919] rcu: Hierarchical SRCU implementation.
[    0.331920] rcu:     Max phase no-delay instances is 400.
[    0.331949] Timer migration: 2 hierarchy levels; 8 children per group; 2=
 crossnode level
[    0.332076] MCE: In-kernel MCE decoding enabled.
[    0.332099] NMI watchdog: Enabled. Permanently consumes one hw-PMU count=
er.
[    0.332205] smp: Bringing up secondary CPUs ...
[    0.332251] smpboot: x86: Booting SMP configuration:
[    0.332253] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7  #8  =
#9 #10 #11 #12 #13 #14 #15 #16 #17 #18 #19 #20 #21 #22 #23 #24 #25 #26 #27 =
#28 #29 #30 #31
[    0.338822] Spectre V2 : Update user space SMT mitigation: STIBP always-=
on
[    0.340728] smp: Brought up 1 node, 32 CPUs
[    0.340728] smpboot: Total of 32 processors activated (185247.10 BogoMIP=
S)
[    0.341894] Memory: 123331268K/125577540K available (19189K kernel code,=
 2903K rwdata, 16268K rodata, 4532K init, 4964K bss, 2207632K reserved, 0K =
cma-reserved)
[    0.343232] devtmpfs: initialized
[    0.343232] x86/mm: Memory block size: 2048MB
[    0.343888] ACPI: PM: Registering ACPI NVS region [mem 0x09f00000-0x09f8=
7fff] (557056 bytes)
[    0.343888] ACPI: PM: Registering ACPI NVS region [mem 0x7977f000-0x79f7=
efff] (8388608 bytes)
[    0.343888] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 1911260446275000 ns
[    0.343888] futex hash table entries: 8192 (order: 7, 524288 bytes, line=
ar)
[    0.343888] pinctrl core: initialized pinctrl subsystem
[    0.343925] PM: RTC time: 19:10:27, date: 2025-04-04
[    0.344162] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.344354] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic alloca=
tions
[    0.344494] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomi=
c allocations
[    0.344700] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for ato=
mic allocations
[    0.344706] audit: initializing netlink subsys (disabled)
[    0.344710] audit: type=3D2000 audit(1743793827.142:1): state=3Dinitiali=
zed audit_enabled=3D0 res=3D1
[    0.344713] thermal_sys: Registered thermal governor 'fair_share'
[    0.344714] thermal_sys: Registered thermal governor 'bang_bang'
[    0.344717] thermal_sys: Registered thermal governor 'step_wise'
[    0.344718] thermal_sys: Registered thermal governor 'user_space'
[    0.344719] thermal_sys: Registered thermal governor 'power_allocator'
[    0.344724] cpuidle: using governor ladder
[    0.344724] cpuidle: using governor menu
[    0.344749] Simple Boot Flag at 0x44 set to 0x1
[    0.344749] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.344794] PCI: ECAM [mem 0xe0000000-0xefffffff] (base 0xe0000000) for =
domain 0000 [bus 00-ff]
[    0.344809] PCI: Using configuration type 1 for base access
[    0.344876] kprobes: kprobe jump-optimization is enabled. All kprobes ar=
e optimized if possible.
[    0.345673] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.345675] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.345676] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.345677] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.345700] raid6: skipped pq benchmark and selected avx512x4
[    0.345700] raid6: using avx512x2 recovery algorithm
[    0.345700] fbcon: Taking over console
[    0.345729] ACPI: Added _OSI(Module Device)
[    0.345730] ACPI: Added _OSI(Processor Device)
[    0.345731] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.345732] ACPI: Added _OSI(Processor Aggregator Device)
[    0.353018] ACPI: 33 ACPI AML tables successfully acquired and loaded
[    0.358437] ACPI: USB4 _OSC: OS supports USB3+ DisplayPort+ PCIe+ XDomai=
n+
[    0.358439] ACPI: USB4 _OSC: OS controls USB3+ DisplayPort+ PCIe+ XDomai=
n+
[    0.358747] ACPI: EC: EC started
[    0.358748] ACPI: EC: interrupt blocked
[    0.358924] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    0.358926] ACPI: \_SB_.PCI0.LPC0.EC0_: Boot DSDT EC used to handle tran=
sactions
[    0.358928] ACPI: Interpreter enabled
[    0.358937] ACPI: PM: (supports S0 S4 S5)
[    0.358938] ACPI: Using IOAPIC for interrupt routing
[    0.359213] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    0.359215] PCI: Ignoring E820 reservations for host bridge windows
[    0.359429] ACPI: Enabled 3 GPEs in block 00 to 1F
[    0.360502] ACPI: \_SB_.PCI0.GPP0.PWRS: New power resource
[    0.360958] ACPI: \_SB_.PCI0.GPP0.SWUS.PWRS: New power resource
[    0.361421] ACPI: \_SB_.PCI0.GPP1.PWRS: New power resource
[    0.361866] ACPI: \_SB_.PCI0.GPP1.SWUS.PWRS: New power resource
[    0.361970] ACPI: \_SB_.PCI0.GPP3.PWRS: New power resource
[    0.362249] ACPI: \_SB_.PCI0.GPP4.PWRS: New power resource
[    0.362506] ACPI: \_SB_.PCI0.GPP5.PWRS: New power resource
[    0.362823] ACPI: \_SB_.PCI0.GPP7.P0NV: New power resource
[    0.363242] ACPI: \_SB_.PCI0.GPP9.P0NV: New power resource
[    0.363659] ACPI: \_SB_.PCI0.GPPA.PWRS: New power resource
[    0.363748] ACPI: \_SB_.PCI0.GPPA.VGA_.PWRS: New power resource
[    0.363860] ACPI: \_SB_.PCI0.GPPA.ACP_.PWRS: New power resource
[    0.363978] ACPI: \_SB_.PCI0.GPPA.AZAL.PWRS: New power resource
[    0.364116] ACPI: \_SB_.PCI0.GPPA.HDAU.PWRS: New power resource
[    0.364273] ACPI: \_SB_.PCI0.GPPA.XHC1.PWRS: New power resource
[    0.364920] ACPI: \_SB_.PCI0.GPPC.XHC0.PWRS: New power resource
[    0.365730] ACPI: \_SB_.PCI0.GPPC.XHC3.PWRS: New power resource
[    0.366188] ACPI: \_SB_.PCI0.GPPC.XHC4.PWRS: New power resource
[    0.366668] ACPI: \_SB_.PCI0.GPPC.NHI0.PWRS: New power resource
[    0.366955] ACPI: \_SB_.PCI0.GPPC.NHI1.PWRS: New power resource
[    0.368560] ACPI: \_SB_.PRWL: New power resource
[    0.368569] ACPI: \_SB_.PRWB: New power resource
[    0.369021] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.369025] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI EDR HPX-Type3]
[    0.369055] acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplu=
g AER]
[    0.369101] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME PCIe=
Capability LTR DPC]
[    0.369322] PCI host bridge to bus 0000:00
[    0.369325] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.369327] pci_bus 0000:00: root bus resource [io  0x0d00-0xfeff window]
[    0.369328] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bfff=
f window]
[    0.369329] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000cfff=
f window]
[    0.369331] pci_bus 0000:00: root bus resource [mem 0x000d0000-0x000efff=
f window]
[    0.369332] pci_bus 0000:00: root bus resource [mem 0x80000000-0xdffffff=
f window]
[    0.369333] pci_bus 0000:00: root bus resource [mem 0xf0000000-0xfcfffff=
f window]
[    0.369334] pci_bus 0000:00: root bus resource [mem 0xfec00000-0xfec01ff=
f window]
[    0.369335] pci_bus 0000:00: root bus resource [mem 0xfed45000-0xfed811f=
f window]
[    0.369336] pci_bus 0000:00: root bus resource [mem 0xfed81900-0xfed81ff=
f window]
[    0.369337] pci_bus 0000:00: root bus resource [mem 0xfedc0000-0xfedc0ff=
f window]
[    0.369338] pci_bus 0000:00: root bus resource [mem 0xfedc6000-0xfedc6ff=
f window]
[    0.369339] pci_bus 0000:00: root bus resource [mem 0xfee01000-0xfffffff=
f window]
[    0.369340] pci_bus 0000:00: root bus resource [mem 0x20b0200000-0x9b4ff=
fffff window]
[    0.369342] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.369356] pci 0000:00:00.0: [1022:1507] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.369435] pci 0000:00:00.2: [1022:1508] type 00 class 0x080600 convent=
ional PCI endpoint
[    0.369499] pci 0000:00:01.0: [1022:1509] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.369552] pci 0000:00:01.1: [1022:150a] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.369758] pci 0000:00:01.1: PCI bridge to [bus 01-5f]
[    0.369764] pci 0000:00:01.1:   bridge window [io  0x7000-0xafff]
[    0.369768] pci 0000:00:01.1:   bridge window [mem 0xac000000-0xc3ffffff]
[    0.369808] pci 0000:00:01.1:   bridge window [mem 0x4800000000-0x67ffff=
ffff 64bit pref]
[    0.369982] pci 0000:00:01.1: PME# supported from D0 D3hot D3cold
[    0.370448] pci 0000:00:01.2: [1022:150a] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.370681] pci 0000:00:01.2: PCI bridge to [bus 60-be]
[    0.370687] pci 0000:00:01.2:   bridge window [io  0x3000-0x6fff]
[    0.370690] pci 0000:00:01.2:   bridge window [mem 0x94000000-0xabffffff]
[    0.370731] pci 0000:00:01.2:   bridge window [mem 0x2800000000-0x47ffff=
ffff 64bit pref]
[    0.370900] pci 0000:00:01.2: PME# supported from D0 D3hot D3cold
[    0.371350] pci 0000:00:02.0: [1022:1509] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.371399] pci 0000:00:02.1: [1022:150b] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.371415] pci 0000:00:02.1: PCI bridge to [bus bf]
[    0.371420] pci 0000:00:02.1:   bridge window [io  0x2000-0x2fff]
[    0.371422] pci 0000:00:02.1:   bridge window [mem 0x90f00000-0x90ffffff]
[    0.371485] pci 0000:00:02.1: PME# supported from D0 D3hot D3cold
[    0.371599] pci 0000:00:02.3: [1022:150b] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.371616] pci 0000:00:02.3: PCI bridge to [bus c0]
[    0.371621] pci 0000:00:02.3:   bridge window [mem 0x90400000-0x906fffff]
[    0.371696] pci 0000:00:02.3: PME# supported from D0 D3hot D3cold
[    0.371811] pci 0000:00:02.5: [1022:150b] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.371827] pci 0000:00:02.5: PCI bridge to [bus c1]
[    0.371833] pci 0000:00:02.5:   bridge window [mem 0x90e00000-0x90efffff]
[    0.371894] pci 0000:00:02.5: PME# supported from D0 D3hot D3cold
[    0.372001] pci 0000:00:03.0: [1022:1509] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.372070] pci 0000:00:03.1: [1022:150b] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.372103] pci 0000:00:03.1: PCI bridge to [bus c2]
[    0.372120] pci 0000:00:03.1:   bridge window [mem 0x90d00000-0x90dfffff]
[    0.372220] pci 0000:00:03.1: PME# supported from D0 D3hot D3cold
[    0.372399] pci 0000:00:08.0: [1022:1509] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.372454] pci 0000:00:08.1: [1022:150c] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.372471] pci 0000:00:08.1: PCI bridge to [bus c3]
[    0.372475] pci 0000:00:08.1:   bridge window [io  0x1000-0x1fff]
[    0.372478] pci 0000:00:08.1:   bridge window [mem 0x80000000-0x903fffff]
[    0.372484] pci 0000:00:08.1:   bridge window [mem 0x6800000000-0x69ffff=
ffff 64bit pref]
[    0.372492] pci 0000:00:08.1: enabling Extended Tags
[    0.372540] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
[    0.372638] pci 0000:00:08.2: [1022:150c] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.372663] pci 0000:00:08.2: PCI bridge to [bus c4]
[    0.372668] pci 0000:00:08.2:   bridge window [mem 0x90b00000-0x90cfffff]
[    0.372675] pci 0000:00:08.2:   bridge window [mem 0x6a00000000-0x6a000f=
ffff 64bit pref]
[    0.372682] pci 0000:00:08.2: enabling Extended Tags
[    0.372730] pci 0000:00:08.2: PME# supported from D0 D3hot D3cold
[    0.372821] pci 0000:00:08.3: [1022:150c] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.372838] pci 0000:00:08.3: PCI bridge to [bus c5]
[    0.372843] pci 0000:00:08.3:   bridge window [mem 0x90700000-0x90afffff]
[    0.372856] pci 0000:00:08.3: enabling Extended Tags
[    0.372904] pci 0000:00:08.3: PME# supported from D0 D3hot D3cold
[    0.373070] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500 convent=
ional PCI endpoint
[    0.373147] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100 convent=
ional PCI endpoint
[    0.373231] pci 0000:00:18.0: [1022:12b8] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.373255] pci 0000:00:18.1: [1022:12b9] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.373280] pci 0000:00:18.2: [1022:12ba] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.373305] pci 0000:00:18.3: [1022:12bb] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.373329] pci 0000:00:18.4: [1022:12bc] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.373354] pci 0000:00:18.5: [1022:12bd] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.373378] pci 0000:00:18.6: [1022:12be] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.373402] pci 0000:00:18.7: [1022:12bf] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.373525] pci 0000:00:01.1: PCI bridge to [bus 01-5f]
[    0.373636] pci 0000:00:01.2: PCI bridge to [bus 60-be]
[    0.373729] pci 0000:bf:00.0: [10ec:8126] type 00 class 0x020000 PCIe En=
dpoint
[    0.373775] pci 0000:bf:00.0: BAR 0 [io  0x2000-0x20ff]
[    0.373781] pci 0000:bf:00.0: BAR 2 [mem 0x90f00000-0x90f0ffff 64bit]
[    0.373784] pci 0000:bf:00.0: BAR 4 [mem 0x90f10000-0x90f13fff 64bit]
[    0.373892] pci 0000:bf:00.0: supports D1 D2
[    0.373893] pci 0000:bf:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.374150] pci 0000:00:02.1: PCI bridge to [bus bf]
[    0.374399] pci 0000:c0:00.0: [14c3:0717] type 00 class 0x028000 PCIe En=
dpoint
[    0.374451] pci 0000:c0:00.0: BAR 0 [mem 0x90400000-0x905fffff 64bit]
[    0.374455] pci 0000:c0:00.0: BAR 2 [mem 0x90600000-0x90607fff 64bit]
[    0.374535] pci 0000:c0:00.0: PME# supported from D0 D3hot D3cold
[    0.375194] pci 0000:00:02.3: PCI bridge to [bus c0]
[    0.375407] pci 0000:c1:00.0: [15b7:5049] type 00 class 0x010802 PCIe En=
dpoint
[    0.375442] pci 0000:c1:00.0: BAR 0 [mem 0x90e00000-0x90e03fff 64bit]
[    0.375668] pci 0000:00:02.5: PCI bridge to [bus c1]
[    0.375897] pci 0000:c2:00.0: [15b7:5017] type 00 class 0x010802 PCIe En=
dpoint
[    0.375927] pci 0000:c2:00.0: BAR 0 [mem 0x90d00000-0x90d03fff 64bit]
[    0.376120] pci 0000:00:03.1: PCI bridge to [bus c2]
[    0.376186] pci 0000:c3:00.0: [1002:1586] type 00 class 0x038000 PCIe Le=
gacy Endpoint
[    0.376212] pci 0000:c3:00.0: BAR 0 [mem 0x6800000000-0x69ffffffff 64bit=
 pref]
[    0.376215] pci 0000:c3:00.0: BAR 2 [mem 0x80000000-0x8fffffff 64bit pre=
f]
[    0.376217] pci 0000:c3:00.0: BAR 4 [io  0x1000-0x10ff]
[    0.376218] pci 0000:c3:00.0: BAR 5 [mem 0x90200000-0x902fffff]
[    0.376223] pci 0000:c3:00.0: enabling Extended Tags
[    0.376283] pci 0000:c3:00.0: PME# supported from D1 D2 D3hot D3cold
[    0.376392] pci 0000:c3:00.1: [1002:1640] type 00 class 0x040300 PCIe Le=
gacy Endpoint
[    0.376416] pci 0000:c3:00.1: BAR 0 [mem 0x90308000-0x9030bfff]
[    0.376424] pci 0000:c3:00.1: enabling Extended Tags
[    0.376458] pci 0000:c3:00.1: PME# supported from D1 D2 D3hot D3cold
[    0.376518] pci 0000:c3:00.2: [1022:17e0] type 00 class 0x108000 PCIe En=
dpoint
[    0.376543] pci 0000:c3:00.2: BAR 2 [mem 0x90100000-0x901fffff]
[    0.376546] pci 0000:c3:00.2: BAR 5 [mem 0x9030c000-0x9030dfff]
[    0.376551] pci 0000:c3:00.2: enabling Extended Tags
[    0.376645] pci 0000:c3:00.4: [1022:1587] type 00 class 0x0c0330 PCIe En=
dpoint
[    0.376671] pci 0000:c3:00.4: BAR 0 [mem 0x90000000-0x900fffff 64bit]
[    0.376679] pci 0000:c3:00.4: enabling Extended Tags
[    0.376714] pci 0000:c3:00.4: PME# supported from D0 D3hot D3cold
[    0.376776] pci 0000:c3:00.6: [1022:15e3] type 00 class 0x040300 PCIe En=
dpoint
[    0.376800] pci 0000:c3:00.6: BAR 0 [mem 0x90300000-0x90307fff]
[    0.376808] pci 0000:c3:00.6: enabling Extended Tags
[    0.376841] pci 0000:c3:00.6: PME# supported from D0 D3hot D3cold
[    0.376924] pci 0000:00:08.1: PCI bridge to [bus c3]
[    0.376969] pci 0000:c4:00.0: [1022:150d] type 00 class 0x130000 PCIe En=
dpoint
[    0.377000] pci 0000:c4:00.0: enabling Extended Tags
[    0.377125] pci 0000:c4:00.1: [1022:17f0] type 00 class 0x118000 PCIe En=
dpoint
[    0.377153] pci 0000:c4:00.1: BAR 0 [mem 0x90b00000-0x90bfffff]
[    0.377155] pci 0000:c4:00.1: BAR 1 [mem 0x90c00000-0x90c01fff]
[    0.377157] pci 0000:c4:00.1: BAR 2 [mem 0x6a00000000-0x6a0007ffff 64bit=
 pref]
[    0.377159] pci 0000:c4:00.1: BAR 4 [mem 0x90c03000-0x90c03fff]
[    0.377160] pci 0000:c4:00.1: BAR 5 [mem 0x90c02000-0x90c02fff]
[    0.377166] pci 0000:c4:00.1: enabling Extended Tags
[    0.377283] pci 0000:00:08.2: PCI bridge to [bus c4]
[    0.377335] pci 0000:c5:00.0: [1022:1588] type 00 class 0x0c0330 PCIe En=
dpoint
[    0.377361] pci 0000:c5:00.0: BAR 0 [mem 0x90700000-0x907fffff 64bit]
[    0.377369] pci 0000:c5:00.0: enabling Extended Tags
[    0.377414] pci 0000:c5:00.0: PME# supported from D0 D3hot D3cold
[    0.377507] pci 0000:c5:00.3: [1022:1589] type 00 class 0x0c0330 PCIe En=
dpoint
[    0.377533] pci 0000:c5:00.3: BAR 0 [mem 0x90800000-0x908fffff 64bit]
[    0.377541] pci 0000:c5:00.3: enabling Extended Tags
[    0.377576] pci 0000:c5:00.3: PME# supported from D0 D3hot D3cold
[    0.377640] pci 0000:c5:00.4: [1022:158b] type 00 class 0x0c0330 PCIe En=
dpoint
[    0.377666] pci 0000:c5:00.4: BAR 0 [mem 0x90900000-0x909fffff 64bit]
[    0.377674] pci 0000:c5:00.4: enabling Extended Tags
[    0.377710] pci 0000:c5:00.4: PME# supported from D0 D3hot D3cold
[    0.377771] pci 0000:c5:00.5: [1022:158d] type 00 class 0x0c0340 PCIe En=
dpoint
[    0.377801] pci 0000:c5:00.5: BAR 0 [mem 0x90a00000-0x90a7ffff 64bit]
[    0.377810] pci 0000:c5:00.5: Max Payload Size set to 128 (was 256, max =
256)
[    0.377812] pci 0000:c5:00.5: enabling Extended Tags
[    0.377848] pci 0000:c5:00.5: PME# supported from D0 D3hot D3cold
[    0.377911] pci 0000:c5:00.6: [1022:158e] type 00 class 0x0c0340 PCIe En=
dpoint
[    0.377941] pci 0000:c5:00.6: BAR 0 [mem 0x90a80000-0x90afffff 64bit]
[    0.377949] pci 0000:c5:00.6: Max Payload Size set to 128 (was 256, max =
256)
[    0.377952] pci 0000:c5:00.6: enabling Extended Tags
[    0.377987] pci 0000:c5:00.6: PME# supported from D0 D3hot D3cold
[    0.378070] pci 0000:00:08.3: PCI bridge to [bus c5]
[    0.389047] Low-power S0 idle used by default for system suspend
[    0.389118] ACPI: EC: interrupt unblocked
[    0.389119] ACPI: EC: event unblocked
[    0.389123] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    0.389124] ACPI: EC: GPE=3D0xa
[    0.389125] ACPI: \_SB_.PCI0.LPC0.EC0_: Boot DSDT EC initialization comp=
lete
[    0.389127] ACPI: \_SB_.PCI0.LPC0.EC0_: EC: Used to handle transactions =
and events
[    0.389156] iommu: Default domain type: Translated
[    0.389156] iommu: DMA domain TLB invalidation policy: lazy mode
[    0.389156] SCSI subsystem initialized
[    0.389156] libata version 3.00 loaded.
[    0.389156] ACPI: bus type USB registered
[    0.389156] usbcore: registered new interface driver usbfs
[    0.389156] usbcore: registered new interface driver hub
[    0.389156] usbcore: registered new device driver usb
[    0.397849] EDAC MC: Ver: 3.0.0
[    0.398668] efivars: Registered efivars operations
[    0.398749] NetLabel: Initializing
[    0.398749] NetLabel:  domain hash size =3D 128
[    0.398749] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.398749] NetLabel:  unlabeled traffic allowed by default
[    0.398749] mctp: management component transport protocol core
[    0.398749] NET: Registered PF_MCTP protocol family
[    0.398749] PCI: Using ACPI for IRQ routing
[    0.406926] PCI: pci_cache_line_size set to 64 bytes
[    0.407681] e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
[    0.407683] e820: reserve RAM buffer [mem 0x09b00000-0x0bffffff]
[    0.407684] e820: reserve RAM buffer [mem 0x09f00000-0x0bffffff]
[    0.407685] e820: reserve RAM buffer [mem 0x66b54000-0x67ffffff]
[    0.407686] e820: reserve RAM buffer [mem 0x6ad67000-0x6bffffff]
[    0.407687] e820: reserve RAM buffer [mem 0x6ad73018-0x6bffffff]
[    0.407688] e820: reserve RAM buffer [mem 0x6d146000-0x6fffffff]
[    0.407688] e820: reserve RAM buffer [mem 0x73531000-0x73ffffff]
[    0.407689] e820: reserve RAM buffer [mem 0x76f7f000-0x77ffffff]
[    0.407690] e820: reserve RAM buffer [mem 0x7a000000-0x7bffffff]
[    0.407691] e820: reserve RAM buffer [mem 0x1e7e0c0000-0x1e7fffffff]
[    0.407706] vgaarb: loaded
[    0.407706] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.407706] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
[    0.409702] clocksource: Switched to clocksource tsc-early
[    0.409787] VFS: Disk quotas dquot_6.6.0
[    0.409793] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.409808] pnp: PnP ACPI init
[    0.409898] system 00:00: [mem 0xe0000000-0xefffffff] has been reserved
[    0.411239] system 00:02: [io  0x0400-0x04cf] has been reserved
[    0.411241] system 00:02: [io  0x04d0-0x04d1] has been reserved
[    0.411242] system 00:02: [io  0x04d6] has been reserved
[    0.411243] system 00:02: [io  0x0c00-0x0c01] has been reserved
[    0.411244] system 00:02: [io  0x0c14] has been reserved
[    0.411245] system 00:02: [io  0x0c50-0x0c52] has been reserved
[    0.411246] system 00:02: [io  0x0c6c] has been reserved
[    0.411247] system 00:02: [io  0x0c6f] has been reserved
[    0.411248] system 00:02: [io  0x0cd0-0x0cdb] has been reserved
[    0.411257] system 00:03: [mem 0xff000000-0xffffffff] has been reserved
[    0.411517] pnp: PnP ACPI: found 4 devices
[    0.417037] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, m=
ax_idle_ns: 2085701024 ns
[    0.417068] NET: Registered PF_INET protocol family
[    0.417144] IP idents hash table entries: 262144 (order: 9, 2097152 byte=
s, linear)
[    0.424132] tcp_listen_portaddr_hash hash table entries: 65536 (order: 8=
, 1048576 bytes, linear)
[    0.424168] Table-perturb hash table entries: 65536 (order: 6, 262144 by=
tes, linear)
[    0.424314] TCP established hash table entries: 524288 (order: 10, 41943=
04 bytes, linear)
[    0.424533] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes,=
 linear)
[    0.424589] TCP: Hash tables configured (established 524288 bind 65536)
[    0.424702] MPTCP token hash table entries: 65536 (order: 8, 1572864 byt=
es, linear)
[    0.424921] UDP hash table entries: 65536 (order: 10, 4194304 bytes, lin=
ear)
[    0.425229] UDP-Lite hash table entries: 65536 (order: 10, 4194304 bytes=
, linear)
[    0.425402] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.425407] NET: Registered PF_XDP protocol family
[    0.425418] pci 0000:00:01.1: PCI bridge to [bus 01-5f]
[    0.425426] pci 0000:00:01.1:   bridge window [io  0x7000-0xafff]
[    0.425436] pci 0000:00:01.1:   bridge window [mem 0xac000000-0xc3ffffff]
[    0.425462] pci 0000:00:01.1:   bridge window [mem 0x4800000000-0x67ffff=
ffff 64bit pref]
[    0.425490] pci 0000:00:01.2: PCI bridge to [bus 60-be]
[    0.425492] pci 0000:00:01.2:   bridge window [io  0x3000-0x6fff]
[    0.425516] pci 0000:00:01.2:   bridge window [mem 0x94000000-0xabffffff]
[    0.425542] pci 0000:00:01.2:   bridge window [mem 0x2800000000-0x47ffff=
ffff 64bit pref]
[    0.425595] pci 0000:00:02.1: PCI bridge to [bus bf]
[    0.425596] pci 0000:00:02.1:   bridge window [io  0x2000-0x2fff]
[    0.425599] pci 0000:00:02.1:   bridge window [mem 0x90f00000-0x90ffffff]
[    0.425604] pci 0000:00:02.3: PCI bridge to [bus c0]
[    0.425607] pci 0000:00:02.3:   bridge window [mem 0x90400000-0x906fffff]
[    0.425612] pci 0000:00:02.5: PCI bridge to [bus c1]
[    0.425615] pci 0000:00:02.5:   bridge window [mem 0x90e00000-0x90efffff]
[    0.425620] pci 0000:00:03.1: PCI bridge to [bus c2]
[    0.425629] pci 0000:00:03.1:   bridge window [mem 0x90d00000-0x90dfffff]
[    0.425646] pci 0000:00:08.1: PCI bridge to [bus c3]
[    0.425652] pci 0000:00:08.1:   bridge window [io  0x1000-0x1fff]
[    0.425655] pci 0000:00:08.1:   bridge window [mem 0x80000000-0x903fffff]
[    0.425658] pci 0000:00:08.1:   bridge window [mem 0x6800000000-0x69ffff=
ffff 64bit pref]
[    0.425662] pci 0000:00:08.2: PCI bridge to [bus c4]
[    0.425665] pci 0000:00:08.2:   bridge window [mem 0x90b00000-0x90cfffff]
[    0.425667] pci 0000:00:08.2:   bridge window [mem 0x6a00000000-0x6a000f=
ffff 64bit pref]
[    0.425671] pci 0000:00:08.3: PCI bridge to [bus c5]
[    0.425674] pci 0000:00:08.3:   bridge window [mem 0x90700000-0x90afffff]
[    0.425680] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.425681] pci_bus 0000:00: resource 5 [io  0x0d00-0xfeff window]
[    0.425682] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff windo=
w]
[    0.425683] pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000cffff windo=
w]
[    0.425684] pci_bus 0000:00: resource 8 [mem 0x000d0000-0x000effff windo=
w]
[    0.425685] pci_bus 0000:00: resource 9 [mem 0x80000000-0xdfffffff windo=
w]
[    0.425686] pci_bus 0000:00: resource 10 [mem 0xf0000000-0xfcffffff wind=
ow]
[    0.425687] pci_bus 0000:00: resource 11 [mem 0xfec00000-0xfec01fff wind=
ow]
[    0.425688] pci_bus 0000:00: resource 12 [mem 0xfed45000-0xfed811ff wind=
ow]
[    0.425689] pci_bus 0000:00: resource 13 [mem 0xfed81900-0xfed81fff wind=
ow]
[    0.425690] pci_bus 0000:00: resource 14 [mem 0xfedc0000-0xfedc0fff wind=
ow]
[    0.425691] pci_bus 0000:00: resource 15 [mem 0xfedc6000-0xfedc6fff wind=
ow]
[    0.425692] pci_bus 0000:00: resource 16 [mem 0xfee01000-0xffffffff wind=
ow]
[    0.425693] pci_bus 0000:00: resource 17 [mem 0x20b0200000-0x9b4fffffff =
window]
[    0.425694] pci_bus 0000:01: resource 0 [io  0x7000-0xafff]
[    0.425695] pci_bus 0000:01: resource 1 [mem 0xac000000-0xc3ffffff]
[    0.425696] pci_bus 0000:01: resource 2 [mem 0x4800000000-0x67ffffffff 6=
4bit pref]
[    0.425697] pci_bus 0000:60: resource 0 [io  0x3000-0x6fff]
[    0.425698] pci_bus 0000:60: resource 1 [mem 0x94000000-0xabffffff]
[    0.425699] pci_bus 0000:60: resource 2 [mem 0x2800000000-0x47ffffffff 6=
4bit pref]
[    0.425700] pci_bus 0000:bf: resource 0 [io  0x2000-0x2fff]
[    0.425701] pci_bus 0000:bf: resource 1 [mem 0x90f00000-0x90ffffff]
[    0.425702] pci_bus 0000:c0: resource 1 [mem 0x90400000-0x906fffff]
[    0.425703] pci_bus 0000:c1: resource 1 [mem 0x90e00000-0x90efffff]
[    0.425704] pci_bus 0000:c2: resource 1 [mem 0x90d00000-0x90dfffff]
[    0.425705] pci_bus 0000:c3: resource 0 [io  0x1000-0x1fff]
[    0.425706] pci_bus 0000:c3: resource 1 [mem 0x80000000-0x903fffff]
[    0.425707] pci_bus 0000:c3: resource 2 [mem 0x6800000000-0x69ffffffff 6=
4bit pref]
[    0.425708] pci_bus 0000:c4: resource 1 [mem 0x90b00000-0x90cfffff]
[    0.425709] pci_bus 0000:c4: resource 2 [mem 0x6a00000000-0x6a000fffff 6=
4bit pref]
[    0.425710] pci_bus 0000:c5: resource 1 [mem 0x90700000-0x90afffff]
[    0.426339] pci 0000:c3:00.1: D0 power state depends on 0000:c3:00.0
[    0.426549] PCI: CLS 64 bytes, default 64
[    0.426580] pci 0000:00:00.2: AMD-Vi: IOMMU performance counters support=
ed
[    0.426609] platform MSFT0201:00: Adding to iommu group 0
[    0.426624] Trying to unpack rootfs image as initramfs...
[    0.426726] pci 0000:00:00.0: Adding to iommu group 1
[    0.426744] pci 0000:00:01.0: Adding to iommu group 2
[    0.426752] pci 0000:00:01.1: Adding to iommu group 3
[    0.426760] pci 0000:00:01.2: Adding to iommu group 4
[    0.426773] pci 0000:00:02.0: Adding to iommu group 5
[    0.426780] pci 0000:00:02.1: Adding to iommu group 6
[    0.426788] pci 0000:00:02.3: Adding to iommu group 7
[    0.426796] pci 0000:00:02.5: Adding to iommu group 8
[    0.426807] pci 0000:00:03.0: Adding to iommu group 9
[    0.426814] pci 0000:00:03.1: Adding to iommu group 10
[    0.426831] pci 0000:00:08.0: Adding to iommu group 11
[    0.426838] pci 0000:00:08.1: Adding to iommu group 12
[    0.426846] pci 0000:00:08.2: Adding to iommu group 13
[    0.426852] pci 0000:00:08.3: Adding to iommu group 14
[    0.426864] pci 0000:00:14.0: Adding to iommu group 15
[    0.426870] pci 0000:00:14.3: Adding to iommu group 15
[    0.426896] pci 0000:00:18.0: Adding to iommu group 16
[    0.426903] pci 0000:00:18.1: Adding to iommu group 16
[    0.426910] pci 0000:00:18.2: Adding to iommu group 16
[    0.426916] pci 0000:00:18.3: Adding to iommu group 16
[    0.426923] pci 0000:00:18.4: Adding to iommu group 16
[    0.426930] pci 0000:00:18.5: Adding to iommu group 16
[    0.426937] pci 0000:00:18.6: Adding to iommu group 16
[    0.426944] pci 0000:00:18.7: Adding to iommu group 16
[    0.426956] pci 0000:bf:00.0: Adding to iommu group 17
[    0.426964] pci 0000:c0:00.0: Adding to iommu group 18
[    0.426972] pci 0000:c1:00.0: Adding to iommu group 19
[    0.426980] pci 0000:c2:00.0: Adding to iommu group 20
[    0.427011] pci 0000:c3:00.0: Adding to iommu group 21
[    0.427018] pci 0000:c3:00.1: Adding to iommu group 22
[    0.427028] pci 0000:c3:00.2: Adding to iommu group 23
[    0.427036] pci 0000:c3:00.4: Adding to iommu group 24
[    0.427045] pci 0000:c3:00.6: Adding to iommu group 25
[    0.427053] pci 0000:c4:00.0: Adding to iommu group 26
[    0.427063] pci 0000:c4:00.1: Adding to iommu group 27
[    0.427072] pci 0000:c5:00.0: Adding to iommu group 28
[    0.427081] pci 0000:c5:00.3: Adding to iommu group 29
[    0.427089] pci 0000:c5:00.4: Adding to iommu group 30
[    0.427098] pci 0000:c5:00.5: Adding to iommu group 31
[    0.427107] pci 0000:c5:00.6: Adding to iommu group 32
[    0.429673] AMD-Vi: Extended features (0x246577efa2254afa, 0x10): PPR NX=
 GT [5] IA GA PC GA_vAPIC
[    0.429679] AMD-Vi: Interrupt remapping enabled
[    0.429771] AMD-Vi: Virtual APIC enabled
[    0.429797] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.429822] software IO TLB: mapped [mem 0x000000006d2cd000-0x0000000071=
2cd000] (64MB)
[    0.429846] LVT offset 0 assigned for vector 0x400
[    0.433665] perf: AMD IBS detected (0x00081bff)
[    0.433669] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters/b=
ank).
[    0.444054] Initialise system trusted keyrings
[    0.444064] Key type blacklist registered
[    0.444088] workingset: timestamp_bits=3D36 max_order=3D25 bucket_order=
=3D0
[    0.444256] fuse: init (API version 7.42)
[    0.444310] integrity: Platform Keyring initialized
[    0.444312] integrity: Machine keyring initialized
[    0.448717] xor: automatically using best checksumming function   avx   =
   =20
[    0.448719] Key type asymmetric registered
[    0.448721] Asymmetric key parser 'x509' registered
[    0.448733] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 246)
[    0.448766] io scheduler mq-deadline registered
[    0.448768] io scheduler kyber registered
[    0.448774] io scheduler bfq registered
[    0.450334] ledtrig-cpu: registered to indicate activity on CPUs
[    0.450611] pcieport 0000:00:01.1: PME: Signaling with IRQ 33
[    0.450643] pcieport 0000:00:01.1: pciehp: Slot #0 AttnBtn- PwrCtrl- MRL=
- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActR=
ep+
[    0.451091] pcieport 0000:00:01.2: PME: Signaling with IRQ 34
[    0.451122] pcieport 0000:00:01.2: pciehp: Slot #0 AttnBtn- PwrCtrl- MRL=
- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActR=
ep+
[    0.451368] pcieport 0000:00:02.1: PME: Signaling with IRQ 35
[    0.451503] pcieport 0000:00:02.3: PME: Signaling with IRQ 36
[    0.451637] pcieport 0000:00:02.5: PME: Signaling with IRQ 37
[    0.451801] pcieport 0000:00:03.1: PME: Signaling with IRQ 38
[    0.451980] pcieport 0000:00:08.1: PME: Signaling with IRQ 39
[    0.452132] pcieport 0000:00:08.2: PME: Signaling with IRQ 40
[    0.452259] pcieport 0000:00:08.3: PME: Signaling with IRQ 41
[    0.452327] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.452433] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0C:00/input/input0
[    0.452446] ACPI: button: Power Button [PWRB]
[    0.452755] Monitor-Mwait will be used to enter C-1 state
[    0.455114] Estimated ratio of average max frequency by base frequency (=
times 1024): 1425
[    0.455256] thermal LNXTHERM:00: registered as thermal_zone0
[    0.455258] ACPI: thermal: Thermal Zone [TZ00] (44 C)
[    0.455318] thermal LNXTHERM:01: registered as thermal_zone1
[    0.455319] ACPI: thermal: Thermal Zone [TZ01] (39 C)
[    0.455377] thermal LNXTHERM:02: registered as thermal_zone2
[    0.455378] ACPI: thermal: Thermal Zone [TZ02] (39 C)
[    0.455436] thermal LNXTHERM:03: registered as thermal_zone3
[    0.455437] ACPI: thermal: Thermal Zone [TZ03] (51 C)
[    0.455545] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.456414] Non-volatile memory driver v1.3
[    0.456416] Linux agpgart interface v0.103
[    0.476572] Freeing initrd memory: 8032K
[    1.450623] tsc: Refined TSC clocksource calibration: 2894.574 MHz
[    1.450638] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x29b=
93cfee8e, max_idle_ns: 440795220601 ns
[    1.450955] clocksource: Switched to clocksource tsc
[    1.700202] tpm_crb MSFT0101:00: Disabling hwrng
[    1.700849] ACPI: bus type drm_connector registered
[    1.703987] xhci_hcd 0000:c3:00.4: xHCI Host Controller
[    1.703998] xhci_hcd 0000:c3:00.4: new USB bus registered, assigned bus =
number 1
[    1.704350] xhci_hcd 0000:c3:00.4: hcc params 0x0118ffc5 hci version 0x1=
20 quirks 0x0000000200000010
[    1.704654] xhci_hcd 0000:c3:00.4: xHCI Host Controller
[    1.704658] xhci_hcd 0000:c3:00.4: new USB bus registered, assigned bus =
number 2
[    1.704663] xhci_hcd 0000:c3:00.4: Host supports USB 3.1 Enhanced SuperS=
peed
[    1.704710] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.14
[    1.704715] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.704718] usb usb1: Product: xHCI Host Controller
[    1.704720] usb usb1: Manufacturer: Linux 6.14.0-arch1-1 xhci-hcd
[    1.704723] usb usb1: SerialNumber: 0000:c3:00.4
[    1.704844] hub 1-0:1.0: USB hub found
[    1.704870] hub 1-0:1.0: 1 port detected
[    1.705506] usb usb2: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    1.705526] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.14
[    1.705530] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.705533] usb usb2: Product: xHCI Host Controller
[    1.705535] usb usb2: Manufacturer: Linux 6.14.0-arch1-1 xhci-hcd
[    1.705538] usb usb2: SerialNumber: 0000:c3:00.4
[    1.705612] hub 2-0:1.0: USB hub found
[    1.705627] hub 2-0:1.0: 1 port detected
[    1.706289] xhci_hcd 0000:c5:00.0: xHCI Host Controller
[    1.706295] xhci_hcd 0000:c5:00.0: new USB bus registered, assigned bus =
number 3
[    1.706693] xhci_hcd 0000:c5:00.0: hcc params 0x0128ffc5 hci version 0x1=
20 quirks 0x0000000200000010
[    1.706962] xhci_hcd 0000:c5:00.0: xHCI Host Controller
[    1.706966] xhci_hcd 0000:c5:00.0: new USB bus registered, assigned bus =
number 4
[    1.706969] xhci_hcd 0000:c5:00.0: Host supports USB 3.1 Enhanced SuperS=
peed
[    1.706996] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.14
[    1.707000] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.707003] usb usb3: Product: xHCI Host Controller
[    1.707005] usb usb3: Manufacturer: Linux 6.14.0-arch1-1 xhci-hcd
[    1.707007] usb usb3: SerialNumber: 0000:c5:00.0
[    1.707079] hub 3-0:1.0: USB hub found
[    1.707102] hub 3-0:1.0: 5 ports detected
[    1.709343] usb usb4: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    1.709362] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.14
[    1.709365] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.709368] usb usb4: Product: xHCI Host Controller
[    1.709370] usb usb4: Manufacturer: Linux 6.14.0-arch1-1 xhci-hcd
[    1.709372] usb usb4: SerialNumber: 0000:c5:00.0
[    1.709431] hub 4-0:1.0: USB hub found
[    1.709452] hub 4-0:1.0: 2 ports detected
[    1.710794] xhci_hcd 0000:c5:00.3: xHCI Host Controller
[    1.710799] xhci_hcd 0000:c5:00.3: new USB bus registered, assigned bus =
number 5
[    1.711175] xhci_hcd 0000:c5:00.3: hcc params 0x0118ffc5 hci version 0x1=
20 quirks 0x0000000200000010
[    1.711550] xhci_hcd 0000:c5:00.3: xHCI Host Controller
[    1.711553] xhci_hcd 0000:c5:00.3: new USB bus registered, assigned bus =
number 6
[    1.711560] xhci_hcd 0000:c5:00.3: Host supports USB 3.1 Enhanced SuperS=
peed
[    1.711587] usb usb5: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.14
[    1.711591] usb usb5: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.711593] usb usb5: Product: xHCI Host Controller
[    1.711596] usb usb5: Manufacturer: Linux 6.14.0-arch1-1 xhci-hcd
[    1.711598] usb usb5: SerialNumber: 0000:c5:00.3
[    1.711661] hub 5-0:1.0: USB hub found
[    1.711681] hub 5-0:1.0: 1 port detected
[    1.712259] usb usb6: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    1.712277] usb usb6: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.14
[    1.712281] usb usb6: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.712283] usb usb6: Product: xHCI Host Controller
[    1.712285] usb usb6: Manufacturer: Linux 6.14.0-arch1-1 xhci-hcd
[    1.712288] usb usb6: SerialNumber: 0000:c5:00.3
[    1.712344] hub 6-0:1.0: USB hub found
[    1.712363] hub 6-0:1.0: 1 port detected
[    1.713144] xhci_hcd 0000:c5:00.4: xHCI Host Controller
[    1.713149] xhci_hcd 0000:c5:00.4: new USB bus registered, assigned bus =
number 7
[    1.713522] xhci_hcd 0000:c5:00.4: hcc params 0x0118ffc5 hci version 0x1=
20 quirks 0x0000000200000010
[    1.713881] xhci_hcd 0000:c5:00.4: xHCI Host Controller
[    1.713885] xhci_hcd 0000:c5:00.4: new USB bus registered, assigned bus =
number 8
[    1.713889] xhci_hcd 0000:c5:00.4: Host supports USB 3.1 Enhanced SuperS=
peed
[    1.713916] usb usb7: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.14
[    1.713919] usb usb7: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.713922] usb usb7: Product: xHCI Host Controller
[    1.713924] usb usb7: Manufacturer: Linux 6.14.0-arch1-1 xhci-hcd
[    1.713927] usb usb7: SerialNumber: 0000:c5:00.4
[    1.713987] hub 7-0:1.0: USB hub found
[    1.714007] hub 7-0:1.0: 1 port detected
[    1.714588] usb usb8: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    1.714606] usb usb8: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.14
[    1.714609] usb usb8: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.714612] usb usb8: Product: xHCI Host Controller
[    1.714614] usb usb8: Manufacturer: Linux 6.14.0-arch1-1 xhci-hcd
[    1.714617] usb usb8: SerialNumber: 0000:c5:00.4
[    1.714672] hub 8-0:1.0: USB hub found
[    1.714692] hub 8-0:1.0: 1 port detected
[    1.715432] usbcore: registered new interface driver usbserial_generic
[    1.715438] usbserial: USB Serial support registered for generic
[    1.715492] rtc_cmos 00:01: RTC can wake from S4
[    1.715762] rtc_cmos 00:01: registered as rtc0
[    1.715802] rtc_cmos 00:01: setting system clock to 2025-04-04T19:10:28 =
UTC (1743793828)
[    1.715842] rtc_cmos 00:01: alarms up to one month, y3k, 114 bytes nvram
[    1.718500] simple-framebuffer simple-framebuffer.0: [drm] Registered 1 =
planes with drm panic
[    1.718504] [drm] Initialized simpledrm 1.0.0 for simple-framebuffer.0 o=
n minor 0
[    1.725310] Console: switching to colour frame buffer device 240x67
[    1.733370] simple-framebuffer simple-framebuffer.0: [drm] fb0: simpledr=
mdrmfb frame buffer device
[    1.733532] hid: raw HID events driver (C) Jiri Kosina
[    1.733657] drop_monitor: Initializing network drop monitor service
[    1.733788] NET: Registered PF_INET6 protocol family
[    1.737805] Segment Routing with IPv6
[    1.737872] RPL Segment Routing with IPv6
[    1.737919] In-situ OAM (IOAM) with IPv6
[    1.737975] NET: Registered PF_PACKET protocol family
[    1.739889] microcode: Current revision: 0x0b70001e
[    1.740958] resctrl: L3 allocation detected
[    1.740980] resctrl: MB allocation detected
[    1.740995] resctrl: SMBA allocation detected
[    1.741097] resctrl: L3 monitoring detected
[    1.741165] IPI shorthand broadcast: enabled
[    1.742115] sched_clock: Marking stable (1740011312, 1556226)->(17470745=
71, -5507033)
[    1.742413] registered taskstats version 1
[    1.743778] Loading compiled-in X.509 certificates
[    1.747337] Loaded X.509 cert 'Build time autogenerated kernel key: d495=
1fe3fa56b6c20ed2fbc5a3e11ce4e8b71784'
[    1.751050] zswap: loaded using pool zstd/zsmalloc
[    1.751224] Demotion targets for Node 0: null
[    1.751464] Key type .fscrypt registered
[    1.751478] Key type fscrypt-provisioning registered
[    1.751953] Btrfs loaded, zoned=3Dyes, fsverity=3Dyes
[    1.752361] PM:   Magic number: 5:918:191
[    1.752548] acpi device:1d: hash matches
[    1.754745] RAS: Correctable Errors collector initialized.
[    1.762562] clk: Disabling unused clocks
[    1.762624] PM: genpd: Disabling unused power domains
[    1.763419] Freeing unused decrypted memory: 2028K
[    1.763888] Freeing unused kernel image (initmem) memory: 4532K
[    1.763979] Write protecting the kernel read-only data: 36864k
[    1.764331] Freeing unused kernel image (text/rodata gap) memory: 1288K
[    1.764488] Freeing unused kernel image (rodata/data gap) memory: 116K
[    1.791334] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.791360] rodata_test: all tests were successful
[    1.791380] Run /init as init process
[    1.791393]   with arguments:
[    1.791404]     /init
[    1.791413]   with environment:
[    1.791425]     HOME=3D/
[    1.791434]     TERM=3Dlinux
[    1.791444]     BOOT_IMAGE=3D/vmlinuz-linux
[    1.882679] nvme 0000:c1:00.0: platform quirk: setting simple suspend
[    1.882681] nvme 0000:c2:00.0: platform quirk: setting simple suspend
[    1.882773] nvme nvme0: pci function 0000:c2:00.0
[    1.883701] nvme nvme1: pci function 0000:c1:00.0
[    1.919234] nvme nvme0: allocated 64 MiB host memory buffer (1 segment).
[    1.921885] nvme nvme1: 32/0/0 default/read/poll queues
[    1.926144] nvme nvme0: 32/0/0 default/read/poll queues
[    1.933349]  nvme0n1: p1 p2 p3
[    1.941566] usb 1-1: new high-speed USB device number 2 using xhci_hcd
[    1.946582] usb 3-2: new high-speed USB device number 2 using xhci_hcd
[    2.078894] usb 3-2: New USB device found, idVendor=3D05e3, idProduct=3D=
0610, bcdDevice=3D10.00
[    2.079786] usb 3-2: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[    2.080394] usb 3-2: Product: USB2.1 Hub
[    2.080959] usb 3-2: Manufacturer: GenesysLogic
[    2.090578] usb 1-1: New USB device found, idVendor=3D0bda, idProduct=3D=
5424, bcdDevice=3D 1.76
[    2.091648] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[    2.092256] usb 1-1: Product: 2-Port USB 2.0 Hub
[    2.092813] usb 1-1: Manufacturer: Generic
[    2.123668] hub 3-2:1.0: USB hub found
[    2.127198] hub 3-2:1.0: 2 ports detected
[    2.154343] hub 1-1:1.0: USB hub found
[    2.156569] hub 1-1:1.0: 2 ports detected
[    2.187768] usb 4-2: new SuperSpeed Plus Gen 2x1 USB device number 2 usi=
ng xhci_hcd
[    2.203043] usb 4-2: New USB device found, idVendor=3D05e3, idProduct=3D=
0625, bcdDevice=3D10.00
[    2.203823] usb 4-2: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[    2.204386] usb 4-2: Product: USB3.2 Hub
[    2.204902] usb 4-2: Manufacturer: GenesysLogic
[    2.217775] usb 2-1: new SuperSpeed Plus Gen 2x1 USB device number 2 usi=
ng xhci_hcd
[    2.235366] hub 4-2:1.0: USB hub found
[    2.236790] hub 4-2:1.0: 2 ports detected
[    2.251324] usb 2-1: New USB device found, idVendor=3D0bda, idProduct=3D=
0424, bcdDevice=3D 1.76
[    2.252724] usb 2-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[    2.253478] usb 2-1: Product: 2-Port USB 3.0 Hub
[    2.254136] usb 2-1: Manufacturer: Generic
[    2.288432] hub 2-1:1.0: USB hub found
[    2.291041] hub 2-1:1.0: 2 ports detected
[    2.313656] usb 3-3: new high-speed USB device number 3 using xhci_hcd
[    2.444279] usb 3-3: New USB device found, idVendor=3D0e8d, idProduct=3D=
0717, bcdDevice=3D 1.00
[    2.445199] usb 3-3: New USB device strings: Mfr=3D5, Product=3D6, Seria=
lNumber=3D7
[    2.445791] usb 3-3: Product: Wireless_Device
[    2.446322] usb 3-3: Manufacturer: MediaTek Inc.
[    2.446849] usb 3-3: SerialNumber: 000000000
[    2.530870] usb 3-2.1: new full-speed USB device number 4 using xhci_hcd
[    2.661318] usb 3-2.1: New USB device found, idVendor=3D046d, idProduct=
=3Dc52b, bcdDevice=3D12.10
[    2.662528] usb 3-2.1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[    2.663147] usb 3-2.1: Product: USB Receiver
[    2.663695] usb 3-2.1: Manufacturer: Logitech
[    2.785930] usbcore: registered new interface driver usbhid
[    2.786807] usbhid: USB HID core driver
[    2.791020] input: Logitech USB Receiver as /devices/pci0000:00/0000:00:=
08.3/0000:c5:00.0/usb3/3-2/3-2.1/3-2.1:1.0/0003:046D:C52B.0001/input/input1
[    2.883158] hid-generic 0003:046D:C52B.0001: input,hidraw0: USB HID v1.1=
1 Keyboard [Logitech USB Receiver] on usb-0000:c5:00.0-2.1/input0
[    2.884378] input: Logitech USB Receiver Mouse as /devices/pci0000:00/00=
00:00:08.3/0000:c5:00.0/usb3/3-2/3-2.1/3-2.1:1.1/0003:046D:C52B.0002/input/=
input2
[    2.885216] input: Logitech USB Receiver Consumer Control as /devices/pc=
i0000:00/0000:00:08.3/0000:c5:00.0/usb3/3-2/3-2.1/3-2.1:1.1/0003:046D:C52B.=
0002/input/input3
[    2.901888] usb 1-1.1: new high-speed USB device number 3 using xhci_hcd
[    2.937104] input: Logitech USB Receiver System Control as /devices/pci0=
000:00/0000:00:08.3/0000:c5:00.0/usb3/3-2/3-2.1/3-2.1:1.1/0003:046D:C52B.00=
02/input/input4
[    2.938555] hid-generic 0003:046D:C52B.0002: input,hiddev96,hidraw1: USB=
 HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:c5:00.0-2.1/input1
[    2.939902] hid-generic 0003:046D:C52B.0003: hiddev97,hidraw2: USB HID v=
1.11 Device [Logitech USB Receiver] on usb-0000:c5:00.0-2.1/input2
[    2.992795] usb 1-1.1: New USB device found, idVendor=3D05e3, idProduct=
=3D0610, bcdDevice=3D32.98
[    2.994079] usb 1-1.1: New USB device strings: Mfr=3D0, Product=3D1, Ser=
ialNumber=3D0
[    2.994845] usb 1-1.1: Product: USB2.0 Hub
[    3.049773] hub 1-1.1:1.0: USB hub found
[    3.053725] hub 1-1.1:1.0: 4 ports detected
[    3.080710] logitech-djreceiver 0003:046D:C52B.0003: hiddev96,hidraw0: U=
SB HID v1.11 Device [Logitech USB Receiver] on usb-0000:c5:00.0-2.1/input2
[    3.189368] input: Logitech Wireless Device PID:404c Keyboard as /device=
s/pci0000:00/0000:00:08.3/0000:c5:00.0/usb3/3-2/3-2.1/3-2.1:1.2/0003:046D:C=
52B.0003/0003:046D:404C.0004/input/input6
[    3.192569] usb 1-1.2: new high-speed USB device number 4 using xhci_hcd
[    3.208880] BTRFS: device fsid 46308bde-204e-42aa-947e-08da42de7b3a devi=
d 1 transid 404465 /dev/nvme0n1p3 (259:4) scanned by mount (424)
[    3.212445] BTRFS info (device nvme0n1p3): first mount of filesystem 463=
08bde-204e-42aa-947e-08da42de7b3a
[    3.213382] BTRFS info (device nvme0n1p3): using crc32c (crc32c-x86) che=
cksum algorithm
[    3.214340] BTRFS info (device nvme0n1p3): using free-space-tree
[    3.245628] input: Logitech Wireless Device PID:404c Mouse as /devices/p=
ci0000:00/0000:00:08.3/0000:c5:00.0/usb3/3-2/3-2.1/3-2.1:1.2/0003:046D:C52B=
=2E0003/0003:046D:404C.0004/input/input7
[    3.249059] hid-generic 0003:046D:404C.0004: input,hidraw1: USB HID v1.1=
1 Keyboard [Logitech Wireless Device PID:404c] on usb-0000:c5:00.0-2.1/inpu=
t2:1
[    3.255244] input: Logitech MX Master as /devices/pci0000:00/0000:00:08.=
3/0000:c5:00.0/usb3/3-2/3-2.1/3-2.1:1.2/0003:046D:C52B.0003/0003:046D:4041.=
0005/input/input11
[    3.298115] systemd[1]: systemd 257.4-1-arch running in system mode (+PA=
M +AUDIT -SELINUX -APPARMOR -IMA +IPE +SMACK +SECCOMP +GCRYPT +GNUTLS +OPEN=
SSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETU=
P +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM=
2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF +XKBCOMMON +UTMP -SYSVINI=
T +LIBARCHIVE)
[    3.300558] systemd[1]: Detected architecture x86-64.
[    3.306248] systemd[1]: Hostname set to <htpc>.
[    3.376648] logitech-hidpp-device 0003:046D:4041.0005: input,hidraw2: US=
B HID v1.11 Keyboard [Logitech MX Master] on usb-0000:c5:00.0-2.1/input2:2
[    3.387595] usb 1-1.1.1: new full-speed USB device number 5 using xhci_h=
cd
[    3.389227] input: Logitech MX Master as /devices/pci0000:00/0000:00:08.=
3/0000:c5:00.0/usb3/3-2/3-2.1/3-2.1:1.2/0003:046D:C52B.0003/0003:046D:4041.=
0006/input/input12
[    3.395345] input: Logitech K830 as /devices/pci0000:00/0000:00:08.3/000=
0:c5:00.0/usb3/3-2/3-2.1/3-2.1:1.2/0003:046D:C52B.0003/0003:046D:404C.0004/=
input/input13
[    3.437633] logitech-hidpp-device 0003:046D:4041.0006: input,hidraw1: US=
B HID v1.11 Keyboard [Logitech MX Master] on usb-0000:c5:00.0-2.1/input2:3
[    3.449229] input: Logitech MX Master 2S as /devices/pci0000:00/0000:00:=
08.3/0000:c5:00.0/usb3/3-2/3-2.1/3-2.1:1.2/0003:046D:C52B.0003/0003:046D:40=
69.0007/input/input14
[    3.484706] usb 1-1.1.1: New USB device found, idVendor=3D09ea, idProduc=
t=3D0130, bcdDevice=3D 0.12
[    3.486335] usb 1-1.1.1: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
[    3.487562] usb 1-1.1.1: Product: Virtual HUB
[    3.488709] usb 1-1.1.1: Manufacturer: Generic
[    3.489798] usb 1-1.1.1: SerialNumber: 00000001
[    3.492732] logitech-hidpp-device 0003:046D:404C.0004: input,hidraw3: US=
B HID v1.11 Keyboard [Logitech K830] on usb-0000:c5:00.0-2.1/input2:1
[    3.496157] systemd[1]: bpf-restrict-fs: LSM BPF program attached
[    3.529737] hub 1-1.1.1:1.0: USB hub found
[    3.533688] hub 1-1.1.1:1.0: 7 ports detected
[    3.538656] logitech-hidpp-device 0003:046D:4069.0007: input,hidraw4: US=
B HID v1.11 Keyboard [Logitech MX Master 2S] on usb-0000:c5:00.0-2.1/input2=
:4
[    3.551240] input: Logitech MX Master 2S as /devices/pci0000:00/0000:00:=
08.3/0000:c5:00.0/usb3/3-2/3-2.1/3-2.1:1.2/0003:046D:C52B.0003/0003:046D:40=
69.0008/input/input15
[    3.571763] systemd[1]: Queued start job for default target Graphical In=
terface.
[    3.592080] systemd[1]: Created slice Slice /system/dirmngr.
[    3.601808] systemd[1]: Created slice Slice /system/getty.
[    3.606655] logitech-hidpp-device 0003:046D:4069.0008: input,hidraw5: US=
B HID v1.11 Keyboard [Logitech MX Master 2S] on usb-0000:c5:00.0-2.1/input2=
:5
[    3.614268] systemd[1]: Created slice Slice /system/gpg-agent.
[    3.615223] input: Logitech MX Master 2S as /devices/pci0000:00/0000:00:=
08.3/0000:c5:00.0/usb3/3-2/3-2.1/3-2.1:1.2/0003:046D:C52B.0003/0003:046D:40=
69.0009/input/input16
[    3.618926] systemd[1]: Created slice Slice /system/gpg-agent-browser.
[    3.621972] systemd[1]: Created slice Slice /system/gpg-agent-extra.
[    3.625078] systemd[1]: Created slice Slice /system/gpg-agent-ssh.
[    3.628103] systemd[1]: Created slice Slice /system/keyboxd.
[    3.631097] systemd[1]: Created slice Slice /system/modprobe.
[    3.634020] systemd[1]: Created slice Slice /system/systemd-fsck.
[    3.636812] systemd[1]: Created slice User and Session Slice.
[    3.639336] systemd[1]: Started Dispatch Password Requests to Console Di=
rectory Watch.
[    3.641784] systemd[1]: Started Forward Password Requests to Wall Direct=
ory Watch.
[    3.644420] systemd[1]: Set up automount Arbitrary Executable File Forma=
ts File System Automount Point.
[    3.646938] systemd[1]: Expecting device /dev/disk/by-uuid/46308bde-204e=
-42aa-947e-08da42de7b3a...
[    3.647691] logitech-hidpp-device 0003:046D:4069.0009: input,hidraw6: US=
B HID v1.11 Keyboard [Logitech MX Master 2S] on usb-0000:c5:00.0-2.1/input2=
:6
[    3.651072] systemd[1]: Expecting device /dev/disk/by-uuid/92bc53e4-9e40=
-4740-88ca-48aef8ef888f...
[    3.653535] systemd[1]: Expecting device /dev/disk/by-uuid/AE37-3EFF...
[    3.655924] systemd[1]: Reached target Local Encrypted Volumes.
[    3.658325] systemd[1]: Reached target Local Integrity Protected Volumes.
[    3.660717] systemd[1]: Reached target Path Units.
[    3.663021] systemd[1]: Reached target Remote File Systems.
[    3.665198] systemd[1]: Reached target Slice Units.
[    3.667345] systemd[1]: Reached target Local Verity Protected Volumes.
[    3.669613] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[    3.671885] systemd[1]: Listening on LVM2 poll daemon socket.
[    3.674933] systemd[1]: Listening on Process Core Dump Socket.
[    3.677520] systemd[1]: Listening on Credential Encryption/Decryption.
[    3.679642] systemd[1]: Listening on Journal Socket (/dev/log).
[    3.681688] systemd[1]: Listening on Journal Sockets.
[    3.683697] systemd[1]: TPM PCR Measurements was skipped because of an u=
nmet condition check (ConditionSecurity=3Dmeasured-uki).
[    3.684703] systemd[1]: Make TPM PCR Policy was skipped because of an un=
met condition check (ConditionSecurity=3Dmeasured-uki).
[    3.685776] systemd[1]: Listening on udev Control Socket.
[    3.687837] systemd[1]: Listening on udev Kernel Socket.
[    3.693697] systemd[1]: Mounting Huge Pages File System...
[    3.716166] systemd[1]: Mounting POSIX Message Queue File System...
[    3.720532] systemd[1]: Mounting Kernel Debug File System...
[    3.724081] systemd[1]: Mounting Kernel Trace File System...
[    3.727937] systemd[1]: Starting Create List of Static Device Nodes...
[    3.731525] systemd[1]: Starting Monitoring of LVM2 mirrors, snapshots e=
tc. using dmeventd or progress polling...
[    3.735497] systemd[1]: Starting Load Kernel Module configfs...
[    3.739382] systemd[1]: Starting Load Kernel Module dm_mod...
[    3.743117] systemd[1]: Starting Load Kernel Module drm...
[    3.746972] systemd[1]: Starting Load Kernel Module fuse...
[    3.750766] systemd[1]: Starting Load Kernel Module loop...
[    3.753575] device-mapper: uevent: version 1.0.3
[    3.753666] device-mapper: ioctl: 4.49.0-ioctl (2025-01-17) initialised:=
 dm-devel@lists.linux.dev
[    3.757053] systemd[1]: Clear Stale Hibernate Storage Info was skipped b=
ecause of an unmet condition check (ConditionPathExists=3D/sys/firmware/efi=
/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
[    3.760673] systemd[1]: Starting Journal Service...
[    3.762600] loop: module loaded
[    3.766555] systemd[1]: Starting Load Kernel Modules...
[    3.769339] systemd[1]: TPM PCR Machine ID Measurement was skipped becau=
se of an unmet condition check (ConditionSecurity=3Dmeasured-uki).
[    3.771747] systemd[1]: Starting Remount Root and Kernel File Systems...
[    3.772290] systemd-journald[489]: Collecting audit messages is disabled.
[    3.777086] systemd[1]: Early TPM SRK Setup was skipped because of an un=
met condition check (ConditionSecurity=3Dmeasured-uki).
[    3.778700] i2c_dev: i2c /dev entries driver
[    3.795097] systemd[1]: Starting Load udev Rules from Credentials...
[    3.799316] systemd[1]: Starting Coldplug All udev Devices...
[    3.803320] systemd[1]: Mounted Huge Pages File System.
[    3.806950] systemd[1]: Mounted POSIX Message Queue File System.
[    3.810710] systemd[1]: Mounted Kernel Debug File System.
[    3.814548] systemd[1]: Mounted Kernel Trace File System.
[    3.817729] systemd[1]: Finished Create List of Static Device Nodes.
[    3.821525] systemd[1]: Finished Monitoring of LVM2 mirrors, snapshots e=
tc. using dmeventd or progress polling.
[    3.824705] systemd[1]: modprobe@configfs.service: Deactivated successfu=
lly.
[    3.826691] systemd[1]: Finished Load Kernel Module configfs.
[    3.830655] systemd[1]: modprobe@dm_mod.service: Deactivated successfull=
y.
[    3.832540] systemd[1]: Finished Load Kernel Module dm_mod.
[    3.836000] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    3.837916] systemd[1]: Finished Load Kernel Module drm.
[    3.841161] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[    3.842617] systemd[1]: Finished Load Kernel Module fuse.
[    3.845926] systemd[1]: modprobe@loop.service: Deactivated successfully.
[    3.847093] systemd[1]: Finished Load Kernel Module loop.
[    3.850616] systemd[1]: Finished Remount Root and Kernel File Systems.
[    3.853520] systemd[1]: Finished Load udev Rules from Credentials.
[    3.856455] systemd[1]: Finished Coldplug All udev Devices.
[    3.857565] usb 1-1.1.1.6: new full-speed USB device number 6 using xhci=
_hcd
[    3.861683] systemd[1]: Mounting FUSE Control File System...
[    3.890105] systemd[1]: Mounting Kernel Configuration File System...
[    3.894694] systemd[1]: Starting Rebuild Hardware Database...
[    3.897843] systemd[1]: Starting Load/Save OS Random Seed...
[    3.901030] systemd[1]: Repartition Root Disk was skipped because no tri=
gger condition checks were met.
[    3.903679] systemd[1]: Starting Create Static Device Nodes in /dev grac=
efully...
[    3.905756] systemd[1]: TPM SRK Setup was skipped because of an unmet co=
ndition check (ConditionSecurity=3Dmeasured-uki).
[    3.906977] systemd[1]: Mounted FUSE Control File System.
[    3.909049] systemd[1]: Mounted Kernel Configuration File System.
[    3.910894] systemd[1]: Finished Load/Save OS Random Seed.
[    3.918206] systemd[1]: Finished Create Static Device Nodes in /dev grac=
efully.
[    3.921601] systemd[1]: Starting Create System Users...
[    3.930379] systemd[1]: Finished Create System Users.
[    3.938537] systemd[1]: Starting Network Time Synchronization...
[    3.940475] systemd[1]: Starting Create Static Device Nodes in /dev...
[    3.948131] systemd[1]: Finished Create Static Device Nodes in /dev.
[    3.949774] systemd[1]: Reached target Preparation for Local File System=
s.
[    3.957480] systemd[1]: Started Network Time Synchronization.
[    3.959704] systemd[1]: Reached target System Time Set.
[    3.960682] usb 1-1.1.1.6: New USB device found, idVendor=3D09ea, idProd=
uct=3D0131, bcdDevice=3D 0.02
[    3.960686] usb 1-1.1.1.6: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D3
[    3.960687] usb 1-1.1.1.6: Product: Virtual HID
[    3.960688] usb 1-1.1.1.6: Manufacturer: Generic
[    3.960689] usb 1-1.1.1.6: SerialNumber: 00000001
[    4.049918] input: Generic Virtual HID as /devices/pci0000:00/0000:00:08=
=2E1/0000:c3:00.4/usb1/1-1/1-1.1/1-1.1.1/1-1.1.1.6/1-1.1.1.6:1.0/0003:09EA:=
0131.000A/input/input17
[    4.104177] systemd[1]: Finished Rebuild Hardware Database.
[    4.107596] systemd[1]: Starting Rule-based Manager for Device Events an=
d Files...
[    4.157228] systemd[1]: Started Rule-based Manager for Device Events and=
 Files.
[    4.164679] hid-generic 0003:09EA:0131.000A: input,hidraw7: USB HID v1.1=
0 Keyboard [Generic Virtual HID] on usb-0000:c3:00.4-1.1.1.6/input0
[    4.165290] systemd[1]: Condition check resulted in /dev/tpmrm0 being sk=
ipped.
[    4.167476] systemd[1]: Reached target Trusted Platform Module.
[    4.177833] input: Generic Virtual HID as /devices/pci0000:00/0000:00:08=
=2E1/0000:c3:00.4/usb1/1-1/1-1.1/1-1.1.1/1-1.1.1.6/1-1.1.1.6:1.1/0003:09EA:=
0131.000B/input/input18
[    4.179275] systemd[1]: Found device WD PC SN740 SDDPNQD-512G 1.
[    4.185029] input: Generic Virtual HID System Control as /devices/pci000=
0:00/0000:00:08.1/0000:c3:00.4/usb1/1-1/1-1.1/1-1.1.1/1-1.1.1.6/1-1.1.1.6:1=
=2E1/0003:09EA:0131.000B/input/input19
[    4.185274] ACPI: video: Video Device [VGA] (multi-head: yes  rom: no  p=
ost: no)
[    4.188953] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08=
:00/device:18/LNXVIDEO:00/input/input21
[    4.190845] input: PC Speaker as /devices/platform/pcspkr/input/input22
[    4.193096] ccp 0000:c3:00.2: enabling device (0000 -> 0002)
[    4.193508] systemd[1]: Found device WD PC SN740 SDDPNQD-512G 2.
[    4.196441] ccp 0000:c3:00.2: tee enabled
[    4.199059] RAPL PMU: API unit is 2^-32 Joules, 2 fixed counters, 163840=
 ms ovfl timer
[    4.199061] RAPL PMU: hw unit of domain package 2^-16 Joules
[    4.199062] RAPL PMU: hw unit of domain core 2^-16 Joules
[    4.199966] ccp 0000:c3:00.2: psp: TSME enabled
[    4.199969] ccp 0000:c3:00.2: psp enabled
[    4.204906] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, re=
vision 0
[    4.206211] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port=
 selection
[    4.207800] ACPI: bus type thunderbolt registered
[    4.208671] systemd[1]: Found device WD PC SN740 SDDPNQD-512G 3.
[    4.211672] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at=
 0xb20
[    4.213146] i2c i2c-6: Successfully instantiated SPD at 0x50
[    4.213167] systemd[1]: Listening on Load/Save RF Kill Switch Status /de=
v/rfkill Watch.
[    4.214512] i2c i2c-6: Successfully instantiated SPD at 0x51
[    4.216049] i2c i2c-6: Successfully instantiated SPD at 0x52
[    4.216576] i2c i2c-6: Successfully instantiated SPD at 0x53
[    4.218239] i2c i2c-6: Successfully instantiated SPD at 0x54
[    4.218730] systemd[1]: Activating swap /dev/disk/by-uuid/92bc53e4-9e40-=
4740-88ca-48aef8ef888f...
[    4.219592] i2c i2c-6: Successfully instantiated SPD at 0x55
[    4.221202] i2c i2c-6: Successfully instantiated SPD at 0x56
[    4.221611] i2c i2c-6: Successfully instantiated SPD at 0x57
[    4.232929] systemd[1]: Starting File System Check on /dev/disk/by-uuid/=
AE37-3EFF...
[    4.236305] systemd[1]: Starting Virtual Console Setup...
[    4.236305] Adding 20971516k swap on /dev/nvme0n1p2.  Priority:-2 extent=
s:1 across:20971516k SS
[    4.238027] input: Generic Virtual HID Consumer Control as /devices/pci0=
000:00/0000:00:08.1/0000:c3:00.4/usb1/1-1/1-1.1/1-1.1.1/1-1.1.1.6/1-1.1.1.6=
:1.1/0003:09EA:0131.000B/input/input20
[    4.238652] mousedev: PS/2 mouse device common for all mice
[    4.241353] hid-generic 0003:09EA:0131.000B: input,hidraw8: USB HID v1.1=
0 Mouse [Generic Virtual HID] on usb-0000:c3:00.4-1.1.1.6/input1
[    4.241488] cryptd: max_cpu_qlen set to 1000
[    4.242255] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[    4.242287] amd-tee driver initialization successful
[    4.242363] sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO ad=
dress
[    4.242479] sp5100-tco sp5100-tco: initialized. heartbeat=3D60 sec (nowa=
yout=3D0)
[    4.251067] cros_ec_lpcs: unsupported system.
[    4.252672] r8169 0000:bf:00.0: enabling device (0000 -> 0003)
[    4.253642] systemd[1]: Activated swap /dev/disk/by-uuid/92bc53e4-9e40-4=
740-88ca-48aef8ef888f.
[    4.254317] amdxdna 0000:c4:00.1: enabling device (0000 -> 0002)
[    4.260408] r8169 0000:bf:00.0 eth0: RTL8126A, 9c:bf:0d:00:e0:8d, XID 64=
9, IRQ 186
[    4.260789] systemd[1]: Reached target Swaps.
[    4.262344] r8169 0000:bf:00.0 eth0: jumbo features [frames: 9194 bytes,=
 tx checksumming: ko]
[    4.265980] systemd[1]: Finished File System Check on /dev/disk/by-uuid/=
AE37-3EFF.
[    4.270823] systemd[1]: Finished Virtual Console Setup.
[    4.277013] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database
[    4.277735] r8169 0000:bf:00.0 enp191s0: renamed from eth0
[    4.278827] AES CTR mode by8 optimization enabled
[    4.280296] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    4.280403] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db1=
8c600'
[    4.283044] platform regulatory.0: Direct firmware load for regulatory.d=
b failed with error -2
[    4.284151] cfg80211: failed to load regulatory.db
[    4.327645] tee tee0: Direct firmware load for /amdtee/f29bb3d9-bd66-544=
1-afb88acc2b2b60d6.bin failed with error -2
[    4.328709] failed to load firmware /amdtee/f29bb3d9-bd66-5441-afb88acc2=
b2b60d6.bin
[    4.330581] failed to copy TA binary
[    4.331693] Failed to open TEE session err:0x0, rc:-12
[    4.332537] amd-pmf AMDI0105:00: Failed to open TA session (-12)
[    4.333260] amd-pmf AMDI0105:00: registered PMF device successfully
[    4.355705] snd_hda_intel 0000:c3:00.1: enabling device (0000 -> 0002)
[    4.356598] [drm] Initialized amdxdna_accel_driver 0.0.0 for 0000:c4:00.=
1 on minor 0
[    4.356815] snd_hda_intel 0000:c3:00.1: Handle vga_switcheroo audio clie=
nt
[    4.358325] snd_hda_intel 0000:c3:00.6: enabling device (0000 -> 0002)
[    4.366925] input: HD-Audio Generic HDMI/DP,pcm=3D3 as /devices/pci0000:=
00/0000:00:08.1/0000:c3:00.1/sound/card0/input23
[    4.368128] input: HD-Audio Generic HDMI/DP,pcm=3D7 as /devices/pci0000:=
00/0000:00:08.1/0000:c3:00.1/sound/card0/input24
[    4.371303] input: HD-Audio Generic HDMI/DP,pcm=3D8 as /devices/pci0000:=
00/0000:00:08.1/0000:c3:00.1/sound/card0/input25
[    4.374346] input: HD-Audio Generic HDMI/DP,pcm=3D9 as /devices/pci0000:=
00/0000:00:08.1/0000:c3:00.1/sound/card0/input26
[    4.388528] systemd[1]: Starting Load Kernel Module dm_mod...
[    4.412483] kvm_amd: TSC scaling supported
[    4.413570] kvm_amd: Nested Virtualization enabled
[    4.413655] snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC623: li=
ne_outs=3D2 (0x21/0x14/0x0/0x0/0x0) type:hp
[    4.413866] mt7925e 0000:c0:00.0: ASIC revision: 79250000
[    4.414781] kvm_amd: Nested Paging enabled
[    4.415687] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=3D0 (0x0/=
0x0/0x0/0x0/0x0)
[    4.416450] kvm_amd: LBR virtualization supported
[    4.417701] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=3D0 (0x0/0x0/0=
x0/0x0/0x0)
[    4.418596] kvm_amd: Virtual VMLOAD VMSAVE supported
[    4.419591] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=3D0x0
[    4.420458] kvm_amd: Virtual GIF supported
[    4.421208] snd_hda_codec_realtek hdaudioC1D0:    inputs:
[    4.421897] kvm_amd: Virtual NMI enabled
[    4.422570] snd_hda_codec_realtek hdaudioC1D0:      Mic=3D0x19
[    4.426422] systemd[1]: Starting Load Kernel Module loop...
[    4.428056] systemd[1]: Clear Stale Hibernate Storage Info was skipped b=
ecause of an unmet condition check (ConditionPathExists=3D/sys/firmware/efi=
/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
[    4.428767] systemd[1]: TPM PCR Machine ID Measurement was skipped becau=
se of an unmet condition check (ConditionSecurity=3Dmeasured-uki).
[    4.429518] systemd[1]: Early TPM SRK Setup was skipped because of an un=
met condition check (ConditionSecurity=3Dmeasured-uki).
[    4.430263] systemd[1]: TPM SRK Setup was skipped because of an unmet co=
ndition check (ConditionSecurity=3Dmeasured-uki).
[    4.431245] systemd[1]: modprobe@dm_mod.service: Deactivated successfull=
y.
[    4.432122] systemd[1]: Finished Load Kernel Module dm_mod.
[    4.433755] systemd[1]: modprobe@loop.service: Deactivated successfully.
[    4.434552] systemd[1]: Finished Load Kernel Module loop.
[    4.436100] systemd[1]: Repartition Root Disk was skipped because no tri=
gger condition checks were met.
[    4.470729] input: HD-Audio Generic Mic as /devices/pci0000:00/0000:00:0=
8.1/0000:c3:00.6/sound/card1/input27
[    4.471672] input: HD-Audio Generic Headphone Front as /devices/pci0000:=
00/0000:00:08.1/0000:c3:00.6/sound/card1/input28
[    4.475576] input: HD-Audio Generic Front Headphone Surround as /devices=
/pci0000:00/0000:00:08.1/0000:c3:00.6/sound/card1/input29
[    4.483601] systemd[1]: Starting Load Kernel Module dm_mod...
[    4.490653] mt7925e 0000:c0:00.0: HW/SW Version: 0x8a108a10, Build Time:=
 20250305132908a

[    4.737366] systemd[1]: Starting Load Kernel Module loop...
[    4.739641] systemd[1]: Clear Stale Hibernate Storage Info was skipped b=
ecause of an unmet condition check (ConditionPathExists=3D/sys/firmware/efi=
/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
[    4.741288] systemd[1]: TPM PCR Machine ID Measurement was skipped becau=
se of an unmet condition check (ConditionSecurity=3Dmeasured-uki).
[    4.743244] systemd[1]: Early TPM SRK Setup was skipped because of an un=
met condition check (ConditionSecurity=3Dmeasured-uki).
[    4.744913] systemd[1]: TPM SRK Setup was skipped because of an unmet co=
ndition check (ConditionSecurity=3Dmeasured-uki).
[    4.746459] systemd[1]: modprobe@dm_mod.service: Deactivated successfull=
y.
[    4.748123] systemd[1]: Finished Load Kernel Module dm_mod.
[    4.751269] systemd[1]: modprobe@loop.service: Deactivated successfully.
[    4.752471] systemd[1]: Finished Load Kernel Module loop.
[    4.754369] systemd[1]: Repartition Root Disk was skipped because no tri=
gger condition checks were met.
[    4.804088] systemd[1]: Mounting /boot...
[    4.807457] systemd[1]: Mounting /mnt/fs...
[    4.811516] systemd[1]: Mounting Temporary Directory /tmp...
[    4.814804] systemd[1]: Virtual Machine and Container Storage (Compatibi=
lity) was skipped because of an unmet condition check (ConditionPathExists=
=3D/var/lib/machines.raw).
[    4.816591] systemd[1]: Listening on Disk Image Download Service Socket.
[    4.820756] systemd[1]: Mounted /mnt/fs.
[    4.824006] systemd[1]: Mounted Temporary Directory /tmp.
[    4.833074] mt7925e 0000:c0:00.0: WM Firmware Version: ____000000, Build=
 Time: 20250305133013
[    4.950570] usb 1-1.1.2: new high-speed USB device number 7 using xhci_h=
cd
[    5.029295] usb 1-1.1.2: New USB device found, idVendor=3D1a40, idProduc=
t=3D0101, bcdDevice=3D 1.11
[    5.030171] usb 1-1.1.2: New USB device strings: Mfr=3D0, Product=3D1, S=
erialNumber=3D0
[    5.030912] usb 1-1.1.2: Product: USB 2.0 Hub
[    5.064813] hub 1-1.1.2:1.0: USB hub found
[    5.065785] hub 1-1.1.2:1.0: 4 ports detected
[    5.272522] [drm] amdgpu kernel modesetting enabled.
[    5.275042] systemd[1]: Mounted /boot.
[    5.277455] systemd[1]: Reached target Local File Systems.
[    5.277677] amdgpu: Virtual CRAT table created for CPU
[    5.279983] amdgpu: Topology: Add CPU node
[    5.280108] amdgpu 0000:c3:00.0: enabling device (0006 -> 0007)
[    5.282648] [drm] initializing kernel modesetting (IP DISCOVERY 0x1002:0=
x1586 0xF111:0x000A 0xD1).
[    5.282680] [drm] register mmio base: 0x90200000
[    5.282682] [drm] register mmio size: 1048576
[    5.285607] systemd[1]: Listening on Boot Entries Service Socket.
[    5.285880] amdgpu 0000:c3:00.0: amdgpu: detected ip block number 0 <soc=
21_common>
[    5.287015] amdgpu 0000:c3:00.0: amdgpu: detected ip block number 1 <gmc=
_v11_0>
[    5.287017] amdgpu 0000:c3:00.0: amdgpu: detected ip block number 2 <ih_=
v6_1>
[    5.288383] amdgpu 0000:c3:00.0: amdgpu: detected ip block number 3 <psp>
[    5.289037] amdgpu 0000:c3:00.0: amdgpu: detected ip block number 4 <smu>
[    5.289725] amdgpu 0000:c3:00.0: amdgpu: detected ip block number 5 <dm>
[    5.290446] amdgpu 0000:c3:00.0: amdgpu: detected ip block number 6 <gfx=
_v11_0>
[    5.291145] amdgpu 0000:c3:00.0: amdgpu: detected ip block number 7 <sdm=
a_v6_0>
[    5.291147] amdgpu 0000:c3:00.0: amdgpu: detected ip block number 8 <vcn=
_v4_0_5>
[    5.291148] amdgpu 0000:c3:00.0: amdgpu: detected ip block number 9 <jpe=
g_v4_0_5>
[    5.291149] amdgpu 0000:c3:00.0: amdgpu: detected ip block number 10 <me=
s_v11_0>
[    5.291150] amdgpu 0000:c3:00.0: amdgpu: detected ip block number 11 <vp=
e_v6_1>
[    5.291152] amdgpu 0000:c3:00.0: amdgpu: detected ip block number 12 <is=
p_ip>
[    5.291165] amdgpu 0000:c3:00.0: amdgpu: Fetched VBIOS from VFCT
[    5.291168] amdgpu: ATOM BIOS: 113-STRXLGEN-001
[    5.297405] systemd[1]: Listening on System Extension Image Management.
[    5.299205] intel_rapl_common: Found RAPL domain package
[    5.299831] intel_rapl_common: Found RAPL domain core
[    5.300049] systemd[1]: Starting Set Up Additional Binary Formats...
[    5.301707] amd_atl: AMD Address Translation Library initialized
[    5.303104] systemd[1]: Update Boot Loader Random Seed was skipped becau=
se no trigger condition checks were met.
[    5.306730] amdgpu 0000:c3:00.0: amdgpu: VPE: collaborate mode true
[    5.317967] systemd[1]: proc-sys-fs-binfmt_misc.automount: Got automount=
 request for /proc/sys/fs/binfmt_misc, triggered by 693 (systemd-binfmt)
[    5.319444] systemd[1]: Mounting Arbitrary Executable File Formats File =
System...
[    5.322104] systemd[1]: Mounted Arbitrary Executable File Formats File S=
ystem.
[    5.323720] systemd[1]: Finished Set Up Additional Binary Formats.
[    5.333637] Console: switching to colour dummy device 80x25
[    5.358038] amdgpu 0000:c3:00.0: amdgpu: Trusted Memory Zone (TMZ) featu=
re disabled as experimental (default)
[    5.358080] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit, f=
ragment size is 9-bit
[    5.358101] amdgpu 0000:c3:00.0: amdgpu: VRAM: 8192M 0x0000008000000000 =
- 0x00000081FFFFFFFF (8192M used)
[    5.358104] amdgpu 0000:c3:00.0: amdgpu: GART: 512M 0x00007FFF00000000 -=
 0x00007FFF1FFFFFFF
[    5.358123] [drm] Detected VRAM RAM=3D8192M, BAR=3D8192M
[    5.358125] [drm] RAM width 256bits LPDDR5
[    5.358575] [drm] amdgpu: 8192M of VRAM memory ready
[    5.358577] [drm] amdgpu: 125000M of GTT memory ready.
[    5.358634] [drm] GART: num cpu pages 131072, num gpu pages 131072
[    5.359207] [drm] PCIE GART of 512M enabled (table at 0x00000081FFB00000=
).
[    5.359634] [drm] Loading DMUB firmware via PSP: version=3D0x09000F00
[    5.359961] [drm] Found VCN firmware Version ENC: 1.23 DEC: 9 VEP: 0 Rev=
ision: 3
[    5.384070] amdgpu 0000:c3:00.0: amdgpu: reserve 0x8c00000 from 0x81e000=
0000 for PSP TMR
[    5.458583] usb 1-1.1.2.1: new full-speed USB device number 8 using xhci=
_hcd
[    5.500547] usb 1-1.2: New USB device found, idVendor=3D046d, idProduct=
=3D0853, bcdDevice=3D 0.13
[    5.500550] usb 1-1.2: New USB device strings: Mfr=3D0, Product=3D2, Ser=
ialNumber=3D1
[    5.500552] usb 1-1.2: Product: PTZ Pro Camera
[    5.500553] usb 1-1.2: SerialNumber: C1A8EC4C
[    5.561276] systemd[1]: Starting Load/Save RF Kill Switch Status...
[    5.561720] mt7925e 0000:c0:00.0 wlp192s0: renamed from wlan0
[    5.578101] input: PTZ Pro Camera Consumer Control as /devices/pci0000:0=
0/0000:00:08.1/0000:c3:00.4/usb1/1-1/1-1.2/1-1.2:1.2/0003:046D:0853.000C/in=
put/input31
[    5.586440] systemd[1]: Started Load/Save RF Kill Switch Status.
[    5.628610] input: PTZ Pro Camera as /devices/pci0000:00/0000:00:08.1/00=
00:c3:00.4/usb1/1-1/1-1.2/1-1.2:1.2/0003:046D:0853.000C/input/input32
[    5.629293] hid-generic 0003:046D:0853.000C: input,hiddev97,hidraw9: USB=
 HID v1.11 Device [PTZ Pro Camera] on usb-0000:c3:00.4-1.2/input2
[    5.637941] mc: Linux media interface: v0.10
[    5.644304] videodev: Linux video capture interface: v2.00
[    5.658821] usb 1-1.2: Found UVC 1.00 device PTZ Pro Camera (046d:0853)
[    5.667342] usbcore: registered new interface driver uvcvideo
[    5.698702] usb 1-1.1.2.1: New USB device found, idVendor=3D0b0e, idProd=
uct=3D0412, bcdDevice=3D 1.09
[    5.698715] usb 1-1.1.2.1: New USB device strings: Mfr=3D0, Product=3D2,=
 SerialNumber=3D3
[    5.698720] usb 1-1.1.2.1: Product: Jabra SPEAK 410 USB
[    5.698723] usb 1-1.1.2.1: SerialNumber: 50C971FEFA54x010900
[    5.744806] usbcore: registered new device driver usbip-host
[    5.745853] systemd[1]: Finished Load Kernel Modules.
[    5.746702] systemd[1]: Starting Apply Kernel Variables...
[    5.769334] Bluetooth: Core ver 2.22
[    5.769347] NET: Registered PF_BLUETOOTH protocol family
[    5.769349] Bluetooth: HCI device and connection manager initialized
[    5.769352] Bluetooth: HCI socket layer initialized
[    5.769354] Bluetooth: L2CAP socket layer initialized
[    5.769356] Bluetooth: SCO socket layer initialized
[    5.783423] usbcore: registered new interface driver btusb
[    5.784004] systemd[1]: Finished Apply Kernel Variables.
[    5.786120] systemd[1]: Starting Load Kernel Module dm_mod...
[    5.786498] systemd[1]: Starting Load Kernel Module loop...
[    5.786539] systemd[1]: Update Boot Loader Random Seed was skipped becau=
se no trigger condition checks were met.
[    5.786553] systemd[1]: Clear Stale Hibernate Storage Info was skipped b=
ecause of an unmet condition check (ConditionPathExists=3D/sys/firmware/efi=
/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
[    5.786573] systemd[1]: TPM PCR Machine ID Measurement was skipped becau=
se of an unmet condition check (ConditionSecurity=3Dmeasured-uki).
[    5.786586] systemd[1]: Early TPM SRK Setup was skipped because of an un=
met condition check (ConditionSecurity=3Dmeasured-uki).
[    5.786593] systemd[1]: TPM SRK Setup was skipped because of an unmet co=
ndition check (ConditionSecurity=3Dmeasured-uki).
[    5.811531] systemd[1]: modprobe@dm_mod.service: Deactivated successfull=
y.
[    5.811603] systemd[1]: Finished Load Kernel Module dm_mod.
[    5.811709] systemd[1]: modprobe@loop.service: Deactivated successfully.
[    5.811756] systemd[1]: Finished Load Kernel Module loop.
[    5.811829] systemd[1]: Repartition Root Disk was skipped because no tri=
gger condition checks were met.
[    5.893988] Bluetooth: hci0: HW/SW Version: 0x00000000, Build Time: 2025=
0305133215
[    6.009271] amdgpu 0000:c3:00.0: amdgpu: RAS: optional ras ta ucode is n=
ot available
[    6.012864] amdgpu 0000:c3:00.0: amdgpu: RAP: optional rap ta ucode is n=
ot available
[    6.012867] amdgpu 0000:c3:00.0: amdgpu: SECUREDISPLAY: securedisplay ta=
 ucode is not available
[    6.045873] amdgpu 0000:c3:00.0: amdgpu: SMU is initialized successfully!
[    6.045878] [drm] Seamless boot condition check passed
[    6.047148] [drm] Display Core v3.2.316 initialized on DCN 3.5.1
[    6.047150] [drm] DP-HDMI FRL PCON supported
[    6.049667] [drm] DMUB hardware initialized: version=3D0x09000F00
[    6.068705] snd_hda_intel 0000:c3:00.1: bound 0000:c3:00.0 (ops amdgpu_d=
m_audio_component_bind_ops [amdgpu])
[    6.107983] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
[    6.107996] kfd kfd: amdgpu: Total number of KFD nodes to be created: 1
[    6.108905] amdgpu: Virtual CRAT table created for GPU
[    6.109832] amdgpu: Topology: Add dGPU node [0x1586:0x1002]
[    6.109834] kfd kfd: amdgpu: added device 1002:1586
[    6.109842] amdgpu 0000:c3:00.0: amdgpu: SE 2, SH per SE 2, CU per SH 10=
, active_cu_number 40
[    6.109846] amdgpu 0000:c3:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng =
0 on hub 0
[    6.109848] amdgpu 0000:c3:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng=
 1 on hub 0
[    6.109849] amdgpu 0000:c3:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng=
 4 on hub 0
[    6.109850] amdgpu 0000:c3:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng=
 6 on hub 0
[    6.109851] amdgpu 0000:c3:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng=
 7 on hub 0
[    6.109852] amdgpu 0000:c3:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng=
 8 on hub 0
[    6.109853] amdgpu 0000:c3:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng=
 9 on hub 0
[    6.109854] amdgpu 0000:c3:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng=
 10 on hub 0
[    6.109855] amdgpu 0000:c3:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng=
 11 on hub 0
[    6.109856] amdgpu 0000:c3:00.0: amdgpu: ring sdma0 uses VM inv eng 12 o=
n hub 0
[    6.109857] amdgpu 0000:c3:00.0: amdgpu: ring vcn_unified_0 uses VM inv =
eng 0 on hub 8
[    6.109858] amdgpu 0000:c3:00.0: amdgpu: ring vcn_unified_1 uses VM inv =
eng 1 on hub 8
[    6.109859] amdgpu 0000:c3:00.0: amdgpu: ring jpeg_dec_0 uses VM inv eng=
 4 on hub 8
[    6.109860] amdgpu 0000:c3:00.0: amdgpu: ring jpeg_dec_1 uses VM inv eng=
 6 on hub 8
[    6.109861] amdgpu 0000:c3:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM inv =
eng 13 on hub 0
[    6.109862] amdgpu 0000:c3:00.0: amdgpu: ring vpe uses VM inv eng 7 on h=
ub 8
[    6.110313] [drm] ring gfx_32768.1.1 was added
[    6.110492] [drm] ring compute_32768.2.2 was added
[    6.110949] [drm] ring sdma_32768.3.3 was added
[    6.110986] [drm] ring gfx_32768.1.1 ib test pass
[    6.111025] [drm] ring compute_32768.2.2 ib test pass
[    6.111135] [drm] ring sdma_32768.3.3 ib test pass
[    6.114050] amdgpu 0000:c3:00.0: amdgpu: Runtime PM not available
[    6.114448] amdgpu 0000:c3:00.0: [drm] Registered 4 planes with drm panic
[    6.114450] [drm] Initialized amdgpu 3.61.0 for 0000:c3:00.0 on minor 1
[    6.120558] [drm] pre_validate_dsc:1601 MST_DSC dsc precompute is not ne=
eded
[    6.123822] usbcore: registered new interface driver snd-usb-audio
[    6.125023] systemd[1]: systemd-vconsole-setup.service: Deactivated succ=
essfully.
[    6.125094] systemd[1]: Stopped Virtual Console Setup.
[    6.154387] Console: switching to colour frame buffer device 240x67
[    6.175005] amdgpu 0000:c3:00.0: [drm] fb0: amdgpudrmfb frame buffer dev=
ice
[    6.175238] systemd[1]: Stopping Virtual Console Setup...
[    6.176415] systemd[1]: Starting Virtual Console Setup...
[    6.204919] systemd[1]: Starting Load Kernel Module dm_mod...
[    6.205381] systemd[1]: Starting Load Kernel Module loop...
[    6.205440] systemd[1]: Update Boot Loader Random Seed was skipped becau=
se no trigger condition checks were met.
[    6.205505] systemd[1]: Clear Stale Hibernate Storage Info was skipped b=
ecause of an unmet condition check (ConditionPathExists=3D/sys/firmware/efi=
/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
[    6.205668] systemd[1]: TPM PCR Machine ID Measurement was skipped becau=
se of an unmet condition check (ConditionSecurity=3Dmeasured-uki).
[    6.205728] systemd[1]: Early TPM SRK Setup was skipped because of an un=
met condition check (ConditionSecurity=3Dmeasured-uki).
[    6.205779] systemd[1]: TPM SRK Setup was skipped because of an unmet co=
ndition check (ConditionSecurity=3Dmeasured-uki).
[    6.206352] systemd[1]: Started Journal Service.
[    6.218929] systemd-journald[489]: Received client request to flush runt=
ime journal.
[    6.583557] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    6.584154] Bluetooth: BNEP filters: protocol multicast
[    6.584667] Bluetooth: BNEP socket layer initialized
[    6.679588] Realtek Internal NBASE-T PHY r8169-0-bf00:00: attached PHY d=
river (mii_bus:phy_addr=3Dr8169-0-bf00:00, irq=3DMAC)
[    6.857728] r8169 0000:bf:00.0 enp191s0: Link is Down
[    7.692388] Bluetooth: hci0: Device setup in 1864040 usecs
[    7.693091] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection c=
ommand is advertised, but not supported.
[    7.778138] Bluetooth: hci0: AOSP extensions version v1.00
[    7.778144] Bluetooth: hci0: AOSP quality report is supported
[    7.778307] Bluetooth: MGMT ver 1.23
[    7.784994] NET: Registered PF_ALG protocol family
[    9.370961] HDR SB:e9 02 00 ee 7c 78 40 8e 3a 1c 75 60 1d a3 0b 09
[    9.370971] HDR SB:3d 47 40 00 00 00 00 00 00 00 00 00 00 00 00 00
[    9.371117] HDR SB:e9 02 00 ee 7c 78 40 8e 3a 1c 75 60 1d a3 0b 09
[    9.371118] HDR SB:3d 47 40 00 00 00 00 00 00 00 00 00 00 00 00 00
[    9.371170] HDR SB:e9 02 00 ee 7c 78 40 8e 3a 1c 75 60 1d a3 0b 09
[    9.371171] HDR SB:3d 47 40 00 00 00 00 00 00 00 00 00 00 00 00 00
[    9.371245] HDR SB:e9 02 00 ee 7c 78 40 8e 3a 1c 75 60 1d a3 0b 09
[    9.371246] HDR SB:3d 47 40 00 00 00 00 00 00 00 00 00 00 00 00 00
[    9.371965] HDR SB:e9 02 00 ee 7c 78 40 8e 3a 1c 75 60 1d a3 0b 09
[    9.371966] HDR SB:3d 47 40 00 00 00 00 00 00 00 00 00 00 00 00 00
[    9.372039] HDR SB:e9 02 00 ee 7c 78 40 8e 3a 1c 75 60 1d a3 0b 09
[    9.372040] HDR SB:3d 47 40 00 00 00 00 00 00 00 00 00 00 00 00 00
[    9.372902] HDR SB:e9 02 00 ee 7c 78 40 8e 3a 1c 75 60 1d a3 0b 09
[    9.372903] HDR SB:3d 47 40 00 00 00 00 00 00 00 00 00 00 00 00 00
[    9.372974] HDR SB:e9 02 00 ee 7c 78 40 8e 3a 1c 75 60 1d a3 0b 09
[    9.372975] HDR SB:3d 47 40 00 00 00 00 00 00 00 00 00 00 00 00 00
[    9.439469] HDR SB:e9 02 00 ee 7c 78 40 8e 3a 1c 75 60 1d a3 0b 09
[    9.439478] HDR SB:3d 47 40 00 00 00 00 00 00 00 00 00 00 00 00 00
[    9.439631] HDR SB:e9 02 00 ee 7c 78 40 8e 3a 1c 75 60 1d a3 0b 09
[    9.439632] HDR SB:3d 47 40 00 00 00 00 00 00 00 00 00 00 00 00 00
[    9.586646] r8169 0000:bf:00.0 enp191s0: Link is Up - 1Gbps/Full - flow =
control off
[   10.080912] Bluetooth: RFCOMM TTY layer initialized
[   10.080925] Bluetooth: RFCOMM socket layer initialized
[   10.080930] Bluetooth: RFCOMM ver 1.11
[   10.274519] nvme nvme0: using unchecked data buffer
[   10.291914] block nvme0n1: No UUID available providing old NGUID
[   10.465380] warning: `kdeconnectd' uses wireless extensions which will s=
top working for Wi-Fi 7 hardware; use nl80211
[   10.654084] input: solaar-keyboard as /devices/virtual/input/input36
[   18.107708] logitech-hidpp-device 0003:046D:404C.0004: HID++ 4.1 device =
connected.

--637wz5agv4n5q4nk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="6.13.dmesg"
Content-Transfer-Encoding: quoted-printable

[    0.000000] Linux version 6.13.0-arch1-1 (linux@archlinux) (gcc (GCC) 14=
=2E2.1 20240910, GNU ld (GNU Binutils) 2.43.1) #1 SMP PREEMPT_DYNAMIC Thu, =
23 Jan 2025 01:16:42 +0000
[    0.000000] Command line: BOOT_IMAGE=3D/vmlinuz-linux root=3DUUID=3D4630=
8bde-204e-42aa-947e-08da42de7b3a rw rootflags=3Dsubvol=3Droot loglevel=3D9 =
console=3DttyS4,115200 console=3Dtty0
[    0.000000] x86/split lock detection: #DB: warning on user-space bus_loc=
ks
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009f000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000009afffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000009b00000-0x0000000009dfffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000009e00000-0x0000000009efffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000009f00000-0x0000000009f87fff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x0000000009f88000-0x0000000066b53fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000066b54000-0x000000006ad53fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000006ad54000-0x000000006ad66fff] usable
[    0.000000] BIOS-e820: [mem 0x000000006ad67000-0x000000006ad6bfff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000006ad6c000-0x0000000076f7efff] usable
[    0.000000] BIOS-e820: [mem 0x0000000076f7f000-0x000000007977efff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000007977f000-0x0000000079f7efff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x0000000079f7f000-0x0000000079ffefff] ACPI =
data
[    0.000000] BIOS-e820: [mem 0x0000000079fff000-0x0000000079ffffff] usable
[    0.000000] BIOS-e820: [mem 0x000000007a000000-0x000000007bffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000007d675000-0x00000000ffffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x0000001e7e0bffff] usable
[    0.000000] BIOS-e820: [mem 0x0000001e7e0c0000-0x00000020b01fffff] reser=
ved
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] APIC: Static calls initialized
[    0.000000] e820: update [mem 0x6ad73018-0x6ad77457] usable =3D=3D> usab=
le
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000009ef=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000000009f000-0x00000000000fff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x0000000009afff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000000009b00000-0x0000000009dfff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000009e00000-0x0000000009efff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000000009f00000-0x0000000009f87f=
ff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x0000000009f88000-0x0000000066b53f=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000000066b54000-0x000000006ad53f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x000000006ad54000-0x000000006ad66f=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000006ad67000-0x000000006ad6bf=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x000000006ad6c000-0x000000006ad730=
17] usable
[    0.000000] reserve setup_data: [mem 0x000000006ad73018-0x000000006ad774=
57] usable
[    0.000000] reserve setup_data: [mem 0x000000006ad77458-0x0000000076f7ef=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000000076f7f000-0x000000007977ef=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x000000007977f000-0x0000000079f7ef=
ff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x0000000079f7f000-0x0000000079ffef=
ff] ACPI data
[    0.000000] reserve setup_data: [mem 0x0000000079fff000-0x0000000079ffff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000007a000000-0x000000007bffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x000000007d675000-0x00000000ffffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000100000000-0x0000001e7e0bff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000001e7e0c0000-0x00000020b01fff=
ff] reserved
[    0.000000] efi: EFI v2.9 by INSYDE Corp.
[    0.000000] efi: ACPI=3D0x79ffe000 ACPI 2.0=3D0x79ffe014 TPMFinalLog=3D0=
x79f3e000 SMBIOS=3D0x77e75000 SMBIOS 3.0=3D0x77e72000 MEMATTR=3D0x6d118018 =
ESRT=3D0x73533d18 INITRD=3D0x6ad78b18 RNG=3D0x79f93018 TPMEventLog=3D0x79f9=
1018=20
[    0.000000] random: crng init done
[    0.000000] efi: Remove mem60: MMIO range=3D[0x80000000-0xffffffff] (204=
8MB) from e820 map
[    0.000000] e820: remove [mem 0x80000000-0xffffffff] reserved
[    0.000000] efi: Remove mem62: MMIO range=3D[0x2090000000-0x20b01fffff] =
(514MB) from e820 map
[    0.000000] e820: remove [mem 0x2090000000-0x20b01fffff] reserved
[    0.000000] SMBIOS 3.3.0 present.
[    0.000000] DMI: Framework Desktop (AMD Ryzen AI Max 300 Series)/FRANMFC=
P06, BIOS 01.06 03/06/2025
[    0.000000] DMI: Memory slots populated: 8/8
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 2894.617 MHz processor
[    0.000007] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.000008] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000013] last_pfn =3D 0x1e7e0c0 max_arch_pfn =3D 0x400000000
[    0.000020] MTRR map: 8 entries (3 fixed + 5 variable; max 20), built fr=
om 9 variable MTRRs
[    0.000021] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT=
 =20
[    0.000221] last_pfn =3D 0x7a000 max_arch_pfn =3D 0x400000000
[    0.003413] esrt: Reserving ESRT space from 0x0000000073533d18 to 0x0000=
000073533d50.
[    0.003420] e820: update [mem 0x73533000-0x73533fff] usable =3D=3D> rese=
rved
[    0.003434] Using GB pages for direct mapping
[    0.003591] Secure boot disabled
[    0.003592] RAMDISK: [mem 0x61e52000-0x62721fff]
[    0.003605] ACPI: Early table checksum verification disabled
[    0.003609] ACPI: RSDP 0x0000000079FFE014 000024 (v02 INSYDE)
[    0.003612] ACPI: XSDT 0x0000000079FA8228 00019C (v01 INSYDE EDK2     00=
000001      01000013)
[    0.003618] ACPI: FACP 0x0000000079FEE000 000114 (v06 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003622] ACPI: DSDT 0x0000000079FC6000 0074C5 (v02 INSYDE EDK2     00=
040000 ACPI 00040000)
[    0.003624] ACPI: FACS 0x0000000079E32000 000040
[    0.003626] ACPI: UEFI 0x0000000079F66000 0001CF (v01 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003627] ACPI: ASF! 0x0000000079FFC000 000085 (v32 INSYDE EDK2     00=
000002 ACPI 00040000)
[    0.003629] ACPI: SSDT 0x0000000079FF3000 008411 (v02 INSYDE EDK2     00=
000002 ACPI 00040000)
[    0.003630] ACPI: SSDT 0x0000000079FF2000 00033E (v02 INSYDE EDK2     00=
001000 ACPI 00040000)
[    0.003631] ACPI: ASF! 0x0000000079FF0000 0000A5 (v32 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003632] ACPI: BOOT 0x0000000079FEF000 000028 (v01 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003633] ACPI: HPET 0x0000000079FED000 000038 (v01 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003635] ACPI: MCFG 0x0000000079FEC000 00003C (v01 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003636] ACPI: SLIC 0x0000000079FEB000 000176 (v01 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003637] ACPI: APIC 0x0000000079FE1000 00016A (v06 INSYDE EDK2     00=
000002 ACPI 00040000)
[    0.003638] ACPI: SSDT 0x0000000079FE0000 000A6A (v02 INSYDE EDK2     00=
001000 ACPI 00040000)
[    0.003640] ACPI: SSDT 0x0000000079FD5000 00A8CE (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003641] ACPI: VFCT 0x0000000079FD0000 004484 (v01 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003642] ACPI: FPDT 0x0000000079FCF000 000044 (v01 INSYDE EDK2     00=
000002 ACPI 00040000)
[    0.003643] ACPI: SSDT 0x0000000079FCE000 0000FA (v02 INSYDE EDK2     00=
001000 ACPI 00040000)
[    0.003644] ACPI: SSDT 0x0000000079FE8000 0006A2 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003646] ACPI: SSDT 0x0000000079FE7000 0008F9 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003647] ACPI: SSDT 0x0000000079FE4000 001DB7 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003648] ACPI: SSDT 0x0000000079FFD000 000782 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003649] ACPI: SSDT 0x0000000079FE3000 00073F (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003650] ACPI: SSDT 0x0000000079FE2000 000CA9 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003652] ACPI: SSDT 0x0000000079FC3000 002AA6 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003653] ACPI: SSDT 0x0000000079FB9000 009A9F (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003654] ACPI: WSMT 0x0000000079FB7000 000028 (v01 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003655] ACPI: TPM2 0x0000000079FEA000 000050 (v05 INSYDE EDK2     20=
505348 ACPI 00040000)
[    0.003657] ACPI: SSDT 0x0000000079FB5000 001EE8 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003658] ACPI: SSDT 0x0000000079FE9000 00010D (v02 INSYDE EDK2     00=
000004 ACPI 00040000)
[    0.003659] ACPI: SSDT 0x0000000079FB4000 000051 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003660] ACPI: IVRS 0x0000000079FB3000 0001F6 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003661] ACPI: SSDT 0x0000000079FB2000 000B07 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003662] ACPI: SSDT 0x0000000079FB1000 00085D (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003664] ACPI: SSDT 0x0000000079FB0000 000AF4 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003665] ACPI: SSDT 0x0000000079FAF000 000CEE (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003666] ACPI: SSDT 0x0000000079FAE000 000CEE (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003667] ACPI: SSDT 0x0000000079FAD000 0004FC (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003668] ACPI: SSDT 0x0000000079FAC000 00005E (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003670] ACPI: SSDT 0x0000000079FAA000 00188C (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003671] ACPI: SSDT 0x0000000079FA9000 000500 (v02 INSYDE EDK2     00=
000002 ACPI 00040000)
[    0.003672] ACPI: SSDT 0x0000000079FA6000 0010BB (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003673] ACPI: SSDT 0x0000000079F9C000 0097A5 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003674] ACPI: SSDT 0x0000000079F97000 004608 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003676] ACPI: SSDT 0x0000000079FE6000 000A40 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003677] ACPI: SSDT 0x0000000079F96000 0009D0 (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003678] ACPI: SSDT 0x0000000079F95000 00008D (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003679] ACPI: SSDT 0x0000000079F94000 000F5C (v02 INSYDE EDK2     00=
000001 ACPI 00040000)
[    0.003680] ACPI: BGRT 0x0000000079FB8000 000038 (v01 INSYDE EDK2     00=
000002 ACPI 00040000)
[    0.003681] ACPI: Reserving FACP table memory at [mem 0x79fee000-0x79fee=
113]
[    0.003682] ACPI: Reserving DSDT table memory at [mem 0x79fc6000-0x79fcd=
4c4]
[    0.003682] ACPI: Reserving FACS table memory at [mem 0x79e32000-0x79e32=
03f]
[    0.003682] ACPI: Reserving UEFI table memory at [mem 0x79f66000-0x79f66=
1ce]
[    0.003683] ACPI: Reserving ASF! table memory at [mem 0x79ffc000-0x79ffc=
084]
[    0.003683] ACPI: Reserving SSDT table memory at [mem 0x79ff3000-0x79ffb=
410]
[    0.003683] ACPI: Reserving SSDT table memory at [mem 0x79ff2000-0x79ff2=
33d]
[    0.003683] ACPI: Reserving ASF! table memory at [mem 0x79ff0000-0x79ff0=
0a4]
[    0.003684] ACPI: Reserving BOOT table memory at [mem 0x79fef000-0x79fef=
027]
[    0.003684] ACPI: Reserving HPET table memory at [mem 0x79fed000-0x79fed=
037]
[    0.003684] ACPI: Reserving MCFG table memory at [mem 0x79fec000-0x79fec=
03b]
[    0.003684] ACPI: Reserving SLIC table memory at [mem 0x79feb000-0x79feb=
175]
[    0.003684] ACPI: Reserving APIC table memory at [mem 0x79fe1000-0x79fe1=
169]
[    0.003685] ACPI: Reserving SSDT table memory at [mem 0x79fe0000-0x79fe0=
a69]
[    0.003685] ACPI: Reserving SSDT table memory at [mem 0x79fd5000-0x79fdf=
8cd]
[    0.003685] ACPI: Reserving VFCT table memory at [mem 0x79fd0000-0x79fd4=
483]
[    0.003685] ACPI: Reserving FPDT table memory at [mem 0x79fcf000-0x79fcf=
043]
[    0.003686] ACPI: Reserving SSDT table memory at [mem 0x79fce000-0x79fce=
0f9]
[    0.003686] ACPI: Reserving SSDT table memory at [mem 0x79fe8000-0x79fe8=
6a1]
[    0.003686] ACPI: Reserving SSDT table memory at [mem 0x79fe7000-0x79fe7=
8f8]
[    0.003686] ACPI: Reserving SSDT table memory at [mem 0x79fe4000-0x79fe5=
db6]
[    0.003687] ACPI: Reserving SSDT table memory at [mem 0x79ffd000-0x79ffd=
781]
[    0.003687] ACPI: Reserving SSDT table memory at [mem 0x79fe3000-0x79fe3=
73e]
[    0.003687] ACPI: Reserving SSDT table memory at [mem 0x79fe2000-0x79fe2=
ca8]
[    0.003687] ACPI: Reserving SSDT table memory at [mem 0x79fc3000-0x79fc5=
aa5]
[    0.003688] ACPI: Reserving SSDT table memory at [mem 0x79fb9000-0x79fc2=
a9e]
[    0.003688] ACPI: Reserving WSMT table memory at [mem 0x79fb7000-0x79fb7=
027]
[    0.003688] ACPI: Reserving TPM2 table memory at [mem 0x79fea000-0x79fea=
04f]
[    0.003688] ACPI: Reserving SSDT table memory at [mem 0x79fb5000-0x79fb6=
ee7]
[    0.003689] ACPI: Reserving SSDT table memory at [mem 0x79fe9000-0x79fe9=
10c]
[    0.003689] ACPI: Reserving SSDT table memory at [mem 0x79fb4000-0x79fb4=
050]
[    0.003689] ACPI: Reserving IVRS table memory at [mem 0x79fb3000-0x79fb3=
1f5]
[    0.003689] ACPI: Reserving SSDT table memory at [mem 0x79fb2000-0x79fb2=
b06]
[    0.003690] ACPI: Reserving SSDT table memory at [mem 0x79fb1000-0x79fb1=
85c]
[    0.003690] ACPI: Reserving SSDT table memory at [mem 0x79fb0000-0x79fb0=
af3]
[    0.003690] ACPI: Reserving SSDT table memory at [mem 0x79faf000-0x79faf=
ced]
[    0.003690] ACPI: Reserving SSDT table memory at [mem 0x79fae000-0x79fae=
ced]
[    0.003691] ACPI: Reserving SSDT table memory at [mem 0x79fad000-0x79fad=
4fb]
[    0.003691] ACPI: Reserving SSDT table memory at [mem 0x79fac000-0x79fac=
05d]
[    0.003691] ACPI: Reserving SSDT table memory at [mem 0x79faa000-0x79fab=
88b]
[    0.003691] ACPI: Reserving SSDT table memory at [mem 0x79fa9000-0x79fa9=
4ff]
[    0.003691] ACPI: Reserving SSDT table memory at [mem 0x79fa6000-0x79fa7=
0ba]
[    0.003692] ACPI: Reserving SSDT table memory at [mem 0x79f9c000-0x79fa5=
7a4]
[    0.003692] ACPI: Reserving SSDT table memory at [mem 0x79f97000-0x79f9b=
607]
[    0.003692] ACPI: Reserving SSDT table memory at [mem 0x79fe6000-0x79fe6=
a3f]
[    0.003692] ACPI: Reserving SSDT table memory at [mem 0x79f96000-0x79f96=
9cf]
[    0.003693] ACPI: Reserving SSDT table memory at [mem 0x79f95000-0x79f95=
08c]
[    0.003693] ACPI: Reserving SSDT table memory at [mem 0x79f94000-0x79f94=
f5b]
[    0.003693] ACPI: Reserving BGRT table memory at [mem 0x79fb8000-0x79fb8=
037]
[    0.003758] No NUMA configuration found
[    0.003759] Faking a node at [mem 0x0000000000000000-0x0000001e7e0bffff]
[    0.003763] NODE_DATA(0) allocated [mem 0x1e7e0952c0-0x1e7e0bffff]
[    0.003885] Zone ranges:
[    0.003886]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.003887]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.003887]   Normal   [mem 0x0000000100000000-0x0000001e7e0bffff]
[    0.003888]   Device   empty
[    0.003888] Movable zone start for each node
[    0.003889] Early memory node ranges
[    0.003889]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.003890]   node   0: [mem 0x0000000000100000-0x0000000009afffff]
[    0.003891]   node   0: [mem 0x0000000009e00000-0x0000000009efffff]
[    0.003891]   node   0: [mem 0x0000000009f88000-0x0000000066b53fff]
[    0.003891]   node   0: [mem 0x000000006ad54000-0x000000006ad66fff]
[    0.003891]   node   0: [mem 0x000000006ad6c000-0x0000000076f7efff]
[    0.003892]   node   0: [mem 0x0000000079fff000-0x0000000079ffffff]
[    0.003892]   node   0: [mem 0x0000000100000000-0x0000001e7e0bffff]
[    0.003897] Initmem setup node 0 [mem 0x0000000000001000-0x0000001e7e0bf=
fff]
[    0.003901] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.003910] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.003973] On node 0, zone DMA32: 768 pages in unavailable ranges
[    0.004603] On node 0, zone DMA32: 136 pages in unavailable ranges
[    0.004649] On node 0, zone DMA32: 16896 pages in unavailable ranges
[    0.004733] On node 0, zone DMA32: 5 pages in unavailable ranges
[    0.004768] On node 0, zone DMA32: 12416 pages in unavailable ranges
[    0.065109] On node 0, zone Normal: 24576 pages in unavailable ranges
[    0.065135] On node 0, zone Normal: 8000 pages in unavailable ranges
[    0.065668] ACPI: PM-Timer IO Port: 0x408
[    0.065677] ACPI: X2APIC_NMI (uid[0xffffffff] high level lint[0x1])
[    0.065678] ACPI: LAPIC_NMI (acpi_id[0xff] high level lint[0x1])
[    0.065691] IOAPIC[0]: apic_id 33, version 33, address 0xfec00000, GSI 0=
-23
[    0.065696] IOAPIC[1]: apic_id 34, version 33, address 0xfd280000, GSI 2=
4-55
[    0.065697] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.065699] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.065702] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.065703] ACPI: HPET id: 0x10228201 base: 0xfed00000
[    0.065713] e820: update [mem 0x6d148000-0x6d196fff] usable =3D=3D> rese=
rved
[    0.065727] CPU topo: Max. logical packages:   1
[    0.065727] CPU topo: Max. logical dies:       2
[    0.065727] CPU topo: Max. dies per package:   2
[    0.065729] CPU topo: Max. threads per core:   2
[    0.065730] CPU topo: Num. cores per package:    16
[    0.065731] CPU topo: Num. threads per package:  32
[    0.065731] CPU topo: Allowing 32 present CPUs plus 0 hotplug CPUs
[    0.065743] PM: hibernation: Registered nosave memory: [mem 0x00000000-0=
x00000fff]
[    0.065744] PM: hibernation: Registered nosave memory: [mem 0x0009f000-0=
x000fffff]
[    0.065745] PM: hibernation: Registered nosave memory: [mem 0x09b00000-0=
x09dfffff]
[    0.065746] PM: hibernation: Registered nosave memory: [mem 0x09f00000-0=
x09f87fff]
[    0.065746] PM: hibernation: Registered nosave memory: [mem 0x66b54000-0=
x6ad53fff]
[    0.065747] PM: hibernation: Registered nosave memory: [mem 0x6ad67000-0=
x6ad6bfff]
[    0.065747] PM: hibernation: Registered nosave memory: [mem 0x6ad73000-0=
x6ad73fff]
[    0.065748] PM: hibernation: Registered nosave memory: [mem 0x6ad77000-0=
x6ad77fff]
[    0.065749] PM: hibernation: Registered nosave memory: [mem 0x6d148000-0=
x6d196fff]
[    0.065749] PM: hibernation: Registered nosave memory: [mem 0x73533000-0=
x73533fff]
[    0.065750] PM: hibernation: Registered nosave memory: [mem 0x76f7f000-0=
x7977efff]
[    0.065750] PM: hibernation: Registered nosave memory: [mem 0x7977f000-0=
x79f7efff]
[    0.065750] PM: hibernation: Registered nosave memory: [mem 0x79f7f000-0=
x79ffefff]
[    0.065751] PM: hibernation: Registered nosave memory: [mem 0x7a000000-0=
x7bffffff]
[    0.065751] PM: hibernation: Registered nosave memory: [mem 0x7c000000-0=
x7d674fff]
[    0.065751] PM: hibernation: Registered nosave memory: [mem 0x7d675000-0=
x7fffffff]
[    0.065751] PM: hibernation: Registered nosave memory: [mem 0x80000000-0=
xffffffff]
[    0.065752] [mem 0x80000000-0xffffffff] available for PCI devices
[    0.065754] Booting paravirtualized kernel on bare hardware
[    0.065756] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 6370452778343963 ns
[    0.068937] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:32 nr_cpu_ids:32 =
nr_node_ids:1
[    0.069509] percpu: Embedded 67 pages/cpu s237568 r8192 d28672 u524288
[    0.069513] pcpu-alloc: s237568 r8192 d28672 u524288 alloc=3D1*2097152
[    0.069514] pcpu-alloc: [0] 00 01 02 03 [0] 04 05 06 07=20
[    0.069516] pcpu-alloc: [0] 08 09 10 11 [0] 12 13 14 15=20
[    0.069517] pcpu-alloc: [0] 16 17 18 19 [0] 20 21 22 23=20
[    0.069518] pcpu-alloc: [0] 24 25 26 27 [0] 28 29 30 31=20
[    0.069529] Kernel command line: BOOT_IMAGE=3D/vmlinuz-linux root=3DUUID=
=3D46308bde-204e-42aa-947e-08da42de7b3a rw rootflags=3Dsubvol=3Droot loglev=
el=3D9 console=3DttyS4,115200 console=3Dtty0
[    0.069573] Unknown kernel command line parameters "BOOT_IMAGE=3D/vmlinu=
z-linux", will be passed to user space.
[    0.069589] printk: log_buf_len individual max cpu contribution: 4096 by=
tes
[    0.069589] printk: log_buf_len total cpu_extra contributions: 126976 by=
tes
[    0.069590] printk: log_buf_len min size: 131072 bytes
[    0.069657] printk: log buffer data + meta data: 262144 + 917504 =3D 117=
9648 bytes
[    0.069657] printk: early log buf free: 112248(85%)
[    0.071625] Dentry cache hash table entries: 8388608 (order: 14, 6710886=
4 bytes, linear)
[    0.072649] Inode-cache hash table entries: 4194304 (order: 13, 33554432=
 bytes, linear)
[    0.072786] Fallback order for Node 0: 0=20
[    0.072792] Built 1 zonelists, mobility grouping on.  Total pages: 31394=
385
[    0.072793] Policy zone: Normal
[    0.072880] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.072930] software IO TLB: area num 32.
[    0.173765] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D32, =
Nodes=3D1
[    0.173809] ftrace: allocating 51633 entries in 202 pages
[    0.200922] ftrace: allocated 202 pages with 4 groups
[    0.200993] Dynamic Preempt: full
[    0.201075] rcu: Preemptible hierarchical RCU implementation.
[    0.201076] rcu: 	RCU restricting CPUs from NR_CPUS=3D8192 to nr_cpu_ids=
=3D32.
[    0.201076] rcu: 	RCU priority boosting: priority 1 delay 500 ms.
[    0.201077] 	Trampoline variant of Tasks RCU enabled.
[    0.201078] 	Rude variant of Tasks RCU enabled.
[    0.201078] 	Tracing variant of Tasks RCU enabled.
[    0.201079] rcu: RCU calculated value of scheduler-enlistment delay is 3=
0 jiffies.
[    0.201079] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D32
[    0.201091] RCU Tasks: Setting shift to 5 and lim to 1 rcu_task_cb_adjus=
t=3D1 rcu_task_cpu_ids=3D32.
[    0.201094] RCU Tasks Rude: Setting shift to 5 and lim to 1 rcu_task_cb_=
adjust=3D1 rcu_task_cpu_ids=3D32.
[    0.201095] RCU Tasks Trace: Setting shift to 5 and lim to 1 rcu_task_cb=
_adjust=3D1 rcu_task_cpu_ids=3D32.
[    0.203366] NR_IRQS: 524544, nr_irqs: 1224, preallocated irqs: 16
[    0.203581] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    0.203703] kfence: initialized - using 2097152 bytes for 255 objects at=
 0x(____ptrval____)-0x(____ptrval____)
[    0.203737] Console: colour dummy device 80x25
[    0.203739] printk: legacy console [tty0] enabled
[    0.203940] ACPI: Core revision 20240827
[    0.204134] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, =
max_idle_ns: 133484873504 ns
[    0.204154] APIC: Switch to symmetric I/O mode setup
[    0.204553] AMD-Vi: ivrs, add hid:AMDI0020, uid:ID00, rdevid:160
[    0.204557] AMD-Vi: ivrs, add hid:AMDI0020, uid:ID01, rdevid:160
[    0.204558] AMD-Vi: ivrs, add hid:AMDI0020, uid:ID02, rdevid:160
[    0.204559] AMD-Vi: ivrs, add hid:AMDI0020, uid:ID03, rdevid:160
[    0.204560] AMD-Vi: ivrs, add hid:MSFT0201, uid:1, rdevid:96
[    0.204561] AMD-Vi: ivrs, add hid:AMDI0020, uid:ID04, rdevid:160
[    0.204562] AMD-Vi: Using global IVHD EFR:0x246577efa2254afa, EFR2:0x10
[    0.205796] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    0.220825] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:=
 0x29b9663904d, max_idle_ns: 440795286807 ns
[    0.220828] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 5791.45 BogoMIPS (lpj=3D9648723)
[    0.220847] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.221083] LVT offset 1 assigned for vector 0xf9
[    0.221276] LVT offset 2 assigned for vector 0xf4
[    0.221335] Last level iTLB entries: 4KB 64, 2MB 64, 4MB 32
[    0.221336] Last level dTLB entries: 4KB 128, 2MB 128, 4MB 64, 1GB 0
[    0.221338] process: using mwait in idle threads
[    0.221341] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user=
 pointer sanitization
[    0.221344] Spectre V2 : Mitigation: Enhanced / Automatic IBRS
[    0.221345] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on context switch
[    0.221347] Spectre V2 : mitigation: Enabling conditional Indirect Branc=
h Prediction Barrier
[    0.221349] Spectre V2 : User space: Mitigation: STIBP always-on protect=
ion
[    0.221351] Speculative Store Bypass: Mitigation: Speculative Store Bypa=
ss disabled via prctl
[    0.221358] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
 registers'
[    0.221360] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.221361] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.221362] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
[    0.221363] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
[    0.221364] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256'
[    0.221365] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys Us=
er registers'
[    0.221367] x86/fpu: Supporting XSAVE feature 0x800: 'Control-flow User =
registers'
[    0.221369] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.221370] x86/fpu: xstate_offset[5]:  832, xstate_sizes[5]:   64
[    0.221371] x86/fpu: xstate_offset[6]:  896, xstate_sizes[6]:  512
[    0.221372] x86/fpu: xstate_offset[7]: 1408, xstate_sizes[7]: 1024
[    0.221373] x86/fpu: xstate_offset[9]: 2432, xstate_sizes[9]:    8
[    0.221375] x86/fpu: xstate_offset[11]: 2440, xstate_sizes[11]:   16
[    0.221376] x86/fpu: Enabled xstate features 0xae7, context size is 2456=
 bytes, using 'compacted' format.
[    0.237821] Freeing SMP alternatives memory: 40K
[    0.237824] pid_max: default: 32768 minimum: 301
[    0.240605] LSM: initializing lsm=3Dcapability,landlock,lockdown,yama,bpf
[    0.240668] landlock: Up and running.
[    0.240671] Yama: becoming mindful.
[    0.240819] LSM support for eBPF active
[    0.240879] Mount-cache hash table entries: 131072 (order: 8, 1048576 by=
tes, linear)
[    0.240921] Mountpoint-cache hash table entries: 131072 (order: 8, 10485=
76 bytes, linear)
[    0.350076] smpboot: CPU0: AMD Eng Sample: 100-000001243-50_Y (family: 0=
x1a, model: 0x70, stepping: 0x0)
[    0.350181] Performance Events: Fam17h+ 16-deep LBR, core perfctr, AMD P=
MU driver.
[    0.350203] ... version:                2
[    0.350204] ... bit width:              48
[    0.350205] ... generic registers:      6
[    0.350205] ... value mask:             0000ffffffffffff
[    0.350206] ... max period:             00007fffffffffff
[    0.350207] ... fixed-purpose events:   0
[    0.350208] ... event mask:             000000000000003f
[    0.350284] signal: max sigframe size: 3376
[    0.350308] rcu: Hierarchical SRCU implementation.
[    0.350309] rcu: 	Max phase no-delay instances is 1000.
[    0.350335] Timer migration: 2 hierarchy levels; 8 children per group; 2=
 crossnode level
[    0.350462] MCE: In-kernel MCE decoding enabled.
[    0.350484] NMI watchdog: Enabled. Permanently consumes one hw-PMU count=
er.
[    0.350589] smp: Bringing up secondary CPUs ...
[    0.350634] smpboot: x86: Booting SMP configuration:
[    0.350635] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7  #8  =
#9 #10 #11 #12 #13 #14 #15 #16 #17 #18 #19 #20 #21 #22 #23 #24 #25 #26 #27 =
#28 #29 #30 #31
[    0.354802] Spectre V2 : Update user space SMT mitigation: STIBP always-=
on
[    0.354802] smp: Brought up 1 node, 32 CPUs
[    0.354802] smpboot: Total of 32 processors activated (185329.46 BogoMIP=
S)
[    0.357732] Memory: 123334516K/125577540K available (18432K kernel code,=
 2693K rwdata, 14448K rodata, 4300K init, 3940K bss, 2204540K reserved, 0K =
cma-reserved)
[    0.358681] devtmpfs: initialized
[    0.358681] x86/mm: Memory block size: 2048MB
[    0.358681] ACPI: PM: Registering ACPI NVS region [mem 0x09f00000-0x09f8=
7fff] (557056 bytes)
[    0.358681] ACPI: PM: Registering ACPI NVS region [mem 0x7977f000-0x79f7=
efff] (8388608 bytes)
[    0.358681] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 6370867519511994 ns
[    0.358681] futex hash table entries: 8192 (order: 7, 524288 bytes, line=
ar)
[    0.358681] pinctrl core: initialized pinctrl subsystem
[    0.358681] PM: RTC time: 19:13:51, date: 2025-04-04
[    0.358681] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.358681] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic alloca=
tions
[    0.360898] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomi=
c allocations
[    0.361036] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for ato=
mic allocations
[    0.361042] audit: initializing netlink subsys (disabled)
[    0.361046] audit: type=3D2000 audit(1743794031.156:1): state=3Dinitiali=
zed audit_enabled=3D0 res=3D1
[    0.361046] thermal_sys: Registered thermal governor 'fair_share'
[    0.361046] thermal_sys: Registered thermal governor 'bang_bang'
[    0.361046] thermal_sys: Registered thermal governor 'step_wise'
[    0.361046] thermal_sys: Registered thermal governor 'user_space'
[    0.361046] thermal_sys: Registered thermal governor 'power_allocator'
[    0.361046] cpuidle: using governor ladder
[    0.361046] cpuidle: using governor menu
[    0.361046] Simple Boot Flag at 0x44 set to 0x1
[    0.361046] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.361046] PCI: ECAM [mem 0xe0000000-0xefffffff] (base 0xe0000000) for =
domain 0000 [bus 00-ff]
[    0.361046] PCI: Using configuration type 1 for base access
[    0.361051] kprobes: kprobe jump-optimization is enabled. All kprobes ar=
e optimized if possible.
[    0.361054] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.361054] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.361054] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.361054] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.361054] fbcon: Taking over console
[    0.361054] ACPI: Added _OSI(Module Device)
[    0.361054] ACPI: Added _OSI(Processor Device)
[    0.361054] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.361054] ACPI: Added _OSI(Processor Aggregator Device)
[    0.369249] ACPI: 33 ACPI AML tables successfully acquired and loaded
[    0.374410] ACPI: USB4 _OSC: OS supports USB3+ DisplayPort+ PCIe+ XDomai=
n+
[    0.374413] ACPI: USB4 _OSC: OS controls USB3+ DisplayPort+ PCIe+ XDomai=
n+
[    0.374710] ACPI: EC: EC started
[    0.374711] ACPI: EC: interrupt blocked
[    0.374882] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    0.374884] ACPI: \_SB_.PCI0.LPC0.EC0_: Boot DSDT EC used to handle tran=
sactions
[    0.374886] ACPI: Interpreter enabled
[    0.374896] ACPI: PM: (supports S0 S4 S5)
[    0.374897] ACPI: Using IOAPIC for interrupt routing
[    0.375171] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    0.375173] PCI: Ignoring E820 reservations for host bridge windows
[    0.375387] ACPI: Enabled 3 GPEs in block 00 to 1F
[    0.376448] ACPI: \_SB_.PCI0.GPP0.PWRS: New power resource
[    0.376895] ACPI: \_SB_.PCI0.GPP0.SWUS.PWRS: New power resource
[    0.377566] ACPI: \_SB_.PCI0.GPP1.PWRS: New power resource
[    0.378002] ACPI: \_SB_.PCI0.GPP1.SWUS.PWRS: New power resource
[    0.378107] ACPI: \_SB_.PCI0.GPP3.PWRS: New power resource
[    0.378384] ACPI: \_SB_.PCI0.GPP4.PWRS: New power resource
[    0.378636] ACPI: \_SB_.PCI0.GPP5.PWRS: New power resource
[    0.378926] ACPI: \_SB_.PCI0.GPP7.P0NV: New power resource
[    0.379345] ACPI: \_SB_.PCI0.GPP9.P0NV: New power resource
[    0.379753] ACPI: \_SB_.PCI0.GPPA.PWRS: New power resource
[    0.379842] ACPI: \_SB_.PCI0.GPPA.VGA_.PWRS: New power resource
[    0.379954] ACPI: \_SB_.PCI0.GPPA.ACP_.PWRS: New power resource
[    0.380070] ACPI: \_SB_.PCI0.GPPA.AZAL.PWRS: New power resource
[    0.380208] ACPI: \_SB_.PCI0.GPPA.HDAU.PWRS: New power resource
[    0.380363] ACPI: \_SB_.PCI0.GPPA.XHC1.PWRS: New power resource
[    0.381003] ACPI: \_SB_.PCI0.GPPC.XHC0.PWRS: New power resource
[    0.381800] ACPI: \_SB_.PCI0.GPPC.XHC3.PWRS: New power resource
[    0.382253] ACPI: \_SB_.PCI0.GPPC.XHC4.PWRS: New power resource
[    0.382709] ACPI: \_SB_.PCI0.GPPC.NHI0.PWRS: New power resource
[    0.382981] ACPI: \_SB_.PCI0.GPPC.NHI1.PWRS: New power resource
[    0.384590] ACPI: \_SB_.PRWL: New power resource
[    0.384600] ACPI: \_SB_.PRWB: New power resource
[    0.385048] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.385052] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI EDR HPX-Type3]
[    0.385082] acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplu=
g AER]
[    0.385128] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME PCIe=
Capability LTR DPC]
[    0.385348] PCI host bridge to bus 0000:00
[    0.385350] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.385352] pci_bus 0000:00: root bus resource [io  0x0d00-0xfeff window]
[    0.385354] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bfff=
f window]
[    0.385355] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000cfff=
f window]
[    0.385357] pci_bus 0000:00: root bus resource [mem 0x000d0000-0x000efff=
f window]
[    0.385358] pci_bus 0000:00: root bus resource [mem 0x80000000-0xdffffff=
f window]
[    0.385359] pci_bus 0000:00: root bus resource [mem 0xf0000000-0xfcfffff=
f window]
[    0.385360] pci_bus 0000:00: root bus resource [mem 0xfec00000-0xfec01ff=
f window]
[    0.385361] pci_bus 0000:00: root bus resource [mem 0xfed45000-0xfed811f=
f window]
[    0.385362] pci_bus 0000:00: root bus resource [mem 0xfed81900-0xfed81ff=
f window]
[    0.385364] pci_bus 0000:00: root bus resource [mem 0xfedc0000-0xfedc0ff=
f window]
[    0.385365] pci_bus 0000:00: root bus resource [mem 0xfedc6000-0xfedc6ff=
f window]
[    0.385366] pci_bus 0000:00: root bus resource [mem 0xfee01000-0xfffffff=
f window]
[    0.385367] pci_bus 0000:00: root bus resource [mem 0x20b0200000-0x9b4ff=
fffff window]
[    0.385368] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.385382] pci 0000:00:00.0: [1022:1507] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.385459] pci 0000:00:00.2: [1022:1508] type 00 class 0x080600 convent=
ional PCI endpoint
[    0.385523] pci 0000:00:01.0: [1022:1509] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.385573] pci 0000:00:01.1: [1022:150a] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.385837] pci 0000:00:01.1: PCI bridge to [bus 01-5f]
[    0.385843] pci 0000:00:01.1:   bridge window [io  0x7000-0xafff]
[    0.385847] pci 0000:00:01.1:   bridge window [mem 0xac000000-0xc3ffffff]
[    0.385890] pci 0000:00:01.1:   bridge window [mem 0x4800000000-0x67ffff=
ffff 64bit pref]
[    0.386064] pci 0000:00:01.1: PME# supported from D0 D3hot D3cold
[    0.386522] pci 0000:00:01.2: [1022:150a] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.386785] pci 0000:00:01.2: PCI bridge to [bus 60-be]
[    0.386791] pci 0000:00:01.2:   bridge window [io  0x3000-0x6fff]
[    0.386794] pci 0000:00:01.2:   bridge window [mem 0x94000000-0xabffffff]
[    0.386838] pci 0000:00:01.2:   bridge window [mem 0x2800000000-0x47ffff=
ffff 64bit pref]
[    0.387006] pci 0000:00:01.2: PME# supported from D0 D3hot D3cold
[    0.387450] pci 0000:00:02.0: [1022:1509] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.387498] pci 0000:00:02.1: [1022:150b] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.387516] pci 0000:00:02.1: PCI bridge to [bus bf]
[    0.387520] pci 0000:00:02.1:   bridge window [io  0x2000-0x2fff]
[    0.387522] pci 0000:00:02.1:   bridge window [mem 0x90f00000-0x90ffffff]
[    0.387585] pci 0000:00:02.1: PME# supported from D0 D3hot D3cold
[    0.387700] pci 0000:00:02.3: [1022:150b] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.387718] pci 0000:00:02.3: PCI bridge to [bus c0]
[    0.387724] pci 0000:00:02.3:   bridge window [mem 0x90400000-0x906fffff]
[    0.387786] pci 0000:00:02.3: PME# supported from D0 D3hot D3cold
[    0.387899] pci 0000:00:02.5: [1022:150b] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.387918] pci 0000:00:02.5: PCI bridge to [bus c1]
[    0.387923] pci 0000:00:02.5:   bridge window [mem 0x90e00000-0x90efffff]
[    0.387984] pci 0000:00:02.5: PME# supported from D0 D3hot D3cold
[    0.388091] pci 0000:00:03.0: [1022:1509] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.388156] pci 0000:00:03.1: [1022:150b] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.388192] pci 0000:00:03.1: PCI bridge to [bus c2]
[    0.388209] pci 0000:00:03.1:   bridge window [mem 0x90d00000-0x90dfffff]
[    0.388309] pci 0000:00:03.1: PME# supported from D0 D3hot D3cold
[    0.388487] pci 0000:00:08.0: [1022:1509] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.388536] pci 0000:00:08.1: [1022:150c] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.388555] pci 0000:00:08.1: PCI bridge to [bus c3]
[    0.388559] pci 0000:00:08.1:   bridge window [io  0x1000-0x1fff]
[    0.388562] pci 0000:00:08.1:   bridge window [mem 0x80000000-0x903fffff]
[    0.388568] pci 0000:00:08.1:   bridge window [mem 0x6800000000-0x69ffff=
ffff 64bit pref]
[    0.388576] pci 0000:00:08.1: enabling Extended Tags
[    0.388623] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
[    0.388721] pci 0000:00:08.2: [1022:150c] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.388755] pci 0000:00:08.2: PCI bridge to [bus c4]
[    0.388761] pci 0000:00:08.2:   bridge window [mem 0x90b00000-0x90cfffff]
[    0.388768] pci 0000:00:08.2:   bridge window [mem 0x6a00000000-0x6a000f=
ffff 64bit pref]
[    0.388775] pci 0000:00:08.2: enabling Extended Tags
[    0.388822] pci 0000:00:08.2: PME# supported from D0 D3hot D3cold
[    0.388913] pci 0000:00:08.3: [1022:150c] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.388932] pci 0000:00:08.3: PCI bridge to [bus c5]
[    0.388937] pci 0000:00:08.3:   bridge window [mem 0x90700000-0x90afffff]
[    0.388950] pci 0000:00:08.3: enabling Extended Tags
[    0.388998] pci 0000:00:08.3: PME# supported from D0 D3hot D3cold
[    0.389160] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500 convent=
ional PCI endpoint
[    0.389248] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100 convent=
ional PCI endpoint
[    0.389343] pci 0000:00:18.0: [1022:12b8] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.389366] pci 0000:00:18.1: [1022:12b9] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.389390] pci 0000:00:18.2: [1022:12ba] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.389412] pci 0000:00:18.3: [1022:12bb] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.389435] pci 0000:00:18.4: [1022:12bc] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.389458] pci 0000:00:18.5: [1022:12bd] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.389480] pci 0000:00:18.6: [1022:12be] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.389503] pci 0000:00:18.7: [1022:12bf] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.389623] pci 0000:00:01.1: PCI bridge to [bus 01-5f]
[    0.389735] pci 0000:00:01.2: PCI bridge to [bus 60-be]
[    0.389804] pci 0000:bf:00.0: [10ec:8126] type 00 class 0x020000 PCIe En=
dpoint
[    0.389820] pci 0000:bf:00.0: BAR 0 [io  0x2000-0x20ff]
[    0.389839] pci 0000:bf:00.0: BAR 2 [mem 0x90f00000-0x90f0ffff 64bit]
[    0.389851] pci 0000:bf:00.0: BAR 4 [mem 0x90f10000-0x90f13fff 64bit]
[    0.389965] pci 0000:bf:00.0: supports D1 D2
[    0.389966] pci 0000:bf:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.390226] pci 0000:00:02.1: PCI bridge to [bus bf]
[    0.390476] pci 0000:c0:00.0: [14c3:0717] type 00 class 0x028000 PCIe En=
dpoint
[    0.390500] pci 0000:c0:00.0: BAR 0 [mem 0x90400000-0x905fffff 64bit]
[    0.390515] pci 0000:c0:00.0: BAR 2 [mem 0x90600000-0x90607fff 64bit]
[    0.390617] pci 0000:c0:00.0: PME# supported from D0 D3hot D3cold
[    0.391196] pci 0000:00:02.3: PCI bridge to [bus c0]
[    0.391409] pci 0000:c1:00.0: [15b7:5049] type 00 class 0x010802 PCIe En=
dpoint
[    0.391425] pci 0000:c1:00.0: BAR 0 [mem 0x90e00000-0x90e03fff 64bit]
[    0.391675] pci 0000:00:02.5: PCI bridge to [bus c1]
[    0.391904] pci 0000:c2:00.0: [15b7:5017] type 00 class 0x010802 PCIe En=
dpoint
[    0.391917] pci 0000:c2:00.0: BAR 0 [mem 0x90d00000-0x90d03fff 64bit]
[    0.392134] pci 0000:00:03.1: PCI bridge to [bus c2]
[    0.392195] pci 0000:c3:00.0: [1002:1586] type 00 class 0x038000 PCIe Le=
gacy Endpoint
[    0.392208] pci 0000:c3:00.0: BAR 0 [mem 0x6800000000-0x69ffffffff 64bit=
 pref]
[    0.392216] pci 0000:c3:00.0: BAR 2 [mem 0x80000000-0x8fffffff 64bit pre=
f]
[    0.392223] pci 0000:c3:00.0: BAR 4 [io  0x1000-0x10ff]
[    0.392228] pci 0000:c3:00.0: BAR 5 [mem 0x90200000-0x902fffff]
[    0.392238] pci 0000:c3:00.0: enabling Extended Tags
[    0.392297] pci 0000:c3:00.0: PME# supported from D1 D2 D3hot D3cold
[    0.392406] pci 0000:c3:00.1: [1002:1640] type 00 class 0x040300 PCIe Le=
gacy Endpoint
[    0.392414] pci 0000:c3:00.1: BAR 0 [mem 0x90308000-0x9030bfff]
[    0.392438] pci 0000:c3:00.1: enabling Extended Tags
[    0.392471] pci 0000:c3:00.1: PME# supported from D1 D2 D3hot D3cold
[    0.392530] pci 0000:c3:00.2: [1022:17e0] type 00 class 0x108000 PCIe En=
dpoint
[    0.392545] pci 0000:c3:00.2: BAR 2 [mem 0x90100000-0x901fffff]
[    0.392555] pci 0000:c3:00.2: BAR 5 [mem 0x9030c000-0x9030dfff]
[    0.392563] pci 0000:c3:00.2: enabling Extended Tags
[    0.392656] pci 0000:c3:00.4: [1022:1587] type 00 class 0x0c0330 PCIe En=
dpoint
[    0.392668] pci 0000:c3:00.4: BAR 0 [mem 0x90000000-0x900fffff 64bit]
[    0.392695] pci 0000:c3:00.4: enabling Extended Tags
[    0.392731] pci 0000:c3:00.4: PME# supported from D0 D3hot D3cold
[    0.392794] pci 0000:c3:00.6: [1022:15e3] type 00 class 0x040300 PCIe En=
dpoint
[    0.392802] pci 0000:c3:00.6: BAR 0 [mem 0x90300000-0x90307fff]
[    0.392826] pci 0000:c3:00.6: enabling Extended Tags
[    0.392859] pci 0000:c3:00.6: PME# supported from D0 D3hot D3cold
[    0.392942] pci 0000:00:08.1: PCI bridge to [bus c3]
[    0.392988] pci 0000:c4:00.0: [1022:150d] type 00 class 0x130000 PCIe En=
dpoint
[    0.393018] pci 0000:c4:00.0: enabling Extended Tags
[    0.393144] pci 0000:c4:00.1: [1022:17f0] type 00 class 0x118000 PCIe En=
dpoint
[    0.393156] pci 0000:c4:00.1: BAR 0 [mem 0x90b00000-0x90bfffff]
[    0.393160] pci 0000:c4:00.1: BAR 1 [mem 0x90c00000-0x90c01fff]
[    0.393167] pci 0000:c4:00.1: BAR 2 [mem 0x6a00000000-0x6a0007ffff 64bit=
 pref]
[    0.393171] pci 0000:c4:00.1: BAR 4 [mem 0x90c03000-0x90c03fff]
[    0.393176] pci 0000:c4:00.1: BAR 5 [mem 0x90c02000-0x90c02fff]
[    0.393183] pci 0000:c4:00.1: enabling Extended Tags
[    0.393299] pci 0000:00:08.2: PCI bridge to [bus c4]
[    0.393352] pci 0000:c5:00.0: [1022:1588] type 00 class 0x0c0330 PCIe En=
dpoint
[    0.393364] pci 0000:c5:00.0: BAR 0 [mem 0x90700000-0x907fffff 64bit]
[    0.393390] pci 0000:c5:00.0: enabling Extended Tags
[    0.393435] pci 0000:c5:00.0: PME# supported from D0 D3hot D3cold
[    0.393528] pci 0000:c5:00.3: [1022:1589] type 00 class 0x0c0330 PCIe En=
dpoint
[    0.393540] pci 0000:c5:00.3: BAR 0 [mem 0x90800000-0x908fffff 64bit]
[    0.393567] pci 0000:c5:00.3: enabling Extended Tags
[    0.393603] pci 0000:c5:00.3: PME# supported from D0 D3hot D3cold
[    0.393664] pci 0000:c5:00.4: [1022:158b] type 00 class 0x0c0330 PCIe En=
dpoint
[    0.393676] pci 0000:c5:00.4: BAR 0 [mem 0x90900000-0x909fffff 64bit]
[    0.393704] pci 0000:c5:00.4: enabling Extended Tags
[    0.393739] pci 0000:c5:00.4: PME# supported from D0 D3hot D3cold
[    0.393800] pci 0000:c5:00.5: [1022:158d] type 00 class 0x0c0340 PCIe En=
dpoint
[    0.393817] pci 0000:c5:00.5: BAR 0 [mem 0x90a00000-0x90a7ffff 64bit]
[    0.393850] pci 0000:c5:00.5: Max Payload Size set to 128 (was 256, max =
256)
[    0.393852] pci 0000:c5:00.5: enabling Extended Tags
[    0.393887] pci 0000:c5:00.5: PME# supported from D0 D3hot D3cold
[    0.393949] pci 0000:c5:00.6: [1022:158e] type 00 class 0x0c0340 PCIe En=
dpoint
[    0.393965] pci 0000:c5:00.6: BAR 0 [mem 0x90a80000-0x90afffff 64bit]
[    0.394212] pci 0000:c5:00.6: Max Payload Size set to 128 (was 256, max =
256)
[    0.394214] pci 0000:c5:00.6: enabling Extended Tags
[    0.394250] pci 0000:c5:00.6: PME# supported from D0 D3hot D3cold
[    0.394333] pci 0000:00:08.3: PCI bridge to [bus c5]
[    0.405157] Low-power S0 idle used by default for system suspend
[    0.405228] ACPI: EC: interrupt unblocked
[    0.405229] ACPI: EC: event unblocked
[    0.405232] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    0.405233] ACPI: EC: GPE=3D0xa
[    0.405234] ACPI: \_SB_.PCI0.LPC0.EC0_: Boot DSDT EC initialization comp=
lete
[    0.405236] ACPI: \_SB_.PCI0.LPC0.EC0_: EC: Used to handle transactions =
and events
[    0.405265] iommu: Default domain type: Translated
[    0.405265] iommu: DMA domain TLB invalidation policy: lazy mode
[    0.405265] SCSI subsystem initialized
[    0.405265] libata version 3.00 loaded.
[    0.405265] ACPI: bus type USB registered
[    0.405265] usbcore: registered new interface driver usbfs
[    0.405265] usbcore: registered new interface driver hub
[    0.405265] usbcore: registered new device driver usb
[    0.413822] EDAC MC: Ver: 3.0.0
[    0.414387] efivars: Registered efivars operations
[    0.414387] NetLabel: Initializing
[    0.414387] NetLabel:  domain hash size =3D 128
[    0.414387] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.414387] NetLabel:  unlabeled traffic allowed by default
[    0.414387] mctp: management component transport protocol core
[    0.414387] NET: Registered PF_MCTP protocol family
[    0.414387] PCI: Using ACPI for IRQ routing
[    0.422839] PCI: pci_cache_line_size set to 64 bytes
[    0.423643] e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
[    0.423645] e820: reserve RAM buffer [mem 0x09b00000-0x0bffffff]
[    0.423646] e820: reserve RAM buffer [mem 0x09f00000-0x0bffffff]
[    0.423647] e820: reserve RAM buffer [mem 0x66b54000-0x67ffffff]
[    0.423648] e820: reserve RAM buffer [mem 0x6ad67000-0x6bffffff]
[    0.423649] e820: reserve RAM buffer [mem 0x6ad73018-0x6bffffff]
[    0.423650] e820: reserve RAM buffer [mem 0x6d148000-0x6fffffff]
[    0.423651] e820: reserve RAM buffer [mem 0x73533000-0x73ffffff]
[    0.423652] e820: reserve RAM buffer [mem 0x76f7f000-0x77ffffff]
[    0.423652] e820: reserve RAM buffer [mem 0x7a000000-0x7bffffff]
[    0.423653] e820: reserve RAM buffer [mem 0x1e7e0c0000-0x1e7fffffff]
[    0.423666] vgaarb: loaded
[    0.423666] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.423666] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
[    0.425264] clocksource: Switched to clocksource tsc-early
[    0.425264] VFS: Disk quotas dquot_6.6.0
[    0.425264] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.425264] pnp: PnP ACPI init
[    0.425264] system 00:00: [mem 0xe0000000-0xefffffff] has been reserved
[    0.425715] system 00:02: [io  0x0400-0x04cf] has been reserved
[    0.425717] system 00:02: [io  0x04d0-0x04d1] has been reserved
[    0.425719] system 00:02: [io  0x04d6] has been reserved
[    0.425720] system 00:02: [io  0x0c00-0x0c01] has been reserved
[    0.425721] system 00:02: [io  0x0c14] has been reserved
[    0.425722] system 00:02: [io  0x0c50-0x0c52] has been reserved
[    0.425723] system 00:02: [io  0x0c6c] has been reserved
[    0.425724] system 00:02: [io  0x0c6f] has been reserved
[    0.425725] system 00:02: [io  0x0cd0-0x0cdb] has been reserved
[    0.425734] system 00:03: [mem 0xff000000-0xffffffff] has been reserved
[    0.425998] pnp: PnP ACPI: found 4 devices
[    0.431507] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, m=
ax_idle_ns: 2085701024 ns
[    0.431537] NET: Registered PF_INET protocol family
[    0.431608] IP idents hash table entries: 262144 (order: 9, 2097152 byte=
s, linear)
[    0.438172] tcp_listen_portaddr_hash hash table entries: 65536 (order: 8=
, 1048576 bytes, linear)
[    0.438232] Table-perturb hash table entries: 65536 (order: 6, 262144 by=
tes, linear)
[    0.438386] TCP established hash table entries: 524288 (order: 10, 41943=
04 bytes, linear)
[    0.438663] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes,=
 linear)
[    0.438717] TCP: Hash tables configured (established 524288 bind 65536)
[    0.438826] MPTCP token hash table entries: 65536 (order: 8, 1572864 byt=
es, linear)
[    0.439009] UDP hash table entries: 65536 (order: 10, 4194304 bytes, lin=
ear)
[    0.439280] UDP-Lite hash table entries: 65536 (order: 10, 4194304 bytes=
, linear)
[    0.439422] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.439427] NET: Registered PF_XDP protocol family
[    0.439437] pci 0000:00:01.1: PCI bridge to [bus 01-5f]
[    0.439446] pci 0000:00:01.1:   bridge window [io  0x7000-0xafff]
[    0.439456] pci 0000:00:01.1:   bridge window [mem 0xac000000-0xc3ffffff]
[    0.439482] pci 0000:00:01.1:   bridge window [mem 0x4800000000-0x67ffff=
ffff 64bit pref]
[    0.439510] pci 0000:00:01.2: PCI bridge to [bus 60-be]
[    0.439512] pci 0000:00:01.2:   bridge window [io  0x3000-0x6fff]
[    0.439536] pci 0000:00:01.2:   bridge window [mem 0x94000000-0xabffffff]
[    0.439562] pci 0000:00:01.2:   bridge window [mem 0x2800000000-0x47ffff=
ffff 64bit pref]
[    0.439590] pci 0000:00:02.1: PCI bridge to [bus bf]
[    0.439592] pci 0000:00:02.1:   bridge window [io  0x2000-0x2fff]
[    0.439595] pci 0000:00:02.1:   bridge window [mem 0x90f00000-0x90ffffff]
[    0.439600] pci 0000:00:02.3: PCI bridge to [bus c0]
[    0.439603] pci 0000:00:02.3:   bridge window [mem 0x90400000-0x906fffff]
[    0.439608] pci 0000:00:02.5: PCI bridge to [bus c1]
[    0.439611] pci 0000:00:02.5:   bridge window [mem 0x90e00000-0x90efffff]
[    0.439615] pci 0000:00:03.1: PCI bridge to [bus c2]
[    0.439624] pci 0000:00:03.1:   bridge window [mem 0x90d00000-0x90dfffff]
[    0.439641] pci 0000:00:08.1: PCI bridge to [bus c3]
[    0.439647] pci 0000:00:08.1:   bridge window [io  0x1000-0x1fff]
[    0.439650] pci 0000:00:08.1:   bridge window [mem 0x80000000-0x903fffff]
[    0.439652] pci 0000:00:08.1:   bridge window [mem 0x6800000000-0x69ffff=
ffff 64bit pref]
[    0.439656] pci 0000:00:08.2: PCI bridge to [bus c4]
[    0.439659] pci 0000:00:08.2:   bridge window [mem 0x90b00000-0x90cfffff]
[    0.439662] pci 0000:00:08.2:   bridge window [mem 0x6a00000000-0x6a000f=
ffff 64bit pref]
[    0.439666] pci 0000:00:08.3: PCI bridge to [bus c5]
[    0.439669] pci 0000:00:08.3:   bridge window [mem 0x90700000-0x90afffff]
[    0.439675] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.439676] pci_bus 0000:00: resource 5 [io  0x0d00-0xfeff window]
[    0.439678] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff windo=
w]
[    0.439679] pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000cffff windo=
w]
[    0.439680] pci_bus 0000:00: resource 8 [mem 0x000d0000-0x000effff windo=
w]
[    0.439681] pci_bus 0000:00: resource 9 [mem 0x80000000-0xdfffffff windo=
w]
[    0.439682] pci_bus 0000:00: resource 10 [mem 0xf0000000-0xfcffffff wind=
ow]
[    0.439683] pci_bus 0000:00: resource 11 [mem 0xfec00000-0xfec01fff wind=
ow]
[    0.439684] pci_bus 0000:00: resource 12 [mem 0xfed45000-0xfed811ff wind=
ow]
[    0.439685] pci_bus 0000:00: resource 13 [mem 0xfed81900-0xfed81fff wind=
ow]
[    0.439686] pci_bus 0000:00: resource 14 [mem 0xfedc0000-0xfedc0fff wind=
ow]
[    0.439687] pci_bus 0000:00: resource 15 [mem 0xfedc6000-0xfedc6fff wind=
ow]
[    0.439688] pci_bus 0000:00: resource 16 [mem 0xfee01000-0xffffffff wind=
ow]
[    0.439689] pci_bus 0000:00: resource 17 [mem 0x20b0200000-0x9b4fffffff =
window]
[    0.439690] pci_bus 0000:01: resource 0 [io  0x7000-0xafff]
[    0.439691] pci_bus 0000:01: resource 1 [mem 0xac000000-0xc3ffffff]
[    0.439692] pci_bus 0000:01: resource 2 [mem 0x4800000000-0x67ffffffff 6=
4bit pref]
[    0.439693] pci_bus 0000:60: resource 0 [io  0x3000-0x6fff]
[    0.439694] pci_bus 0000:60: resource 1 [mem 0x94000000-0xabffffff]
[    0.439695] pci_bus 0000:60: resource 2 [mem 0x2800000000-0x47ffffffff 6=
4bit pref]
[    0.439697] pci_bus 0000:bf: resource 0 [io  0x2000-0x2fff]
[    0.439698] pci_bus 0000:bf: resource 1 [mem 0x90f00000-0x90ffffff]
[    0.439699] pci_bus 0000:c0: resource 1 [mem 0x90400000-0x906fffff]
[    0.439700] pci_bus 0000:c1: resource 1 [mem 0x90e00000-0x90efffff]
[    0.439701] pci_bus 0000:c2: resource 1 [mem 0x90d00000-0x90dfffff]
[    0.439702] pci_bus 0000:c3: resource 0 [io  0x1000-0x1fff]
[    0.439703] pci_bus 0000:c3: resource 1 [mem 0x80000000-0x903fffff]
[    0.439704] pci_bus 0000:c3: resource 2 [mem 0x6800000000-0x69ffffffff 6=
4bit pref]
[    0.439705] pci_bus 0000:c4: resource 1 [mem 0x90b00000-0x90cfffff]
[    0.439706] pci_bus 0000:c4: resource 2 [mem 0x6a00000000-0x6a000fffff 6=
4bit pref]
[    0.439708] pci_bus 0000:c5: resource 1 [mem 0x90700000-0x90afffff]
[    0.440337] pci 0000:c3:00.1: D0 power state depends on 0000:c3:00.0
[    0.440548] PCI: CLS 64 bytes, default 64
[    0.440581] pci 0000:00:00.2: AMD-Vi: IOMMU performance counters support=
ed
[    0.440607] platform MSFT0201:00: Adding to iommu group 0
[    0.440623] Trying to unpack rootfs image as initramfs...
[    0.440721] pci 0000:00:01.0: Adding to iommu group 1
[    0.440731] pci 0000:00:01.1: Adding to iommu group 2
[    0.440739] pci 0000:00:01.2: Adding to iommu group 3
[    0.440752] pci 0000:00:02.0: Adding to iommu group 4
[    0.440760] pci 0000:00:02.1: Adding to iommu group 5
[    0.440768] pci 0000:00:02.3: Adding to iommu group 6
[    0.440776] pci 0000:00:02.5: Adding to iommu group 7
[    0.440785] pci 0000:00:03.0: Adding to iommu group 8
[    0.440793] pci 0000:00:03.1: Adding to iommu group 9
[    0.440810] pci 0000:00:08.0: Adding to iommu group 10
[    0.440817] pci 0000:00:08.1: Adding to iommu group 11
[    0.440824] pci 0000:00:08.2: Adding to iommu group 12
[    0.440831] pci 0000:00:08.3: Adding to iommu group 13
[    0.440842] pci 0000:00:14.0: Adding to iommu group 14
[    0.440848] pci 0000:00:14.3: Adding to iommu group 14
[    0.440875] pci 0000:00:18.0: Adding to iommu group 15
[    0.440882] pci 0000:00:18.1: Adding to iommu group 15
[    0.440889] pci 0000:00:18.2: Adding to iommu group 15
[    0.440896] pci 0000:00:18.3: Adding to iommu group 15
[    0.440903] pci 0000:00:18.4: Adding to iommu group 15
[    0.440910] pci 0000:00:18.5: Adding to iommu group 15
[    0.440917] pci 0000:00:18.6: Adding to iommu group 15
[    0.440923] pci 0000:00:18.7: Adding to iommu group 15
[    0.440935] pci 0000:bf:00.0: Adding to iommu group 16
[    0.440943] pci 0000:c0:00.0: Adding to iommu group 17
[    0.440951] pci 0000:c1:00.0: Adding to iommu group 18
[    0.440958] pci 0000:c2:00.0: Adding to iommu group 19
[    0.440989] pci 0000:c3:00.0: Adding to iommu group 20
[    0.440996] pci 0000:c3:00.1: Adding to iommu group 21
[    0.441006] pci 0000:c3:00.2: Adding to iommu group 22
[    0.441015] pci 0000:c3:00.4: Adding to iommu group 23
[    0.441023] pci 0000:c3:00.6: Adding to iommu group 24
[    0.441033] pci 0000:c4:00.0: Adding to iommu group 25
[    0.441043] pci 0000:c4:00.1: Adding to iommu group 26
[    0.441052] pci 0000:c5:00.0: Adding to iommu group 27
[    0.441061] pci 0000:c5:00.3: Adding to iommu group 28
[    0.441071] pci 0000:c5:00.4: Adding to iommu group 29
[    0.441080] pci 0000:c5:00.5: Adding to iommu group 30
[    0.441089] pci 0000:c5:00.6: Adding to iommu group 31
[    0.443226] AMD-Vi: Extended features (0x246577efa2254afa, 0x10): PPR NX=
 GT [5] IA GA PC GA_vAPIC
[    0.443232] AMD-Vi: Interrupt remapping enabled
[    0.443353] AMD-Vi: Virtual APIC enabled
[    0.443381] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.443406] software IO TLB: mapped [mem 0x000000006d2d0000-0x0000000071=
2d0000] (64MB)
[    0.443433] LVT offset 0 assigned for vector 0x400
[    0.444083] perf: AMD IBS detected (0x00081bff)
[    0.444087] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters/b=
ank).
[    0.453563] Initialise system trusted keyrings
[    0.453573] Key type blacklist registered
[    0.453599] workingset: timestamp_bits=3D36 max_order=3D25 bucket_order=
=3D0
[    0.453682] fuse: init (API version 7.41)
[    0.453740] integrity: Platform Keyring initialized
[    0.453742] integrity: Machine keyring initialized
[    0.458172] Key type asymmetric registered
[    0.458173] Asymmetric key parser 'x509' registered
[    0.458186] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 246)
[    0.458222] io scheduler mq-deadline registered
[    0.458224] io scheduler kyber registered
[    0.458230] io scheduler bfq registered
[    0.459751] ledtrig-cpu: registered to indicate activity on CPUs
[    0.460029] pcieport 0000:00:01.1: PME: Signaling with IRQ 33
[    0.460063] pcieport 0000:00:01.1: pciehp: Slot #0 AttnBtn- PwrCtrl- MRL=
- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActR=
ep+
[    0.460507] pcieport 0000:00:01.2: PME: Signaling with IRQ 34
[    0.460537] pcieport 0000:00:01.2: pciehp: Slot #0 AttnBtn- PwrCtrl- MRL=
- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActR=
ep+
[    0.460805] pcieport 0000:00:02.1: PME: Signaling with IRQ 35
[    0.460939] pcieport 0000:00:02.3: PME: Signaling with IRQ 36
[    0.461073] pcieport 0000:00:02.5: PME: Signaling with IRQ 37
[    0.461247] pcieport 0000:00:03.1: PME: Signaling with IRQ 38
[    0.461428] pcieport 0000:00:08.1: PME: Signaling with IRQ 39
[    0.461580] pcieport 0000:00:08.2: PME: Signaling with IRQ 40
[    0.461707] pcieport 0000:00:08.3: PME: Signaling with IRQ 41
[    0.461775] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.461875] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0C:00/input/input0
[    0.461886] ACPI: button: Power Button [PWRB]
[    0.462201] Monitor-Mwait will be used to enter C-1 state
[    0.464585] Estimated ratio of average max frequency by base frequency (=
times 1024): 1425
[    0.464727] thermal LNXTHERM:00: registered as thermal_zone0
[    0.464728] ACPI: thermal: Thermal Zone [TZ00] (39 C)
[    0.464789] thermal LNXTHERM:01: registered as thermal_zone1
[    0.464790] ACPI: thermal: Thermal Zone [TZ01] (35 C)
[    0.464849] thermal LNXTHERM:02: registered as thermal_zone2
[    0.464850] ACPI: thermal: Thermal Zone [TZ02] (36 C)
[    0.464908] thermal LNXTHERM:03: registered as thermal_zone3
[    0.464909] ACPI: thermal: Thermal Zone [TZ03] (48 C)
[    0.465002] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.465838] Non-volatile memory driver v1.3
[    0.465839] Linux agpgart interface v0.103
[    0.491102] Freeing initrd memory: 9024K
[    1.457767] tsc: Refined TSC clocksource calibration: 2894.556 MHz
[    1.457799] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x29b=
92bfecae, max_idle_ns: 440795214443 ns
[    1.457872] clocksource: Switched to clocksource tsc
[    1.707855] tpm_crb MSFT0101:00: Disabling hwrng
[    1.708920] ACPI: bus type drm_connector registered
[    1.712992] xhci_hcd 0000:c3:00.4: xHCI Host Controller
[    1.713004] xhci_hcd 0000:c3:00.4: new USB bus registered, assigned bus =
number 1
[    1.713358] xhci_hcd 0000:c3:00.4: hcc params 0x0118ffc5 hci version 0x1=
20 quirks 0x0000000200000010
[    1.713760] xhci_hcd 0000:c3:00.4: xHCI Host Controller
[    1.713765] xhci_hcd 0000:c3:00.4: new USB bus registered, assigned bus =
number 2
[    1.713769] xhci_hcd 0000:c3:00.4: Host supports USB 3.1 Enhanced SuperS=
peed
[    1.713822] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.13
[    1.713827] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.713831] usb usb1: Product: xHCI Host Controller
[    1.713834] usb usb1: Manufacturer: Linux 6.13.0-arch1-1 xhci-hcd
[    1.713837] usb usb1: SerialNumber: 0000:c3:00.4
[    1.713984] hub 1-0:1.0: USB hub found
[    1.714001] hub 1-0:1.0: 1 port detected
[    1.714645] usb usb2: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    1.714666] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.13
[    1.714670] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.714673] usb usb2: Product: xHCI Host Controller
[    1.714675] usb usb2: Manufacturer: Linux 6.13.0-arch1-1 xhci-hcd
[    1.714678] usb usb2: SerialNumber: 0000:c3:00.4
[    1.715091] hub 2-0:1.0: USB hub found
[    1.715104] hub 2-0:1.0: 1 port detected
[    1.715750] xhci_hcd 0000:c5:00.0: xHCI Host Controller
[    1.715756] xhci_hcd 0000:c5:00.0: new USB bus registered, assigned bus =
number 3
[    1.716163] xhci_hcd 0000:c5:00.0: hcc params 0x0128ffc5 hci version 0x1=
20 quirks 0x0000000200000010
[    1.716435] xhci_hcd 0000:c5:00.0: xHCI Host Controller
[    1.716438] xhci_hcd 0000:c5:00.0: new USB bus registered, assigned bus =
number 4
[    1.716441] xhci_hcd 0000:c5:00.0: Host supports USB 3.1 Enhanced SuperS=
peed
[    1.716469] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.13
[    1.716473] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.716476] usb usb3: Product: xHCI Host Controller
[    1.716478] usb usb3: Manufacturer: Linux 6.13.0-arch1-1 xhci-hcd
[    1.716481] usb usb3: SerialNumber: 0000:c5:00.0
[    1.716910] hub 3-0:1.0: USB hub found
[    1.716937] hub 3-0:1.0: 5 ports detected
[    1.719121] usb usb4: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    1.719140] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.13
[    1.719143] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.719146] usb usb4: Product: xHCI Host Controller
[    1.719149] usb usb4: Manufacturer: Linux 6.13.0-arch1-1 xhci-hcd
[    1.719151] usb usb4: SerialNumber: 0000:c5:00.0
[    1.719560] hub 4-0:1.0: USB hub found
[    1.719584] hub 4-0:1.0: 2 ports detected
[    1.720739] xhci_hcd 0000:c5:00.3: xHCI Host Controller
[    1.720744] xhci_hcd 0000:c5:00.3: new USB bus registered, assigned bus =
number 5
[    1.721114] xhci_hcd 0000:c5:00.3: hcc params 0x0118ffc5 hci version 0x1=
20 quirks 0x0000000200000010
[    1.721496] xhci_hcd 0000:c5:00.3: xHCI Host Controller
[    1.721499] xhci_hcd 0000:c5:00.3: new USB bus registered, assigned bus =
number 6
[    1.721503] xhci_hcd 0000:c5:00.3: Host supports USB 3.1 Enhanced SuperS=
peed
[    1.721529] usb usb5: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.13
[    1.721533] usb usb5: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.721536] usb usb5: Product: xHCI Host Controller
[    1.721539] usb usb5: Manufacturer: Linux 6.13.0-arch1-1 xhci-hcd
[    1.721541] usb usb5: SerialNumber: 0000:c5:00.3
[    1.721998] hub 5-0:1.0: USB hub found
[    1.722011] hub 5-0:1.0: 1 port detected
[    1.722581] usb usb6: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    1.722599] usb usb6: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.13
[    1.722602] usb usb6: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.722605] usb usb6: Product: xHCI Host Controller
[    1.722607] usb usb6: Manufacturer: Linux 6.13.0-arch1-1 xhci-hcd
[    1.722610] usb usb6: SerialNumber: 0000:c5:00.3
[    1.723028] hub 6-0:1.0: USB hub found
[    1.723044] hub 6-0:1.0: 1 port detected
[    1.723792] xhci_hcd 0000:c5:00.4: xHCI Host Controller
[    1.723797] xhci_hcd 0000:c5:00.4: new USB bus registered, assigned bus =
number 7
[    1.724169] xhci_hcd 0000:c5:00.4: hcc params 0x0118ffc5 hci version 0x1=
20 quirks 0x0000000200000010
[    1.724514] xhci_hcd 0000:c5:00.4: xHCI Host Controller
[    1.724518] xhci_hcd 0000:c5:00.4: new USB bus registered, assigned bus =
number 8
[    1.724521] xhci_hcd 0000:c5:00.4: Host supports USB 3.1 Enhanced SuperS=
peed
[    1.724548] usb usb7: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.13
[    1.724552] usb usb7: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.724554] usb usb7: Product: xHCI Host Controller
[    1.724557] usb usb7: Manufacturer: Linux 6.13.0-arch1-1 xhci-hcd
[    1.724559] usb usb7: SerialNumber: 0000:c5:00.4
[    1.724718] hub 7-0:1.0: USB hub found
[    1.724728] hub 7-0:1.0: 1 port detected
[    1.725290] usb usb8: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    1.725310] usb usb8: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.13
[    1.725314] usb usb8: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.725316] usb usb8: Product: xHCI Host Controller
[    1.725319] usb usb8: Manufacturer: Linux 6.13.0-arch1-1 xhci-hcd
[    1.725321] usb usb8: SerialNumber: 0000:c5:00.4
[    1.725433] hub 8-0:1.0: USB hub found
[    1.725443] hub 8-0:1.0: 1 port detected
[    1.726160] usbcore: registered new interface driver usbserial_generic
[    1.726167] usbserial: USB Serial support registered for generic
[    1.726277] rtc_cmos 00:01: RTC can wake from S4
[    1.726581] rtc_cmos 00:01: registered as rtc0
[    1.726629] rtc_cmos 00:01: setting system clock to 2025-04-04T19:13:52 =
UTC (1743794032)
[    1.726670] rtc_cmos 00:01: alarms up to one month, y3k, 114 bytes nvram
[    1.729520] simple-framebuffer simple-framebuffer.0: [drm] Registered 1 =
planes with drm panic
[    1.729523] [drm] Initialized simpledrm 1.0.0 for simple-framebuffer.0 o=
n minor 0
[    1.735850] Console: switching to colour frame buffer device 240x67
[    1.743809] simple-framebuffer simple-framebuffer.0: [drm] fb0: simpledr=
mdrmfb frame buffer device
[    1.743958] hid: raw HID events driver (C) Jiri Kosina
[    1.744091] drop_monitor: Initializing network drop monitor service
[    1.744219] NET: Registered PF_INET6 protocol family
[    1.748117] Segment Routing with IPv6
[    1.748138] RPL Segment Routing with IPv6
[    1.748161] In-situ OAM (IOAM) with IPv6
[    1.748202] NET: Registered PF_PACKET protocol family
[    1.750683] microcode: Current revision: 0x0b70001e
[    1.752318] resctrl: L3 allocation detected
[    1.752349] resctrl: MB allocation detected
[    1.752369] resctrl: SMBA allocation detected
[    1.752389] resctrl: L3 monitoring detected
[    1.752451] IPI shorthand broadcast: enabled
[    1.753481] sched_clock: Marking stable (1751754763, 551406)->(175993969=
6, -7633527)
[    1.753839] registered taskstats version 1
[    1.754850] Loading compiled-in X.509 certificates
[    1.757261] Loaded X.509 cert 'Build time autogenerated kernel key: 211f=
c6460279d776fe704c7db55eff03f2d58e02'
[    1.757967] Demotion targets for Node 0: null
[    1.758110] Key type .fscrypt registered
[    1.758161] Key type fscrypt-provisioning registered
[    1.758491] PM:   Magic number: 5:471:242
[    1.760077] RAS: Correctable Errors collector initialized.
[    1.765260] clk: Disabling unused clocks
[    1.765332] PM: genpd: Disabling unused power domains
[    1.765970] Freeing unused decrypted memory: 2028K
[    1.766366] Freeing unused kernel image (initmem) memory: 4300K
[    1.766449] Write protecting the kernel read-only data: 34816k
[    1.766779] Freeing unused kernel image (rodata/data gap) memory: 1936K
[    1.785638] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.785724] rodata_test: all tests were successful
[    1.785768] Run /init as init process
[    1.785775]   with arguments:
[    1.785784]     /init
[    1.785791]   with environment:
[    1.785800]     HOME=3D/
[    1.785807]     TERM=3Dlinux
[    1.785814]     BOOT_IMAGE=3D/vmlinuz-linux
[    1.853444] nvme 0000:c2:00.0: platform quirk: setting simple suspend
[    1.853443] nvme 0000:c1:00.0: platform quirk: setting simple suspend
[    1.853571] nvme nvme0: pci function 0000:c2:00.0
[    1.856332] nvme nvme1: pci function 0000:c1:00.0
[    1.889469] nvme nvme0: allocated 64 MiB host memory buffer (1 segment).
[    1.891821] nvme nvme1: 32/0/0 default/read/poll queues
[    1.895259] nvme nvme0: 32/0/0 default/read/poll queues
[    1.901190]  nvme0n1: p1 p2 p3
[    1.913708] raid6: skipped pq benchmark and selected avx512x4
[    1.917236] raid6: using avx512x2 recovery algorithm
[    1.920050] xor: automatically using best checksumming function   avx   =
   =20
[    1.964457] usb 3-2: new high-speed USB device number 2 using xhci_hcd
[    1.965880] usb 1-1: new high-speed USB device number 2 using xhci_hcd
[    1.997658] Btrfs loaded, zoned=3Dyes, fsverity=3Dyes
[    2.104891] usb 3-2: New USB device found, idVendor=3D05e3, idProduct=3D=
0610, bcdDevice=3D10.00
[    2.106181] usb 3-2: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[    2.106777] usb 3-2: Product: USB2.1 Hub
[    2.107233] usb 3-2: Manufacturer: GenesysLogic
[    2.129418] usb 1-1: New USB device found, idVendor=3D0bda, idProduct=3D=
5424, bcdDevice=3D 1.76
[    2.130589] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[    2.131107] usb 1-1: Product: 2-Port USB 2.0 Hub
[    2.131532] usb 1-1: Manufacturer: Generic
[    2.165495] hub 3-2:1.0: USB hub found
[    2.166869] hub 3-2:1.0: 2 ports detected
[    2.195938] hub 1-1:1.0: USB hub found
[    2.199336] hub 1-1:1.0: 2 ports detected
[    2.228730] usb 4-2: new SuperSpeed Plus Gen 2x1 USB device number 2 usi=
ng xhci_hcd
[    2.244796] usb 4-2: New USB device found, idVendor=3D05e3, idProduct=3D=
0625, bcdDevice=3D10.00
[    2.245980] usb 4-2: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[    2.246426] usb 4-2: Product: USB3.2 Hub
[    2.246822] usb 4-2: Manufacturer: GenesysLogic
[    2.258564] usb 2-1: new SuperSpeed Plus Gen 2x1 USB device number 2 usi=
ng xhci_hcd
[    2.276976] hub 4-2:1.0: USB hub found
[    2.278095] hub 4-2:1.0: 2 ports detected
[    2.288435] usb 2-1: New USB device found, idVendor=3D0bda, idProduct=3D=
0424, bcdDevice=3D 1.76
[    2.288903] usb 2-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[    2.289309] usb 2-1: Product: 2-Port USB 3.0 Hub
[    2.289706] usb 2-1: Manufacturer: Generic
[    2.327563] hub 2-1:1.0: USB hub found
[    2.330282] hub 2-1:1.0: 2 ports detected
[    2.357320] usb 3-3: new high-speed USB device number 3 using xhci_hcd
[    2.495303] usb 3-3: New USB device found, idVendor=3D0e8d, idProduct=3D=
0717, bcdDevice=3D 1.00
[    2.496534] usb 3-3: New USB device strings: Mfr=3D5, Product=3D6, Seria=
lNumber=3D7
[    2.497050] usb 3-3: Product: Wireless_Device
[    2.497458] usb 3-3: Manufacturer: MediaTek Inc.
[    2.497868] usb 3-3: SerialNumber: 000000000
[    2.584417] usb 3-2.1: new full-speed USB device number 4 using xhci_hcd
[    2.737823] usb 3-2.1: New USB device found, idVendor=3D046d, idProduct=
=3Dc52b, bcdDevice=3D12.10
[    2.738871] usb 3-2.1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[    2.739334] usb 3-2.1: Product: USB Receiver
[    2.739733] usb 3-2.1: Manufacturer: Logitech
[    2.890461] usbcore: registered new interface driver usbhid
[    2.891562] usbhid: USB HID core driver
[    2.895331] input: Logitech USB Receiver as /devices/pci0000:00/0000:00:=
08.3/0000:c5:00.0/usb3/3-2/3-2.1/3-2.1:1.0/0003:046D:C52B.0001/input/input1
[    2.950951] usb 1-1.1: new high-speed USB device number 3 using xhci_hcd
[    3.024871] hid-generic 0003:046D:C52B.0001: input,hidraw0: USB HID v1.1=
1 Keyboard [Logitech USB Receiver] on usb-0000:c5:00.0-2.1/input0
[    3.026186] input: Logitech USB Receiver Mouse as /devices/pci0000:00/00=
00:00:08.3/0000:c5:00.0/usb3/3-2/3-2.1/3-2.1:1.1/0003:046D:C52B.0002/input/=
input2
[    3.027139] input: Logitech USB Receiver Consumer Control as /devices/pc=
i0000:00/0000:00:08.3/0000:c5:00.0/usb3/3-2/3-2.1/3-2.1:1.1/0003:046D:C52B.=
0002/input/input3
[    3.048270] usb 1-1.1: New USB device found, idVendor=3D05e3, idProduct=
=3D0610, bcdDevice=3D32.98
[    3.049652] usb 1-1.1: New USB device strings: Mfr=3D0, Product=3D1, Ser=
ialNumber=3D0
[    3.050211] usb 1-1.1: Product: USB2.0 Hub
[    3.081472] input: Logitech USB Receiver System Control as /devices/pci0=
000:00/0000:00:08.3/0000:c5:00.0/usb3/3-2/3-2.1/3-2.1:1.1/0003:046D:C52B.00=
02/input/input4
[    3.083481] hid-generic 0003:046D:C52B.0002: input,hiddev96,hidraw1: USB=
 HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:c5:00.0-2.1/input1
[    3.085038] hid-generic 0003:046D:C52B.0003: hiddev97,hidraw2: USB HID v=
1.11 Device [Logitech USB Receiver] on usb-0000:c5:00.0-2.1/input2
[    3.090578] hub 1-1.1:1.0: USB hub found
[    3.092201] hub 1-1.1:1.0: 4 ports detected
[    3.237698] usb 1-1.2: new high-speed USB device number 4 using xhci_hcd
[    3.375426] logitech-djreceiver 0003:046D:C52B.0003: hiddev96,hidraw0: U=
SB HID v1.11 Device [Logitech USB Receiver] on usb-0000:c5:00.0-2.1/input2
[    3.434243] usb 1-1.1.1: new full-speed USB device number 5 using xhci_h=
cd
[    3.482915] input: Logitech Wireless Device PID:404c Keyboard as /device=
s/pci0000:00/0000:00:08.3/0000:c5:00.0/usb3/3-2/3-2.1/3-2.1:1.2/0003:046D:C=
52B.0003/0003:046D:404C.0004/input/input6
[    3.540879] usb 1-1.1.1: New USB device found, idVendor=3D09ea, idProduc=
t=3D0130, bcdDevice=3D 0.12
[    3.542237] usb 1-1.1.1: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
[    3.542916] usb 1-1.1.1: Product: Virtual HUB
[    3.543525] usb 1-1.1.1: Manufacturer: Generic
[    3.544122] usb 1-1.1.1: SerialNumber: 00000001
[    3.603170] hub 1-1.1.1:1.0: USB hub found
[    3.606695] hub 1-1.1.1:1.0: 7 ports detected
[    3.618378] input: Logitech Wireless Device PID:404c Mouse as /devices/p=
ci0000:00/0000:00:08.3/0000:c5:00.0/usb3/3-2/3-2.1/3-2.1:1.2/0003:046D:C52B=
=2E0003/0003:046D:404C.0004/input/input7
[    3.620166] hid-generic 0003:046D:404C.0004: input,hidraw1: USB HID v1.1=
1 Keyboard [Logitech Wireless Device PID:404c] on usb-0000:c5:00.0-2.1/inpu=
t2:1
[    3.626857] input: Logitech MX Master as /devices/pci0000:00/0000:00:08.=
3/0000:c5:00.0/usb3/3-2/3-2.1/3-2.1:1.2/0003:046D:C52B.0003/0003:046D:4041.=
0005/input/input11
[    3.921678] logitech-hidpp-device 0003:046D:4041.0005: input,hidraw2: US=
B HID v1.11 Keyboard [Logitech MX Master] on usb-0000:c5:00.0-2.1/input2:2
[    3.923930] usb 1-1.1.1.6: new full-speed USB device number 6 using xhci=
_hcd
[    3.934791] input: Logitech MX Master as /devices/pci0000:00/0000:00:08.=
3/0000:c5:00.0/usb3/3-2/3-2.1/3-2.1:1.2/0003:046D:C52B.0003/0003:046D:4041.=
0006/input/input12
[    3.953132] input: Logitech K830 as /devices/pci0000:00/0000:00:08.3/000=
0:c5:00.0/usb3/3-2/3-2.1/3-2.1:1.2/0003:046D:C52B.0003/0003:046D:404C.0004/=
input/input13
[    4.030916] usb 1-1.1.1.6: New USB device found, idVendor=3D09ea, idProd=
uct=3D0131, bcdDevice=3D 0.02
[    4.032436] usb 1-1.1.1.6: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D3
[    4.033209] usb 1-1.1.1.6: Product: Virtual HID
[    4.033917] usb 1-1.1.1.6: Manufacturer: Generic
[    4.034600] usb 1-1.1.1.6: SerialNumber: 00000001
[    4.075066] logitech-hidpp-device 0003:046D:4041.0006: input,hidraw1: US=
B HID v1.11 Keyboard [Logitech MX Master] on usb-0000:c5:00.0-2.1/input2:3
[    4.077276] usb 1-1.1.2: new high-speed USB device number 7 using xhci_h=
cd
[    4.086960] input: Logitech MX Master 2S as /devices/pci0000:00/0000:00:=
08.3/0000:c5:00.0/usb3/3-2/3-2.1/3-2.1:1.2/0003:046D:C52B.0003/0003:046D:40=
69.0007/input/input14
[    4.123399] input: Generic Virtual HID as /devices/pci0000:00/0000:00:08=
=2E1/0000:c3:00.4/usb1/1-1/1-1.1/1-1.1.1/1-1.1.1.6/1-1.1.1.6:1.0/0003:09EA:=
0131.0008/input/input15
[    4.162869] usb 1-1.1.2: New USB device found, idVendor=3D1a40, idProduc=
t=3D0101, bcdDevice=3D 1.11
[    4.164651] usb 1-1.1.2: New USB device strings: Mfr=3D0, Product=3D1, S=
erialNumber=3D0
[    4.165498] usb 1-1.1.2: Product: USB 2.0 Hub
[    4.185053] logitech-hidpp-device 0003:046D:404C.0004: input,hidraw3: US=
B HID v1.11 Keyboard [Logitech K830] on usb-0000:c5:00.0-2.1/input2:1
[    4.209908] hub 1-1.1.2:1.0: USB hub found
[    4.212061] hub 1-1.1.2:1.0: 4 ports detected
[    4.321451] logitech-hidpp-device 0003:046D:4069.0007: input,hidraw4: US=
B HID v1.11 Keyboard [Logitech MX Master 2S] on usb-0000:c5:00.0-2.1/input2=
:4
[    4.334900] input: Logitech MX Master 2S as /devices/pci0000:00/0000:00:=
08.3/0000:c5:00.0/usb3/3-2/3-2.1/3-2.1:1.2/0003:046D:C52B.0003/0003:046D:40=
69.0009/input/input16
[    4.481634] hid-generic 0003:09EA:0131.0008: input,hidraw5: USB HID v1.1=
0 Keyboard [Generic Virtual HID] on usb-0000:c3:00.4-1.1.1.6/input0
[    4.492474] input: Generic Virtual HID as /devices/pci0000:00/0000:00:08=
=2E1/0000:c3:00.4/usb1/1-1/1-1.1/1-1.1.1/1-1.1.1.6/1-1.1.1.6:1.1/0003:09EA:=
0131.000A/input/input17
[    4.594906] logitech-hidpp-device 0003:046D:4069.0009: input,hidraw6: US=
B HID v1.11 Keyboard [Logitech MX Master 2S] on usb-0000:c5:00.0-2.1/input2=
:5
[    4.594978] input: Generic Virtual HID System Control as /devices/pci000=
0:00/0000:00:08.1/0000:c3:00.4/usb1/1-1/1-1.1/1-1.1.1/1-1.1.1.6/1-1.1.1.6:1=
=2E1/0003:09EA:0131.000A/input/input18
[    4.603925] usb 1-1.1.2.1: new full-speed USB device number 8 using xhci=
_hcd
[    4.608824] input: Logitech MX Master 2S as /devices/pci0000:00/0000:00:=
08.3/0000:c5:00.0/usb3/3-2/3-2.1/3-2.1:1.2/0003:046D:C52B.0003/0003:046D:40=
69.000B/input/input20
[    4.651688] input: Generic Virtual HID Consumer Control as /devices/pci0=
000:00/0000:00:08.1/0000:c3:00.4/usb1/1-1/1-1.1/1-1.1.1/1-1.1.1.6/1-1.1.1.6=
:1.1/0003:09EA:0131.000A/input/input19
[    4.761461] logitech-hidpp-device 0003:046D:4069.000B: input,hidraw7: US=
B HID v1.11 Keyboard [Logitech MX Master 2S] on usb-0000:c5:00.0-2.1/input2=
:6
[    4.761684] hid-generic 0003:09EA:0131.000A: input,hidraw8: USB HID v1.1=
0 Mouse [Generic Virtual HID] on usb-0000:c3:00.4-1.1.1.6/input1
[    4.815326] BTRFS: device fsid 46308bde-204e-42aa-947e-08da42de7b3a devi=
d 1 transid 404474 /dev/nvme0n1p3 (259:4) scanned by mount (450)
[    4.819559] BTRFS info (device nvme0n1p3): first mount of filesystem 463=
08bde-204e-42aa-947e-08da42de7b3a
[    4.821189] BTRFS info (device nvme0n1p3): using crc32c (crc32c-intel) c=
hecksum algorithm
[    4.822229] BTRFS info (device nvme0n1p3): using free-space-tree
[    4.849474] usb 1-1.1.2.1: New USB device found, idVendor=3D0b0e, idProd=
uct=3D0412, bcdDevice=3D 1.09
[    4.850799] usb 1-1.1.2.1: New USB device strings: Mfr=3D0, Product=3D2,=
 SerialNumber=3D3
[    4.851984] usb 1-1.1.2.1: Product: Jabra SPEAK 410 USB
[    4.853052] usb 1-1.1.2.1: SerialNumber: 50C971FEFA54x010900
[    4.896222] systemd[1]: systemd 257.4-1-arch running in system mode (+PA=
M +AUDIT -SELINUX -APPARMOR -IMA +IPE +SMACK +SECCOMP +GCRYPT +GNUTLS +OPEN=
SSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETU=
P +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM=
2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF +XKBCOMMON +UTMP -SYSVINI=
T +LIBARCHIVE)
[    4.899149] systemd[1]: Detected architecture x86-64.
[    4.905923] systemd[1]: Hostname set to <htpc>.
[    5.048541] systemd[1]: bpf-restrict-fs: LSM BPF program attached
[    5.110966] systemd[1]: Queued start job for default target Graphical In=
terface.
[    5.149671] systemd[1]: Created slice Slice /system/dirmngr.
[    5.153951] systemd[1]: Created slice Slice /system/getty.
[    5.157533] systemd[1]: Created slice Slice /system/gpg-agent.
[    5.160811] systemd[1]: Created slice Slice /system/gpg-agent-browser.
[    5.164270] systemd[1]: Created slice Slice /system/gpg-agent-extra.
[    5.167552] systemd[1]: Created slice Slice /system/gpg-agent-ssh.
[    5.171086] systemd[1]: Created slice Slice /system/keyboxd.
[    5.174421] systemd[1]: Created slice Slice /system/modprobe.
[    5.177759] systemd[1]: Created slice Slice /system/systemd-fsck.
[    5.180811] systemd[1]: Created slice User and Session Slice.
[    5.183541] systemd[1]: Started Dispatch Password Requests to Console Di=
rectory Watch.
[    5.186190] systemd[1]: Started Forward Password Requests to Wall Direct=
ory Watch.
[    5.189076] systemd[1]: Set up automount Arbitrary Executable File Forma=
ts File System Automount Point.
[    5.191748] systemd[1]: Expecting device /dev/disk/by-uuid/46308bde-204e=
-42aa-947e-08da42de7b3a...
[    5.194373] systemd[1]: Expecting device /dev/disk/by-uuid/92bc53e4-9e40=
-4740-88ca-48aef8ef888f...
[    5.196892] systemd[1]: Expecting device /dev/disk/by-uuid/AE37-3EFF...
[    5.199488] systemd[1]: Reached target Local Encrypted Volumes.
[    5.202059] systemd[1]: Reached target Local Integrity Protected Volumes.
[    5.204650] systemd[1]: Reached target Path Units.
[    5.207103] systemd[1]: Reached target Remote File Systems.
[    5.209481] systemd[1]: Reached target Slice Units.
[    5.211752] systemd[1]: Reached target Local Verity Protected Volumes.
[    5.214070] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[    5.216279] systemd[1]: Listening on LVM2 poll daemon socket.
[    5.219379] systemd[1]: Listening on Process Core Dump Socket.
[    5.221864] systemd[1]: Listening on Credential Encryption/Decryption.
[    5.223911] systemd[1]: Listening on Journal Socket (/dev/log).
[    5.225914] systemd[1]: Listening on Journal Sockets.
[    5.227911] systemd[1]: TPM PCR Measurements was skipped because of an u=
nmet condition check (ConditionSecurity=3Dmeasured-uki).
[    5.228875] systemd[1]: Make TPM PCR Policy was skipped because of an un=
met condition check (ConditionSecurity=3Dmeasured-uki).
[    5.229932] systemd[1]: Listening on udev Control Socket.
[    5.231857] systemd[1]: Listening on udev Kernel Socket.
[    5.237755] systemd[1]: Mounting Huge Pages File System...
[    5.269467] systemd[1]: Mounting POSIX Message Queue File System...
[    5.273504] systemd[1]: Mounting Kernel Debug File System...
[    5.276631] systemd[1]: Mounting Kernel Trace File System...
[    5.279718] systemd[1]: Starting Create List of Static Device Nodes...
[    5.282405] systemd[1]: Starting Monitoring of LVM2 mirrors, snapshots e=
tc. using dmeventd or progress polling...
[    5.285222] systemd[1]: Starting Load Kernel Module configfs...
[    5.287966] systemd[1]: Starting Load Kernel Module dm_mod...
[    5.290727] systemd[1]: Starting Load Kernel Module drm...
[    5.293476] systemd[1]: Starting Load Kernel Module fuse...
[    5.296274] systemd[1]: Starting Load Kernel Module loop...
[    5.298323] device-mapper: uevent: version 1.0.3
[    5.298383] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised:=
 dm-devel@lists.linux.dev
[    5.301162] systemd[1]: Clear Stale Hibernate Storage Info was skipped b=
ecause of an unmet condition check (ConditionPathExists=3D/sys/firmware/efi=
/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
[    5.302683] loop: module loaded
[    5.304699] systemd[1]: Starting Journal Service...
[    5.308750] systemd[1]: Starting Load Kernel Modules...
[    5.310862] systemd[1]: TPM PCR Machine ID Measurement was skipped becau=
se of an unmet condition check (ConditionSecurity=3Dmeasured-uki).
[    5.312745] systemd[1]: Starting Remount Root and Kernel File Systems...
[    5.313010] systemd-journald[518]: Collecting audit messages is disabled.
[    5.316870] systemd[1]: Early TPM SRK Setup was skipped because of an un=
met condition check (ConditionSecurity=3Dmeasured-uki).
[    5.318248] i2c_dev: i2c /dev entries driver
[    5.329742] systemd[1]: Starting Load udev Rules from Credentials...
[    5.334348] systemd[1]: Starting Coldplug All udev Devices...
[    5.337764] systemd[1]: Mounted Huge Pages File System.
[    5.339407] systemd[1]: Mounted POSIX Message Queue File System.
[    5.340910] systemd[1]: Mounted Kernel Debug File System.
[    5.342372] systemd[1]: Mounted Kernel Trace File System.
[    5.343972] systemd[1]: Finished Create List of Static Device Nodes.
[    5.345562] systemd[1]: modprobe@configfs.service: Deactivated successfu=
lly.
[    5.346382] systemd[1]: Finished Load Kernel Module configfs.
[    5.347958] systemd[1]: modprobe@dm_mod.service: Deactivated successfull=
y.
[    5.348739] systemd[1]: Finished Load Kernel Module dm_mod.
[    5.350257] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    5.351035] systemd[1]: Finished Load Kernel Module drm.
[    5.352529] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[    5.353288] systemd[1]: Finished Load Kernel Module fuse.
[    5.355208] systemd[1]: modprobe@loop.service: Deactivated successfully.
[    5.356019] systemd[1]: Finished Load Kernel Module loop.
[    5.357542] systemd[1]: Finished Remount Root and Kernel File Systems.
[    5.359147] systemd[1]: Finished Load udev Rules from Credentials.
[    5.361541] systemd[1]: Mounting FUSE Control File System...
[    5.363466] systemd[1]: Mounting Kernel Configuration File System...
[    5.365761] systemd[1]: Starting Rebuild Hardware Database...
[    5.367859] systemd[1]: Starting Load/Save OS Random Seed...
[    5.369311] systemd[1]: Repartition Root Disk was skipped because no tri=
gger condition checks were met.
[    5.370658] systemd[1]: Starting Create Static Device Nodes in /dev grac=
efully...
[    5.372160] systemd[1]: TPM SRK Setup was skipped because of an unmet co=
ndition check (ConditionSecurity=3Dmeasured-uki).
[    5.373346] systemd[1]: Mounted FUSE Control File System.
[    5.375084] systemd[1]: Mounted Kernel Configuration File System.
[    5.376685] systemd[1]: Finished Load/Save OS Random Seed.
[    5.380491] systemd[1]: Finished Coldplug All udev Devices.
[    5.386011] systemd[1]: Finished Create Static Device Nodes in /dev grac=
efully.
[    5.389196] systemd[1]: Starting Create System Users...
[    5.398270] systemd[1]: Finished Create System Users.
[    5.401960] systemd[1]: Starting Network Time Synchronization...
[    5.404886] systemd[1]: Starting Create Static Device Nodes in /dev...
[    5.411529] systemd[1]: Finished Monitoring of LVM2 mirrors, snapshots e=
tc. using dmeventd or progress polling.
[    5.415739] systemd[1]: Finished Create Static Device Nodes in /dev.
[    5.418437] systemd[1]: Reached target Preparation for Local File System=
s.
[    5.421360] systemd[1]: Started Network Time Synchronization.
[    5.424874] systemd[1]: Reached target System Time Set.
[    5.559875] systemd[1]: Finished Rebuild Hardware Database.
[    5.562954] systemd[1]: Starting Rule-based Manager for Device Events an=
d Files...
[    5.586757] usb 1-1.2: New USB device found, idVendor=3D046d, idProduct=
=3D0853, bcdDevice=3D 0.13
[    5.587898] usb 1-1.2: New USB device strings: Mfr=3D0, Product=3D2, Ser=
ialNumber=3D1
[    5.588529] usb 1-1.2: Product: PTZ Pro Camera
[    5.589121] usb 1-1.2: SerialNumber: C1A8EC4C
[    5.623055] systemd[1]: Started Rule-based Manager for Device Events and=
 Files.
[    5.631314] systemd[1]: Condition check resulted in /dev/tpmrm0 being sk=
ipped.
[    5.634280] systemd[1]: Reached target Trusted Platform Module.
[    5.640802] systemd[1]: Found device WD PC SN740 SDDPNQD-512G 1.
[    5.644658] ACPI: video: Video Device [VGA] (multi-head: yes  rom: no  p=
ost: no)
[    5.648290] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08=
:00/device:18/LNXVIDEO:00/input/input21
[    5.650165] ccp 0000:c3:00.2: enabling device (0000 -> 0002)
[    5.653511] input: PC Speaker as /devices/platform/pcspkr/input/input22
[    5.654225] mousedev: PS/2 mouse device common for all mice
[    5.654580] ccp 0000:c3:00.2: tee enabled
[    5.654683] RAPL PMU: API unit is 2^-32 Joules, 1 fixed counters, 163840=
 ms ovfl timer
[    5.654685] RAPL PMU: hw unit of domain package 2^-16 Joules
[    5.655741] ccp 0000:c3:00.2: psp: TSME enabled
[    5.657945] systemd[1]: Found device WD PC SN740 SDDPNQD-512G 2.
[    5.658043] ccp 0000:c3:00.2: psp enabled
[    5.662509] cryptd: max_cpu_qlen set to 1000
[    5.662599] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, re=
vision 0
[    5.662601] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port=
 selection
[    5.667745] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at=
 0xb20
[    5.669343] i2c i2c-6: Successfully instantiated SPD at 0x50
[    5.671186] i2c i2c-6: Successfully instantiated SPD at 0x51
[    5.673070] i2c i2c-6: Successfully instantiated SPD at 0x52
[    5.673478] systemd[1]: Found device WD PC SN740 SDDPNQD-512G 3.
[    5.674927] i2c i2c-6: Successfully instantiated SPD at 0x53
[    5.676654] amd-tee driver initialization successful
[    5.676785] ACPI: bus type thunderbolt registered
[    5.677074] i2c i2c-6: Successfully instantiated SPD at 0x54
[    5.677611] i2c i2c-6: Successfully instantiated SPD at 0x55
[    5.682644] i2c i2c-6: Successfully instantiated SPD at 0x56
[    5.683160] input: PTZ Pro Camera Consumer Control as /devices/pci0000:0=
0/0000:00:08.1/0000:c3:00.4/usb1/1-1/1-1.2/1-1.2:1.2/0003:046D:0853.000C/in=
put/input24
[    5.684288] systemd[1]: Listening on Load/Save RF Kill Switch Status /de=
v/rfkill Watch.
[    5.684601] i2c i2c-6: Successfully instantiated SPD at 0x57
[    5.689947] systemd[1]: Activating swap /dev/disk/by-uuid/92bc53e4-9e40-=
4740-88ca-48aef8ef888f...
[    5.697536] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database
[    5.697809] cros_ec_lpcs: unsupported system.
[    5.699981] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[    5.700583] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    5.701269] sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO ad=
dress
[    5.702118] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db1=
8c600'
[    5.703017] sp5100-tco sp5100-tco: initialized. heartbeat=3D60 sec (nowa=
yout=3D0)
[    5.705548] platform regulatory.0: Direct firmware load for regulatory.d=
b failed with error -2
[    5.706820] cfg80211: failed to load regulatory.db
[    5.708651] AES CTR mode by8 optimization enabled
[    5.710334] r8169 0000:bf:00.0: enabling device (0000 -> 0003)
[    5.722224] r8169 0000:bf:00.0 eth0: RTL8126A, 9c:bf:0d:00:e0:8d, XID 64=
9, IRQ 137
[    5.723173] r8169 0000:bf:00.0 eth0: jumbo features [frames: 9194 bytes,=
 tx checksumming: ko]
[    5.725100] r8169 0000:bf:00.0 enp191s0: renamed from eth0
[    5.730763] systemd[1]: Starting File System Check on /dev/disk/by-uuid/=
AE37-3EFF...
[    5.733140] Adding 20971516k swap on /dev/nvme0n1p2.  Priority:-2 extent=
s:1 across:20971516k SS
[    5.735310] systemd[1]: Starting Virtual Console Setup...
[    5.740309] systemd[1]: Activated swap /dev/disk/by-uuid/92bc53e4-9e40-4=
740-88ca-48aef8ef888f.
[    5.740643] input: PTZ Pro Camera as /devices/pci0000:00/0000:00:08.1/00=
00:c3:00.4/usb1/1-1/1-1.2/1-1.2:1.2/0003:046D:0853.000C/input/input25
[    5.742724] hid-generic 0003:046D:0853.000C: input,hiddev97,hidraw9: USB=
 HID v1.11 Device [PTZ Pro Camera] on usb-0000:c3:00.4-1.2/input2
[    5.742838] usbcore: registered new device driver usbip-host
[    5.747069] systemd[1]: Reached target Swaps.
[    5.752023] systemd[1]: Started Journal Service.
[    5.755268] mc: Linux media interface: v0.10
[    5.786054] systemd-journald[518]: Received client request to flush runt=
ime journal.
[    5.796321] amd-pmf AMDI0105:00: registered PMF device successfully
[    5.907280] snd_hda_intel 0000:c3:00.1: enabling device (0000 -> 0002)
[    5.908498] snd_hda_intel 0000:c3:00.1: Handle vga_switcheroo audio clie=
nt
[    5.909217] snd_hda_intel 0000:c3:00.6: enabling device (0000 -> 0002)
[    5.911216] videodev: Linux video capture interface: v2.00
[    5.918096] Bluetooth: Core ver 2.22
[    5.919622] NET: Registered PF_BLUETOOTH protocol family
[    5.920463] Bluetooth: HCI device and connection manager initialized
[    5.921146] Bluetooth: HCI socket layer initialized
[    5.921800] Bluetooth: L2CAP socket layer initialized
[    5.922458] Bluetooth: SCO socket layer initialized
[    5.944538] input: HD-Audio Generic HDMI/DP,pcm=3D3 as /devices/pci0000:=
00/0000:00:08.1/0000:c3:00.1/sound/card0/input29
[    5.945461] input: HD-Audio Generic HDMI/DP,pcm=3D7 as /devices/pci0000:=
00/0000:00:08.1/0000:c3:00.1/sound/card0/input30
[    5.950571] input: HD-Audio Generic HDMI/DP,pcm=3D8 as /devices/pci0000:=
00/0000:00:08.1/0000:c3:00.1/sound/card0/input31
[    5.951426] input: HD-Audio Generic HDMI/DP,pcm=3D9 as /devices/pci0000:=
00/0000:00:08.1/0000:c3:00.1/sound/card0/input32
[    5.956000] kvm_amd: TSC scaling supported
[    5.957864] kvm_amd: Nested Virtualization enabled
[    5.959103] kvm_amd: Nested Paging enabled
[    5.960056] kvm_amd: LBR virtualization supported
[    5.961081] kvm_amd: Virtual VMLOAD VMSAVE supported
[    5.961928] kvm_amd: Virtual GIF supported
[    5.962725] kvm_amd: Virtual NMI enabled
[    6.667899] [drm] amdgpu kernel modesetting enabled.
[    6.672700] amdgpu: Virtual CRAT table created for CPU
[    6.673551] amdgpu: Topology: Add CPU node
[    6.674266] amdgpu 0000:c3:00.0: enabling device (0006 -> 0007)
[    6.674288] [drm] initializing kernel modesetting (IP DISCOVERY 0x1002:0=
x1586 0xF111:0x000A 0xD1).
[    6.674300] [drm] register mmio base: 0x90200000
[    6.674301] [drm] register mmio size: 1048576
[    6.677950] [drm] add ip block number 0 <soc21_common>
[    6.679244] [drm] add ip block number 1 <gmc_v11_0>
[    6.679246] [drm] add ip block number 2 <ih_v6_1>
[    6.679248] [drm] add ip block number 3 <psp>
[    6.679862] mt7925e 0000:c0:00.0: ASIC revision: 79250000
[    6.682043] [drm] add ip block number 4 <smu>
[    6.682046] [drm] add ip block number 5 <dm>
[    6.682263] snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC623: li=
ne_outs=3D2 (0x21/0x14/0x0/0x0/0x0) type:hp
[    6.682268] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=3D0 (0x0/=
0x0/0x0/0x0/0x0)
[    6.682269] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=3D0 (0x0/0x0/0=
x0/0x0/0x0)
[    6.682270] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=3D0x0
[    6.682270] snd_hda_codec_realtek hdaudioC1D0:    inputs:
[    6.682271] snd_hda_codec_realtek hdaudioC1D0:      Mic=3D0x19
[    6.686627] [drm] add ip block number 6 <gfx_v11_0>
[    6.687075] [drm] add ip block number 7 <sdma_v6_0>
[    6.687077] [drm] add ip block number 8 <vcn_v4_0_5>
[    6.687934] usb 1-1.2: Found UVC 1.00 device PTZ Pro Camera (046d:0853)
[    6.688069] usbcore: registered new interface driver btusb
[    6.688466] [drm] add ip block number 9 <jpeg_v4_0_5>
[    6.688468] [drm] add ip block number 10 <mes_v11_0>
[    6.688469] [drm] add ip block number 11 <vpe_v6_1>
[    6.688470] [drm] add ip block number 12 <isp_ip>
[    6.688484] amdgpu 0000:c3:00.0: amdgpu: Fetched VBIOS from VFCT
[    6.692292] amdgpu: ATOM BIOS: 113-STRXLGEN-001
[    6.702176] amdgpu 0000:c3:00.0: amdgpu: VPE: collaborate mode true
[    6.710449] usbcore: registered new interface driver uvcvideo
[    6.722455] input: HD-Audio Generic Mic as /devices/pci0000:00/0000:00:0=
8.1/0000:c3:00.6/sound/card1/input33
[    6.723781] input: HD-Audio Generic Headphone Front as /devices/pci0000:=
00/0000:00:08.1/0000:c3:00.6/sound/card1/input34
[    6.724528] input: HD-Audio Generic Front Headphone Surround as /devices=
/pci0000:00/0000:00:08.1/0000:c3:00.6/sound/card1/input35
[    6.754736] mt7925e 0000:c0:00.0: HW/SW Version: 0x8a108a10, Build Time:=
 20250305132908a

[    6.767433] Console: switching to colour dummy device 80x25
[    6.792686] intel_rapl_common: Found RAPL domain package
[    6.792692] intel_rapl_common: Found RAPL domain core
[    6.792869] amd_atl: AMD Address Translation Library initialized
[    6.801992] Bluetooth: hci0: HW/SW Version: 0x00000000, Build Time: 2025=
0305133215
[    6.811504] amdgpu 0000:c3:00.0: amdgpu: Trusted Memory Zone (TMZ) featu=
re disabled as experimental (default)
[    6.811552] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit, f=
ragment size is 9-bit
[    6.811574] amdgpu 0000:c3:00.0: amdgpu: VRAM: 8192M 0x0000008000000000 =
- 0x00000081FFFFFFFF (8192M used)
[    6.811577] amdgpu 0000:c3:00.0: amdgpu: GART: 512M 0x00007FFF00000000 -=
 0x00007FFF1FFFFFFF
[    6.811597] [drm] Detected VRAM RAM=3D8192M, BAR=3D8192M
[    6.811598] [drm] RAM width 256bits LPDDR5
[    6.811707] [drm] amdgpu: 8192M of VRAM memory ready
[    6.811709] [drm] amdgpu: 125000M of GTT memory ready.
[    6.811724] [drm] GART: num cpu pages 131072, num gpu pages 131072
[    6.812368] [drm] PCIE GART of 512M enabled (table at 0x00000081FFB00000=
).
[    6.812748] [drm] Loading DMUB firmware via PSP: version=3D0x09000F00
[    6.813063] [drm] Found VCN firmware Version ENC: 1.23 DEC: 9 VEP: 0 Rev=
ision: 3
[    6.836805] amdgpu 0000:c3:00.0: amdgpu: reserve 0x8c00000 from 0x81e000=
0000 for PSP TMR
[    7.015872] usbcore: registered new interface driver snd-usb-audio
[    7.016851] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    7.016857] Bluetooth: BNEP filters: protocol multicast
[    7.016861] Bluetooth: BNEP socket layer initialized
[    7.083940] Realtek Internal NBASE-T PHY r8169-0-bf00:00: attached PHY d=
river (mii_bus:phy_addr=3Dr8169-0-bf00:00, irq=3DMAC)
[    7.096812] mt7925e 0000:c0:00.0: WM Firmware Version: ____000000, Build=
 Time: 20250305133013
[    7.553403] amdgpu 0000:c3:00.0: amdgpu: RAS: optional ras ta ucode is n=
ot available
[    7.557324] amdgpu 0000:c3:00.0: amdgpu: RAP: optional rap ta ucode is n=
ot available
[    7.557326] amdgpu 0000:c3:00.0: amdgpu: SECUREDISPLAY: securedisplay ta=
 ucode is not available
[    7.594625] amdgpu 0000:c3:00.0: amdgpu: SMU is initialized successfully!
[    7.594629] [drm] Seamless boot condition check passed
[    7.595907] [drm] Display Core v3.2.310 initialized on DCN 3.5.1
[    7.595909] [drm] DP-HDMI FRL PCON supported
[    7.598521] [drm] DMUB hardware initialized: version=3D0x09000F00
[    7.627214] snd_hda_intel 0000:c3:00.1: bound 0000:c3:00.0 (ops amdgpu_d=
m_audio_component_bind_ops [amdgpu])
[    7.670813] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
[    7.670827] kfd kfd: amdgpu: Total number of KFD nodes to be created: 1
[    7.672561] amdgpu: Virtual CRAT table created for GPU
[    7.672694] amdgpu: Topology: Add dGPU node [0x1586:0x1002]
[    7.672696] kfd kfd: amdgpu: added device 1002:1586
[    7.672705] amdgpu 0000:c3:00.0: amdgpu: SE 2, SH per SE 2, CU per SH 10=
, active_cu_number 40
[    7.672709] amdgpu 0000:c3:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng =
0 on hub 0
[    7.672711] amdgpu 0000:c3:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng=
 1 on hub 0
[    7.672712] amdgpu 0000:c3:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng=
 4 on hub 0
[    7.672713] amdgpu 0000:c3:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng=
 6 on hub 0
[    7.672715] amdgpu 0000:c3:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng=
 7 on hub 0
[    7.672716] amdgpu 0000:c3:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng=
 8 on hub 0
[    7.672717] amdgpu 0000:c3:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng=
 9 on hub 0
[    7.672718] amdgpu 0000:c3:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng=
 10 on hub 0
[    7.672719] amdgpu 0000:c3:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng=
 11 on hub 0
[    7.672721] amdgpu 0000:c3:00.0: amdgpu: ring sdma0 uses VM inv eng 12 o=
n hub 0
[    7.672722] amdgpu 0000:c3:00.0: amdgpu: ring vcn_unified_0 uses VM inv =
eng 0 on hub 8
[    7.672723] amdgpu 0000:c3:00.0: amdgpu: ring vcn_unified_1 uses VM inv =
eng 1 on hub 8
[    7.672724] amdgpu 0000:c3:00.0: amdgpu: ring jpeg_dec_0 uses VM inv eng=
 4 on hub 8
[    7.672725] amdgpu 0000:c3:00.0: amdgpu: ring jpeg_dec_1 uses VM inv eng=
 6 on hub 8
[    7.672727] amdgpu 0000:c3:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM inv =
eng 13 on hub 0
[    7.672728] amdgpu 0000:c3:00.0: amdgpu: ring vpe uses VM inv eng 7 on h=
ub 8
[    7.673148] [drm] ring gfx_32768.1.1 was added
[    7.673325] [drm] ring compute_32768.2.2 was added
[    7.673889] [drm] ring sdma_32768.3.3 was added
[    7.673929] [drm] ring gfx_32768.1.1 ib test pass
[    7.673970] [drm] ring compute_32768.2.2 ib test pass
[    7.674077] [drm] ring sdma_32768.3.3 ib test pass
[    7.680738] amdgpu 0000:c3:00.0: amdgpu: Runtime PM not available
[    7.681285] [drm] Initialized amdgpu 3.59.0 for 0000:c3:00.0 on minor 1
[    7.690194] [drm] pre_validate_dsc:1600 MST_DSC dsc precompute is not ne=
eded
[    7.730028] Console: switching to colour frame buffer device 240x67
[    7.750359] amdgpu 0000:c3:00.0: [drm] fb0: amdgpudrmfb frame buffer dev=
ice
[    8.017372] r8169 0000:bf:00.0 enp191s0: Link is Down
[    8.275709] mt7925e 0000:c0:00.0 wlp192s0: renamed from wlan0
[    8.597922] Bluetooth: hci0: Device setup in 1865041 usecs
[    8.597932] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection c=
ommand is advertised, but not supported.
[    8.682519] Bluetooth: hci0: AOSP extensions version v1.00
[    8.682525] Bluetooth: hci0: AOSP quality report is supported
[    8.682673] Bluetooth: MGMT ver 1.23
[    8.686186] NET: Registered PF_ALG protocol family
[   10.377879] HDR SB:e9 02 00 ee 7c 78 40 8e 3a 1c 75 60 1d a3 0b 09
[   10.377888] HDR SB:3d 47 40 00 00 00 00 00 00 00 00 00 00 00 00 00
[   10.378051] HDR SB:e9 02 00 ee 7c 78 40 8e 3a 1c 75 60 1d a3 0b 09
[   10.378052] HDR SB:3d 47 40 00 00 00 00 00 00 00 00 00 00 00 00 00
[   10.378098] HDR SB:e9 02 00 ee 7c 78 40 8e 3a 1c 75 60 1d a3 0b 09
[   10.378099] HDR SB:3d 47 40 00 00 00 00 00 00 00 00 00 00 00 00 00
[   10.378160] HDR SB:e9 02 00 ee 7c 78 40 8e 3a 1c 75 60 1d a3 0b 09
[   10.378161] HDR SB:3d 47 40 00 00 00 00 00 00 00 00 00 00 00 00 00
[   10.378686] HDR SB:e9 02 00 ee 7c 78 40 8e 3a 1c 75 60 1d a3 0b 09
[   10.378687] HDR SB:3d 47 40 00 00 00 00 00 00 00 00 00 00 00 00 00
[   10.378752] HDR SB:e9 02 00 ee 7c 78 40 8e 3a 1c 75 60 1d a3 0b 09
[   10.378753] HDR SB:3d 47 40 00 00 00 00 00 00 00 00 00 00 00 00 00
[   10.379384] HDR SB:e9 02 00 ee 7c 78 40 8e 3a 1c 75 60 1d a3 0b 09
[   10.379385] HDR SB:3d 47 40 00 00 00 00 00 00 00 00 00 00 00 00 00
[   10.379449] HDR SB:e9 02 00 ee 7c 78 40 8e 3a 1c 75 60 1d a3 0b 09
[   10.379450] HDR SB:3d 47 40 00 00 00 00 00 00 00 00 00 00 00 00 00
[   10.466242] HDR SB:e9 02 00 ee 7c 78 40 8e 3a 1c 75 60 1d a3 0b 09
[   10.466251] HDR SB:3d 47 40 00 00 00 00 00 00 00 00 00 00 00 00 00
[   10.466418] HDR SB:e9 02 00 ee 7c 78 40 8e 3a 1c 75 60 1d a3 0b 09
[   10.466420] HDR SB:3d 47 40 00 00 00 00 00 00 00 00 00 00 00 00 00
[   10.727382] r8169 0000:bf:00.0 enp191s0: Link is Up - 1Gbps/Full - flow =
control off
[   11.219300] Bluetooth: RFCOMM TTY layer initialized
[   11.219311] Bluetooth: RFCOMM socket layer initialized
[   11.219313] Bluetooth: RFCOMM ver 1.11
[   11.233870] nvme nvme0: using unchecked data buffer
[   11.251122] block nvme0n1: No UUID available providing old NGUID
[   11.449504] warning: `kdeconnectd' uses wireless extensions which will s=
top working for Wi-Fi 7 hardware; use nl80211
[   11.619101] input: solaar-keyboard as /devices/virtual/input/input36
[   24.797054] logitech-hidpp-device 0003:046D:404C.0004: HID++ 4.1 device =
connected.

--637wz5agv4n5q4nk--

--m7djchmvcgrcbqjn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmfwMO0ACgkQwEfU8yi1
JYXYYQ/9HGhLBvcmwrH6aiMwfpcmXoVFjPHuw1lch3xm+yGslvAYY2CDpr1uvSIL
1qpMsWHO3kNzSx8T6zvbZbMFtVnXrLqhhfUu8xvZGLG5CGk0R/u68gltycuXISTZ
ceIbG+NVnABZXjMpkM5slCTNKQIAkl4D/G2yVjCOON7V4cTzrQarCukOfMevDj84
KUnB9AmkHWW3vXRvIAHdZ1l7l5OPl8Cqr+wKJKjCPFYwKACQs8Q2K+8kR8RC9vxC
6exfH/f++kJp7Gf3JpmgS7DzmhKgkqUAHFkN2Uv69Kl/xfsQha4WjSHVwmMtphPY
H0BovS2ctvA0mya03jRy3hjAK0jeImMQSOBj1p/v9PzvEyfecA9buKiUg5xEZYOQ
MQ5JoL2rX3Shrq3CCFk+aMOYoAYvfep3yEs60eRmhb3/Ud5Q9pe3l7PT4BkYUtq5
QQvaHq5Mg3MEGakwTvAz68LHBZKdWbqgY5MSgh791Cbm9pDobFqXTi0/HU78myMh
laAHHMKObEl/C5tv3AVHMB4c+7P0ArQn5X3rc7a3qEtkZPwjwvvMucJZfnbFVMZj
DNi8RIs6QJ4oazjfa87KjbCEu67lRs1+KI+Y6QHy9BV3SuTrSETgFQLVR3VLZqHx
RMPFtQCC1ocI4HyJX1cA8oH8ngk29aMktpHmLMTLA6hVF9CDjzY=
=lZQI
-----END PGP SIGNATURE-----

--m7djchmvcgrcbqjn--
