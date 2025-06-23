Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3645A219E0
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 21:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750712614; cv=none; b=IBto2LTeceL7LT1aTS5ZaHcS1fWMaYplhAiR4JolEpbWJx8VxCj1Yl8U8FBc+0XvgcEJRc+76KgjbazVg4c2QynE6ByGGG44JY7APw4STDN4fc6LWPorZWkBEHRpdkMoq8BhCGY7BM52TWyr7LOzf2om9TVlbWJCT18sv2PLUIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750712614; c=relaxed/simple;
	bh=qD/5fpltwi6CQhE4d+QAwzwB+oI1n5lWT7vYOJxetns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=EwDdhG8KrUsv4HGYa7PRQjGzEYuH3zDhzawNSBEEGR1e6XJ9NrmIvrLcqQjD3LDBoEaPZji2yG4JHX5nOsLTzi6Cv5mz0QzssL2GTuEgUpfNWTxKkGgGasi+CudpJjdmV8w0EAt3lA5y5D+9g5W1EfClca37RVggcCg8jDcH/ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (1024-bit key) header.d=fb.com header.i=@fb.com header.b=j/xaq6Ko; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fb.com header.i=@fb.com header.b="j/xaq6Ko"
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKCBBr008218
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:03:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=facebook; bh=VqRePG2wZ9PVe0RngXgpc/S
	8eiBKJ0SeAsNlBmXPwQ4=; b=j/xaq6KosX/nfD65O9N5RWo117zAFkn99KZ5zs5
	z/wKWqwYKKmN0v4KzCIDKHskkij/rAlp2udTg384e7JNPGb0ym7qRAgA9+hcUqSu
	p9iEbwKFoh0weQYR5nFJjbIujODNzKefYBcjsHsKtEL2f3ZEjnwDl5VEKmFR/LnK
	wrac=
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 47dtf0pafb-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:03:32 -0700 (PDT)
Received: from twshared45213.02.ash8.facebook.com (2620:10d:c0a8:1c::11) by
 mail.thefacebook.com (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.24; Mon, 23 Jun 2025 21:02:52 +0000
Received: by devgpu004.nha5.facebook.com (Postfix, from userid 199522)
	id 1B5BE115CA8; Mon, 23 Jun 2025 14:02:39 -0700 (PDT)
From: Alex Mastro <amastro@fb.com>
Date: Mon, 23 Jun 2025 14:02:38 -0700
Subject: [PATCH] vfio/pci: print vfio-device name to fdinfo
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250623-vfio-fdinfo-v1-1-c9cec65a2922@fb.com>
X-B4-Tracking: v=1; b=H4sIAO3AWWgC/x3MQQqAIBBA0avIrBPUUqmrRAvJsWajoSCBePek5
 Vv836BgJiywsQYZKxVKcUBODM7bxQs5+WFQQmlh1MxroMSDpxgSt8ai1U4uq3EwiidjoPe/7Uf
 vH7TMoNRdAAAA
To: Alex Williamson <alex.williamson@redhat.com>
CC: <peterx@redhat.com>, <kbusch@kernel.org>, <kvm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
        Alex Mastro
	<amastro@fb.com>
X-Mailer: b4 0.13.0
X-FB-Internal: Safe
X-Authority-Analysis: v=2.4 cv=RvnFLDmK c=1 sm=1 tr=0 ts=6859c124 cx=c_pps a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=FOH2dFAWAAAA:8 a=_mezBqhOHE8Xc2ruhwAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDE0MSBTYWx0ZWRfX5FpANe6+2sT5 qSBq2IwuedA+nvDpYVFDYKXfeVIw3Ennq5J+mydiCnQpiOvBlz7lvP7q8C5zKvWnci27V6f8Mpc G4mDTveWywbDRm3NNk7dAzaP9Avo/ZmZ1HUa5mYZIi0iKhP7aRD6x2wXA07F4JE6dOkNKPEfxGQ
 pY746yFNEZwAE1tWoCVDKd0g3+z4FsJeVytq3MzKl58bbvQ5DjBNf163vTfe+C2G/0AOHAm1Kmv 0zRsTF02ftCcOaGtB1OCKy3rXc8g0zR9JLuWCG3fsSs2osjQLDpbScta3YKkyGne0sQ/ekbty28 066mO1qE7j0skuvHsw9wbMfzHi+RNDih2rn+7nRQ6dsAkYaAdoEEBh9fw0LBBYUPUVstWqFypAO
 ZB6KcBQNnIca1sa1LHP4gasMj0WYgfJvaJcN3wd/KooqxsnSTb5ZBvzm1pArOct/vNjWFruR
X-Proofpoint-GUID: tq_4pQ2qNjbDI0klP9X0-sL3HE72cXU_
X-Proofpoint-ORIG-GUID: tq_4pQ2qNjbDI0klP9X0-sL3HE72cXU_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_07,2025-06-23_07,2025-03-28_01

Print the PCI device name to a vfio device's fdinfo. This enables tools
to query which device is associated with a given vfio device fd. It's
inspired by eventfd's printing of "eventfd-id" (fs/eventfd.c), which
lsof uses to format the NAME column (e.g. "[eventfd:7278]").

This results in output like below:

$ cat /proc/"$process_using_vfio"/fdinfo/"$vfio_device_fd" | grep vfio
vfio-device-name: 0000:c6:00.0

Signed-off-by: Alex Mastro <amastro@fb.com>
---
Hello, this is my first patch submission to vfio, and linux. We would
like our tools to be able to query the PCI device name for a given
vfio-device fd by inspecting a process's open file descriptors. It is
inspired by eventfd's id printing, which is nicely formatted by lsof in
the NAME column.

I am not sure to what extent this should be generalized, so I opted
to put as little policy as possible into vfio_main.c, and have each
vfio_device_fops implement what it means to show_fdinfo. The only
implementer is vfio_pci_ops in this change.

Alternatively, if we wanted to normalize show_fdinfo formatting, this
could instead hoist the print formatting up into vfio_main.c, and call
an optional vfio_device_ops->instance_name() to get the name. I opted
not to do this here due to unfamiliarity with other vfio drivers, but am
open to changing it.

I noticed that other vfio_device_fops are guarded by checks on
vfio_device_file.access_granted. From what I can tell, that shouldn't
be required here, since a vfio pci device is guaranteed to be
able to print its name (due to existence of vfio_device.pdev) after
vfio_device_ops.init() construction.

This change rooted on the for-linus branch of linux-vfio [1].

[1] https://github.com/awilliam/linux-vfio
---
 drivers/vfio/pci/vfio_pci.c | 14 ++++++++++++++
 drivers/vfio/vfio_main.c    | 15 +++++++++++++++
 include/linux/vfio.h        |  2 ++
 3 files changed, 31 insertions(+)

diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index 5ba39f7623bb..b682766127ab 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -21,6 +21,7 @@
 #include <linux/mutex.h>
 #include <linux/notifier.h>
 #include <linux/pm_runtime.h>
+#include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
@@ -125,6 +126,16 @@ static int vfio_pci_open_device(struct vfio_device *core_vdev)
 	return 0;
 }
 
