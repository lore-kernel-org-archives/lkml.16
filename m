Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E660239082
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 10:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746182352; cv=none; b=WUOxBid9OOCQDl1VgugPUQ98ocQBxMXbTz4AnE09ZIVRHPxyPlPyU9hYDYGBwdk0SaYlYn0CQ/3GUSTG7VrXpO7We5rvoYG81re96kVtwaOQtywi+FYsT+yQLkDiiO4uLk9J8B8ypuhW0Z0hazGceUjUtMUC2efoWh9wXLVbdpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746182352; c=relaxed/simple;
	bh=1xtJj5TgcV9ysrlW4hz+0ouhr9pvlBf5bSy7WTmom/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FB6IqRoxifXs6DiPmLtso0mVLTovfcfsi0CSDQ/pL/xMMgseyURGQwcBhYWSByX6NvMxDTvpT5sv2Ta9OdI1Qi5t/0lst1eUMuOCkRUWabzTLTVDudXlt3tmJ0aBsRxCzgvJg6KHK87gGrUROuim0ESCSsrsoGN9j3zrqG/4vQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=Wn0EUT4m; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="Wn0EUT4m"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so3204086a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 03:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1746182348; x=1746787148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2fs1eaETknFKoQfoweIhivzDo8grL/ET92EHCDB4eg=;
        b=Wn0EUT4mV0ruogqn/ja7YP74VcyKC4twGOnlVhOJvGSHoD50SP1ER/0JZMQ1acqLiu
         egKJKd+7Uf+yCfJBKvkPZpBUvdrKipuL7jeH7WTB7UYLL7OxyjZ+KxIjFERnheeLBMDD
         vbheppr/+x9w09v8jbL6XSTTNadssw6DRbU1NFlkMBjJgBeb9s0NWjuLQqsjyMqAAE4a
         YApso9x0OB+RUOdyqDjVkPqOqsUb/foX3mJ87HQSiFJ7uBrWW9LIaHEraCEcjjza79Ub
         HX5VrBsy0o4xccDgC14wn6mvlo/tV59j7xcvwhqSQE25tkkabr0ogkGrxu0XTa+8iMoW
         sYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746182348; x=1746787148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2fs1eaETknFKoQfoweIhivzDo8grL/ET92EHCDB4eg=;
        b=CkWBO2l50w0M2UU1ktLF49VV1VIsj3ZTU/Yg8wHN5zyCbbqTp7lnW8D8jDYixTzvVS
         Ub62xq7v+D2dm+YP6xxszQrsqtkto4/3LF654XJzZ4PEX9Q6wrKPgHdgQ+4xOyOoqjA7
         TnmjrZYmiqFlsPT0j6VsuLztkduizd3srvpMaFCyX2UYX3+zO3LpG2wVw+8dAOHJaCHP
         8a7zO4WTvmLnTA19asZCKtY6/vFQuJkx0jK5Vj6YmNu3tfST1yNqPnaj/pkP9ZZNRBcg
         nGencQF2mamoDdNLeQu6mEJsTJzHDSf4DVFGetkZDXggY87ql2JMKawNbN6GjfK2WIoD
         f08w==
X-Forwarded-Encrypted: i=1; AJvYcCUTJwpEExBsav5+FtUoh0gvV1oFIIThmEsX3vfDAEoaAGoIbYIGj43qmiPk0aPnidtlhlU5cNKc3MvDtY0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp82VPXeP6uDj9uErcU6MmiXixZfhsq6So5mHchrFq1ZHf4p01
	E658MwvXJdFZCCg4ypBvEIip4UIekQd7PBG/JHPxjw7lwjt1A9PLiHT6bn6YE0grqd/lsyicW+o
	H
X-Gm-Gg: ASbGncvbYOCAD6sJ8731PQLJFoq9wwQs6EU/SNU0KohtG52vxvP7ZPXC7bLFapVlugE
	fTTFnMI+rycTGqshsFPxJRORFbLkd9omCBXuRorDrAmXetc+BZu/2XhzAIW63ZNBFc156jRtznr
	FPWBj70dHtCWMAhRVH9soNHNvKr1YP21Igcaa+QdF73a1yCiT1UCXFgAnsKDrX4mxE30TrAJCFw
	Tv4vgiLgQjDJqTYtX1MNG/Kc1i7Ujru96c5vhTrut6BImSEPhg48U46UojZpI8xp+mxwGHueb94
	DSUc/lMlcFmGRbEuc2tJ17AvQViIHxej3osKhdLfoDpud3dGW+EjbuLynGt1+YJpTA7UBvaYwsn
	ZrQ86n7B+6Xug4knaGC0V0Zw5VOEtgHDKoCbasqpH
X-Google-Smtp-Source: AGHT+IHTyszrg1a3LkcAucghWKm+QsiMTHKbOEsw5NVvCGYXTNi62ZGwmLRT6Xudd37zE4DwCIobew==
X-Received: by 2002:a17:906:c14e:b0:acb:5f17:623d with SMTP id a640c23a62f3a-ad17ada647emr225716366b.24.1746182348499;
        Fri, 02 May 2025 03:39:08 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c025esm28889966b.114.2025.05.02.03.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:39:08 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: akpm@linux-foundation.org,
	song@kernel.org,
	joel.granados@kernel.org,
	dianders@chromium.org,
	cminyard@mvista.com,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH 2/2] kernel/rcu/tree_stall: add /sys/kernel/rcu_stall_count
Date: Fri,  2 May 2025 12:39:05 +0200
Message-ID: <20250502103905.3995477-2-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250502103905.3995477-1-max.kellermann@ionos.com>
References: <20250502103905.3995477-1-max.kellermann@ionos.com>
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
 kernel/rcu/tree_stall.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

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

