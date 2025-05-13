Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5F64C6C;
	Tue, 13 May 2025 03:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747105843; cv=none; b=Hw7A2QWtrQfl74Z27JVlg7RtsEjzinN6i4Pjc0pI2khwXy8vIrjjJWUfdaWHAdisGdSvmYNO3V1oh5hwSrQcuXm5SRFD5eFlHT0TH1XTZFEU/Wy7hgL6M10mXo7jCaMnF5o7H7yyEBPz2kMv7huP5K0sHvgTE4tCuJlG9HR2sCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747105843; c=relaxed/simple;
	bh=hh8W8SFL2O5tLYPxqifp5xrBtBcma9ivlfB8ylnUYQM=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=gWNXXCcAMiTIegWz44mio0OTh72ensIq/dGsZOr4WdCscovoiDFotoK2LmCZMzNw07sQT/WL1Je4+88ApKgQX1uqtWShLzpq6q48wxhzFx7UDl1cFjRBtLO1Hel/0AcZSVQrzVtrIyw3Gq1RaU4jWPXKZBUmtE0ABUVsqlK+m04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ek/xfUdt; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ek/xfUdt"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30a9cd61159so4823925a91.1;
        Mon, 12 May 2025 20:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747105841; x=1747710641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:subject:cc:to:from
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DcuJtm+iInMJ4xEpzdwpahbYr7IroCfNfGVeO9DKr0A=;
        b=ek/xfUdtGnKCeCy5bEErt32CTQdQr3H7w5hBOg4xV2wf6FHm3zOde05wAePXUrYeuN
         pbT7jzVKIjO0kZ1knYNhmlqo4pWUCIOz9VkjIRry4L+4HnQKTQ+jJnjtfY+eA14FKfq4
         8b/FpsI4EX+p/PVBj52/1cy1Af2x/M1D0jaAiNcLy7ddi1q89gJj5jKvckFv/pEzJhz7
         ExVZ3Pulb8zNbnKdqVzlUUKoIRGAJmM3Ur4fE9CEJ7JcxV/xpZoLR+bud1DWE1nWtuvJ
         kv7rX6iet0GHxunp02a19Nv6M+zW4sZ0XaZxjeqa5ugbQy3eFKaxl5oLK5SAPyzwpnR7
         M+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747105841; x=1747710641;
        h=content-transfer-encoding:mime-version:date:subject:cc:to:from
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcuJtm+iInMJ4xEpzdwpahbYr7IroCfNfGVeO9DKr0A=;
        b=b6pO2SNMjA3qLPOQYrqiEyJAAFT+e4QYspCiyfTmWriI84DdWmaqDrC/PKP6j/dcrz
         jBN83Y4swhVSTnCT0zF6ZvgCH5gzUDnvHDB6vO/2CCNcXraigAhdJDhnjzYaVAp+hAEX
         9Lgbg7qldPunUnP1rYlsAitxAmlVDhsbkFfFsEstuxSX8H7VIupvLmmzepkw4JCjv+4N
         0h2OIGGIFq6CwTGc96BiUQdp/MjdRazo2Q0qHtEXl1rfkoG7SHInWO1sy2/T/vDpwTXQ
         k+tIMv4ng6gJ/muB52meZkmkLuLcJhsqxm5bKl79bVOqR6H+BatiUe8Tu5M2HPiUgctY
         Tbrg==
X-Forwarded-Encrypted: i=1; AJvYcCVHr+ICtWdtmrA+IszRbpZcrAFYssqEeh5F8alFDY9vAQXlMgmy3IcAsVpMpoqb42ttAmbp6eP06P+Spk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaE0uENH37dUacfGY6o/BNv95tBl3W3YBNB8S3ZjqPqjO9wS9b
	cGdRa63eri5gEsd2CSQfvSVlvOOZnWCN3nsgcYH6csIBnrb9IWntxVpdag==
X-Gm-Gg: ASbGncstSeTO/LCNK4lyr2OQ4CAjo14VuZ2LjxfGgBYgqnc2t+iTRyj/1alAH3/Uf8i
	ijBAyyPHRdF3qTDjXBnSQ7cC0JR5wtPFBv80pvX+iQpxLKrpHCsR4ndOhdweVEDqjKl+FWrc4fH
	4KzlC5Ea+AzyU1Z8mYvhmjuvdD+lJmm+sse8Cqcmbwq7LrlXC46Nt0/jPG6R90FuahxNvA078wJ
	gpY5wpt11yvBTlHaO8U1uds1ftGY0kYU0/ndSb+EbHQYYKMlrp1ELwhgUuauJlKsAvpyR5CW0Li
	BXTN1M/zJZPYkrfr4pV7QjHuctgM3KWvYhbJpRTINq82/Pvlie3pPeqqFx0TPA+uVTLLc+91
X-Google-Smtp-Source: AGHT+IG1fT6TiYe3pTrZKUSJyBs6nE+x+ZjDtyWth+bx63s94p++vD/MoGUkW74HUXfleYGKFUeLcw==
X-Received: by 2002:a17:90b:240c:b0:2ff:556f:bf9 with SMTP id 98e67ed59e1d1-30e0daf825bmr1697698a91.4.1747105840515;
        Mon, 12 May 2025 20:10:40 -0700 (PDT)
Received: from dea88b1475bb.. (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2453f50b67sm5082852a12.55.2025.05.12.20.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 20:10:40 -0700 (PDT)
Message-ID: <6822b830.050a0220.27a24d.d064@mx.google.com>
X-Google-Original-Message-ID: <20250513031010.267994-1-LeoWang>
From: leo.jt.wang@gmail.com
X-Google-Original-From: LeoWang
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	george.kw.lee@fii-foxconn.com,
	leo.jt.wang@fii-foxconn.com
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
Date: Tue, 13 May 2025 11:10:09 +0800
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leo Wang <leo.jt.wang@fii-foxconn.com>

Document the new compatibles used on Meta Clemente.

Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index a3736f134130..4416a40dcd86 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
+              - facebook,clemente-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc
-- 
2.43.0

