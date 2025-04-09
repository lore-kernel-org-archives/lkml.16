Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BE825D902
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 10:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744196079; cv=none; b=DCIt0YtGMT+NpnV3QmIvcxbtfztbijXFhzqgpzIFEWeYe+3S+2J2XTkLZltmtqfsqB7NzJqpXH7Z4rwlf3FfIs1RlshT6U5ZTRSA3CYHQ8DwABRg2/WOmOqMf/B8G/RoCgX1iHc4/ewDK7kU0/tdjku2zT9J5qk+rFxwTFRgzF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744196079; c=relaxed/simple;
	bh=foWHeaBGdITXMe6fxABe/UavD0jCHlXOU5UxFDAqikg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ALNhZl/p2kns88YreKbYsdPFmtX1d5+PXxK9zloGzAIEOoIRAhXsYSluKyLsES17VZ7N2lbZTSbO9590y/yWk6NZz0NGKTBKXi8vo0ZMP0VzdsWUABwL2XoJ2216kcoPWz2Yuh0j/oAIULW3MYFuG90cXZ4PisqclVqHlZIlCmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=C+7LEF1U; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TJw38jNw; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="C+7LEF1U";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TJw38jNw"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744196076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EBpeEk0XW9fD4NiTOaLzx+OjubRdln2MtWdhcPEd/m8=;
	b=C+7LEF1UcoBSXWyB0emj3FKQx4xorA9dFh2dTV/s7YxGR1n6QcaLieDuvh9av2I3zSG864
	hDVXMr+HOunFmT4r+Aahc+IgJcVdMeFxF0lP8KYrVsu2VouNTAKubRnITa1EA5zTVTjkoS
	zv2jAMOndULqSr4oi75d3tI/JIbQfzghYGy2omcgjS9fA2CbrHG3ohqx3OZltDQAqsqbBt
	hoLxffDUkZv/9cxgYIBK1JBeYKnleBqloR7CmfrgxkoaOCGbz3aCWlMmcWGj7ZJOaVXfKX
	dOXEhH3C+YDiwi8SnMEOZWcHdWDo+JVQo9hs1AqfqheVCNxbHNCjeS7GT9PNXw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744196076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EBpeEk0XW9fD4NiTOaLzx+OjubRdln2MtWdhcPEd/m8=;
	b=TJw38jNw6D5WIGE0odMJd43HYfAi3KbLM7BSXttFihfBOdPMLsinFILofdsZ8rCw9W9IJR
	fI8zFONN6smV9DBQ==
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
Subject: [PATCH v1 0/2] x86/cacheinfo: Fixes for CPUID(0x80000005) and CPUID(0x80000006)
Date: Wed,  9 Apr 2025 12:54:23 +0200
Message-ID: <20250409105429.1048199-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

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

 arch/x86/kernel/cpu/cacheinfo.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
--
2.49.0
