Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9F61A7264
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738915711; cv=none; b=cD8F/7tGBovqfwHDRBhv7TefwjTqs2Ys35XxxQYXFHzgP60VEMMRBU6qVPLPelSU4dgxH8mJy8nwQELUQpHln2pKSPvM69BiZSpD3vvvQBwy3D/095D61RmeGG0sBBAKCu1yP4osDx9pHOjqy3gk05NtMSGq3QeJzZXtGdl5YSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738915711; c=relaxed/simple;
	bh=3Ni9gW+FdstqIfkEUVX03cP14F/28Bv2HPB9KvpyesU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WuwVHJMP0D9U00LEn9qhGqtN5qMUO/0rc7BXx96uU5kjgmT5AegvuOXTeEsSt4nQpBzJAucGutUJpqEsMH5OOrxg5tLYm2j8/RS1XaFq604C/+iYyaavsrkRlUmoNkDI3/vScA6KZjboZQQwR8x6xlIco/hl9usqyuc+GZOznEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a7vRQOZc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a7vRQOZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738915709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SAfH8CaZcdNlX6bGu3s15qKUzaN5EneIuMEhM/Mtjyc=;
	b=a7vRQOZcstJFfpfwxpjtbAYbEDHyk78WODbXxJdFL6yqaxcIEG5OSJj5gIKPRCy+C0NQGz
	ZL9E5nGPAvjS5hykVQ78plo+k6EnHZbvQvGdUWhiY6quF+01VZGCVBNcQkJOwEeKCBAA74
	T5wjcQPd+DOpM3vDTYQuZfGpF0r40fA=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-QiMOdp6tMbCUcj7I7-ACRg-1; Fri, 07 Feb 2025 03:08:27 -0500
X-MC-Unique: QiMOdp6tMbCUcj7I7-ACRg-1
X-Mimecast-MFC-AGG-ID: QiMOdp6tMbCUcj7I7-ACRg
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-21f444af89fso18545055ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 00:08:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738915706; x=1739520506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SAfH8CaZcdNlX6bGu3s15qKUzaN5EneIuMEhM/Mtjyc=;
        b=mN5xAwJ20MV5fUt1SKxh2+0LQSWjsp8F4A6fJ+w7t6wUumDwBvkjiBMFnPnPg9hcxC
         Ni3u7zC4w3uGzzBhnnnnK7Emvnf2SWxMi54pqsJuW9BrGvFIm8J76Ol0W8AuPPrEUx9M
         sLEULAHhLSxYlSb3hmWu/lKIeRjpz/iEf1E3lsBZHpv9kETfmOKOFQ5BlkhDRWrjgrzc
         knJqBdcD3l/y2uasgU3IoaKT8WzjVcMZ26PxuNB++ThVUFZ+/8itjSU6ubl5s4BsEXFI
         UfWCBmcQ5wV9MMxj0AuEPv4EHo8gwoxdt9YNlP0aPryseCPlxWmFCIf870f1AqQ+2RD2
         Supg==
X-Forwarded-Encrypted: i=1; AJvYcCXXBhxMYsU4o1OnVKfcGY54NVqN2Du+gkgjHgUveKxWG3ZOSJpPMGRH/ABzvLfHvByojUKqHSwoucNwOJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMcBzyGfLoV4/5cDVn7z5mzaWL/FABIdowWrLCEICC/XSzrWFo
	acXHIdMH552VQ0C+MjgTv0fWM7jyVnBWzWewPlI6L2sUMUnqJhH5mUMmgCcvJVoQFfppce9/QKS
	heeiuNT6QUpFmv2YevzOjY2b4vE285lBwOkpJYg+y2LwtIvVjDhD2lx/8JGpvyQ==
X-Gm-Gg: ASbGncuM3A4XmED6t34xYJ8t7zg0S7STU2oy9SMEey/eB6Sa58Had8YrVVSPwyTaX1G
	q3urluXuM5uYwMK1Jdk/Bcig/ESyrSwLzJCA2pn7hl0ncG3qaoCpP0s7tmjE1GYfOFETyl/8oqO
	lmP8uPHnPyanWnJ96SwkqtVwFLc9gaH+wDikTZcpI6kO+vn5HTHzq65sYQirr9vSnvxCzfY695s
	w+Ygoqb1t19HcT1zyYlWU4N1KILJ4puy1pUMzjyqMdOPOgCuXgeWjnYNyy8yfbmUwqlbRy+
X-Received: by 2002:a17:902:ef51:b0:215:6995:1ef3 with SMTP id d9443c01a7336-21f4e6a1125mr40433545ad.3.1738915706427;
        Fri, 07 Feb 2025 00:08:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPE/gqMkWPnB/djnJNY/obb5cFGvAP4LjWDnm8O0PsSmswh+uBBdXKftkoZyy8le1irXB8Pg==
