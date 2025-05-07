Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B926614884C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 05:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596615; cv=none; b=AtNyMbKhUHrYGq+lFaq5b04cDc1w4cCwfMBpNCMd39hG1sfHuraxMSseWO6/OaU296oeL7WTyVkuxioEqVpL5JVM4Wr/Xq9goNhdGI/bg7Ew2Jmp/T+p8wZoqzSsXCkmvt4QBciEHHb25+Y49B9QgN79f9GTgvCD1VBoQcSQrNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596615; c=relaxed/simple;
	bh=J4kIjbESJ6bUle4hrDa2wCKQEQaU9D9h8DkzJ1KOSXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gFv3MC906NVrH14ix81CZaN3ATVysJeFruZ0VdCD3b6Yuh0kTNAu8TcF+S4Dxm+l0IfFd4aRSRPkFil70GQ1bTa2y4Va/eOvyLaP0s1aKcvzTm61pNGAZaGbI1i7qcecWnA9Q4oPd6bFWFR/eOcv2Lnhmtigwxea3/xfskEgdA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ROZcUv3r; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ROZcUv3r"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30aa79ee726so832249a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 22:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746596613; x=1747201413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zc/KAR3VffWEFRdz+eqGNYebR2qEfu/lFHesBocsMHk=;
        b=ROZcUv3rRipVBgjdCbh+xAgs2uwlqfY2lpx7GmYuGrCATpdbgugsdZF+eTY0VjArPy
         kDeCLz4S9qKA2qGaY16XViNC+8I6BWOLgRXrxcPN6SvMDoY9oUu7gv5naiAm1X2OghFQ
         PEV3uN+MF+BV86Da6MN1sf9YEK0/h0XQSgCNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746596613; x=1747201413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zc/KAR3VffWEFRdz+eqGNYebR2qEfu/lFHesBocsMHk=;
        b=bhUsJseK3YgoLnRqm2Q5uqghQ4tKSEJg/LK9A1cO1mqHAgrMp9rBQJuW1NXoVn4fwA
         173LmFJ3qcba8G9MOaDzbKPQiyHyTEJEfEMXe7dYdGl87t2ILsDHL7EqQ2QiQUu2FeXI
         YDekJuKaiJLug810/oahksayNVYfIMDeMj5aA3XFmwf+W/K323XznCwfaWLGj4hV5hO5
         wdngcomXePgHv6M+GuRspgkhFtVJZyfZNo+KtX9SDS6a+SfeL1ln2KRsstdvzHa0Zpo0
         meIo3aeRw2P30ImCgKCMaPc06FiEdk8MO6+vuGz1ua88s+6I2sJdpvs692FhH8N4V2GO
         IXDw==
X-Forwarded-Encrypted: i=1; AJvYcCV/Sj9D5/YWdflhYesSmBJsbrLkJpKeW1y2F+UB/Hj5vNMQG3K0B8cnSx4HGfbXm5gr3z1n2WDLrV2WQuI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKSIIk4VzagBhuX8/i3bgjB+jS7GtM2KhCjgOzGTQWNjYfUmnW
	XZCEa/T+qtKKT1p4pEy9tePCFks/Nq+ZQiJ6cHNVXLUW82M5uWXjKgV8OedFvQ==
X-Gm-Gg: ASbGncu0/mpAjL5JVVqDet5BVNvWUDtO82YL4N4XFoVS7dhgOuiFs+tKbRFlVmQBTII
	P/a1xFI+9q8HAc4vj9RSjkeGCmLPDcx+NLWFgXavHqGo5QytoALz+GV6HgWUyal7IjdqZ17Gn6S
	S05fcl3LViJer94apMPU2k3oKN6OIcjwUn23jF4IgOLLOU8saQsI+aGzdEb+m4jsQ/Ds//UJEzg
	ZGBrE3zOG9sP3GQ5eXxVZktjHArqA4S/ptuvaAzFCp9swF3oz7hjJpA0ah/2ajsgiwOFsNzLbJk
	4+ljkRH+39H0bLqX22ubLPnQ4aNA6cng0lrGkK758HRpi8ycE9K+bWTb26c/S/JG6us=
