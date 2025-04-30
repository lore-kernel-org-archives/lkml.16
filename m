Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C519A41
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745974950; cv=none; b=N5X1r2+LM+vNC9HQ+ijD1DAac6uHIPDrVIumNmMaYVTSZVrFnRfTGp3aTq7U9g6+yI6KNYCvmMOWhVlDan/4iAiyoXgsUAGKszQSTYHluSQIRyrfPzqugLewig1bq/x6O49Aqoj4Qj+oVpSAXRpvr4DH+6mOjv01SGOuRcWTcME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745974950; c=relaxed/simple;
	bh=cLFgLyuZyljh38qU7gWg64MLjDirt0RXT7NiyHhIsHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ApeqkFX0MGVC1CksvXdCXwK6LNwStQfdt+uXsDthSvjKHCDqch4r35TmiRKgh7qFXhRR47rdJ5tTfHWkf7s4mfqR7JroQKkB0sNMjKFca51n/jl3vQQf6eeAI7Iu6G7UydtoXlw5m1LPWsutS5E+LuigvQf0WMdbGU8Vbm9JoOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eI4s/wvR; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eI4s/wvR"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d7f4cb7636so23029055ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745974947; x=1746579747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvAljtVW/v3KFIRTwVnJMMgZUEkDR0NzqV+zjbhASMk=;
        b=eI4s/wvRyDso5nS8iQ0IqW9rrCjTN+YBITc7Ldw3193ChjQqoc6PE0LxjSU+FnHHt7
         oU32akFcE/lOMOx9xjSltOhWB3gDKfqzmxEFpceM0b9CNkuUerxnNUWFAhwqSJ5WKZBl
         X33w5j9QmnZYU7xU5NKzSzeT58pg7StQ8CCUChpkE2wy6AsS0ZVcb5N0ycAIssJ5mHLE
         LtisL4GEpdpkQYhtyAOVo+dsCllBVJlRh7E4ZJHQsD8qrUlcOpr+AHG0ts2BEF0t/Aj1
         JSFUwnw/Ksu0G9GblRv3Y81Q960EVqjpjcoD4aHl+xFtrj5+YLo1EMDXUKiouQ3wXngp
         y4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745974947; x=1746579747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvAljtVW/v3KFIRTwVnJMMgZUEkDR0NzqV+zjbhASMk=;
        b=MQbsQ1IpoOKRkVhItNSs/yedc1LR3W0WAtL39wbrp9p776ccHO9z6pIntC15TsLQ0V
         iN+RdSLCdZ5ohs72+2tcR6HFbbUEbQB1qWZ4q731lPEXRSpH1rpWpgdPKs8CegAN6RqU
         67CK6iZZx7bF8d+4uOF20IVz9Vcs0/J3yj8zeR2IScixo3vADZv/xzKnj+uM32hZxe7d
         j8kE9IXMUqO3CnQC1joBYCHEbuLC4UZhalHacqXXf3JQ0+D63Dwl4Nl/PiPtts0aUufq
         YWKHv2/QOeCBtEhCXe819RhoBrIwYeFBAMMeq74+0E13MgTu6HL4TqGLf03GbPr660l3
         dgKg==
X-Gm-Message-State: AOJu0YxbIWv1UMN53EOg/p7JI4Oz5TU7ClY6PCLtZ5HNUaYfmNtD4N0j
	/k430Fz+//wCv2zzWzt+jXTBPXt4D9ipImqqRjCU4K8OUSyLFn0y
X-Gm-Gg: ASbGncszJjLLkEU9sWeXSVE2TwJz3NOybSw5xJ5zbFLcVNB4xoFKVBsWvBomdFfs0K5
	epvdaddtIaFl8Y0mpY7wj6xyaROCjQoU9rsYDV0BFcyWGLgc0sutv0EDuQ7sbBArvmwc3o8zuZJ
	TK9ZJswGlkFQHEc6vYzV0O/EUjTPs1rASW+8NJ35njoqJ95fDxDmOHGU+dqxrkUqgPCtlbLEe8Y
	eQ+COZx+UzFospe3/QnI6dvDLyirVg5YpTbFlNX5wG65AgUjmtnfxamfbWDKTED+GzXwjBo3n3p
	NsgtNx8IkjBNI/UrUF9xlCnUtKhZgAYqPzsK9e40LLMupfXXNtN4bykE2HnkaM/6wP5Ai3b+3yn
	G8A==
X-Google-Smtp-Source: AGHT+IEqVWKK47PDWeN2vroc7qkCsqnpC1DhiEQxGM9nyXMqQBC4Oc+mxLlk/po3P//MbfWEHsKv6g==
X-Received: by 2002:a05:6e02:164d:b0:3d0:4b3d:75ba with SMTP id e9e14a558f8ab-3d9676b28femr13321325ab.4.1745974947594;
        Tue, 29 Apr 2025 18:02:27 -0700 (PDT)
Received: from fedora.. (c-24-8-12-5.hsd1.co.comcast.net. [24.8.12.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-4f862e0f4c0sm534818173.4.2025.04.29.18.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 18:02:26 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH 1/2] mm/gup: Remove unnecessary check in memfd_pin_folios()
Date: Tue, 29 Apr 2025 18:00:58 -0700
Message-ID: <20250430010059.892632-2-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430010059.892632-1-vishal.moola@gmail.com>
References: <20250430010059.892632-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 89c1905d9c14 ("mm/gup: introduce memfd_pin_folios() for pinning memfd folios")
checks if filemap_get_folios_contig() returned duplicate folios to
prevent multiple attempts at pinning the same folio.

Commit 8ab1b1602396 ("mm: fix filemap_get_folios_contig returning batches of identical folios")
ensures that filemap_get_folios_contig() returns a batch of distinct folios.

We can remove the duplicate folio check to simplify the code and save
58 bytes of text.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 mm/gup.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index f32168339390..1fb8f3b9a493 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -3589,7 +3589,7 @@ long memfd_pin_folios(struct file *memfd, loff_t start, loff_t end,
 {
 	unsigned int flags, nr_folios, nr_found;
 	unsigned int i, pgshift = PAGE_SHIFT;
-	pgoff_t start_idx, end_idx, next_idx;
+	pgoff_t start_idx, end_idx;
 	struct folio *folio = NULL;
 	struct folio_batch fbatch;
 	struct hstate *h;
@@ -3639,19 +3639,7 @@ long memfd_pin_folios(struct file *memfd, loff_t start, loff_t end,
 				folio = NULL;
 			}
 
-			next_idx = 0;
 			for (i = 0; i < nr_found; i++) {
-				/*
-				 * As there can be multiple entries for a
-				 * given folio in the batch returned by
-				 * filemap_get_folios_contig(), the below
-				 * check is to ensure that we pin and return a
-				 * unique set of folios between start and end.
-				 */
-				if (next_idx &&
-				    next_idx != folio_index(fbatch.folios[i]))
-					continue;
-
 				folio = page_folio(&fbatch.folios[i]->page);
 
 				if (try_grab_folio(folio, 1, FOLL_PIN)) {
@@ -3664,7 +3652,6 @@ long memfd_pin_folios(struct file *memfd, loff_t start, loff_t end,
 					*offset = offset_in_folio(folio, start);
 
 				folios[nr_folios] = folio;
-				next_idx = folio_next_index(folio);
 				if (++nr_folios == max_folios)
 					break;
 			}
-- 
2.49.0

