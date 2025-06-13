Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCA819CD17
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822087; cv=none; b=nrxWIBmb0NYlgXlb4/D4Yse19QHKNMxbRJphuk0FM0lSUJr7m+ZXqZzsRtCZSyNQIlk3vBJvjkTdeuWu7E53bLAOznmyrrCqDZD9K9aiClRJDtmzbWqjxhDtO900ukkGrSC6Y0e9ZhwV1+8C+RjmMwSzyY+sSUD5HJtQORFtNCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822087; c=relaxed/simple;
	bh=dpUMDqRxYyy7EaOTCpbZ2yM1jpnDsm+aUl6N3AthocU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dD042Lhh7kHYkRKg9EltZtGZkVNuBXC14GUtc3FDrqK2aj9wgbVifWHme62wQlIj9xFGIUMXA/sVJ3r9SvODFhP2tLoYJFaEo9hYulm7QYgNijQh9KKcgC119DWUEljUUnR6Fc6mGKEPCSJIXSHcmHPCMiY4dV/lDpSaDyiT6WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a96OmX46; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a96OmX46"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749822085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=srvKo/GW1EbJBPf9Cl0G9P4CrJB0MZAkcimCCvUCpgo=;
	b=a96OmX46C9eye53EyEderJilc6ft4WSjYYJZEQgaQqC7A8Ueh8tcv/pH2gv2sCNysEeagO
	Owz1MDexk3a7o10ARiptNkIgcwLIAsmn10WKI7TAOIwdiM++Agw5vRTck8aW7pg/TodfBD
	tcNn3KwyX5hhFfuU09UNv7NHTnoQhK0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-_Dn6ugkjNSOa30tOK8kkSg-1; Fri, 13 Jun 2025 09:41:24 -0400
X-MC-Unique: _Dn6ugkjNSOa30tOK8kkSg-1
X-Mimecast-MFC-AGG-ID: _Dn6ugkjNSOa30tOK8kkSg_1749822084
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d2107d6b30so328118185a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749822083; x=1750426883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=srvKo/GW1EbJBPf9Cl0G9P4CrJB0MZAkcimCCvUCpgo=;
        b=myjrwccsrEy/Ty6Dr0C6VgplOYNaMAEfJ2+UwUkFdq4KmVE0QihdKXK56uuNiCKcwv
         gBESZUtD1+hGk+qyYZ9didrlkbHDlHYQvh6oq/ZQ7Hcc5B2S4eRd184y6NAHZKqktwVk
         bDPWCi4985PDoEDNTajK8LXq6jZFBFiVpsAfQgaktvXEn4fcRtAugcVAoF+CEdAIQanM
         sllTzB0VJY5aZbIj7eMk7GNehc7Df9Oma9umBKBOLJfI4YmuqjZ2KjcQt5Rn//tEWH2M
         PvgIjlapDHt5kxpijbVcPicCV41ukg6SW0+w5s7S2+rSYoIDFc1wbDV4ncui7Ar/7+LQ
         xqsA==
X-Gm-Message-State: AOJu0YxH66FQX3lyzSRK1eJWGBSQpl47L+y/s2qVqr4kmpQK+9dfjsK5
	EZ+H//NGgSBAeGqo/uAB54Zcb0dt+9Gqfy4nzjsJ0ZRfKtz/KKCR/IGYRgIWto++oQzKIfJUNLo
	pLdxlcZg6fy09VpjbrIKGn0TdmpyDtiTX0uxnE/Off0+ErV5WujsXUhzYpUWsRMYxpfLHyEsoeF
	yW0YXgf+Q3c7RF2z5rmTkA5gvQznkEYgl33IMXO8tPM+X22Ak=
X-Gm-Gg: ASbGnctnYMJv7VJO5OyA9H+m8Jw3VnS6ytjpQN/f7psn8YGcHmF3YLrtcRCPFh2uuGt
	LV90eBnZ7oOk9CeChaxoKsvPakyRjSPupYBFGWkZa11ijPgHQqSEW1+FKr/I3iWPrUxUzd0N1p8
	neIThtHtPAlcMB9BFuKSX3UU4cGlMQ4qilB63/RhB6cniWCyT9ewZMRZi3v0y7OIJ6evpU4d3K2
	drkhd88hzOl2D++HIeL59QCBngkAsNr3Ktu6ZuQ3hH6ZgSB1Z+I/oDtjJ6qtsU/8z5UWUHzDTiX
	vIPqf+ig18o=
