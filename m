Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637F913C8EA
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 23:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748907803; cv=none; b=mc6/anqDTLRnhtrWyKvzdUD4EHyQNiDeJiiywji+Jehnu9dfBa6HEY1dg34rlai04ZDj6hv+BTBgIZzTQRRStAByGTNdK0As3Q1xEeuzjNlDsrRLHI+0lxuuhhqCNvJ0yziVmdIJyiGshBxF3uxjLmhICFkYam6NYLSmI89H4Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748907803; c=relaxed/simple;
	bh=YqE+W6jQxuTAJfbi5OS2/chhxfdK57zuGvwqfvYE7XA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DZS3BGnlzvjS82LniZ4B9IHBXGH1A3Ib9KPkqwIzSJA+3nfYxj43LlEhob2mbx4G/1W2MHHdAg0bXKURLAGeIVhVwvjBP4CRJGuKP12HWdlXHm2ELrf8dLKGncdpqEYuWvOLcbnRVKA8QIyUULTkRg7qO5b+ZVTUxDY8IIwHAXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=SbEtLRXh; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="SbEtLRXh"
Received: from DESKTOP-0403QTC.corp.microsoft.com (unknown [52.148.171.5])
	by linux.microsoft.com (Postfix) with ESMTPSA id A050921176C0;
	Mon,  2 Jun 2025 16:43:20 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A050921176C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1748907800;
	bh=SGcI4wZ1D7VewwWSgrIktnH/ABDLXFaUu5vyh5PjmTc=;
	h=From:To:Cc:Subject:Date:From;
	b=SbEtLRXhFBN50IJ62m33jzLpfHGieWYwVfdyVpaDWZQGIeanvjJt32YTIiOwwoLYF
	 j3XUVjcoDMVgYrUb2WdzFp79U6xI23kdC5RoQ2NBFsQC9sOj10o1HOGlhtW9AlThTD
	 lLIy7QWAqII/VnVkWMfyxj5RgRRJRlsXT4y/h2Ag=
From: Jacob Pan <jacob.pan@linux.microsoft.com>
To: linux-kernel@vger.kernel.org,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	Alex Williamson <alex.williamson@redhat.com>,
	"Liu, Yi L" <yi.l.liu@intel.com>,
	"jgg@nvidia.com" <jgg@nvidia.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: Zhang Yu <zhangyu1@microsoft.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Saurabh Sengar <ssengar@linux.microsoft.com>
Subject: [PATCH 1/2] vfio: Fix unbalanced vfio_df_close call in no-iommu mode
Date: Mon,  2 Jun 2025 16:43:18 -0700
Message-Id: <20250602234319.4404-1-jacob.pan@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For no-iommu enabled devices working under IOMMUFD VFIO compat mode, the
group open path does not call vfio_df_open() and the open_count is 0. So
calling vfio_df_close() in the group close path will trigger warning in
vfio_assert_device_open(device);

E.g. The following warning can be seen by running VFIO test.
https://github.com/awilliam/tests/blob/master/vfio-noiommu-pci-device-open.c
CONFIG_VFIO_CONTAINER = n
[   29.094781] vfio-pci 0000:02:01.0: vfio-noiommu device opened by user (vfio-noiommu-pc:164)
Failed to get device info
[   29.096540] ------------[ cut here ]------------
[   29.096616] WARNING: CPU: 1 PID: 164 at drivers/vfio/vfio_main.c:487 vfio_df_close+0xac/0xb4

This patch adds checks for no-iommu mode and open_count to skip calling vfio_df_close.

Signed-off-by: Jacob Pan <jacob.pan@linux.microsoft.com>
---
 drivers/vfio/group.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index c321d442f0da..834421149ffe 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -238,12 +238,13 @@ void vfio_df_group_close(struct vfio_device_file *df)
 	mutex_lock(&device->group->group_lock);
 	mutex_lock(&device->dev_set->lock);
 
-	vfio_df_close(df);
-	df->iommufd = NULL;
-
 	if (device->open_count == 0)
 		vfio_device_put_kvm(device);
 
+	if (!vfio_device_is_noiommu(device))
+		vfio_df_close(df);
+
+	df->iommufd = NULL;
 	mutex_unlock(&device->dev_set->lock);
 	mutex_unlock(&device->group->group_lock);
 }
-- 
2.34.1

