Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACD5173
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 02:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743388223; cv=none; b=XT03jtqSe5DkO0GEQk6/0v+UAcOFh6UkVN5Q8/74Lkpaigk/pH8loAzEVVOH/n7aWrzmAX2HpDrUETAY8YdbmwmSj3CQDRVxx0Y9WRZkDnU9Znm6aqUj09fmHItxJdYulVaZ1mHoTUbnEI+v7otUBJGCyVoJg1uhl3vaR81e9uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743388223; c=relaxed/simple;
	bh=zsCRsLJiZVXkhu01n6MZCv6LxSO7uR0nk/MNijXJZ8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CS4+fAe7/8vusSN+Gxi4Jzj3tEs0vjV2ymlGQTu9K7Wz392UeiVN/1T7dNvTF6IOedgV/p30oTInvG+UxGRLotThWgFO57LYzkRJ0wKtrte4Oi2g1OLu4UUUB3ZF6SKTit/rdrjGrWkupTE6J2iz5zMGJxZNEpdE0n70CM+3Dws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSRqeUVN; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSRqeUVN"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-224191d92e4so73640545ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 19:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743388221; x=1743993021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cCSIsXsWLh8nLOnVpruJGY2KF/jUdlnjLGWQiptmWYQ=;
        b=CSRqeUVNEnsz9OpEqyGrD3v1s6mKJoFZ2EtlOIKis3uYqrXzco/lyLpicF57T5FUkx
         FHXFMC14zHDIYWIqyeNVi4eWVnhJyuNYWmRGnwl2O6Lz6mkV1blurYFI+AIiSFTkVYOf
         Fo9SvhnjiMfIJ3Jsr7evDQpzKG/Z1awcOEw7hnOTQie8yVcy5Kd1ONPjNAdqoLp7pmxJ
         +Od4df2DiMpiodVy4dcT74az+xbxnkvU1oIl2EQjBNakG5Uu2EGZZ6MQw8R9EpL+TkFp
         rdUKuQ4zbg+yyjDs6Bt2heHEwDLYsA19j9TuqZa8AxAtMSUEFIssw3F6Giq+JPmEJljS
         alzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743388221; x=1743993021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cCSIsXsWLh8nLOnVpruJGY2KF/jUdlnjLGWQiptmWYQ=;
        b=jfrHFjJO03cLAdHoBAP0HuyLtnYJLY4AqMbYhGcMFs+dEhSWuMneYl1TkXYQS69PiZ
         DApmGSKtROyGTgW+YFlFrHEXoaEyXsCCKEM19TwCeCv0kDjMfLFgr/XU9eHMzfxovxJK
         hVDSyxxGAKdrfIAEjo3sEMDsvnGzaBtL5uzSnP60Lg9Pj+Fh4YuB6TAc+GfneMWq6lh9
         rLBe6TmsWOybNZ2cH+8WcdGqMsqwUytAa3h4+Vz9CKT+KHLiTsmERmCYDHqeX4ocaiGU
         h2I9NAF7KxXir25a3TSauPHiRW5EGRU6AsTSxrULjXeTdDrcQZcR7ML0YE4sNmMh1az5
         /DQA==
X-Gm-Message-State: AOJu0Yysh04NBKZMda95oIcYjfKXz8PQJJbGTXMHn4uuYrFzp1excxOt
	XRnSuJAhGkBNwfvdWNjMl1kZbMHTIGasNIQ3q/sO81/KitwwYDjV
X-Gm-Gg: ASbGncv5Ve73J9vL9viHexEAAiFdh66vFVob5INKseagY25Fnpm3fKqpDeuEoYfgsHZ
	4pvgxuP4KhyiEG6Hcxv6/1Np6TpdkY3/YY9F28ib+3mUVxdv/f5WOQB1i1wOfQhHHmOcO0SVyyy
	iRquOFSez3ASGboTGKvMvjqLR71n/AHJIasJ2EoEFnCOMBuUus5AwhCfukoa6QlJ5XJ5Xg7b3OR
	lmP61iX/GptowkK6QAsTISMbAGEBhRzutnfa7yk9r5V5DfjLBt3zZ+0L3+GSrAZgVKW6RrFqiGW
	uLjTxHS11YygF3QGZAQHqyIswhS+OAxAzmferqwoYeaHvbOJluI=
X-Google-Smtp-Source: AGHT+IGNs2fWsfpwW0vdCBT5zu4Jyegp6G1yGKg40tJ6xfLop3eW3mnK0b13Tsv2M7JNc4DzYZQm4A==
X-Received: by 2002:a17:902:d507:b0:216:794f:6d7d with SMTP id d9443c01a7336-2292fa058c5mr133439465ad.48.1743388221122;
        Sun, 30 Mar 2025 19:30:21 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec71cfsm59455955ad.45.2025.03.30.19.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 19:30:20 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: xiang@kernel.org,
	hsiangkao@linux.alibaba.com,
	chao@kernel.org,
	zbestahu@gmail.com,
	jefflexu@linux.alibaba.com,
	dhavale@google.com,
	linux-erofs@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org,
	wangshuai12@xiaomi.com,
	Sheng Yong <shengyong1@xiaomi.com>
Subject: [PATCH v2 1/2] erofs: set error to bio if file-backed IO fails
Date: Mon, 31 Mar 2025 10:29:37 +0800
Message-ID: <20250331022938.4090283-1-shengyong1@xiaomi.com>
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

