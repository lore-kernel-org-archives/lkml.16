Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA9D21ADC4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 21:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744147871; cv=none; b=BfD4Kj1Qkxtxe0dVoSeDFaxVJTD/sGxUzLFkYdUavnesUJ6bG7CKiDPVhDblAjweO4MmhSoGqVS3vUI4Vh7Xhd7yS+lJ6CSL5NCpdGkUvLhNa73Vj2BUrOZDqEKvII4L0nLeF4dFXUGxjXXXHxtKfs3d9HR2NxbZ+9fEcBvmwrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744147871; c=relaxed/simple;
	bh=ceuktwmE6Tz6ySyYjExWpcHUrmoXfJEVisxJS0xJM/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=i2vnPvYYYrcfbdphp1lWXji7YmPAq8fJ2yoO71Itp06bJuOLK3e5yR0e/YK+iqQ+Ohu3pNQ8E/UhtZzwR7GkAGJm0ms3LEsHR/3MRiO2+w8QVMT2Xn9LO+r0az8BYKCpI8gtMmeyCqCvOnsQBPaVtjjzemsFp4u/lJSD8vFLCho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J0XX1wBP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J0XX1wBP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744147867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zJ/vYvJFdaljL1EBPrzkdHubi4p6O3iwKoThG4V7wUE=;
	b=J0XX1wBP9n5aM4EmYi6sXDtSFw2jd+zzm3gBOCf4CjZ0NnRn8JKfrbUFFY6lu4/ndyF3zp
	2+sEO5l9eFqyyC59Gyv3wfK78lEfjZGsIr47pF/19+GopyWaG94U9ewE/Iy1gAM+gA8LUg
	wqRa9r5CvJEm+8XuQG9vDmFpxDvJt1Y=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-M_aXImNoPMC0KC4igJKe0g-1; Tue, 08 Apr 2025 17:31:06 -0400
X-MC-Unique: M_aXImNoPMC0KC4igJKe0g-1
X-Mimecast-MFC-AGG-ID: M_aXImNoPMC0KC4igJKe0g_1744147866
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47686947566so89174681cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 14:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744147866; x=1744752666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJ/vYvJFdaljL1EBPrzkdHubi4p6O3iwKoThG4V7wUE=;
        b=cZ2GGyhoSBv5oKMDrNCOTpJ6mbdaoCXGaE4QTGCtaA4oOgbUSyso/rvhMEueJlgpcI
         jbAYvQvB8IPrrgvhY2SOBezeqU+V2H9s77WCoHXXwjiIuRPURIKmAtxx46FnTEPVOhET
         Uph3iSAFauvFywe+f+2YgBiP6IFZsTqk2o3Rfalb257RdYugMgl0wj9ftlv6Rp8XvDr2
         3eLrR6JrYd/awmCObey8mi3PRGjLQcghBr1IkMOYrf1VL3WRTtph6T7DVmomSFHQGLtg
         njGpr7DscOw43hr4WWpwx/VrWxmbOhdNDH/gLWqssL75SiRGxK9aX97+yGENTrfB59sG
         J8lw==
X-Forwarded-Encrypted: i=1; AJvYcCWz/jW9zpdVenBDCiLqha8EKf8SwgUvhE/KAu7rmt4GLjtfYASxbedbsZWJZNNcFSVPfyLEkdpbXsqv0dw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGSgaIB9zagKEazLfEYkpZxMLN2HzfdYCp62Q4awVab0B86Wid
	TbRBM1aV4GRhobTl6BenJLeNp+n5S/SG0HBleyjvcy5Y6cFYhg1gJ22FO9gIRsZVZkgR9rPE+rx
	xbLGtn3WYgNcB4Ta0pEHXedJjOOU9adCUoAxgVS/tSVZszvR0ISOpf3zLVRjkMA==
X-Gm-Gg: ASbGncs9TAPjyVBIQBT+4JB+BSbAPyoSFR1EWc5qEnYIRNwBkMVfVhveiQT5qBGWu9s
	msiSJEQUhm2oC5uorzqZq/PJL6cO7PE6BgDOWTDSrAc/hTnzNe6+z5+ZbAB/o/p9VPjxhIgh4bP
	OJy9nIU4W9JD0lQOCDwI0iAyr/ke1QvCQ0aENJ8x/+jBCOaoLXZiVH57T5TYI82zC8naLy+VXRZ
	6KE1jSi4Sq6/YTeEt5DP+zYK2Qx7AdltiPHCM7xLpwftR3EtEZXhfWudM8JK4zjKXeybqV2QnmU
	x9DI2VQ99oB+MXVa1t4VnoOs6ou6tBVmkqrmi6fS9V9VAEILAOxM77UaACA=
X-Received: by 2002:ac8:5710:0:b0:472:1d98:c6df with SMTP id d75a77b69052e-4795f3830c5mr9360671cf.52.1744147866065;
        Tue, 08 Apr 2025 14:31:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaqQKFqtCmlZORrUMH7gDif9S184NDQ21l5dk4cYMD2uysBUK7u+SSTsZwMdSwHGbSJYvRkQ==
X-Received: by 2002:ac8:5710:0:b0:472:1d98:c6df with SMTP id d75a77b69052e-4795f3830c5mr9359851cf.52.1744147865368;
        Tue, 08 Apr 2025 14:31:05 -0700 (PDT)
