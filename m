Received: from mail2.nsa.green (mail2.nsa.green [78.141.220.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E5A22332D
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 20:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.141.220.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739134620; cv=none; b=A5qWetqwyLsRRU8c02cAH490JMf5O97HXQKw9cm0ZFjeEB3MyhkUjH7Vv5+xYaivjItofjKaMh5Zt0dPOjoY4Vdl8wXySwPBlp5wEsSD3Cm2Nd8IB8g0c0EPmcIOC1gXdlxVB8ZnKmCzcn/KHiQXQylSaRIehrJMYwZpqbwQeII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739134620; c=relaxed/simple;
	bh=Qub9pTSkjN90E0Vgkp/ILXgH8PEkI1FUwUyybDdlcos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R81eoCA0se88xl8i8Vc4TrRQXZWTGFj6mc3om79L+PDjxAmOi0DA+ewC4wmZTee80zCJbFgM1MRs48zgHMdQ4cVc1FZAlSpaHVcYpO5kCVtkIHjGDd6fhKdGwQn+dsrL8m6QdRoe3I7/E0Omr48+wGcvEx4EnKOhYC5CO5x9+vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nsa.green; spf=pass smtp.mailfrom=nsa.green; dkim=pass (2048-bit key) header.d=nsa.green header.i=@nsa.green header.b=ekkOEBO/; arc=none smtp.client-ip=78.141.220.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nsa.green
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nsa.green
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nsa.green header.i=@nsa.green header.b="ekkOEBO/"
Authentication-Results: mail.nsa.green;
	dkim=pass (2048-bit key; unprotected) header.d=nsa.green header.i=@nsa.green header.a=rsa-sha256 header.s=dkim header.b=ekkOEBO/;
	dkim-atps=neutral
Received: from mailserver.lev (localhost [127.0.0.1])
	by mail.nsa.green (Postfix) with ESMTP id 4Yrfvy4RznzFrKC
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 22:49:34 +0200 (EET)
Authentication-Results: mailserver.lev (amavis); dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)" header.d=nsa.green
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nsa.green; h=
	content-transfer-encoding:content-type:in-reply-to:organization
	:from:content-language:references:to:subject:user-agent
	:mime-version:date:message-id; s=dkim; t=1739134173; x=
	1739998174; bh=Qub9pTSkjN90E0Vgkp/ILXgH8PEkI1FUwUyybDdlcos=; b=e
	kkOEBO/10Y/1ZvnwielKTgY2YjN0p/I3cnC5ypw53aFXxEA2CWo6Tqfp8MctPxL5
	EuJzPX5JPAZ9vuc5FRDRRJMcc+Aj/xbViUyQz3vRZRr7Og9TPsVkwFBPJUt5Q3gm
	PwMQecTj6cE1ANwhEDSUz/OgP/YZ9FAgeLmRhijrAZ8QDBgSpgewGYwmiZCcNzAX
	SNhojW4FmzND8DZIFzV096QISyfAI2ZKaHr6yD+2SCevAv11f3NY8EHmbLscB14d
	q1VZTkFeiSYC/sXCkStbWGxWnrk+xDTzXj9t7lre4cUngJkc//nwbRtwQtZx7cwx
	9tdMg+axtXHEr3STM7JnA==
X-Virus-Scanned: Debian amavis at mailserver.lev
Received: from mail.nsa.green ([127.0.0.1])
 by mailserver.lev (mailserver.lev [127.0.0.1]) (amavis, port 10026)
 with ESMTP id ViPsH_WWZT3F for <linux-kernel@vger.kernel.org>;
 Sun,  9 Feb 2025 22:49:33 +0200 (EET)
Message-ID: <ad2dda77-5322-4182-a9ee-ee9f173a6e36@nsa.green>
Date: Sun, 9 Feb 2025 22:49:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CVE-2024-57939: riscv: Fix sleeping in invalid context in die()
To: cve@kernel.org, linux-kernel@vger.kernel.org,
 linux-cve-announce@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <2025012127-CVE-2024-57939-fb7b@gregkh>
Content-Language: en-US
From: Igor Sakulin <is@nsa.green>
Autocrypt: addr=is@nsa.green; keydata=
 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
 nmB8G6keVA9HR8o8bWwJmVh2XfbJHmkXnt6qog==
Organization: =?UTF-8?B?U0lBICJOxIFrb3RuZXMgU2F1bGUi?=
In-Reply-To: <2025012127-CVE-2024-57939-fb7b@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 1/21/25 14:18, Greg Kroah-Hartman wrote:
> Description
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> In the Linux kernel, the following vulnerability has been resolved:
>
> riscv: Fix sleeping in invalid context in die()
>
> die() can be called in exception handler, and therefore cannot sleep.
> However, die() takes spinlock_t which can sleep with PREEMPT_RT enabled=
.
> That causes the following warning:
>
> BUG: sleeping function called from invalid context at kernel/locking/sp=
inlock_rt.c:48
> in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 285, name: mutex
> preempt_count: 110001, expected: 0
> RCU nest depth: 0, expected: 0
> CPU: 0 UID: 0 PID: 285 Comm: mutex Not tainted 6.12.0-rc7-00022-ge19049=
cf7d56-dirty #234
> Hardware name: riscv-virtio,qemu (DT)
> Call Trace:
>      dump_backtrace+0x1c/0x24
>      show_stack+0x2c/0x38
>      dump_stack_lvl+0x5a/0x72
>      dump_stack+0x14/0x1c
>      __might_resched+0x130/0x13a
>      rt_spin_lock+0x2a/0x5c
>      die+0x24/0x112
>      do_trap_insn_illegal+0xa0/0xea
>      _new_vmalloc_restore_context_a0+0xcc/0xd8
> Oops - illegal instruction [#1]

Seems related:

[=C2=A0 +1.057529] BUG: sleeping function called from invalid context at=20
kernel/locking/spinlock_rt.c:48
[=C2=A0 +0.000016] in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid:=
=20
25709, name: java
[=C2=A0 +0.000006] preempt_count: 0, expected: 0
[=C2=A0 +0.000004] RCU nest depth: 0, expected: 0
[=C2=A0 +0.000009] CPU: 2 UID: 1001 PID: 25709 Comm: java Tainted: G=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
W=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 T=C2=A0 6.12.13-gentoo-riscv64 #12
[=C2=A0 +0.000010] Tainted: [W]=3DWARN, [T]=3DRANDSTRUCT
[=C2=A0 +0.000004] Hardware name: milkv Milk-V Mars CM/Milk-V Mars CM, BI=
OS=20
2025.01-00001-gced64a332cea 01/01/2025
[=C2=A0 +0.000005] Call Trace:
[=C2=A0 +0.000004] [<ffffffff80006136>] dump_backtrace+0x26/0x3c
[=C2=A0 +0.000017] [<ffffffff8087409e>] show_stack+0x2c/0x3e
[=C2=A0 +0.000009] [<ffffffff808823f2>] dump_stack_lvl+0x52/0x7a
[=C2=A0 +0.000010] [<ffffffff8088242e>] dump_stack+0x14/0x1e
[=C2=A0 +0.000008] [<ffffffff8004e6c2>] __might_resched+0x14a/0x154
[=C2=A0 +0.000010] [<ffffffff8088c31a>] rt_spin_lock+0x2c/0x66
[=C2=A0 +0.000009] [<ffffffff80032c28>] force_sig_info_to_task+0x2c/0x140
[=C2=A0 +0.000008] [<ffffffff80033388>] force_sig_fault+0x60/0x8e
[=C2=A0 +0.000007] [<ffffffff80005d0a>] do_trap+0x28/0xbe
[=C2=A0 +0.000007] [<ffffffff80882864>] do_trap_insn_illegal+0xde/0x100
[=C2=A0 +0.000008] [<ffffffff8088e934>] handle_exception+0x150/0x15c

6.12.13 kernel with PREEMPT_RT.

Happens only with Java code on OpenJDK.

Maybe related, GCC flags on this host's portage:

CFLAGS=3D"-O3 -mabi=3Dlp64d -march=3Drv64imafdc_zicsr_zba_zbb -mcpu=3Dsif=
ive-u74=20
-mtune=3Dsifive-7-series --param l1-cache-size=3D32 --param=20
l2-cache-size=3D2048 -frecord-gcc-switches -flimit-function-alignment=20
-feliminate-unused-debug-types -ftree-vectorize -ftree-loop-vectorize=20
-ftree-loop-distribution -ftree-loop-distribute-patterns=20
-fasynchronous-unwind-tables -fstack-protector-strong=20
-fstack-clash-protection -fexceptions --param=3Dssp-buffer-size=3D32 -flt=
o=3D2=20
-fuse-linker-plugin -fgraphite-identity -floop-nest-optimize -fipa-pta=20
-fno-semantic-interposition -fno-common -fdevirtualize-at-ltrans -pipe"

>
> Switch to use raw_spinlock_t, which does not sleep even with PREEMPT_RT
> enabled.
>
> The Linux kernel CVE team has assigned CVE-2024-57939 to this issue.
>
> Affected and fixed versions
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
> 	Issue introduced in 4.15 with commit 76d2a0493a17d4c8ecc781366850c3c4f=
8e1a446 and fixed in 6.1.125 with commit c21df31fc2a4afc02a6e56511364e9e7=
93ea92ec
> 	Issue introduced in 4.15 with commit 76d2a0493a17d4c8ecc781366850c3c4f=
8e1a446 and fixed in 6.6.72 with commit f48f060a4b36b5e96628f6c3fb1540f1e=
8dedb69
> 	Issue introduced in 4.15 with commit 76d2a0493a17d4c8ecc781366850c3c4f=
8e1a446 and fixed in 6.12.10 with commit 76ab0afcdbe8c9685b589016ee1c0e25=
fe596707
> 	Issue introduced in 4.15 with commit 76d2a0493a17d4c8ecc781366850c3c4f=
8e1a446 and fixed in 6.13 with commit 6a97f4118ac07cfdc316433f385dbdc12af=
5025e
>
> Please see https://www.kernel.org for a full list of currently supporte=
d
> kernel versions by the kernel community.
>
> Unaffected versions might change over time as fixes are backported to
> older supported kernel versions.  The official CVE entry at
> 	https://cve.org/CVERecord/?id=3DCVE-2024-57939
> will be updated if fixes are backported, please check that for the most
> up to date information about this issue.
>
>
> Affected files
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> The file(s) affected by this issue are:
> 	arch/riscv/kernel/traps.c
>
>
> Mitigation
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> The Linux kernel CVE team recommends that you update to the latest
> stable kernel version for this, and many other bugfixes.  Individual
> changes are never tested alone, but rather are part of a larger kernel
> release.  Cherry-picking individual commits is not recommended or
> supported by the Linux kernel community at all.  If however, updating t=
o
> the latest release is impossible, the individual changes to resolve thi=
s
> issue can be found at these commits:
> 	https://git.kernel.org/stable/c/c21df31fc2a4afc02a6e56511364e9e793ea92=
ec
> 	https://git.kernel.org/stable/c/f48f060a4b36b5e96628f6c3fb1540f1e8dedb=
69
> 	https://git.kernel.org/stable/c/76ab0afcdbe8c9685b589016ee1c0e25fe5967=
07
> 	https://git.kernel.org/stable/c/6a97f4118ac07cfdc316433f385dbdc12af502=
5e
