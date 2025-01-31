Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1EC1A8F98
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738314497; cv=none; b=PEIOHmsUE4rcxSSz6xfD0t/IeQaLqvHBvPRzR3Nn2rLe3pzGbGlEPFYtU2gESQ9DUMC1wxxOcIXxchKFKc6XMzIFduoblzoWf7ehlugz3T7Rp0RRque+rNEnpZSqo4+nAWmUli5hdSvq83UtvlF7H22W3OKiD6r8PSHs6sfVNRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738314497; c=relaxed/simple;
	bh=pOm+fpdBAA+J1ecb0mT1Wv1tDOg3X9T9T8tfx6TqtYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qQrhXugeAKa8m80CQh0jbOYQCrXLA4fGIzEcwYgbN/wGZQGu5PyC9ybzHmcLcnd89VxGuOCACwa/xNtUC043kuI4qH04lcvM/VO1JwuHzJMoDYosJrAkkaCoQs5T/dTeAZ8LspJt5NyXNlAaiqF5VXrTeijOgf9xgKW1/Pi7qWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j4auTGAh; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j4auTGAh"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2166022c5caso25914665ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738314495; x=1738919295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQcqfpSqnss0R3EkpuRQBovJzgNoPvoL6ThFstuCphQ=;
        b=j4auTGAhfpit29QG5wuDpuxNC04UCN2QD/Gk/y/YkNGlR7QreOtzle5MLyBcjQOjsx
         uhJ75UUpNA0OGNY87JBiuRcFcBrwndujEfYEUjxlpgaF8sIvXn9bb5Z4B2SrNvMD3L9q
         N5VYAmlN41/HRzythvhU/kWXeeUYdP93L043Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738314495; x=1738919295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQcqfpSqnss0R3EkpuRQBovJzgNoPvoL6ThFstuCphQ=;
        b=nSNEVBgXufPAHMtnZJElDP1x1Xn/yOAr6g3nB6NBfebvhOehQeKKDE5VOkoWDeBsmB
         DvK7XgIgLVdc1m8O+aqPHoDYIZ4GSiQ/4Rt2z5VVSdbsQYD9E6DxJIfEwgW88lpTQP1D
         s2npHT+VaueInAaGx7NTxAZhE9B35fjsaorq6+Sb8+EYiCnO2KfnpZ6jrSukmAmniYwH
         SGlcKmc7NO7cFb94WMi4cxN1BtkiO0szMDQaBcIvHwkgQrLFg8XHBZkENpmxDY+J9sqM
         7yEvRKyzffQg0ZAwh7i+gvf+hf6SCClkRRfulZArgoX9BWLR6/b7L7kn6jaXcJdO7ARQ
         3nKg==
X-Forwarded-Encrypted: i=1; AJvYcCW1iGNtQsppzFNQmpOuGmz+c8xDOYOhZe5RB4l0KzQCbEVarphdVTMBMrY7CaDWDIIpFZhlZ+B3Xt9i4nA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlL098pgoQo2t7qfevq0P60WxE+3rEw2SVJvgeac5l9roGoGFO
	TZOU1pL61ynsCbfVGfdGhv/ZnryBBimhBclGRka0nC7MxMZxrb3o5vyWsrqeCyT4r7B57Vr0XAY
	=
X-Gm-Gg: ASbGnctwWrywvxNBoeTKL+P4guq6nzVo3BfpuTWKNlcAjWbZPjU+0CuZQ60gEl9WRaC
	KPQKVfDaUDO9D+GER0a8bNC7mSt363aGrXLa0CDGZLh+4nKm86cSSXPtOwH37qtFmjtCloXWrc8
	m+Aa/KbRolDr/VxPMcaxcUMwxTpbjcTZSYPDC1V9eysHFx1H/Tb808eZXKMDmzqEXMHnh1y58dn
	QsBIobLgINeHKIDsSiihOofTwE9+YAmowp2lFzUXZHBlfxjJ79lB1g9sAk408mOi0zR7rIXhQ8z
	OwF6Z9NPjR+nBV+RuA==
X-Google-Smtp-Source: AGHT+IEmt7Kd9WrX0z/MrdYcFEjWtu/6bbm1WyY2+91BuQrMC+eYVRLixUf3IzSlvbxl7TXEySCQzg==
X-Received: by 2002:a17:903:2f8c:b0:215:b9a6:5cb9 with SMTP id d9443c01a7336-21dd7c3555bmr174992725ad.5.1738314495518;
        Fri, 31 Jan 2025 01:08:15 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:c752:be9d:3368:16fa])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2f8489d3982sm3396499a91.24.2025.01.31.01.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:08:15 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 17/17] zram: add might_sleep to zcomp API
Date: Fri, 31 Jan 2025 18:06:16 +0900
Message-ID: <20250131090658.3386285-18-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
In-Reply-To: <20250131090658.3386285-1-senozhatsky@chromium.org>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Explicitly state that zcomp compress/decompress must be
called from non-atomic context.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zcomp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/block/zram/zcomp.c b/drivers/block/zram/zcomp.c
index 675f2a51ad5f..f4235735787b 100644
--- a/drivers/block/zram/zcomp.c
+++ b/drivers/block/zram/zcomp.c
@@ -185,6 +185,7 @@ int zcomp_compress(struct zcomp *comp, struct zcomp_strm *zstrm,
 	};
 	int ret;
 
+	might_sleep();
 	ret = comp->ops->compress(comp->params, &zstrm->ctx, &req);
 	if (!ret)
 		*dst_len = req.dst_len;
@@ -201,6 +202,7 @@ int zcomp_decompress(struct zcomp *comp, struct zcomp_strm *zstrm,
 		.dst_len = PAGE_SIZE,
 	};
 
+	might_sleep();
 	return comp->ops->decompress(comp->params, &zstrm->ctx, &req);
 }
 
-- 
2.48.1.362.g079036d154-goog

