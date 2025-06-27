Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A392144CF
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751005386; cv=none; b=VlAcTZJVvqS4KUALPa3qcE286zULyNsgkr4LJ65bCZWsInAxdK/f2y5IhF8wD3ZMf5qjimRcIaOJ7UeBYwdr4XXZ2HUdWLfMavYBRuyZXsnrB5aNmra/65UQxwBWu1aVNF1DDg3uENcFMvREc7VItw8NgwI0tiOayLpttIQP/LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751005386; c=relaxed/simple;
	bh=r49wrMFHcDSo/76hRCDvLHdq7DnCO/1JAUksq7YfABY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YOgv/hMpdYuvPM+8qsfg1NaO23ASOlHbCwxWDKzTfr1iWs+XMXahgmwz3Uppjxf8j5fnQEn7A7ji+yeYLPF0LLrt9jsaU6f9jkzEEP8d+FiwLicNUkdDcXWHKrzM0Tl7YaAx+COk0x/pRY3FZGxQqJef/wK2pYYnWUwp690ZN+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwWPdree; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwWPdree"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso2281777b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751005384; x=1751610184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0ktIgMB1madWBeIOKUq29bfqNvO0BwWDQ23jnFNNR2c=;
        b=AwWPdreew3+i5O9mSJM9sA1HuGX1C9WVCeh1Q7bq+Us4/TwTmzLWA15qBHtdhkQ9Bx
         Ev9ZI/46AzM0gD1pF7xND25K++pay0jrSmHqHbOhHOvQrAIm4Qeq2/jLcT189bM5Uh+l
         NFd7r0vHOeRDTafdvHjPfDEtl3Gvt3UMkOqwuTQSlKgLVK6Jf/W5zRSMmxk/XG1IFWNT
         robXGcLGe1HzUXwQjnfmBxmnALKVtORNQMNp3plwO5fBps4njMcEevqdQzCDKS/3wlWe
         3goAN6tEbjUEnkXEQd92TZjZRkzvB0Dyw6Bfigo/nNpqCrQqvz2Os4WcUC5x2vTrGkCd
         Hwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751005384; x=1751610184;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ktIgMB1madWBeIOKUq29bfqNvO0BwWDQ23jnFNNR2c=;
        b=tKmFKKjaTsRJAicYoPA8fYV+FwT8iPW04afZyPmJ4Pem6eG8iy79FvuE0WMAf8b0iW
         9yC5hqJ8yR9d0TDSccb1qxT8PIWeqNHYHdEXocpquSvm5ESW9lkULc/HZOmTrwKvmFZv
         YseHgXNotYKxurVdXkCi8oqbZ7Fa9FN6g3LmVxm5AtYRY8yp63wS1qjCeBydWQDstXT+
         0RYE5kzOJm0EJo1xmxnZamLAGz2voOXTZwtgxZhrGGyMv+OxueVmOsd1fSg3lKoBGnvl
         o6/Jpue/zqlKui7qvbTrxA7qMNb7sJeR2qxU9LDEfhJLtj3z7DfMn9TpQVYEs6Upo63S
         X8XQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5Ol96kC3kYHIIPIaZxkFCuqsgzHcVeYa8F0o24bVbyxGpjkvYjlOMo1aL75/tQTfwgn7x8fVvif0YoVE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyybOPrk5nrDCzNbW3Y1yedXlT6AZ2eyo4WDVDymVEF2wWxftlc
	gKA2AtmP8pjBIO+raXN+uG4/SCBlv1ep5bsBprZiyw5tcbkOlUQLPqfh
X-Gm-Gg: ASbGncuJz/pUOjAQh3MdNbG5oCkx9L00aDPMLblVnP881TjzfwsK8sesqv91MiYdovu
	Uqr/NoAKB6y9dDEDUJQ9PPyqWsJ36CjfH3z+mdoDTg1iJVKtu8ZelBkH0CQULEYx7YoUX774uEi
	HZbDtL6VcDfWXsHhppS6LPYJ0uSKuIL91AeC3klfmIzUXs1SZUD6dcM9X2ys5dUDvfmktx+Ir/7
	ZAZ6//4SNU4JwMO+axK8KeTnEffdkEcd3+MT42D7FPpyTFFrEXPkhimyQHpZWh3767fJmHMR7i1
	SjUxGnzLj8QPxNKKGlqPFp8IrxlLhkOrfqgyqeoB8JQbtdGpljBjItskAe1q0uSVuzDGAaTAlPK
	t
X-Google-Smtp-Source: AGHT+IGBjDvPz8yY9PBgUeOwmtTrIoPYD/1q7xOCKAY9zvL2RpB2LlARU8Ly7a5Cg/HvE9F9I/zxCw==
X-Received: by 2002:a05:6a21:600a:b0:1ee:d418:f764 with SMTP id adf61e73a8af0-220a16c9a36mr2649969637.38.1751005383692;
        Thu, 26 Jun 2025 23:23:03 -0700 (PDT)
Received: from KASONG-MC4 ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5409cb6sm1456212b3a.23.2025.06.26.23.23.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Jun 2025 23:23:03 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Matthew Wilcox <willy@infradead.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH v3 6/7] mm/shmem, swap: fix major fault counting
Date: Fri, 27 Jun 2025 14:20:19 +0800
Message-ID: <20250627062020.534-7-ryncsn@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250627062020.534-1-ryncsn@gmail.com>
References: <20250627062020.534-1-ryncsn@gmail.com>
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

If the swapin failed, don't update the major fault count. There is a
long existing comment for doing it this way, now with previous cleanups,
we can finally fix it.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/shmem.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 5f2641fd1be7..ea9a105ded5d 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2316,12 +2316,6 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	/* Look it up and read it in.. */
 	folio = swap_cache_get_folio(swap, NULL, 0);
 	if (!folio) {
-		/* Or update major stats only when swapin succeeds?? */
-		if (fault_type) {
-			*fault_type |= VM_FAULT_MAJOR;
-			count_vm_event(PGMAJFAULT);
-			count_memcg_event_mm(fault_mm, PGMAJFAULT);
-		}
 		if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
 			/* Direct mTHP swapin without swap cache or readahead */
 			folio = shmem_swapin_direct(inode, vma, index,
@@ -2341,6 +2335,11 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		}
 		if (!folio)
 			goto failed;
+		if (fault_type) {
+			*fault_type |= VM_FAULT_MAJOR;
+			count_vm_event(PGMAJFAULT);
+			count_memcg_event_mm(fault_mm, PGMAJFAULT);
+		}
 	}
 	/*
 	 * We need to split an existing large entry if swapin brought in a
-- 
2.50.0

