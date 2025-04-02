Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F541EDA0E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 20:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743626189; cv=none; b=rGC73JVBEq1fYgK7uUl1zpi+lwnZQmCmINfKTy8szhPl6/kNkn9A1o6MBukLMoen769KnWHnszipUOPvDjvCQBrH0kA2sdFgsZYvun8qsPiph8dJIUYevhshS67ajm2Zg6Govh0XT0Gf5EQsryGGFIGIdvlMFkLP5mtKCmGTXPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743626189; c=relaxed/simple;
	bh=GszcYwqppvH6c+G7ipEj8NNJbPNHucZXACEFbgVDUKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E8nZ3M+QrxJ3DZNgZO8t+x09u9oQap8/cILkJHIqJxIF5NsCVc4FZqq3PADm+HISU+ymC9PIlQh24YVZr03M3XCgZ/lMxPcCL7UtC9LCgOB/jIH/l+sTiDW8W+tfSg9UKx8VSkm8MzjPiEVGk148xTs9tVSYFbUO+1dp1ymyEzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GAKe1fXn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GAKe1fXn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743626186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8MlOWegrNjUrGy0v33qQgzJGV71qGayB5idzbVGp1s8=;
	b=GAKe1fXnyeQDwbTyov3Q3cqiDUpP43FIeZjyAzk1GRU7g21Ewv0Ft27W9Kp7tRgkoifc/1
	KTs5z4SamRVVAmiAbUhRbEWe2sTpOYtWle9dfui6fwjRq+Csfltm6beKBIi7OPKyDcCzHL
	2pePHFkNMuCMIwi4ECdonoTkbiYx8KY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-b4zuyrpvM7KA-pKLpC9Kng-1; Wed, 02 Apr 2025 16:36:25 -0400
X-MC-Unique: b4zuyrpvM7KA-pKLpC9Kng-1
X-Mimecast-MFC-AGG-ID: b4zuyrpvM7KA-pKLpC9Kng_1743626184
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac7791ecb7bso22270066b.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 13:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743626184; x=1744230984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8MlOWegrNjUrGy0v33qQgzJGV71qGayB5idzbVGp1s8=;
        b=Vp/r0Orrk0AFgf660hB9CdBUykXRdV+F5XSCqfJt70oEFUa0kiVMeTWpzT2xV5+vmx
         cBKEXPTJ1rSsaNJLpTv8He2Kfn+8C6h2uiVDuuEiyUo/fTqGBOtGJ5ZiITN/7ZJS8hJp
         dx3dkZ5RD2v+j28VAEkrt/HwCc6rCkPFvbATKO2iAA0nThE+mpU1HK2InnzvHBI3VUw0
         MnImeRu2SIq5ooo5GDNMqIjUH3F7qNiEl+/kzUBIdy4NakqkbzzW9K85svGVuq7/b4qQ
         ciSEWQRHL71eliSQXNyXrNTDZOA0QzBEf64OmvrhaEUIps3M3IZljP1HfuSSD0LPkhm8
         Cx0Q==
X-Gm-Message-State: AOJu0YxNjksR6/2rCcuDm+1XCXHpKHBbsa58k6Vzor5fhn2wZ8nJIMEY
	9oVG/MAyy5z+YBn3NFauugp2XtgJrO11++crdOVZ67y+qLQToLvCTz/16WZMepoPqoPZrlszkjq
	A5Tx5lu4VBOW4sTrU6up4kYL6uU+waj1kTeWTCQELXFv4V+IqfV7axSYAmsxaSY6irPGxgn4aO2
	jf/evoMNJoy8776aVgAtCCE1QEongqEZuW782tWiYDOl+S