+#ifdef CONFIG_PROC_FS
+static void vfio_pci_core_show_fdinfo(struct vfio_device *core_vdev, struct seq_file *m)
+{
+	struct vfio_pci_core_device *vdev =
+		container_of(core_vdev, struct vfio_pci_core_device, vdev);
+
+	seq_printf(m, "vfio-device-name: %s\n", pci_name(vdev->pdev));
+}
+#endif
+
 static const struct vfio_device_ops vfio_pci_ops = {
 	.name		= "vfio-pci",
 	.init		= vfio_pci_core_init_dev,
@@ -138,6 +149,9 @@ static const struct vfio_device_ops vfio_pci_ops = {
 	.mmap		= vfio_pci_core_mmap,
 	.request	= vfio_pci_core_request,
 	.match		= vfio_pci_core_match,
+#ifdef CONFIG_PROC_FS
+	.show_fdinfo	= vfio_pci_core_show_fdinfo,
+#endif
 	.bind_iommufd	= vfio_iommufd_physical_bind,
 	.unbind_iommufd	= vfio_iommufd_physical_unbind,
 	.attach_ioas	= vfio_iommufd_physical_attach_ioas,
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 1fd261efc582..e02504247da8 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -28,6 +28,7 @@
 #include <linux/pseudo_fs.h>
 #include <linux/rwsem.h>
 #include <linux/sched.h>
+#include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/stat.h>
 #include <linux/string.h>
@@ -1354,6 +1355,17 @@ static int vfio_device_fops_mmap(struct file *filep, struct vm_area_struct *vma)
 	return device->ops->mmap(device, vma);
 }
 
+#ifdef CONFIG_PROC_FS
+static void vfio_device_show_fdinfo(struct seq_file *m, struct file *filep)
+{
+	struct vfio_device_file *df = filep->private_data;
+	struct vfio_device *device = df->device;
+
+	if (device->ops->show_fdinfo)
+		device->ops->show_fdinfo(device, m);
+}
+#endif
+
 const struct file_operations vfio_device_fops = {
 	.owner		= THIS_MODULE,
 	.open		= vfio_device_fops_cdev_open,
@@ -1363,6 +1375,9 @@ const struct file_operations vfio_device_fops = {
 	.unlocked_ioctl	= vfio_device_fops_unl_ioctl,
 	.compat_ioctl	= compat_ptr_ioctl,
 	.mmap		= vfio_device_fops_mmap,
+#ifdef CONFIG_PROC_FS
+	.show_fdinfo	= vfio_device_show_fdinfo,
+#endif
 };
 
 static struct vfio_device *vfio_device_from_file(struct file *file)
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 707b00772ce1..54076045a44f 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -16,6 +16,7 @@
 #include <linux/cdev.h>
 #include <uapi/linux/vfio.h>
 #include <linux/iova_bitmap.h>
+#include <linux/seq_file.h>
 
 struct kvm;
 struct iommufd_ctx;
@@ -135,6 +136,7 @@ struct vfio_device_ops {
 	void	(*dma_unmap)(struct vfio_device *vdev, u64 iova, u64 length);
 	int	(*device_feature)(struct vfio_device *device, u32 flags,
 				  void __user *arg, size_t argsz);
+	void	(*show_fdinfo)(struct vfio_device *device, struct seq_file *m);
 };
 
 #if IS_ENABLED(CONFIG_IOMMUFD)

---
base-commit: c1d9dac0db168198b6f63f460665256dedad9b6e
change-id: 20250623-vfio-fdinfo-767e75a1496a

Best regards,
-- 
Alex Mastro <amastro@fb.com>

