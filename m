Received: from mail-vk1-f201.google.com (mail-vk1-f201.google.com [209.85.221.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CC63C47B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743456634; cv=none; b=sWD+PGgcfgtz5MUGREUvbwtP7mnCgHwYTTWimk8qdCwMempWhMt83MhBRr4mtFfVFVW/J6K5CfpMuTfxRycs4UApUgRLvj9r0mVBZUEOk2XMuDb7853PaRiAJEOnSiiEBkpVdEjwTB2F/2qdBs35U6M8BuJBNf5v67K38AQg3sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743456634; c=relaxed/simple;
	bh=QVzyFescXVWpRPbHhysiEv6lNMR7Z84PTEV+3tefm0Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qTZRLo8w4EEMvaNzFpy2IixeqfbBrkp2JRX4PRiczmw+AKU+yp1Gi4rgWgH4xazjBK8FTi8a0E5opyPC4xHuhwbxDlsk2Fl+iY21aULk4ruT1uvHKorEN7tmuBUZxEON8E5CA30EfXaNDYeumzKQqw4ozDjej4RxLeEa3DtgO1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fz+Uxl4Y; arc=none smtp.client-ip=209.85.221.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fz+Uxl4Y"
Received: by mail-vk1-f201.google.com with SMTP id 71dfb90a1353d-523f74690afso1063497e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 14:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743456632; x=1744061432; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=42KzVy5OOxbX2nRYaugEY43/RWNtB+bmjk11XtO+x8A=;
        b=Fz+Uxl4YzmkYqXYrJ/sJbzTzRTBjv7YsGcxg9+0rWaOTL/jX4IsGuxInosI0ACCvLD
         5DL0DbKrHF5J479+gC1oIn3zzqszj4oo6JbuNYqFtb9wdyZTORHU3TYFcc5pygfQMLAd
         tICNtGbfEhk6voOu5iCX0tDP+L4zkorV1zR+0WYiAr1fFFa/qUbSMHWR/nnrDIt7e6Oe
         KPkl81PAtQsYB7t2MzpOph8gI07eoVx573LHr9fdLlWuu0n704umZOpj0sq/9+I6pWME
         zTmVKRmndHo5hLjmzo32iihKCGrrVjWp6QAfrG24KfEQtlgz/CRZ/HXHWCJEq5yQw5jb
         cWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743456632; x=1744061432;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=42KzVy5OOxbX2nRYaugEY43/RWNtB+bmjk11XtO+x8A=;
        b=mgQHxm3ZF9ee+D08UfnfK0ECgjynL0s/ImqX/hZ8gNUGroCGIFEJyBElMGdmBur67r
         yzttxwEBmqvPqZmv9Gv9PT3CxW8MMpCn7BaFOeSBikLIBmwzhlAyhBgoVeNRj0g/M872
         T4wRlMhZ9WLZ7xpx/UFuQtcyE7tq/gZOreBrLounpHh332oXQ0UuvTnu7Hk3Vcad+1xl
         YdHR73H86FAdUsdAuNMla5isKUzvYWaMPIa0scV//NXgMHslEPEKCP7Bc1chmTAOpRFU
         OS9OzjpV6C1nCY85N7pevmdh5yWwD6Cy1Z/c+EQsk69eMmjPEDLwSjhA44tSKZPyTyz4
         1f0A==
X-Forwarded-Encrypted: i=1; AJvYcCXI8qvP6CSyUhu3COE7MW0YlUj01VIYdbVQPZUS7QSoeURFDAa/u8SlPPew6fNHuEtEcxs96om/BP5ca2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YygT125y1qaIkAFjTWpmXUGIaQ+9P7zQFeGPQqXkTt7pIb9/lOz
	Jw92FK4FI3CWUk2KQi8hYCcPZxhzRiEaMVRrr9V5yTDSsFKpWVVO6VZLC8gXjqT3BpW9CvwcoXn
	Cd2iszZMB5o4nIdA3wQ==
X-Google-Smtp-Source: AGHT+IH1S5Pqrxcnd6Psp4+cbC6TmHHG0jz3SYfEB8vHri/pTtyy440S8+fa1zRdaeI5w8d7xLGt0MgU/VoSpbkI
X-Received: from vkci17.prod.google.com ([2002:a05:6122:62f1:b0:526:98a:f3d2])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6122:218b:b0:520:51a4:b81c with SMTP id 71dfb90a1353d-5261d478794mr5909701e0c.6.1743456632248;
 Mon, 31 Mar 2025 14:30:32 -0700 (PDT)
Date: Mon, 31 Mar 2025 21:30:21 +0000
In-Reply-To: <20250331213025.3602082-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250331213025.3602082-1-jthoughton@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250331213025.3602082-2-jthoughton@google.com>
Subject: [PATCH v2 1/5] KVM: selftests: Extract guts of THP accessor to
 standalone sysfs helpers
From: James Houghton <jthoughton@google.com>
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org
Cc: Maxim Levitsky <mlevitsk@redhat.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, mkoutny@suse.com, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Yu Zhao <yuzhao@google.com>, 
	James Houghton <jthoughton@google.com>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Sean Christopherson <seanjc@google.com>

Extract the guts of thp_configured() and get_trans_hugepagesz() to
standalone helpers so that the core logic can be reused for other sysfs
files, e.g. to query numa_balancing.

Opportunistically assert that the initial fscanf() read at least one byte,
and add a comment explaining the second call to fscanf().

Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
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
2.49.0.472.ge94155a9ec-goog

