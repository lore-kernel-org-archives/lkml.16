Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF932F5E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 01:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751419468; cv=none; b=aUTgOn3KavTz8ldPkI6+YMdedsLH5vwwRtZ0+nNyry2dtudazMSLvWBsBk5HUkh/W2WzOaz+D6g1nxd8kumEcTCyGJ5jo5QA3aFkrvdtfZNxrSisZIb+RGZxT+sIxp454aqcdp8fTs5LtaLnWgSyI/qnTz9sAWhK4dD6xMPPhRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751419468; c=relaxed/simple;
	bh=gQXNDlKtiwItGVQoQQmPChI9TajdcpMw23001kg7pts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=D/z5Z6IdwBrDKCJGKPeKuB4MdFt1o5uLIgdxe3XsmYLByVKMGBRgzBdNP/Ewozx6qvTaRCUrHmbSSp+FgZffHTWMpiz8PPN0yUaWLbluSQBI0hNRcDLgyYxCBEqWSU0Uxj7NIdA7f2JXvthhuFDY9OXVxt7CdGCb585WuWUxvUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=jEMMyiHt; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="jEMMyiHt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1751419458;
	bh=lqupIVmUfM/FwKL2CtGRCLXKXJXt++c24hQ1CeX4PTg=;
	h=From:Date:Subject:To:Cc;
	b=jEMMyiHttf9+780o3EE1L0TRtmlzNa50LTyif7nkuZquu0MMdgyPMQXZIdm7MNFA6
	 EPsT3n/sTdRIh2VMmtQ+I3K5YD0AhQntiv1/9WmfCsLsS7aC2elVM39SUpsaC14FT/
	 wrAeaNGbm4ZjuqaSP34+E2pQVgt+Z3LoZPRXXS3ysQozss7vN4+crr3VhCMqMklN/B
	 8OmnudSbGaRM/j+DB/p1PYqkHp1hSQOBX2w3gp0MXqiilY42vKId8mtoPXI2BCK7n+
	 Zr/fWEUcM1L4Y7YVOCkEPLBR6K6x5uWKnIDDbHWHlfYP5tNOeUOf+TOQIcKKaerPD8
	 HAmJAM88iNKoQ==
Received: from [127.0.1.1] (unknown [180.150.112.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C1B25640B4;
	Wed,  2 Jul 2025 09:24:17 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Wed, 02 Jul 2025 10:53:54 +0930
Subject: [PATCH] MAINTAINERS: Switch ASPEED tree to shared BMC repository
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-bmc-tree-update-v1-1-c270cd8af0ab@codeconstruct.com.au>
X-B4-Tracking: v=1; b=H4sIACmKZGgC/x3MOwqAMBBF0a3I1A7EwR9uRSw0eeoUfkhUBHHvB
 stT3PtQgFcEapKHPC4Nuq0RWZqQnft1AquLJjFSmMoID4vlwwN87q4/wJUMYh3y2pQjxWr3GPX
 +j233vh+kq9TyYQAAAA==
X-Change-ID: 20250702-bmc-tree-update-72b2cde4806f
To: soc@kernel.org, Joel Stanley <joel@jms.id.au>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313;
 i=andrew@codeconstruct.com.au; h=from:subject:message-id;
 bh=gQXNDlKtiwItGVQoQQmPChI9TajdcpMw23001kg7pts=;
 b=owGbwMvMwCG22PjiTL8dD5cxnlZLYshI6bLNPv7N3WJ/3tYN1979qjZaz311JuOeK3ZfHnyVX
 /0ya/e76I5SFgYxDgZZMUWWFYG2hXc3T4r/eSD7GMwcViaQIQxcnAIwEb63DH/Fnd33nn1Q89lA
 t/A7l7mcff5slg0XGRgFP7p/2bpOLH4NI8OpZ96qGzZ0mUjzxS4WnqbypixYSXEfn7wJ74fpmrv
 c2rgB
X-Developer-Key: i=andrew@codeconstruct.com.au; a=openpgp;
 fpr=C0F5E25A7D30ECBBF3BE3CEC3B837651FC0D8CF4

We now have a shared repo with write access provided to M:s for the
ASPEED SoCs.

Cc: Joel Stanley <joel@jms.id.au>
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
Hello SoC maintainers,

Joel and I are chipping away at the workflow for shared maintenance of
ASPEED and Nuvoton BMC SoCs. The latest is this shared tree from which
we'll do future pull-requests.

Andrew
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa163f9fe8fe3f04bf66426f9a894409..a4b8e52ace9fff3c7f43b67b288c5a2c8ec3efa4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2408,7 +2408,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
 Q:	https://patchwork.ozlabs.org/project/linux-aspeed/list/
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git
 F:	Documentation/devicetree/bindings/arm/aspeed/
 F:	arch/arm/boot/dts/aspeed/
 F:	arch/arm/mach-aspeed/

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250702-bmc-tree-update-72b2cde4806f

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

