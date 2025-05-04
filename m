Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7265246761
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 18:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746382121; cv=none; b=IziRzJdR/DlpK+ZIMoU0qtHKPfKMGYhnD52GkDke1kWoNi/DUsdITAwCoyl4u0y+yDPsiqR1FdalIVAHSbsT23zZlx5Dk2j47qBUL/6sE7tISlpkJXq3D72N59+WKNc8I7lMypowUBkwJ/NcFNqy2Kxx4ne/lRU7i4y9OIARcpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746382121; c=relaxed/simple;
	bh=aufFQZmZYQSarpNSO8NB8pzSBQgdB+xUSvgvEsJlO7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lJgcQkVih73r+hVuZR31KO06p+QokR+JcXC3W9hH5hEKyllhnUS1oJlJ6YvO3PyAslJslgigkReBvgFPq4HpqZ+tAiIJzlQ9yxdW9bXyBJjWiiGCG7P/GuxWy8TEA0FOcIFzdkWKk0L960TXl+zcEtEr9eG7dteJIhx1oyh2/8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=UNlfU92O; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="UNlfU92O"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso5287704a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 11:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1746382117; x=1746986917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oh7ZKLOpdvDL5QRIQTPZdFrZOvqy2goAq+lldfba29E=;
        b=UNlfU92OW9tWIQ/E+1iXGQX7qmXEpEHM8L5JX/Pv+fnUKj2v39WnQ2PQKsBgTwdZzZ
         UmUFTvjvMG1uUSu6om1AsN8417gZGbXotvh/WGFFlRazxP7UG5DW6JnefAeDYVQZqNpt
         B2E5ifm1JDyvlO/BC47xzhEauKFB2VTL986Jp1HsgmI1EZTFr8rEwf4SPEdg9iyc40GO
         79PxVtHJwCb262xvWG0vMNM25CdnVxKW8NrkFkpcdzfToXiF1uzjXCc4QRrLwr6FP0zR
         sieW2aOzghwgd8zqFLqIAlP1D8eQgZoN7Hm+I0a+Qr1yGZf91hfwPszfYmVS/4m95jM/
         6Yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746382117; x=1746986917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oh7ZKLOpdvDL5QRIQTPZdFrZOvqy2goAq+lldfba29E=;
        b=pYYvySO0r1SrUl0g8T+RZw7j9ZEMTnBgEn6fNOPHtIsHhs5npqCWl/L7kLJlWaIRk1
         IH0whGOjuvZMXx1weaXM2fHy2Yxqf49bCnqdJ6qdv7/1okm095khBoTXtH7uSTSvoTkX
         asrRz/kMtxY3mV06SOXW1JyTJdqvLDQGshpaqnmJK74bfJNBK7lE4WIl/PMhsrUXu5O4
         Xe/viY89GaOrleHsIhl/TnwAbTrJi1aD1zBHihfzvUA3HjZx/8tUOpOAZn6xNnS8dvji
         j11sTOYGwbGi95cQptn/XgPvd2y1/l16u6AWXt+uJ6oxUXBO34OLE1845AHY7uG0pmE3
         HvIw==
X-Forwarded-Encrypted: i=1; AJvYcCXbmRyUtrrwjBo2FQWD3YHxNmRP1Mha5Czzf73opddU0lxWn7Hnd6DEqDja2qbkol7wAbIB3LfL76eMpoo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhumeOMXLv9aswLC37WJ6WlKmnPwtDRZc4+HZk/LuyJ9xN2jsQ
	ags1eZ1/zM4AQaqe4PXCzLpRwhje+yLSnLu9eDqugcrT1dMCeK7mw3yZ27H9HeQ=
X-Gm-Gg: ASbGnct8P4i+r6fqiEEVyjWNuuos+LfdvygcHTM5efocUlNX+o1NwRPYFi4WRtxlR6+
	FESV9WaPP8yje4RoB4tnzbL9HLYOdSlDqtHULSQJNFxpZXAX9pN+SKOu5z9SWQuJ2mCth4EOmhs
	v1gqQeqkK4cQ37IXYlihZ9I+P6SgJtoMPXfa7XndNFDv0rRAVMYZQW+iOoEtyfMNkMvDbdiqhEm
	YYF5f16TV0qhY6F+ApbK6NTeY3Ord36IJbztpknmzb7Q2hJmgA7e00o+NZz+Bp0CrmyOXEFh0lP
	aFbYNzFO6ufm/licyZhqzhsi1srqRRH46lPk5w2111kRiyyZ6trQK9k/GPjOIIv/hqKlLt3J99c
	efWNifizuw29579Wzb85V68NcApiW4/dg/FkV7T4ttDJIj9iIKEU=
X-Google-Smtp-Source: AGHT+IGkMpPc4/jaxjTRr67yNGeZjBAz+C1MrHBZanic9YXbZYojEKw+1vkhaCNVuQ+meba3Tx1CNQ==
X-Received: by 2002:a05:6402:2345:b0:5fa:a369:7fc0 with SMTP id 4fb4d7f45d1cf-5faa7f8c059mr5383817a12.18.1746382116931;
        Sun, 04 May 2025 11:08:36 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77b914b4sm4077440a12.51.2025.05.04.11.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 11:08:36 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: akpm@linux-foundation.org,
	song@kernel.org,
	joel.granados@kernel.org,
	dianders@chromium.org,
	cminyard@mvista.com,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH v2 1/2] kernel/watchdog: add /sys/kernel/{hard,soft}lockup_count
Date: Sun,  4 May 2025 20:08:30 +0200
Message-ID: <20250504180831.4190860-2-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504180831.4190860-1-max.kellermann@ionos.com>
References: <20250504180831.4190860-1-max.kellermann@ionos.com>
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
v1 -> v2: added documentation; added patch set cover letter with
  justification
---
 .../ABI/testing/sysfs-kernel-hardlockup_count |  7 +++
 .../ABI/testing/sysfs-kernel-softlockup_count |  7 +++
 kernel/watchdog.c                             | 53 +++++++++++++++++++
 3 files changed, 67 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-hardlockup_count
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-softlockup_count

diff --git a/Documentation/ABI/testing/sysfs-kernel-hardlockup_count b/Documentation/ABI/testing/sysfs-kernel-hardlockup_count
new file mode 100644
index 000000000000..dfdd4078b077
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-kernel-hardlockup_count
@@ -0,0 +1,7 @@
+What:		/sys/kernel/hardlockup_count
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
+Description:
+		Shows how many times the system has detected a hard lockup since last boot.
+		Available only if CONFIG_HARDLOCKUP_DETECTOR is enabled.
diff --git a/Documentation/ABI/testing/sysfs-kernel-softlockup_count b/Documentation/ABI/testing/sysfs-kernel-softlockup_count
new file mode 100644
index 000000000000..337ff5531b5f
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-kernel-softlockup_count
@@ -0,0 +1,7 @@
+What:		/sys/kernel/softlockup_count
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
+Description:
+		Shows how many times the system has detected a soft lockup since last boot.
+		Available only if CONFIG_SOFTLOCKUP_DETECTOR is enabled.
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

