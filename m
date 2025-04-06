Received: from ombertech.com (ombertech.com [74.48.158.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0074B17F7
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 05:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.48.158.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743918018; cv=none; b=neuxkeToi9BE5NTlU8Uu26WpChKrZ6g9NZdVdrA0Z508NZMSZRM9tH+zVIIJoH/jGapRB343xSHvQ3Ky0xz1hRSfsIvD2uUjOVoDyBjixmq1/JxFoZo4gB5CEiDTBdmdEGekbetvqZI2ZfrxfYMWFUKlOcAmAiScJ6xxlqX3cro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743918018; c=relaxed/simple;
	bh=eGPssONKMwss0s7vqd0jkbyJcrBZkDhYjLj39eimxAY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=DELEDJUhGQJ8nJlpc+cV23T0pO5yZYfePptrAHzZX/fRBaGmqPsHTGmL00snp/w/odRNnq3coNl9PnqyVrU1wsmfTvCVE0n7BFXeEHsy/r/wtRRxqFwFE0Jg1u1i5VT0LBt9DwFFnRGXTvQViOTRjZ2QAzSnAZqR1cjWcztil1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ombertech.com; spf=pass smtp.mailfrom=ombertech.com; dkim=pass (2048-bit key) header.d=ombertech.com header.i=@ombertech.com header.b=dDfbTuCZ; arc=none smtp.client-ip=74.48.158.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ombertech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ombertech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ombertech.com header.i=@ombertech.com header.b="dDfbTuCZ"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ombertech.com; s=2022;
	t=1743917719; bh=eGPssONKMwss0s7vqd0jkbyJcrBZkDhYjLj39eimxAY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dDfbTuCZEafoGGy1GD/g+2379zozMNWQOB/VUGBnPjAwQWJXVNJgRcFKfFgiakDTk
	 h3VfJG+XLup0EdfWVvoFlFOt3KZUbfG5m+w2jwFq3IXrwhmgLavlyfA2TM1UlHGVNH
	 uNFgtkJP0uLyLIW2+VcNqV/dwcNiO5qZATAbktWJFHN5uRGCQ3GIyZ6HP+cTs3pSQD
	 Yu/ubppb5dkBWNDI1a4WtILASI9qgyJZYVJAIkayhNNk07dm16iWtOqqWUwOKHtEJU
	 sS5vjw/KVZD+/rWMXl5c2gau61C6fT7W7PxGp9TxKYXgGOtxgq138tRfoK8L7JaF1h
	 /H9+v5MBNAbiA==
Received: from 192.168.1.100 (unknown [1.145.161.245])
	by ombertech.com (Postfix) with ESMTPSA id 9A7F766946;
	Sun,  6 Apr 2025 05:35:17 +0000 (UTC)
Date: Sun, 6 Apr 2025 16:40:49 +1000
From: Kevin Koster <lkml@ombertech.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Oerg866 <oerg866@googlemail.com>, linux-kernel@vger.kernel.org, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>
Subject: Re: [PATCH] x86/microcode: Fix crashes on early 486 CPUs due to
 usage of 'cpuid'.
Message-Id: <20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com>
In-Reply-To: <20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com>
	<20250405130306.ca9822c1f27db119cc973603@ombertech.com>
	<20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 5 Apr 2025 11:32:26 +0200
Borislav Petkov <bp@alien8.de> wrote:
> On Sat, Apr 05, 2025 at 01:03:06PM +1100, Kevin Koster wrote:
> > On Sat, 19 Oct 2024 08:29:04 +0200
> > Oerg866 <oerg866@googlemail.com> wrote:
> > 
> > > Starting with v6.7-rc1, the kernel was no longer able to boot on
> > > early i486-class CPUs.
> > 
> > Thanks for this patch! It solves my problem with kernel 6.12.11
> > rebooting at start-up on 486 CPUs, which had me puzzled. (tested on
> > AM486DX2-66 and CX486DX4-100)
> > 
> > Is there a reason why the patch wasn't accepted?
> 
> Yes, too many patches, too little time. :-(
> 
> Anyway, does the one below - only build-tested - work for both y'all
> too?

On my AM486DX2-66 it gets past the immediate reboot problem but gets
an Oops and kernel panic here:

[snip]
smpboot: SMP disabled
Performance Events: no PMU driver, software events only.
signal: max sigframe size: 928
Oops: invalid opcode: 0000 [#1] SMP
CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.14.0 #1
EIP: 0xc0b5e1d7
Code: 7d dc 00 74 0b b9 07 00 00 00 89 df b0 01 f3 a5 83 c4 1c 5b 5e 5f 5d c3 55 b8 01 00 00 00 89 e5 57 56 31 f6 53 89 f1 83 ec 30 <0f> a2 b9 04 00 00 00 89 45 c4 8d 7d c8 89 f0 f3 ab e8 a0 fc ff ff
EAX: 00000001 EBX: c0be6b00 ECX: 00000000 EDX: 00000246
ESI: 00000000 EDI: 00000000 EBP: c1309f08 ESP: c1309ecc
DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
CR0: 80050033 CR2: ffd38000 CR3: 00c16000 CR4: 00000000
Call Trace:
 ? 0xc01231af
 ? 0xc01231c8
 ? 0xc0123222
 ? 0xc0123245
 ? 0xc01215ef
 ? 0xc01217f7
 ? 0xc0b5e1d7
 ? 0xc0848e09
 ? 0xc012186f
 ? 0xc0b5e1d7
 ? 0xc0848e41
 ? 0xc010105d
 ? 0xc01500d8
 ? 0xc0848e09
 ? 0xc0b5e1d7
 ? 0xc01500d8
 ? 0xc0848e09
 ? 0xc0b5e1d7
 ? 0xc085148a
 ? 0xc0524da8
 ? 0xc0b5e1c5
 0xc0102100
 ? 0xc08514d5
 ? 0xc085148a
 ? 0xc0171bde
 ? 0xc0175987
 ? 0xc016d672
 0xc0b4c9e2
 ? 0xc084c9b8
 0xc084c9ca
 0xc0127d3a
 ? 0xc084c9b8
 0xc01027a2
 0xc0100e3d
Modules linked in:
---[ end trace 0000000000000000 ]---
EIP: 0xc0b5e1d7
Code: 7d dc 00 74 0b b9 07 00 00 00 89 df b0 01 f3 a5 83 c4 1c 5b 5e 5f 5d c3 55 b8 01 00 00 00 89 e5 57 56 31 f6 53 89 f1 83 ec 30 <0f> a2 b9 04 00 00 00 89 45 c4 8d 7d c8 89 f0 f3 ab e8 a0 fc ff ff
EAX: 00000001 EBX: c0be6b00 ECX: 00000000 EDX: 00000246
ESI: 00000000 EDI: 00000000 EBP: c1309f08 ESP: c1309ecc
DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
CR0: 80050033 CR2: ffd38000 CR3: 00c16000 CR4: 00000000
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
Rebooting in 60 seconds..
