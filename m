Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185D51AA1E8
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 15:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745509130; cv=none; b=NVwNru/NV8U16jmpNd5TujZf2rUB45e/FoA3A1p8heCUm6fvsrj/vRFijEVxDtyPyNZ3s9be++QTUQwS+dKn34XsNSMtIS96gSIESms7eD4UFldZYeVJUXhK/EI4rhrXDC0pPVRIR//S2lsvPRvLdaV9ZfKudl8kHg3WdYJ/K2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745509130; c=relaxed/simple;
	bh=JErOmSvRz6M7zqb5DoPH14HJhyqws6STEvXi87po8/Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q5yW4NwWBVyG0CE77KBi120dWePEYVNHb62hvRtJtRAOo8ynlsU7ruQ4m453isSgrjFuIqCNmuXzcsJWGY1jjeBgEeTXxmWp3pX/nAORj02cMSLKgvOrPnzBHufdYctIdjwby/KmclL44QIEkW5nP3q+JfVLtofqZmsrCWF2Du8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3356OWR; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3356OWR"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-227914acd20so20389035ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745509128; x=1746113928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YMZq5BIo218i4D6TktEoD1uPCCSFjpDHymQoxUTcIGs=;
        b=S3356OWRiHAxtEU1/r1JuP1gsgwaUP7F924A0HLmjWa1DkaXpVAGQLDHGukzb5/+75
         V3K3LG8ATFnHX87J0kytPuYCMwgSzxmFtTCCIlQEBGw9Wf2C4IfMFfuLSBSdccSVmVHy
         iXajvuSh3h+YBVKa43DyAuRmQoCokY3yC5Na/6duUMlYHIx72K6ZJ6YOAFmDk5qZ5qX6
         BJx613vXXi8ffytS7KdVkMKuurqysodY9jWFUIuY0nvgMS+0HmQjEHFbUcelCIPWRZG7
         HaWi5bKOJelOylhhG5SEjbaaQj9CXeAoXhlnDOlIinBLd1/Dc8UYf1ZwOf0nYQFR0a/Y
         5vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745509128; x=1746113928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YMZq5BIo218i4D6TktEoD1uPCCSFjpDHymQoxUTcIGs=;
        b=ab9etN8DqOPZ6/YUQ6zUVxZhhCu/80CZfGhh2XAC02Tlh02+nTA8BOAMjnSnjItZJH
         K4OKdrPysv+5KPnBfdqD/yu1+smxb+nAIA+h/D/SUd1CnqVtzxdjkwt1jBZSVs8bEi/9
         Txx2RWo2t9QOWYwVfaN5NqcREX6qIFnYqQcIbD5BQ6XErSNknJa2F5QanRj8asvoyg/E
         eBopu1GOj+kecEX122S3SacZn4sxTXszN9JFK7UZfw1ChhyOrvwmoGr9T4pgKjVBLWC9
         04rRxVTcjjy1gRrgNMYQMsVfOJS61bk0M0D2Z1q7RaekgBoeWqC4bNyt5PivuJIPZcf0
         IIKA==
X-Forwarded-Encrypted: i=1; AJvYcCX5OaLVzgAXWQAoYLPSEEnBsx10ylx1pwvNdL0wq52ts/Pf5M62i5Qo7O1PgfF+DpUYwtfw5+c0LG7FWjc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0sc2ljU5qedf3ekqb4HVMBP/ywx3knoJX45wG0Fyw2YlD+l1z
	5rv8lEc9mg/yWKnbsPi8/qqM9/T/c3f/cL9U7HGgHa5LlhaIrZgk
X-Gm-Gg: ASbGncsV12WquBzg8em8iWbMnfaCg27CuWs/UXg6EATG9HXf/JeFDzXJ7QyX/V1Bqca
	IDVIY2hCKCogitoY2uKL+xwzVCBJyZofeUoqhVbclGHH+klmKxY7JPQPDX9MFXTNa2KfwQsgcBk
	svWQ6Ewenaml4DsALxoMVqZFnbGSpMXH3fCCSnA0idny6SJ9p1QVm4Xg9DUi42hlu/MrpD6RAa+
	0j+6Cp9rnj6URppx5b4jI9VETUcsW6y3bOAEaUNYShOPVTZzcGtdoPmwb9ZGpty0XPjdmmz1skQ
	OBK/5ZBmd59cqdtrWxbMxf44/0SIhf4mm1suRIghMPCxHomuMZoO5KOsJ72RzLiT+W/swUxXH35
	vTF8=
X-Google-Smtp-Source: AGHT+IHDEK7d65NrxKEunlmd0aA/6lv4ShD9+LzWHbNgshbEr4lZLTvlMvqJZ13PCTBtv5McnqFwZQ==
X-Received: by 2002:a17:902:f646:b0:215:9eac:1857 with SMTP id d9443c01a7336-22db4792e1dmr37318305ad.5.1745509128195;
        Thu, 24 Apr 2025 08:38:48 -0700 (PDT)
Received: from localhost.localdomain ([43.224.245.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221c8dsm14841445ad.259.2025.04.24.08.38.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 24 Apr 2025 08:38:47 -0700 (PDT)
From: Wenchao Hao <haowenchao22@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Wenchao Hao <haowenchao22@gmail.com>
Subject: [PATCH] mm/compaction: do not break pages whose order is larger than target order
Date: Thu, 24 Apr 2025 23:38:15 +0800
Message-Id: <20250424153815.4003-1-haowenchao22@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When scanning free pages for memory compaction, if the compaction target
order is explicitly specified, do not split pages in buddy whose order
are larger than compaction target order.

Signed-off-by: Wenchao Hao <haowenchao22@gmail.com>
---
 mm/compaction.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/mm/compaction.c b/mm/compaction.c
index 3925cb61dbb8..b0ed0831c400 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -656,6 +656,17 @@ static unsigned long isolate_freepages_block(struct compact_control *cc,
 
 		/* Found a free page, will break it into order-0 pages */
 		order = buddy_order(page);
+
+		/*
+		 * Do not break free pages whose order is larger than
+		 * compact's desired order
+		 */
+		if (cc->order != -1 && order >= cc->order) {
+			blockpfn += (1 << order) - 1;
+			page += (1 << order) - 1;
+			goto isolate_fail;
+		}
+
 		isolated = __isolate_free_page(page, order);
 		if (!isolated)
 			break;
-- 
2.34.1

