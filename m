Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35382F22
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750125958; cv=none; b=dfGnUjccW1DqG8uxRmBzowIxLLg/JJQ2wGcqkWfa+uTu4J4CpC1Kt0IVJVRt+G6oXquEfo/E6KQs2H8sI4LRJFaotaRSvxLhmTr6IKkoGR71vnJVJEnLdfxBkMs4uInkynm+3moHVNG7CLCuvjjyvw9Pz6HeobCG+YIbDya3bpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750125958; c=relaxed/simple;
	bh=WFxyjg8Ga1KCoq1kN2+ZWFu05eyM7CDn38Pnx13h3Sg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R4Cwyl57R9pOg13U0gShbpXWEfj3Ke32B+5wwObGuxJ8wMICS5DD2Z6HJ3CB1Dc1Z2XmoyG4dnaecYG2uRerkEEw1eck6BZH8c/GHXszpo0gA8ZTRkVx4BwlzYhMQFfdj8J4yTZvErVFgPdq44qr0kCXiatfKuL2FuHD678ADQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzO7HlgN; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzO7HlgN"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso6045133a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 19:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750125956; x=1750730756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V/e3oYgjTsmTYszuJXyVF9sk87ctG71f2L6C75LhXeY=;
        b=OzO7HlgNyNqfQ49DpgE0ShFGe3d13QnDdra3PDBQX/A0LKulUdghQJ/AEt6O1Dl5WZ
         UlqY0m2+UA+3C6pEG5Eigp+vNCyDdyjVqAiPKBy7bS2sYvOsGGyjes1aD2gO+qaGmyTT
         Eix6IiWYjNCfFIe1E7F2RONlTWKMj4tdz8pDYFniXziHXV+KVssZ9UCmB6xHu7wPdf8S
         FqQl7N8684AK9oXw5aIGNfdosaWHALEf16+oEpDz4OPuLumB9cru1I3AADGY5TplZ38j
         J4lNfol034D9yYUkerasSQ43F59Ab8k5k6r5mWi3XYj3S0+CwHesuIAXo1c8BjIAG9/7
         3znA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750125956; x=1750730756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/e3oYgjTsmTYszuJXyVF9sk87ctG71f2L6C75LhXeY=;
        b=TN6O5dAW12NMXcCQ0Wbv61E/ranv5d+naJlAyxLqCaKsx3NnmKB6pIjCUdxRz7tRMp
         GYZZwis1Shsj4G902Azug5Q3/LhttFh4UHQK7dGJqGURJe4GeYEd1nPxgCAcvoOYxI8X
         lNg+Lyl7fFBJJlJRY2lGlQEgfaQCsTDSFpJTmbfY7lSIDhR+spNIELuPI644I+WGv8YA
         7APPdkRvQqdSeR6iU7//uDGlt2EI6shZnDTcbWGAF2hq/MgcpuIfo/aVqV0mIPeTx90z
         ik5UfpPWOEJhi+XTwbp9d/JWSWyDbpWui37RuRAjK2ZfbGLSFfLtQlOIsxuq6yi2Sias
         Kp3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUA8o7DOYzf9gOCUWJ7P8QwFELKUT5nsYOwLx7I0PnRZBgmG/ttIQKKzAw8q66stjS2AZfpTPGDafWVhGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLF8aDUgC7YTMQncRYzdY5AEBgJTJOFJtLNqWgs/3CF3nq8Vg7
	upM6+npMRqjkIH3F8NlmkifN8tpCbk4sxnxD20HNs7mAQRvlBkRGVoi2
X-Gm-Gg: ASbGncsDrTjqGVJzIGkmrbxeg+2gBWGXNnzkLuGfAA21qXDqMjuOnR7b09L1O/K2875
	zSJYU7oQhUtPWTYihoZ7DKQGrdtNecrHAK6R5KI5fYE/yVdrAlzrGuLqbkR3Egq3DU95puNoIPM
	Qxz2dIDXQiQ759UD6Hv2o+9h7oV9gt7in18m6puW1yyrTqh3Icd0Z0CzSMrhw+/S7BURSWiUgwQ
	TzhJGK98FRcZxj/pf4NpXTVzBjAVHEXD1G7jd8lq38C0eWgbaHkgFiS82N72KrxGeOw5gylFf+R
	a2FcnNpQ5wEGwoboRo3BqdZ2IqnAEiHZW0K/6GMoek3puma/L1IgQzBk1mo+x1/9Nr78BWHLC7U
	cVuUIxg==
X-Google-Smtp-Source: AGHT+IF1DJ78/svoVaTrz57SgZ2XcDX4prWp+5xbzJojkgb7K0HuJaBzZHLqi6DLckDk1jGs9XKiiQ==
X-Received: by 2002:a17:90b:4f44:b0:311:e8cc:4253 with SMTP id 98e67ed59e1d1-313f1bef852mr18597645a91.2.1750125955793;
        Mon, 16 Jun 2025 19:05:55 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([103.88.46.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b4993fsm9421536a91.30.2025.06.16.19.05.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Jun 2025 19:05:55 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
X-Google-Original-From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org
Cc: 21cnbao@gmail.com,
	david@redhat.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	jannh@google.com,
	lorenzo.stoakes@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH 1/1] mm/madvise: initialize prev pointer in madvise_walk_vmas
Date: Tue, 17 Jun 2025 10:05:43 +0800
Message-ID: <20250617020544.57305-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lance Yang <lance.yang@linux.dev>

The prev pointer was uninitialized, which could lead to undefined behavior
where its address is taken and passed to the visit() callback without being
assigned a value.

Initializing it to NULL makes the code safer and prevents potential bugs
if a future callback function attempts to read from it.

Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
 mm/madvise.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 267d8e4adf31..c87325000303 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1536,10 +1536,10 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
 				   struct vm_area_struct **prev, unsigned long start,
 				   unsigned long end, void *arg))
 {
+	struct vm_area_struct *prev = NULL;
 	struct vm_area_struct *vma;
-	struct vm_area_struct *prev;
-	unsigned long tmp;
 	int unmapped_error = 0;
+	unsigned long tmp;
 	int error;
 
 	/*
-- 
2.49.0

