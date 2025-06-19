Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23C623D2B0;
	Thu, 19 Jun 2025 05:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750311964; cv=none; b=l3sUdkEQ4nCCFqacqIW/QEc85MMlm7m75CXLCRkwRRBUAULlUQxwxLeaL03nVbzdIOeY8Cifn1G1roJHNRWaigqqVK9dqWrIxrPz9pmFzeNoFJZNM4k9o21KmiSY6LPiYQBbgPo5tDRLmEJaompmg8IhJWMrlz5wSaiPQOZ8+SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750311964; c=relaxed/simple;
	bh=E3WAOCfjoLZEMM2pUmkgtp7GprADNRzWcqVzCUsndrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B9mPomcHK+BbuYZAD1HWMzHa3XVKAE3rwTZBHY8GbK7dEKZhtE+LumlGxLYB0by1cb4y9InIQjqNVbRrUsj1fC+6y63Q6IFmtB3TPI+KKz5olOSJaFEYZ+NVHu7U7ZsCMCyqsez+QNNva1Gfl6ZbfzNyA5q/5J/1ElXY3UD8HeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MroJ7T+8; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MroJ7T+8"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6fafb6899c2so4060856d6.0;
        Wed, 18 Jun 2025 22:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750311962; x=1750916762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMfUiq8pS9Cns97b04w18lZ1npqyEo3T1WCcXPPyxsQ=;
        b=MroJ7T+8Xusf6tphmIsW1Sccztq/S2Hgr8UFlnyKoPTHGa6/LEwPYVLjEfTJd6Nrb3
         FjUpd+YSZfo5Dt4haBzmwVl0l/c0aGxafu2wv+flaaPVCgWTxVkCBsJLBZWADz8MNwha
         bG/LRs7NGQe2OFxeU9UdtxbDyJTllgrohh+up8KwZHby3AaqF5kAAYEEhQj2pnhKRzgs
         Bp4TPiW4w0k5dTuSfKKfxI1x4288lyixxdymqjEnBgr1PGDxOWFfRAVtRpSgcgBWT0GJ
         PA2rJZAbfsQtGW/hLe4M6BFqjCOt8HuKW/jk8JQaqG5OZOJo3ytl1N6QdD4iJCcb0OSh
         fs1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750311962; x=1750916762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMfUiq8pS9Cns97b04w18lZ1npqyEo3T1WCcXPPyxsQ=;
        b=niEd5YFnnS1iIP+qaw37/GL+VwYA/dBatNiRLi/jbvPwwNE1qgWNbHPoReL8WGWMRB
         l44uloWLAuBB3xe/yWL7P6uYVri6KfWg4vyO/2l/c3l6BmyGBL/c/1oHWcpSaNJdVs/p
         xPUofr6rqZj2upy+6xR08xlFbPawPKs7ArsjinS1lCQTpQgGsqPBKEQadZwaEG+uS+6+
         bFgxA/QRW/HKuoFBalKPr5mMkb9SwYH6iUj6wMU0IskTkskLtcKTg86p/D4kPw5jVR8C
         KbsUr5t9B2wASwhlGJLeBmjpnwtbXNzlwVyxKlvOWNPvYN04kvTfB3HIEEuLje8hYPBR
         Ur9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQ6pTHkRnMtao+3tGwQq7RvJJvHn5LAbVArgOX0LjT3it+r1jg/7ImnHetzphVAespcs0AeNmwvlOWpH0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/vrT3iSr5GwyHoo5kkm4bPtTwsvvtu1eSD/tA3QoHBWCC7iUO
	qWHfYON7I6OIsG8VSo+wbY6NgUDoDuJMoK0yrDyZPM8877FXEqq6At8I
X-Gm-Gg: ASbGncvXA5Ujc9AVNorPdlIOWca6kuX8EpnBV3p93bRyecfG23HJPOIvcCEf1oT8dwj
	cizr7P7IZjzNFrk20v7guKS65QyoRDHGtgTkAiQvRqq7n5NJ2o9xzTiAy8gtBSr90hoYGihvalZ
	DMnAIuLWn/lljYxZUrr2Gv8To93Iw7VSDBL8tMF9QJ2Etgriyua+V4isQ4NDJkagN93/+X9oM5I
	jJ4gkkyZusRDUc24E807GFkaj9DBtcaYG9Z4jiUeDhc0JjruGmkdPiShLyB0nFbS3KwOP0OyJ5v
	3dG3cctSr2g8TXBUnWoGLSFUyrMwRbkjbrTGIvu7mtcNZOjPUu25NFjT9cQURrdXiQnMs+9p2/a
	w10JfHAXyWcNYQQuJ5CH2L+JpW0kXry/ak0asW15Qb44l+glUseqlonhJ0A==
X-Google-Smtp-Source: AGHT+IH6u9VQia+oPa6yFC+Q+CFStL6WGhlHDl5siOwIKXq/z/l53muZO8KRpxZIv1gTH6jFMB/6ew==
X-Received: by 2002:a05:6214:d6f:b0:6e1:715f:cdf5 with SMTP id 6a1803df08f44-6fcff73b920mr33367496d6.15.1750311961767;
        Wed, 18 Jun 2025 22:46:01 -0700 (PDT)
Received: from seungjin-HP-ENVY-Desktop-TE02-0xxx.dartmouth.edu ([129.170.197.81])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd01639653sm3627176d6.112.2025.06.18.22.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 22:46:01 -0700 (PDT)
From: Seungjin Bae <eeodqql09@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Seungjin Bae <eeodqql09@gmail.com>
Subject: [PATCH v3] usb: host: xhci-plat: fix incorrect type for of_match variable in xhci_plat_probe()
Date: Thu, 19 Jun 2025 01:45:46 -0400
Message-ID: <20250619054545.173436-2-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2025061950-frown-cesarean-a1e3@gregkh>
References: <2025061950-frown-cesarean-a1e3@gregkh>
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

Fixes: 16b7e0cccb243 ("USB: xhci-plat: fix legacy PHY double init")
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 v2 -> v3: Added version of patch and used real name
 v1 -> v2: Updated Fixes tag and corrected Signed-off-by line

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

