Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C6426FA5A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744967327; cv=none; b=kR1rEhryuBjB8yzWKUhmlwgm6pvmEyBuncGn8wp2oZ9J1EcNvHMEwJSmdWHFb3wd9G3F+soondD2sPFVALQ2YxJSRiiaj7oIyPP4IVYNT5uAZo24hgR6yFN9MOQG3IBY/OnQ3lu1Ws5r85N3eYcpXDrH4FNcqqHHpxBAhayJ76g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744967327; c=relaxed/simple;
	bh=Tan7tiMQIf4N/Ds+oFO1OHj36ytGulwcJ+1rd2UB/MA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LZLK5i9N+kZxUtKvgXDr840Zh3KdIR2CdIbn2v6Vklik3FGeypl8h76qytVDOXZ6YaA+vlz1t4RR1jOybnIdWQEBcd77Tv1uy9vcayHZHb38hdKh4Fdw/j35d3X5Jhf6mbSDvEEv7blKQ8MeR7PA1oh53OyXjgDngT9YasW4SIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 38892294730;
	Fri, 18 Apr 2025 11:08:41 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id NiCcYCPQPpgA; Fri, 18 Apr 2025 11:08:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id B0BF9298566;
	Fri, 18 Apr 2025 11:08:40 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id aOVaWmjy7AMw; Fri, 18 Apr 2025 11:08:40 +0200 (CEST)
Received: from anvil.corp.sigma-star.at (84-115-238-41.cable.dynamic.surfer.at [84.115.238.41])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id 4A5B3294730;
	Fri, 18 Apr 2025 11:08:40 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-nvme@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	kch@nvidia.com,
	sagi@grimberg.me,
	hch@lst.de,
	upstream+nvme@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [RFC PATCH] nvmet: Make blksize_shift configurable
Date: Fri, 18 Apr 2025 11:08:34 +0200
Message-ID: <20250418090834.2755289-1-richard@nod.at>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Currently, the block size is automatically configured, and for
file-backed namespaces it is likely to be 4K.
While this is a reasonable default for modern storage, it can
cause confusion if someone wants to export a pre-created disk image
that uses a 512-byte block size.
As a result, partition parsing will fail.

So, just like we already do for the loop block device, let the user
configure the block size if they know better.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/nvme/target/configfs.c    | 30 ++++++++++++++++++++++++++++++
 drivers/nvme/target/io-cmd-bdev.c |  4 +++-
 drivers/nvme/target/io-cmd-file.c | 15 +++++++++------
 3 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configf=
s.c
index e44ef69dffc2..2fd9cc3b1d00 100644
--- a/drivers/nvme/target/configfs.c
+++ b/drivers/nvme/target/configfs.c
@@ -797,6 +797,35 @@ static ssize_t nvmet_ns_resv_enable_store(struct con=
fig_item *item,
 }
 CONFIGFS_ATTR(nvmet_ns_, resv_enable);
=20
+static ssize_t nvmet_ns_blksize_shift_show(struct config_item *item, cha=
r *page)
+{
+	return sysfs_emit(page, "%d\n", to_nvmet_ns(item)->blksize_shift);
+}
+
+static ssize_t nvmet_ns_blksize_shift_store(struct config_item *item,
+		const char *page, size_t count)
+{
+	struct nvmet_ns *ns =3D to_nvmet_ns(item);
+	u32 shift;
+	int ret;
+
+	ret =3D kstrtou32(page, 0, &shift);
+	if (ret)
+		return ret;
+
+	mutex_lock(&ns->subsys->lock);
+	if (ns->enabled) {
+		pr_err("the ns:%d is already enabled.\n", ns->nsid);
+		mutex_unlock(&ns->subsys->lock);
+		return -EINVAL;
+	}
+	ns->blksize_shift =3D shift;
+	mutex_unlock(&ns->subsys->lock);
+
+	return count;
+}
+CONFIGFS_ATTR(nvmet_ns_, blksize_shift);
+
 static struct configfs_attribute *nvmet_ns_attrs[] =3D {
 	&nvmet_ns_attr_device_path,
 	&nvmet_ns_attr_device_nguid,
@@ -806,6 +835,7 @@ static struct configfs_attribute *nvmet_ns_attrs[] =3D=
 {
 	&nvmet_ns_attr_buffered_io,
 	&nvmet_ns_attr_revalidate_size,
 	&nvmet_ns_attr_resv_enable,
+	&nvmet_ns_attr_blksize_shift,
 #ifdef CONFIG_PCI_P2PDMA
 	&nvmet_ns_attr_p2pmem,
 #endif
diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-c=
md-bdev.c
index 83be0657e6df..a86010af4670 100644
--- a/drivers/nvme/target/io-cmd-bdev.c
+++ b/drivers/nvme/target/io-cmd-bdev.c
@@ -100,7 +100,9 @@ int nvmet_bdev_ns_enable(struct nvmet_ns *ns)
 	}
 	ns->bdev =3D file_bdev(ns->bdev_file);
 	ns->size =3D bdev_nr_bytes(ns->bdev);
-	ns->blksize_shift =3D blksize_bits(bdev_logical_block_size(ns->bdev));
+
+	if (!ns->blksize_shift)
+		ns->blksize_shift =3D blksize_bits(bdev_logical_block_size(ns->bdev));
=20
 	ns->pi_type =3D 0;
 	ns->metadata_size =3D 0;
diff --git a/drivers/nvme/target/io-cmd-file.c b/drivers/nvme/target/io-c=
md-file.c
index 2d068439b129..5893b64179fb 100644
--- a/drivers/nvme/target/io-cmd-file.c
+++ b/drivers/nvme/target/io-cmd-file.c
@@ -49,12 +49,15 @@ int nvmet_file_ns_enable(struct nvmet_ns *ns)
=20
 	nvmet_file_ns_revalidate(ns);
=20
-	/*
-	 * i_blkbits can be greater than the universally accepted upper bound,
-	 * so make sure we export a sane namespace lba_shift.
-	 */
-	ns->blksize_shift =3D min_t(u8,
-			file_inode(ns->file)->i_blkbits, 12);
+	if (!ns->blksize_shift) {
+		/*
+		 * i_blkbits can be greater than the universally accepted
+		 * upper bound, so make sure we export a sane namespace
+		 * lba_shift.
+		 */
+		ns->blksize_shift =3D min_t(u8,
+				file_inode(ns->file)->i_blkbits, 12);
+	}
=20
 	ns->bvec_pool =3D mempool_create(NVMET_MIN_MPOOL_OBJ, mempool_alloc_sla=
b,
 			mempool_free_slab, nvmet_bvec_cache);
--=20
2.48.1