X-Received: by 2002:a05:620a:2627:b0:7cd:3f01:7c83 with SMTP id af79cd13be357-7d3bc44a1f9mr399254285a.39.1749822083063;
        Fri, 13 Jun 2025 06:41:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGy9xhb6Ir/WTjwOiKTV6R2xWTKghNAist5R7llcPyhmuhj1jELKcIWu8eGBTg4hcMRpO8q+w==
X-Received: by 2002:a05:620a:2627:b0:7cd:3f01:7c83 with SMTP id af79cd13be357-7d3bc44a1f9mr399250685a.39.1749822082633;
        Fri, 13 Jun 2025 06:41:22 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8ee3f72sm171519285a.94.2025.06.13.06.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 06:41:21 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kvm@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Alex Mastro <amastro@fb.com>,
	David Hildenbrand <david@redhat.com>,
	Nico Pache <npache@redhat.com>,
	peterx@redhat.com
Subject: [PATCH 4/5] vfio: Introduce vfio_device_ops.get_unmapped_area hook
Date: Fri, 13 Jun 2025 09:41:10 -0400
Message-ID: <20250613134111.469884-5-peterx@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613134111.469884-1-peterx@redhat.com>
References: <20250613134111.469884-1-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a hook to vfio_device_ops to allow sub-modules provide virtual
addresses for an mmap() request.

Note that the fallback will be mm_get_unmapped_area(), which should
maintain the old behavior of generic VA allocation (__get_unmapped_area).
It's a bit unfortunate that is needed, as the current get_unmapped_area()
file ops cannot support a retval which fallbacks to the default.  So that
is needed both here and whenever sub-module will opt-in with its own.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 drivers/vfio/vfio_main.c | 18 ++++++++++++++++++
 include/linux/vfio.h     |  7 +++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 1fd261efc582..19db8e58d223 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1354,6 +1354,23 @@ static int vfio_device_fops_mmap(struct file *filep, struct vm_area_struct *vma)
 	return device->ops->mmap(device, vma);
 }
 
+static unsigned long vfio_device_get_unmapped_area(struct file *file,
+						   unsigned long addr,
+						   unsigned long len,
+						   unsigned long pgoff,
+						   unsigned long flags)
+{
+	struct vfio_device_file *df = file->private_data;
+	struct vfio_device *device = df->device;
+
+	if (!device->ops->get_unmapped_area)
+		return mm_get_unmapped_area(current->mm, file, addr,
+					    len, pgoff, flags);
+
+	return device->ops->get_unmapped_area(device, file, addr, len,
+					      pgoff, flags);
+}
+
 const struct file_operations vfio_device_fops = {
 	.owner		= THIS_MODULE,
 	.open		= vfio_device_fops_cdev_open,
@@ -1363,6 +1380,7 @@ const struct file_operations vfio_device_fops = {
 	.unlocked_ioctl	= vfio_device_fops_unl_ioctl,
 	.compat_ioctl	= compat_ptr_ioctl,
 	.mmap		= vfio_device_fops_mmap,
+	.get_unmapped_area = vfio_device_get_unmapped_area,
 };
 
 static struct vfio_device *vfio_device_from_file(struct file *file)
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 707b00772ce1..48fe71c61ed2 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -108,6 +108,7 @@ struct vfio_device {
  * @dma_unmap: Called when userspace unmaps IOVA from the container
  *             this device is attached to.
  * @device_feature: Optional, fill in the VFIO_DEVICE_FEATURE ioctl
+ * @get_unmapped_area: Optional, provide virtual address hint for mmap()
  */
 struct vfio_device_ops {
 	char	*name;
@@ -135,6 +136,12 @@ struct vfio_device_ops {
 	void	(*dma_unmap)(struct vfio_device *vdev, u64 iova, u64 length);
 	int	(*device_feature)(struct vfio_device *device, u32 flags,
 				  void __user *arg, size_t argsz);
+	unsigned long (*get_unmapped_area)(struct vfio_device *device,
+					   struct file *file,
+					   unsigned long addr,
+					   unsigned long len,
+					   unsigned long pgoff,
+					   unsigned long flags);
 };
 
 #if IS_ENABLED(CONFIG_IOMMUFD)
-- 
2.49.0

