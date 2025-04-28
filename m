Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380F2203716
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745881779; cv=none; b=PASOo34NTwEmS1eRWPjA6I8kx+x4DPWdNGHkgipeG9OxX42Y3QEn/5lO3blnM9mNbmXqoZkTHb4GnU4HE5RGcQQGpBzf43dzsZNSmVrYymlHLS7SX20LV7AGXIaTeSHQbjGtCyqLYZ6k3VNcGhveYUqTU/1zWAUz71XnO5AF8mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745881779; c=relaxed/simple;
	bh=89vT0Sf2P1UCl2hR+GVT3KeUEojLgSDAWizbeGcX9VE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jDEjuaXcHnJpJHpKyYA21PD76GVmbChDeSxGlPp5AsaiSNPChWt4yyuzPkmSV0otenbJlmgsZ2UZLAIppMBjUyB2Bn85xXICROXnXsLMbiQ2rrlqhjBK2Q4iAMP+HlRbSedtfqPdn9SgRIYervlg5Q8M3n4/s3/OWDGQPmMS+fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=Fb6v8nNZ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="Fb6v8nNZ"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac29fd22163so771671866b.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1745881775; x=1746486575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vuwPRT6I+AQPMIHK3FEvwFoI62Ft+AE7bxY+V5erSDY=;
        b=Fb6v8nNZ0KSGR+BY6+B7xDWz0OXP3+1Cd6O2g1fQc6HI2BRfuOH4czYGV2db+/QzVb
         BQybResJHRTjsZ8GgvabFPXcuh01RdnzGZTha0RYsSDjippDO3u/Ik/qL0bwLPtD+Obc
         mUpbYnzmZMSVTBJ0A3jZWWKXqSXZ88gkJeV7rRSer1vvO7ktAbOZ/QUTPV1KgYT2C7Jn
         eSEkk5GpaGaiN46VYmA8K1/N7mP0p2YLrwxQiy5Z5cytUPMbdLRlQ3P/7exrUiODNa6r
         t0u+yM348fCRwKvmF8bqSjRQsOi8uJIBDLWAiDXGI90jRf7NNEpNvszabHcW/ini6KKo
         DF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745881775; x=1746486575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vuwPRT6I+AQPMIHK3FEvwFoI62Ft+AE7bxY+V5erSDY=;
        b=bYrZByUUauKTauqsyPgp2xrqA7TDSAVeVDnjpMG6GNJH7GLMJRfyMTH7LBenfrVusA
         +0YWQCFb7Y4MzVOM0qSMHG9nmJYmA705YcOdOey7fdeB82uHzyhUUAQoOgTml27djrfo
         UKx4Pqsy8orK+DTJPsnI0z376Fh2YFHdCVHj4utS9fkK2xe7EZESFQD4M9J97CAffoqx
         w1fNm6oznTZO/45K3l7HDGQK61Usq15oSf2kSH+Fip+gWck/t/wCPHu8rkgZSs/R8nq2
         l3ofSobPBIDvV0PUPrfkPzSGJSRuR2EDBMjhxBwdXXrzlTJM1X9kEN6GW6mWPC0yJw0z
         RvnA==
X-Forwarded-Encrypted: i=1; AJvYcCVGYdCAz3rUWzpS6QPYo3VKfB0K4mzZOHdB85JPERLjQcbUJjqfAoxO1DUgosINx38jGkedTGEjja67y9w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw485+yURr5DPinXUKirZiW7fjWDOPDh0N6jbQgStkKUsQR043J
	+H3d2nqKUaGqFJ9GgcF1PpXnK6JBL23bEtD1vmGqY2fMjDpqQ91ox1/4X0+YfdY=
