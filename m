Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72CB7253B42;
	Fri, 21 Feb 2025 18:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740161050; cv=none; b=FEDlA93fNUkg++vnTqVYNq91PQMG+FscrtgOCAeQwCWOw2CSby3oJdUxzPpZ0O0tKwohKqAB2OSMcCDRfC7s7Z3Bk6IAzbGqqaVdmluw8ktq7MM+pwspwsS185+8Y7toEtpDgNzy3esgTA7E6Yy6EOnXsbKqWkdoLNbT/CS2VOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740161050; c=relaxed/simple;
	bh=xLPhUv/7InGqVeGLHEvlqDXHIMCnOAzOpCoDyWSS4Ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gE9JGIwRl/ZxNI1aY80PfuM1bGR785DlsNdjRIq9EctxbRo1UyBKWPe+9FoOYK2kyPJsSmbem0bzw6ecQYSMZgDfwp8YmnIxpowBt5+T6ikdFcYXTus2fchlN9UyEZOGQ3BEd6KkIplnZo+ykhhUkHIEK6e75cLuEHpvjLrNbZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 817811CC4;
	Fri, 21 Feb 2025 10:04:26 -0800 (PST)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 87C3D3F59E;
	Fri, 21 Feb 2025 10:04:06 -0800 (PST)
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
Subject: [PATCH v7 05/10] dt-bindings: arm-pmu: Add support for ARM Rainier PMU
Date: Fri, 21 Feb 2025 18:03:44 +0000
Message-ID: <20250221180349.1413089-6-vincenzo.frascino@arm.com>
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

Add support for the ARM Rainier CPU core PMU.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index a148ff54f2b8..295963a3cae7 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -67,6 +67,7 @@ properties:
           - arm,neoverse-v2-pmu
           - arm,neoverse-v3-pmu
           - arm,neoverse-v3ae-pmu
+          - arm,rainier-pmu
           - brcm,vulcan-pmu
           - cavium,thunder-pmu
           - nvidia,denver-pmu
-- 
2.43.0

