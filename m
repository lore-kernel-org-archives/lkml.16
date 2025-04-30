Received: from 1.mo550.mail-out.ovh.net (1.mo550.mail-out.ovh.net [178.32.127.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3DD22839A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.32.127.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746053448; cv=none; b=mL94OtGBGBgqJ/TIvD/ZC5a9lCUeL3tOQmrYipXCKeRWsbcatjHoAnlksRRevV/nD8241WkidntifB8OtgDROXWq0O65DU6qtRxVU3VRWdElPAJjF5qdSxjA5yANHVsr1JaQ9MmihfJdePFCyHlahxvOqu9nGsrKuTTqY5d+p2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746053448; c=relaxed/simple;
	bh=h5TDfjVJP+JA3nYD+SpLtv/fGeAqasik99QHwRGZMpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Aw/ClJ1dTT0+UhBK5BANVGZMwxq6duMtOmN/jCTWEV1L37nop0KL/7gpXc67s+ZR//EuO0lAk00/szE6wtm8V8cycVQaOLLGCYYtVQke3HIJn7wAqRV1ylMF7FrePEw9g04C36kZzSSLNTm6ep5vrP7dBTMkts8pfSnT8cTu6iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=Bp8AP/HN; arc=none smtp.client-ip=178.32.127.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="Bp8AP/HN"
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.17.160])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4ZnshJ5Lddz1Xnm
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:45:04 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-nrbjb (unknown [10.108.42.124])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C605D1FE5D;
	Wed, 30 Apr 2025 22:45:02 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.96])
	by ghost-submission-5b5ff79f4f-nrbjb with ESMTPSA
	id LdGgHu6nEmjucAAAg4lW5Q
	(envelope-from <sergii.dmytruk@3mdeb.com>); Wed, 30 Apr 2025 22:45:02 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-96R0016457a580-feb4-44b8-907e-f9518034a7ab,
                    7FFE21389DDF989CCD6FB7268846A7FDE11993D7) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: linux-kernel@vger.kernel.org
Cc: trenchboot-devel@googlegroups.com,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Joerg Roedel <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org
Subject: [RFC PATCH v2 0/9] x86: Trenchboot Secure Launch DRTM for AMD SKINIT (Linux)
Date: Thu,  1 May 2025 01:44:42 +0300
Message-ID: <cover.1746037489.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12101172201501406284
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepkedvkeefveejhfevfffgkedukeegueffiedvhedtiefggeetjeeugeeujeeivddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekuddrudejkedpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheehtdgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=V5q8ZXow5mUTSUWflxYvaL7jcmMyQOWtgjykd9BwtWw=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1746053104; v=1;
 b=Bp8AP/HNVrxCf80EH0E+/V/qvK9ucypG0uiczrgkh0H2hwQtgjL36adMpga8w2svdlKVpDPU
 8I/ABEaBw10L7CC6MGw1LkFdx6ctjzD6rnLziF4xATrp57qDbfgNnQz/AvUTLj6pCE5vaUMzBGn
 hNc565EIeEPx8lei8yMbDbCx9fomEaCYyPJRS5+IUJTcQsuCnfqkTgmNeFRHhY6rgrAtivcJso/
 3DXk5D4Dwc0cWzTJJsFa4QVgK6CO0epzm72mCCdiRg/D66/nBMo6ZzSZWtYcqgnRAmen5nJjOkj
 9J4mER3L7d7Se3pLXhFiNjQ+6TWkFP1HhnNPh/7iQNlKA==

NOTE: this patch set follows up on Intel TXT DRTM patches that are
currently under review in their 14th version [0]; therefore, it is not
standalone!

The publication of the patches at this point pursues several goals:
 - Make anyone tracking upstream aware of the maturity of the support
   for AMD SKINIT.
 - Collect early feedback on the SKINIT implementation.
 - Finally, demonstrate the extensibility of Secure Launch for
   incorporating additional platforms.

As the RFC suggest, this series is temporal and will be updated based on
changes made to the initial Secure Launch series. Review comments are
greatly welcomed and will be worked/addressed, but we would caution that
changes to the Secure Launch series will take precedence over review
comments. Once the Secure Launch series is merged, this series will
transition from RFC to a formally submitted series.

-----

The patches extend Secure Launch for legacy and UEFI boot with support
for AMD CPUs and their DRTM in two flavours: SKINIT on its own and SKINIT
with DRTM service running in PSP/ASP.

The code is adjusted to detect CPU type and handle AMD differently.
DRTM-specific differences relative to Intel TXT include:
 - absence of DRTM-specific registers to pass data from bootloader to DLME,
   resulting in passing some information via boot parameters
 - use of a different SLRT entry
 - not sending #INIT to APs
 - special handling for TPM event logs to make them "compatible" with TXT logs

-----

[0]: https://lore.kernel.org/lkml/20250421162712.77452-1-ross.philipson@oracle.com/

Changes in v2:
 - rebase onto v14 of the main patch set
 - cleaner handling of reset in sl_main.c leading to a smaller diff
 - renamed slr_entry_amd_info::boot_params_{base,addr} for consistency with
   slr_entry_intel_info
 - slightly safer slaunch_reset() macro in slmodule.c

-----

Jagannathan Raman (1):
  psp: Perform kernel portion of DRTM procedures

Michał Żygowski (1):
  x86: Implement AMD support for Secure Launch

Ross Philipson (6):
  x86: AMD changes for Secure Launch Resource Table header file
  x86: Secure Launch main header file AMD support
  x86: Split up Secure Launch setup and finalize functions
  x86: Prepare CPUs for post SKINIT launch
  x86/slmodule: Support AMD SKINIT
  x86: AMD changes for EFI stub DRTM launch support

Sergii Dmytruk (1):
  Documentation/x86: update Secure Launch for AMD SKINIT

 .../secure_launch_details.rst                 |  83 +++++-
 .../secure_launch_overview.rst                |  61 ++--
 arch/x86/Kconfig                              |   9 +-
 arch/x86/boot/compressed/sl_main.c            | 271 ++++++++++++++----
 arch/x86/boot/compressed/sl_stub.S            |  41 ++-
 arch/x86/include/asm/svm.h                    |   2 +
 arch/x86/include/uapi/asm/setup_data.h        |   3 +-
 arch/x86/kernel/Makefile                      |   1 +
 arch/x86/kernel/setup.c                       |   2 +-
 arch/x86/kernel/sl-psp.c                      | 239 +++++++++++++++
 arch/x86/kernel/slaunch.c                     | 193 +++++++++++--
 arch/x86/kernel/slmodule.c                    | 161 +++++++++--
 arch/x86/kernel/smpboot.c                     |  15 +-
 arch/x86/kernel/traps.c                       |   4 +
 drivers/firmware/efi/libstub/x86-stub.c       |  12 +-
 drivers/iommu/amd/init.c                      |  12 +
 include/linux/slaunch.h                       |  83 +++++-
 include/linux/slr_table.h                     |  15 +
 18 files changed, 1044 insertions(+), 163 deletions(-)
 create mode 100644 arch/x86/kernel/sl-psp.c


base-commit: 616c6ae2fa0b736552873af08ad0e5532e04ad80
-- 
2.49.0

