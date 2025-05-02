Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ED223C4E4
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 10:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746182351; cv=none; b=eTzoWTVuuUeArCOe/qRmCJlqzUUYt2hqjtiS4Uut7ER6LvJqP8WphCZl44kRmeHRfurGj+BMMw/3l1U+2SL5di3JCzbLntsBjahPk6kPSjGqI/CQaLnEecIX7LMZZA11Ay5FRQAuUVFAUdnIFb7BWkll02De/bL193uKW7pNg2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746182351; c=relaxed/simple;
	bh=C9bqEmm3kramZyyM1PP0llBLUiugdMK+MXIMYOhipxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lR6OM+b+5C9uviHUWoJmu5c3i6I38gLtRKxTOBEP3c5DmsBlnF5wukno/WoL2nVGmvpQLV7oAqGc/4iQCxeciz7Ods9OREiEEJC3lWRyFXzZ9sSKuysTBDzxVZeBBfKvZEUID2LosD57AImketipuyXc7H9Im4k9zPLSXm76sLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=SkshiVWn; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="SkshiVWn"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f4d6d6aaabso2879303a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 03:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1746182347; x=1746787147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nh6OyTEaRIP4JEj3g79TeNhKXaJQFCWid10EPU50POc=;
        b=SkshiVWnbrv4XuY1Sylvo3VQCTn2aDHkOVD63yetww8disM9gdFzdMFstlp+zmOA7v
         2lJodCVsXHW1JicVbAPsjraLB9ng6AiFFUKWX02BiQkxH01rH0RDKQPpBxmZIYOxgCA1
         ZGLh0rPHH0z3d1xk40TdkrZJ/PqkhIqnw7c2njxa5vwgUPl5FZXQzzkMsmUEuoj+4aKx
         eAyK3r2fgtt3x/bG2Px0wcmMPzMaCSW9hGf2T44ELzpQxaOVHX/oSlvuccfjaWCQVNiU
         /yAxnV+AiNPi1UKpVjIbjqg1P+NTX6YQbsZ9PVOoug+0X/uvdsCCfi5038oqGUnU4F4y
         osdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746182347; x=1746787147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nh6OyTEaRIP4JEj3g79TeNhKXaJQFCWid10EPU50POc=;
        b=no9bVsLaVTFtOOeNvfcEYu3EYeM54W1/8m0Yx1ssdHH6XFeXS8z8IhLaSKlrNqCOp0
         BnOSR8sJ6tpPrHtcYKdpsOnhWfJevFTxE5M4XsNQPPjZbcHDu6YZKQ/HKJa3E0lt1fNq
         bFkg5OKAn3+g+bKeVxzedwaFGXj6bPO9Tyup8tf48g1QIoNFl4WpkoXUdFmWinuzxp8f
         wmAsTx57wnh8VDQBPKdSkimxoFSk3FxJHA3qfpiBjr8l2o2UnDZTfbq23BXCUzJmRqk6
         AUbG+4cj/RidP9UmEYP6K26E4E/lDT+uovbXjdeP1ZJ8+bAHPi2Cj7YSASzzaxqrDdYu
         dlpA==
X-Forwarded-Encrypted: i=1; AJvYcCUhXeL5wFVHtqelYq3MzEkz5DhjvefQrvstct11sepagr2evgXtHhSneWBrVJiyJOQ3L+MwoqVBufRz6uk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoMT5yCAge2BimzB1CTDQj8uRX5JKLLKwASOW2RVjW52GIA+yH
	AuDYlHvrCpjJ4YKXnDh1OcUA0/3cYX3svzpIUB8x8UBOLc8cGAgZtIZQOVR/etCv5D10MDwgTnJ
	v
X-Gm-Gg: ASbGnctsA4k1HYFk3qmYsrJOB/vkmOLLbfLAZZAQx2NQT1KnJrBcnEavQRdpoLSs9jJ
	lwtyYQzN8ok05bzHLI9pthSBbpDn7cJF5l+aB1dc6EUDvc7mKcdaDGggEuWHl5SsivHmEmbJV10
	EQw0AA4oXLX3g+tumtgplIwuRHoOp7bEQLAeeg4skJVz+nZK5BOB53aLmpCUUA/01/UtAepWqGX
	13+351uRXemHJt3daq4vuj3HFD2xh23ks5c8n/SfTR5SEsEWWW/5UOjly6h+w1q+0hlW+3G9/IU
	ArAI7B313xm73C7RU3yzFJcLgDgpqRkMPj1d/zRpGrGP+QIkeXvPBOs4ClvC4SYcC6vqkmUZiaU
	NPqZZP3wavmLdvO6IidTkkCijgaaWzbOvuirGFrxA
