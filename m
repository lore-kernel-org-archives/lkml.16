Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B9DCA6F
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 00:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738282780; cv=none; b=szyTGyxobbBNfzhwas0jV6Wz6MbZuXRt4pa0sOfLbT99HWEhAVH2r2J9GCvfZMh8hZaZNapB0OBkxyMsFHPQY6UZopfS2C/Df5uQ58Ouz/jV6nn31LF0rQpuKy52rXnYBetbe7I/Jr/oj2/QHskAKZ4mYqETadxHXvVbYTu9uEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738282780; c=relaxed/simple;
	bh=tMAlNpR4NtmThpEQqCV8hoA8Jl/s0RhIDhg+rW1tat8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PGWXiy2mhvpf0x5Oj/2PFRKxMR5pLgdxoyZrkmKOxxqy2yMvYDvMBa50QaKU9bWlizF0cTbDnOW2g3uZQXDIpUfGhquNIyKK47w33lB3ydprFEcdgotZy0WYnrQRe017TljFBLj9331wPVzMc8qb6t3sTRXaZvE2mJXSMRXCllQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1faeqh1; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1faeqh1"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2162c0f6a39so46048225ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 16:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738282778; x=1738887578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eu4iajeZxMqtVBb9GVR/egkCI7uYsEZ5rCFcV7XgAIk=;
        b=S1faeqh1tg7BtyPZQnohDVQd2itG9KY9f+ahJ0h+vvhPLfMmvr8mEZDkD4WOVpv/e6
         +4Dlbc6hFsgDkKIaTGnYxggrPA+9ph6J17I+jgtqVQ4wLscVBNSNOvmb3CvGkgMeewAh
         EfR13LN/bjgDmAPKtYFndGULWHlCZ1r5wAnr7KlVTMePfUKppOFEQe8/lMNCSRUFhe6x
         aiyAwTM+L+Ye/ZwNA9JuSpLRvy6ztnG7h/hjhN+3O5y2liUdT7xMXoRTZUIjsQaGcNCf
         EjJLYErlNJUH1ClwGbmlmImLBbRYJC+QA0ErhA14W3ONZTsu6fLfUeg8+TIefOY1yAFA
         u5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738282778; x=1738887578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eu4iajeZxMqtVBb9GVR/egkCI7uYsEZ5rCFcV7XgAIk=;
        b=kfg71xpYXc4pXDNDrZmK76OvFxniwFSRHwtAS2Nn7dFJ5b/sGl173dXAA+gpE4m1OQ
         8NScQweEB+ZZYzaNVr6hE/Fk8GKohcLfgY1WMMCv88BA7WTEdKLV0pNxEiwgzvtEHvNi
         5Yj9QMCe2mnmx81EIGD+SUMZ8SQwCYFddSWCP4aCa/m/FQ43WvSsB0qVeNmJnt/xiHPO
         WZnBr/4uD2lm75HHBj7SaE71l+UrPSWAj0Y8F86sRTf9GxOODtDevWyIWvXpzUJUb0/a
         Zqe2BvgecYNSHnp30dvmbop2h0nAMCz3tfmspbWxsFFJPYb79leZ0FLqGQUY9scVNUqg
         RJUA==
X-Forwarded-Encrypted: i=1; AJvYcCW1dejiW4XkjRylF8ZDBVYlSo36yPF0n0GwwKxVjSLhfup/uoiIC1rF31IT5iHyNzb+uJHydNsQsfUMIIE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz39Q2UWWoXn2ISzkz3CgVBAKaAIzrpIo+JJ2vNLadbu8M3yuww
	3+JagZtCzMBH62ThWvYo9Z2v8ixCZT9q42wSNmPjSz9/4c2wFgLi
X-Gm-Gg: ASbGncuIly8FitM9GWXE39rHg2H55VMvjYlCqwDukB9s7isi+wP4IB9tWedMfmnJjP1
	TbsgEa19MC10bUdIqsSpTkA2/gDBu1rT5dKUs9d1I4ZwhyRMP588cHc2Gn3TRTejMB/gFxpBGFC
	YsbDn/FuDEeY7W9cdre1D4MunD1JXSL+DZpVcchJw+2eQ4825XaNmy0JAKDETAOIlCRgKcR+ObQ
	+NKjzDJOG+nrbS+tjPZHyQJCYTGsYXxeV1NveTDTy2d8hnpvYF37cjS96QgDzmxjjI452jfkppD
	YonJq5QzfH4suM8pq2LRqYBS4Qfv99LM0dXOo2oY5iGQfgzguQ==
X-Google-Smtp-Source: AGHT+IFWUrM+SSQZrqyoWMSFp3NDXsO+kZxdPxA8Q4VeZa5JZviHD3s/5EQZ9UOZA/4M1BU6EsIymg==
X-Received: by 2002:a05:6a00:2b43:b0:725:ebc2:c321 with SMTP id d2e1a72fcca58-72ff2b659e1mr2202540b3a.4.1738282778289;
        Thu, 30 Jan 2025 16:19:38 -0800 (PST)
Received: from fedora.. (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72fe6429218sm2148234b3a.66.2025.01.30.16.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 16:19:37 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	hch@infradead.org,
	urezki@gmail.com,
	intel-gfx@lists.freedesktop.org,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH 2/2] drm: Use vmap_file() in shmem_pin_map()
Date: Thu, 30 Jan 2025 16:18:06 -0800
Message-ID: <20250131001806.92349-3-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250131001806.92349-1-vishal.moola@gmail.com>
References: <20250131001806.92349-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We no longer need to allocate a new array of pages to map this file
to kernel virtual space. This simplifies shmem_pin_map(), and gets rid
of a user of VM_MAP_PUT_PAGES.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 drivers/gpu/drm/i915/gt/shmem_utils.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
index bb696b29ee2c..79d930ed5229 100644
--- a/drivers/gpu/drm/i915/gt/shmem_utils.c
+++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
@@ -57,32 +57,15 @@ struct file *shmem_create_from_object(struct drm_i915_gem_object *obj)
 
 void *shmem_pin_map(struct file *file)
 {
-	struct page **pages;
-	size_t n_pages, i;
 	void *vaddr;
 
-	n_pages = file->f_mapping->host->i_size >> PAGE_SHIFT;
-	pages = kvmalloc_array(n_pages, sizeof(*pages), GFP_KERNEL);
-	if (!pages)
-		return NULL;
-
-	for (i = 0; i < n_pages; i++) {
-		pages[i] = shmem_read_mapping_page_gfp(file->f_mapping, i,
-						       GFP_KERNEL);
-		if (IS_ERR(pages[i]))
-			goto err_page;
-	}
+	vaddr = vmap_file(file->f_mapping, 0, file->f_mapping->host->i_size,
+			VM_MAP, PAGE_KERNEL);
 
-	vaddr = vmap(pages, n_pages, VM_MAP_PUT_PAGES, PAGE_KERNEL);
 	if (!vaddr)
-		goto err_page;
+		return NULL;
 	mapping_set_unevictable(file->f_mapping);
 	return vaddr;
-err_page:
-	while (i--)
-		put_page(pages[i]);
-	kvfree(pages);
-	return NULL;
 }
 
 void shmem_unpin_map(struct file *file, void *ptr)
-- 
2.47.1

