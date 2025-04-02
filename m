Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1826820E01D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743597719; cv=none; b=oRkx9OxsT2IgULpWayh9Uh1AkzBzQZLEHKnTyhF9rtdATeyOMEDS0W/nLom10DhfT2WhlwlEF7JLzOnrCfyZ1YJsTyv1ejTVuAF1yTXeKTRBAN8AnUfL46yxI+GGoAPwgEC+tXqsw9jEgBM5Ufdn3Vz6YwuYY3yU5wbG+wExvvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743597719; c=relaxed/simple;
	bh=YMUMhB8xVBtwCXRkX0PBJ+HemsVjUeLTSyb6MzDREjc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OJWFYxsRmfWpFugR+k9TX3/nHui9kBY6UN3+gvJtWKhsFJTdLc0C1b/vvpqZQn/BWJiQ1N8zPbtn+4zQ0P0KcIzD4V25fvzaxDOh8pL9AezwJySPrMm9wSHtwW8FKMe4dmzQUHJlSRn99Z9j5lsksJ39pFh5KiT+aBi4NuusDyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=LwJeNVwv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="LwJeNVwv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1743597714;
	bh=UW1Q3DQR3kXzVkAw91XeIcKR12Yo/AaT1tjpeSt/DM8=;
	h=From:To:Cc:Subject:Date:From;
	b=LwJeNVwvv3UnB4h5O5u4ef3mVCfPdKmhFgklVP7sF04PbcR5Po/1uToqpyeYeOA37
	 01n32BMOdXKoJoq9S7gGC9dm74mux1BgHnfzaNa6OEJ4gYu2+3QgNKLo+ogFS0NNVH
	 gVEpTjbF1f1E67qghb9U6ylMZZIy+SFBlH+6RO37e+y1LYgPefDL6LykihfJyVeVEI
	 7TSJFn7ktINNG3h2utEhniNA3HkKZK58Xp3FiZ90Bc/nj07SkEmLCCMHWAY72ihIM2
	 0XkbidWxbF717QBNkILLaifRrY3lNBneGukcjcgFazVAez0c6Y8YzAT7PvsUcrCm4y
	 6eInRR76Xhbzw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZSPdF6krrz4wcT;
	Wed,  2 Apr 2025 23:41:53 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 naveen@kernel.org, npiggin@gmail.com, ajd@linux.ibm.com,
 christophe.leroy@csgroup.eu, fbarrat@linux.ibm.com,
 linux-kernel@vger.kernel.org, martin.petersen@oracle.com,
 James.Bottomley@HansenPartnership.com
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.15-2 tag
Date: Wed, 02 Apr 2025 23:41:50 +1100
Message-ID: <87zfgyivld.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hi Linus,

Please pull the removal of the powerpc CAPI driver.

This was a two patch series, the first patch went via the SCSI tree and the
second patch had a conflict with the powerpc fixes branch.

To avoid a messy conflict I put it in a topic branch and resolved the conflicts
there. It's been in linux-next for a couple of weeks.

cheers

