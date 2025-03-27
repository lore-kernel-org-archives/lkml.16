Received: from mail-qv1-f74.google.com (mail-qv1-f74.google.com [209.85.219.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1F378F59
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 01:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743038694; cv=none; b=OVUjOE4jg8cVUZQ2ZC2XBbH3FDHobAKujBA6BG8uqph+Yz703xxDJsc7pGw70ReQBdnbB8kEWYAfWDXQj8rmg83NBfuSOLaHwSX6yPmXLr60wo3YUWgkewn48beevBcv3EJFiutYSnVq2VJ9cVcro6I6d5e2ORoMa2yIWE7XMjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743038694; c=relaxed/simple;
	bh=sVPmJtk+M0QFe2DpgpAtXxhYDfGr4TqJUl6HVgYb1yE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=h8fpvw1HHgukeTS5ufXMB5XUZKzlmJ4K8/Alge70o4XYYouEtQL213y4DMF1TOd3QEzls4SBuFDX6XbYHAO+0jtqvo9b9juHX9VIPcl3PBa7iPDXFiRHuDnQoGhfxQjanTgCk76JOC7ZwElZCujlLbmARpl15mP9/rs2zG80xu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NDgnPe2H; arc=none smtp.client-ip=209.85.219.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NDgnPe2H"
Received: by mail-qv1-f74.google.com with SMTP id 6a1803df08f44-6e91a184588so10995346d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 18:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743038691; x=1743643491; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=liGs0zsmCzXyApDpxJa5hQb5aVWUAwjiM/fW15pHclY=;
        b=NDgnPe2HKi3P7wPlUM9MeskIM3MiwgVMz+sUgld+TwKnpcFg4vxMhlQlm6JNALCqxh
         iDl29Crucip5+l6BRze2apweoyfR9Y8/+zmeqBSH/JkTWM6jSAO1k1PScLGINCsaouTu
         AGuVD31gTbGOixL4Pk25AqwEFc4ebX2u219f43uHEoKmCziX0QJNSzIWEaYQODc+kC3j
         LpVpkp6NiuN7Vmhhoc5zXaTU9kDWK8tE5VTub6ugCCJKuUPX0ac2XGYYLiZy2vXYP/VY
         A1pKSrDIO87df6y5UIOYhHO22Ci98A/H7/jkw7UGw5Z+xeNX4qWJ74+UdgqcLeryPlcX
         wk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743038691; x=1743643491;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=liGs0zsmCzXyApDpxJa5hQb5aVWUAwjiM/fW15pHclY=;
        b=oIQkJYDPqBJNp4ey0mx6weiiq9c52jpidsT6+f6ICSYEuBMm/7PBNIIEFv3Gn/kFBI
         kC8o84zvj5tym8+VCRIoQEuXC6XojaYiS/VFfnv5fWuX0SI9FkG8yBYX7KR6v7uMR935
         4+VqtOJi8xmm18Jpj+YHfCplB3BfT3jgwjflFPGr7jHBIwlNGEfdcVnSzESrF9ZySZNj
         71249OCm38KN1tDG+FYlQqqSdETWOBewsadcVF5Z5951Eo6u/BqHoJ5j2JJYTp+kCrLc
         yWwL8WCA5QhcbZXIhw+BJ8s9/vDNwNlhPye0GzuGLZHxsL9q9QiLO5S2Ic8RymQoJMLB
         lc7A==
X-Forwarded-Encrypted: i=1; AJvYcCUbMeKnnHQGKHIVVdxIM6/BlyXo+iNSsSCCs3O82oJATaY90RcjQ0iHYJovi3DsReRVwIJ6zseAR3kJQh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYJ17mLu2B2MT9WfGnsvx1Sa94HX/1v+R2rAgM0KvdE9NisPut
	MYA2PatUxFNkotxm5oo1fWPt9qF0rSJcZBYAQSnDM1w0XfXfqanNAvLeS8+jlpBeKk+nFLhCjOA
	5MsL8rJAgMuaXP+6hMg==
X-Google-Smtp-Source: AGHT+IH7BAFDxR8LyIf/cCmDc14HH7jyC//3aG9i1kJW7Fvp8ZskK6kVxOKCBos5v4Y1+Vq5kmrmwnBeThHJhsNb
X-Received: from qvbrf3.prod.google.com ([2002:a05:6214:5f83:b0:6ec:dd52:e52c])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6214:2585:b0:6e8:fbe2:2db0 with SMTP id 6a1803df08f44-6ed23912adfmr23153566d6.30.1743038691331;
 Wed, 26 Mar 2025 18:24:51 -0700 (PDT)
Date: Thu, 27 Mar 2025 01:23:46 +0000
In-Reply-To: <20250327012350.1135621-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250327012350.1135621-1-jthoughton@google.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250327012350.1135621-2-jthoughton@google.com>
Subject: [PATCH 1/5] KVM: selftests: Extract guts of THP accessor to
 standalone sysfs helpers
From: James Houghton <jthoughton@google.com>
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org
Cc: Maxim Levitsky <mlevitsk@redhat.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, mkoutny@suse.com, 
	Yu Zhao <yuzhao@google.com>, James Houghton <jthoughton@google.com>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Sean Christopherson <seanjc@google.com>

Extract the guts of thp_configured() and get_trans_hugepagesz() to
standalone helpers so that the core logic can be reused for other sysfs
files, e.g. to query numa_balancing.

Opportunistically assert that the initial fscanf() read at least one byte,
and add a comment explaining the second call to fscanf().

Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/kvm/lib/test_util.c | 35 ++++++++++++++-------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/test_util.c b/tools/testing/selftests/kvm/lib/test_util.c
index 8ed0b74ae8373..3dc8538f5d696 100644
--- a/tools/testing/selftests/kvm/lib/test_util.c
+++ b/tools/testing/selftests/kvm/lib/test_util.c
@@ -132,37 +132,50 @@ void print_skip(const char *fmt, ...)
 	puts(", skipping test");
 }
 
-bool thp_configured(void)
+static bool test_sysfs_path(const char *path)
 {
-	int ret;
 	struct stat statbuf;
+	int ret;
 
-	ret = stat("/sys/kernel/mm/transparent_hugepage", &statbuf);
+	ret = stat(path, &statbuf);
 	TEST_ASSERT(ret == 0 || (ret == -1 && errno == ENOENT),
-		    "Error in stating /sys/kernel/mm/transparent_hugepage");
+		    "Error in stat()ing '%s'", path);
 
 	return ret == 0;
 }
 
