Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C96C13B797
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 01:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746148383; cv=none; b=hx4sLAep5r3NMy7BihPH8XuLWJe+4Zbk0u8tbSX0zBPaubz9PYHW7FhAjoy8Y2V1KCrmHhBLzdsFgaS+RXdT07wvrGnJ2DUZSp8s8xu/Qal8NFFCCnUXIttJ9zffiFpG8bRQFf6ThA3dKwstmTibMinqNY+bFtUljdyIkPanLfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746148383; c=relaxed/simple;
	bh=kw86nuPVLkYCohDpduaq9Vfb25L0SaYqGcPejOtVH8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gxgy2P1r9TiCvl82qx8Pq/P9He4yYwO87FO9p0ylIqGYp9DpFZHHRrSAGCNXAnuLtIuMi/C68gilWUCFkIiUCN6UjKHng8o4O+FuQ1w2E52zNKbVqlR7ODfnst6sPu01eDK5w72qZDLWSbIlNwbnfkOee1tnf9HzczT7lokUcOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V6PGMwWD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V6PGMwWD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746148381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K2neMnZN51HiDqW//ekE5B1aNMq6DXqgdqUvcAEfrC4=;
	b=V6PGMwWDEWWF2ivGH+gXWDj//aO9k02m0I6KhzXSucpXFd2k4136ZDNyYYaqaqaow0eA5R
	Xm5BzoH7lYCuVT2Y9abaBh1AiUjOUWcnjM7lA/fcZuxF//KOxb3wunsc0RU4WHL7ONGN42
	L7nEUbYq4UsgRYcSGqVSL7jeHbpFDgA=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-MaTdyJGqNNuArexKMph1ww-1; Thu, 01 May 2025 21:12:59 -0400
X-MC-Unique: MaTdyJGqNNuArexKMph1ww-1
X-Mimecast-MFC-AGG-ID: MaTdyJGqNNuArexKMph1ww_1746148379
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22647ff3cf5so11931035ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 18:12:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746148379; x=1746753179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2neMnZN51HiDqW//ekE5B1aNMq6DXqgdqUvcAEfrC4=;
        b=DX3abjzdgIyTXEcF6yEd9uXApKfw75nmGgc8lciz3cJkzfPatHA+oBWgXb8czMjMnr
         OqgPW+oh5xWJtzNnWt9lIkt1Nnvr4mD2+L8Hfk8pFuXZzWbVXR//5OzznbjL4qUXC3nO
         F9AP+GwEWUwpn7YifeoimP+2dZKSH5cPQgHARVZeMgcLHfZSgvg3jF11wH9khcf/FTFn
         dSDRjTZ4VWrTNGwgjbcftjmgy8Y9oddLUvUJWq0IP5ey3Yk3vj1SFef5SyKwrbY5RTSG
         M4Hsy8p2E+rY4137DRVfu318Xui1poJdF2EiKj1s92d44MDc/852PyEiOizaVQhAsoZn
         Cucw==
X-Forwarded-Encrypted: i=1; AJvYcCUaihRid/jbAxzfbnHh0ZoQrzNEFnJtRKgqUfCANO5+ZLP6bQXeH/ryyEM04WxuhJnW99JJQXxtG8A3lls=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJwuT7KYg7cmYwJ14VbNMiz9tuMt3HSIIntRRac8vOBQ3iEKCM
	7n3VmZr2IfNOnOD9OniWsTnaN2bfCV+dDB3Hj+E5pvZaXIG69FLQjDhMbPw4QLxQYo8qhuIhV+J
	8Jd3U9t+ZpW1MlXw4haUss+GWo0cK8mXfLSnk7dAjmOwVcyQCWGwT+WKgMpld0Q==
X-Gm-Gg: ASbGnct6ucCtIcZsYGFKVD8byTgpXUEIBmwyrbVRHBFdTnMRVhUl2NiN/FbkXRp4e8g
	f2eFSDLVQ5so8s65ZRLpsifCsdhr0yV7qVNPJyIz1jYzPKAgJzagxrFglCzXMCysARVH1uslr6z
	nqSD7UqD98Dm9icg6u0J3cXEo3B9gXuDrm0ckN25nJ79BDWU7yibq+zvCEQjvMAkoSqwZLW8NAB
	U+f9wio4IvlKYvnG9W+wAAkLU4TThure5CSkQ/aQUpqNmKarPQUJ0QzBEyb73SDxdYrk9c2OPUG
	Csc=
X-Received: by 2002:a17:903:f8b:b0:220:cd9f:a180 with SMTP id d9443c01a7336-22e103891c7mr18287445ad.53.1746148378900;
        Thu, 01 May 2025 18:12:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS7W4ycz826xBQg/pNwjqNo/5dTFfvPHK3ONMEajh9YlmAw8XidmhLF5f/05azjEItTlWoxg==
X-Received: by 2002:a17:903:f8b:b0:220:cd9f:a180 with SMTP id d9443c01a7336-22e103891c7mr18287085ad.53.1746148378557;
        Thu, 01 May 2025 18:12:58 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1085aeb9sm2895405ad.60.2025.05.01.18.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 18:12:58 -0700 (PDT)
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
	Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>,
	Jan Pazdziora <jpazdziora@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v9 1/8] kexec_file: allow to place kexec_buf randomly
Date: Fri,  2 May 2025 09:12:35 +0800
Message-ID: <20250502011246.99238-2-coxu@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502011246.99238-1-coxu@redhat.com>
References: <20250502011246.99238-1-coxu@redhat.com>
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
Acked-by: Baoquan He <bhe@redhat.com>
---
 include/linux/kexec.h | 30 ++++++++++++++++++++++++++++++
 kernel/kexec_file.c   |  3 +++
 2 files changed, 33 insertions(+)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index c8971861521a..1871eaa95432 100644
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
@@ -169,6 +173,7 @@ int kexec_image_post_load_cleanup_default(struct kimage *image);
  * @buf_min:	The buffer can't be placed below this address.
  * @buf_max:	The buffer can't be placed above this address.
  * @top_down:	Allocate from top of memory.
+ * @random:	Place the buffer at a random position.
  */
 struct kexec_buf {
 	struct kimage *image;
@@ -180,8 +185,33 @@ struct kexec_buf {
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
index fba686487e3b..1180c0aa73f6 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -445,6 +445,7 @@ static int locate_mem_hole_top_down(unsigned long start, unsigned long end,
 
 	temp_end = min(end, kbuf->buf_max);
 	temp_start = temp_end - kbuf->memsz + 1;
+	kexec_random_range_start(temp_start, temp_end, kbuf, &temp_start);
 
 	do {
 		/* align down start */
@@ -489,6 +490,8 @@ static int locate_mem_hole_bottom_up(unsigned long start, unsigned long end,
 
 	temp_start = max(start, kbuf->buf_min);
 
+	kexec_random_range_start(temp_start, end, kbuf, &temp_start);
+
 	do {
 		temp_start = ALIGN(temp_start, kbuf->buf_align);
 		temp_end = temp_start + kbuf->memsz - 1;
-- 
2.49.0