X-Google-Smtp-Source: AGHT+IGklk1vAFvyeWl3LzPI+8ph34p43t2JasY3HHBdDDlmVqcAUrvQ9NmvZqjD3Vf0x1DuCYwlCQ==
X-Received: by 2002:a17:906:730f:b0:ad0:c6ae:c0c9 with SMTP id a640c23a62f3a-ad17af4cb91mr259745966b.40.1746182347526;
        Fri, 02 May 2025 03:39:07 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c025esm28889966b.114.2025.05.02.03.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:39:07 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: akpm@linux-foundation.org,
	song@kernel.org,
	joel.granados@kernel.org,
	dianders@chromium.org,
	cminyard@mvista.com,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH 1/2] kernel/watchdog: add /sys/kernel/{hard,soft}lockup_count
Date: Fri,  2 May 2025 12:39:04 +0200
Message-ID: <20250502103905.3995477-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is /proc/sys/kernel/hung_task_detect_count,
/sys/kernel/warn_count and /sys/kernel/oops_count but there is no
userspace-accessible counter for hard/soft lockups.  Having this is
useful for monitoring tools.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 kernel/watchdog.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 9fa2af9dbf2c..09994bfb47af 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -63,6 +63,29 @@ int __read_mostly sysctl_hardlockup_all_cpu_backtrace;
  */
 unsigned int __read_mostly hardlockup_panic =
 			IS_ENABLED(CONFIG_BOOTPARAM_HARDLOCKUP_PANIC);
+
+#ifdef CONFIG_SYSFS
+
+static unsigned int hardlockup_count;
+
+static ssize_t hardlockup_count_show(struct kobject *kobj, struct kobj_attribute *attr,
+				     char *page)
+{
+	return sysfs_emit(page, "%u\n", hardlockup_count);
+}
+
+static struct kobj_attribute hardlockup_count_attr = __ATTR_RO(hardlockup_count);
+
+static __init int kernel_hardlockup_sysfs_init(void)
+{
+	sysfs_add_file_to_group(kernel_kobj, &hardlockup_count_attr.attr, NULL);
+	return 0;
+}
+
+late_initcall(kernel_hardlockup_sysfs_init);
+
+#endif // CONFIG_SYSFS
+
 /*
  * We may not want to enable hard lockup detection by default in all cases,
  * for example when running the kernel as a guest on a hypervisor. In these
@@ -169,6 +192,10 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 		unsigned int this_cpu = smp_processor_id();
 		unsigned long flags;
 
+#ifdef CONFIG_SYSFS
+		++hardlockup_count;
+#endif
+
 		/* Only print hardlockups once. */
 		if (per_cpu(watchdog_hardlockup_warned, cpu))
 			return;
@@ -311,6 +338,28 @@ unsigned int __read_mostly softlockup_panic =
 static bool softlockup_initialized __read_mostly;
 static u64 __read_mostly sample_period;
 
+#ifdef CONFIG_SYSFS
+
+static unsigned int softlockup_count;
+
+static ssize_t softlockup_count_show(struct kobject *kobj, struct kobj_attribute *attr,
+				     char *page)
+{
+	return sysfs_emit(page, "%u\n", softlockup_count);
+}
+
+static struct kobj_attribute softlockup_count_attr = __ATTR_RO(softlockup_count);
+
+static __init int kernel_softlockup_sysfs_init(void)
+{
+	sysfs_add_file_to_group(kernel_kobj, &softlockup_count_attr.attr, NULL);
+	return 0;
+}
+
+late_initcall(kernel_softlockup_sysfs_init);
+
+#endif // CONFIG_SYSFS
+
 /* Timestamp taken after the last successful reschedule. */
 static DEFINE_PER_CPU(unsigned long, watchdog_touch_ts);
 /* Timestamp of the last softlockup report. */
@@ -742,6 +791,10 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
 	touch_ts = __this_cpu_read(watchdog_touch_ts);
 	duration = is_softlockup(touch_ts, period_ts, now);
 	if (unlikely(duration)) {
+#ifdef CONFIG_SYSFS
+		++softlockup_count;
+#endif
+
 		/*
 		 * Prevent multiple soft-lockup reports if one cpu is already
 		 * engaged in dumping all cpu back traces.
-- 
2.47.2

