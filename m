Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AB3260A48
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 17:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739294340; cv=none; b=igRsdKWDO17C02w0dEwEuKy8iSKgqMmImnn+HcNGbAQILbrVfu+FCvmXddgtrhTEwVuZYsV82BjAw3GuCMXlluNgAW7Ma6GpUH0VCYeDySzmPVJqqb3m/MLNEkI4irT4jK1j+xbNEzr+CZaXSHKE170tpqCJCLYgV9V7l4eDYcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739294340; c=relaxed/simple;
	bh=46fylAvEHtnXMlyZUGGrL1coSoEAkjdGaGeULPheuaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nw0m9pQB26xqIOo5QTjgFB5rrbYTQuV1Rlxoa6AH7889MG2+A0kE+1LP7SlpsAxE5WWOEo3uOiTVgiTJEkXrGcoflfZ04tMGN4REAkAzq6pmmYvC2kJzH2cwKA79jjCgJHcM9IjOD2qr0zK9sIGXudYmo3hQ5OIeWMeieLnXI9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzIgmVIR; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzIgmVIR"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f74c4e586so62416455ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739294338; x=1739899138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IvTs3sUoPdnFwabnWM6p9qo099kdAYJODbc1UEXBy8U=;
        b=OzIgmVIRUCGd3evk2QJF4mJrsKBeoVFPNMygUbVMpPW7clq2PMRiWQXCGZmyymLKIc
         yObRYHtwDWr6/1Sztze1XNIZU4yxKRI0oZQLI74VMpf4goKGCF44Ihys1Eycqf6LdQL9
         di+DzqB98EVbIWbtJ59k+neiUt+L98iriaXZzLGvf3loeFkyuB91274b42EhurR6Zup+
         ew5Lh1MALE+nW/Q7x+B0R42sXf2hrr5M82Wlz0Q7WNwhAIJMZDii6CbKHSzuJC5zKV0B
         Z7vACVsfwOlFRG7jORF7SSMwf0A2R4mOndglwQC9xUAM19n4xVQPNFtpt5y2mUIVsW9T
         VXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294338; x=1739899138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvTs3sUoPdnFwabnWM6p9qo099kdAYJODbc1UEXBy8U=;
        b=Lk3EKi4N/RI4SGde6qg7vGRHeeWOgwVsD7k9nRLJDpvlmkguPLpwAdUVLJrwVBqqwL
         8Y15rm11NF8UkQ0pv0it8A+1+GZ4w1pVQprMev/mD6xXE6usfrUy+wGKd4Z2tGv6ltVl
         ioESsUHHvaNbOfcLbfccN99JiDd2izY5rdpDnW8zsRewrQOVZMbdgdmBFc8SYmPdit29
         lbUuNgED4sQ0EMuQqC/jh2r7hKsB5Pm41PwUjC/JZ2uBx2Nq3/OeN6m0PfuKN7YVSIIv
         sFq40s2XWpVMfNs6vukN0nFX3jCQ86cq1zsn2URZskFS5gt3VxGq+McNDkzKnR3YvNH2
         ZeCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfGltyr9eIBdExd0CWm8L77dMmA0csBxy5pyctnZ+KAw5AbOfRj37eqejgAU9/MtWJQW8s4c0u0yZzydI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+0pE7cCLbuRxhAlMtKv1YB4WQ3+FQgsNNRIcv+/hWVTLyiAwl
	cJ02APQH7fiUizmC3NGKS+AZVEf2TPcdJ30U1F1h8GV3cet+MQy9
X-Gm-Gg: ASbGncuk4Ocn+wX4RztIxcSOkw31pdFFyNUnuUNWm9NSw8HDZrssyP1INn4/JC8yy2q
	Q/JVcwELmp1A866lgS9Sm1Nt5GSoqh/f/ARa/77L56z5TFsSurqqmnXn6ezgmRFobebdwPjaJaF
	u1WSokml0VWZN+Bdy9ub0+6kCunz4UcJLMlTUtnz5wsNAOn+kbl24eeKFv+S/vD6rFyY48TlQdi
	QYDCpUzxZZIdHpYhxe01Jpfx28TrDTY4EUqlvcawTgo9Wfth4Aa+sTuyaol+8cOrxD7uV4OTXCA
	SM8neSHwYu8raQ==
X-Google-Smtp-Source: AGHT+IHGyEMJg6t4z4hfLWHpwGxDh0+tcPeAiBL2zQ2M1KTtye6HXBjLORl4c29q3fPTksaPmwVmBQ==
X-Received: by 2002:a05:6a00:1884:b0:730:927c:d451 with SMTP id d2e1a72fcca58-73217f8cb8amr7070819b3a.20.1739294337814;
        Tue, 11 Feb 2025 09:18:57 -0800 (PST)
Received: from fedora.nitk.ac.in ([2400:4f20:11:c00::100:3432])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7308540cb30sm4802452b3a.115.2025.02.11.09.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:18:57 -0800 (PST)
From: Devaansh Kumar <devaanshk840@gmail.com>
To: tj@kernel.org,
	void@manifault.com
Cc: Devaansh Kumar <devaanshk840@gmail.com>,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] sched_ext: selftests: Fix grammar in tests description
Date: Tue, 11 Feb 2025 22:48:48 +0530
Message-ID: <20250211171851.1518556-1-devaanshk840@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed grammar for a few tests of sched_ext.

Signed-off-by: Devaansh Kumar <devaanshk840@gmail.com>
---
 tools/testing/selftests/sched_ext/init_enable_count.c | 2 +-
 tools/testing/selftests/sched_ext/maybe_null.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/sched_ext/init_enable_count.c b/tools/testing/selftests/sched_ext/init_enable_count.c
index 0f3eddc7a17a..eddf9e0e26e7 100644
--- a/tools/testing/selftests/sched_ext/init_enable_count.c
+++ b/tools/testing/selftests/sched_ext/init_enable_count.c
@@ -150,7 +150,7 @@ static enum scx_test_status run(void *ctx)
 
 struct scx_test init_enable_count = {
 	.name = "init_enable_count",
-	.description = "Verify we do the correct amount of counting of init, "
+	.description = "Verify we correctly count the occurrences of init, "
 		       "enable, etc callbacks.",
 	.run = run,
 };
diff --git a/tools/testing/selftests/sched_ext/maybe_null.c b/tools/testing/selftests/sched_ext/maybe_null.c
index 31cfafb0cf65..aacf0c58ca4f 100644
--- a/tools/testing/selftests/sched_ext/maybe_null.c
+++ b/tools/testing/selftests/sched_ext/maybe_null.c
@@ -43,7 +43,7 @@ static enum scx_test_status run(void *ctx)
 
 struct scx_test maybe_null = {
 	.name = "maybe_null",
-	.description = "Verify if PTR_MAYBE_NULL work for .dispatch",
+	.description = "Verify if PTR_MAYBE_NULL works for .dispatch",
 	.run = run,
 };
 REGISTER_SCX_TEST(&maybe_null)
-- 
2.47.1