X-Gm-Gg: ASbGncuZn6l+lHM5Q7aP/LOiS5qJOAdSIUQm1fj/jQnDUzuQaTNXf+KFQnaCaOHOUr5
	isgggcTDejbqi7LKanwBPr8UYLrmLANc7IVetoGVs2LpC0GQyH46Hqp71eoqU2K9lMP4y0Lu6m+
	BdzLKe8tcgBAD+srIEy5GrwBwn8AWnl8YcaGomudwInYFNCF2bkSNMXFJG0rXRzMzrB5GZoWDfb
	cvaQQvNbY1DUCLS7YFIUkdqLBZfQSb8AxY20p1vKLdHVLgh39t8SLBkXJzThH+taVBHSGLtIgzd
	aan9e4WIcXI8S0rX0xDY6xfUSeVq3A8f+BAM10+mVZSzwnt2ZBt72xmorqDXb7domgPHAiea1Ts
	=
X-Received: by 2002:a17:907:2d93:b0:ac3:8537:9042 with SMTP id a640c23a62f3a-ac7b70f71f6mr76493266b.30.1743626184150;
        Wed, 02 Apr 2025 13:36:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHngrOtCLJnP8VBOJzuzsFfd79HnqdyYjTubDkSLEB/gJzx4EaeRH1RTJ5AIRq3h1bnbUuUyg==
X-Received: by 2002:a17:907:2d93:b0:ac3:8537:9042 with SMTP id a640c23a62f3a-ac7b70f71f6mr76489666b.30.1743626183602;
        Wed, 02 Apr 2025 13:36:23 -0700 (PDT)
Received: from localhost (p200300cbc70fcd00406646740d089535.dip0.t-ipconnect.de. [2003:cb:c70f:cd00:4066:4674:d08:9535])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac7196c8281sm975404066b.149.2025.04.02.13.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 13:36:23 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-s390@vger.kernel.org,
	virtualization@lists.linux.dev,
	kvm@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Chandra Merla <cmerla@redhat.com>,
	Stable@vger.kernel.org,
	Cornelia Huck <cohuck@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Wei Wang <wei.w.wang@intel.com>
Subject: [PATCH v1] s390/virtio_ccw: don't allocate/assign airqs for non-existing queues
Date: Wed,  2 Apr 2025 22:36:21 +0200
Message-ID: <20250402203621.940090-1-david@redhat.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If we finds a vq without a name in our input array in
virtio_ccw_find_vqs(), we treat it as "non-existing" and set the vq pointer
to NULL; we will not call virtio_ccw_setup_vq() to allocate/setup a vq.

Consequently, we create only a queue if it actually exists (name != NULL)
and assign an incremental queue index to each such existing queue.

However, in virtio_ccw_register_adapter_ind()->get_airq_indicator() we
will not ignore these "non-existing queues", but instead assign an airq
indicator to them.

Besides never releasing them in virtio_ccw_drop_indicators() (because
there is no virtqueue), the bigger issue seems to be that there will be a
disagreement between the device and the Linux guest about the airq
indicator to be used for notifying a queue, because the indicator bit
for adapter I/O interrupt is derived from the queue index.

The virtio spec states under "Setting Up Two-Stage Queue Indicators":

	... indicator contains the guest address of an area wherein the
	indicators for the devices are contained, starting at bit_nr, one
	bit per virtqueue of the device.

And further in "Notification via Adapter I/O Interrupts":

	For notifying the driver of virtqueue buffers, the device sets the
	bit in the guest-provided indicator area at the corresponding
	offset.

For example, QEMU uses in virtio_ccw_notify() the queue index (passed as
"vector") to select the relevant indicator bit. If a queue does not exist,
it does not have a corresponding indicator bit assigned, because it
effectively doesn't have a queue index.

Using a virtio-balloon-ccw device under QEMU with free-page-hinting
disabled ("free-page-hint=off") but free-page-reporting enabled
("free-page-reporting=on") will result in free page reporting
not working as expected: in the virtio_balloon driver, we'll be stuck
forever in virtballoon_free_page_report()->wait_event(), because the
waitqueue will not be woken up as the notification from the device is
lost: it would use the wrong indicator bit.

