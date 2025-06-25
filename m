Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBE91ADC69
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 17:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750873779; cv=none; b=tBTqlPgBXI5n6dUvTHIAzoNkezg9/Vlut2qYt7zUh1zKWhRRC8VNaRz2hxf8aqYL8+vc1mhu1ynU6jsX4ghbNv+jWy229HzXl5miIT5W8a9ue3jfP0IcbPStWmxBmWCGBqfKxxBDt7hpFBOFf2wucCAKSK5XYiW9P0pZ2sDR+PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750873779; c=relaxed/simple;
	bh=hdaQbQzAWC7hOZjbVSYZQ6WivmG3DlnKW6X1M/R7boo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aK9+xU20LBX6pzSgLJNOgOXp8gY7TfWh8UJHKM63HsiAgHf6SfzwvMy9/KWIL1FCrQNkjVnF2p0aD7gxqX67h3JHgHdW661HHwiaxWQVTbY2Tpx3P7VJgW9sB14nVy7pYg14w+LtwNHpDiqilaOa8WqcMemujLSSxo1aKSZrCgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITI5eHSS; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITI5eHSS"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74931666cbcso250230b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750873778; x=1751478578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1ioaSGcSzaoSqR57at2NFDMA+eF56Ru2c256CsXdIs=;
        b=ITI5eHSS4J2li/seQOx/iaD0Kd5Rvc1VOfc1w57aDKiExbi0Q38rg1iAC2+4/0Pkht
         JONUzSOd9sGrX6tNZGiEoZGoJe9d2KrcMKTU1buOkOcNT1W4LZAMhghnKiEOUi/E/taw
         rzBZIBzM2wfao6Cb+C/fjxMWdUxf1yR+teDM8H0+tFGkqUhR9f89w1UX8zeRpM9eHPsW
         rUv8gmm9679KjiJIYw8RwsPliC8MdfJeL4jtYCzteOWZOyQ5+uZ1snx4gbCMOpkIXM/b
         wd8zwko2uehlgXNC0HE6ZPx6UsdlI+H6iFgb5hQMzzWjDqxtM4BbGqpcq8+qkDhG37Gz
         28/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750873778; x=1751478578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1ioaSGcSzaoSqR57at2NFDMA+eF56Ru2c256CsXdIs=;
        b=bAgY0kLM7PYDRmSahtGTgaIpYvIuJ/wbgLiCmwsCnbs7stQz4t9e5bqPZGc+Upqkmn
         3tA0sY71KZYQDf7yXSu6ceGb7PBzdPwkZdM8gv+aiCmx3wrWRRS0rffnGHIpoqZMlNvX
         lYntOQane+DcWgqCGcuMmd1EsUyCNNRXwYrNtpN5wfxFwrD0oZmg4YwMUby8LcvVOitO
         0P5UA5amrX7dLEv2+8LoGSqUhN/n9bUNhNdWtlBGbUAOapnLlrRu5C9vOyR6kncOSBo8
         8WKyMoHQyVtvW6sX/mPyO6ak5ls/bur5IBw+GsL5NL8bkwOyWnVSsiduky9ZraTRH+kV
         ayfA==
X-Gm-Message-State: AOJu0Yxn3FL74VC3+/u+wHB6ZYoJFxGvC6KSVRBylbkHDWFX7tr+v1oS
	UHdiLXnaHt2xi/gKuK7rd2Q+JVdhhiB01EDkbO+siDKbHRSJpJj4Pix7
X-Gm-Gg: ASbGncvoK/xv+Eya36xPw4bJjFPXh1CJsGVPlIvSXANk140PcH0hJkWdVHTw4vjtABL
	1v5Rg3Tv5a9jRtJ96Qv5JTDT72RbWP26+kdN6EVYzcJ2WYswjC6PCF+6CmPm7yebdfMMPAYvBgD
	5Fv4951dhyZZg0GI5joXUMg2/pPB7vmcCFokLhDVJ/xgg2/wDuhJyG5hUqU2fG6n1BROpEUM0HC
	2mmjnh8qFI9CJVstjS3AXipYGOenidqS+8V9H6BLKIVMUf1gHPO90Sw8PFTuFCzagLULt/GU6de
	FGrQ23N7MiG3GP1sDcF94Imyr1RilXPKtzjuA+0pPs/UoSu6vWVH6ZpE9OyYUUduOWchbq6j0rn
	MQwlbQrSqA6zdhwUOpD0SqGGR0JJn6Hg=
