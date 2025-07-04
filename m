Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303922459D7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 06:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751610401; cv=none; b=aqvuUbMjAN0ZpkU4tKO5kDeNpAa0YfrHIZ43oPddVPpkxZEfVZ9fkQWTvyQn7VL7vw2PF3gUXxaM1g0pQYFiMd7bHtsaJG6o7By9HjYb7ubJdfIsfPHzSQE1l9MBNffDDuZW7DJ3TrAxwgiMlclKtwFhye6YJSxFzjZ34CCtFbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751610401; c=relaxed/simple;
	bh=zFqecOrZpi0qTmPninPaSLMJPvbB/zlF0VDVWE7x3aQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BXEuTSlUQK5WYs08NIIUoxVSTqXEM2wW1gag7Lso5tLx0zgf6SLwWe9e8yC/cKhu39Dg8Cd34GzeflBmEPrnJCyl53Dp6SxWD8TTJCCXt68rrhNf22wqyWeCYhzWGARHbPQ3Yjv+TqyulfEkBxG9O2j6TZarkavsFeJaOLLXl/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=LtQWwl0s; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="LtQWwl0s"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b3182c6d03bso702869a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 23:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751610397; x=1752215197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2g/dwRr6sLGaceuHHFqckJ3jttaQlwjxhPJ/ULf0C3w=;
        b=LtQWwl0si2ZHFo394eqK410kyFb8tsW3HTyufWP7iaT2Q51DMxCanf+MfmA3R3MGoV
         iM3i5VNNKAErYgX2N15Fy0JEytL44CxGlOR54bjZHS+iDtCMcoDeFNLREgSUM7r3PoF3
         Mu9ovwUR2BoxSBATKgU0aJpA+K/RyLkfxYRMSnUEfUyfknnBlGNA49oY94FI2aYG3H6I
         b42JcHnmyrhdm0HYreMo3T8ShAzqDqD6mqZZOoYVegfBpVEDeYkJNwqbRCZXwG5Hu2tY
         dSDXCygU7t4Rynl0VgzzZ3kcAG3x/x48Z2hrJO6XpR/6dPLdZTgOLvXXvcc2b3zNYT08
         Lqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751610397; x=1752215197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2g/dwRr6sLGaceuHHFqckJ3jttaQlwjxhPJ/ULf0C3w=;
        b=vpXXchm1c5Pu3waLeSavlaALp0cPKBe9PW9evT0u202nGFki1Z0WLcn6TVa/buzpp+
         huUL0Rkws7twSrGvkqYxz7GZXPe/FFQe8npL4BIimr5hLdb59CLLpzK7BToOxjKNj17Z
         YgL5j5N8YOvkS5KVmAXnjgWLKz8ygfFr7oTJLNfwLg7UVlPPgINXf3jMvNzvHLphYF4x
         HDVvrzBQ5XIPTrUatbOT/DSDT5zqoFZfbGAGQzQEQ3qo0KxtaOnIw4vYIHXd1oED30GL
         O4tgr8FdK80uW5GaF/pUoOPknnaij8Fn97pwB7YBCbdFlG7R2stiCXnC+sWBQ8/wutUW
         kkHg==
X-Forwarded-Encrypted: i=1; AJvYcCULSn/AB/ZcptCZ2y2tR24aLTBcAe0BkDbRHj1Lf7pQH07hDkDeMxTJp9m2ch3NFeKa4TYmcTowgMZ2M6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBtja3XB37UzSijzNFw3KkikLLp5Cp61zil5+Obp9/T1qqcAmj
	N5syDSYmHS2sEojEL80EyyjfutxtA6VDAiMYUlimcdKCrgf0CmLnBzLZA8tploi0PPvqrDXdN3d
	msL2O
X-Gm-Gg: ASbGncvFoiN8zm7/s29WfqaGbCkaxl6PCvEeqmxxLkPX1JWEi0LwT6hX/lQOod85b9b
	BNO2SGU+rdlAK+N0SjyEuY64mpgnjOReCB6BxGwvkx0oN1kSxwvjVKLpNNoAvqJdngARvwmtWrH
	/FWkxsNLLYw818dOwtjj9O3n2MMJRNXkdBDa3bR+0e5lKWOPqYfkw2oYtrlOOb45E6JHn3YUUoD
	lqKyI6HG7kOFZ4sGIrTpp0PKauSTL1FDA1HGeuTrMcwn9Y8Bb+TSj6l94C4Ja0bjqKpjtUYuw/5
	OelXj8ACkAA+19OkJwt2KpBqCC5b9B9eh77yZQLU7VGVtSVlI/GpWIAmfSVtdWVmV79ugotCe9m
	EDV59sh8AI6yt4kaYnkxWDIQ=
X-Google-Smtp-Source: AGHT+IFgq2ivg/0MglwTFQ4WJrnXsHzXC1MwrFb4H0GFB2MQTzaMHFKRHwI7ymeiA/dv4aTbTUdETg==
X-Received: by 2002:a05:6a20:9195:b0:203:bb65:995a with SMTP id adf61e73a8af0-225c08e0ffamr2890704637.30.1751610397524;
        Thu, 03 Jul 2025 23:26:37 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee5f643dsm1183240a12.37.2025.07.03.23.26.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Jul 2025 23:26:37 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	peterx@redhat.com,
	jgg@ziepe.ca
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lizhe.67@bytedance.com
Subject: [PATCH v2 1/5] mm: introduce num_pages_contiguous()
Date: Fri,  4 Jul 2025 14:25:58 +0800
Message-ID: <20250704062602.33500-2-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250704062602.33500-1-lizhe.67@bytedance.com>
References: <20250704062602.33500-1-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Zhe <lizhe.67@bytedance.com>

Function num_pages_contiguous() determine the number of contiguous
pages starting from the first page in the given array of page pointers.
VFIO will utilize this interface to accelerate the VFIO DMA map process.

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 include/linux/mm.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0ef2ba0c667a..1d26203d1ced 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -205,6 +205,26 @@ extern unsigned long sysctl_admin_reserve_kbytes;
 #define folio_page_idx(folio, p)	((p) - &(folio)->page)
 #endif
 
+/*
+ * num_pages_contiguous() - determine the number of contiguous pages
+ * starting from the first page.
+ *
+ * @pages: an array of page pointers
+ * @nr_pages: length of the array
+ */
+static inline unsigned long num_pages_contiguous(struct page **pages,
+						 unsigned long nr_pages)
+{
+	struct page *first_page = pages[0];
+	unsigned long i;
+
+	for (i = 1; i < nr_pages; i++)
+		if (pages[i] != nth_page(first_page, i))
+			break;
+
+	return i;
+}
+
 /* to align the pointer to the (next) page boundary */
 #define PAGE_ALIGN(addr) ALIGN(addr, PAGE_SIZE)
 
-- 
2.20.1