-size_t get_trans_hugepagesz(void)
+bool thp_configured(void)
+{
+	return test_sysfs_path("/sys/kernel/mm/transparent_hugepage");
+}
+
+static size_t get_sysfs_val(const char *path)
 {
 	size_t size;
 	FILE *f;
 	int ret;
 
-	TEST_ASSERT(thp_configured(), "THP is not configured in host kernel");
-
-	f = fopen("/sys/kernel/mm/transparent_hugepage/hpage_pmd_size", "r");
-	TEST_ASSERT(f != NULL, "Error in opening transparent_hugepage/hpage_pmd_size");
+	f = fopen(path, "r");
+	TEST_ASSERT(f, "Error opening '%s'", path);
 
 	ret = fscanf(f, "%ld", &size);
+	TEST_ASSERT(ret > 0, "Error reading '%s'", path);
+
+	/* Re-scan the input stream to verify the entire file was read. */
 	ret = fscanf(f, "%ld", &size);
-	TEST_ASSERT(ret < 1, "Error reading transparent_hugepage/hpage_pmd_size");
-	fclose(f);
+	TEST_ASSERT(ret < 1, "Error reading '%s'", path);
 
+	fclose(f);
 	return size;
 }
 
+size_t get_trans_hugepagesz(void)
+{
+	TEST_ASSERT(thp_configured(), "THP is not configured in host kernel");
+
+	return get_sysfs_val("/sys/kernel/mm/transparent_hugepage/hpage_pmd_size");
+}
+
 size_t get_def_hugetlb_pagesz(void)
 {
 	char buf[64];
-- 
2.49.0.395.g12beb8f557-goog

