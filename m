Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24E61E9B23;
	Tue, 11 Feb 2025 06:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739256794; cv=none; b=HenSZiyYDUlictnKuPOtZtGBw+yP5oBqEqr18oamGmd+q3hF4LhfjSJx4BaP14xlUlGIgUk+CL3lhJk0JmQSU45TYDPW2zDgdj2y+dquyPtbSxy0wgwRuREfqCler/ENIg4s3VLLRiN3eUdfbL+GxRy/hBkM554mbRiftVG996w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739256794; c=relaxed/simple;
	bh=VRmUa/s3Nl9xiy/3IgREQzt2mmD318TmEYFUI0lfwDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Sg06lYjcLTflAke1nz2u/T3aOYinVz3sN47fiUaDRqg0UKR4decReSXkeWl6HLjLHQUaFHSKyJRFItskPFE8PsssocZnun7O8KKIhCwtS4fvftXABquyjuP9DUd0rOIU1aV6XCaQ+1/gFmfv/XASDNGN/F93AfOUtMip8VnbBUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=Uj41sTPV; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="Uj41sTPV"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 372FF1487178;
	Tue, 11 Feb 2025 07:53:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739256790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kcrBcoZxZD0KOSfIajrWXKnkY7Tho0NlrAQP/789iY8=;
	b=Uj41sTPVbuELc7zWPiWuQOLNaPqUKRlyhq7COUvGzHhUjh4zIP9i1BucViH/E6nL7iezJ/
	u06N3hZn7t+yzEdzw/0kEeiZjBAJWn16TO8Z7Mmuv2MyUhwPRyY4mRviZ2Xz7yjzTjrAug
	jBzigh7V2l4XHPK54bBjG2r2c0CfHhDxig+XDrCO5GstJPEtcWlOzKgPS8Ez+MXYtpqDU6
	RhY+is7N+3QPE3EChkE+Kn5Rh/ZZ1ssauiFM4FfZV/1H3y3ZuBSOsQtReuzFOkaME875Fx
	zG2iqSZpUAWIR9vIJ0eAHd03RzQOx1xDQNpGzPfgAX28PUgGlzDiEHVe1dSRhg==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 14/16] ARM: dts: microchip: sam9x60_curiosity: Enable OTP Controller
Date: Tue, 11 Feb 2025 07:53:02 +0100
Message-Id: <20250211065304.5019-2-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211065304.5019-1-ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250211065304.5019-1-ada@thorsis.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Allows to access the OTP memory now, and Product UID later.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v2:
    - same as in v1, no changes

 arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
index b9ffd9e5faacc..c110a8e87568a 100644
--- a/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
@@ -252,6 +252,10 @@ ethernet-phy@0 {
 	};
 };
 
+&otpc {
+	status = "okay";
+};
+
 &pinctrl {
 	adc {
 		pinctrl_adc_default: adc-default {
-- 
2.39.5

