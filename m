Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D561991CB
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 18:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746382121; cv=none; b=Gw6jByn85DY/rMlMjLprb6P0iny12PP9GfB8gcmmbn2erJ4vQkxeM7x5UWbA9KFZ8e6fwe/ACv/zVxN25CdsLVbJ1YxIjl8BFqKIni036pcN0+vnSqcDSEas4P8ynX2qiLCx7YUmKmDrcWJt7jsNgbSSsBZh/0VC6IRM7a6JHFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746382121; c=relaxed/simple;
	bh=RO0QnTqU2f+kpP+fYV6DAVxELN6mtwVD7rA7bqb1hv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pDqMUdRCxg5nm7D1HtuSEPrp0u5vmW9PZS0A+6RlDbV4mGOtQqp9rh/g0Az+oz1txmft1mnxWWJ2LCcHZjIDHgkv6B5pFFusL7/ejUFXqw788SECyebjERtEW65hd1GQu2TxEX9SJlqE2zxUrPfcGsuNgobuqPXtmrkD3Lc56nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=J80yXLuh; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="J80yXLuh"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f4d28d9fd8so5042418a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 11:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1746382118; x=1746986918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nx+/lTeCEvkDtMckaylOjdXOIewINsWfPKZm7BFTIBA=;
        b=J80yXLuhkZX9UetaGN/iaM0s2iJMPflfrmKXfLkV6CQiCG6SbmjIq742RxWHNsEZ2O
         otUV3ZXHC85uG4oNKb+AkaMmoEYwtZciDGP3ErqMlnEiil7jNVH/ROgE62wPVZFNk+Ls
         MPEo3CGXUsOE05BDgT0yOw74c+7u8ofksW5MDcZ1Ot70yi1461sDhffE/W3+1/VYjgd7
         MIRI9wQ7Oy34VDN9wLDrq+Qrz7pgOHHzrXEAWBSPjLVj7xv1vdQsHuFDxfZ+MG/iGgA3
         QdLS5p3yUVqiYx3KcMNcTrr9SftBVyNnbw31CNLwbjjEB+avWmXKSCAktGBMPINiYajf
         HKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746382118; x=1746986918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nx+/lTeCEvkDtMckaylOjdXOIewINsWfPKZm7BFTIBA=;
        b=Ui1+NZwa6qS4Ul1Zdmd6rFxEYccJIgE4c0u92QMBxq7NVxKnh2HLDQAa6XFdhweh28
         zklcqfq1F/q/XTvTXdWuHIE4kdnKNqoYsA2wZGW9OSeg/iCeP3qyjOX//Lztc85rzrqS
         CHjoSFC3L/UYYRL0REzrdzPtju+z3M5DRWyEdyRC/r68USQcwfqN3y+9GyQ/V0FTSF/5
         QJoZrTjTrAnBtQmXRG2p6E7StFLtT1suMVBynQ07hqfuM30yZsDtb5jiTwIYhzJWF09H
         M+hLw9/J8eVI8sv+rrjIJlD6fO3JmL5rlcUFwuioIABE9PE2KNg4NWKZhQ5edLvDibKn
         Jkkg==
X-Forwarded-Encrypted: i=1; AJvYcCW+t6T8aByy2RFgUzrhn+Z6/DndLI9PzrApT4B1zWBSpeExxySTR2JT6IPz0S3J6tXqOr5a0IjoXvCSKuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzmMvCceAQmNhmiiOmOZdaQaOUy+3DPox/NTW8lI6nDgluBd8+
	MuqqwDeW7nljAOPjkLxcmup9+fr+ZX5MAN2Fwu8+bdo3B+fnIQd5XSGb/Ta8r4k=
