Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D96E218584
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 02:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751510417; cv=none; b=XIS7mVgfftDxqMk6wcHFjROnrQAiS8L5RQz4vjWamdffW3ljWVFcAPkdn7+COyibccvwxmRiKNYjJ+28O72yBSjzQwkcOWchwgYiSIoFTKMo3hSUnY4eVGKstbBf0c3ArVOS4XrsxMDnQCrAlgMAYIBl83C6q924o0dtYw6a+YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751510417; c=relaxed/simple;
	bh=9zbpsDQ/VLO8HS3X8a/sdtuKYGSkgguA3kE8ZvQJbVs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N4+WvjWJEect2QjegSf5WCBhILIzj9bRjZS6NH8bVon2NkKX0Vwc2/Nja8ZKY1ICXr64jnzzXV+WyOnrS3YR+radET0+h3U+JF4kxQ4OLaMs/sa/2+O8YEVUdOzCBA2K3bH2QcFOCZbZXSRUq9AjEvVlRVHDI9RlwansEHAOazk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzIa/Msx; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzIa/Msx"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-74ad4533ac5so432104b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 19:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751510415; x=1752115215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YIGZjKYpefB43h3SleWEiKb7qfKsUPvOFzJhtBGdavI=;
        b=lzIa/MsxBLIWH9EbtpwrZqdllXRQ11v1mq4y1Yys0d1iw54T5SxMnNurn7XZmt6szI
         Vi1QhCWpEbZAkkmgMtatbiTsX1DsIZmOoLx6fW7pWwWaGv86M/Z5imhCIOTFKzLe38hg
         HOg4HIgIv23pFo7tNG1xso1WbB63W3JPnJmh6LTCePoxh2tfaDtcVStq2rMFRLB/Rapr
         MVfHzNrt0RJaacD+hLpkUdD3kAADOj0xueFjQDxvNOPx2TwcT8rrUejoQNwad9hcgvJn
         /Y/bghB5MAsiYR4TCJ73EQiGkGpVeTA83ed4HqWxALRevCpybEpKJcc/R+Nw7anSPDsw
         x1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751510415; x=1752115215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIGZjKYpefB43h3SleWEiKb7qfKsUPvOFzJhtBGdavI=;
        b=vr2UYPuU6S1Jjn9Yol13CTdhq4r/sNjbt+BY9utwK3eqiUYD6oXvI5qAHhonu7920t
         b8nZe6Qkd14sjbaNP8OsV/+cUwGxTPH18p0HcPX1f843nxIW/8ZRwYP2+O2FH1Dv7n5X
         jfEXfjA6+rnJ+7kIEmnhpIXZVDm2Q1V82ZcxAxZKBshmLdQP0sT72aw9Lk8mQREB+s+N
         3bd6mqWxF7vItIqKqG4GQeOWzX1tkOUyO64Uoo5w9LOxUs5nqmdigz5+O0V1UtcXGxeH
         m0glSRXvc+IQF0z6MsLo+j07eDAyNxVk/FMNdGKQcpyGJ0HZOaL8/kda3jlnYI1epMet
         CZGw==
X-Forwarded-Encrypted: i=1; AJvYcCU7kcgHhIkPtC9pKWP4ajrBM4OP3Bambbvwn8oSg4wUd1v/1fZLWo0KHECWQ1K3YpPWprmEGHyxX+6rxlU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs0uy1yUH6bzcj7WTCuFWZ9Z6kvvu4APy/LSg23BZ1G3aBnONL
	7nLPLOM7zQXZBidm3kESG//X561Tz0he5ix44AXNOQjWt17i308sEJwg
X-Gm-Gg: ASbGncsl1NyzN17lqEO0gGMxxSMemEkGUP3fcbHgiMiAReZscRwHFAA1XT+x8IjMeYt
	T8th9Jrnj8svpvAoyHuBHcXx8w6GIwji5SuFd3IsJHOH94DHt10zmqRRBALnRTQbpBViVf/fQ9e
	658tQ8dEsW1+djvznfLCV9XP2PvKqfVKF46yLTX9+8fkm9LlyS26c8FGThvR08ewdVyxO0H8HJ7
	eqWlmi48X8OTb1wV8NrzNqU9+9YAAqFU91HO/ci6knL4J2SvjGhGcL9Uc4inwi5PZwCV7qbqBGu
	m9P27RC5NipNeM6xyqDeZeXKrrNDe26XiTD3T0rwIcZWBh4NcqxxOhQqtqy4h7G9QTWX6RBIlon
	yr4vaBuduOJaKl80=
