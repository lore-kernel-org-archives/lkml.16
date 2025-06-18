Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8802874E0
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750239022; cv=none; b=r1cTsCL9NFymrkldNDpVXREDUFgVITdsEbA6x6JZ4BLbBXpPEYFy3AjUd+IWNZwy+DWMBEOhjfK005jnFXW+p/Irc6Y9o2qDUA4zdYnEqqveDFhKk3AJmtIP6ZOphjErR4sF9xYKvbUe5kJ6FEwoXP2yPUSu/+m/eOiz66yRD9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750239022; c=relaxed/simple;
	bh=4k2LEfIzPWBG4ppJbbhrLU0DESX0vB4ItYaBtVsmIQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AcqxbqKbUVkTA/HI7DlDliyh//EMnvpDVuKu2dlCW21LX5sPIPGzqjkGrsnKqb07Uv+U1cWHhgaVYssKQSWiGTacvY3d/Az8a7URNsPELXUzDt/oC00a+qX1nQSJwP2k5ZyHvGIcTCkv32/3Pe5cOc06Bcp/iTdLiBzPAbePH0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A01151D34;
	Wed, 18 Jun 2025 02:29:59 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EA2303F58B;
	Wed, 18 Jun 2025 02:30:16 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	hardevsinh.palaniya@siliconsignals.io,
	samuel.holland@sifive.com,
	palmer@rivosinc.com,
	charlie@rivosinc.com,
	thiago.bauermann@linaro.org,
	bgray@linux.ibm.com,
	tglx@linutronix.de,
	puranjay@kernel.org,
	david@redhat.com,
	yang@os.amperecomputing.com,
	mbenes@suse.cz,
	joel.granados@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v7 5/8] arm64/kvm: expose MTE_STORE_ONLY feature to guest
Date: Wed, 18 Jun 2025 10:29:54 +0100
Message-Id: <20250618092957.2069907-6-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618092957.2069907-1-yeoreum.yun@arm.com>
References: <20250618092957.2069907-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

expose MTE_STORE_ONLY feature to guest.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/kvm/sys_regs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index c8c92cb9da01..7bc99ed201eb 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1620,7 +1620,8 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 		mask = ID_AA64PFR2_EL1_FPMR;
 
 		if (kvm_has_mte(vcpu->kvm))
-			mask |= ID_AA64PFR2_EL1_MTEFAR;
+			mask |= ID_AA64PFR2_EL1_MTEFAR |
+				ID_AA64PFR2_EL1_MTESTOREONLY;
 
 		val &= mask;
 		break;
@@ -2884,7 +2885,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 				       ID_AA64PFR1_EL1_MTE)),
 	ID_WRITABLE(ID_AA64PFR2_EL1,
 		    ID_AA64PFR2_EL1_FPMR |
-		    ID_AA64PFR2_EL1_MTEFAR),
+		    ID_AA64PFR2_EL1_MTEFAR |
+		    ID_AA64PFR2_EL1_MTESTOREONLY),
 	ID_UNALLOCATED(4,3),
 	ID_WRITABLE(ID_AA64ZFR0_EL1, ~ID_AA64ZFR0_EL1_RES0),
 	ID_HIDDEN(ID_AA64SMFR0_EL1),
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

