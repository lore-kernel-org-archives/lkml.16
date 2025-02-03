Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2F525A630
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 02:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738551430; cv=none; b=qPohPQW/aZfKz111DGhlouvCqhS8PUAOBDT2yWr9Q5tvMSa+KJZ8Z+gaAP80Py4hx5/lxpR+tCyDfez0rikUKdAG/wHbEGjd+FXltWk872twxsPaXhWaKifjgSE+ILX5GwD0o2zuAKMIbtCfXs8V8ktyVbHQae01yrvlAJ+aC9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738551430; c=relaxed/simple;
	bh=2PJ+HfT6jxBjaYedQuRdTS1BWxFPh1IRQorcDWQ3NdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pm+TRP77I3utBMNoMUreaf5IK47Q39Rf4VqVZlEbgA1hKCuXSPJ3iZgSwCk3zQQROaMQZxrVRo9fkAOSQBU5RxIV9hxVjgVq+XhQ5XaHbI99Il2Yo0j90TnsiUbgm4z+XxskWeowveogOZnfaOxc5w0v9wystD5ddUoxxPNB/Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=keaaDwqB; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="keaaDwqB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738551418;
	bh=/M3u/UfzPn7K2j1tUy85ouRPJtHFLSPO1KCwoEDBz08=;
	h=From:Date:Subject:To:Cc;
	b=keaaDwqBcwuRr2sI322cGvM6QhW3T8VZUIxniSpkWNFtHxvEYmOnJqsDXFQTvVwij
	 TV62XwwNM8Lny3y/GlktCxB2By33Y+iKiDyxrqh09BD3xef6UI5VFwY26s3weL4xaJ
	 qrMrMhFX3YY9SHuv9T+JdhQrw/eV/nirx005KyFZBSSF+gTXotW0xcKu4itLfs2vuU
	 8HXubwBXbJvZyBaO+s/GWRpfUvE8RdHjK87epWug2CxO+pQZABSg3tvZxx46F0G6J9
	 64ZkKgFyBgnnAmohCv4wDPnkyP8flCNPAeAng42WH6+STBsZ+Fcgxm3nCgrbnQb5Dg
	 ctkVcjJ6ugq3w==
Received: from [127.0.1.1] (58-7-156-140.dyn.iinet.net.au [58.7.156.140])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C2762703FB;
	Mon,  3 Feb 2025 10:56:55 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Mon, 03 Feb 2025 13:26:31 +1030
Subject: [PATCH] MAINTAINERS: Mark Andrew as M: for ASPEED MACHINE SUPPORT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-aspeed-maintainer-v1-1-60bc3a5f0a7c@codeconstruct.com.au>
X-B4-Tracking: v=1; b=H4sIAF4woGcC/x2MOwqAMBAFryJbG4jrp/AqYpG4T93CKImIIN7dY
 DHFFDMPJURFor54KOLSpHvIUpUFTasLC4xKdmLLrWVbG5cOQMzmNJwZRCMi3oNZXNNR7o6IWe/
 /OYzv+wGLOVJiYwAAAA==
X-Change-ID: 20250203-aspeed-maintainer-dddbbe22da46
To: joel@jms.id.au, linux-aspeed@lists.ozlabs.org, arnd@arndb.de, 
 soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.2

From discussion in [1] and in-person with Joel, flip my entry from R:
to M:.

Link: https://lore.kernel.org/all/CACPK8Xe8yZLXzEQPp=1D2f0TsKA7hBZG=pHHW6U51FMpp_BiRQ@mail.gmail.com/ [1]
Cc: Joel Stanley <joel@jms.id.au>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: soc@lists.linux.dev
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa06545e2861abe46ea7029f9b4d3628e..305e5530560e53c10f0b610fa7b4456ca78fdfc2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2285,7 +2285,7 @@ F:	drivers/irqchip/irq-aspeed-i2c-ic.c
 
 ARM/ASPEED MACHINE SUPPORT
 M:	Joel Stanley <joel@jms.id.au>
-R:	Andrew Jeffery <andrew@codeconstruct.com.au>
+M:	Andrew Jeffery <andrew@codeconstruct.com.au>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250203-aspeed-maintainer-dddbbe22da46

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