X-Google-Smtp-Source: AGHT+IGTRpcAdNhkgKayxMb3Wxfl+Cwmx/ElXWDwrxKA5ZkEe0m6t2NlVHiCboJvTQA8vQeewYVDnQ==
X-Received: by 2002:a17:90b:17cd:b0:305:5f28:2d5c with SMTP id 98e67ed59e1d1-30aac1915dcmr3386166a91.15.1746596612907;
        Tue, 06 May 2025 22:43:32 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:284f:37bc:f484:cbc6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e152204desm85030425ad.140.2025.05.06.22.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 22:43:32 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Minchan Kim <minchan@kernel.org>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Vitaly Wool <vitaly.wool@konsulko.se>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Igor Belousov <igor.b@beldev.am>
Subject: [PATCHv2] zsmalloc: don't underflow size calculation in zs_obj_write()
Date: Wed,  7 May 2025 14:42:24 +0900
Message-ID: <20250507054312.4135983-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not mix class->size and object size during offsets/sizes
calculation in zs_obj_write().  Size classes can merge into
clusters, based on objects-per-zspage and pages-per-zspage
characteristics, so some size classes can store objects
smaller than class->size.  This becomes problematic when
object size is much smaller than class->size.  zsmalloc can
falsely decide that object spans two physical pages, because
a larger class->size value is used for that check, while the
actual object is much smaller and fits the free space of the
first physical page, so there is nothing to write to
the second page and memcpy() size calculation underflows.

 Unable to handle kernel paging request at virtual address ffffc00081ff4000
 pc : __memcpy+0x10/0x24
 lr : zs_obj_write+0x1b0/0x1d0 [zsmalloc]
 Call trace:
  __memcpy+0x10/0x24 (P)
  zram_write_page+0x150/0x4fc [zram]
  zram_submit_bio+0x5e0/0x6a4 [zram]
  __submit_bio+0x168/0x220
  submit_bio_noacct_nocheck+0x128/0x2c8
  submit_bio_noacct+0x19c/0x2f8

This is mostly seen on system with larger page-sizes, because
size class cluters of such systems hold wider size ranges than
on 4K PAGE_SIZE systems.

Assume a 16K PAGE_SIZE system, a write of 820 bytes object to a
864-bytes size class at offset 15560.  15560 + 864 is more than
16384 so zsmalloc attempts to memcpy() it to two physical pages.
However, 16384 - 15560 = 824 which is more than 820, so the object
in fact doesn't span two physical pages, and there is no data
to write to the second physical page.

We always know the exact size in bytes of the object
that we are about to write (store), so use it instead of
class->size.

Fixes: 44f76413496e ("zsmalloc: introduce new object mapping API")
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Reported-and-tested-by: Igor Belousov <igor.b@beldev.am>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
---

v2: updated commit message (Johannes)

 mm/zsmalloc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 70406ac94bbd..999b513c7fdf 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -1233,19 +1233,19 @@ void zs_obj_write(struct zs_pool *pool, unsigned long handle,
 	class = zspage_class(pool, zspage);
 	off = offset_in_page(class->size * obj_idx);
 
-	if (off + class->size <= PAGE_SIZE) {
+	if (!ZsHugePage(zspage))
+		off += ZS_HANDLE_SIZE;
+
+	if (off + mem_len <= PAGE_SIZE) {
 		/* this object is contained entirely within a page */
 		void *dst = kmap_local_zpdesc(zpdesc);
 
-		if (!ZsHugePage(zspage))
-			off += ZS_HANDLE_SIZE;
 		memcpy(dst + off, handle_mem, mem_len);
 		kunmap_local(dst);
 	} else {
 		/* this object spans two pages */
 		size_t sizes[2];
 
-		off += ZS_HANDLE_SIZE;
 		sizes[0] = PAGE_SIZE - off;
 		sizes[1] = mem_len - sizes[0];
 
-- 
2.49.0.1045.g170613ef41-goog

