Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9134F19D8A2;
	Thu, 15 May 2025 13:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747316131; cv=none; b=sMQts+QIcXcEePC7M1DUPq+oa+u27x/poieNWgZBSZxK44h/bhOi0hEA35ezDqzwdmPH59XBVvUnFNYI8E9pdTAjaMkjPzBvms179lLGhDm5jfoMJqp28u3HuhJ7QE3jN46c03fEx84L56+8iBQe22oM1ph4zx8XxKJNvXNuI4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747316131; c=relaxed/simple;
	bh=hGGuJghPcdb6HZzVWly862+7+gPR+zLj1lYd2lXjcq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P1+iOxDg8U6W9r5ZKhawb+p1kcDQ/kd09mmtGbFQLWTIGRjtTCF5IKyPW/jCLjq6oInrcQ0XrdExFQW0dPCGpTxXZKmm3F987ItNssl7qC2DxPYqaG9rPqlDauiA9+x18AiwV8AE5Hj9tPN5P25uV64WF1fiF+9n6KZcXcfBBU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSB21ncE; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSB21ncE"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4769aef457bso11905671cf.2;
        Thu, 15 May 2025 06:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747316128; x=1747920928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtvBBE4lYcv74+ivoM7qVOvxBm5IPUDZF94M62uE0Ws=;
        b=LSB21ncEoA1Y4S/xV3877x5D1o14lRtmtgPWKH0SszGuUWaqSucEu7w01nGEuALOgp
         CdSmpPQdiGzKmuxuSm1hqznQTm9vE1aG/8I+Hyj3DZ+LfgqDCne3e66LMSjrXoXtjlkM
         KBTd/OOthowWVqVCynafqnN4mq00dFdkBIeo8LwWcruaerqJvfidLHUJ4xANJQMKH2ah
         yqQ753jZzvweSeTGlX6KKqKO0XW7zEyBd5Ei5FnFxuX7YqDIBIzuu0dM1nbO1o5IJov9
         5nGQL8vUUeSqyYknKhh0rexuV2aHNpgqgytgt6D1ouHEw2GDqe1jWT5IYAgVlvv0z1d8
         OucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747316128; x=1747920928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CtvBBE4lYcv74+ivoM7qVOvxBm5IPUDZF94M62uE0Ws=;
        b=OwNvy27x8L9Sh/prNkophgB2uMo7r17z+VrAbj4e8toknt/0K6u9a3mZ4+U6BwmRLx
         nPdvQ5095pECFDio7UpVcTGyg5jNe023RCcqg4tMbBYJwRBUdbkNS1PrjFjUVVpghedp
         RveYDmRGaAWohQkA0f88Nyx+O2hoylug9Ov+xybA4lMOEib5ZlTXEemL0CXZ0c6bauFx
         MjEYEwlfoEUXPMVUlwhP9l+RZFsa3h5uxQyYNWGBne2Qj2yoxKAdmGhjgG1JPkfwJA4l
         8xflNUmIoemv/x+7/mocrCZNamhA9h6oLH0g3xXWTTdYorDwFHfaIVXhOTZZMZdpweub
         BcSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuc6MwIamiMYOYOjU66GnHlcYSaUEIeycTV9Vh3l83/lTdf6QVJsz4LOqzJO8lbd2JFIazbANlWlk=@vger.kernel.org, AJvYcCXGAqH6Ru0QVMM88ryI6ufGg3MmvQvqF/kXoULyaOgwBX0DzOppeoxX3MFYSjhGPy3FImjMVy7UJHDMXl1T@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuc2cB7iDo7FVvAI7PjcIBXYD5iUHuxEbfwFulW1eH5dRBdaLJ
	W7m/4tzLUW7m/Zr9kbNpW2wmNEfjWeKzNIcoYJ/6nxituMhU1M01
X-Gm-Gg: ASbGncvvw47JCEllwcrlgkhcRIeBPjw58tYxH+MbSq3T4xmnn0fOTvHTXp2B6RhZxK/
	CyG7hDWLYSLGJYEjmiX+Cj8fMo26mx3kjVU7BQKQFaV0wA55iPl/HSgeTPQ/yi4gA4b3zlcdqlj
	ZqqFYRG8l8d10ch/DubzRt7XlLQgp6EIQ48kIo9Nm2Yab7de9/Epagp7UpkP9q3w5EbHhMzpdD8
	i7N2F3VV9Z7Qkm9zxQ8kVc/VHwqfOwrpHxgGydgE9pi2MjpZxJ9dgZrdd3COR9m4G7WnTGHiUTR
	sg+gov+dJF+OxKAO1jWAl0x09UrYQsKK7ls+rrDIBpA48RH6DQ==
X-Google-Smtp-Source: AGHT+IGpjYwWV/atpzk9s+akSVbxFw4jbJE0V5Wxe+VGDRYZR+hyAhZAfK6FVTg+z4k/TOeXDtcybw==
X-Received: by 2002:a05:622a:1f9a:b0:48a:582a:64de with SMTP id d75a77b69052e-49495c61e14mr104644551cf.7.1747316128395;
        Thu, 15 May 2025 06:35:28 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:72::])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4945248964dsm92002391cf.21.2025.05.15.06.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 06:35:28 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kernel-team@meta.com,
	Usama Arif <usamaarif642@gmail.com>
Subject: [PATCH 5/6] selftests: prctl: introduce tests for PR_THP_POLICY_DEFAULT_HUGE
Date: Thu, 15 May 2025 14:33:34 +0100
Message-ID: <20250515133519.2779639-6-usamaarif642@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250515133519.2779639-1-usamaarif642@gmail.com>
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
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
  PR_THP_POLICY_SYSTEM
- if hugepage is gotten after the policy reset only with MADV_HUGEPAGE

Signed-off-by: Usama Arif <usamaarif642@gmail.com>
---
 tools/testing/selftests/prctl/thp_policy.c | 74 +++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/prctl/thp_policy.c b/tools/testing/selftests/prctl/thp_policy.c
index e39872a6d429..65c87f99423e 100644
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
+	if (prctl(PR_SET_THP_POLICY, PR_THP_POLICY_DEFAULT_HUGE, NULL, NULL, NULL) != 0) {
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
+	if (res != PR_THP_POLICY_DEFAULT_HUGE) {
+		printf("prctl PR_GET_THP_POLICY returned %d pid %d\n", res, pid);
+		goto err_out;
+	}
+
+	/* global = madvise, process = always, we should get HPs irrespective of MADV_HUGEPAGE */
+	is_anonhuge = test_mmap_thp(0);
+	if (!is_anonhuge) {
+		printf("PR_THP_POLICY_DEFAULT_HUGE set but didn't get hugepages\n");
+		goto err_out;
+	}
+
+	is_anonhuge = test_mmap_thp(1);
+	if (!is_anonhuge) {
+		printf("PR_THP_POLICY_DEFAULT_HUGE set but did't get hugepages\n");
+		goto err_out;
+	}
+
+	/* Reset to system policy */
+	if (prctl(PR_SET_THP_POLICY, PR_THP_POLICY_SYSTEM, NULL, NULL, NULL) != 0) {
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