X-Google-Smtp-Source: AGHT+IFj9S+Fx0WGqU+h/+2EUe4iTujac5xzUy8L36JCmyRv8r5DxDrUoDq6sz1S8Iu3CG0JGYTd9Q==
X-Received: by 2002:a05:6a20:2588:b0:218:17a2:4421 with SMTP id adf61e73a8af0-22482a34a8dmr816405637.10.1751510415118;
        Wed, 02 Jul 2025 19:40:15 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b362cef26dfsm4709952a12.46.2025.07.02.19.40.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 02 Jul 2025 19:40:14 -0700 (PDT)
From: Hao Jia <jiahao.kernel@gmail.com>
To: akpm@linux-foundation.org,
	yuzhao@google.com,
	yuanchu@google.com,
	shakeel.butt@linux.dev,
	mhocko@kernel.org,
	lorenzo.stoakes@oracle.com,
	kinseyho@google.com,
	hannes@cmpxchg.org,
	gthelen@google.com,
	david@redhat.com,
	axelrasmussen@google.com,
	zhengqi.arch@bytedance.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Hao Jia <jiahao1@lixiang.com>
Subject: [PATCH v2] mm/mglru: Stop try_to_inc_min_seq() if min_seq[type] has not increased
Date: Thu,  3 Jul 2025 10:39:46 +0800
Message-Id: <20250703023946.65315-1-jiahao.kernel@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hao Jia <jiahao1@lixiang.com>

In try_to_inc_min_seq(), if min_seq[type] has not increased. In other
words, min_seq[type] == lrugen->min_seq[type]. Then we should return
directly to avoid unnecessary overhead later.

Corollary: If min_seq[type] of both anonymous and file is not increased,
try_to_inc_min_seq() will fail.

Proof:
It is known that min_seq[type] has not increased, that is, min_seq[type]
is equal to lrugen->min_seq[type], then the following:

case 1: min_seq[type] has not been reassigned and changed before
judgment min_seq[type] <= lrugen->min_seq[type].
Then the subsequent min_seq[type] <= lrugen->min_seq[type] judgment
will always be true.

case 2: min_seq[type] is reassigned to seq, before judgment
min_seq[type] <= lrugen->min_seq[type].
Then at least the condition of min_seq[type] > seq must be met
before min_seq[type] will be reassigned to seq.
That is to say, before the reassignment, lrugen->min_seq[type] > seq
is met, and then min_seq[type] = seq.
Then the following min_seq[type](seq) <= lrugen->min_seq[type] judgment
is always true.

Therefore, in try_to_inc_min_seq(), If min_seq[type] of both anonymous
and file is not increased, we can return false directly to avoid
unnecessary overhead.

Suggested-by: Yuanchu Xie <yuanchu@google.com>
Signed-off-by: Hao Jia <jiahao1@lixiang.com>
---
v1 to v2:
 - Modify commit message to make proof clearer.
 - Use one bool to detect any increments in min_seq[type], suggested by Yuanchu Xie.

Link to v1: https://lore.kernel.org/all/20250630080603.36171-1-jiahao.kernel@gmail.com

 mm/vmscan.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index d48e8d365502..d5b6924aeb8f 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3919,6 +3919,7 @@ static bool try_to_inc_min_seq(struct lruvec *lruvec, int swappiness)
 {
 	int gen, type, zone;
 	bool success = false;
+	bool seq_inc_flag = false;
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
 	DEFINE_MIN_SEQ(lruvec);
 
@@ -3935,11 +3936,20 @@ static bool try_to_inc_min_seq(struct lruvec *lruvec, int swappiness)
 			}
 
 			min_seq[type]++;
+			seq_inc_flag = true;
 		}
 next:
 		;
 	}
 
+	/*
+	 * If min_seq[type] of both anonymous and file is not increased,
+	 * we can directly return false to avoid unnecessary checking
+	 * overhead later.
+	 */
+	if (!seq_inc_flag)
+		return success;
+
 	/* see the comment on lru_gen_folio */
 	if (swappiness && swappiness <= MAX_SWAPPINESS) {
 		unsigned long seq = lrugen->max_seq - MIN_NR_GENS;
-- 
2.34.1

