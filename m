Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1F524169E
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 12:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747399198; cv=none; b=AKny37uXMauGwndWIDRJfbb8+X5nbfDr/eozvUQ7N/C3FZyLcrjcbeAFY/BToD9+i3AgVgA/O2XWH2wyeOr+eX/vOdedT4AMh8XKXCljz2Ay2jE0ygA1hIAjjZMeQopGGxvRk3/GIgrrS4o+4B6I3bz8f0ACVXqLWUyWgDvri1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747399198; c=relaxed/simple;
	bh=WYwxSxOVlYTosM+O5vFdzE/5LvJbOsbb5QgjUqEBTrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L47wqwDFO6dJZMPdZpBw6bDY5GXxyWGcfktupnyWpXtyTPBnQIgvVL/vH8sRDSTkEl9TFKf+iigZF2j+RSyRcoYR+fLtmoY0goTTc8TE5K3N/Qq/t86Xh3R/wzzea7aT8xCVUVQa0JOwCKzVYf1bdl2zGbhlKBIUsvWViNTeoJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PUyAt9K2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PUyAt9K2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747399196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7YgkObtSLivpA2litK1mMvMA1rBOwW9ugDKcEb23+bA=;
	b=PUyAt9K2+yqpO+zQCZb6QygGYkkH+569zaIAkI3jiixToPUdY/+3h14CoLD07JjemmtgDP
	69JRXV5cOzDIbEcd1ZYZG2Nk9Q7Lfvduy5xqhuHzaptbkwPwxuAGwFMxvZnyyytJ7nnown
	h6ZFDL4tsNd990fsGLHXG816j943d14=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-tbeyANQqPBGbG9qTzE45OQ-1; Fri, 16 May 2025 08:39:55 -0400
X-MC-Unique: tbeyANQqPBGbG9qTzE45OQ-1
X-Mimecast-MFC-AGG-ID: tbeyANQqPBGbG9qTzE45OQ_1747399194
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a35ec8845cso399728f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 05:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747399194; x=1748003994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YgkObtSLivpA2litK1mMvMA1rBOwW9ugDKcEb23+bA=;
        b=hGDZGyusIDOCFJr1cAOVFUbw1zT0796+29Fc/PfFuTPNbDexEJjtqkJo3B05PDoYVe
         Nu8rZLuMHPiwgMfjRHlAWHs1D+/rLzI/tfJPNyY0VzUBmFnSkr007FIO3aqgtrwePFMP
         nKin15ZNmsmksK2kUdNBKjMdm4H/C2M1yWtUS+X/GHPAI9WKFgbuin4oIJy+av9S4fjj
         vR+agC7bDd3EL123AAZeJKYrfBuYSy/08gwD/nGTBiZCNefLtj5u3fvRFJwYS6Hs/vON
         k0JxNN3yZp+EjCrYB7PH+KYqZ+EYrzL/dwhAfgwJH6LjygyzWauwwe313Lv23A6+Gz0Q
         m3DQ==
X-Gm-Message-State: AOJu0YylYn/zOSINbA9DG5UVOr7kzDeP5+OjS+a7ypH0pEsBTLG5zCuN
	L6IZaJNW9XyPx/LZwVeDSaNEGFLWZ1O0KKy0XJn6TdQkmIvvdwn7TBVROBooqu4WJLe8ZY0jRNF
	qAnrPA0/8W17GuOYskEGDn/Fu5Rt3Jkp525SR+cEwoEYMlbBNEwNAe4qquU+0bnZ5FNSPa/aPVv
	gPR+lHcHfLh3+/fck2sC9CWUHnUBYJV8i/M3/yYXhALfMHSYlq
X-Gm-Gg: ASbGncvbI5aNnSQjBRiTIRddvKpG645MbgL4+PCIDsQPHOuspUXXYeDvFANFR4r+ZBS
	gl1Xm6w24oUotXwtJxKFelS2d3RkraJo/W1J2rTPStMB+ZzNO1G07ec5QINijoLcWSpXE07uuV5
	YBiJqLQaKLuSgq6HZv/QHaL08p/UNyMnKE03BvzsvR5WfbS1MED9DWHal+5sTgmx7SuowbhglRH
	9EuRWHe3U+SkKdhvG6Pz+1zOykHeL/FleyPzAXiXRku+OvoZ0nLioj2gZwCv8kE7IXO4oAIIDWJ
	ecCBwbtLjQbAmTK4jMyWV7e9BQy8nTY1l1WiAyGmuJO5uKgMV/0Yie6t5tlObT2hHsHpUGeX
