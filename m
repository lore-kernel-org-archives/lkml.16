Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6B3230272;
	Thu, 24 Apr 2025 10:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490466; cv=none; b=b0yUkTUMkSZfnv1Nw0T0iXRgwYhVlP/9YrpJwqirSGOXHL9DVEJxUzFa6K4JYZt779niayKXswlj31B2uA5ujAv4rDKX4RXEfHXbPOCVy5a+l4SzoYNFx9ZnkqjZTKZpWMVQnMFnXmKxjtmBONdZGjpDiyOZCNrCWEuCcxSA1VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490466; c=relaxed/simple;
	bh=Dhr0rsx9WpeMa8aspdbgl7YO+d4d6KcEE2+waQCoYbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FQeLWXEI2BOc/yVLLwFJa4JAy747bYyb061I5+7AxyYecsZXkwsMoOQXCT01dIIdvIFM6J9Ks7tjrGd1t0Q4c2ckpG/zIf/iZUWrEhrG5SsdI7L+j7p06gPQgnrk/gm2JMBn0GWTY3N5sLrH8RN+NeK2OblZxprNo1LQUvvSoTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zbx8c1dL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zbx8c1dL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12B9C4CEE3;
	Thu, 24 Apr 2025 10:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490465;
	bh=Dhr0rsx9WpeMa8aspdbgl7YO+d4d6KcEE2+waQCoYbI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Zbx8c1dLijPcaODhyVkHFGx5r2ZphraIAZSwlIYG86gb3W26LbpP4Fji8vaGl5y2K
	 MZUj30RABRGse5hQ8qy57swFn1Ipysp2hqD9ujgEc/sCCdXZRUYEZ5f1UzC3ALXkod
	 iZIE8+yDBCE+orVCF0tC0FMM5SuhWYnCr6CAQ1xU2iUK+t38VSe/XeKR1IDpHoSouL
	 elD14Cb89Lw5VWoe6BkQSZOZBl9t+OOeRjfBKiy5PQkeWZoXRVcLh4gp70sDvlZi1V
	 OYMnA71A/D+0tz+iTG1TVlCjAHhDzkcmF+3dwHyu6JgYWDIzCIcKfXEUds/073r5Rp
	 P9X/p9JsBp8BQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 24 Apr 2025 12:25:33 +0200
Subject: [PATCH v2 22/22] arm64: Kconfig: Enable GICv5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gicv5-host-v2-22-545edcaf012b@kernel.org>
References: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
In-Reply-To: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
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

