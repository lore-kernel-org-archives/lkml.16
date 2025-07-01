Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1B230207D;
	Tue,  1 Jul 2025 21:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403659; cv=none; b=dPmNPSK3X99G8apw1cJeUu8vr6DlsyMgz/2V22Gw/7bXfuPKK+HdjTk/jllIu8JfYnFfD5y9Q2jasMei9fpjtY2Xgv2KT+IoC6o/uhM8F3vwao+/aQ6FBmn+BbxKeUwaDLxBdPwKabEmLNeLPSlGRzRa+x5BD64BA6AXj3jy1Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403659; c=relaxed/simple;
	bh=lcvZmz3ogHvpQH5BN2zUxLZB4qz9K0mohot0UwqsKVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IOcz81C6HGR8Ow3WZl8+uSWGbu25FH4yXkBea/yXQO51kBQRoMA73ACz97pgVxdP1hB7BowXzfyzhusEeK4jBMceFRsUZgaaMblth02MhzVo3sDoQWQvYkdqRQAB4rEjniYVGLpge/L45CoTTVOPChEoMGKkyEGdHHe3V/+4lbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmHWuFeB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmHWuFeB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7BBC4CEF1;
	Tue,  1 Jul 2025 21:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751403658;
	bh=lcvZmz3ogHvpQH5BN2zUxLZB4qz9K0mohot0UwqsKVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lmHWuFeBlBhfMWwI5hMrvZMQlQ6yxS6QfOUEx8BkP/IfHfSlUCeCvDkN0tOAHeX61
	 MeXNk8DexvauTn6d6zD/A2kNEa9ET0LUnSABRXuke8xXZuk/+q8envefYLL+THRRhO
	 e/VfI+u8TcrQJgLHKHL7Hw4r/M8A1Fc3vJ60ja/xacqPipBAFgK7O0ElByJlLu3pa0
	 sCeFyvsdLw6x1LKRRbY7N0wTYOzMldEX2Df2zwZtrJWfhKUDurPmqcH8nppEeW2yYS
	 O16sx47BK6S4rAQlXWUwe7tVnzPukj6qQcMRqXHg2aLiUSUs5GA/0DudkKXPZ+BnG5
	 Ks6MnUxZTKkYQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 01 Jul 2025 16:00:41 -0500
Subject: [PATCH 2/6] dt-bindings: hwmon: ti,lm87: Add adi,adm1024
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-dt-hwmon-compatibles-v1-2-ad99e65cf11b@kernel.org>
References: <20250701-dt-hwmon-compatibles-v1-0-ad99e65cf11b@kernel.org>
In-Reply-To: <20250701-dt-hwmon-compatibles-v1-0-ad99e65cf11b@kernel.org>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Jim Wright <wrightj@linux.vnet.ibm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev

The adi,adm1024 compatible is already in use. Add it to the lm87
binding as the device appears to be compatible.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/hwmon/ti,lm87.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,lm87.yaml b/Documentation/devicetree/bindings/hwmon/ti,lm87.yaml
index 63d8cf467806..5c0cdc0091b5 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,lm87.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,lm87.yaml
@@ -18,7 +18,9 @@ description: |
 
 properties:
   compatible:
-    const: ti,lm87
+    enum:
+      - adi,adm1024
+      - ti,lm87
 
   reg:
     maxItems: 1

-- 
2.47.2

