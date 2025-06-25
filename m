Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766252FCE38
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 23:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750893557; cv=none; b=fWTZSWw/Ptt3g3PYlfPTRbf8FggCg9fD3pZ8csdre6aM2beFFi9u/PzIFwzMHmQ54kPLL/7mRh0Jfft8OUTxe9rYmHhTTiN4Keq9p0b2T4DCU7nTp+UWORMb+NkD+Pcw3F3KDDyswnxYG0irANUWDZ2Lt7Amcdu26uE80D+aRas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750893557; c=relaxed/simple;
	bh=MeL5rpabCOQ9W64WCDzEoX0aCqKWSq3A09PvP5YRATc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gwstJGo5nic0vra750GDP4jcnBGnEWXGiPDiR283B/rV6Yv/Vty9hCeTjHOrjJJT4+G4THfNtA1QcYL9ruIQszZ6n+mWstYHx1SM66NArNmmVJqWtWl4MppHlP6BKlTI5c1J861hYxLAVSw+xhZiW73bwXlWH5OmPbUvVbQt5ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=B1eRO5Hg; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="B1eRO5Hg"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e73e9e18556so556528276.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1750893554; x=1751498354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+FWnE5Bow2uoaZcwISvBgq/4l5cKqkAoia4t69mDLc0=;
        b=B1eRO5HgatGq4rstuHwQb5lRLPCJUJPeYDwYtXoaXEQ6M2ydVeMdgP5sfHosPCqzX+
         826BuhtF/jpBSjO5u3Cd+iCrP6EZuAeF4wz4RAtfsPcJZDSHrbN0ug8kX514GEaI6IfH
         1HTxR5Xakww2tpQn/usIrCPwX1y8c0DJzwCGf5kSvD93mJ3XzDwh+LBjP0HOw48/JdUY
         xOnYtcV+oCc+PEIUc7ZjHB1O/cr6DZCTCT+v6avxVYgKQPF3P1fHAREVroltDj+JPWcR
         Rrz2ol7e7zdDcJGEEJe1LKpcg/jZUsxt8owjNaN31J2PanxwMS43usRsTmUcBQFkLv3h
         i3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750893554; x=1751498354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+FWnE5Bow2uoaZcwISvBgq/4l5cKqkAoia4t69mDLc0=;
        b=O4uP2MpdtbNg/QmJH8hzYKXRE/kVQD6vkPug63lAdbhCbC6vAXdtsOeLrwKMbNgVPe
         Sm1a7YfF+menw4Ddjk8gE+hJtG0ZGBb5eAV5CGRVVc6kzyBqqtmT5OdzANzmL1m28tql
         1hDmY2AfzjNUwR9h0Sf6ULgGspkFOI3y2rC2mDssvRAwgwC3pYaxxRH9fxZ3L0Uq5KoQ
         JBOyt+YRvmQYkXa6Q1O+GITRnQE0P2vOg5N2IMzqRlGgnVNVRMtaubfr0YZAcCqUfhe4
         iL9yL0m9gXgAUIoHe+AlCQdcbTJ6ZCsGVn62hupGPpyzjlwM7HUb6tO3CzzptSaw2LZ9
         Rt2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+tTN1m2L1nPQT3e6CDINbv4kFrebIC91DsBVX23/TKBBOlf4JUBCwwJNmDBnXpns0JpVncZrc1Y72FgE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHWaYm5baGeEzsuOpuIciMSOrtckT3xcTw9GS/RWsgNzL3xTmh
	X9Duo4KZtalpOob6qpTiSvtjc1sOWZ9lrkxka7fqHx21qlTqM5HSu7FcacNkrFXF7GI=
X-Gm-Gg: ASbGncsmRrVLTwrgpkqsn6qSvN8H3YXIQxsgjycsb0yEngn4NS0cwN1Q3f2Zu7wnqM9
	lbIjxsUDoxo4ii3b983xh+CwoGTGLZV3zVgnqCcVp2bYKHhuYotJgbvHgba/6PAsooOql1Muou0
	yCpGtxcWtgGfWkAFyxL4I3AYjZc+NyqWuPycSmpmuKWNvRwYwiVNx+pzjqlMOetnOZLNqv0SQkG
	Be6lM48P+20syzO5LpyKRutnFxZOujBlL0Qc0w2kmTMNti0sLz1bx3KNi+EpESjLSxju5Elxbxz
	tWS0WafIMx2P2wdGQXssnTTktRu9ZGLxkPQQ0/5EkjVd15uisRozV/OizzQDRHxQ2oTTaxxrNC9
	qAI9e1JfpA+ZXbzF0xTlK9iRzWpKxoPPflBGNoz/uePD57LILbkHE
X-Google-Smtp-Source: AGHT+IEYYs2N6RASXojR+QxIpPej80Rm+js0xnYmL5jy1Q+a192E7kIXIViEBMDkie7fGIqIBRd0Pg==
X-Received: by 2002:a05:6902:138b:b0:e81:8305:b8d9 with SMTP id 3f1490d57ef6-e879c092ef1mr2020971276.1.1750893554316;
        Wed, 25 Jun 2025 16:19:14 -0700 (PDT)
Received: from soleen.c.googlers.com.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ac5c538sm3942684276.33.2025.06.25.16.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 16:19:13 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de,
	lennart@poettering.net,
	brauner@kernel.org,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v1 18/32] reboot: call liveupdate_reboot() before kexec
Date: Wed, 25 Jun 2025 23:18:05 +0000
Message-ID: <20250625231838.1897085-19-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
References: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify the reboot() syscall handler in kernel/reboot.c to call
liveupdate_reboot() when processing the LINUX_REBOOT_CMD_KEXEC
command.

This ensures that the Live Update Orchestrator is notified just
before the kernel executes the kexec jump. The liveupdate_reboot()
function triggers the final LIVEUPDATE_FREEZE event, allowing
participating subsystems to perform last-minute state saving within
the blackout window, and transitions the LUO state machine to FROZEN.

The call is placed immediately before kernel_kexec() to ensure LUO
finalization happens at the latest possible moment before the kernel
transition.

If liveupdate_reboot() returns an error (indicating a failure during
LUO finalization), the kexec operation is aborted to prevent proceeding
with an inconsistent state.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/reboot.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index ec087827c85c..bdeb04a773db 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -13,6 +13,7 @@
 #include <linux/kexec.h>
 #include <linux/kmod.h>
 #include <linux/kmsg_dump.h>
+#include <linux/liveupdate.h>
 #include <linux/reboot.h>
 #include <linux/suspend.h>
 #include <linux/syscalls.h>
@@ -797,6 +798,9 @@ SYSCALL_DEFINE4(reboot, int, magic1, int, magic2, unsigned int, cmd,
 
 #ifdef CONFIG_KEXEC_CORE
 	case LINUX_REBOOT_CMD_KEXEC:
+		ret = liveupdate_reboot();
+		if (ret)
+			break;
 		ret = kernel_kexec();
 		break;
 #endif
-- 
2.50.0.727.gbf7dc18ff4-goog

