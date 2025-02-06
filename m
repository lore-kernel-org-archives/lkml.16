Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29581624F0
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 14:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738851421; cv=none; b=F0l6rlEiCrLU3SpKsEFyL8hcRt0BUs1XdNk068kUZ0wp8vd6IaTPA4akumCBwU8SjUEAUSiUWXcbLsl1465PbMpWhbFESRBhncAD6ETYv3HfczMDNnMrlwM+xtNmrsFpmf8ZbvR/xDw0duSQpNYGUnsuwuvZA4kV8WB2ZUKjWfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738851421; c=relaxed/simple;
	bh=zq4fS8r4/aWRDgbaBenMpseavKiY8ZjtDsC2R64ddNE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XQTQDKkzeXmFspofR8oTHsXsrzajyFOgsQdcg0SIJHuBO7edJvOP53+yXCIEfpvJhXSRPenxnqAIHRrx/e4hLJRgtkVhAoGkU0D36XUG8Sz+LKpC+7AsSkZLWRLD2zDxZZlg2ewCcr1EGoLpZUNzad9xDsXpPLPhbZ2iYGBgQ0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1tg2gF-000000004uj-3XlI;
	Thu, 06 Feb 2025 09:16:35 -0500
Message-ID: <8111558b52cec1152746b05a9c1d657d18df0fe2.camel@surriel.com>
Subject: Re: [PATCH v9 00/12] AMD broadcast TLB invalidation
From: Rik van Riel <riel@surriel.com>
To: Oleksandr Natalenko <oleksandr@natalenko.name>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, bp@alien8.de, peterz@infradead.org, 
	dave.hansen@linux.intel.com, zhengqi.arch@bytedance.com,
 nadav.amit@gmail.com, 	thomas.lendacky@amd.com, kernel-team@meta.com,
 linux-mm@kvack.org, 	akpm@linux-foundation.org, jannh@google.com,
 mhklinux@outlook.com, 	andrew.cooper3@citrix.com
Date: Thu, 06 Feb 2025 09:16:35 -0500
In-Reply-To: <12602226.O9o76ZdvQC@natalenko.name>
References: <20250206044346.3810242-1-riel@surriel.com>
	 <12602226.O9o76ZdvQC@natalenko.name>
Autocrypt: addr=riel@surriel.com; prefer-encrypt=mutual;
 keydata=mQENBFIt3aUBCADCK0LicyCYyMa0E1lodCDUBf6G+6C5UXKG1jEYwQu49cc/gUBTTk33A
 eo2hjn4JinVaPF3zfZprnKMEGGv4dHvEOCPWiNhlz5RtqH3SKJllq2dpeMS9RqbMvDA36rlJIIo47
 Z/nl6IA8MDhSqyqdnTY8z7LnQHqq16jAqwo7Ll9qALXz4yG1ZdSCmo80VPetBZZPw7WMjo+1hByv/
 lvdFnLfiQ52tayuuC1r9x2qZ/SYWd2M4p/f5CLmvG9UcnkbYFsKWz8bwOBWKg1PQcaYHLx06sHGdY
 dIDaeVvkIfMFwAprSo5EFU+aes2VB2ZjugOTbkkW2aPSWTRsBhPHhV6dABEBAAG0HlJpayB2YW4gU
 mllbCA8cmllbEByZWRoYXQuY29tPokBHwQwAQIACQUCW5LcVgIdIAAKCRDOed6ShMTeg05SB/986o
 gEgdq4byrtaBQKFg5LWfd8e+h+QzLOg/T8mSS3dJzFXe5JBOfvYg7Bj47xXi9I5sM+I9Lu9+1XVb/
 r2rGJrU1DwA09TnmyFtK76bgMF0sBEh1ECILYNQTEIemzNFwOWLZZlEhZFRJsZyX+mtEp/WQIygHV
 WjwuP69VJw+fPQvLOGn4j8W9QXuvhha7u1QJ7mYx4dLGHrZlHdwDsqpvWsW+3rsIqs1BBe5/Itz9o
 6y9gLNtQzwmSDioV8KhF85VmYInslhv5tUtMEppfdTLyX4SUKh8ftNIVmH9mXyRCZclSoa6IMd635
 Jq1Pj2/Lp64tOzSvN5Y9zaiCc5FucXtB9SaWsgdmFuIFJpZWwgPHJpZWxAc3VycmllbC5jb20+iQE
 +BBMBAgAoBQJSLd2lAhsjBQkSzAMABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDOed6ShMTe
 g4PpB/0ZivKYFt0LaB22ssWUrBoeNWCP1NY/lkq2QbPhR3agLB7ZXI97PF2z/5QD9Fuy/FD/jddPx
 KRTvFCtHcEzTOcFjBmf52uqgt3U40H9GM++0IM0yHusd9EzlaWsbp09vsAV2DwdqS69x9RPbvE/Ne
 fO5subhocH76okcF/aQiQ+oj2j6LJZGBJBVigOHg+4zyzdDgKM+jp0bvDI51KQ4XfxV593OhvkS3z
 3FPx0CE7l62WhWrieHyBblqvkTYgJ6dq4bsYpqxxGJOkQ47WpEUx6onH+rImWmPJbSYGhwBzTo0Mm
 G1Nb1qGPG+mTrSmJjDRxrwf1zjmYqQreWVSFEt26tBpSaWsgdmFuIFJpZWwgPHJpZWxAZmIuY29tP
 okBPgQTAQIAKAUCW5LbiAIbIwUJEswDAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQznneko
 TE3oOUEQgAsrGxjTC1bGtZyuvyQPcXclap11Ogib6rQywGYu6/Mnkbd6hbyY3wpdyQii/cas2S44N
 cQj8HkGv91JLVE24/Wt0gITPCH3rLVJJDGQxprHTVDs1t1RAbsbp0XTksZPCNWDGYIBo2aHDwErhI
 omYQ0Xluo1WBtH/UmHgirHvclsou1Ks9jyTxiPyUKRfae7GNOFiX99+ZlB27P3t8CjtSO831Ij0Ip
 QrfooZ21YVlUKw0Wy6Ll8EyefyrEYSh8KTm8dQj4O7xxvdg865TLeLpho5PwDRF+/mR3qi8CdGbkE
 c4pYZQO8UDXUN4S+pe0aTeTqlYw8rRHWF9TnvtpcNzZw==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Sender: riel@surriel.com

