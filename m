Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7D327A90A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701035; cv=none; b=PVe1EHPQONwF02BLN7g0fmrsY/lIdLGmOS1m3WE+tf/7ueRl6WqwzY7/we8aWxu2JOZaWKzMHjc1bfBwmtAbSioUFt4HdjSX0QylG5UjjLaUC7UvfuwpQvCbbAgigAT8yeJLodP6fO7dYfOn5fjCDPINBzgAa2wcBUyfwIEOGXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701035; c=relaxed/simple;
	bh=5/Q6wZAHlAFmRAc6PTdxw7FebEdY0c1THxnkixSJjak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pST73zvKK/S5wG7ZsNdXRu6iNR8DfaTeV7cVcM3frIIDw3QnikLhFyZGYpOaFG1HC6IvK+n2innZz7U8TQV3SWZ85ggOzGcGbce/B2xszQ3cJdFSLw/uOMGZ//jmPNkNbRangB0z7vJapfSlivMCbl3mSc+4RGyUP72F3pK//zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GMar4xyC; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GMar4xyC"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736aa9d0f2aso5848685b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744701033; x=1745305833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMq8j0+T2PKoYo9dFG4yyaez3NXQz/XEaR/01iGoF+0=;
        b=GMar4xyClu9m1y/TQ7v0sxLCogMMh2pPHp8Nt3sGNzWeN4f/YzWXhlAb1tQDw+qEKL
         DpwZIi3Xb2GrPME4y2c0agDCSFbhn/T73JQdKRPuxHknfkJcRpUOENmPfS98N+b0CBOV
         qQE5Y7yP1ZGT7Z8AKZywdnT7I4LWVcq0sZQfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744701033; x=1745305833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMq8j0+T2PKoYo9dFG4yyaez3NXQz/XEaR/01iGoF+0=;
        b=QudCfGUDS+2NH4DryHwKZzkDhIgEk7ZutMHbWqAg2BJcCK3KJYMFDpmjQlmexawRA6
         Q7WuXMpOt7XzSO+VsD1R6YOT2PPOjoZoMeSr7er9Md6SIjYvvQR1QR1EuM+MF88/762i
         OZVbj7pbsZeRKLSWRL1RlIcGK4kHdYLmasIfyVjs60lwyTBZSZhLaZi0ckEZ6IltZ+9R
         9GmHmVxD2MA0s2q/QHOfnT/GEtYxsG+TmsnuN/Rqzb2HjrOOeKwe+OnHYh9rtYLQ/Eni
         jkvezZ6eepJKknT8K8lzdtv5NyGhvh6uTOoLP2hzXqtbUNQeJFxVECsx3SdHntrUeYm3
         5ZLw==
X-Forwarded-Encrypted: i=1; AJvYcCVdZGOUIFD/W5UvBYNntQJj1xJB3PpJI64dDhQroeZogN1sK+r3zEvn03+3i2ckoGQhsJbSG/1dmP1tFm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeFRQRgkOnlp9tzeaaqDVJumgzwj6rMY/kUCX7fXi/gYKfV7/V
	WUvpCvASa1Q2HTArERLh0OQC0Zo+iWn7U0rElO59sYqGJM3P+vHPMnxSELGpCw==
X-Gm-Gg: ASbGncurCgvA5qJUuVkOWo9sfiwoyCHtOaNsAK7v31X5jiuk8lWPQ9nwJxrrNk+ey2I
	zCtIDrazLanAkKrVvjp+jH5wgINl0+ygqQc8FQW75AMgCj5tJZxbw0i4ofzSMBWwr6R1quqnDlI
	UlQEhhuIBlyyaMz2Gadyf+AbauWCGELWvPwmwCez30NYL8fXMuFtMLx3fyedf9tGvqsiON9cLn2
	VearPh+Dh1SjwJuVVFLu5lnK+MDPzNwOjZBNlJRQtY2Et3ZZfwaiMN5ih2R1GTQvPxYw4b3mmpW
	BRctZ0TD1H/3sVlSV7WEdc9jQaitaa9mWM49PPRGV6+m0nvY+74pBNkDilingMgpQ8yEr0WcyG3
	IpKAdZPUeBXkhw73ALcAdHtH6b/0tdsvC
