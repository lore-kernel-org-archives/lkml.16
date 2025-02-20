Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44937214A9E;
	Thu, 20 Feb 2025 18:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740074693; cv=none; b=IC1eNz6WXjx897CAR7wvWQuIORZuvf58TWA6LeLxOcKn89tFQQAOOk7LI1TaQ50mwVNelNeZH8YMtELHB2QWGbxHxdaYP/69M2QvROmdCgpuUbF2VT+7a0cnOqoxjfKj3vZ+YeTOW/ezxve06GvVbUKSQZ5x6xgMrKqrhL5jtD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740074693; c=relaxed/simple;
	bh=9rofk5/Vnma3elUi1VHrh8uQrwo12MtZp2jMCxVJyu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dm0+Nep+ETCVYZKQKmDuBu/qMy5fh7XJEkGpk7IL/SulB1+zd5qLbWOj+a+68P6675mh1s3+KE74g54SbipUJUJfjRtPvcIjMfMZiP0Xh3zyKSoYsQei5xKX0tF5FLoqBVHj+noNEIMJm+spVypATnNf4naTGuUpZDCLcsOOL9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A236F16F3;
	Thu, 20 Feb 2025 10:05:09 -0800 (PST)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A1223F59E;
	Thu, 20 Feb 2025 10:04:49 -0800 (PST)
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
Subject: [PATCH v6 04/10] dt-bindings: arm: Add Rainier compatibility
Date: Thu, 20 Feb 2025 18:04:22 +0000
Message-ID: <20250220180427.3382482-5-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250220180427.3382482-1-vincenzo.frascino@arm.com>
References: <20250220180427.3382482-1-vincenzo.frascino@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Arm Morello System Development Platform uses Rainier CPUs.

Add compatibility to Rainier.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 73dd73d2d4fa..2e666b2a4dcd 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -177,6 +177,7 @@ properties:
       - arm,neoverse-v2
       - arm,neoverse-v3
       - arm,neoverse-v3ae
+      - arm,rainier
       - brcm,brahma-b15
       - brcm,brahma-b53
       - brcm,vulcan
-- 
2.43.0

