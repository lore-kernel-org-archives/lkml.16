Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A072202C44
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 19:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744228502; cv=none; b=QXTv5g/yiAHmIVTsOp5ppQ5iM/8mbZBB5Gf1y093lGD3QVkOnNwG7nI/8F2b+G4pELqbVP5zz8RzAV4J++18f1RU8AQfyaXVygSCkWDbuR+dCJeRGayt2D+Q9qMruhADSOx9YVfPSvKBMJFlnScGowr21AonCBbpp3tN5FnXfD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744228502; c=relaxed/simple;
	bh=xn68JtN4Qk06N0r1rRh9xofitl+E4BHuD3TI27fRFfs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gdJ/k+LRqaFt+7RZcDk7EpncK8T7xwBSxmJOXii8CEObHtjTCNb50p6WpCPbZ3Nl/yePyStQ6qPGpIRur1KNxxvk6NRZnVZnMGjS9+TeQdqpHl45Olc8wwZDdjB8FgEEmcCwDReT8LtkALg4Jy4f4GmSZiKCfzJWHZKzve8kkK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZCxfOvJ9; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZCxfOvJ9"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-73009f59215so7556b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 12:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744228500; x=1744833300; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0Cxlom7LaqSTPNZq2xmK4+ieYxW2eyaqpLd90fUc9Os=;
        b=ZCxfOvJ9TKKPij5ol67bpHIKIN4ocgS+jlyjWabJe8rXDb7dM8omjhhxvwYxlWRr6E
         JIzw6ekXdJnOU2mOBKpne10r/Qkv7Asz8xse2pRvFjqNwexGmJcUME6MWjd8ICEGhLKB
         zaFHWxbzT4grejh044ZTkQjeRnWZLVkxOTp+K7epeWHGeHjhG/7XOrPXafSKwyxQq3+u
         +QE4r7Uo+HthUF69Y/vSQUOq+ak5SWi6Ix6svcpia1HFtuRcl0vSPUuhg4GkbHELIXmH
         6N6D3JUEauqJvcOyrF/t/w6S6+OquM6H7REDjcfWmOklshz/K9MwIsrHhBmWcRXgi9Q9
         PXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744228500; x=1744833300;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Cxlom7LaqSTPNZq2xmK4+ieYxW2eyaqpLd90fUc9Os=;
        b=HaZDXSg9D1CG2wTX3VHtFXqhaInxb6c2DfNv7YqVeLxHT8dxxH8/UwjEqIp/L3ySaM
         piMe+PC93RF4DnP7r9qIz32WF6hw9yC3ZOjY61ymiiA6ksu96EWX1//QjXvedeT5amEB
         V8yYfjet2HjKHpHHRareHSMhVw+2MWirbqtn2tGTouZZUsPvajNZ2buBZY+B6RlQbHYz
         ckd5q+fQBxDb6EDVJ3i1U4s9nk9cO3w1Vi75wOq746qi8kTVOyUbxlgf6XjaDoK7OyVT
         sXib2gxJfAX6CsCvnlXvasKXFr0a7EmGdUby1QvmRP3sE0NHxNN3XBXbWbi54xLW+NrE
         IpDw==
X-Forwarded-Encrypted: i=1; AJvYcCXM6Ux1Xc8XK9U/ZgqIf5Goz5pCB4fgzvXCl6fMsGFivUzZfsGuk0PgkPSIiMGez62FZs5akf4FJHgf+Lo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrPwDSVEBRIMkXKkDVtJEEN1uQdNh03o27TBeOUbkF7wDKXYk2
	yB1tuvwJGQ2WMCqKpBYlkFQIF5V96YErIzBCoe6Wi5O5FcuGNeG1CjbVz0WN9+/CJsYjgLF42db
	PAKB008f95Dv3Xw==
X-Google-Smtp-Source: AGHT+IE+v/JVOzdWcyI0nV5rZ7/P1D+Fevt3cx+6ulg9GOA2p6sFNANwQH15D7aywnU+YXm3dQlH5ywEzddm+mE=
X-Received: from pfix12.prod.google.com ([2002:aa7:9a8c:0:b0:736:86e0:8dee])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7287:b0:1fe:5e67:21af with SMTP id adf61e73a8af0-201695c7b73mr609078637.30.1744228500266;
 Wed, 09 Apr 2025 12:55:00 -0700 (PDT)
Date: Wed,  9 Apr 2025 19:54:47 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250409195448.3697351-1-tjmercier@google.com>
Subject: [PATCH] alloc_tag: Handle incomplete bulk allocations in vm_module_tags_populate
From: "T.J. Mercier" <tjmercier@google.com>
To: Suren Baghdasaryan <surenb@google.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: "T.J. Mercier" <tjmercier@google.com>, Janghyuck Kim <janghyuck.kim@samsung.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

alloc_pages_bulk_node may partially succeed and allocate fewer than the
requested nr_pages. There are several conditions under which this can
occur, but we have encountered the case where CONFIG_PAGE_OWNER is
enabled causing all bulk allocations to always fallback to single page
allocations due to commit 187ad460b841 ("mm/page_alloc: avoid page
allocator recursion with pagesets.lock held").

Currently vm_module_tags_populate immediately fails when
alloc_pages_bulk_node returns fewer than the requested number of pages.
This patch causes vm_module_tags_populate to retry bulk allocations for
the remaining memory instead.

Reported-by: Janghyuck Kim <janghyuck.kim@samsung.com>
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 lib/alloc_tag.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index 1d893e313614..25ecc1334b67 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -422,11 +422,20 @@ static int vm_module_tags_populate(void)
 		unsigned long old_shadow_end = ALIGN(phys_end, MODULE_ALIGN);
 		unsigned long new_shadow_end = ALIGN(new_end, MODULE_ALIGN);
 		unsigned long more_pages;
-		unsigned long nr;
+		unsigned long nr = 0;
 
 		more_pages = ALIGN(new_end - phys_end, PAGE_SIZE) >> PAGE_SHIFT;
-		nr = alloc_pages_bulk_node(GFP_KERNEL | __GFP_NOWARN,
-					   NUMA_NO_NODE, more_pages, next_page);
+		while (nr < more_pages) {
+			unsigned long allocated;
+
+			allocated = alloc_pages_bulk_node(GFP_KERNEL | __GFP_NOWARN,
+				NUMA_NO_NODE, more_pages - nr, next_page + nr);
+
+			if (!allocated)
+				break;
+			nr += allocated;
+		}
+
 		if (nr < more_pages ||
 		    vmap_pages_range(phys_end, phys_end + (nr << PAGE_SHIFT), PAGE_KERNEL,
 				     next_page, PAGE_SHIFT) < 0) {
-- 
2.49.0.504.g3bcea36a83-goog

