Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3B0302CBF;
	Tue,  1 Jul 2025 21:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403660; cv=none; b=O4GwBcw1CwULJ2avIfrjRdcfuBZQE1P4lZvGob5JLZ+WEJWOtFOsT8h801Kl2K2fVDLPhsQRHCF5BiJJdz5P6ezKWXRpiDJPlNbIf1TdyVe15T7p5Zt8iLY7S6Q/HGKr+CS5am3JLIe+NQgbvkckeVFVl3XYJwVcS+TzhA0veBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403660; c=relaxed/simple;
	bh=9CqYXiHRmgKQUmshkDJbwtNh8zsWqEnScTvwcjw95Y0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CXGXzPfTJP3aSzoi6mggBFqWTl1zlkOvI1NJfL6C0eJ2mEeZrKdcNNyr51agy+HeWFzsqW/VRA+TH6VK9fPjM4b8mII1eIhYgPkSH78SeWkQal1dgcwsg5MdEUMGbwjKqFJAyQFE64r2XZZvH2yqLe+JuMF1Mx1f6qGLBDQMzwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gf2i27KW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gf2i27KW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862E2C4CEF1;
	Tue,  1 Jul 2025 21:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751403659;
	bh=9CqYXiHRmgKQUmshkDJbwtNh8zsWqEnScTvwcjw95Y0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gf2i27KWlkm4BL1VtnlbD5H395KmnGLIJ9zmIcEjmrdPm+usg3/ADYIzaOnJpfnMd
	 TSlGqh5Wl832ZWBUGPiW85M7SRGlAhRU0QArODrwyOcWg6vEtImyeJJbTUPgA66Tzu
	 C9B3S7nOCfs3y3D37h29XZnWKw18hQZjVOJsygm6qhRc5+87SbcDQi65Z7ouMY60V8
	 168Y5Ul2ueMA+vbUmUMIsQSqx8kBzPDggi+EsdTXobPOgxYxEhMo526H+wGCUlsmlh
	 7F3AgM9vAbxwkAeGYBR6FgFfQX50G8vuZGKQQkAVwhkwQv+SP+hdOTrqbEBY1ngf/9
	 xIq/jGhTfsbNw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 01 Jul 2025 16:00:42 -0500
Subject: [PATCH 3/6] dt-bindings: hwmon: lltc,ltc2978: Add lltc,ltc713
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-dt-hwmon-compatibles-v1-3-ad99e65cf11b@kernel.org>
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

The lltc,ltc713 compatible is already in use. Add it to the lltc,ltc2978
binding as the device appears to be similar.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml b/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
index aa801ef1640b..ea8b1553a3e9 100644
--- a/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
+++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
@@ -28,6 +28,7 @@ properties:
       - lltc,ltc3886
       - lltc,ltc3887
       - lltc,ltc3889
+      - lltc,ltc7132
       - lltc,ltc7841
       - lltc,ltc7880
       - lltc,ltm2987
@@ -55,6 +56,7 @@ properties:
       * ltc2977, ltc2979, ltc2980, ltm2987 : vout0 - vout7
       * ltc2978 : vout0 - vout7
       * ltc3880, ltc3882, ltc3884, ltc3886, ltc3887, ltc3889 : vout0 - vout1
+      * ltc7132 : vout0 - vout1
       * ltc7841 : vout0
       * ltc7880 : vout0 - vout1
       * ltc3883 : vout0

-- 
2.47.2

