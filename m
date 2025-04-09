Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A1C1BF33F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744218685; cv=none; b=oKO4+hGTr5y3tkIkNSUak0G7jrBdO7gKRSdAnaV+50xwUXowRe9fItAzl9CNO4U9uy4pGaf+wr3eTWVqzy0xox0ZaR1UNGBEaTMfSkUIr3SfSewKdN77Jmc+x+4N7NqobEK5epqm+uJ5ch7VkVqUSh3UNRGxRgp2ksIlNNLh+HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744218685; c=relaxed/simple;
	bh=GvLrVaMRk+XztBY+J4lQJ8LE4ym2Z2YVwwwap4Cnt74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VIYURq3zbbM67gh2PM4eMioC+eWlYfsyRUYm0JAro7AyMwdpXK+G8ALgUm99XaOmP9zR6G50/PtyCd9VjRaaptQuhqRbU3Wc30SmOJci9cuKEQrQY9UYQSSjBOU0O1yaY+qzryectEd8g91Ggsf7xu01SaEjmsZRLUZvGc5I9D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j7iT+15Z; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7iT+15Z"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-224341bbc1dso64011285ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 10:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744218683; x=1744823483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ljY6ET4Gs1ZLwfHwkM4Df+UpKJ+L4lbBmw0jsIJyzxc=;
        b=j7iT+15ZjwLPnZQlN/HiAyVOvz36GFv5qvFJLX+skPmziZ3L2cOwY0BPjV2aryk0Xk
         Lue6gt1n1EfA2BIFh+hVCKXz+1+FxQz0fUlbSFf7LZXUkUipXcaYXYwwFGfJoPzLAwEk
         A3PD+uFUfALy/IlYoHPC0xIp8EEkKTVMdCqCsLzikgXo1PQrWPzDqe1IwwD8e92ZYywS
         EhW1ALnmoV0XsXHRJKFpGKtUBytXXQNIr2to0ICpf3c+VSsZhomcEda8VAzdsZMVo3T3
         9Nw2DuGD1uIhAmhxxrc7rwQCD1gCF+fKWqK+PtdWuCgOf8Ew7TwnoNCIWtv36Js50ph6
         D7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744218683; x=1744823483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ljY6ET4Gs1ZLwfHwkM4Df+UpKJ+L4lbBmw0jsIJyzxc=;
        b=D4OpUW60xmjWs7XSuHVgrQo6e/cb+VW7TjWIiuyKA+IKpTgPp4QdVL4w53X39uS/l0
         SXg/qzPW+TVTT9VYxhkmFO8ddTAXsS5rNjUoGIAv9NSYNo0CcSB4xRP1YwZGbpIPhZUp
         5kMx0puFCUNgqMIsA2pThKa1NgcI8cqVW6CJTTfobhjV/5/QgJege6B1ql5VTnrmtfaO
         ou+1AxdRe1SmtrwlQvPSVCIPLXcY33HDGZ2lwiv9k8rU9YGqr6c3qPceUA+UjaaI8vLf
         dtFOPMd2UJ9uNhYs/fO2s5P5D5ZIpyyiXEF616A0ow4sOmkJ5Hs/e8ql1WwqKRYohBnd
         w+wA==
X-Forwarded-Encrypted: i=1; AJvYcCV+rtlbTo71MTn0ujrkrwH4OMpovfS33bl+q1DB9r9ssSaHm7bCk8aqgTYJ1mxZpsatsItNS7oA2iD1Mfw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl/7jOLEjAV5L+xP3OXNbhDQyCQ8iuzZttv5yZbLGMjK10ZuSA
	t1RHqj6Vixpxph8h8YARsDx+atDyFKAMOBnYcbilMGyEppXzmeWk
X-Gm-Gg: ASbGncv0AoR4eRpICUmYcVH7LsPRzC/pZVPbDPNpJVY9B7tvzZDJrR3DygaDq0R+CfY
	XQmAXj45IIqXmNj7yNSX+8f2NCwIXAFbASBgkIWZDVDAr8u6991kawS3SrWrx5V/cSzG1QCCWtf
	giIioTYZ/j89Ix7K4W0OgkAbuJYNKaM4qwttIqG556WlO7YDy5ZAXQt9SB4oPhzIt4e8KeFJZVG
	CWl+SDYqUR/Hg2qQ+sUOplK8pBN9PO7NZXdXn8IJXht7xctnEVRA29JkdzslvRjZvkmUx97dhZ7
	dVEfQ4SnC5A6nYGxVl6wj7YP8GZxeF24IwK3IxHLv4LGfQ==
X-Google-Smtp-Source: AGHT+IFN4lnjAG2pC86AigCdhe18+t7czfJrLdV8seqNXHVt3C/GgPo7KXAmU0xU0Lhj1qng6dfQLg==
X-Received: by 2002:a17:902:e80f:b0:220:ff3f:6cc0 with SMTP id d9443c01a7336-22ac2a1df0bmr56410235ad.38.1744218683140;
        Wed, 09 Apr 2025 10:11:23 -0700 (PDT)
Received: from eleanor-wkdl.. ([140.116.96.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8bcd7sm14659015ad.88.2025.04.09.10.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:11:22 -0700 (PDT)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: vgupta@kernel.org
Cc: linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	visitorckw@gmail.com,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH] ARC: unwind: Use built-in sort swap to reduce code size and improve performance
Date: Thu, 10 Apr 2025 01:11:16 +0800
Message-ID: <20250409171116.550665-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The custom swap function used in sort() was identical to the default
built-in sort swap. Remove the custom swap function and passes NULL to
sort(), allowing it to use the default swap function.

This change reduces code size and improves performance, particularly when
CONFIG_MITIGATION_RETPOLINE is enabled. With RETPOLINE mitigation, indirect
function calls incur significant overhead, and using the default swap
function avoids this cost.

$ ./scripts/bloat-o-meter ./unwind.o.old ./unwind.o.new
add/remove: 0/1 grow/shrink: 0/1 up/down: 0/-22 (-22)
Function                                     old     new   delta
init_unwind_hdr.constprop                    544     540      -4
swap_eh_frame_hdr_table_entries               18       -     -18
Total: Before=4410, After=4388, chg -0.50%

Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
Compile test only

 arch/arc/kernel/unwind.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index d8969dab12d4..789cfb9ea14e 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -241,15 +241,6 @@ static int cmp_eh_frame_hdr_table_entries(const void *p1, const void *p2)
 	return (e1->start > e2->start) - (e1->start < e2->start);
 }
 
-static void swap_eh_frame_hdr_table_entries(void *p1, void *p2, int size)
-{
-	struct eh_frame_hdr_table_entry *e1 = p1;
-	struct eh_frame_hdr_table_entry *e2 = p2;
-
-	swap(e1->start, e2->start);
-	swap(e1->fde, e2->fde);
-}
-
 static void init_unwind_hdr(struct unwind_table *table,
 			    void *(*alloc) (unsigned long))
 {
@@ -345,7 +336,7 @@ static void init_unwind_hdr(struct unwind_table *table,
 	sort(header->table,
 	     n,
 	     sizeof(*header->table),
-	     cmp_eh_frame_hdr_table_entries, swap_eh_frame_hdr_table_entries);
+	     cmp_eh_frame_hdr_table_entries, NULL);
 
 	table->hdrsz = hdrSize;
 	smp_wmb();
-- 
2.43.0