X-Received: by 2002:a05:6000:184c:b0:3a0:7139:d178 with SMTP id ffacd0b85a97d-3a35c845c40mr3418608f8f.51.1747399193857;
        Fri, 16 May 2025 05:39:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE8vebfbLiwPBSuYo/cxaTZC41xWsZgY9lUxeJJRumkx2bu9v71dWhPZlXOhuoGEIxFJdFsw==
X-Received: by 2002:a05:6000:184c:b0:3a0:7139:d178 with SMTP id ffacd0b85a97d-3a35c845c40mr3418562f8f.51.1747399193358;
        Fri, 16 May 2025 05:39:53 -0700 (PDT)
Received: from localhost (p200300d82f474700e6f9f4539ece7602.dip0.t-ipconnect.de. [2003:d8:2f47:4700:e6f9:f453:9ece:7602])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35ca8caaasm2674423f8f.83.2025.05.16.05.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 05:39:52 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-s390@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Zi Yan <ziy@nvidia.com>,
	Sebastian Mitterle <smitterl@redhat.com>
Subject: [PATCH v1 2/3] s390/uv: always return 0 from s390_wiggle_split_folio() if successful
Date: Fri, 16 May 2025 14:39:45 +0200
Message-ID: <20250516123946.1648026-3-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516123946.1648026-1-david@redhat.com>
References: <20250516123946.1648026-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's consistently return 0 if the operation was successful, and just
detect ourselves whether splitting is required -- folio_test_large() is
a cheap operation.

Update the documentation.

Should we simply always return -EAGAIN instead of 0, so we don't have
to handle it in the caller? Not sure, staring at the documentation, this
way looks a bit cleaner.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/s390/kernel/uv.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/s390/kernel/uv.c b/arch/s390/kernel/uv.c
index 2cc3b599c7fe3..f6ddb2b54032e 100644
--- a/arch/s390/kernel/uv.c
+++ b/arch/s390/kernel/uv.c
@@ -324,34 +324,36 @@ static int make_folio_secure(struct mm_struct *mm, struct folio *folio, struct u
 }
 
 /**
- * s390_wiggle_split_folio() - try to drain extra references to a folio and optionally split.
+ * s390_wiggle_split_folio() - try to drain extra references to a folio and
+ *			       split the folio if it is large.
  * @mm:    the mm containing the folio to work on
  * @folio: the folio
- * @split: whether to split a large folio
  *
  * Context: Must be called while holding an extra reference to the folio;
  *          the mm lock should not be held.
- * Return: 0 if the folio was split successfully;
- *         -EAGAIN if the folio was not split successfully but another attempt
- *                 can be made, or if @split was set to false;
- *         -EINVAL in case of other errors. See split_folio().
+ * Return: 0 if the operation was successful;
+ *	   -EAGAIN if splitting the large folio was not successful,
+ *		   but another attempt can be made;
+ *	   -EINVAL in case of other folio splitting errors. See split_folio().
  */
-static int s390_wiggle_split_folio(struct mm_struct *mm, struct folio *folio, bool split)
+static int s390_wiggle_split_folio(struct mm_struct *mm, struct folio *folio)
 {
 	int rc;
 
 	lockdep_assert_not_held(&mm->mmap_lock);
 	folio_wait_writeback(folio);
 	lru_add_drain_all();
-	if (split) {
+
+	if (folio_test_large(folio)) {
 		folio_lock(folio);
 		rc = split_folio(folio);
 		folio_unlock(folio);
 
 		if (rc != -EBUSY)
 			return rc;
+		return -EAGAIN;
 	}
-	return -EAGAIN;
+	return 0;
 }
 
 int make_hva_secure(struct mm_struct *mm, unsigned long hva, struct uv_cb_header *uvcb)
@@ -394,7 +396,7 @@ int make_hva_secure(struct mm_struct *mm, unsigned long hva, struct uv_cb_header
 	mmap_read_unlock(mm);
 
 	if (rc == -E2BIG || rc == -EBUSY) {
-		rc = s390_wiggle_split_folio(mm, folio, rc == -E2BIG);
+		rc = s390_wiggle_split_folio(mm, folio);
 		if (!rc)
 			rc = -EAGAIN;
 	}
-- 
2.49.0

