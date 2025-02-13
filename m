Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C5926B09A;
	Thu, 13 Feb 2025 18:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739469811; cv=none; b=KJiq/Hb7sNVTky+v9FeSbrXX1z/3kG0IjKWhU6oohZM+TjeKDz2OOnWWDicOrhZ3s28/R0++XqQlyLE75KlzTwPzqG4P+CdSd7FNgeob34oOTTReqMaqBY9kQTZV+IrYWUzLfOF+xOZBcQ7rHHUhjxWtXSWhGRvcxXJdEOR024U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739469811; c=relaxed/simple;
	bh=hhSMDrnYWM0XfhOjrWsUcqBSX+Tit8Rh46MH2d1ny0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PzhoJlAYVnIqvy9dGP/G3WEqVKM0mhHsKuID9SyPr8vDfnSs7fx639GdGF3BSl2o8F8Q0pterwuajfX4OEck47VVd9Z+NKLeUnAvSJSDtm+FmTQ1crrSUa6uOVqlJZzlpTTabDaienaFaWZ+n3fBO6xNwv7CR7056tUWhv/KtA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F0C6113E;
	Thu, 13 Feb 2025 10:03:49 -0800 (PST)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A4903F5A1;
	Thu, 13 Feb 2025 10:03:26 -0800 (PST)
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
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v5 2/8] dt-bindings: arm: Add Morello fvp compatibility
Date: Thu, 13 Feb 2025 18:03:03 +0000
Message-ID: <20250213180309.485528-3-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213180309.485528-1-vincenzo.frascino@arm.com>
References: <20250213180309.485528-1-vincenzo.frascino@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatibility to Arm Morello Fixed Virtual Platform.

Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
---
 Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
index 40e7910756c8..e71e3e33c4be 100644
--- a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
@@ -122,6 +122,10 @@ properties:
         items:
           - const: arm,morello-sdp
           - const: arm,morello
+      - description: Arm Morello Fixed Virtual Platform
+        items:
+          - const: arm,morello-fvp
+          - const: arm,morello
 
   arm,vexpress,position:
     description: When daughterboards are stacked on one site, their position
-- 
2.43.0