Free page reporting stops working and we get splats (when configured to
detect hung wqs) like:

 INFO: task kworker/1:3:463 blocked for more than 61 seconds.
       Not tainted 6.14.0 #4
 "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
 task:kworker/1:3 [...]
 Workqueue: events page_reporting_process
 Call Trace:
  [<000002f404e6dfb2>] __schedule+0x402/0x1640
  [<000002f404e6f22e>] schedule+0x3e/0xe0
  [<000002f3846a88fa>] virtballoon_free_page_report+0xaa/0x110 [virtio_balloon]
  [<000002f40435c8a4>] page_reporting_process+0x2e4/0x740
  [<000002f403fd3ee2>] process_one_work+0x1c2/0x400
  [<000002f403fd4b96>] worker_thread+0x296/0x420
  [<000002f403fe10b4>] kthread+0x124/0x290
  [<000002f403f4e0dc>] __ret_from_fork+0x3c/0x60
  [<000002f404e77272>] ret_from_fork+0xa/0x38

There was recently a discussion [1] whether the "holes" should be
treated differently again, effectively assigning also non-existing
queues a queue index: that should also fix the issue, but requires other
workarounds to not break existing setups.

Let's fix it without affecting existing setups for now by properly ignoring
the non-existing queues, so the indicator bits will match the queue
indexes.

[1] https://lore.kernel.org/all/cover.1720611677.git.mst@redhat.com/

Fixes: a229989d975e ("virtio: don't allocate vqs when names[i] = NULL")
Reported-by: Chandra Merla <cmerla@redhat.com>
Cc: <Stable@vger.kernel.org>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Eric Farman <farman@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Sven Schnelle <svens@linux.ibm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Wei Wang <wei.w.wang@intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/s390/virtio/virtio_ccw.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
index 21fa7ac849e5c..4904b831c0a75 100644
--- a/drivers/s390/virtio/virtio_ccw.c
+++ b/drivers/s390/virtio/virtio_ccw.c
@@ -302,11 +302,17 @@ static struct airq_info *new_airq_info(int index)
 static unsigned long *get_airq_indicator(struct virtqueue *vqs[], int nvqs,
 					 u64 *first, void **airq_info)
 {
-	int i, j;
+	int i, j, queue_idx, highest_queue_idx = -1;
 	struct airq_info *info;
 	unsigned long *indicator_addr = NULL;
 	unsigned long bit, flags;
 
+	/* Array entries without an actual queue pointer must be ignored. */
+	for (i = 0; i < nvqs; i++) {
+		if (vqs[i])
+			highest_queue_idx++;
+	}
+
 	for (i = 0; i < MAX_AIRQ_AREAS && !indicator_addr; i++) {
 		mutex_lock(&airq_areas_lock);
 		if (!airq_areas[i])
@@ -316,7 +322,7 @@ static unsigned long *get_airq_indicator(struct virtqueue *vqs[], int nvqs,
 		if (!info)
 			return NULL;
 		write_lock_irqsave(&info->lock, flags);
-		bit = airq_iv_alloc(info->aiv, nvqs);
+		bit = airq_iv_alloc(info->aiv, highest_queue_idx + 1);
 		if (bit == -1UL) {
 			/* Not enough vacancies. */
 			write_unlock_irqrestore(&info->lock, flags);
@@ -325,8 +331,10 @@ static unsigned long *get_airq_indicator(struct virtqueue *vqs[], int nvqs,
 		*first = bit;
 		*airq_info = info;
 		indicator_addr = info->aiv->vector;
-		for (j = 0; j < nvqs; j++) {
-			airq_iv_set_ptr(info->aiv, bit + j,
+		for (j = 0, queue_idx = 0; j < nvqs; j++) {
+			if (!vqs[j])
+				continue;
+			airq_iv_set_ptr(info->aiv, bit + queue_idx++,
 					(unsigned long)vqs[j]);
 		}
 		write_unlock_irqrestore(&info->lock, flags);
-- 
2.48.1

