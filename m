Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50D12686AF;
	Tue,  8 Apr 2025 10:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744109486; cv=none; b=uFDcymGVIQX4tbZfN1sd/D/aKssBGS5Ee9iBoIYM2GGlHK1Yzy7SCDQZkMk2llrRXbLBY+3RrLmsA3p2cqa43hmWxKtnm2nSm8uq92JQ36cxF0vS0/WkviiXZlgnnta8L6jbAwK1yQgx4+mc7gghmWLDpnWN8GrBD51QQeRLrZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744109486; c=relaxed/simple;
	bh=IR60XZsATfdTuIxQzwSdrYf53KWRtcmnuEgRG5+wtmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kHuKLjRRy0+OS/hUldMvz+ky/uXLmZdgBhTXaCFr2nHy+nt9eD9lPmiHryHAvNSMCz2kOklcxzd0ChGHVP04EmFMd1BhHQtbj1cIYo2oRWEwkT5RBLwc9lx1TS3jW46Za8dUFx9INCdX3HrF/R5GvxMtqCQ6vJLwVNlcE7zNN+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XfGxKLEY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XfGxKLEY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403E1C4CEE5;
	Tue,  8 Apr 2025 10:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109486;
	bh=IR60XZsATfdTuIxQzwSdrYf53KWRtcmnuEgRG5+wtmQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XfGxKLEYSTFLNm/CA7KfzyvK/2GTBl7eTIjUsfsLnCTE7IRLm0uc1JLHyqW0111Ib
	 nDZ5aGuYRrlZ/tDFPObh11a2EBWSJnIgTnIN6oi+5XcqntkJDHRikD1pt8e9DCsUS7
	 XAyEhvjlVO9kNHHTg3eO5MTyXUfboQK3myXNF8adm1elJBtH/MvuEFEuhIwK/Elz4u
	 YWMpGLZ9GQLP8lSWArA7QVjYkrqaY2TO6xOJK6EGwtJDztjuKhuET3IipBUR+BE2uB
	 mMulOxb1+pnnu3k8Rwn8h4zXXibl35utBr+j8XEP6TkJnRocOWfZflvXMmWQkM15kM
	 w5G3F4w6l96MA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:09 +0200
Subject: [PATCH 10/24] arm64/sysreg: Add ICC_PCR_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-10-1f26db465f8d@kernel.org>
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

Add ICC_PCR_EL1 register description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index c96243505031ea680c04a693fee2c96ad19e30ea..9a2ddab8661c85586b0e91f7eaabd5a6b3409c67 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2806,6 +2806,11 @@ Res0	31:1
 Field	0	EN
 EndSysreg
 
+Sysreg	ICC_PCR_EL1	3	1	12	0	2
+Res0	63:5
+Field	4:0	PRIORITY
+EndSysreg
+
 Sysreg	CSSELR_EL1	3	2	0	0	0
 Res0	63:5
 Field	4	TnD

-- 
2.48.0

