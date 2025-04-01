Received: from box.fidei.email (box.fidei.email [71.19.144.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5DC1E1C29
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 20:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.19.144.250
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743539049; cv=none; b=SYjic/pZJc4yJQ6c804l9iE91IhCqPRTcFL+4iOeI0l5hzC6NgLTntyQYHPes1KCQkewL4V/5gQlPqDz4aM2DZdPWBjgkV2K4chbPGt5qQ80PqJvwwLcwR9ivbROxJ/TsDFsWIuWwc+EYnwVXo7G6GndgiWg8QevUM15uNtgp1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743539049; c=relaxed/simple;
	bh=BsSRILVhhDPgo5niRJu4FUZyXl80DfST1ovx9ux28P0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JFEVtAUvv7gotYITvaPlvSBXT+rxM/v4e2fBl/C9rWxa65ZsiCups186PIh5UG+6oUNiHn/QovPGn7gZdu3WedOXw/O/w06HXJOdC9aXWHAnCj6fbotYJpBZUPOJMUCRnRhL9RnzQyRqbwlKWpRRqzEw4bWUl8rl/hJqltTX47I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dorminy.me; spf=pass smtp.mailfrom=dorminy.me; dkim=pass (2048-bit key) header.d=dorminy.me header.i=@dorminy.me header.b=How5cAAn; arc=none smtp.client-ip=71.19.144.250
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dorminy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dorminy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dorminy.me header.i=@dorminy.me header.b="How5cAAn"
Received: from authenticated-user (box.fidei.email [71.19.144.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.fidei.email (Postfix) with ESMTPSA id 8C934834C2;
	Tue,  1 Apr 2025 16:24:07 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorminy.me; s=mail;
	t=1743539047; bh=BsSRILVhhDPgo5niRJu4FUZyXl80DfST1ovx9ux28P0=;
	h=From:To:Cc:Subject:Date:From;
	b=How5cAAnmTGDB2VhAPr5uld/jBvKb7nNQt0Hu6bWdGkhFsPMapW90wbP63PHUq19k
	 AmWE3FcMS9Ip+FGP3WtkM/H9E9KvvO9IXv1+ODuspXqqym4ImRD2Bui3P+z4nweuPq
	 oxwT8vV/mbEvzTbBFE1PYBRCOIAvyd10yNPLN9e2ts0jQdSy274gp4GMurHcXK74oy
	 g9oLPPDCHWEWfLDYVMWzgSDJ7y5dPf7KXU/msmFNmeQ9Ip2mFAp8SiQug3PHdBx11p
	 o1KmFjNvtn++viBV7+Nym+c/lkjffhnJfii3TI1HJn5a4xqR+AYsuwqwfyD4NKqPyr
	 B4FOKIasmc0Mg==
From: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Subject: [PATCH] mm/khugepaged: fix a tracepoint for error cases
Date: Tue,  1 Apr 2025 16:23:53 -0400
Message-ID: <20250401202354.103501-2-sweettea-kernel@dorminy.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a potential NULL pointer dereference in trace_mm_khugepaged_scan_pmd()
when folio is NULL. This is possible if vm_normal_page() returned a NULL
page -- which is unlikely, but was hit in testing.

(The tracepoint in include/trace/events/huge_memory.h can already deal
with a NULL page.)

Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>

---
Based on akpm/mm-unstable.

 mm/khugepaged.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index cc945c6ab3bd..eb7b019159d4 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1435,8 +1435,9 @@ static int hpage_collapse_scan_pmd(struct mm_struct *mm,
 		*mmap_locked = false;
 	}
 out:
-	trace_mm_khugepaged_scan_pmd(mm, &folio->page, writable, referenced,
-				     none_or_zero, result, unmapped);
+	trace_mm_khugepaged_scan_pmd(mm, folio ? &folio->page : NULL,
+				     writable, referenced, none_or_zero,
+				     result, unmapped);
 	return result;
 }
 

base-commit: e026356e4192ff5a52c1d535e6b9e3fa50def2c4
-- 
2.48.1

