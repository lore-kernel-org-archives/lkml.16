Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD5126AA98
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744962760; cv=none; b=Q0ZH97QwpWhm7XRqXzr0tBNPZTljAJv7HmVLNAiPWLOk+zGXr1vPWPvFVUGYsejTuLa/LEDzMOi8iicHTBvEbmXDRAtDTm5FKq37WUfWMfl5AhfLD3CkjIgjDHhzqDCmC13bBgpr4zGn2mEBVO31qKRzOFeXmSdI1mf6SnkZ/jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744962760; c=relaxed/simple;
	bh=iIlIRJaJ8Nk9baLTAldhAKHTfIUQ0a8HFvaz7lfJOqM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qx5wyabAdrzbFt/FzMIg62ExtLbXzthOT4BWUSKGBjVA6UptpJHyaclSkVCk+cnLxV/bQcwdbSMrTrlh5sLSCWqWih+qGIWw16GZUGXUvTQEjDUzDCUdm0XYcpLymxmbNoo4cvS9PtyTW1zNMYPKkvISLt7c93Xn8j5ueFNG6JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aSDK3B9G; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aSDK3B9G"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744962755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oGO08xLxOYFwCfCougkQzxDVIQkhT4UpNDlADOdXRwg=;
	b=aSDK3B9Gdkc6xPZClLQveXZgHE+BbIv50MzsXv7VhKPap4JbnCo27Qo+f8UC7+CXcZG7gk
	RRjz/wPHtPRIbJrCcf6g47tQtB+kyfz9ZUfh9hWbnZeDSq7lIVhoZ/hHDyql9dm+OhuYEA
	M9QZEwThq4CPq4sH9WX9XR5okq20jUM=
From: Ye Liu <ye.liu@linux.dev>
To: akpm@linux-foundation.org,
	linmiaohe@huawei.com,
	nao.horiguchi@gmail.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Ye Liu <liuye@kylinos.cn>
Subject: [PATCH 2/3] mm/rmap: fix typo in comment in page_address_in_vma
Date: Fri, 18 Apr 2025 15:52:25 +0800
Message-Id: <20250418075226.695014-3-ye.liu@linux.dev>
In-Reply-To: <20250418075226.695014-1-ye.liu@linux.dev>
References: <20250418075226.695014-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Ye Liu <liuye@kylinos.cn>

Fixes a minor typo in the comment above page_address_in_vma():
"responsibililty" → "responsibility"

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/rmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index b509c226e50d..a9eed8981e18 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -774,7 +774,7 @@ static bool should_defer_flush(struct mm_struct *mm, enum ttu_flags flags)
  * @vma: The VMA we need to know the address in.
  *
  * Calculates the user virtual address of this page in the specified VMA.
- * It is the caller's responsibililty to check the page is actually
+ * It is the caller's responsibility to check the page is actually
  * within the VMA.  There may not currently be a PTE pointing at this
  * page, but if a page fault occurs at this address, this is the page
  * which will be accessed.
-- 
2.25.1