The following changes since commit 7b667acd69e316c2ed1b47e5dcd9d093be4a843f:

  Merge tag 'powerpc-6.15-1' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux (2025-03-27 19:39:08 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.15-2

for you to fetch changes up to 892c4e465c360d07f529bc3668fde7cbd4ea6b32:

  docs: Fix references to IBM CAPI (cxl) removal version (2025-04-02 23:09:52 +1100)

- - ------------------------------------------------------------------
powerpc updates for 6.15 #2

 - Remove the IBM CAPI (cxl) driver

Thanks to: Andrew Donnellan.

- - ------------------------------------------------------------------
Andrew Donnellan (1):
      cxl: Remove driver

Michael Ellerman (3):
      Merge branch 'fixes' into topic/cxl
      Merge branch 'topic/cxl' into next
      docs: Fix references to IBM CAPI (cxl) removal version


 Documentation/ABI/{obsolete => removed}/sysfs-class-cxl |   55 +-
 Documentation/arch/powerpc/cxl.rst                      |  470 -----
 Documentation/arch/powerpc/index.rst                    |    1 -
 Documentation/userspace-api/ioctl/ioctl-number.rst      |    4 +-
 MAINTAINERS                                             |   12 -
 arch/powerpc/configs/skiroot_defconfig                  |    1 -
 arch/powerpc/include/asm/copro.h                        |    6 -
 arch/powerpc/include/asm/device.h                       |    3 -
 arch/powerpc/include/asm/pnv-pci.h                      |   17 -
 arch/powerpc/mm/book3s64/hash_native.c                  |   13 +-
 arch/powerpc/mm/book3s64/hash_utils.c                   |   10 +-
 arch/powerpc/mm/book3s64/pgtable.c                      |    1 -
 arch/powerpc/mm/book3s64/slice.c                        |    6 +-
 arch/powerpc/mm/copro_fault.c                           |   11 -
 arch/powerpc/platforms/powernv/Makefile                 |    1 -
 arch/powerpc/platforms/powernv/pci-cxl.c                |  153 --
 arch/powerpc/platforms/powernv/pci-ioda.c               |   43 -
 arch/powerpc/platforms/powernv/pci.c                    |   61 -
 arch/powerpc/platforms/powernv/pci.h                    |    2 -
 drivers/misc/Kconfig                                    |    1 -
 drivers/misc/Makefile                                   |    1 -
 drivers/misc/cxl/Kconfig                                |   28 -
 drivers/misc/cxl/Makefile                               |   14 -
 drivers/misc/cxl/api.c                                  |  532 -----
 drivers/misc/cxl/base.c                                 |  126 --
 drivers/misc/cxl/context.c                              |  362 ----
 drivers/misc/cxl/cxl.h                                  | 1135 -----------
 drivers/misc/cxl/cxllib.c                               |  271 ---
 drivers/misc/cxl/debugfs.c                              |  134 --
 drivers/misc/cxl/fault.c                                |  341 ----
 drivers/misc/cxl/file.c                                 |  699 -------
 drivers/misc/cxl/flash.c                                |  538 -----
 drivers/misc/cxl/guest.c                                | 1208 -----------
 drivers/misc/cxl/hcalls.c                               |  643 ------
 drivers/misc/cxl/hcalls.h                               |  200 --
 drivers/misc/cxl/irq.c                                  |  450 -----
 drivers/misc/cxl/main.c                                 |  383 ----
 drivers/misc/cxl/native.c                               | 1592 ---------------
 drivers/misc/cxl/of.c                                   |  346 ----
 drivers/misc/cxl/pci.c                                  | 2103 --------------------
 drivers/misc/cxl/sysfs.c                                |  771 -------
 drivers/misc/cxl/trace.c                                |    9 -
 drivers/misc/cxl/trace.h                                |  691 -------
 drivers/misc/cxl/vphb.c                                 |  309 ---
 include/misc/cxl-base.h                                 |   48 -
 include/misc/cxl.h                                      |  265 ---
 include/misc/cxllib.h                                   |  129 --
 include/uapi/misc/cxl.h                                 |  156 --
 48 files changed, 43 insertions(+), 14312 deletions(-)
 rename Documentation/ABI/{obsolete => removed}/sysfs-class-cxl (87%)
 delete mode 100644 Documentation/arch/powerpc/cxl.rst
 delete mode 100644 arch/powerpc/platforms/powernv/pci-cxl.c
 delete mode 100644 drivers/misc/cxl/Kconfig
 delete mode 100644 drivers/misc/cxl/Makefile
 delete mode 100644 drivers/misc/cxl/api.c
 delete mode 100644 drivers/misc/cxl/base.c
 delete mode 100644 drivers/misc/cxl/context.c
 delete mode 100644 drivers/misc/cxl/cxl.h
 delete mode 100644 drivers/misc/cxl/cxllib.c
 delete mode 100644 drivers/misc/cxl/debugfs.c
 delete mode 100644 drivers/misc/cxl/fault.c
 delete mode 100644 drivers/misc/cxl/file.c
 delete mode 100644 drivers/misc/cxl/flash.c
 delete mode 100644 drivers/misc/cxl/guest.c
 delete mode 100644 drivers/misc/cxl/hcalls.c
 delete mode 100644 drivers/misc/cxl/hcalls.h
 delete mode 100644 drivers/misc/cxl/irq.c
 delete mode 100644 drivers/misc/cxl/main.c
 delete mode 100644 drivers/misc/cxl/native.c
 delete mode 100644 drivers/misc/cxl/of.c
 delete mode 100644 drivers/misc/cxl/pci.c
 delete mode 100644 drivers/misc/cxl/sysfs.c
 delete mode 100644 drivers/misc/cxl/trace.c
 delete mode 100644 drivers/misc/cxl/trace.h
 delete mode 100644 drivers/misc/cxl/vphb.c
 delete mode 100644 include/misc/cxl-base.h
 delete mode 100644 include/misc/cxl.h
 delete mode 100644 include/misc/cxllib.h
 delete mode 100644 include/uapi/misc/cxl.h
-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRjvi15rv0TSTaE+SIF0oADX8seIQUCZ+0tEgAKCRAF0oADX8se
IcfuAQCG4FpG5hlZ01jIWq9cQmnhHYZbnvR7AkvI1TYlPpqbYQEAw1nGSOU6M30Q
SM3visqeO9ZGUrmJhJfllHEBRpHJcAo=
=aTSI
-----END PGP SIGNATURE-----
