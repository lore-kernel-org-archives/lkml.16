Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07496223DCD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 07:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751440712; cv=none; b=Px5kKJvCl3oNcND7xJe5D2DcrtIw3wuh+8gcYYsqqQN7sgb/+t6hoZWcr9vamBp9Zq66OxkDty1Ac8ElyoSeda58vFVa6Uq5g120WV+B43KOp+VnxXoR3My2Ae/9K8ExXGOR1iL5S6mI2e/aYYGOM/P/lU6ZXl7TseZlOi+oJXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751440712; c=relaxed/simple;
	bh=k5Pd5/BIT83oP2t67VS64bMxvicsmjY5oVQ9b3JJ47U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TAzpfp1X+y9NJ/rLacNM5A1S02b63HQGal5rx5g/2Rl0AapGxk+P1p6FiftKy9dC2NfwHW2lyRCctEpQ6xFVKzOVsYJPvBp0XrQFo0Y2BUcQF6j1jdqG86/YbfnqINiiWAl0jQ1AumLPe56bDd0dJUgVctiH19jw3mhnk1qrb30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H3CYVokh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H3CYVokh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751440709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=inET1q5pbqhm6lRPNe+Ci3JjHAH+Px1CXV3xfjQhwa4=;
	b=H3CYVokhpL9VT0XEu5uuJn8Abi9cSKu+DwBaGmB8ecR4SDXtM5SlDbAh6kNlIZ+jiBltF9
	9jvLrwVCvKqhPbBj9py7D9fy9oKuEvP3RO06a/AfYD703GGVde47L06mNISGigQvsUaJts
	HzbwHCPUc6rYIOQi9R8jKNzant62bjI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-Ii6eBM5oPL2XedZCeh4h6A-1; Wed, 02 Jul 2025 03:18:28 -0400
X-MC-Unique: Ii6eBM5oPL2XedZCeh4h6A-1
X-Mimecast-MFC-AGG-ID: Ii6eBM5oPL2XedZCeh4h6A_1751440707
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4eec544c6so3020517f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 00:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751440707; x=1752045507;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=inET1q5pbqhm6lRPNe+Ci3JjHAH+Px1CXV3xfjQhwa4=;
        b=Y4i1AwnZ6BBGmlwt7D9VdDmzqNGGsJXhJXCzbySYymGajtmuWLboWe+f1yPYizmO/C
         NkRPBUwLCpyT+p5pdDMB9cD5jpxhFzI0S4LgaKme+msNb7yVNcOHob/2BqLnt/C1MdSv
         3ne+PsJ3DUu79UuFDdB8rjTKRWylD9MPqrqYyAWRCnZhQ/fwK2ISaaKWizSoYAp86gau
         A3boqwpXDGDD4ayZYzzSnxbwiCpKC/hu2r9Swk9PogMfccBAzKiiQP8Mba/ZIDYY/9OZ
         90T3O00xKCEHo9YrP+WNJpSZoMJFC3SLuE3GX9Qa2gk+12ITtzjZwvXjyIxUG4YT7Ief
         02LA==
X-Gm-Message-State: AOJu0YxnmP2fit5BORsPRLyAb0rtG9iJBGftPqOibR0J7Cel6G5Qzgl1
	3w3Vel7wvwtxIyOeGTJMom+xLsVwhS+S8sqkbHEObJcQjXcUNfmGT60uBGfnQ5N/G7JkiJxYflh
	3niEMWQ611RB2687qUbxOPCdKnucXHVLgEOjGlx+i13qPP6070cyfbamEXceYLWjYSyVjtr/VIP
	T/J59kqjQNzEyCvD7sWxJ1ouVLjLvwNv/kK4NPD3vHSwY=
X-Gm-Gg: ASbGncs1iRJot0wMwSTeFXuZlVlhqn3r8WqL7QLyWfSe9iZRhlKTnJSguHOvZJtckO1
	CAcb5IqqZzcbMdHsjhL5rbYpFefMJ7gY2VeY2IZrErTHcmj++VcW3aZLhpmPCIthB12iXyYRh1b
	Lba4Gj1SOHA77nTWBjNaQlNn5DInNTVkLK1oJLAVkVWfkutGqLcGtxjPT1e5LPEhSHIS8KIvTIG
	dQxAfRMnNXS3VNgBKRlzLQtXQxjDoS3SvATU0/B7EdsOwPumTew+JSxHFLR+F3Zd6iTbHJ+izF6
	zLmPgs2TRC9FDl6x
X-Received: by 2002:a05:6000:4024:b0:3a6:c95c:36c5 with SMTP id ffacd0b85a97d-3b2000adbb6mr945498f8f.40.1751440706480;
        Wed, 02 Jul 2025 00:18:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtz/thPUHxhYk90GD/Wy++u6+yzW285TGChfF0pNKmL94IYhOgQu6evHruei6E5XylsiguYw==
