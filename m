Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FDB2E2669
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750167439; cv=none; b=GJt+6dPrC49AaFJ4MkR3eaWLc25Ai94FUQOMTxklGnMKTk20qLu/2FqoIRf2a7PNU+Og2u4RXO8UHQtV8h0BboBh1I768JZ9BHPu/hlmfsj+QFncnjPba1I+kSbzOUweokqyp+pEWjhwVbr7bPKtrJiW4l7y30SxRt31XkuiulI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750167439; c=relaxed/simple;
	bh=rSH5gK1fIkc3yCi10jUMhm+yvhNwSkp/JROUVa650dM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dKFBIt6uAP7MMIAdIeWmKQVg4lBYM+edfXiOqcwmBZbQLV2pXql46ygxl2QNCXRg4RXwVmXXRIHf1sW/Q/51EfsaEQ0n+QZ1+p6BZFbjxm7Hc2Ze9Qf5nqfzaT1jgmg8H4TXzfZ5zQHsMxjXQiFqbRD6L0X8iYqONezLHkVFEzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Y7lQxTXL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Y7lQxTXL"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso51521975e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750167436; x=1750772236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Cwa1eZzqX2/leDkDIYGlKmwMA4P+ywGvHcq/aUim7E=;
        b=Y7lQxTXLZWCFbO4Qd9hLPoQunlBpG9xId7JfQpy2iTqlXEm/NFiQy0ccZEvTUte9jB
         V8L2Bv5EXlUyvcEdlZwA/P9LceOo+3FDBQyfX75nq3KIHFnseL2MsbIptT1EIsvLP9IR
         uh8ktUtX26GQyRVEhX+loqNPPjT9Fzj7Cb6SSygKIWec/OZRreHWAfffx+g767amMOOx
         dmbJare+U7g3ZmjVpCtcJFVkdGeA+XeOHjGhSzdk2bBRzLAN8VgY4/VrtdbjoAPfqwtL
         zEpaTNuPo5xMVcvW1OL0kMvQZL5xiUL85qtNuPlQQlmx7mp22fHTZycPMu1rdvwWilLJ
         x1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750167436; x=1750772236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Cwa1eZzqX2/leDkDIYGlKmwMA4P+ywGvHcq/aUim7E=;
        b=fMmRWfL4evstM+d5RA+goHGX4c1+INwNuKtqt0ndUFSY3DSdHZhdw+oln+JbGP7vTT
         t+HCEimucVrnwJX1104KvAw9XCVWdaDfyr0fQL1wLVcK8Zm1mFa+RPgYpwMQsk3Mv6JW
         SIzxZb7geAyPOcv0/4aDF4m74DAJEdWwRCuR/RTbJSjxYDNw/PlPgLO+YURzhuQW0aD6
         /D20k1/Y11SkXkn2X3SGz3ttaNPlxlLdo8vwdj2a8GcofQlgoLv02EOYA/HUiQK57IQt
         lC/GH/bnNPvsZJM63KtNJeAanyDdv+9TwG1jffTcDOCqzeUZCqbaFI/KjDSZLM3o+MwV
         HqkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtPhOR/aukWWXQTsJhjP2AWNNKjEBvVlQcJIXYHHzuK7u8xUo4K0Q2Y5Eg/MFvhJ0MBbY8dtxdXFo11Ow=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOieOUR9DoxWGgpa1npXbj9iEkfZ+mo4C0SdAK6Asj0wPfEoqN
	O5T3mh58imRytWZBnPJuFpBdl8flc0aeByzd4vDLlDm/GtcMySmVmzylQX0M8wniqTw=
X-Gm-Gg: ASbGncv87dZ7lS1Ahb04KdqN5a74r/gX2ky7F9jLZzJ8ez1xrlYwHB2nXVmbaQU2LIE
	kHhdX8Jh2XcqWLgB+UdXUKMI94TTWRatbk+epi3d0NV9HnlCBuhyZwdftX8ndabulZ4csSPjGHl
	E6VCAlxMIh0uW+G9h/q/cETEPEjwZx9UapmJ7jpDvr9DttnqbiOrfaLA/uY7AHNflO4LJMWTyxO
	ibJgKthUbseLq/ZtbUhuOA9MePO49nI1PkU2R5qjXCmgcr7zUwqeJXGerlWEqfC3imW3omsjXil
	lgQOB7Gwzirsw3r3DZfigpkpLQNlh1jrXpxA9hsdA+j3DsGxpd+hIVt2kYP6KT57sRPPsglr1uU
	=
X-Google-Smtp-Source: AGHT+IHu5Zs1DYnyygk8kqdnLgNMGefyGQi3YXLTpFpVjd2SefB+BljZFx/TaAfAHa8CxRgcfYTSMw==
X-Received: by 2002:a05:600c:528e:b0:450:cabd:b4a9 with SMTP id 5b1f17b1804b1-4533cacb7dcmr114989205e9.29.1750167435624;
        Tue, 17 Jun 2025 06:37:15 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e224888sm179494365e9.1.2025.06.17.06.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:37:15 -0700 (PDT)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Shuah Khan <shuah@kernel.org>
Subject: [PATCH 2/4] selftests: cgroup: Add support for named v1 hierarchies in test_core
Date: Tue, 17 Jun 2025 15:36:54 +0200
Message-ID: <20250617133701.400095-3-mkoutny@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617133701.400095-1-mkoutny@suse.com>
References: <20250617133701.400095-1-mkoutny@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This comes useful when using selftests from mainline on older
kernels/setups that still rely on cgroup v1.
The core tests that rely on v2 specific features are skipped, the
remaining ones are adjusted to work with a v1 hierarchy.

