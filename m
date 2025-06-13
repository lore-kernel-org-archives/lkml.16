Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E44522068B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 11:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749813145; cv=none; b=i6i0x+qr32K7H3bEsBj1sH1LccZWnpdMEvYhEU1bWzmd9NYwVfl4cCosBoUyktwnufVyAf7S1BY197n5Uo7iH13kTueP+EMICF55KAOy2/W3YAkrs63P0dAoCRL/hQB5Poa3VYhsHDPliGHzgDLwYeB3l4ScBUPQX/P0M2A9sZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749813145; c=relaxed/simple;
	bh=BLEfu11hN5X4MIsZbk12o2hqJFb1RTdsBIgg4Sa8kIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S5u8V8IUfIKiAkaPcc01ZH0+w6+8xheWqlZqRaYMtqvX/lOWFBr+Kv5bBJKRgPZEj3aL6uxgDxAJfVW/NurduZZf6s3SHHcCIktns7Zykm2PL1qkgpZ134CWCFoyOBJf487AUWVPrlaX+9Kx0yXP4Ys289+6UuwYAOdz772SDU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54D3C1C0A;
	Fri, 13 Jun 2025 04:11:57 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 82D623F59E;
	Fri, 13 Jun 2025 04:12:16 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org,
	catalin.marinas@arm.com,
	sami.mujawar@arm.com,
	aneesh.kumar@kernel.org,
	steven.price@arm.com,
	linux-kernel@vger.kernel.org,
	sudeep.holla@arm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH 0/3] arm64: realm: Add support for encrypted data from firmware
Date: Fri, 13 Jun 2025 12:11:50 +0100
Message-ID: <20250613111153.1548928-1-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Confidential compute firmware may provide secret data via reserved memory regions
(e.g., ACPI CCEL, EFI Coco secret area). These must be ioremap'ed() as encrypted.
As of now, realm only maps "trusted devices" (RIPAS = RSI_RIPAS_DEV) as encrypted.
This series adds support for mapping areas that are protected
(i.e., RIPAS = RSI_RIPAS_RAM) as encrypted. Also, extrapolating that, we can map
anything that is not RIPAS_EMPTY as protected, as it is guaranteed to be "protected".

With this in place, we can naturally map any firmware provided area based on the
RIPAS value. If the firmware provides a shared region (not trusted), it must have
set the RIPAS accordingly, before placing the data, as the transition is always
destructive.

Also enables the EFI Coco secret area support and Confidential Compute Event
Log (CCEL) for arm64.


Suzuki K Poulose (3):
  arm64: realm: ioremap: Allow mapping memory as encrypted
  arm64: Enable EFI secret area Securityfs support
  arm64: acpi: Enable ACPI CCEL support

 arch/arm64/include/asm/io.h          |  6 +++++-
 arch/arm64/include/asm/rsi.h         |  2 +-
 arch/arm64/kernel/acpi.c             |  5 +++++
 arch/arm64/kernel/rsi.c              | 26 ++++++++++++++++++++++----
 drivers/virt/coco/efi_secret/Kconfig |  2 +-
 5 files changed, 34 insertions(+), 7 deletions(-)

-- 
2.43.0

