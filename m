Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CDE1C5F18
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 19:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744227020; cv=none; b=EVWyuBl2XDYf45/SX2sMd7+EbLAVwrtZRR9GZcfwDA21NVRZXsc4yeqwyjMne57axJ79/83Csll4m/883kuKaoCdGUmqlRHxE0clVca/dISZP5tBXh7npMdfyLjamas4FhULL75DiITXEcakC0/foBIY9Wdo4yb96AXE4+DQYz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744227020; c=relaxed/simple;
	bh=rLVCto77rXoyxOAnxaMssoEXsBuoenM6dX6qAsp7LJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=shyb8T3P4veV+ZuyaORVGSZsoRA/R7gg/2xzRJDQfIPHzDd6uJB/5pD2KuqnHiPvUq9ytNrnhikUv4gbFIO06esRTXoHbUZyMAeWTBt9UMe0yXxN7tDC3jLIYjkJsk/Bs3egnNipCBv1B3+z04vDmf2CZNgyeIgav5kcbnQy1uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J1niUu0p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J1niUu0p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBBD9C4CEE2;
	Wed,  9 Apr 2025 19:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744227020;
	bh=rLVCto77rXoyxOAnxaMssoEXsBuoenM6dX6qAsp7LJA=;
	h=From:To:Cc:Subject:Date:From;
	b=J1niUu0p0A3DahxPhmu1LIUq0mTzpQKDmuoX9Yztwgp9FC1oCJ8I/9s16smqTl+ak
	 YsOzxgTjBsjbYorLgBqjPP1m0NYmD5FLaF0K1k+LWkdnGqZLhAjPVuYbxgDN7UwwkJ
	 8jfYHUI/Z+oK4+G0MCFQYifIKFjB2w3nqAgyVCYhTooFw544GUMfS+OLYLGpC3FwfW
	 OBFoFoj0GDDwywwb7Tjeg5QcBr0NU/TH8QNFDiwt75VR1p14tRgCrqVExjecyRxyl8
	 DBSGHlS90oKRUGW/Om9qrVWihkDkGFRBV4jfiHAC9PTut4chu0kk2ej66uwikEVl3D
	 diDASiRuG2n8w==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Song Shuai <songshuaishuai@tinylab.org>,
	Daniel Maslowski <cyrevolt@gmail.com>,
	linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Nick Kossifidis <mick@ics.forth.gr>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] riscv: kexec_file: Support loading Image binary file
Date: Wed,  9 Apr 2025 21:29:57 +0200
Message-ID: <20250409193004.643839-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Björn Töpel <bjorn@rivosinc.com>

Hi!

For over a year ago, Daniel and I was testing the V2 of Song's series.
I also promised to take the V2, that had been sitting on the lists for
too long, to rebase it on a new kernel, and re-test it.

One year later, here's the V3! ;-)

There are no changes from V2 other, than some simple checkpatch
cleanups.

Song's original cover:
  | This series makes the kexec_file_load() syscall support to load
  | Image binary file. At the same time, corresponding support for
  | kexec-tools had been pushed to my repo[2].
  |
  | Now, we can leverage that kexec-tools and this series to use the
  | kexec_load() or kexec_file_load() syscall to boot both vmlinux and
  | Image file, as seen in these combo tests:
  |
  | ```
  | 1. kexec -l vmlinux
  | 2. kexec -l Image
  | 3. kexec -s -l vmlinux
  | 4. kexec -s -l Image
  | ```

Notably, kexec-tools has still not made it upstream. I've prepared a
branch on my GH [3], that I indend to post ASAP. That branch is a
collection of fixes/features, including Song's userland Image loading.

The V2 is here [2], and V1 [1].

I've tested the kexec-file/Image on qemu-rv64, with following
combinations:
 * ACPI/UEFI 
 * DT/UEFI
 * DT

both "regular" kexec (-s + -e), and crashkernels (-p).

Note that there are two purgatory patches that has to be present (part
of -rc1, so all good):
  commit 28093cfef5dd ("riscv/kexec_file: Handle R_RISCV_64 in purgatory relocator")
  commit 3f7023171df4 ("riscv/purgatory: 4B align purgatory_start")

[1] https://lore.kernel.org/linux-riscv/20230914020044.1397356-1-songshuaishuai@tinylab.org/
[2] https://lore.kernel.org/linux-riscv/20231016092006.3347632-1-songshuaishuai@tinylab.org/
[3] https://github.com/bjoto/kexec-tools/tree/rv-on-master

Song Shuai (2):
  riscv: kexec_file: Split the loading of kernel and others
  riscv: kexec_file: Support loading Image binary file

 arch/riscv/include/asm/image.h         |   2 +
 arch/riscv/include/asm/kexec.h         |   6 +
 arch/riscv/kernel/Makefile             |   2 +-
 arch/riscv/kernel/elf_kexec.c          | 485 -------------------------
 arch/riscv/kernel/kexec_elf.c          | 144 ++++++++
 arch/riscv/kernel/kexec_image.c        |  96 +++++
 arch/riscv/kernel/machine_kexec_file.c | 361 ++++++++++++++++++
 7 files changed, 610 insertions(+), 486 deletions(-)
 delete mode 100644 arch/riscv/kernel/elf_kexec.c
 create mode 100644 arch/riscv/kernel/kexec_elf.c
 create mode 100644 arch/riscv/kernel/kexec_image.c


base-commit: a24588245776dafc227243a01bfbeb8a59bafba9
-- 
2.45.2

