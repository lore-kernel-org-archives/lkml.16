Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75F53254B0C;
	Fri, 21 Feb 2025 18:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740161062; cv=none; b=E2en3nRnPZ/Vaxp0U+TydIbzkMiHj7PDTnvBkX8KPMxQ2btVBVDJVtmX49Stn7BqaDJiW7mTY0exZgUlB98HQW4YZd23jaqCkR0beuyIxH5Uxj2+Ozl9bEFLnagPiIiD8h2lQVyiMGHsxHWSpsozKHl6Fcju7RYmrC2M7D/mxXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740161062; c=relaxed/simple;
	bh=0kLYZcRL43WmeeTxClig95KR+zknL1JhMw9OnsaSdb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o1lFUDDM1I6t2117kuQvId8UirSgKC9NBJSVmKCOdEi3eGKP60TicB11Y8P7yEzw9jC2CtK0K4TRJqF8HJdbly+PFc/Cx5WHLQbuuxxmGKXYDFlxzZDBBx9iXdplAIVHkxILNWjPNGF4wWiZgeMCavhvWG7lOXDHNd2y9tzJQE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDEB41CC4;
	Fri, 21 Feb 2025 10:04:38 -0800 (PST)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA64E3F59E;
	Fri, 21 Feb 2025 10:04:18 -0800 (PST)
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 10/10] MAINTAINERS: Add Vincenzo Frascino as Arm Morello Maintainer
Date: Fri, 21 Feb 2025 18:03:49 +0000
Message-ID: <20250221180349.1413089-11-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Vincenzo Frascino <vincenzo.frascino@arm.com> as Arm Morello Software
Development Platform Maintainer.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3864d473f52f..6aaef2286de8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2750,6 +2750,13 @@ F:	arch/arm/boot/dts/socionext/milbeaut*
 F:	arch/arm/mach-milbeaut/
 N:	milbeaut
 
+ARM/MORELLO PLATFORM
+M:	Vincenzo Frascino <vincenzo.frascino@arm.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/arm,morello.yaml
+F:	arch/arm64/boot/dts/arm/morello*
+
 ARM/MOXA ART SOC
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.43.0