X-Gm-Gg: ASbGncurWpP69BGNSmJcI5GFsEvgidDPiZQdqHa5MRyTBHmwfGlIf9JiBS2jvBQS3ax
	VZMN/XE98iYSP/F4QDTEiFg9HLaNpCFk20hU2Sk/v3a9x7R//BJ7UIFz8BIQ7tJXo9IUpm8rj+o
	mSvjFgbGiEdPpDO59EaNQ8X/1Ya1szXcdJqbQWkvNXjNSGc9Uhtjd8e2SphhuLhmYZbRw4cGSQE
	szaTnPgJEOUCKrCcb3Phr7yA14bgq55WWUXGgK3MCLmIwrHtvwMOuPYHgotDf4Fc/9fGylvT0eb
	evP3Iaqy9DyW0z0EDRbSUkPGgMlEtT/Rzj3PP4ojPKCbUEck4yDqboeB9xRZkgThfJ5S0pKZoSn
	KuIs8SVrGstD7rzG+7myk7S7d2W+L9gZyEEXPtKql
X-Google-Smtp-Source: AGHT+IE5dJK+12G6ixtMDx/8QmYuexDS2b/NTuouKDmQ+p4y/0Up7a/b/rL1ILFQJAuAfI+CdQ8jOw==
X-Received: by 2002:a17:907:940d:b0:ac7:b368:b193 with SMTP id a640c23a62f3a-acec4cdf8a0mr160727866b.27.1745881775464;
        Mon, 28 Apr 2025 16:09:35 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e595abfsm687547266b.86.2025.04.28.16.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 16:09:35 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: xiang@kernel.org,
	chao@kernel.org,
	zbestahu@gmail.com,
	jefflexu@linux.alibaba.com,
	dhavale@google.com,
	linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>,
	stable@vger.kernel.org
Subject: [PATCH] fs/erofs/fileio: call erofs_onlinefolio_split() after bio_add_folio()
Date: Tue, 29 Apr 2025 01:09:33 +0200
Message-ID: <20250428230933.3422273-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If bio_add_folio() fails (because it is full),
erofs_fileio_scan_folio() needs to submit the I/O request via
erofs_fileio_rq_submit() and allocate a new I/O request with an empty
`struct bio`.  Then it retries the bio_add_folio() call.

However, at this point, erofs_onlinefolio_split() has already been
called which increments `folio->private`; the retry will call
erofs_onlinefolio_split() again, but there will never be a matching
erofs_onlinefolio_end() call.  This leaves the folio locked forever
and all waiters will be stuck in folio_wait_bit_common().

This bug has been added by commit ce63cb62d794 ("erofs: support
unencoded inodes for fileio"), but was practically unreachable because
there was room for 256 folios in the `struct bio` - until commit
9f74ae8c9ac9 ("erofs: shorten bvecs[] for file-backed mounts") which
reduced the array capacity to 16 folios.

It was now trivial to trigger the bug by manually invoking readahead
from userspace, e.g.:

 posix_fadvise(fd, 0, st.st_size, POSIX_FADV_WILLNEED);

This should be fixed by invoking erofs_onlinefolio_split() only after
bio_add_folio() has succeeded.  This is safe: asynchronous completions
invoking erofs_onlinefolio_end() will not unlock the folio because
erofs_fileio_scan_folio() is still holding a reference to be released
by erofs_onlinefolio_end() at the end.

Fixes: ce63cb62d794 ("erofs: support unencoded inodes for fileio")
Fixes: 9f74ae8c9ac9 ("erofs: shorten bvecs[] for file-backed mounts")
Cc: stable@vger.kernel.org
Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/erofs/fileio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/erofs/fileio.c b/fs/erofs/fileio.c
index 4fa0a0121288..60c7cc4c105c 100644
--- a/fs/erofs/fileio.c
+++ b/fs/erofs/fileio.c
@@ -150,10 +150,10 @@ static int erofs_fileio_scan_folio(struct erofs_fileio *io, struct folio *folio)
 				io->rq->bio.bi_iter.bi_sector = io->dev.m_pa >> 9;
 				attached = 0;
 			}
-			if (!attached++)
-				erofs_onlinefolio_split(folio);
 			if (!bio_add_folio(&io->rq->bio, folio, len, cur))
 				goto io_retry;
+			if (!attached++)
+				erofs_onlinefolio_split(folio);
 			io->dev.m_pa += len;
 		}
 		cur += len;
-- 
2.47.2

