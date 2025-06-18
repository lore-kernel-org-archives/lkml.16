Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EBC21A443;
	Wed, 18 Jun 2025 19:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750276215; cv=none; b=YU5QIJAbXDgg5vEgbw/XTkcRwWP+gbuKdH+IrVz3jJ6R37x7XxJNdhJcY4bd/sFpDYQndTE5z14UUr+aA0HcHMzELsW5xH9yT++hnCCMpmFTykFKbgCEGb+8DtpAXPwzRYyC35Ccwwy3h949LWvrGgyhJ5/oHp8NnYUfmlBTM9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750276215; c=relaxed/simple;
	bh=24rRaj+riLcN6nNTA2ySQ+hr2w7EcDiuFRRjnmlYPBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QfgNd0edhclSr0KMutDcg5lcabCRxi4OuCek6QHJxEM+akr43c9t7KS57ILKoTNjap3JF3nyuJQy4OfaJ5ZkQe/UZ2QuH5zoqTcKd0vmamUfnPG/KVayjSNpikDYjPIGrp3XYlMDx7KMPGiBFGWhSwcSlKmFhdqq50QiLoY3/gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LgEJMibC; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LgEJMibC"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a56cc0def0so124142901cf.3;
        Wed, 18 Jun 2025 12:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750276213; x=1750881013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTiYGH9s90MOiZvQtQe8c1eAjqU7s3NEhM25qAZHZ7o=;
        b=LgEJMibC1eB+BS3i0gg301Lq4ubxgcXnTAxXAP0/qmN9jNylmMLLVJOq/xbsDyafYx
         bhVP3KTw8nXwGJCNtSzvF2JYcOIllZ0+Itj+FYwiOuQzaC2GQBFHZ1jAv81G5DObE3cO
         /a/OUHqQVgvTxUAg3XNLXJH64sztGIAb/hRubqSaKL3c6G6bxZAykSsgsFWZZp6R/cJ3
         pCIUfG0rlDne1eXrE4GmsVT0l7IsXQlKTamE2iFV6PbFRJePI3UJTtOfI/95lpYF8dCa
         EAS1gXOXAsyDJ2BSNtYBGtqt9I6bZRxIPUY578W7oRAi3h1ZxSla8zdYqb09ew8JLEff
         WB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750276213; x=1750881013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTiYGH9s90MOiZvQtQe8c1eAjqU7s3NEhM25qAZHZ7o=;
        b=Ny4uU7ycsKmghbhj1+zdQ9al3Gh1se6KvUkBY37sDRJUPvOUcMDB5B1xUwclfngX1z
         5O7TKYq3eU3SrdejR5HCSgWTXMFbiHqqgn2SR1iYvAOoaaaZxgI3srWRTcCPGL2D9M4C
         u1UtV8qNmndDcbCJQ8/0ODlWDjCXr7RAAMKRRkYBnE3CO7LpvPoJuMKp2SJ5/tINXSGE
         nn6FCTkTdGIIFNh1hjXl9OHH43cJ8V1pS7BgPt9yLgj0qmXqTeKVgOBXFuUV2fufAmJx
         bxKu2tByn5nvb2HmSqn3bb7Y4EOGvJRwGzpg2GdJNM5+k9Z1/x/x+TmwdUckGVMo9w80
         fjpg==
X-Forwarded-Encrypted: i=1; AJvYcCW6+EGI7bbEP0WCy9y6ZDMG6Q+nV26alBvYehJZ8XAwZw3JvVfmkoJjX5OXRia9iDE4xjq9Uk1LtP/7QAU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy1Z2lT8vAoP9FkLhiZ5WugRSa6E3vJorM0t0ZyaMF+ujGjtUo
	eXWsRsjMeu0HyIet7CdG3LFFOBv23NbxXbZfZftTOtyp2IyEy4Ryj809
X-Gm-Gg: ASbGncshqC7y3dN8more8NwCcLN7dvXMF7vXBh4pu2gnBbp8cyTwUm025Ns5GJoPMi1
	LALbvEFFFldmymCimufGRz9Us2hLEDIyt5ffUBJrjxiIL6TCPG+ut/dg5aQdvjCpZ8m+C4au7cN
	hV+pFwQIt0sUIs+xMpMHSAZ3yPJZ38aUz8NaO9qJtOSnJlraCgZYhdcCks4tFDTd4e0te3JnK4O
	qnnnAakezTGHHig1ARv8HSl5za1mggWla9p/JWOHlRqACCvRfnFu1bdbDbgzWHkXU81o44tK2qv
	tuqXL9lO2VMD3lZ9l19Bp3Wb1umED/e8JQVvHmshKTq+6buUWwQmLkqvcwGZdLuZBfg4aVsa84G
	PLGXWuagwVai5o9evWiti9A/WxEe4kqdV4ENPiGn0sLy+golXCF+DhB9+FA==
X-Google-Smtp-Source: AGHT+IHKjnlIi1+ZbN9Cv9pOmHXRsgVkPdVQJFqdjmvVyd8mttL28Pc0L/VGBS7loLcKsvWreMVKnA==
X-Received: by 2002:a05:622a:1a29:b0:476:6cd3:d898 with SMTP id d75a77b69052e-4a73c4ca299mr301278841cf.18.1750276213025;
        Wed, 18 Jun 2025 12:50:13 -0700 (PDT)
Received: from seungjin-HP-ENVY-Desktop-TE02-0xxx.dartmouth.edu ([129.170.197.81])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8ed0150sm801300985a.86.2025.06.18.12.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 12:50:12 -0700 (PDT)
From: Seungjin Bae <eeodqql09@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pip-izony <eeodqql09@gmail.com>
Subject: [PATCH] usb: host: xhci-plat: fix incorrect type for of_match variable in xhci_plat_probe()
Date: Wed, 18 Jun 2025 15:27:14 -0400
Message-ID: <20250618192713.20668-2-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2025061804-existing-taking-1f9c@gregkh>
References: <2025061804-existing-taking-1f9c@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: pip-izony <eeodqql09@gmail.com>

The variable `of_match` was incorrectly declared as a `bool`.
It is assigned the return value of of_match_device(), which is a pointer of
type `const struct of_device_id *`.

Fixes: 16b7e0cccb243 ("USB: xhci-plat: fix legacy PHY double init")

Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
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

Hello Greg,

Thank you for your review and the helpful feedback.

I've corrected Signed-off-by line to use my real name.
I also updated Fixes tag in the commit.

Regarding the original issue:
I'm not exactly sure why the compiler didn't catch this,
but I assume implicit casting from pointer to bool is allowed in this context.

Thank you for your email!

Best regards,
Seungjin Bae