X-Google-Smtp-Source: AGHT+IFipD4D2odHuNdn/ATlCMR+IXWifKXifixJMQ7PhzMzFi6ZABQLZm7aZko8k9Nhwg8uIoSZQQ==
X-Received: by 2002:a05:6a20:7d9a:b0:21f:5361:d7f7 with SMTP id adf61e73a8af0-2207f285b2cmr7515854637.31.1750873777676;
        Wed, 25 Jun 2025 10:49:37 -0700 (PDT)
Received: from fedora.. (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-749b5e23879sm4944869b3a.57.2025.06.25.10.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 10:49:37 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Jordan Rome <linux@jordanrome.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [RFC PATCH 1/3] mm/memory.c: convert __copy_remote_vm_str() to folios
Date: Wed, 25 Jun 2025 10:48:39 -0700
Message-ID: <20250625174841.1094510-2-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625174841.1094510-1-vishal.moola@gmail.com>
References: <20250625174841.1094510-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use kmap_local_folio() instead of kmap_local_page().
Replaces 2 calls to compound_head() from unmap_and_put_page() with one.

This prepares us for the removal of unmap_and_put_page(), and helps
prepare for the eventual gup folio conversions since this function
now supports individual subpages from large folios.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 mm/memory.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 0f9b32a20e5b..747866060658 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6820,9 +6820,10 @@ static int __copy_remote_vm_str(struct mm_struct *mm, unsigned long addr,
 	}
 
 	while (len) {
-		int bytes, offset, retval;
+		int bytes, folio_offset, page_offset retval;
 		void *maddr;
 		struct page *page;
+		struct folio *folio;
 		struct vm_area_struct *vma = NULL;
 
 		page = get_user_page_vma_remote(mm, addr, gup_flags, &vma);
@@ -6837,17 +6838,20 @@ static int __copy_remote_vm_str(struct mm_struct *mm, unsigned long addr,
 			goto out;
 		}
 
+		folio = page_folio(page);
 		bytes = len;
-		offset = addr & (PAGE_SIZE - 1);
-		if (bytes > PAGE_SIZE - offset)
-			bytes = PAGE_SIZE - offset;
+		folio_offset = offset_in_folio(folio, addr);
+		page_offset = offset_in_page(folio_offset);
+
+		if (bytes > PAGE_SIZE - page_offset)
+			bytes = PAGE_SIZE - page_offset;
 
-		maddr = kmap_local_page(page);
-		retval = strscpy(buf, maddr + offset, bytes);
+		maddr = kmap_local_folio(folio, folio_offset);
+		retval = strscpy(buf, maddr, bytes);
 		if (retval >= 0) {
 			/* Found the end of the string */
 			buf += retval;
-			unmap_and_put_page(page, maddr);
+			folio_release_kmap(folio, maddr);
 			break;
 		}
 
@@ -6859,13 +6863,16 @@ static int __copy_remote_vm_str(struct mm_struct *mm, unsigned long addr,
 		 */
 		if (bytes != len) {
 			addr += bytes - 1;
-			copy_from_user_page(vma, page, addr, buf, maddr + (PAGE_SIZE - 1), 1);
+			copy_from_user_page(vma,
+				folio_page(folio, folio_offset / PAGE_SIZE),
+				addr, buf,
+				maddr + (PAGE_SIZE - page_offset - 1), 1);
 			buf += 1;
 			addr += 1;
 		}
 		len -= bytes;
 
-		unmap_and_put_page(page, maddr);
+		folio_release_kmap(folio, maddr);
 	}
 
 out:
-- 
2.49.0

