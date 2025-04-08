Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8583226AAB7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744115083; cv=none; b=erd5ThPOu4fCgNT6rYkc9gV3nUB9epeUaPO/o/6SVfuOJ9az4jW2GEt0nyT0OEPvW8G7Rdto7qtZSRxJLFQep8QsED8YbgFU69XyLnwddLeuedzbVhp2GKcWD+QNQz2DHu2z5cFxYHxCOnsj+VdpzQk/wIAXYn1rWYzwkgzgKAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744115083; c=relaxed/simple;
	bh=BdLZNj/E8geGY6nVcjPsggWpqHTe6vJEthVvFXxtoEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mpZiCTDqMUmPuXinyrCM1fglfEwvrsrNJQx0M+aEJ4Uk1Va/QXihJzxDJ3DRQTanlZHYjHySqxPBMGzte+PI9MePzAfrpkTEHgm1IUNgrWnEVmVs2C8zKyfpwan5E/uRo3BbGZC6Qu8vxyHwvRpzZZBP+oyDKVr6+vflsj9vQeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKy9q/I5; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKy9q/I5"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7399838db7fso4830020b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 05:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744115081; x=1744719881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOptbtbOKUdHNzNg9ygqhPthLmzyP2uo7jPEq6N+YNQ=;
        b=mKy9q/I5RP2pqYNDiJBud5qMBJP9rUw/54ZPkOxNE5hOK1vieWW7o5BC708tVwD6A/
         yuzvOa8NM5fdt0I5aMdc8zC+8nkc1xSFJ28/++uyWN0DOOpORZeGTPg05QC0MX71B1/7
         6NZ7dnNb+f+jl7zmjwjSBAQLshbm34tXe5IWla9htO4lP3nxTAw56uGGbt7Biq/39zYM
         M8i/pUuE0IB19e7qZfFWhG4iRMGcnxBdkJ67o+S2ckhGNzGb89N59n/n/5M7YODOw0HC
         LvSwq+irqMMK9b4QKAxyIfMAjJ8x4bdDQWT9nUAFBEXvBn5ZhLg5nChyO7xyRVf+wkb3
         6qFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744115081; x=1744719881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZOptbtbOKUdHNzNg9ygqhPthLmzyP2uo7jPEq6N+YNQ=;
        b=f0G1GQDhuPwTWwDLxI01a/FxC1xTeRlz4oNVYpjhkj/Ao+bSmD2aAqugQZ3n+J6deX
         FR3rcxoS+X7FsbRxMXa+23BEZp5frXKdCwgXW8udgtnZFdBlkicb4ErTW2/7fLn6VjR4
         oS7tX5pRHnvPC27ZsicXex8+N0ExG+EC/6CB4qS5RRlSkMrk0xr4VtWSF1pSBs8Fbi1m
         ZfVa2zqzA1N23e0U6L4I8jQqrruBJJUStyudiZeht8AD/V40sgfPRuG+MaCm0dGP4R8B
         WrlS1fPkKcR8jUFNG2J84FCx+vskWl+n8rx2Vmmtjm1FGleu6CGkkf58kxUbqDvUjln4
         E4pA==
X-Forwarded-Encrypted: i=1; AJvYcCVJaDymKi8E+fjys2O3Xg6BvWBe5fyK7LE+MbdsGThfWB5wSUBFxE66t7M4PYbNSmlEVBNIfQ72s0WwiNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI2PtcZMxacI5bBId6OJ2COahz+mNSacOX+V+8PjMvrdgv6EqL
	2JiC6X7DOG9UskN7xKfF2GSpCGohdf/trn25tHDrgtcbCSmviPJW
X-Gm-Gg: ASbGncvOxVxP3KwmiPfUwgfLrbT3GojHkl/gajo6gb1g910MYYFb3R0aMRNDXBSMHc2
	87fgE4c8UevAHOij6EUsNe0dgrGC9cD22aN4atqTRg83bT0tI6W8//LC9e+3DWEAiXk6Pcrjk75
	Q7XvHvIVIsHq2uLZCexgUmxEKvtCX3DOFdsgUKhFfjWlgmrluhMD51fy0tMJzwthbnCflhA/WkP
	/Q7H+Q412eZzfFLg6QfIOTMnJBarGB8jLAeY9RZ+C3Mkq9bL12+duQny0lDAN6lycf4U2AVIAM5
	3FAlD9cvkIQe5j+l7kta9rZb7TDKdLvQNlMp+cjPTqbwE5S03sU=
X-Google-Smtp-Source: AGHT+IEHpcmo7Xhh/kVuzYomYKxOSWeOPsROUGdAglsdVSxwiKJVQSvQkVzHe2m4jPEycQAEtJwafA==
X-Received: by 2002:a05:6a00:114f:b0:736:491b:5370 with SMTP id d2e1a72fcca58-73b9d39ee5fmr4601812b3a.10.1744115080611;
        Tue, 08 Apr 2025 05:24:40 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b41d4sm10638709b3a.132.2025.04.08.05.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:24:40 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: xiang@kernel.org,
	hsiangkao@linux.alibaba.com,
	chao@kernel.org,
	zbestahu@gmail.com,
	jefflexu@linux.alibaba.com,
	dhavale@google.com,
	kzak@redhat.com
Cc: linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	wangshuai12@xiaomi.com,
	Sheng Yong <shengyong1@xiaomi.com>
Subject: [PATCH v4 1/2] erofs: set error to bio if file-backed IO fails
Date: Tue,  8 Apr 2025 20:23:50 +0800
Message-ID: <20250408122351.2104507-1-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sheng Yong <shengyong1@xiaomi.com>

If a file-backed IO fails before submitting the bio to the lower
filesystem, an error is returned, but the bio->bi_status is not
marked as an error. However, the error information should be passed
to the end_io handler. Otherwise, the IO request will be treated as
successful.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>
---
 fs/erofs/fileio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/erofs/fileio.c b/fs/erofs/fileio.c
index bec4b56b3826..4fa0a0121288 100644
--- a/fs/erofs/fileio.c
+++ b/fs/erofs/fileio.c
@@ -32,6 +32,8 @@ static void erofs_fileio_ki_complete(struct kiocb *iocb, long ret)
 		ret = 0;
 	}
 	if (rq->bio.bi_end_io) {
+		if (ret < 0 && !rq->bio.bi_status)
+			rq->bio.bi_status = errno_to_blk_status(ret);
 		rq->bio.bi_end_io(&rq->bio);
 	} else {
 		bio_for_each_folio_all(fi, &rq->bio) {
-- 
2.43.0