The expected output on v1 system:
	ok 1 # SKIP test_cgcore_internal_process_constraint
	ok 2 # SKIP test_cgcore_top_down_constraint_enable
	ok 3 # SKIP test_cgcore_top_down_constraint_disable
	ok 4 # SKIP test_cgcore_no_internal_process_constraint_on_threads
	ok 5 # SKIP test_cgcore_parent_becomes_threaded
	ok 6 # SKIP test_cgcore_invalid_domain
	ok 7 # SKIP test_cgcore_populated
	ok 8 test_cgcore_proc_migration
	ok 9 test_cgcore_thread_migration
	ok 10 test_cgcore_destroy
	ok 11 test_cgcore_lesser_euid_open
	ok 12 # SKIP test_cgcore_lesser_ns_open

Signed-off-by: Michal Koutný <mkoutny@suse.com>
---
 tools/testing/selftests/cgroup/test_core.c | 31 ++++++++++++++++++----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_core.c b/tools/testing/selftests/cgroup/test_core.c
index 0c4cc4e5fc8c2..338e276aae5da 100644
--- a/tools/testing/selftests/cgroup/test_core.c
+++ b/tools/testing/selftests/cgroup/test_core.c
@@ -148,6 +148,9 @@ static int test_cgcore_populated(const char *root)
 	int cgroup_fd = -EBADF;
 	pid_t pid;
 
+	if (cg_test_v1_named)
+		return KSFT_SKIP;
+
 	cg_test_a = cg_name(root, "cg_test_a");
 	cg_test_b = cg_name(root, "cg_test_a/cg_test_b");
 	cg_test_c = cg_name(root, "cg_test_a/cg_test_b/cg_test_c");
@@ -277,6 +280,9 @@ static int test_cgcore_invalid_domain(const char *root)
 	int ret = KSFT_FAIL;
 	char *grandparent = NULL, *parent = NULL, *child = NULL;
 
+	if (cg_test_v1_named)
+		return KSFT_SKIP;
+
 	grandparent = cg_name(root, "cg_test_grandparent");
 	parent = cg_name(root, "cg_test_grandparent/cg_test_parent");
 	child = cg_name(root, "cg_test_grandparent/cg_test_parent/cg_test_child");
@@ -339,6 +345,9 @@ static int test_cgcore_parent_becomes_threaded(const char *root)
 	int ret = KSFT_FAIL;
 	char *parent = NULL, *child = NULL;
 
+	if (cg_test_v1_named)
+		return KSFT_SKIP;
+
 	parent = cg_name(root, "cg_test_parent");
 	child = cg_name(root, "cg_test_parent/cg_test_child");
 	if (!parent || !child)
@@ -378,7 +387,8 @@ static int test_cgcore_no_internal_process_constraint_on_threads(const char *roo
 	int ret = KSFT_FAIL;
 	char *parent = NULL, *child = NULL;
 
-	if (cg_read_strstr(root, "cgroup.controllers", "cpu") ||
+	if (cg_test_v1_named ||
+	    cg_read_strstr(root, "cgroup.controllers", "cpu") ||
 	    cg_write(root, "cgroup.subtree_control", "+cpu")) {
 		ret = KSFT_SKIP;
 		goto cleanup;
@@ -430,6 +440,9 @@ static int test_cgcore_top_down_constraint_enable(const char *root)
 	int ret = KSFT_FAIL;
 	char *parent = NULL, *child = NULL;
 
+	if (cg_test_v1_named)
+		return KSFT_SKIP;
+
 	parent = cg_name(root, "cg_test_parent");
 	child = cg_name(root, "cg_test_parent/cg_test_child");
 	if (!parent || !child)
@@ -465,6 +478,9 @@ static int test_cgcore_top_down_constraint_disable(const char *root)
 	int ret = KSFT_FAIL;
 	char *parent = NULL, *child = NULL;
 
+	if (cg_test_v1_named)
+		return KSFT_SKIP;
+
 	parent = cg_name(root, "cg_test_parent");
 	child = cg_name(root, "cg_test_parent/cg_test_child");
 	if (!parent || !child)
@@ -506,6 +522,9 @@ static int test_cgcore_internal_process_constraint(const char *root)
 	int ret = KSFT_FAIL;
 	char *parent = NULL, *child = NULL;
 
+	if (cg_test_v1_named)
+		return KSFT_SKIP;
+
 	parent = cg_name(root, "cg_test_parent");
 	child = cg_name(root, "cg_test_parent/cg_test_child");
 	if (!parent || !child)
@@ -642,10 +661,12 @@ static int test_cgcore_thread_migration(const char *root)
 	if (cg_create(grps[2]))
 		goto cleanup;
 
-	if (cg_write(grps[1], "cgroup.type", "threaded"))
-		goto cleanup;
-	if (cg_write(grps[2], "cgroup.type", "threaded"))
-		goto cleanup;
+	if (!cg_test_v1_named) {
+		if (cg_write(grps[1], "cgroup.type", "threaded"))
+			goto cleanup;
+		if (cg_write(grps[2], "cgroup.type", "threaded"))
+			goto cleanup;
+	}
 
 	if (cg_enter_current(grps[1]))
 		goto cleanup;
-- 
2.49.0