X-Google-Smtp-Source: AGHT+IETMONHFj3vtnyzyN1Hl4JTwNESRGr7vfO1xrjSKAxvHZMIIVgKsrXxTSZx103zJLRD3NHWTQ==
X-Received: by 2002:a05:6a21:3a96:b0:1f5:730b:e09a with SMTP id adf61e73a8af0-201797ae1e3mr22020972637.20.1744701033333;
        Tue, 15 Apr 2025 00:10:33 -0700 (PDT)
Received: from li-cloudtop.c.googlers.com.com (132.197.125.34.bc.googleusercontent.com. [34.125.197.132])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a2d3a250sm8659543a12.62.2025.04.15.00.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:10:32 -0700 (PDT)
From: Li Li <dualli@chromium.org>
To: dualli@google.com,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	donald.hunter@gmail.com,
	gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	maco@android.com,
	joel@joelfernandes.org,
	brauner@kernel.org,
	cmllamas@google.com,
	surenb@google.com,
	omosnace@redhat.com,
	shuah@kernel.org,
	arnd@arndb.de,
	masahiroy@kernel.org,
	bagasdotme@gmail.com,
	horms@kernel.org,
	tweek@google.com,
	paul@paul-moore.com,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	netdev@vger.kernel.org,
	selinux@vger.kernel.org,
	hridya@google.com
Cc: smoreland@google.com,
	ynaffit@google.com,
	kernel-team@android.com
Subject: [PATCH v17 3/3] binder: transaction report binder_features flag
Date: Tue, 15 Apr 2025 00:10:17 -0700
Message-ID: <20250415071017.3261009-4-dualli@chromium.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
In-Reply-To: <20250415071017.3261009-1-dualli@chromium.org>
References: <20250415071017.3261009-1-dualli@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Li <dualli@google.com>

Add a flag to binder_features to indicate that the transaction report
feature via generic netlink is available.

Signed-off-by: Li Li <dualli@google.com>
---
 drivers/android/binderfs.c                                | 8 ++++++++
 .../selftests/filesystems/binderfs/binderfs_test.c        | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/android/binderfs.c b/drivers/android/binderfs.c
index 98da8c4eea59..bf9c3becca1e 100644
--- a/drivers/android/binderfs.c
+++ b/drivers/android/binderfs.c
@@ -59,6 +59,7 @@ struct binder_features {
 	bool oneway_spam_detection;
 	bool extended_error;
 	bool freeze_notification;
+	bool transaction_report;
 };
 
 static const struct constant_table binderfs_param_stats[] = {
@@ -76,6 +77,7 @@ static struct binder_features binder_features = {
 	.oneway_spam_detection = true,
 	.extended_error = true,
 	.freeze_notification = true,
+	.transaction_report = true,
 };
 
 static inline struct binderfs_info *BINDERFS_SB(const struct super_block *sb)
@@ -619,6 +621,12 @@ static int init_binder_features(struct super_block *sb)
 	if (IS_ERR(dentry))
 		return PTR_ERR(dentry);
 
+	dentry = binderfs_create_file(dir, "transaction_report",
+				      &binder_features_fops,
+				      &binder_features.transaction_report);
+	if (IS_ERR(dentry))
+		return PTR_ERR(dentry);
+
 	return 0;
 }
 
diff --git a/tools/testing/selftests/filesystems/binderfs/binderfs_test.c b/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
index 81db85a5cc16..39a68078a79b 100644
--- a/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
+++ b/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
@@ -65,6 +65,7 @@ static int __do_binderfs_test(struct __test_metadata *_metadata)
 		"oneway_spam_detection",
 		"extended_error",
 		"freeze_notification",
+		"transaction_report",
 	};
 
 	change_mountns(_metadata);
-- 
2.49.0.604.gff1f9ca942-goog

