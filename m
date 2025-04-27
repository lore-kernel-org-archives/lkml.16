Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CF024889B
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 10:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745748298; cv=none; b=QJ+nuS86piHphYaJVe+l8idd70cD6gCV6L7YruDwbmK+LuxamfGbbxy7l2UPyG/LHlhq8cvUEq52wZiugaufEYfSCh/mjHyv3zgjmBiT3pT1QtoEMm6S33v1duNLQnMqtGADVgfUgZS/BV1HrEh3XIFtD18JISae6qBzJjxiTYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745748298; c=relaxed/simple;
	bh=mydvLjJBnHeE5NSycpyqpNudDH9TuVuCg/ncb1LLdyA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PbeE7faJYyB2gbEP7RtfzFzd/pN8T5ERO2f3bk0XlWbhfCQctSHeggHCD/NGJx9DglSsMtSoJycTWED5oHY/wYqqb5BZ5YSb0kn27u82EpXgxgilPCq7al9UA4vMfdoFuEJ0zZWPwZYGpd9I72iJaCjZjZNUftXgIq+Sg22N+3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PEg/uTS2; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PEg/uTS2"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745748293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kbBrGSlttyJqDmbUGbneT8Q4Vin8RnOijYhB+MLIS+I=;
	b=PEg/uTS2wvCSic3eeEgSsJTlL+SDg6uQF696X8jumoihxpQWBpM98gDOn5yDJrEoTxQeL7
	AOyVjzXTVEkHr7ZXb6b8LvxWORoczRPrjgNV6MsQZix9A+bMWZAJSe5RieUox9DWjCrgGm
	jDK9g1j+nFbGlsFqNylJyku53PjXSQo=
From: Ye Liu <ye.liu@linux.dev>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	rppt@kernel.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	david@redhat.com,
	harry.yoo@oracle.com,
	riel@surriel.com,
	vbabka@suse.cz,
	liuye@kylinos.cn,
	ye.liu@linux.dev
Subject: [PATCH 1/3] mm/io-mapping: precompute remap protection flags for clarity
Date: Sun, 27 Apr 2025 18:04:40 +0800
Message-Id: <20250427100442.958352-2-ye.liu@linux.dev>
In-Reply-To: <20250427100442.958352-1-ye.liu@linux.dev>
References: <20250427100442.958352-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Ye Liu <liuye@kylinos.cn>

In io_mapping_map_user(), precompute the page protection flags in a local
variable before calling remap_pfn_range_notrack().

No functional change.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/io-mapping.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/io-mapping.c b/mm/io-mapping.c
index 01b362799930..f44a6a134712 100644
--- a/mm/io-mapping.c
+++ b/mm/io-mapping.c
@@ -21,9 +21,10 @@ int io_mapping_map_user(struct io_mapping *iomap, struct vm_area_struct *vma,
 	if (WARN_ON_ONCE((vma->vm_flags & expected_flags) != expected_flags))
 		return -EINVAL;
 
+	pgprot_t remap_prot = __pgprot((pgprot_val(iomap->prot) & _PAGE_CACHE_MASK) |
+				       (pgprot_val(vma->vm_page_prot) & ~_PAGE_CACHE_MASK));
+
 	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
-	return remap_pfn_range_notrack(vma, addr, pfn, size,
-		__pgprot((pgprot_val(iomap->prot) & _PAGE_CACHE_MASK) |
-			 (pgprot_val(vma->vm_page_prot) & ~_PAGE_CACHE_MASK)));
+	return remap_pfn_range_notrack(vma, addr, pfn, size, remap_prot);
 }
 EXPORT_SYMBOL_GPL(io_mapping_map_user);
-- 
2.25.1