X-Gm-Gg: ASbGncuNuOOD4OtaROBacYAwgLSdHRMnCOeOmbYSAY2AC1VnDcTlGvcihWSETyZTiSc
	DsvKNfXF5XW+TgrOBodg7BN66sHQx+SRuzM0JXwXr2DLkGv8fPZpyyL0Ar41X6LlPTIcgsq2VBi
	QiAitxMkVMlRUVzijIG0O0LGzoLsRJX5oQPQHEmLYgpjCRsQjgTPa3hwGU8/G7As3DKghnP6Kth
	D400tmCmeqc7M08Fj7P8chsVudnInGIRqbhdJnyCSZ/eI9C8YogNeWnrk6CsDhokz9pk4hHyPol
	U6OBfl6pGbmXpt63YDRHYo7m7KAymXKcUcTV/V6YxbqXxs13sxWBzB5WhZ8cLyxkZalLCdKLKo7
	lY2e33/ZtWdWiMZvGuPhjUI5aklDlR1ALTSgoksa4
X-Google-Smtp-Source: AGHT+IHFjuxBQ4zU8J5fRvY4cFPLvFj1fMxKqPbvy4B29W9JmOwHYDlxkSCsrf5W7k8F/AIlIS4DeA==
X-Received: by 2002:a05:6402:5244:b0:5fb:1bee:70a with SMTP id 4fb4d7f45d1cf-5fb1bee0937mr153870a12.28.1746382117626;
        Sun, 04 May 2025 11:08:37 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77b914b4sm4077440a12.51.2025.05.04.11.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 11:08:37 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: akpm@linux-foundation.org,
	song@kernel.org,
	joel.granados@kernel.org,
	dianders@chromium.org,
	cminyard@mvista.com,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH v2 2/2] kernel/rcu/tree_stall: add /sys/kernel/rcu_stall_count
Date: Sun,  4 May 2025 20:08:31 +0200
Message-ID: <20250504180831.4190860-3-max.kellermann@ionos.com>
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

Exposing a simple counter to userspace for monitoring tools.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
v1 -> v2: added documentation
---
 .../ABI/testing/sysfs-kernel-rcu_stall_count  |  6 +++++
 kernel/rcu/tree_stall.h                       | 26 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-rcu_stall_count

diff --git a/Documentation/ABI/testing/sysfs-kernel-rcu_stall_count b/Documentation/ABI/testing/sysfs-kernel-rcu_stall_count
new file mode 100644
index 000000000000..a4a97a7f4a4d
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-kernel-rcu_stall_count
@@ -0,0 +1,6 @@
+What:		/sys/kernel/rcu_stall_count
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
+Description:
+		Shows how many times the system has detected an RCU stall since last boot.
diff --git a/kernel/rcu/tree_stall.h b/kernel/rcu/tree_stall.h
index 925fcdad5dea..158330524795 100644
--- a/kernel/rcu/tree_stall.h
+++ b/kernel/rcu/tree_stall.h
@@ -20,6 +20,28 @@
 int sysctl_panic_on_rcu_stall __read_mostly;
 int sysctl_max_rcu_stall_to_panic __read_mostly;
 
+#ifdef CONFIG_SYSFS
+
+static unsigned int rcu_stall_count;
+
+static ssize_t rcu_stall_count_show(struct kobject *kobj, struct kobj_attribute *attr,
+				    char *page)
+{
+	return sysfs_emit(page, "%u\n", rcu_stall_count);
+}
+
+static struct kobj_attribute rcu_stall_count_attr = __ATTR_RO(rcu_stall_count);
+
+static __init int kernel_rcu_stall_sysfs_init(void)
+{
+	sysfs_add_file_to_group(kernel_kobj, &rcu_stall_count_attr.attr, NULL);
+	return 0;
+}
+
+late_initcall(kernel_rcu_stall_sysfs_init);
+
+#endif // CONFIG_SYSFS
+
 #ifdef CONFIG_PROVE_RCU
 #define RCU_STALL_DELAY_DELTA		(5 * HZ)
 #else
@@ -784,6 +806,10 @@ static void check_cpu_stall(struct rcu_data *rdp)
 		if (kvm_check_and_clear_guest_paused())
 			return;
 
+#ifdef CONFIG_SYSFS
+		++rcu_stall_count;
+#endif
+
 		rcu_stall_notifier_call_chain(RCU_STALL_NOTIFY_NORM, (void *)j - gps);
 		if (READ_ONCE(csd_lock_suppress_rcu_stall) && csd_lock_is_stuck()) {
 			pr_err("INFO: %s detected stall, but suppressed full report due to a stuck CSD-lock.\n", rcu_state.name);
-- 
2.47.2

