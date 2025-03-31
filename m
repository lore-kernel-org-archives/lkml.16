Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21924214A8D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743435526; cv=none; b=tDDtedz0pUtb61LHX5Z1Nnq1uff/PfwvLsDBmOgRtzR49449fLh9oWH0y4Nc3IvJWNc/QgAD/+8BNQHkLbqGIwYaUVmtHhd24Hf+eQXgwT1Vu9urLyp6Yk/6j+5KjkP29ORpB4mGfx8QERqeqow3K8V3UowCGP7EAPs0t+4eFJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743435526; c=relaxed/simple;
	bh=Guph8mmJMFaOo8pXCV+W6NFtzTx7511oxA6uyLVHGwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NW+wp0ZJGfAXx41qW1lYQPiwgKKX4Q8DAoA0L+6abX3hctH8aHKMs7uWBw/GkgWFGSUMVaxBfAqVhSo/2ySgQSENkAuNGjMHcJFME4GPxhm4QmQHnzZ8YnhiSviwvmhfSaSsK+er/2z5OZ0uKQXEsFHiGt4N2cw5dXd7pmOTlYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMxFdF+x; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMxFdF+x"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf257158fso32988175e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743435523; x=1744040323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiknAnsvqiFiA162ylc28HTvEwOzNiA9v+qetgqgE9g=;
        b=OMxFdF+xYlGiWWKQeQ2V3jr3a9HaEJJZHwJpO+zeTLcQQQyXsm8fYzVfey4z/d0xzw
         hY2O5nqzLuoK1FJVpsWyzJdHqUu9nauUlqVTttL6VQWD3ZEaae5MA9CB45yZXmyFk9JS
         rphwJXtQ/iKDZZTsN47Fu6kT7U2qDeF1SBl/QlpPi+IPqRVbh5a515W8yRvK98421xvL
         fOTEwZvgxg6Pnfw4NqRUMEp08YBsKwVOkYAoVzMbIcO8Xo7+MtwHVf/vO+ZOU+9Ay3MV
         peIeuYxD9aNuYIq0G1XfAzfLsWU7H8qL/VSYUlpXr59DBVAEfekvUl2JmmjkiSQkGI/I
         S2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743435523; x=1744040323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DiknAnsvqiFiA162ylc28HTvEwOzNiA9v+qetgqgE9g=;
        b=uedOF8776B8MK7GBDFmLU3nSiKxY3SXlVIMecKNgpB+CNeD4H6v91h2LYoIjAcgXFb
         hekJTUpJj+SmKYfAaFGlSHXECIgaj+Zi/uw4apGRqpPOFPf0GIihS06p1Hs17EAdyZYo
         WZsHd95e0SrXt4b8007bZxIqPYWysUscSVRH1Jk3JIrwJ0bC5PNnLTGfaPa5f/R3jG1G
         6BDDjOf8Uadq8Fpq/rKeGAOcgQiK/YhAkkVv1J7T3jsdb1zpzN2CqNu3cqyrh9y/ltJj
         lFqC6AxXNzXSeMIGfrV3A12ZcV+tw09XRb0eChK1RDOm4X+/lt4sloLdk4QjbQ8qIvXv
         cOtg==
X-Forwarded-Encrypted: i=1; AJvYcCWKzb06b4mWaWQqPe7iGdjhGdRVfaT0D2PK1FoINFUJ9m/tLvvpZQ6EicMIM42KQiWFAa1G8cqA2WdKKjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmEzrR+SJ5crDJf/vUxzet+3ApvvRAQww/c4eS1OFpckd8GCQ1
	hgL2LltAKsxI+iTEm1srciZ3KUmSfX07lhqevvzYRJJ+70RoxH9G
X-Gm-Gg: ASbGncvOp2jx9MHNl/VmEV1gMLfshhpLvMTi1x5Qwp4X8g/KPgfp6gIPx4QOHadiadD
	AjnBdWN0kVxsVXBx5AwVS14QY0G2eAbnQWxcvWKwN/3cf2fCsM8GQUtkiHxUzTcqO0fQRPU6NgJ
	pM9GTqKtTF3KwjVFukekzr9qQhX2HJj8KHF3i+Eqn/1ux0wDTNKb9r7ZuZ2oBTAu0Pik5kEhooG
	jPshP/SUW/ySn+Y4b2uhgzGG+6hJyCvPVGv61wB+bcKFZZQQQRqEc8isHgtdh5h1t1VKUf4411v
	MChP57cwQRXDjALjinl1yxYzPYjetarhLGLn9to=
X-Google-Smtp-Source: AGHT+IFDBbS4zcIHxRzCALn8qONtDseBPQoMluJoXsrEbjFpJCnuyrjeuSwnf4sM7gw+nFvV1KXLXQ==
X-Received: by 2002:a05:600c:4eca:b0:43d:abd:ad0e with SMTP id 5b1f17b1804b1-43db6249689mr92193435e9.18.1743435523485;
        Mon, 31 Mar 2025 08:38:43 -0700 (PDT)
Received: from pc.. ([41.206.42.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6588d0sm11419167f8f.7.2025.03.31.08.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 08:38:43 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH 2/5] staging: rtl8723bs: replace kmalloc + memset with kzalloc
Date: Mon, 31 Mar 2025 18:37:55 +0300
Message-ID: <d68a05a05966167f8e54f2fc779af2f1cfe32e07.1743434232.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743434232.git.karanja99erick@gmail.com>
References: <cover.1743434232.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace a call to kmalloc followed by memset with a single call to
kzalloc, which both allocates memory and zeroes it in one step.

This change improves readability and reduces redundant code.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index a00f9f0c85c5..be46132a533a 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -24,12 +24,7 @@ void *_rtw_malloc(u32 sz)
 
 void *_rtw_zmalloc(u32 sz)
 {
-	void *pbuf = _rtw_malloc(sz);
-
-	if (pbuf)
-		memset(pbuf, 0, sz);
-
-	return pbuf;
+	return kzalloc(sz, in_interrupt() ? GFP_ATOMIC : GFP_KERNEL);
 }
 
 inline struct sk_buff *_rtw_skb_alloc(u32 sz)
-- 
2.43.0

