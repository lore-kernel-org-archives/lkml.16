Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81E7306DB6;
	Tue,  1 Jul 2025 21:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403662; cv=none; b=cSftfnX9WH+rMQKYfjclbTqabu4Dz7QRtzKfQuA0z6ORuVo10S+0lQy7mAllkTkaxpQu4QivTN5c4oCC97JiqvpHS4EX+cmnG0PdMMbJgVgOUny4k+WMHpWf+yCW0AhCpHIqlRJa3DJiykmxk71SS2JQ52SoZUNbeyRhjmoKzbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403662; c=relaxed/simple;
	bh=oSS2LJJZFgcvUTA+VwZdl39/DpWdDxUKpuXqpV9MOuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dRUmm5bncNZcu+eYVg5ez5f8N8bftcs6ExE2od9MV0sVGusho8puBnMJzRlls240gsNMm+pAPpPCGsuwVVfMDVwYTkjYPZhdi30i8VSjMSBOmcMxzRE9BH2Zew2eLe0LSLHVqGOnve0ELuZdie0tqlYz04yPPlERO6HyBfyzMeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I9ZICJfb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I9ZICJfb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB98C4CEF8;
	Tue,  1 Jul 2025 21:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751403661;
	bh=oSS2LJJZFgcvUTA+VwZdl39/DpWdDxUKpuXqpV9MOuA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I9ZICJfbVwuavk48xtA0CpDW9YAvn01CyKx5+b0tBsvvCP4lnjLFMV4dIMrY0sfFf
	 B1Rc71tuvRrxw9d09s9InOyVRmoi5A27h6X6ak2KQA4NPuyUC18F5EwtjSeb89kO8X
	 TgjYTjtZBq7nniBHWzBf5/c2Mdl4uqS1AfSr5xPwuZ2ZzLra0xegd2qIGRPlwguxLu
	 u4zk+Ypt9bnqmYYtGJ3Qv5Vf07unPTMN1yAbD47fdD7f0EOF6C6h1PBUOiZaXftmAp
	 1g0ylvTLaJ4dpUiy+RMgbsHDMZOFaOit8RxfjKPDOgju0SAvkb14ak8ec2RfGO6W8H
	 E4dDBDFGYsr0g==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 01 Jul 2025 16:00:44 -0500
Subject: [PATCH 5/6] dt-bindings: hwmon: pmbus: ti,ucd90320: Add missing
 compatibles
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-dt-hwmon-compatibles-v1-5-ad99e65cf11b@kernel.org>
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

Add several compatibles already in use to the ti,ucd90320 binding.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/hwmon/pmbus/ti,ucd90320.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,ucd90320.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,ucd90320.yaml
index f8bea1c0e94a..8f9ce00079df 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,ucd90320.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,ucd90320.yaml
@@ -23,7 +23,13 @@ description: |
 properties:
   compatible:
     enum:
+      - ti,ucd9000
+      - ti,ucd9090
+      - ti,ucd90120
+      - ti,ucd90124
+      - ti,ucd90160
       - ti,ucd90320
+      - ti,ucd90910
 
   reg:
     maxItems: 1

-- 
2.47.2

