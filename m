Received: from prime.voidband.net (prime.voidband.net [199.247.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E858322540F
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 10:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.247.17.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738837393; cv=none; b=q/lsXduEu4qMhcWfWrXusad0FobHp80+XQYNxM4m6AG8/z9PwYUJmnPUgXbdSEYm/x2Q6zgkehlVo9X7cF3nvRBZvqRxht74SkOZIeu80Gb+R6zV8XnAE/+Ifh380Qh1svK3cw/G7DeXVhTQIPkKCyXbt9v2ZklCPh0colujvyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738837393; c=relaxed/simple;
	bh=I/2Nm8vmGFjO7lpSMY9rk+JZkSB4AThuwdPNLeoVFfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iYf+t8/qb1hTW6u8CHKNVAfK6MgE5D76I1666oE0M3R2Rbha8PDFLN3E3t1e5V/SrEZR+SwHB+cEEvUj31uXe+KGXZQmqYbeWc8wbQTy3RhKxfo5N00TQxyshysQUT8vq6CmEzKVwsxhRJAxX5UFzfAw661RBai/YQFv83PpjZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name; spf=pass smtp.mailfrom=natalenko.name; dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b=OgUgYJ6+; arc=none smtp.client-ip=199.247.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=natalenko.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b="OgUgYJ6+"
Received: from spock.localnet (unknown [212.20.115.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by prime.voidband.net (Postfix) with ESMTPSA id 54C20631B6A8;
	Thu, 06 Feb 2025 11:16:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
	s=dkim-20170712; t=1738836996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6U7kw1I115tCD+11cKEZwTMQVFhoqDkmGhsIcFH/+V4=;
	b=OgUgYJ6+RR7evD5bkIqs1BmEsyvsetHX8b5kVdZCyAu7ecnrW7gFdwJqqK+6killEZWTow
	cQQAMQ4T/eLmVfMhDLD4m093ibANfowtZsgXu6b72NvLq31uIcjvHPdjJUz0I1/X5T8skM
	pHSYjXAsyFEcljFlOqII3HWiRZ/IjgE=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: x86@kernel.org, Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, bp@alien8.de, peterz@infradead.org,
 dave.hansen@linux.intel.com, zhengqi.arch@bytedance.com,
 nadav.amit@gmail.com, thomas.lendacky@amd.com, kernel-team@meta.com,
 linux-mm@kvack.org, akpm@linux-foundation.org, jannh@google.com,
 mhklinux@outlook.com, andrew.cooper3@citrix.com
Subject: Re: [PATCH v9 00/12] AMD broadcast TLB invalidation
Date: Thu, 06 Feb 2025 11:16:21 +0100
Message-ID: <12602226.O9o76ZdvQC@natalenko.name>
In-Reply-To: <20250206044346.3810242-1-riel@surriel.com>
References: <20250206044346.3810242-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5856629.DvuYhMxLoT";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart5856629.DvuYhMxLoT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: x86@kernel.org, Rik van Riel <riel@surriel.com>
Subject: Re: [PATCH v9 00/12] AMD broadcast TLB invalidation
Date: Thu, 06 Feb 2025 11:16:21 +0100
Message-ID: <12602226.O9o76ZdvQC@natalenko.name>
In-Reply-To: <20250206044346.3810242-1-riel@surriel.com>
References: <20250206044346.3810242-1-riel@surriel.com>
MIME-Version: 1.0

Hello.

On =C4=8Dtvrtek 6. =C3=BAnora 2025 5:43:19, st=C5=99edoevropsk=C3=BD standa=
rdn=C3=AD =C4=8Das Rik van Riel wrote:
> Add support for broadcast TLB invalidation using AMD's INVLPGB instructio=
n.
>=20
> This allows the kernel to invalidate TLB entries on remote CPUs without
> needing to send IPIs, without having to wait for remote CPUs to handle
> those interrupts, and with less interruption to what was running on
> those CPUs.
>=20
> Because x86 PCID space is limited, and there are some very large
> systems out there, broadcast TLB invalidation is only used for
> processes that are active on 3 or more CPUs, with the threshold
> being gradually increased the more the PCID space gets exhausted.
>=20
> Combined with the removal of unnecessary lru_add_drain calls
> (see https://lkml.org/lkml/2024/12/19/1388) this results in a
> nice performance boost for the will-it-scale tlb_flush2_threads
> test on an AMD Milan system with 36 cores:
>=20
> - vanilla kernel:           527k loops/second
> - lru_add_drain removal:    731k loops/second
> - only INVLPGB:             527k loops/second
> - lru_add_drain + INVLPGB: 1157k loops/second
>=20
> Profiling with only the INVLPGB changes showed while
> TLB invalidation went down from 40% of the total CPU
> time to only around 4% of CPU time, the contention
> simply moved to the LRU lock.
>=20
> Fixing both at the same time about doubles the
> number of iterations per second from this case.
>=20
> Some numbers closer to real world performance
> can be found at Phoronix, thanks to Michael:
>=20
> https://www.phoronix.com/news/AMD-INVLPGB-Linux-Benefits
>=20
> My current plan is to implement support for Intel's RAR
> (Remote Action Request) TLB flushing in a follow-up series,
> after this thing has been merged into -tip. Making things
> any larger would just be unwieldy for reviewers.
>=20
> v9:
>  - print warning when start or end address was rounded (Peter)

OK, I've just hit one:

TLB flush not stride 200000 aligned. Start 7fffc0000000, end 7fffffe01000
WARNING: CPU: 31 PID: 411 at arch/x86/mm/tlb.c:1342 flush_tlb_mm_range+0x57=
b/0x600
Modules linked in:
CPU: 31 UID: 0 PID: 411 Comm: modprobe Not tainted 6.13.0-pf3 #1 1366679ca0=
6f46d05d1e9d9c537b0c6b4c922b82
Hardware name: ASUS System Product Name/Pro WS X570-ACE, BIOS 4902 08/29/20=
24
RIP: 0010:flush_tlb_mm_range+0x57b/0x600
Code: 5f e9 39 b3 3f 00 e8 24 57 f5 ff e9 e9 fc ff ff 48 8b 0c 24 4c 89 e2 =
48 c7 c7 78 59 27 b0 c6 05 3d 1a 31 02 01 e8 85 e4 01 00 <0f> 0b e9 35 fb f=
f ff fa 0f 1f 44 00 00 48 89 df e8 a0 f4 ff ff fb
RSP: 0018:ffffc137c11e7a38 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffff9e6eaf1b5d80 RCX: 00000000ffffdfff
RDX: 0000000000000000 RSI: 00000000ffffffea RDI: 0000000000000001
RBP: ffff9e500244d800 R08: 00000000ffffdfff R09: ffff9e6eae1fffa8
R10: 00000000ffffdfff R11: 0000000000000003 R12: 00007fffc0000000
R13: 000000000000001f R14: 0000000000000015 R15: ffff9e6eaf180000
=46S:  0000000000000000(0000) GS:ffff9e6eaf180000(0000) knlGS:0000000000000=
000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000109966000 CR4: 0000000000f50ef0
PKRU: 55555554
Call Trace:
 <TASK>
 tlb_flush_mmu+0x125/0x1a0
 tlb_finish_mmu+0x41/0x80
 relocate_vma_down+0x183/0x200
 setup_arg_pages+0x201/0x390
 load_elf_binary+0x3a7/0x17d0
 bprm_execve+0x244/0x630
 kernel_execve+0x180/0x1f0
 call_usermodehelper_exec_async+0xd0/0x190
 ret_from_fork+0x34/0x50
 ret_from_fork_asm+0x1a/0x30
 </TASK>

What do I do with it?

Thank you.

>  - in the reclaim code, tlbsync at context switch time (Peter)
>  - fix !CONFIG_CPU_SUP_AMD compile error in arch_tlbbatch_add_pending (Ja=
n)
> v8:
>  - round start & end to handle non-page-aligned callers (Steven & Jan)
>  - fix up changelog & add tested-by tags (Manali)
> v7:
>  - a few small code cleanups (Nadav)
>  - fix spurious VM_WARN_ON_ONCE in mm_global_asid
>  - code simplifications & better barriers (Peter & Dave)
> v6:
>  - fix info->end check in flush_tlb_kernel_range (Michael)
>  - disable broadcast TLB flushing on 32 bit x86
> v5:
>  - use byte assembly for compatibility with older toolchains (Borislav, M=
ichael)
>  - ensure a panic on an invalid number of extra pages (Dave, Tom)
>  - add cant_migrate() assertion to tlbsync (Jann)
>  - a bunch more cleanups (Nadav)
>  - key TCE enabling off X86_FEATURE_TCE (Andrew)
>  - fix a race between reclaim and ASID transition (Jann)
> v4:
>  - Use only bitmaps to track free global ASIDs (Nadav)
>  - Improved AMD initialization (Borislav & Tom)
>  - Various naming and documentation improvements (Peter, Nadav, Tom, Dave)
>  - Fixes for subtle race conditions (Jann)
> v3:
>  - Remove paravirt tlb_remove_table call (thank you Qi Zheng)
>  - More suggested cleanups and changelog fixes by Peter and Nadav
> v2:
>  - Apply suggestions by Peter and Borislav (thank you!)
>  - Fix bug in arch_tlbbatch_flush, where we need to do both
>    the TLBSYNC, and flush the CPUs that are in the cpumask.
>  - Some updates to comments and changelogs based on questions.

=2D-=20
Oleksandr Natalenko, MSE
--nextPart5856629.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEZUOOw5ESFLHZZtOKil/iNcg8M0sFAmeki/UACgkQil/iNcg8
M0s9xBAAhvV0ILebNgTjqIo4d+UEGvsrLz3dmVk9jhPJpwop2gryj81D0mQ0xkg3
TL7E8aFZKT327wtBbdg6sCSWKsK8xUl1MnxdR87jw6PbFU1mfAy6M2QFBCailiMe
U5bM1gNPuCDckcntm3nKnDi+OM9ZPApkWQBmYYEoNTRNyWOTZ/EegTT78q2kEIOH
xBgFLFZvbAfR4p4DtiUqWNlfXuynk1psDLyeZndOiFLKRYLKri36pZ/l4+kWTJpj
o/hrPfOxpEMPjojjizMJGu2fIVzgqS6R4rQNhkxPFYp8MQEqu3t6btzHhPWmglEb
SE6fHxT8GeIBna5n+nGkPcrqnvfykQu9r0K70oPZu864OpWNMKt6x8AgKtH07Fdj
Ya1mvzjSpr84Qnpx/r8YS4eSfWvEZRxa4tC+MkUD7mzcODB7UXVBiGX4/4ED2kyE
tDRFn50eZ8Lpla9OihtrXwgNjb1v1bVvEz4r/tf02MHIcT3VFW+49f/5ofhVTbjh
PLvPc02OtZkNS5QNUNVRhbpd9kUVm0plPJdB4TCEhOEBXqyk9MU+K0EenQoZudab
GcNWC/LpJZAJG+tBnhG0IKisVhqtD8zUu+nDyuAl3dliYVW0URPo+2N/af93zd+h
abjNRhILQ05aJ6Wvefdjh01KyUUnDoh95nRS7PvvEEEPwHZYjqY=
=Qeq8
-----END PGP SIGNATURE-----

--nextPart5856629.DvuYhMxLoT--