X-Received: by 2002:a05:6000:4024:b0:3a6:c95c:36c5 with SMTP id ffacd0b85a97d-3b2000adbb6mr945455f8f.40.1751440705783;
        Wed, 02 Jul 2025 00:18:25 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152e:1400:856d:9957:3ec3:1ddc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a306a01sm198832195e9.0.2025.07.02.00.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 00:18:25 -0700 (PDT)
Date: Wed, 2 Jul 2025 03:18:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Subject: [PATCH RFC v2] pci: report surprise removal event
Message-ID: <fde33b657c510970342905dfec62328d46036bb7.1751440544.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent

At the moment, in case of a surprise removal, the regular remove
callback is invoked, exclusively.  This works well, because mostly, the
cleanup would be the same.

However, there's a race: imagine device removal was initiated by a user
action, such as driver unbind, and it in turn initiated some cleanup and
is now waiting for an interrupt from the device. If the device is now
surprise-removed, that never arrives and the remove callback hangs
forever.

For example, this was reported for virtio-blk:

	1. the graceful removal is ongoing in the remove() callback, where disk
	   deletion del_gendisk() is ongoing, which waits for the requests +to
	   complete,

	2. Now few requests are yet to complete, and surprise removal started.

	At this point, virtio block driver will not get notified by the driver
	core layer, because it is likely serializing remove() happening by
	+user/driver unload and PCI hotplug driver-initiated device removal.  So
	vblk driver doesn't know that device is removed, block layer is waiting
	for requests completions to arrive which it never gets.  So
	del_gendisk() gets stuck.

Drivers can artificially add timeouts to handle that, but it can be
flaky.

Instead, let's add a way for the driver to be notified about the
disconnect. It can then do any necessary cleanup, knowing that the
device is inactive.

Since cleanups can take a long time, this takes an approach
of a work struct that the driver initiates and enables
on probe, and tears down on remove.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Compile tested only.

Note: this minimizes core code. I considered a more elaborate API
that would be easier to use, but decided to be conservative until
there are multiple users.

changes from v1:
	switched to a WQ, with APIs to enable/disable
	added motivation


 drivers/pci/pci.h   |  6 ++++++
 include/linux/pci.h | 31 +++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index b81e99cd4b62..208b4cab534b 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -549,6 +549,12 @@ static inline int pci_dev_set_disconnected(struct pci_dev *dev, void *unused)
 	pci_dev_set_io_state(dev, pci_channel_io_perm_failure);
 	pci_doe_disconnected(dev);
 
+	if (READ_ONCE(dev->disconnect_work_enable)) {
+		/* Make sure work is up to date. */
+		smp_rmb();
+		schedule_work(&dev->disconnect_work);
+	}
+
 	return 0;
 }
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 51e2bd6405cd..b308d2149bba 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -550,6 +550,10 @@ struct pci_dev {
 	/* These methods index pci_reset_fn_methods[] */
 	u8 reset_methods[PCI_NUM_RESET_METHODS]; /* In priority order */
 
+	/* Report disconnect events */
+	u8 disconnect_work_enable;
+	struct work_struct disconnect_work;
+
 #ifdef CONFIG_PCIE_TPH
 	u16		tph_cap;	/* TPH capability offset */
 	u8		tph_mode;	/* TPH mode */
@@ -2646,17 +2650,44 @@ int pci_for_each_dma_alias(struct pci_dev *pdev,
 /* Helper functions for operation of device flag */
 static inline void pci_set_dev_assigned(struct pci_dev *pdev)
 {
 	pdev->dev_flags |= PCI_DEV_FLAGS_ASSIGNED;
 }
 static inline void pci_clear_dev_assigned(struct pci_dev *pdev)
 {
 	pdev->dev_flags &= ~PCI_DEV_FLAGS_ASSIGNED;
 }
 static inline bool pci_is_dev_assigned(struct pci_dev *pdev)
 {
 	return (pdev->dev_flags & PCI_DEV_FLAGS_ASSIGNED) == PCI_DEV_FLAGS_ASSIGNED;
 }
 
+/*
+ * Caller must initialize @pdev->disconnect_work before invoking this.
+ * Caller also must check pci_device_is_present afterwards, since
+ * if device is already gone when this is called, work will not run.
+ */
+static inline void pci_set_disconnect_work(struct pci_dev *pdev)
+{
+	/* Make sure WQ has been initialized already */
+	smp_wmb();
+
+	WRITE_ONCE(pdev->disconnect_work_enable, 0x1);
+}
+
+static inline void pci_clear_disconnect_work(struct pci_dev *pdev)
+{
+	WRITE_ONCE(pdev->disconnect_work_enable, 0x0);
+
+	/* Make sure to stop using work from now on. */
+	smp_wmb();
+
+	cancel_work_sync(&pdev->disconnect_work);
+}
+
 /**
  * pci_ari_enabled - query ARI forwarding status
  * @bus: the PCI bus
-- 
MST

