Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A8321FF5A;
	Mon, 19 May 2025 22:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747694036; cv=none; b=I3DZh6xSVNfj0LNJ22YrSd1ELfYdZzjsY1EY3g81cQ4Zq5rRXIHv0wWHew5Dk39ecoJEo7VlosCAMO/1rpj0OlAzPgYiE+Ip9X0gqKzXq8Jbo991IBNbuESZWTiZ5c9VWZZuQw5kIOm7n8f/y4dgQ7xldMKGKXh3ICCb8pM+yqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747694036; c=relaxed/simple;
	bh=mdjyDN1GqLCpsZy/2bMMWG1/g7ATnYg6QL8zmUB4dEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qjF9wRpuinGQ83yGDhlLpEBJYTkaKgvQldOXr3zK9ZlDOluiLa3lxwiG1jADKIlb04EstEMLaYtE+yLKUU+Jwh4EJVR0xgY/IUN2PbQjas4jTqpjMSEV/IahNY3nToa1Qajm1WZ3ymjB6EiBvy6rkPCRDCWZ+Ykjwhrw+dXjLaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gc8zR7UE; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gc8zR7UE"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4766cb762b6so56129361cf.0;
        Mon, 19 May 2025 15:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747694033; x=1748298833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBedgeD+gExl3gWB2aOy4e3KdH1CGamnabmn5JJeaHM=;
        b=Gc8zR7UE+5VjGeCNCY6rzh/3SoXhx3T2Ft9EOIaodPWSeYJwvnYt8w8uh+wHtjYXVY
         GFQ8J5nEaXeAaDLGL4js11CsYAZHtU6cFJ8sOduIY9/ZodpA1dx2BPOa2JfDrzacnI7a
         wjcRPGdIM1Q6Ft65YFM5QMyvSyS5L06YF1/11lGuWUibINzeypoW3D5YZ+FQCODX5cxy
         1bsm8RtL94DBxoWhmXu0ajqKjuvtVgnju3QgDmN3iVEVaQ9ET9d9vId4D5xfKaBrpXwP
         HGVj7CAhMyqqA2EpahONhOyJFSE5fCbQXpZ1/iPAxxORNFC8fveySKEBWEBKHr9QuBbo
         5nXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747694033; x=1748298833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QBedgeD+gExl3gWB2aOy4e3KdH1CGamnabmn5JJeaHM=;
        b=K8d4S2t2UiDrkU+em0fSGN6refVux4zawqkvzf/HgqzOcjgLvWt1C9D99oY0RNESBC
         2uGN4DGNRUFZh1t0XPOe7qpdHcxwj+HBgmV+GKIPTKH0NKwpBM7sfAsfXkIn1sjzl3jq
         m9AVNiuFRHO9Heh6cohI3IsBrYWbo6zXKRW5ad2bpxAUNRRkHbwcg1eCsfOIuFUo2EbD
         i2Aot1gy4g/II87CUKb+5RC6kViBiFQPSmWQuOnUg+aplw93ERaXm9ktliEUDV/QsxHO
         iJfNZDdhFaQm2QND0A7X4ZBICTgOB+Nm3QJaJq9HT7kspC++8ol3L/9tFRyd5s0sBcBx
         5t/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUt22HHGdTmPN3tvOlhjuQrt1KTZVhYfdwp0WErj96P9bXbpXZVnZBvZQZslLVzOiwYkLW12Ubepb8=@vger.kernel.org, AJvYcCX0l2WGb/HnQhP/A3kw3aO2ZwpwXLPkQBbzZsTlcnvr0JptpL0Dyd/vcTF0fYhU7tf1D70C+FbggKNGZBOv@vger.kernel.org
X-Gm-Message-State: AOJu0YxFB7PMw046ABuzTkbWFYR3wBFty2pCxHqiZ9k6JSzIH2jcBRXB
	32ekhXUiUunnS33En4oLbRweB+mR2LUF1bqUoFFiAKHoEtr96JNEpEL2
X-Gm-Gg: ASbGncv+nSMY5ER5Goz0sGA2y6L3n+NGCBPCvBUyEIDcKMGKqhBU4KPF8dA14PDj5yz
	EHvo1KyQ9hD003hqaF+ouIkLqhzJuVkTSpcJfguCEglvFW9NPr1KjcZddO1piVkK7ZD7oRGnP4A
	uT1cZDKBM6cTU54ZpDRz6dG8hR0aQE59UZG71HXdanehtLreEK9xlx78e/iyLvwVbctjHltKA+Q
	m+2Efl5QTYN8329Ho5xcVxmld0Mg3dNRW+WVJMx0s/ZPVd+G50JBbZvQMBfk9txi3FkYzcR1+W8
	Zjsqcz02lm+gR4dIVKY6aWOxeiWZ+J+S5Xayl3xMQ+aqa5Jd