X-Received: by 2002:a17:902:ef51:b0:215:6995:1ef3 with SMTP id d9443c01a7336-21f4e6a1125mr40433315ad.3.1738915706122;
        Fri, 07 Feb 2025 00:08:26 -0800 (PST)
Received: from localhost ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650ce21sm24790205ad.26.2025.02.07.00.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 00:08:25 -0800 (PST)
From: Coiby Xu <coxu@redhat.com>
To: kexec@lists.infradead.org
Cc: Ondrej Kozina <okozina@redhat.com>,
	Milan Broz <gmazyland@gmail.com>,
	Thomas Staudt <tstaudt@de.ibm.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Kairui Song <ryncsn@gmail.com>,
	Pingfan Liu <kernelfans@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	Dave Young <dyoung@redhat.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	Dave Hansen <dave.hansen@intel.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Jan Pazdziora <jpazdziora@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>
Subject: [PATCH v8 1/7] kexec_file: allow to place kexec_buf randomly
Date: Fri,  7 Feb 2025 16:08:09 +0800
Message-ID: <20250207080818.129165-2-coxu@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207080818.129165-1-coxu@redhat.com>
References: <20250207080818.129165-1-coxu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, kexec_buf is placed in order which means for the same
machine, the info in the kexec_buf is always located at the same
position each time the machine is booted. This may cause a risk for
sensitive information like LUKS volume key. Now struct kexec_buf has a
new field random which indicates it's supposed to be placed in a random
position.

Note this feature is enabled only when CONFIG_CRASH_DUMP is enabled. So
it only takes effect for kdump and won't impact kexec reboot.

Suggested-by: Jan Pazdziora <jpazdziora@redhat.com>
Signed-off-by: Coiby Xu <coxu@redhat.com>
---
 include/linux/kexec.h | 30 ++++++++++++++++++++++++++++++
 kernel/kexec_file.c   |  3 +++
 2 files changed, 33 insertions(+)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index f0e9f8eda7a3..61269e97502a 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -25,6 +25,10 @@
 
 extern note_buf_t __percpu *crash_notes;
 
+#ifdef CONFIG_CRASH_DUMP
+#include <linux/prandom.h>
+#endif
+
 #ifdef CONFIG_KEXEC_CORE
 #include <linux/list.h>
 #include <linux/compat.h>
@@ -171,6 +175,7 @@ int kexec_image_post_load_cleanup_default(struct kimage *image);
  * @buf_min:	The buffer can't be placed below this address.
  * @buf_max:	The buffer can't be placed above this address.
  * @top_down:	Allocate from top of memory.
+ * @random:	Place the buffer at a random position.
  */
 struct kexec_buf {
 	struct kimage *image;
@@ -182,8 +187,33 @@ struct kexec_buf {
 	unsigned long buf_min;
 	unsigned long buf_max;
 	bool top_down;
+#ifdef CONFIG_CRASH_DUMP
+	bool random;
+#endif
 };
 
+
+#ifdef CONFIG_CRASH_DUMP
+static inline void kexec_random_range_start(unsigned long start,
+					    unsigned long end,
+					    struct kexec_buf *kbuf,
+					    unsigned long *temp_start)
+{
+	unsigned short i;
+
+	if (kbuf->random) {
+		get_random_bytes(&i, sizeof(unsigned short));
+		*temp_start = start + (end - start) / USHRT_MAX * i;
+	}
+}
+#else
+static inline void kexec_random_range_start(unsigned long start,
+					    unsigned long end,
+					    struct kexec_buf *kbuf,
+					    unsigned long *temp_start)
+{}
+#endif
+
 int kexec_load_purgatory(struct kimage *image, struct kexec_buf *kbuf);
 int kexec_purgatory_get_set_symbol(struct kimage *image, const char *name,
 				   void *buf, unsigned int size,
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 3eedb8c226ad..875fe108cc83 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -445,6 +445,7 @@ static int locate_mem_hole_top_down(unsigned long start, unsigned long end,
 
 	temp_end = min(end, kbuf->buf_max);
 	temp_start = temp_end - kbuf->memsz + 1;
+	kexec_random_range_start(temp_start, temp_end, kbuf, &temp_start);
 
 	do {
 		/* align down start */
@@ -483,6 +484,8 @@ static int locate_mem_hole_bottom_up(unsigned long start, unsigned long end,
 
 	temp_start = max(start, kbuf->buf_min);
 
+	kexec_random_range_start(temp_start, end, kbuf, &temp_start);
+
 	do {
 		temp_start = ALIGN(temp_start, kbuf->buf_align);
 		temp_end = temp_start + kbuf->memsz - 1;
-- 
2.48.1

