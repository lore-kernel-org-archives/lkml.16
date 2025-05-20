Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5786FB9
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747743967; cv=none; b=LOUhklQiTvmWc94gYUdDZOHIIbLO+D8TybOPxgkyq2Cu1mQ/R4pW8cl/Od2TiCPEpmvdPD3GxOtn9WJdkH8dpIQoSkU3ePOZgq9khwG4TskBlMZUTJlYYRGSMZW7+vv2EtC+i+fzWsSAeBLA4DTDJFW0Ky9Al9po2viST6ISkzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747743967; c=relaxed/simple;
	bh=1tSmgo31Bx7UDpP9BHHjNA3tVzPHAGbuYhBzkbEnNGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JmhviCxWC1lwIFYKZpEydaLz/i8oMrLAR6oSxbaofeGZo8mLytSuXrG312IAn0yVvI0jWpIxPPbYp/kQyTo5tamWb9/Vqvyp46OzoMPocIc3ovPdMo2xcs43B6iq+tTFAIkt1tGfazIaEOeG6owSQPYaMwHwcubsu16m6NDRJkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iz6KOHto; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iz6KOHto"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c5a88b34a6so590045385a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 05:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747743964; x=1748348764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OR26QMf30kWt//XYhDELT/MMI/WjsN8uqjV/8nFgOk8=;
        b=iz6KOHtoHiZD0/rBtpFWwVk4LNLgIQoR7ahxAVKh2mBb2qSY/jsAQVJvzZc/mWqSAJ
         G45Fnm2qD+/bqRbE3bhcJpOpgdajX8sbwbGTFfDYhZEuaH7L7jimXU52Z1+4cCBNj6IC
         cRbQ09NEzVtDWrja/B37NeYpsbhMA5WSDHsiuMgtF1kuX0LyGQLaoLWsA7T4sVz21Hcu
         CA7GQk4H1CXRHMIBAgIrJomSFW+0eP7XfihCI3FTAqTksgiwNN6IkX6SsigkLEKJ91eK
         NWb2ESv/Bc4VQ5H93Uvj2ChG0/mdln3Y3SQnmSwgEsei+R5lXhBxupuvMJ3VyGg5HGcx
         HnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747743964; x=1748348764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OR26QMf30kWt//XYhDELT/MMI/WjsN8uqjV/8nFgOk8=;
        b=IqGASXysfE2/ptEvaj2Wq7MGWz3Sq4yphDC4GtxQ1ZQ2e9XmkIsRh+3lMh55Ahpzif
         qRIJENKHQtzsX5VsqrqNKy65PqP89QjBINlTg6pANi+FjGPorlC0AtTt6yPeM5DicjsZ
         uIif9+4uN9cYYlhu4fX4mVD2GQ43vqJbrJ8DlwRs/ngkpw5D64zEeb1XY2TRlNNqKcPZ
         fzCFn8PpCTRNC1SPNozwOwTnPHAfZ/xwr3hfIsUBv+z7XTFeniz8bTpI6ADGezlRVXEa
         YkbEyqRGo5xZKMIXiZJOMcgHSWU/HMrmHTW0NFYHSNRVOKo7YWASNR+7yeVdgyCIWHA5
         5JVA==
X-Forwarded-Encrypted: i=1; AJvYcCVX798J/XCvtdSc6MhFG6e8vCCfK39ppBLUUAg6usEkt9MIE/iNygI4OQtKH3uBEAVI/fk554cwNyouqAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFc62neRkzmwm/YJVRLPE4TW+7uaGkfMrkTYLMF5C5LS/C3alZ
	1m5ydJTXyS2uuJ65GED5lhMbQCQVv/rSd5OeS+RJecCVMLJzp9Cn8yfc
X-Gm-Gg: ASbGncuXWpr/tv3fjqNmeo4064wlj24sgOqyjOGFNonH7SopLzWS1R8SKpZ6GOnbr2d
	q2dq5Jm0dWqdgkHR4ezdUvVxXGOXA9fNDCRgqg1+QQusg2oM9EsCX0SQoSzek//AVf3KJ7lb/Ul
	IwgVOvOR6XNzItI1xk6nro8LwId3YPXx1EcCld2AwOadCmqGul3OEL6O3evmODPv5azpd9ReGc+
	5LPJOf080i0oZdkJnatl1MT4jWBClHn15Ch9YBUu9y4P9HTYVbWi210EhB369/t1Hkjm4Q+voyb
	RS9D/qbQfr0eB47oSQTbcD9Y0/7+Odn16Th+ipqTXVPbX1B6
X-Google-Smtp-Source: AGHT+IFmyKsIt0OHKvSQp2VtnsGzKp1f4GZ+CsWOw1isKJyxRNeVj125WrDIiRzRuXMREaoak7aWxA==
X-Received: by 2002:ad4:5caa:0:b0:6e4:4194:df35 with SMTP id 6a1803df08f44-6f8b2cc77c4mr270991566d6.9.1747743964301;
        Tue, 20 May 2025 05:26:04 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:8::])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b0883f45sm71384006d6.23.2025.05.20.05.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:26:03 -0700 (PDT)
From: Usama Arif <usamaarif642@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	surenb@google.com
Cc: hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	vlad.wing@gmail.com,
	linux-mm@kvack.org,
	kent.overstreet@linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	Usama Arif <usamaarif642@gmail.com>
Subject: [PATCH 2/2] mm: slub: only warn once when allocating slab obj extensions fails
Date: Tue, 20 May 2025 13:25:47 +0100
Message-ID: <20250520122547.1317050-2-usamaarif642@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250520122547.1317050-1-usamaarif642@gmail.com>
References: <20250520122547.1317050-1-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In memory bound systems, a large number of warnings for failing this
allocation repeatedly may mask any real issues in the system
during memory pressure being reported in dmesg. Change this to
WARN_ONCE.

Signed-off-by: Usama Arif <usamaarif642@gmail.com>
Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/
---
 mm/slub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/slub.c b/mm/slub.c
index bf43c403ead2..97cb3d9e8d00 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2102,7 +2102,7 @@ prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, void *p)
 
 	slab = virt_to_slab(p);
 	if (!slab_obj_exts(slab) &&
-	    WARN(alloc_slab_obj_exts(slab, s, flags, false),
+	    WARN_ONCE(alloc_slab_obj_exts(slab, s, flags, false),
 		 "%s, %s: Failed to create slab extension vector!\n",
 		 __func__, s->name))
 		return NULL;
-- 
2.47.1

