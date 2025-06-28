Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008351A0703
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 18:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751137138; cv=none; b=lPfsZ/J9/CvXfBJNk/Ax0MV15rMw1aVGwMc0qdMUllCkzxtT6MRoBCRdrHrsz0TrvVKZZ4rPL7wU+fjb8ei9pU6bOPiYHPVp5uMCzY3w8kc8jMppu6PwOXKyTnmWLlbrfmf1rK12C34OWO3DB4STu3R7tLhpZDqH9FP2Qt8c6Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751137138; c=relaxed/simple;
	bh=ztg5EsMbdjxvKumjrsUF9Vbhn9ZJVkNBuY302Z6WDro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dvEvccC6ar5sbDg0lVlzXYE6Q7jrKwIHTwOiC2yxQbuxmpzzI8f0Sg7PSdygNjeDD6nkw658ZvKbIb0vYn5cwh3I5cLSEoC6TWSX/UB9ZMjScTXwaGBXzkor9JrDnr0Eol4JL4sUNw3oTTtlw2tj5cXeg8nv0Bel+htfRC6XwF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OEZgAbcJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OEZgAbcJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751137135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=D2jr+MLExuQlTYBzZJpvrbRyvQXC+JLX+EMkY/N8xKM=;
	b=OEZgAbcJab2rHE3cNHp24bq2b+9IJ6PGJXkX0GHnb6qbuUUxi1PM0I/WcY/qJ8K7nj6YMD
	E/cK9AYPtV2UYrCwkC8jtravy65hOD6gdh6ghQ+eme5lAuHs4LOiKG9/F6L1tYvB+n5sMH
	//PBlvWKz3FdRN2O4xckvZdhSGWBazw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-di_NK26pOU25hq9TUl_0Pg-1; Sat, 28 Jun 2025 14:58:53 -0400
X-MC-Unique: di_NK26pOU25hq9TUl_0Pg-1
X-Mimecast-MFC-AGG-ID: di_NK26pOU25hq9TUl_0Pg_1751137133
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a5780e8137so2014209f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 11:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751137132; x=1751741932;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D2jr+MLExuQlTYBzZJpvrbRyvQXC+JLX+EMkY/N8xKM=;
        b=OCz95hLaoTRslV1ujYHfy+kjfNsTJGpmbCocwMZwl7JbcSCj5ZlYlaZ9P3GjSbveuS
         zkQ9jeT7M8GIHXHiEdbkGGhNdkbRXNpwZz0VsK9Epv//c5Rke/VXJIBYMWXoj8gJOKuq
         EsaO0f2Oa5ynWXXzF+YSyi4kqHSZHSyX0u6KEKHrjKXJy+tWfu87Q8pnyXUYYoI68hcy
         hHqXclrCK6JiU33cCWsjg5a/LnAi66H2rEyb7yCjZf8Sg1nt0ocj4ghj5LlKy92mpoyI
         R2p03v6ucMhDqOmEJeYKJH91XsPCTjXXFQ9hRHdSoe9E2AYEAETX+rVj4oigYc2csRL4
         DYmg==
X-Gm-Message-State: AOJu0YwaK4QFVMUavutwqVgBI3mjTjbKO6vGvZxpBvZakt4Z7dPBQkoR
	r4+S3AuN/87Ur2mKRtF27ZQFrzPmx9AuOW8anUOUx2w5ZBdI7KECLh+mLrXISkOEJgbvOiPFkI/
	YOULuz9+t3bNEQ4mFJAd1xic+FJfAeAyFjs3ZzCssvILs/FTVTEXan91ks4N+4hnaqpk6nBBWIT
	oea7wVPeuwmSFLayttBK0o+66wiM41cCBK082E4L77oaY=
