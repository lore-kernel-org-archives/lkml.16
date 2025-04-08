Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7F9268C7C;
	Tue,  8 Apr 2025 10:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744109501; cv=none; b=DclZh4H9yxLqKvyjP20DHzMft6AdzlMv5TJqDCemykQoq7NO4Ikde49f+3EUxxA6a1s+5QBvCDWYl85Gbc9m+Ju9U3+lVYffIJm3ECJMzqFVMX4I7WV7lExxmOh3AkQi82KHJ3QiQI2nXIwczruH0mmuK1/T7QbsuO6VOPKStcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744109501; c=relaxed/simple;
	bh=9zWp7WGj091+ZG2FSlP0T7J3sn+1tw+UEtNEfbmUjxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B8qrbIBs6admHhMsssDrRsHqKsWZxmtPNaOHWKzIF+YH5IBTkH0WkL4owfSJPzcFu4CdA8utlPK9FQY8ozCBBmMIBI1KU4Al/kllUWUG/P6E7lgVQAh/1ZBATThhDBO/xoZctBTEUDw0X0SM0SCeyXXRxBffFyGaQYf+1fAHSpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nqlpQpc1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqlpQpc1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96949C4CEE5;
	Tue,  8 Apr 2025 10:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109500;
	bh=9zWp7WGj091+ZG2FSlP0T7J3sn+1tw+UEtNEfbmUjxQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nqlpQpc1SEMWis8VXKD3OnJH1X5KYSi+9N9gfPHksaZ6ekQ2RN6rNygsuiZpMx5Bb
	 SX/sGi0Os0mb8ZDQC3ickjOESKwD4P5gzt98oAbOovsDGLK11Z4WnlS/l4Z9Aa8dTU
	 vqK7cx686WtbvVdn4cEjU36P44gVnD8ThbKS7w63kBc7qUcqUDbA/SwbKliM79DsWQ
	 bHHMFgS2HeNh1hi1FH1fR8Oa4Q+ZyGYQQgOI9oO2aIWGaHWP/IdPMe814VFjMcnfj4
	 Aw+P09xsa3MKaZw9yq1sQoLh8aHPjC4KTo/GPWaB2j+g/ZIBXY3ZANsmfrjbEo+Ph0
	 /QnSwZbk7PuwA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:13 +0200
Subject: [PATCH 14/24] arm64/sysreg: Add ICH_HFGITR_EL2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-14-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
In-Reply-To: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2

Add ICH_HFGITR_EL2 register description to sysreg.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 1b519e35000be328acfe26d51e098059f9cf9ef2..5af0dea6e775ea680686dbe4bc836b5f5b69fbc7 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3616,6 +3616,21 @@ Res0	1
 Field	0	ICC_APR_EL1
 EndSysreg
 
+Sysreg	ICH_HFGITR_EL2	3	4	12	9	7
+Res0	63:11
+Field	10	GICRCDNMIA
+Field	9	GICRCDIA
+Field	8	GICCDDI
+Field	7	GICCDEOI
+Field	6	GICCDHM
+Field	5	GICCRDRCFG
+Field	4	GICCDPEND
+Field	3	GICCDAFF
+Field	2	GICCDPRI
+Field	1	GICCDDIS
+Field	0	GICCDEN
+EndSysreg
+
 Sysreg	ICH_HCR_EL2	3	4	12	11	0
 Res0	63:32
 Field	31:27	EOIcount

-- 
2.48.0

