Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF8226B97D;
	Tue,  8 Apr 2025 10:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744109537; cv=none; b=lc+03lwkrKXXway/RGbdz3vCnfZzvaezBnuficR3w/3NMmPor97rxT/oij5cfoPl79YQn7jSSLskz2rkjcXq0ueMGhiqyw5RkEWw7os9qzs6bizh5vhJ7I3Bowc6SawqhBOAHxzVs6KI9+MHCi9yRuHLB9yQPRLq3reydOMrEK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744109537; c=relaxed/simple;
	bh=Dhr0rsx9WpeMa8aspdbgl7YO+d4d6KcEE2+waQCoYbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N5uBCMi9NHsFibCthwnTvdI8nH8kfHb3DK/XzLP0svk9Lb2AS5MVup2CvHiQU+JyV1whpqmoQmGMVIQe0nVTdIo9B7I8ulSCWYJwGPUlnfLNaKFT6j+aNfKBnB+0JGvEVOv+6IHTDmXszcEE2syBzqMPvVYriuzl/Q5xpopBjYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPcFfMue; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPcFfMue"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A5FC4CEE5;
	Tue,  8 Apr 2025 10:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109536;
	bh=Dhr0rsx9WpeMa8aspdbgl7YO+d4d6KcEE2+waQCoYbI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QPcFfMueH+YR1V9Q9Qfq/RUp1p9rSenNC/vFt0XOexIUUc52d6+g0KpfC394f8kWm
	 qfS9mWg7ucUq5IN0ivu4QqeoYH0zs7Eszb/pRZqrkiI/RAfMHWTYLsuoz/OkFy/Cc9
	 iovtDoVhcauoezTvoHsIMbwcXj7P2XwzeRxbMOWOcp0IaaVLzoKBdEsuwiioxbpLAg
	 /pqeKQy3CJNqSWcVvfJfQFpy+Vgs5IMSmKO+TTap2xNm0KIrhydnhOFTbAD40L+E7p
	 PGxIRLbdhLvsMZxQdEMoYqgR7rfnYZ7z/b5toiliF0n2Vvfm5E97Dpqjxv2rjnKZPB
	 fPJmVDmxoDmDg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:23 +0200
Subject: [PATCH 24/24] arm64: Kconfig: Enable GICv5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-24-1f26db465f8d@kernel.org>
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

Enable GICv5 driver code for the ARM64 architecture.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a182295e6f08bfa0f3e6f630dc4adfe797a4d273..f1b3c695b376717979ae864865238ae12ad65ca2 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -128,6 +128,7 @@ config ARM64
 	select ARM_GIC_V2M if PCI
 	select ARM_GIC_V3
 	select ARM_GIC_V3_ITS if PCI
+	select ARM_GIC_V5
 	select ARM_PSCI_FW
 	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS

-- 
2.48.0