X-Google-Smtp-Source: AGHT+IHIMtoPpH0aTMNDuPw4CtAj8gWgNrBxIjYiHH9b7GKsL6dv3EnaDjorXwPudxtkzQKEOIFtfg==
X-Received: by 2002:a05:622a:4d4f:b0:494:b8fd:b565 with SMTP id d75a77b69052e-494b8fdb73fmr226540651cf.17.1747694033571;
        Mon, 19 May 2025 15:33:53 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:4::])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae3ccfd5sm61080091cf.2.2025.05.19.15.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 15:33:53 -0700 (PDT)
From: Usama Arif <usamaarif642@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@redhat.com,
	linux-mm@kvack.org
Cc: hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	riel@surriel.com,
	ziy@nvidia.com,
	laoar.shao@gmail.com,
	baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	vbabka@suse.cz,
	jannh@google.com,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kernel-team@meta.com,
	Usama Arif <usamaarif642@gmail.com>
Subject: [PATCH v3 6/7] selftests: prctl: introduce tests for PR_THP_POLICY_DEFAULT_HUGE
Date: Mon, 19 May 2025 23:29:58 +0100
Message-ID: <20250519223307.3601786-7-usamaarif642@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250519223307.3601786-1-usamaarif642@gmail.com>
References: <20250519223307.3601786-1-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test is limited to 2M PMD THPs. It does not modify the system
settings in order to not disturb other process running in the
system.
It runs if the PMD size is 2M, if the 2M policy is set to inherit
and if the system global THP policy is set to "madvise", so that
the change in behaviour due to PR_THP_POLICY_DEFAULT_HUGE can
be seen.

This tests if:
- the process can successfully set the policy
- carry it over to the new process with fork
- if hugepage is gotten both with and without madvise
- the process can successfully reset the policy to
  PR_DEFAULT_SYSTEM
- if hugepage is gotten after the policy reset only with MADV_HUGEPAGE

Signed-off-by: Usama Arif <usamaarif642@gmail.com>
---
 tools/testing/selftests/prctl/thp_policy.c | 74 +++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/prctl/thp_policy.c b/tools/testing/selftests/prctl/thp_policy.c
index 7791d282f7c8..62cf1fa6fd28 100644
--- a/tools/testing/selftests/prctl/thp_policy.c
+++ b/tools/testing/selftests/prctl/thp_policy.c
@@ -203,6 +203,77 @@ static int test_global_always_process_nohuge(void)
 		return -1;
 }
 
+/* Global policy is madvise, process is changed to HUGE (process becomes always) */
+static int test_global_madvise_process_huge(void)
+{
+	int is_anonhuge = 0, res = 0, status = 0;
+	pid_t pid;
+
+	if (prctl(PR_SET_THP_POLICY, PR_DEFAULT_MADV_HUGEPAGE, NULL, NULL, NULL) != 0) {
+		perror("prctl failed to set process policy to always");
+		return -1;
+	}
+
+	/* Make sure prctl changes are carried across fork */
+	pid = fork();
+	if (pid < 0) {
+		perror("fork");
+		exit(EXIT_FAILURE);
+	}
+
+	res = prctl(PR_GET_THP_POLICY, NULL, NULL, NULL, NULL);
+	if (res != PR_DEFAULT_MADV_HUGEPAGE) {
+		printf("prctl PR_GET_THP_POLICY returned %d pid %d\n", res, pid);
+		goto err_out;
+	}
+
+	/* global = madvise, process = always, we should get HPs irrespective of MADV_HUGEPAGE */
+	is_anonhuge = test_mmap_thp(0);
+	if (!is_anonhuge) {
+		printf("PR_DEFAULT_MADV_HUGEPAGE set but didn't get hugepages\n");
+		goto err_out;
+	}
+
+	is_anonhuge = test_mmap_thp(1);
+	if (!is_anonhuge) {
+		printf("PR_DEFAULT_MADV_HUGEPAGE set but did't get hugepages\n");
+		goto err_out;
+	}
+
+	/* Reset to system policy */
+	if (prctl(PR_SET_THP_POLICY, PR_DEFAULT_SYSTEM, NULL, NULL, NULL) != 0) {
+		perror("prctl failed to set policy to system");
+		goto err_out;
+	}
+
+	is_anonhuge = test_mmap_thp(0);
+	if (is_anonhuge) {
+		printf("global policy is madvise\n");
+		goto err_out;
+	}
+
+	is_anonhuge = test_mmap_thp(1);
+	if (!is_anonhuge) {
+		printf("global policy is madvise\n");
+		goto err_out;
+	}
+
+	if (pid == 0) {
+		exit(EXIT_SUCCESS);
+	} else {
+		wait(&status);
+		if (WIFEXITED(status))
+			return 0;
+		else
+			return -1;
+	}
+err_out:
+	if (pid == 0)
+		exit(EXIT_FAILURE);
+	else
+		return -1;
+}
+
 int main(void)
 {
 	if (sysfs_check())
@@ -210,5 +281,6 @@ int main(void)
 
 	if (system_thp_policy == SYSTEM_POLICY_ALWAYS)
 		return test_global_always_process_nohuge();
-
+	else
+		return test_global_madvise_process_huge();
 }
-- 
2.47.1

