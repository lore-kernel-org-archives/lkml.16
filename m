Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864FE25A2C2;
	Tue, 17 Jun 2025 20:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750193108; cv=none; b=LiaLfLUopmt/NBJSO7iRYZa5L8BWWETtBgHMBVdLSWp6uvgBAWjBUjiOHF/M+KbJsWk0UEIjJHcgpQOYahz6hI+FsH+Q9LF7clQ6zls2cBU5FBnFLRxQSpgTQIahJ9mJmCw7jjBfEPk6sm3B6CahYmBLdi2i8H+zs0lC3Ir/8ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750193108; c=relaxed/simple;
	bh=YO2pgphW5ix2G641Cyt99AzxDf6RghmJ03fQI+EU4qM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oPBcWze4oNbESRzyNd7vHlpix55vShLSG+lcixUbcPCtXrLM13aEW3+DRoxr4RbpFJXvsO8cO3/yehEbcb83rFGbG2Hiunx/Bmh1fCTxXR8UJMiSMbn+zHuDBgx+ZqUixq0Yxt46ZRf2CeVAEqyh81ks8s4ps94eb+7ojbK2/cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9XklDxX; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9XklDxX"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d3da67de87so225527685a.3;
        Tue, 17 Jun 2025 13:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750193105; x=1750797905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gpU9B+2Z/eErONpWTKeNVO2o1qMt7HuQeN7CFpLreI0=;
        b=L9XklDxXO8yT/scdZ0MhKVmitXa+blK8GzzOYNRBJpIgQbAbrSEXlVzwcuY0kL9kHb
         bz1WgEmE9bLSumoE+jKkFEfCyeBKUMjjH2QCXLRGqSIMugXbmg2Nqyab7zaW9xHjkO56
         KykY2nDcdiTgzeRmxVyrIpB9LspRwJwFqz14HPUK2kD0UbtNlr4RxhQcx55MFlVVzKvc
         bBJnb9jFoSnDejb1YHWjkZHSFTxqSfYZXPLN5QOvJossuyRo3GpHetjKs7b42Gu8G6MF
         9R/O0tknskshVvCUI+I1wGZoPPergqYTxjlNCIASUGx6vJeNEJCR7kwFnlogbe2WZ/oO
         5C1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750193105; x=1750797905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpU9B+2Z/eErONpWTKeNVO2o1qMt7HuQeN7CFpLreI0=;
        b=AZBmMqJoXNG0VdqIddR75Z0un1CJg1hio+MuLdVw/qWbb8UhabbMy0+P8+li7Cu6hT
         GtTRLvpzpRJfnYukTLAp9pireN1RGVNRHCZlhvj20/RB9n+ssjAlm0EaUR8TojMolwKn
         Dh2C0dpzcZbqys9Xi6Rng+LuMRLlrJBLgLKDkaE6STV58Baca5sCYrZ8ItopNSonnDKp
         zfGyXoMYDyIDp2ulXPAdbOdKDLMMV4XJkhBLbOz/2MBYPPZSurRUBz6L2Xirb2z6hHWA
         8X5y9GgBOlprcmLWNk5m81qWB2Yk0eGdS9qBkrjlavtn1saIfhCTe92ogyE0qT4xUPWd
         uUeg==
X-Forwarded-Encrypted: i=1; AJvYcCUV1JFjyD03JW7feUFGs1a7WNHzWNJAeGk9L0TEQoApHGAWU6Rbg8mbePsrFHWQAUIOA7gyPxzL+g1vPRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDYac/KXlWLluMAuojI2c0zr/pSIWDpdcRirnR0JAmRMse+mAb
	+QHdFOh7xqqVCILLgebNSGeIOde0BzuQDutxT4M9JQITIZUCA7dMCiaF
X-Gm-Gg: ASbGnctDydzVlrh1ekaNX5aZAgcXIpsAhsFRPHc8ZFNla/yzP1Z0dhWiN9+yQfe32tJ
	1t7TbnzmtP+kE6t0mQ4baEPpbW4fezgf6Cyc9pD8aCZ+SY32XZPDzTG2WXWaH/kor3K9NMxdpZC
	lJxO7/A+JnKdvD9E7Ekjul+c9K13gZHz+qqn1RebUOfrNdbAx+3/67Gm0z3d+2cg6lQseJzebfi
	RlDBBgjizVgl5JDDNguAnU0Z0/mx4zHTRrMZ0aiHCkXsQU304+FTZgEISG8sOdcVdp5bHH7i+Xx
	MlUcYSe/WCS14c4IuHWoTVWr9DCw08nNHI67qGnsMmFi4TzwQVB27D8kvMe6Maef5JqltN5/zIq
	YCe8iAGueYmZfGNb3RHixRBkWCxJ8AxAIlR6Gre7UdwqTio3ZRvJxdKid86k+Hh+waX6W
X-Google-Smtp-Source: AGHT+IFRAps+zO/vJX6pDZ2o+vNJWC8FCSCWhveQTRcKO3q7pJ5/kTdWBwmiavE/8mZtjpkCAy4M3Q==
X-Received: by 2002:a05:620a:8086:b0:7ce:e010:88bb with SMTP id af79cd13be357-7d3c6c1ab89mr2449431985a.22.1750193105160;
        Tue, 17 Jun 2025 13:45:05 -0700 (PDT)
Received: from seungjin-HP-ENVY-Desktop-TE02-0xxx.dartmouth.edu ([129.170.197.81])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8f10887sm691056685a.105.2025.06.17.13.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 13:45:04 -0700 (PDT)
From: pip-izony <eeodqql09@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pip-izony <eeodqql09@gmail.com>
Subject: [PATCH] usb: host: xhci-plat: fix incorrect type for of_match variable in xhci_plat_probe()
Date: Tue, 17 Jun 2025 16:45:00 -0400
Message-ID: <20250617204500.346984-1-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable `of_match` was incorrectly declared as a `bool`.
It is assigned the return value of of_match_device(), which is a pointer of
type `const struct of_device_id *`.

Signed-off-by: pip-izony <eeodqql09@gmail.com>
---
 drivers/usb/host/xhci-plat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 6dab142e7278..49eb874b1d81 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -152,7 +152,7 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 	int			ret;
 	int			irq;
 	struct xhci_plat_priv	*priv = NULL;
-	bool			of_match;
+	const struct of_device_id *of_match;
 
 	if (usb_disabled())
 		return -ENODEV;
-- 
2.43.0