Received: from localhost (pool-100-17-21-114.bstnma.fios.verizon.net. [100.17.21.114])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b071b42sm81639081cf.27.2025.04.08.14.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 14:31:04 -0700 (PDT)
From: Eric Chanudet <echanude@redhat.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ian Kent <ikent@redhat.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Eric Chanudet <echanude@redhat.com>,
	Alexander Larsson <alexl@redhat.com>,
	Lucas Karpinski <lkarpins@redhat.com>
Subject: [PATCH v4] fs/namespace: defer RCU sync for MNT_DETACH umount
Date: Tue,  8 Apr 2025 16:58:34 -0400
Message-ID: <20250408210350.749901-12-echanude@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Defer releasing the detached file-system when calling namespace_unlock()
during a lazy umount to return faster.

When requesting MNT_DETACH, the caller does not expect the file-system
to be shut down upon returning from the syscall. Calling
synchronize_rcu_expedited() has a significant cost on RT kernel that
defaults to rcupdate.rcu_normal_after_boot=1. Queue the detached struct
mount in a separate list and put it on a workqueue to run post RCU
grace-period.

w/o patch, 6.15-rc1 PREEMPT_RT:
perf stat -r 10 --null --pre 'mount -t tmpfs tmpfs mnt' -- umount mnt
    0.02455 +- 0.00107 seconds time elapsed  ( +-  4.36% )
perf stat -r 10 --null --pre 'mount -t tmpfs tmpfs mnt' -- umount -l mnt
    0.02555 +- 0.00114 seconds time elapsed  ( +-  4.46% )

w/ patch, 6.15-rc1 PREEMPT_RT:
perf stat -r 10 --null --pre 'mount -t tmpfs tmpfs mnt' -- umount mnt
    0.026311 +- 0.000869 seconds time elapsed  ( +-  3.30% )
perf stat -r 10 --null --pre 'mount -t tmpfs tmpfs mnt' -- umount -l mnt
    0.003194 +- 0.000160 seconds time elapsed  ( +-  5.01% )

Signed-off-by: Alexander Larsson <alexl@redhat.com>
Signed-off-by: Lucas Karpinski <lkarpins@redhat.com>
Signed-off-by: Eric Chanudet <echanude@redhat.com>
---

Attempt to re-spin this series based on the feedback received in v3 that
pointed out the need to wait the grace-period in namespace_unlock()
before calling the deferred mntput().

v4:
- Use queue_rcu_work() to defer free_mounts() for lazy umounts
- Drop lazy_unlock global and refactor using a helper
v3: https://lore.kernel.org/all/20240626201129.272750-2-lkarpins@redhat.com/
- Removed unneeded code for lazy umount case.
- Don't block within interrupt context.
v2: https://lore.kernel.org/all/20240426195429.28547-1-lkarpins@redhat.com/
- Only defer releasing umount'ed filesystems for lazy umounts
v1: https://lore.kernel.org/all/20230119205521.497401-1-echanude@redhat.com/

 fs/namespace.c | 52 +++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 45 insertions(+), 7 deletions(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index 14935a0500a2..e5b0b920dd97 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -45,6 +45,11 @@ static unsigned int m_hash_shift __ro_after_init;
 static unsigned int mp_hash_mask __ro_after_init;
 static unsigned int mp_hash_shift __ro_after_init;
 
+struct deferred_free_mounts {
+	struct rcu_work rwork;
+	struct hlist_head release_list;
+};
+
 static __initdata unsigned long mhash_entries;
 static int __init set_mhash_entries(char *str)
 {
@@ -1789,11 +1794,29 @@ static bool need_notify_mnt_list(void)
 }
 #endif
 
-static void namespace_unlock(void)
+static void free_mounts(struct hlist_head *mount_list)
 {
-	struct hlist_head head;
 	struct hlist_node *p;
 	struct mount *m;
+
+	hlist_for_each_entry_safe(m, p, mount_list, mnt_umount) {
+		hlist_del(&m->mnt_umount);
+		mntput(&m->mnt);
+	}
+}
+
+static void defer_free_mounts(struct work_struct *work)
+{
+	struct deferred_free_mounts *d = container_of(
+		to_rcu_work(work), struct deferred_free_mounts, rwork);
+
+	free_mounts(&d->release_list);
+	kfree(d);
+}
+
+static void __namespace_unlock(bool lazy)
+{
+	HLIST_HEAD(head);
 	LIST_HEAD(list);
 
 	hlist_move_list(&unmounted, &head);
@@ -1817,12 +1840,27 @@ static void namespace_unlock(void)
 	if (likely(hlist_empty(&head)))
 		return;
 
-	synchronize_rcu_expedited();
+	if (lazy) {
+		struct deferred_free_mounts *d =
+			kmalloc(sizeof(*d), GFP_KERNEL);
 
-	hlist_for_each_entry_safe(m, p, &head, mnt_umount) {
-		hlist_del(&m->mnt_umount);
-		mntput(&m->mnt);
+		if (unlikely(!d))
+			goto out;
+
+		hlist_move_list(&head, &d->release_list);
+		INIT_RCU_WORK(&d->rwork, defer_free_mounts);
+		queue_rcu_work(system_wq, &d->rwork);
+		return;
 	}
+
+out:
+	synchronize_rcu_expedited();
+	free_mounts(&head);
+}
+
+static inline void namespace_unlock(void)
+{
+	__namespace_unlock(false);
 }
 
 static inline void namespace_lock(void)
@@ -2056,7 +2094,7 @@ static int do_umount(struct mount *mnt, int flags)
 	}
 out:
 	unlock_mount_hash();
-	namespace_unlock();
+	__namespace_unlock(flags & MNT_DETACH);
 	return retval;
 }
 
-- 
2.49.0