On Thu, 2025-02-06 at 11:16 +0100, Oleksandr Natalenko wrote:
> Hello.
>=20
> On =C4=8Dtvrtek 6. =C3=BAnora 2025 5:43:19, st=C5=99edoevropsk=C3=BD stan=
dardn=C3=AD =C4=8Das Rik
> van Riel wrote:
> >=20
> > v9:
> > =C2=A0- print warning when start or end address was rounded (Peter)
>=20
> OK, I've just hit one:
>=20
> TLB flush not stride 200000 aligned. Start 7fffc0000000, end
> 7fffffe01000

Beautiful, the caller wants to zap 2MB pages, but
the end address is 4kB aligned.

> WARNING: CPU: 31 PID: 411 at arch/x86/mm/tlb.c:1342
> flush_tlb_mm_range+0x57b/0x600
> Modules linked in:
> CPU: 31 UID: 0 PID: 411 Comm: modprobe Not tainted 6.13.0-pf3 #1
> 1366679ca06f46d05d1e9d9c537b0c6b4c922b82
> Hardware name: ASUS System Product Name/Pro WS X570-ACE, BIOS 4902
> 08/29/2024
> RIP: 0010:flush_tlb_mm_range+0x57b/0x600
> Code: 5f e9 39 b3 3f 00 e8 24 57 f5 ff e9 e9 fc ff ff 48 8b 0c 24 4c
> 89 e2 48 c7 c7 78 59 27 b0 c6 05 3d 1a 31 02 01 e8 85 e4 01 00 <0f>
> 0b e9 35 fb ff ff fa 0f 1f 44 00 00 48 89 df e8 a0 f4 ff ff fb
> RSP: 0018:ffffc137c11e7a38 EFLAGS: 00010286
> RAX: 0000000000000000 RBX: ffff9e6eaf1b5d80 RCX: 00000000ffffdfff
> RDX: 0000000000000000 RSI: 00000000ffffffea RDI: 0000000000000001
> RBP: ffff9e500244d800 R08: 00000000ffffdfff R09: ffff9e6eae1fffa8
> R10: 00000000ffffdfff R11: 0000000000000003 R12: 00007fffc0000000
> R13: 000000000000001f R14: 0000000000000015 R15: ffff9e6eaf180000
> FS:=C2=A0 0000000000000000(0000) GS:ffff9e6eaf180000(0000)
> knlGS:0000000000000000
> CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000000 CR3: 0000000109966000 CR4: 0000000000f50ef0
> PKRU: 55555554
> Call Trace:
> =C2=A0<TASK>
> =C2=A0tlb_flush_mmu+0x125/0x1a0
> =C2=A0tlb_finish_mmu+0x41/0x80
> =C2=A0relocate_vma_down+0x183/0x200
> =C2=A0setup_arg_pages+0x201/0x390
> =C2=A0load_elf_binary+0x3a7/0x17d0
> =C2=A0bprm_execve+0x244/0x630
> =C2=A0kernel_execve+0x180/0x1f0
> =C2=A0call_usermodehelper_exec_async+0xd0/0x190
> =C2=A0ret_from_fork+0x34/0x50
> =C2=A0ret_from_fork_asm+0x1a/0x30
> =C2=A0</TASK>
>=20
> What do I do with it?

Reporting it is the right thing. Let me dig into what
setup_arg_pages and relocate_vma_down are doing to
come up with a 2MB page size area where the end is
not 2MB aligned.

Reading through the relocate_vma_down code, and the
free_pgd/p4d/pud/pmd_range code, it looks like that
code always adds PAGE_SIZE to the address being zapped,
even when zapping things at a larger granularity.

On the flip side, the code in relocate_vma_down and
free_pgd_range correctly set the TLB page size to
the 4kB PAGE_SIZE.

It looks like setting the stride_shift to something
larger is done transparently by the x86 tlb_flush()
implementation, specifically by tlb_get_unmap_shift(),
which looks at which page table level got freed to
determine what stride shift to use.

This can result in flush_tlb_mm_range being called
with a stride_shift for 2MB pages, but a range ending
on a 4kB aligned (not 2MB aligned) boundary.

Peter, how should we solve this one?

Should tlb_flush() round the start & end addresses
to match the found stride_shift?

--=20
All Rights Reversed.
