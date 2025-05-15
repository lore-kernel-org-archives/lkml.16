Received: from mail-qt1-f201.google.com (mail-qt1-f201.google.com [209.85.160.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C209253F2D
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747328992; cv=none; b=A9ufPKgSZQN3PQ9ng9LBGhjEViJ+UVXeN6WAdWNnFiCIvz6+t9NnEdcpx2Wj0ol6ari5fCVcXXBpQk5p8k/ZGZHpMZ6SKyJu11qc/eivrlKoZnoZgdL44RY8/f8w6x0ZRrclda2vYvBsY1mjZa1W9GnaeKM+YPbzBvGa4fs9Cxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747328992; c=relaxed/simple;
	bh=Q9EunP4ANNFlrus7pt1KAZ7Snqx9fKUE/gesX7ZumUY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=WcoJSRkq9v2i236GunH0NiNUWuPqzp25MuB/xlaxFp0YLFhPiE9Jo3m2reF2RKU5+Fvbad78Myy6+Kgfmxll1x8vZN38VqkD4C6l08jWyqokak853a4YdiWJdFQkwRTdQx0OfkD+7RNSHZuz7duB3PzKTHOXnkXVwo49BakD7Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--amoorthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ReqXb/oy; arc=none smtp.client-ip=209.85.160.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amoorthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ReqXb/oy"
Received: by mail-qt1-f201.google.com with SMTP id d75a77b69052e-4769273691dso19926191cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747328988; x=1747933788; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+0DkjbSMK5vzY64xRg+z8BFJrGXJNKGd9XdD6+HX5e8=;
        b=ReqXb/oyjv5rruSelMQjHFyWM/EV78SlANLZTQaq1NJ6VSH9aWRj0u45HIIWBhuGCk
         C+L+046kw7NACFE1dzqljvTu89fWatVZEOt1feJSgaN0ndHbvEzJ41FVnMCFU22GE4x8
         gH0LWWh9HIUABeYBZIFb3JDEkAPufImy8oicjCDv+n4Wp6LOnrOB8e7Pfs4t3x5FyQ/E
         7sk2yKogjYGwHKMtiZS8sE+qTeAMyWCG4fGQwvv5UKqyJcXw1rMjBjCnnCxzwPzFgjhJ
         Mf6sgYwdSVaUUmz+04O1U1Q8XA1SZzwxzudih4iH3Zcv2nkpXgAFNS9MiLSKGSnAqezx
         2RZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747328988; x=1747933788;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+0DkjbSMK5vzY64xRg+z8BFJrGXJNKGd9XdD6+HX5e8=;
        b=JkP0C+fbXX3+M87+JvOVckwmr2hJGuK/1niIiHFXpHJwjVYBeyPcUfnkyj70smXo1P
         /q8MRo7kJCbjcXgbmXOyExh8bDjjFDEzAtAMiuZWbqXDsnh6FtsdibKUD0pzNR3ARZoq
         FaC568NKlQm2PcbbUpOXHNsRuYt7xttGY6BCSZps2fjXan/6iks/8eAUrIOUJqhfnlvU
         NTRDcHTsZUA5wAu31BelEqYkHpgRXTePQKW8y9JiwaZyG/bvIqqLpFGs3XskVZpOXOkk
         f/3Ufn/aVVC82uaFIpgpfA1EgDmJ/UPX/26oNq/q4gKfzqdKyH8Jx9ugjU3vhfi3upuS
         aBmQ==
X-Gm-Message-State: AOJu0YyCxu1ofW/ZsKBCvt+q4+3GLr/z/aj0GN/rknhszjtIwHN4bJjI
	hdv4DSE+y0Ki6kXKcviLYoCTtcvxqRIR3a7Kq/ltEJ3EkNbaeAfW93H03foMzjhJlh2uTBPejb/
	ZfyWUIaRPS0DvvCsjPWs62LCwusfFBBoWXEdEa+sWm8IQcqw+c98FkFiczk/N2BcWhjTB1LtAwT
	ZhUyUx9lciKFnnRXmL4wEJJ/Vtz5dNiBu5HTzZ934B/Z/ySXVfMFtQmLY=
X-Google-Smtp-Source: AGHT+IGaYQYiaUxGO3+m8d6LLPF13i4deoEkXEkjChe1ODKTchDZ51zsRq6Z/zHDDbZZYcmfbrzFsseqWvcFtA==
X-Received: from qtar15.prod.google.com ([2002:ac8:5c8f:0:b0:479:b3d:4a94])
 (user=amoorthy job=prod-delivery.src-stubby-dispatcher) by
 2002:ac8:6f18:0:b0:477:5d12:aac5 with SMTP id d75a77b69052e-494ae47dbf2mr1974881cf.35.1747328988114;
 Thu, 15 May 2025 10:09:48 -0700 (PDT)
Date: Thu, 15 May 2025 17:09:45 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250515170945.278255-1-amoorthy@google.com>
Subject: [PATCH] Rename get_unused_fd_flags to get_unused_fd
From: Anish Moorthy <amoorthy@google.com>
To: linux-kernel@vger.kernel.org
Cc: Anish Moorthy <amoorthy@google.com>
Content-Type: text/plain; charset="UTF-8"

The current name can be misread as having something to do with unused
*flags*. And without a get_unused_fd() function already floating around,
it's easy to resolve this by dropping the suffix.

Signed-off-by: Anish Moorthy <amoorthy@google.com>
---
I'm not sure if there's any appetite for refactors like this: they're tedious
for sure. I couldn't find any discouragement in the docs though, so I figured
I'd just post the patch and let it find me.

Anyways, if anyone wants to regenerate the patch for some reason it's easy
enough using [1] (might take a minute or two).

[1] find . -type f -name '*.[ch]'  | xargs sed -i 's/\bget_unused_fd_flags\b/get_unused_fd/g'
    This does miss references in two files, those being
    1. Documentation/driver-api/sync_file.rst
    2. rust/kernel/fs/file.rs

 Documentation/driver-api/sync_file.rst         |  2 +-
 arch/powerpc/platforms/cell/spufs/inode.c      |  4 ++--
 arch/powerpc/platforms/pseries/papr-vpd.c      |  2 +-
 drivers/android/binder.c                       |  2 +-
 drivers/char/tpm/tpm_vtpm_proxy.c              |  2 +-
 drivers/dma-buf/dma-buf.c                      |  4 ++--
 drivers/dma-buf/sw_sync.c                      |  2 +-
 drivers/dma-buf/sync_file.c                    |  2 +-
 drivers/gpio/gpiolib-cdev.c                    |  6 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c         |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c       |  2 +-
 drivers/gpu/drm/drm_atomic_uapi.c              |  2 +-
 drivers/gpu/drm/drm_lease.c                    |  2 +-
 drivers/gpu/drm/drm_prime.c                    |  2 +-
 drivers/gpu/drm/drm_syncobj.c                  |  4 ++--
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c   |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c |  2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c           |  2 +-
 drivers/gpu/drm/virtio/virtgpu_submit.c        |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c        |  2 +-
 drivers/hv/mshv_root_main.c                    |  2 +-
 drivers/infiniband/core/rdma_core.c            |  2 +-
 drivers/iommu/iommufd/eventq.c                 |  2 +-
 drivers/iommu/iommufd/selftest.c               |  2 +-
 drivers/media/mc/mc-request.c                  |  2 +-
 drivers/misc/ntsync.c                          |  2 +-
 drivers/tty/pty.c                              |  2 +-
 drivers/vfio/group.c                           |  2 +-
 drivers/vfio/vfio_main.c                       |  2 +-
 drivers/virt/nitro_enclaves/ne_misc_dev.c      |  2 +-
 fs/anon_inodes.c                               |  2 +-
 fs/autofs/dev-ioctl.c                          |  2 +-
 fs/bcachefs/thread_with_file.c                 |  2 +-
 fs/cachefiles/ondemand.c                       |  2 +-
 fs/eventfd.c                                   |  2 +-
 fs/eventpoll.c                                 |  2 +-
 fs/exec.c                                      |  2 +-
 fs/file.c                                      | 14 +++++++-------
 fs/init.c                                      |  2 +-
 fs/namespace.c                                 |  6 +++---
 fs/notify/fanotify/fanotify_user.c             |  4 ++--
 fs/open.c                                      |  2 +-
 fs/pipe.c                                      |  4 ++--
 fs/signalfd.c                                  |  2 +-
 fs/timerfd.c                                   |  2 +-
 fs/userfaultfd.c                               |  2 +-
 fs/xfs/xfs_handle.c                            |  2 +-
 include/linux/file.h                           |  6 +++---
 include/uapi/linux/nitro_enclaves.h            |  2 +-
 io_uring/io_uring.c                            |  2 +-
 io_uring/net.c                                 |  4 ++--
 io_uring/openclose.c                           |  2 +-
 ipc/mqueue.c                                   |  2 +-
 kernel/bpf/bpf_iter.c                          |  2 +-
 kernel/bpf/syscall.c                           |  2 +-
 kernel/bpf/token.c                             |  2 +-
 kernel/events/core.c                           |  2 +-
 kernel/seccomp.c                               |  2 +-
 mm/memfd.c                                     |  2 +-
 mm/secretmem.c                                 |  2 +-
 net/handshake/netlink.c                        |  2 +-
 net/kcm/kcmsock.c                              |  2 +-
 net/sctp/socket.c                              |  2 +-
 net/socket.c                                   |  8 ++++----
 net/unix/af_unix.c                             |  2 +-
 rust/kernel/fs/file.rs                         | 10 +++++-----
 sound/core/compress_offload.c                  |  4 ++--
 virt/kvm/guest_memfd.c                         |  2 +-
 virt/kvm/kvm_main.c                            |  6 +++---
 69 files changed, 97 insertions(+), 97 deletions(-)

diff --git a/Documentation/driver-api/sync_file.rst b/Documentation/driver-api/sync_file.rst
index 496fb2c3b3e6..47562cb1e4f5 100644
--- a/Documentation/driver-api/sync_file.rst
+++ b/Documentation/driver-api/sync_file.rst
@@ -54,7 +54,7 @@ The caller pass the out-fence and gets back the sync_file. That is just the
 first step, next it needs to install an fd on sync_file->file. So it gets an
 fd::
 
-	fd = get_unused_fd_flags(O_CLOEXEC);
+	fd = get_unused_fd(O_CLOEXEC);
 
 and installs it on sync_file->file::
 
diff --git a/arch/powerpc/platforms/cell/spufs/inode.c b/arch/powerpc/platforms/cell/spufs/inode.c
index 70236d1df3d3..1f52cb8c6305 100644
--- a/arch/powerpc/platforms/cell/spufs/inode.c
+++ b/arch/powerpc/platforms/cell/spufs/inode.c
@@ -281,7 +281,7 @@ static int spufs_context_open(const struct path *path)
 	int ret;
 	struct file *filp;
 
-	ret = get_unused_fd_flags(0);
+	ret = get_unused_fd(0);
 	if (ret < 0)
 		return ret;
 
@@ -497,7 +497,7 @@ static int spufs_gang_open(const struct path *path)
 	int ret;
 	struct file *filp;
 
-	ret = get_unused_fd_flags(0);
+	ret = get_unused_fd(0);
 	if (ret < 0)
 		return ret;
 
diff --git a/arch/powerpc/platforms/pseries/papr-vpd.c b/arch/powerpc/platforms/pseries/papr-vpd.c
index c86950d7105a..d78231757a41 100644
--- a/arch/powerpc/platforms/pseries/papr-vpd.c
+++ b/arch/powerpc/platforms/pseries/papr-vpd.c
@@ -476,7 +476,7 @@ static long papr_vpd_create_handle(struct papr_location_code __user *ulc)
 	if (IS_ERR(blob))
 		return PTR_ERR(blob);
 
-	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
+	fd = get_unused_fd(O_RDONLY | O_CLOEXEC);
 	if (fd < 0) {
 		err = fd;
 		goto free_blob;
diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 76052006bd87..e162d92e8c1d 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -4618,7 +4618,7 @@ static int binder_apply_fd_fixups(struct binder_proc *proc,
 	int ret = 0;
 
 	list_for_each_entry(fixup, &t->fd_fixups, fixup_entry) {
-		int fd = get_unused_fd_flags(O_CLOEXEC);
+		int fd = get_unused_fd(O_CLOEXEC);
 
 		if (fd < 0) {
 			binder_debug(BINDER_DEBUG_TRANSACTION,
diff --git a/drivers/char/tpm/tpm_vtpm_proxy.c b/drivers/char/tpm/tpm_vtpm_proxy.c
index 8fe4a01eea12..42fa01629ff3 100644
--- a/drivers/char/tpm/tpm_vtpm_proxy.c
+++ b/drivers/char/tpm/tpm_vtpm_proxy.c
@@ -546,7 +546,7 @@ static struct file *vtpm_proxy_create_device(
 	proxy_dev->flags = vtpm_new_dev->flags;
 
 	/* setup an anonymous file for the server-side */
-	fd = get_unused_fd_flags(O_RDWR);
+	fd = get_unused_fd(O_RDWR);
 	if (fd < 0) {
 		rc = fd;
 		goto err_delete_proxy_dev;
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 5baa83b85515..984b5d5091e0 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -368,7 +368,7 @@ static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
 	if ((arg.flags & DMA_BUF_SYNC_RW) == 0)
 		return -EINVAL;
 
-	fd = get_unused_fd_flags(O_CLOEXEC);
+	fd = get_unused_fd(O_CLOEXEC);
 	if (fd < 0)
 		return fd;
 
@@ -719,7 +719,7 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
 	if (!dmabuf || !dmabuf->file)
 		return -EINVAL;
 
-	fd = get_unused_fd_flags(flags);
+	fd = get_unused_fd(flags);
 	if (fd < 0)
 		return fd;
 
diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index f5905d67dedb..cba2e99c614e 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -359,7 +359,7 @@ static int sw_sync_debugfs_release(struct inode *inode, struct file *file)
 static long sw_sync_ioctl_create_fence(struct sync_timeline *obj,
 				       unsigned long arg)
 {
-	int fd = get_unused_fd_flags(O_CLOEXEC);
+	int fd = get_unused_fd(O_CLOEXEC);
 	int err;
 	struct sync_pt *pt;
 	struct sync_file *sync_file;
diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index d9b1c1b2a72b..7e1989508964 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -207,7 +207,7 @@ static __poll_t sync_file_poll(struct file *file, poll_table *wait)
 static long sync_file_ioctl_merge(struct sync_file *sync_file,
 				  unsigned long arg)
 {
-	int fd = get_unused_fd_flags(O_CLOEXEC);
+	int fd = get_unused_fd(O_CLOEXEC);
 	int err;
 	struct sync_file *fence2, *fence3;
 	struct sync_merge_data data;
diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 107d75558b5a..1d822467981c 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -377,7 +377,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 			offset);
 	}
 
-	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
+	fd = get_unused_fd(O_RDONLY | O_CLOEXEC);
 	if (fd < 0) {
 		ret = fd;
 		goto out_free_lh;
@@ -1729,7 +1729,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 	if (ret)
 		goto out_free_linereq;
 
-	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
+	fd = get_unused_fd(O_RDONLY | O_CLOEXEC);
 	if (fd < 0) {
 		ret = fd;
 		goto out_free_linereq;
@@ -2154,7 +2154,7 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 
 	le->irq = irq;
 
-	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
+	fd = get_unused_fd(O_RDONLY | O_CLOEXEC);
 	if (fd < 0) {
 		ret = fd;
 		goto out_free_le;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 82df06a72ee0..5ddd07060481 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1596,7 +1596,7 @@ int amdgpu_cs_fence_to_handle_ioctl(struct drm_device *dev, void *data,
 		return r;
 
 	case AMDGPU_FENCE_TO_HANDLE_GET_SYNC_FILE_FD:
-		fd = get_unused_fd_flags(O_CLOEXEC);
+		fd = get_unused_fd(O_CLOEXEC);
 		if (fd < 0) {
 			dma_fence_put(fence);
 			return fd;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 1e9dd00620bf..ea56697d2fa9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1858,7 +1858,7 @@ static int criu_get_prime_handle(struct kgd_mem *mem,
 		return ret;
 	}
 
-	ret = get_unused_fd_flags(flags);
+	ret = get_unused_fd(flags);
 	if (ret < 0) {
 		pr_err("dmabuf create fd failed, ret:%d\n", ret);
 		goto out_free_dmabuf;
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index c2726af6698e..4a097171fbe1 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1178,7 +1178,7 @@ struct drm_out_fence_state {
 static int setup_out_fence(struct drm_out_fence_state *fence_state,
 			   struct dma_fence *fence)
 {
-	fence_state->fd = get_unused_fd_flags(O_CLOEXEC);
+	fence_state->fd = get_unused_fd(O_CLOEXEC);
 	if (fence_state->fd < 0)
 		return fence_state->fd;
 
diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index 94375c6a5425..366d14461943 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -530,7 +530,7 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 	}
 
 	/* Allocate a file descriptor for the lease */
-	fd = get_unused_fd_flags(cl->flags & (O_CLOEXEC | O_NONBLOCK));
+	fd = get_unused_fd(cl->flags & (O_CLOEXEC | O_NONBLOCK));
 	if (fd < 0) {
 		idr_destroy(&leases);
 		ret = fd;
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index bdb51c8f262e..b432be0989e3 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -510,7 +510,7 @@ int drm_gem_prime_handle_to_fd(struct drm_device *dev,
 			       int *prime_fd)
 {
 	struct dma_buf *dmabuf;
-	int fd = get_unused_fd_flags(flags);
+	int fd = get_unused_fd(flags);
 
 	if (fd < 0)
 		return fd;
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 4f2ab8a7b50f..75707507aa00 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -674,7 +674,7 @@ int drm_syncobj_get_fd(struct drm_syncobj *syncobj, int *p_fd)
 	struct file *file;
 	int fd;
 
-	fd = get_unused_fd_flags(O_CLOEXEC);
+	fd = get_unused_fd(O_CLOEXEC);
 	if (fd < 0)
 		return fd;
 
@@ -767,7 +767,7 @@ static int drm_syncobj_export_sync_file(struct drm_file *file_private,
 	int ret;
 	struct dma_fence *fence;
 	struct sync_file *sync_file;
-	int fd = get_unused_fd_flags(O_CLOEXEC);
+	int fd = get_unused_fd(O_CLOEXEC);
 
 	if (fd < 0)
 		return fd;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 3c0a5c3e0e3d..10b930f09584 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -505,7 +505,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 	}
 
 	if (args->flags & ETNA_SUBMIT_FENCE_FD_OUT) {
-		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
+		out_fence_fd = get_unused_fd(O_CLOEXEC);
 		if (out_fence_fd < 0) {
 			ret = out_fence_fd;
 			goto err_submit_cmds;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 7796c4119ef5..be2617fdd153 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -3432,7 +3432,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 #undef IN_FENCES
 
 	if (args->flags & I915_EXEC_FENCE_OUT) {
-		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
+		out_fence_fd = get_unused_fd(O_CLOEXEC);
 		if (out_fence_fd < 0) {
 			err = out_fence_fd;
 			goto err_in_fence;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 3e9aa2cc38ef..d298bea31594 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -686,7 +686,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	ring = gpu->rb[queue->ring_nr];
 
 	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
-		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
+		out_fence_fd = get_unused_fd(O_CLOEXEC);
 		if (out_fence_fd < 0) {
 			ret = out_fence_fd;
 			goto out_post_unlock;
diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c b/drivers/gpu/drm/virtio/virtgpu_submit.c
index 7d34cf83f5f2..2387e8fd6646 100644
--- a/drivers/gpu/drm/virtio/virtgpu_submit.c
+++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
@@ -418,7 +418,7 @@ static int virtio_gpu_init_submit(struct virtio_gpu_submit *submit,
 		return PTR_ERR(submit->buf);
 
 	if (exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_OUT) {
-		err = get_unused_fd_flags(O_CLOEXEC);
+		err = get_unused_fd(O_CLOEXEC);
 		if (err < 0)
 			return err;
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 2e52d73eba48..6a3b7b762664 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -4104,7 +4104,7 @@ int vmw_execbuf_process(struct drm_file *file_priv,
 	DECLARE_VAL_CONTEXT(val_ctx, sw_context, 1);
 
 	if (flags & DRM_VMW_EXECBUF_FLAG_EXPORT_FENCE_FD) {
-		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
+		out_fence_fd = get_unused_fd(O_CLOEXEC);
 		if (out_fence_fd < 0) {
 			VMW_DEBUG_USER("Failed to get a fence fd.\n");
 			return out_fence_fd;
diff --git a/drivers/hv/mshv_root_main.c b/drivers/hv/mshv_root_main.c
index 72df774e410a..92a30eeeae66 100644
--- a/drivers/hv/mshv_root_main.c
+++ b/drivers/hv/mshv_root_main.c
@@ -1966,7 +1966,7 @@ mshv_ioctl_create_partition(void __user *user_arg, struct device *module_dev)
 	if (ret)
 		goto remove_partition;
 
-	fd = get_unused_fd_flags(O_CLOEXEC);
+	fd = get_unused_fd(O_CLOEXEC);
 	if (fd < 0) {
 		ret = fd;
 		goto remove_partition;
diff --git a/drivers/infiniband/core/rdma_core.c b/drivers/infiniband/core/rdma_core.c
index 90c177edf9b0..0829e243fd5d 100644
--- a/drivers/infiniband/core/rdma_core.c
+++ b/drivers/infiniband/core/rdma_core.c
@@ -471,7 +471,7 @@ alloc_begin_fd_uobject(const struct uverbs_api_object *obj,
 		goto err_fd;
 	}
 
-	new_fd = get_unused_fd_flags(O_CLOEXEC);
+	new_fd = get_unused_fd(O_CLOEXEC);
 	if (new_fd < 0) {
 		ret = ERR_PTR(new_fd);
 		goto err_fd;
diff --git a/drivers/iommu/iommufd/eventq.c b/drivers/iommu/iommufd/eventq.c
index f39cf0797347..6b57e3a123f5 100644
--- a/drivers/iommu/iommufd/eventq.c
+++ b/drivers/iommu/iommufd/eventq.c
@@ -454,7 +454,7 @@ static int iommufd_eventq_init(struct iommufd_eventq *eventq, char *name,
 	eventq->filep = filep;
 	refcount_inc(&eventq->obj.users);
 
-	fdno = get_unused_fd_flags(O_CLOEXEC);
+	fdno = get_unused_fd(O_CLOEXEC);
 	if (fdno < 0)
 		fput(filep);
 	return fdno;
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index 18d9a216eb30..cffe66996c1b 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -1366,7 +1366,7 @@ static int iommufd_test_create_access(struct iommufd_ucmd *ucmd,
 	if (IS_ERR(staccess))
 		return PTR_ERR(staccess);
 
-	fdno = get_unused_fd_flags(O_CLOEXEC);
+	fdno = get_unused_fd(O_CLOEXEC);
 	if (fdno < 0) {
 		rc = -ENOMEM;
 		goto out_free_staccess;
diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
index 5edfc2791ce7..469607a317c8 100644
--- a/drivers/media/mc/mc-request.c
+++ b/drivers/media/mc/mc-request.c
@@ -297,7 +297,7 @@ int media_request_alloc(struct media_device *mdev, int *alloc_fd)
 	if (!req)
 		return -ENOMEM;
 
-	fd = get_unused_fd_flags(O_CLOEXEC);
+	fd = get_unused_fd(O_CLOEXEC);
 	if (fd < 0) {
 		ret = fd;
 		goto err_free_req;
diff --git a/drivers/misc/ntsync.c b/drivers/misc/ntsync.c
index 999026a1ae04..bbe70a49f0f0 100644
--- a/drivers/misc/ntsync.c
+++ b/drivers/misc/ntsync.c
@@ -724,7 +724,7 @@ static int ntsync_obj_get_fd(struct ntsync_obj *obj)
 	struct file *file;
 	int fd;
 
-	fd = get_unused_fd_flags(O_CLOEXEC);
+	fd = get_unused_fd(O_CLOEXEC);
 	if (fd < 0)
 		return fd;
 	file = anon_inode_getfile("ntsync", &ntsync_obj_fops, obj, O_RDWR);
diff --git a/drivers/tty/pty.c b/drivers/tty/pty.c
index 8bb1a01fef2a..e4a9e2a80022 100644
--- a/drivers/tty/pty.c
+++ b/drivers/tty/pty.c
@@ -609,7 +609,7 @@ int ptm_open_peer(struct file *master, struct tty_struct *tty, int flags)
 	if (tty->driver != ptm_driver)
 		return -EIO;
 
-	fd = get_unused_fd_flags(flags);
+	fd = get_unused_fd(flags);
 	if (fd < 0) {
 		retval = fd;
 		goto err;
diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index c321d442f0da..71ce3d05d695 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -314,7 +314,7 @@ static int vfio_group_ioctl_get_device_fd(struct vfio_group *group,
 	if (IS_ERR(device))
 		return PTR_ERR(device);
 
-	fdno = get_unused_fd_flags(O_CLOEXEC);
+	fdno = get_unused_fd(O_CLOEXEC);
 	if (fdno < 0) {
 		ret = fdno;
 		goto err_put_device;
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 1fd261efc582..62be379977f5 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -861,7 +861,7 @@ static int vfio_ioct_mig_return_fd(struct file *filp, void __user *arg,
 	int ret;
 	int fd;
 
-	fd = get_unused_fd_flags(O_CLOEXEC);
+	fd = get_unused_fd(O_CLOEXEC);
 	if (fd < 0) {
 		ret = fd;
 		goto out_fput;
diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.c b/drivers/virt/nitro_enclaves/ne_misc_dev.c
index 241b94f62e56..ddb3591d38c8 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.c
@@ -1651,7 +1651,7 @@ static int ne_create_vm_ioctl(struct ne_pci_dev *ne_pci_dev, u64 __user *slot_ui
 		goto free_cpumask;
 	}
 
-	enclave_fd = get_unused_fd_flags(O_CLOEXEC);
+	enclave_fd = get_unused_fd(O_CLOEXEC);
 	if (enclave_fd < 0) {
 		rc = enclave_fd;
 
diff --git a/fs/anon_inodes.c b/fs/anon_inodes.c
index 583ac81669c2..5d7938711678 100644
--- a/fs/anon_inodes.c
+++ b/fs/anon_inodes.c
@@ -226,7 +226,7 @@ static int __anon_inode_getfd(const char *name,
 	int error, fd;
 	struct file *file;
 
-	error = get_unused_fd_flags(flags);
+	error = get_unused_fd(flags);
 	if (error < 0)
 		return error;
 	fd = error;
diff --git a/fs/autofs/dev-ioctl.c b/fs/autofs/dev-ioctl.c
index c5a6aae12d2c..46944a3ee990 100644
--- a/fs/autofs/dev-ioctl.c
+++ b/fs/autofs/dev-ioctl.c
@@ -233,7 +233,7 @@ static int autofs_dev_ioctl_open_mountpoint(const char *name, dev_t devid)
 {
 	int err, fd;
 
-	fd = get_unused_fd_flags(O_CLOEXEC);
+	fd = get_unused_fd(O_CLOEXEC);
 	if (likely(fd >= 0)) {
 		struct file *filp;
 		struct path path;
diff --git a/fs/bcachefs/thread_with_file.c b/fs/bcachefs/thread_with_file.c
index dea73bc1cb51..85c7373e1b86 100644
--- a/fs/bcachefs/thread_with_file.c
+++ b/fs/bcachefs/thread_with_file.c
@@ -43,7 +43,7 @@ int bch2_run_thread_with_file(struct thread_with_file *thr,
 	if (ret)
 		return ret;
 
-	ret = get_unused_fd_flags(fd_flags);
+	ret = get_unused_fd(fd_flags);
 	if (ret < 0)
 		goto err;
 	fd = ret;
diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index d9bc67176128..a305ee1b0bf1 100644
--- a/fs/cachefiles/ondemand.c
+++ b/fs/cachefiles/ondemand.c
@@ -311,7 +311,7 @@ static int cachefiles_ondemand_get_fd(struct cachefiles_req *req,
 	if (ret < 0)
 		goto err;
 
-	anon_file->fd = get_unused_fd_flags(O_WRONLY);
+	anon_file->fd = get_unused_fd(O_WRONLY);
 	if (anon_file->fd < 0) {
 		ret = anon_file->fd;
 		goto err_free_id;
diff --git a/fs/eventfd.c b/fs/eventfd.c
index af42b2c7d235..5ba039c41a33 100644
--- a/fs/eventfd.c
+++ b/fs/eventfd.c
@@ -402,7 +402,7 @@ static int do_eventfd(unsigned int count, int flags)
 
 	flags &= EFD_SHARED_FCNTL_FLAGS;
 	flags |= O_RDWR;
-	fd = get_unused_fd_flags(flags);
+	fd = get_unused_fd(flags);
 	if (fd < 0)
 		goto err;
 
diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index 100376863a44..6b7571df9259 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -2234,7 +2234,7 @@ static int do_epoll_create(int flags)
 	 * Creates all the items needed to setup an eventpoll file. That is,
 	 * a file structure and a free file descriptor.
 	 */
-	fd = get_unused_fd_flags(O_RDWR | (flags & O_CLOEXEC));
+	fd = get_unused_fd(O_RDWR | (flags & O_CLOEXEC));
 	if (fd < 0) {
 		error = fd;
 		goto out_free_ep;
diff --git a/fs/exec.c b/fs/exec.c
index 5d1c0d2dc403..fa454ed03d69 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1388,7 +1388,7 @@ int begin_new_exec(struct linux_binprm * bprm)
 
 	/* Pass the opened binary to the interpreter. */
 	if (bprm->have_execfd) {
-		retval = get_unused_fd_flags(0);
+		retval = get_unused_fd(0);
 		if (retval < 0)
 			goto out_unlock;
 		fd_install(retval, bprm->executable);
diff --git a/fs/file.c b/fs/file.c
index dc3f7e120e3e..d631aa1b3735 100644
--- a/fs/file.c
+++ b/fs/file.c
@@ -597,16 +597,16 @@ static int alloc_fd(unsigned start, unsigned end, unsigned flags)
 	return error;
 }
 
-int __get_unused_fd_flags(unsigned flags, unsigned long nofile)
+int __get_unused_fd(unsigned flags, unsigned long nofile)
 {
 	return alloc_fd(0, nofile, flags);
 }
 
-int get_unused_fd_flags(unsigned flags)
+int get_unused_fd(unsigned flags)
 {
-	return __get_unused_fd_flags(flags, rlimit(RLIMIT_NOFILE));
+	return __get_unused_fd(flags, rlimit(RLIMIT_NOFILE));
 }
-EXPORT_SYMBOL(get_unused_fd_flags);
+EXPORT_SYMBOL(get_unused_fd);
 
 static void __put_unused_fd(struct files_struct *files, unsigned int fd)
 {
@@ -1257,7 +1257,7 @@ __releases(&files->file_lock)
 	 * not populate it yet.
 	 *
 	 * Broadly speaking we may be racing against the following:
-	 * fd = get_unused_fd_flags();     // fd slot reserved, ->fd[fd] == NULL
+	 * fd = get_unused_fd();     // fd slot reserved, ->fd[fd] == NULL
 	 * file = hard_work_goes_here();
 	 * fd_install(fd, file);           // only now ->fd[fd] == file
 	 *
@@ -1342,7 +1342,7 @@ int receive_fd(struct file *file, int __user *ufd, unsigned int o_flags)
 	if (error)
 		return error;
 
-	new_fd = get_unused_fd_flags(o_flags);
+	new_fd = get_unused_fd(o_flags);
 	if (new_fd < 0)
 		return new_fd;
 
@@ -1438,7 +1438,7 @@ SYSCALL_DEFINE1(dup, unsigned int, fildes)
 	struct file *file = fget_raw(fildes);
 
 	if (file) {
-		ret = get_unused_fd_flags(0);
+		ret = get_unused_fd(0);
 		if (ret >= 0)
 			fd_install(ret, file);
 		else
diff --git a/fs/init.c b/fs/init.c
index eef5124885e3..07429ecae891 100644
--- a/fs/init.c
+++ b/fs/init.c
@@ -262,7 +262,7 @@ int __init init_dup(struct file *file)
 {
 	int fd;
 
-	fd = get_unused_fd_flags(0);
+	fd = get_unused_fd(0);
 	if (fd < 0)
 		return fd;
 	fd_install(fd, get_file(file));
diff --git a/fs/namespace.c b/fs/namespace.c
index 14935a0500a2..4fa52bbb215d 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -3195,7 +3195,7 @@ SYSCALL_DEFINE3(open_tree, int, dfd, const char __user *, filename, unsigned, fl
 	if (IS_ERR(file))
 		return PTR_ERR(file);
 
-	fd = get_unused_fd_flags(flags & O_CLOEXEC);
+	fd = get_unused_fd(flags & O_CLOEXEC);
 	if (fd < 0)
 		return fd;
 
@@ -4575,7 +4575,7 @@ SYSCALL_DEFINE3(fsmount, int, fs_fd, unsigned int, flags,
 	}
 	file->f_mode |= FMODE_NEED_UNMOUNT;
 
-	ret = get_unused_fd_flags((flags & FSMOUNT_CLOEXEC) ? O_CLOEXEC : 0);
+	ret = get_unused_fd((flags & FSMOUNT_CLOEXEC) ? O_CLOEXEC : 0);
 	if (ret >= 0)
 		fd_install(ret, file);
 	else
@@ -5293,7 +5293,7 @@ SYSCALL_DEFINE5(open_tree_attr, int, dfd, const char __user *, filename,
 		finish_mount_kattr(&kattr);
 	}
 
-	fd = get_unused_fd_flags(flags & O_CLOEXEC);
+	fd = get_unused_fd(flags & O_CLOEXEC);
 	if (fd < 0)
 		return fd;
 
diff --git a/fs/notify/fanotify/fanotify_user.c b/fs/notify/fanotify/fanotify_user.c
index f2d840ae4ded..7ef373fe24bc 100644
--- a/fs/notify/fanotify/fanotify_user.c
+++ b/fs/notify/fanotify/fanotify_user.c
@@ -259,7 +259,7 @@ static int create_fd(struct fsnotify_group *group, const struct path *path,
 	int client_fd;
 	struct file *new_file;
 
-	client_fd = get_unused_fd_flags(group->fanotify_data.f_flags);
+	client_fd = get_unused_fd(group->fanotify_data.f_flags);
 	if (client_fd < 0)
 		return client_fd;
 
@@ -1658,7 +1658,7 @@ SYSCALL_DEFINE2(fanotify_init, unsigned int, flags, unsigned int, event_f_flags)
 			goto out_destroy_group;
 	}
 
-	fd = get_unused_fd_flags(f_flags);
+	fd = get_unused_fd(f_flags);
 	if (fd < 0)
 		goto out_destroy_group;
 
diff --git a/fs/open.c b/fs/open.c
index a9063cca9911..a8f107f4c642 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -1424,7 +1424,7 @@ static int do_sys_openat2(int dfd, const char __user *filename,
 	if (IS_ERR(tmp))
 		return PTR_ERR(tmp);
 
-	fd = get_unused_fd_flags(how->flags);
+	fd = get_unused_fd(how->flags);
 	if (likely(fd >= 0)) {
 		struct file *f = do_filp_open(dfd, tmp, &op);
 		if (IS_ERR(f)) {
diff --git a/fs/pipe.c b/fs/pipe.c
index da45edd68c41..6d49ccfb6e9e 100644
--- a/fs/pipe.c
+++ b/fs/pipe.c
@@ -985,12 +985,12 @@ static int __do_pipe_flags(int *fd, struct file **files, int flags)
 	if (error)
 		return error;
 
-	error = get_unused_fd_flags(flags);
+	error = get_unused_fd(flags);
 	if (error < 0)
 		goto err_read_pipe;
 	fdr = error;
 
-	error = get_unused_fd_flags(flags);
+	error = get_unused_fd(flags);
 	if (error < 0)
 		goto err_fdr;
 	fdw = error;
diff --git a/fs/signalfd.c b/fs/signalfd.c
index d469782f97f4..aae8b3e13aab 100644
--- a/fs/signalfd.c
+++ b/fs/signalfd.c
@@ -271,7 +271,7 @@ static int do_signalfd4(int ufd, sigset_t *mask, int flags)
 
 		ctx->sigmask = *mask;
 
-		ufd = get_unused_fd_flags(flags & O_CLOEXEC);
+		ufd = get_unused_fd(flags & O_CLOEXEC);
 		if (ufd < 0) {
 			kfree(ctx);
 			return ufd;
diff --git a/fs/timerfd.c b/fs/timerfd.c
index c68f28d9c426..1800e4e6c22a 100644
--- a/fs/timerfd.c
+++ b/fs/timerfd.c
@@ -432,7 +432,7 @@ SYSCALL_DEFINE2(timerfd_create, int, clockid, int, flags)
 
 	ctx->moffs = ktime_mono_to_real(0);
 
-	ufd = get_unused_fd_flags(flags & TFD_SHARED_FCNTL_FLAGS);
+	ufd = get_unused_fd(flags & TFD_SHARED_FCNTL_FLAGS);
 	if (ufd < 0) {
 		kfree(ctx);
 		return ufd;
diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
index d80f94346199..9ef7b7406ddd 100644
--- a/fs/userfaultfd.c
+++ b/fs/userfaultfd.c
@@ -2112,7 +2112,7 @@ static int new_userfaultfd(int flags)
 	atomic_set(&ctx->mmap_changing, 0);
 	ctx->mm = current->mm;
 
-	fd = get_unused_fd_flags(flags & UFFD_SHARED_FCNTL_FLAGS);
+	fd = get_unused_fd(flags & UFFD_SHARED_FCNTL_FLAGS);
 	if (fd < 0)
 		goto err_out;
 
diff --git a/fs/xfs/xfs_handle.c b/fs/xfs/xfs_handle.c
index f19fce557354..f8e50b6496af 100644
--- a/fs/xfs/xfs_handle.c
+++ b/fs/xfs/xfs_handle.c
@@ -279,7 +279,7 @@ xfs_open_by_handle(
 		goto out_dput;
 	}
 
-	fd = get_unused_fd_flags(0);
+	fd = get_unused_fd(0);
 	if (fd < 0) {
 		error = fd;
 		goto out_dput;
diff --git a/include/linux/file.h b/include/linux/file.h
index 302f11355b10..654ec327b847 100644
--- a/include/linux/file.h
+++ b/include/linux/file.h
@@ -88,12 +88,12 @@ extern int f_dupfd(unsigned int from, struct file *file, unsigned flags);
 extern int replace_fd(unsigned fd, struct file *file, unsigned flags);
 extern void set_close_on_exec(unsigned int fd, int flag);
 extern bool get_close_on_exec(unsigned int fd);
-extern int __get_unused_fd_flags(unsigned flags, unsigned long nofile);
-extern int get_unused_fd_flags(unsigned flags);
+extern int __get_unused_fd(unsigned flags, unsigned long nofile);
+extern int get_unused_fd(unsigned flags);
 extern void put_unused_fd(unsigned int fd);
 
 DEFINE_CLASS(get_unused_fd, int, if (_T >= 0) put_unused_fd(_T),
-	     get_unused_fd_flags(flags), unsigned flags)
+	     get_unused_fd(flags), unsigned flags)
 DEFINE_FREE(fput, struct file *, if (!IS_ERR_OR_NULL(_T)) fput(_T))
 
 /*
diff --git a/include/uapi/linux/nitro_enclaves.h b/include/uapi/linux/nitro_enclaves.h
index e808f5ba124d..7b534a1a5b98 100644
--- a/include/uapi/linux/nitro_enclaves.h
+++ b/include/uapi/linux/nitro_enclaves.h
@@ -41,7 +41,7 @@
  *					  bookkeeping variables.
  * * NE_ERR_NO_CPUS_AVAIL_IN_POOL	- No NE CPU pool set / no CPUs available
  *					  in the pool.
- * * Error codes from get_unused_fd_flags() and anon_inode_getfile().
+ * * Error codes from get_unused_fd() and anon_inode_getfile().
  * * Error codes from the NE PCI device request.
  */
 #define NE_CREATE_VM			_IOR(0xAE, 0x20, __u64)
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index c6209fe44cb1..9ab63e875aeb 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -3542,7 +3542,7 @@ static int io_uring_install_fd(struct file *file)
 {
 	int fd;
 
-	fd = get_unused_fd_flags(O_RDWR | O_CLOEXEC);
+	fd = get_unused_fd(O_RDWR | O_CLOEXEC);
 	if (fd < 0)
 		return fd;
 	fd_install(fd, file);
diff --git a/io_uring/net.c b/io_uring/net.c
index 24040bc3916a..167511313d37 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -1611,7 +1611,7 @@ int io_accept(struct io_kiocb *req, unsigned int issue_flags)
 
 retry:
 	if (!fixed) {
-		fd = __get_unused_fd_flags(accept->flags, accept->nofile);
+		fd = __get_unused_fd(accept->flags, accept->nofile);
 		if (unlikely(fd < 0))
 			return fd;
 	}
@@ -1683,7 +1683,7 @@ int io_socket(struct io_kiocb *req, unsigned int issue_flags)
 	int ret, fd;
 
 	if (!fixed) {
-		fd = __get_unused_fd_flags(sock->flags, sock->nofile);
+		fd = __get_unused_fd(sock->flags, sock->nofile);
 		if (unlikely(fd < 0))
 			return fd;
 	}
diff --git a/io_uring/openclose.c b/io_uring/openclose.c
index e3357dfa14ca..d877269da713 100644
--- a/io_uring/openclose.c
+++ b/io_uring/openclose.c
@@ -132,7 +132,7 @@ int io_openat2(struct io_kiocb *req, unsigned int issue_flags)
 	}
 
 	if (!fixed) {
-		ret = __get_unused_fd_flags(open->how.flags, open->nofile);
+ ret = __get_unused_fd(open->how.flags, open->nofile);
 		if (ret < 0)
 			goto err;
 	}
diff --git a/ipc/mqueue.c b/ipc/mqueue.c
index 35b4f8659904..91486a5ff6f5 100644
--- a/ipc/mqueue.c
+++ b/ipc/mqueue.c
@@ -907,7 +907,7 @@ static int do_mq_open(const char __user *u_name, int oflag, umode_t mode,
 	if (IS_ERR(name))
 		return PTR_ERR(name);
 
-	fd = get_unused_fd_flags(O_CLOEXEC);
+	fd = get_unused_fd(O_CLOEXEC);
 	if (fd < 0)
 		goto out_putname;
 
diff --git a/kernel/bpf/bpf_iter.c b/kernel/bpf/bpf_iter.c
index 380e9a7cac75..1d3ab9655b46 100644
--- a/kernel/bpf/bpf_iter.c
+++ b/kernel/bpf/bpf_iter.c
@@ -642,7 +642,7 @@ int bpf_iter_new_fd(struct bpf_link *link)
 		return -EINVAL;
 
 	flags = O_RDONLY | O_CLOEXEC;
-	fd = get_unused_fd_flags(flags);
+	fd = get_unused_fd(flags);
 	if (fd < 0)
 		return fd;
 
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 9794446bc8c6..4671df71f90d 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -3304,7 +3304,7 @@ int bpf_link_prime(struct bpf_link *link, struct bpf_link_primer *primer)
 	struct file *file;
 	int fd, id;
 
-	fd = get_unused_fd_flags(O_CLOEXEC);
+	fd = get_unused_fd(O_CLOEXEC);
 	if (fd < 0)
 		return fd;
 
diff --git a/kernel/bpf/token.c b/kernel/bpf/token.c
index 26057aa13503..f0f3981f58a4 100644
--- a/kernel/bpf/token.c
+++ b/kernel/bpf/token.c
@@ -192,7 +192,7 @@ int bpf_token_create(union bpf_attr *attr)
 	if (err)
 		goto out_token;
 
-	fd = get_unused_fd_flags(O_CLOEXEC);
+	fd = get_unused_fd(O_CLOEXEC);
 	if (fd < 0) {
 		err = fd;
 		goto out_token;
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 0bb21659e252..c13649de99bc 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -13154,7 +13154,7 @@ SYSCALL_DEFINE5(perf_event_open,
 	if (flags & PERF_FLAG_FD_CLOEXEC)
 		f_flags |= O_CLOEXEC;
 
-	event_fd = get_unused_fd_flags(f_flags);
+	event_fd = get_unused_fd(f_flags);
 	if (event_fd < 0)
 		return event_fd;
 
diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 41aa761c7738..9db856fb22b7 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -1976,7 +1976,7 @@ static long seccomp_set_mode_filter(unsigned int flags,
 		return PTR_ERR(prepared);
 
 	if (flags & SECCOMP_FILTER_FLAG_NEW_LISTENER) {
-		listener = get_unused_fd_flags(O_CLOEXEC);
+		listener = get_unused_fd(O_CLOEXEC);
 		if (listener < 0) {
 			ret = listener;
 			goto out_free;
diff --git a/mm/memfd.c b/mm/memfd.c
index c64df1343059..613eea85983c 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -471,7 +471,7 @@ SYSCALL_DEFINE2(memfd_create,
 	if (IS_ERR(name))
 		return PTR_ERR(name);
 
-	fd = get_unused_fd_flags((flags & MFD_CLOEXEC) ? O_CLOEXEC : 0);
+	fd = get_unused_fd((flags & MFD_CLOEXEC) ? O_CLOEXEC : 0);
 	if (fd < 0) {
 		error = fd;
 		goto err_name;
diff --git a/mm/secretmem.c b/mm/secretmem.c
index 1b0a214ee558..231ca5fc8a26 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -245,7 +245,7 @@ SYSCALL_DEFINE1(memfd_secret, unsigned int, flags)
 	if (atomic_read(&secretmem_users) < 0)
 		return -ENFILE;
 
-	fd = get_unused_fd_flags(flags & O_CLOEXEC);
+	fd = get_unused_fd(flags & O_CLOEXEC);
 	if (fd < 0)
 		return fd;
 
diff --git a/net/handshake/netlink.c b/net/handshake/netlink.c
index 7e46d130dce2..b9b494c90472 100644
--- a/net/handshake/netlink.c
+++ b/net/handshake/netlink.c
@@ -110,7 +110,7 @@ int handshake_nl_accept_doit(struct sk_buff *skb, struct genl_info *info)
 		goto out_status;
 
 	sock = req->hr_sk->sk_socket;
-	fd = get_unused_fd_flags(O_CLOEXEC);
+	fd = get_unused_fd(O_CLOEXEC);
 	if (fd < 0) {
 		err = fd;
 		goto out_complete;
diff --git a/net/kcm/kcmsock.c b/net/kcm/kcmsock.c
index 24aec295a51c..2c9bd3c995f5 100644
--- a/net/kcm/kcmsock.c
+++ b/net/kcm/kcmsock.c
@@ -1557,7 +1557,7 @@ static int kcm_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
 		struct kcm_clone info;
 		struct file *file;
 
-		info.fd = get_unused_fd_flags(0);
+		info.fd = get_unused_fd(0);
 		if (unlikely(info.fd < 0))
 			return info.fd;
 
diff --git a/net/sctp/socket.c b/net/sctp/socket.c
index 36ee34f483d7..79376dc6b72f 100644
--- a/net/sctp/socket.c
+++ b/net/sctp/socket.c
@@ -5687,7 +5687,7 @@ static int sctp_getsockopt_peeloff_common(struct sock *sk, sctp_peeloff_arg_t *p
 		goto out;
 
 	/* Map the socket to an unused fd that can be returned to the user.  */
-	retval = get_unused_fd_flags(flags & SOCK_CLOEXEC);
+	retval = get_unused_fd(flags & SOCK_CLOEXEC);
 	if (retval < 0) {
 		sock_release(newsock);
 		goto out;
diff --git a/net/socket.c b/net/socket.c
index 9a0e720f0859..73033493dde5 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -491,7 +491,7 @@ EXPORT_SYMBOL(sock_alloc_file);
 static int sock_map_fd(struct socket *sock, int flags)
 {
 	struct file *newfile;
-	int fd = get_unused_fd_flags(flags);
+	int fd = get_unused_fd(flags);
 	if (unlikely(fd < 0)) {
 		sock_release(sock);
 		return fd;
@@ -1720,11 +1720,11 @@ int __sys_socketpair(int family, int type, int protocol, int __user *usockvec)
 	 * reserve descriptors and make sure we won't fail
 	 * to return them to userland.
 	 */
-	fd1 = get_unused_fd_flags(flags);
+	fd1 = get_unused_fd(flags);
 	if (unlikely(fd1 < 0))
 		return fd1;
 
-	fd2 = get_unused_fd_flags(flags);
+	fd2 = get_unused_fd(flags);
 	if (unlikely(fd2 < 0)) {
 		put_unused_fd(fd1);
 		return fd2;
@@ -1957,7 +1957,7 @@ static int __sys_accept4_file(struct file *file, struct sockaddr __user *upeer_s
 	if (SOCK_NONBLOCK != O_NONBLOCK && (flags & SOCK_NONBLOCK))
 		flags = (flags & ~SOCK_NONBLOCK) | O_NONBLOCK;
 
-	newfd = get_unused_fd_flags(flags);
+	newfd = get_unused_fd(flags);
 	if (unlikely(newfd < 0))
 		return newfd;
 
diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index f78a2492826f..bf5d48b8081f 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -3110,7 +3110,7 @@ static int unix_open_file(struct sock *sk)
 
 	path_get(&path);
 
-	fd = get_unused_fd_flags(O_CLOEXEC);
+	fd = get_unused_fd(O_CLOEXEC);
 	if (fd < 0)
 		goto out;
 
diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index 13a0e44cd1aa..2889c9bf7b95 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -384,7 +384,7 @@ pub struct FileDescriptorReservation {
     /// Prevent values of this type from being moved to a different task.
     ///
     /// The `fd_install` and `put_unused_fd` functions assume that the value of `current` is
-    /// unchanged since the call to `get_unused_fd_flags`. By adding this marker to this type, we
+    /// unchanged since the call to `get_unused_fd`. By adding this marker to this type, we
     /// prevent it from being moved across task boundaries, which ensures that `current` does not
     /// change while this value exists.
     _not_send: NotThreadSafe,
@@ -393,9 +393,9 @@ pub struct FileDescriptorReservation {
 impl FileDescriptorReservation {
     /// Creates a new file descriptor reservation.
     #[inline]
-    pub fn get_unused_fd_flags(flags: u32) -> Result<Self> {
+    pub fn get_unused_fd(flags: u32) -> Result<Self> {
         // SAFETY: FFI call, there are no safety requirements on `flags`.
-        let fd: i32 = unsafe { bindings::get_unused_fd_flags(flags) };
+        let fd: i32 = unsafe { bindings::get_unused_fd(flags) };
         if fd < 0 {
             return Err(Error::from_errno(fd));
         }
@@ -417,7 +417,7 @@ pub fn reserved_fd(&self) -> u32 {
     /// [`FileDescriptorReservation`], so it will not be usable after this call.
     #[inline]
     pub fn fd_install(self, file: ARef<File>) {
-        // SAFETY: `self.fd` was previously returned by `get_unused_fd_flags`. We have not yet used
+        // SAFETY: `self.fd` was previously returned by `get_unused_fd`. We have not yet used
         // the fd, so it is still valid, and `current` still refers to the same task, as this type
         // cannot be moved across task boundaries.
         //
@@ -439,7 +439,7 @@ impl Drop for FileDescriptorReservation {
     #[inline]
     fn drop(&mut self) {
         // SAFETY: By the type invariants of this type, `self.fd` was previously returned by
-        // `get_unused_fd_flags`. We have not yet used the fd, so it is still valid, and `current`
+        // `get_unused_fd`. We have not yet used the fd, so it is still valid, and `current`
         // still refers to the same task, as this type cannot be moved across task boundaries.
         unsafe { bindings::put_unused_fd(self.fd) };
     }
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 840bb9cfe789..9db56bc1ff24 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -1045,10 +1045,10 @@ static int snd_compr_task_new(struct snd_compr_stream *stream, struct snd_compr_
 		retval = -EINVAL;
 		goto cleanup;
 	}
-	fd_i = get_unused_fd_flags(O_WRONLY|O_CLOEXEC);
+	fd_i = get_unused_fd(O_WRONLY|O_CLOEXEC);
 	if (fd_i < 0)
 		goto cleanup;
-	fd_o = get_unused_fd_flags(O_RDONLY|O_CLOEXEC);
+	fd_o = get_unused_fd(O_RDONLY|O_CLOEXEC);
 	if (fd_o < 0) {
 		put_unused_fd(fd_i);
 		goto cleanup;
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index b2aa6bf24d3a..c9aebf64741e 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -410,7 +410,7 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 	struct file *file;
 	int fd, err;
 
-	fd = get_unused_fd_flags(0);
+	fd = get_unused_fd(0);
 	if (fd < 0)
 		return fd;
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index e85b33a92624..9377642b1d7e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4236,7 +4236,7 @@ static int kvm_vcpu_ioctl_get_stats_fd(struct kvm_vcpu *vcpu)
 
 	snprintf(name, sizeof(name), "kvm-vcpu-stats:%d", vcpu->vcpu_id);
 
-	fd = get_unused_fd_flags(O_CLOEXEC);
+	fd = get_unused_fd(O_CLOEXEC);
 	if (fd < 0)
 		return fd;
 
@@ -5031,7 +5031,7 @@ static int kvm_vm_ioctl_get_stats_fd(struct kvm *kvm)
 	int fd;
 	struct file *file;
 
-	fd = get_unused_fd_flags(O_CLOEXEC);
+	fd = get_unused_fd(O_CLOEXEC);
 	if (fd < 0)
 		return fd;
 
@@ -5395,7 +5395,7 @@ static int kvm_dev_ioctl_create_vm(unsigned long type)
 	struct kvm *kvm;
 	struct file *file;
 
-	fd = get_unused_fd_flags(O_CLOEXEC);
+	fd = get_unused_fd(O_CLOEXEC);
 	if (fd < 0)
 		return fd;
 

base-commit: 06a22366d6a11ca8ed03c738171822ac9b714cfd
-- 
2.49.0.1101.gccaa498523-goog