X-Gm-Gg: ASbGncsjxSbaLg1QHuLljQjMGCpiVkQsnaHQptz7oPUXwfDopc1fFwkC3tSzBH6OYLc
	xLKwMV4owMjNgJzNa5y6oImXukN2HtHkrhYdWJS/Acmj0XcNNecSSM79ztt0iB2tYqWrQt5X2a5
	C+qhAi09Kt005al5Oo8d1Jed+sbiY/HaX4Im5orlVvi2LJBEpw38Lq+KwN/vW4NnNJedKqRczV9
	9x69ns5EpVLo7o2BRSppO9Zx9DTJsJBzXigIKJu125h40K4bp/CLVyTpY4mNlzdIVaK75/0bOWU
	rW8ZFrquPzYckQ7U
X-Received: by 2002:a05:6000:2d82:b0:3a4:eb7a:2ccb with SMTP id ffacd0b85a97d-3a6f312dca2mr7141647f8f.16.1751137132140;
        Sat, 28 Jun 2025 11:58:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBJMUvsuhSV4mrdNlnlvt4UgUb//QS8f+KlaM7+aGDdwZ8OM/DCTqh3V0G1zt1cycebQnDQg==
X-Received: by 2002:a05:6000:2d82:b0:3a4:eb7a:2ccb with SMTP id ffacd0b85a97d-3a6f312dca2mr7141634f8f.16.1751137131628;
        Sat, 28 Jun 2025 11:58:51 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152e:1400:856d:9957:3ec3:1ddc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823b6e9esm118646395e9.28.2025.06.28.11.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 11:58:51 -0700 (PDT)
Date: Sat, 28 Jun 2025 14:58:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	Parav Pandit <parav@nvidia.com>, virtualization@lists.linux.dev,
	stefanha@redhat.com, alok.a.tiwari@oracle.com
Subject: [PATCH RFC] pci: report surprise removal events
Message-ID: <11cfcb55b5302999b0e58b94018f92a379196698.1751136072.git.mst@redhat.com>
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

At the moment, in case of a surprise removal, the regular
remove callback is invoked, exclusively.
This works well, because mostly, the cleanup would be the same.

However, there's a race: imagine device removal was initiated by a user
action, such as driver unbind, and it in turn initiated some cleanup and
is now waiting for an interrupt from the device. If the device is now
surprise-removed, that never arrives and the remove callback hangs
forever.

Drivers can artificially add timeouts to handle that, but it can be
flaky.

Instead, let's add a way for the driver to be notified about the
disconnect. It can then do any necessary cleanup, knowing that the
device is inactive.

Given this is by design kind of asynchronous with normal probe/remove
callbacks, I added it in the pci_error_handlers callback.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Warning: build-tested only at this point.

Posting for early flames/feedback.

Cc a bunch of people who discussed this problem specifically in the
virtio blk driver.

 drivers/pci/pci.h   | 9 +++++++++
 include/linux/pci.h | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index b81e99cd4b62..78b064be10d5 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -549,6 +549,15 @@ static inline int pci_dev_set_disconnected(struct pci_dev *dev, void *unused)
 	pci_dev_set_io_state(dev, pci_channel_io_perm_failure);
 	pci_doe_disconnected(dev);
 
+	/* Notify driver of surprise removal */
+	device_lock(&dev->dev);
+
+	if (dev->driver && dev->driver->err_handler &&
+	    dev->driver->err_handler->disconnect)
+		dev->driver->err_handler->disconnect(dev);
+
+	device_unlock(&dev->dev);
+
 	return 0;
 }
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 51e2bd6405cd..30a8c7ee09f6 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -878,6 +878,9 @@ struct pci_error_handlers {
 	/* PCI slot has been reset */
 	pci_ers_result_t (*slot_reset)(struct pci_dev *dev);
 
+	/* PCI slot has been disconnected */
+        void (*disconnect)(struct pci_dev *dev);
+
 	/* PCI function reset prepare or completed */
 	void (*reset_prepare)(struct pci_dev *dev);
 	void (*reset_done)(struct pci_dev *dev);
-- 
MST

