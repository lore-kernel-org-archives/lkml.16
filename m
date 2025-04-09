Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AFA25EFB2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 12:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744201358; cv=none; b=cYJVMaEuFtUvju5C4RNWkvLoJ/1PDmGeist9ZgebII4DA+ENy4C5OvRh72Y+YSUdtXWEVIJ+7tCNLRZdUiwekHRhRvGaXPLZ4Z2GNg/1HiH0bdzBGj3U3j6RnFqPtrkztE2hoEHM0FR6lD/068QW1494uL5nh/Qofj1JGIGq+lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744201358; c=relaxed/simple;
	bh=NwYEHXfPH/JhOIY5bahDLjdLn+VXu7PO8U1iZ+IysJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mqClleaa8F6CiZo+BFFOlfjVowN4iv9w88v5qnC8J5Ix0iYnFJ99aM/EnDWzVHpOmi+yDqtwaTyzwljLbZcDktgogIcwvBDKM+DM1ZqSG6iecZnNm5JsfFlI+EZcbJLfDEXARE/Nb1hYAffw3Jk/to9D0IODq9GoyxbNAH21HYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pyYgL2Wz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lyH+l2mU; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pyYgL2Wz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lyH+l2mU"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744201355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=t0NkJjs2duFmNMufSDDgLb+Oj4/TN6nrtSv4WwLH3L0=;
	b=pyYgL2WzXqzvLXpFmRwTzMQr+JnGazXbvdWwildkDLGsFFmV/iYfa6MVJcDf0C4KjXeqmz
	W+3zzx2r9TpdNkvjAPoaeNVRlc+vCDiSqFnupgf2uuyfVjV3Eed2d9exBVN9FtcPjdT1mb
	KdSQsSBnAm6UkHx15qEu1DVxRMNsATcwUOprrmqN6WaWU4xSaz/BcRSSpJThxGvv/qa81s
	/v1REhtqkmhLQldAJO0a61FoTTzZ2eeD1iQAku4rMCTiLFqAnHTN1XbGs1DK4ANID0OGPr
	27aKiy3Q4Bs7YccGQmcLLIAXA7JodZpFVyw7sjVJTMU5rek0vBYbGD0p1ZEZ2g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744201355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=t0NkJjs2duFmNMufSDDgLb+Oj4/TN6nrtSv4WwLH3L0=;
	b=lyH+l2mU2OXC4WDq7o1tv5KVKBmiKFJC7izYuIGwQ8JWgUZYhVvEaiP+N6xa5B1+PSP4al
	nVGNiSnflPoNbDCA==
To: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v2 0/2] x86/cacheinfo: Fixes for CPUID(0x80000005) and CPUID(0x80000006)
Date: Wed,  9 Apr 2025 14:22:29 +0200
Message-ID: <20250409122233.1058601-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Changelog v2:
-------------

Rebase over tip:master, as of now:

   5c5e95d43de9 ("Merge branch into tip/master: 'x86/nmi'")

per Ingo's request.

Changelog v1:
-------------

https://lore.kernel.org/lkml/20250409105429.1048199-1-darwi@linutronix.de

While working on the x86-cpuid-db CPUID model on top of the CPUID(2) and
CPUID(4) cleanups at tip/x86/cpu,[*] I've discovered some L1/2/3 cache
associativity parsing issues for the AMD CPUID(4) emulation logic .

Here are the fixes on top of -rc1.

* Summary:

The AMD CPUID(4) emulation logic, uses CPUID(0x80000005) and
CPUID(0x80000006) for extracting the L1/L2/L3 cache info.  It then uses
an assocs[] associativity mapping array to map the extracted
associativity values to their CPUID(4) equivalents.

Using the same associativity mapping array for both leaves is invalid.

Per the AMD manuals, the associativity field semantics between
CPUID(0x80000005) and CPUID(0x80000006) is different.  The first patch
fixes that for the former leaf.  For the latter leaf, the second patch
completes the associativity mapping array and handles the special case of
an L2/L3 associativity of 9, which is just a marker — not a real cache
associativity value.

* Example testing for L1d cacheinfo:

On a Qemu-emulated AMD machine without CPUID(0x8000001d) topology
extensions, and with below cpuid(1) view:

   L1 data cache information (0x80000005/ecx):
      line size (bytes) = 0x40 (64)
      lines per tag     = 0x1 (1)
      associativity     = 0x8 (8)
      size (KB)         = 0x20 (32)
   L1 instruction cache information (0x80000005/edx):
      line size (bytes) = 0x40 (64)
      lines per tag     = 0x1 (1)
      associativity     = 0x4 (4)
      size (KB)         = 0x40 (64)
   L2 unified cache information (0x80000006/ecx):
      line size (bytes) = 0x40 (64)
      lines per tag     = 0x1 (1)
      associativity     = 8-way (6)
      size (KB)         = 0x200 (512)
   L3 cache information (0x80000006/edx):
      line size (bytes)     = 0x40 (64)
      lines per tag         = 0x1 (1)
      associativity         = 16-way (8)
      size (in 512KB units) = 0x10 (16)

Before applying this PQ, we get:

   /sys/devices/system/cpu/cpu[0-8]/cache/index0/ways_of_associativity: 16
   /sys/devices/system/cpu/cpu[0-8]/cache/index0/number_of_sets: 32

and after:

   /sys/devices/system/cpu/cpu[0-8]/cache/index0/ways_of_associativity: 8
   /sys/devices/system/cpu/cpu[0-8]/cache/index0/number_of_sets: 64

Thanks,

[*] https://lore.kernel.org/lkml/20250304085152.51092-1-darwi@linutronix.de
    https://lore.kernel.org/lkml/20250324133324.23458-1-darwi@linutronix.de

8<--

Ahmed S. Darwish (2):
  x86/cacheinfo: Properly parse CPUID(0x80000005) L1d/L1i associativity
  x86/cacheinfo: Properly parse CPUID(0x80000006) L2/L3 associativity

 arch/x86/kernel/cpu/cacheinfo.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

base-commit: 5c5e95d43de95309622fbf85bf55765ca2cae551
--
2.49.0
