Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3A8302CDA;
	Tue,  1 Jul 2025 21:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403661; cv=none; b=Jf9j6M0Vx3NBE4jV0kLlUBHb5qd6Cz9tywasm9EMDiJo4L54sERYYtkoqWdWj1iGtQehbA0TsEy3nPWkIocmaNq/oQSBKGTkn7MpW+CwBMNY55/bkloIdE3dPVtoju2oJNOQwSX5iynivj/H52eCaI1eGjeAnsDsU3K9kAhkMWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403661; c=relaxed/simple;
	bh=mlmri3n/nnVG3kzdCAPspyBsitoOiqYFMdoN/wAa6TI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W4VCPGSRC3xomFtsfN4zsDPaOVPJ8Gcebwdf6N+SSzrMCTdw/eadwxqL3iFm1+4fm21pyMqlw1vTl2LeNEL8SanUsfLYxdgVyDjINygkt89XcTUbtloU36HsPa1hF742APJDE4SrPa4vNuVDPLnMjG9c+aQHzZj6MG3apwikNDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZSAIx9R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AZSAIx9R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D658C4CEF9;
	Tue,  1 Jul 2025 21:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751403660;
	bh=mlmri3n/nnVG3kzdCAPspyBsitoOiqYFMdoN/wAa6TI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AZSAIx9ReUPdOHbBGDcsvURMsHneQvf1AtDa1KW+ylwPKTY8+EGs34kADME1nHa0f
	 xZZrFqWYZijv0Y/ZUrL+0hG2OIPjU+PhZSWZ20KEYu2+G5vYYBcf5cQdT9C7D5/4Ax
	 aAgULIDLjPEtgGfGt/liw1hi+Y2YPNR9EboETVi2YhjCiVdCyAIdDb33rlk/aVG2Sl
	 AMtqx6n+MxO/PpyFKHVk1AwTk/urdugK/qtwhyQVMvI/qsU5kcCKC8dbMH7urdrOfK
	 i7Lp7w89VhAwkfEr2YxvJPUYMDEqWsypqMdbHrN0XHxVqHD9M2wV0v7rGwcMQVm7S3
	 sTmye/E8is36A==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 01 Jul 2025 16:00:43 -0500
Subject: [PATCH 4/6] dt-bindings: hwmon: maxim,max20730: Add maxim,max20710
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-dt-hwmon-compatibles-v1-4-ad99e65cf11b@kernel.org>
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

The maxim,max20710 compatible is already in use. Add it to the
maxim,max20730 binding as the device appears to be similar.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/hwmon/maxim,max20730.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max20730.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max20730.yaml
index 8af0d7458e62..8588d97ba6ec 100644
--- a/Documentation/devicetree/bindings/hwmon/maxim,max20730.yaml
+++ b/Documentation/devicetree/bindings/hwmon/maxim,max20730.yaml
@@ -25,6 +25,7 @@ description: |
 properties:
   compatible:
     enum:
+      - maxim,max20710
       - maxim,max20730
       - maxim,max20734
       - maxim,max20743

-- 
2.47.2

