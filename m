Received: from mail-vk1-f201.google.com (mail-vk1-f201.google.com [209.85.221.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B307A277008
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 18:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746730014; cv=none; b=nSZufVPKoFzM7/4E1MpYiOJ5if4OFREgA+e9yWJgUvig3Gxb9N3iaXdtkXUN5nX1Fi2hULBpc5iTm23Gs1cgShlpytdTZfBpt0qWZM8Mp/w/KT+A9atdC+iysK77AHrW633lG+yKG/dfTYswKPHZCvzLC9EeSC6HyIXjGVPpJKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746730014; c=relaxed/simple;
	bh=ID+kESnpGV9XC5UpFrnA1MTFIrRsvE/G+IFXut8ZjKI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EwGv50HEYAlg16+gP0vAA54yYhrIMGiXTcAbGybxFUDDpdalzQAD41FuTA4v9f+QsQjyJWVAl4G2XHRpwo80FlCoIFlYxXBLKG8IZCYAuKGnhl5BCX7Z6YVBc6J8HDg0z7ENksAdw7hBTGxPe42ZsSR9Po3zbrjBbCpGlw57e70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XTuHkBIT; arc=none smtp.client-ip=209.85.221.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XTuHkBIT"
Received: by mail-vk1-f201.google.com with SMTP id 71dfb90a1353d-52af857ae54so347294e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 11:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746730011; x=1747334811; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hxkkjg5u6Lgu9hSFXDjlO0GOLkT7I31/k4lHPDm8iZ0=;
        b=XTuHkBITXygWOn5VP/fp4Okh4nE4Sv44/bX80NCtPdgud8x0s5pL4JYqaFdsQv+Y6H
         fWhbKZNfVQ9JCJZJEOj6iXINjIKVjHK3qq2oKLbCw2S9ilJO56buiPXigUX0xGOPtmV2
         Vrom+O3Pj8fi3P2cwpEez69ix06p1NQHyUgRhuNJ5bHRucvFPwq9Ffe0oHvoNdnI20wW
         SLaS9fBxAJVuGS/EwLwJU1nQKn0IdLx/3uJPP1ud8hxCynxEWAngRdr4GgllV+aEiVEX
         fzSYuU1z61cDWrg8h1AYaZchdtIG4fEHO728bX3U59MJfIemiHLOiDkLs8P8wZ/XNoep
         FicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746730011; x=1747334811;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hxkkjg5u6Lgu9hSFXDjlO0GOLkT7I31/k4lHPDm8iZ0=;
        b=NitW70/PQQh/fiHPDBFKLOzXGHsva85XQnDloAsLoV9Yf1wrgrqbU1ulRY382LNRQh
         UuZ4ohzazJl4wC3wnYbZpvYzH/gu9M21qSip+C/60anzixerwx800GMDcE9zcpMnetf1
         L6EGY4dADQUDJiWbINexboUXJ80dZCmP4r0ZYMUv5TD7nbbhgM5+Jn/jPQZVI11Od4kG
         /dAbnZUYArTFJdADBnAMH1b2iCW/drfyGvXc305PWgZh4qLQOoJl0sDwkyyoc6dZr8BI
         qoDRP+J9ECSWTJAJboe1JUfk2Dsag7Evc8y22aMjxOULKQHkjHjiAP8CpUikvdhstrLz
         7vng==
X-Forwarded-Encrypted: i=1; AJvYcCVSEjeL4/cbetcvfm+kkvBbBB6KB6KN/Bc1RyqZSDAA3VvDZof5ocqa1SD61BLDuPADLmigDn1QaEW9yUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWp0VxAvShv5GF2YxaRhUJNbBrYLDOWIdMtM/pehtzqHMydSu5
	7iRzDE8y3KR3XffAegmObZ65qM1AtmqrmjZ+XWq8HMUvS/G8PE4tG8NKgsI32ugdoWL9k6vQ9KN
	rxO74yCxEi7NLhuV0KQ==
X-Google-Smtp-Source: AGHT+IHvbfgIWOhtssbanXIq57gUuQkyH7+nzkAOyeL8z91e6IyZf0dy8+Xf3YfxbrenPkYR/Im4OMTBcB25PxoE
X-Received: from vsbhy11.prod.google.com ([2002:a67:e7cb:0:b0:4be:5ff1:69d6])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:15a0:b0:4dd:b9bc:df71 with SMTP id ada2fe7eead31-4deed3552b0mr662515137.10.1746730011602;
 Thu, 08 May 2025 11:46:51 -0700 (PDT)
Date: Thu,  8 May 2025 18:46:42 +0000
In-Reply-To: <20250508184649.2576210-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250508184649.2576210-1-jthoughton@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250508184649.2576210-2-jthoughton@google.com>
Subject: [PATCH v4 1/7] KVM: selftests: Extract guts of THP accessor to
 standalone sysfs helpers
From: James Houghton <jthoughton@google.com>
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org
Cc: Maxim Levitsky <mlevitsk@redhat.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, mkoutny@suse.com, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Yu Zhao <yuzhao@google.com>, 
	David Matlack <dmatlack@google.com>, James Houghton <jthoughton@google.com>, cgroups@vger.kernel.org, 
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
2.49.0.1015.ga840276032-goog

