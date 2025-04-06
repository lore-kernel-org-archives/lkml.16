Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164281CD1F
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 16:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743958178; cv=none; b=n50mPhtQMTtsB+vVsNWbTXI1vi+lYsYbf+vpG4UN9tAkkYzkj1JgC8k/fTfkIh2xNXyF8bDmXSUphJjEYP2rCbqMLyLl8KdHgvS6E5ijhUCf+eWEgHadIhfgrVqJJSLYwX+rRpYHcqDC1qm19C6rrb94M7u8LpFHTaIe4k6v3wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743958178; c=relaxed/simple;
	bh=Hl5cF/pJ7wK+Wtt/3vsdrB51c6tlmt6R+vj83VwC/lQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=OD/LeKYX4Eoy2w9nHVeWU4EHxv8rJ3VzSPSa0/mjifB+eA1nKXcpQb36m2zs6t6kON6WjTmJFmcxM4uRVIwNihuw3UyS/qXJKrzHS+vVP4mLK2VqRZu4fgzK44AZYiI1nOOKu6RHZZ213Eywa5uFIJ03tAE8JyYO39uARAArVeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=Ft3x15KJ; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="Ft3x15KJ"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 536Gn3EV1989626
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sun, 6 Apr 2025 09:49:03 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 536Gn3EV1989626
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743958144;
	bh=Hl5cF/pJ7wK+Wtt/3vsdrB51c6tlmt6R+vj83VwC/lQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Ft3x15KJYZoCFWkEKwGovx1szMx7p6tUF+UqUYgqJP9TyDWH3pIsu3d6YUzGxU9wA
	 pzRzYgvltnBNS2vLJ2HOT3yqNpMiu044pwAmJc9Ugodyr6Dsft0mOYKUVK2IJGUeFW
	 VpV8p676LtSSf7m2JOaeywDW8eLjAMOxJkaLyNqb9jSRflW4/xsLZ0Tmtg2oQewGc5
	 1qNL5I62cAuUdtmrN7uytMhIuyXy8Ed22x5oezhOYYNhryYdawqsv9M6HARN1CX1pe
	 ax0MaHYLHu14K8FPbbDZ6Do0vbnd6gZ/XCQ0kRY/d2Z9aowaoF9iOMp+TGPsptBN21
	 Ekj3l/5D6R8WQ==
Date: Sun, 06 Apr 2025 09:49:02 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Kevin Koster <lkml@ombertech.com>, Borislav Petkov <bp@alien8.de>
CC: Oerg866 <oerg866@googlemail.com>, linux-kernel@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_x86/microcode=3A_Fix_crashes_o?=
 =?US-ASCII?Q?n_early_486_CPUs_due_to_usage_of_=27cpuid=27=2E?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com> <20250405130306.ca9822c1f27db119cc973603@ombertech.com> <20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local> <20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com>
Message-ID: <576F6A2E-7824-457B-B9D9-A315A18D1263@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 5, 2025 11:40:49 PM PDT, Kevin Koster <lkml@ombertech=2Ecom> wrote=
:
>On Sat, 5 Apr 2025 11:32:26 +0200
>Borislav Petkov <bp@alien8=2Ede> wrote:
>> On Sat, Apr 05, 2025 at 01:03:06PM +1100, Kevin Koster wrote:
>> > On Sat, 19 Oct 2024 08:29:04 +0200
>> > Oerg866 <oerg866@googlemail=2Ecom> wrote:
>> >=20
>> > > Starting with v6=2E7-rc1, the kernel was no longer able to boot on
>> > > early i486-class CPUs=2E
>> >=20
>> > Thanks for this patch! It solves my problem with kernel 6=2E12=2E11
>> > rebooting at start-up on 486 CPUs, which had me puzzled=2E (tested on
>> > AM486DX2-66 and CX486DX4-100)
>> >=20
>> > Is there a reason why the patch wasn't accepted?
>>=20
>> Yes, too many patches, too little time=2E :-(
>>=20
>> Anyway, does the one below - only build-tested - work for both y'all
>> too?
>
>On my AM486DX2-66 it gets past the immediate reboot problem but gets
>an Oops and kernel panic here:
>
>[snip]
>smpboot: SMP disabled
>Performance Events: no PMU driver, software events only=2E
>signal: max sigframe size: 928
>Oops: invalid opcode: 0000 [#1] SMP
>CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6=2E14=2E0 #1
>EIP: 0xc0b5e1d7
>Code: 7d dc 00 74 0b b9 07 00 00 00 89 df b0 01 f3 a5 83 c4 1c 5b 5e 5f 5=
d c3 55 b8 01 00 00 00 89 e5 57 56 31 f6 53 89 f1 83 ec 30 <0f> a2 b9 04 00=
 00 00 89 45 c4 8d 7d c8 89 f0 f3 ab e8 a0 fc ff ff
>EAX: 00000001 EBX: c0be6b00 ECX: 00000000 EDX: 00000246
>ESI: 00000000 EDI: 00000000 EBP: c1309f08 ESP: c1309ecc
>DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
>CR0: 80050033 CR2: ffd38000 CR3: 00c16000 CR4: 00000000
>Call Trace:
> ? 0xc01231af
> ? 0xc01231c8
> ? 0xc0123222
> ? 0xc0123245
> ? 0xc01215ef
> ? 0xc01217f7
> ? 0xc0b5e1d7
> ? 0xc0848e09
> ? 0xc012186f
> ? 0xc0b5e1d7
> ? 0xc0848e41
> ? 0xc010105d
> ? 0xc01500d8
> ? 0xc0848e09
> ? 0xc0b5e1d7
> ? 0xc01500d8
> ? 0xc0848e09
> ? 0xc0b5e1d7
> ? 0xc085148a
> ? 0xc0524da8
> ? 0xc0b5e1c5
> 0xc0102100
> ? 0xc08514d5
> ? 0xc085148a
> ? 0xc0171bde
> ? 0xc0175987
> ? 0xc016d672
> 0xc0b4c9e2
> ? 0xc084c9b8
> 0xc084c9ca
> 0xc0127d3a
> ? 0xc084c9b8
> 0xc01027a2
> 0xc0100e3d
>Modules linked in:
>---[ end trace 0000000000000000 ]---
>EIP: 0xc0b5e1d7
>Code: 7d dc 00 74 0b b9 07 00 00 00 89 df b0 01 f3 a5 83 c4 1c 5b 5e 5f 5=
d c3 55 b8 01 00 00 00 89 e5 57 56 31 f6 53 89 f1 83 ec 30 <0f> a2 b9 04 00=
 00 00 89 45 c4 8d 7d c8 89 f0 f3 ab e8 a0 fc ff ff
>EAX: 00000001 EBX: c0be6b00 ECX: 00000000 EDX: 00000246
>ESI: 00000000 EDI: 00000000 EBP: c1309f08 ESP: c1309ecc
>DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
>CR0: 80050033 CR2: ffd38000 CR3: 00c16000 CR4: 00000000
>Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x0000000b
>Rebooting in 60 seconds=2E=2E

Another case of it stumbling into a CPUID instruction=2E Of course, withou=
t a map file that dump is completely useless since it doesn't show any symb=
ols=2E
