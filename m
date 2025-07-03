Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E742D8763
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534797; cv=none; b=Er9o1S5Z1zsdFG23Qi6qngn3g2TajUUyb5Qp7a0OQMdd0G2KO8dci8MsdKyTVeuqIvo+8kju88D83IErw+OeJ+e2WaQ5cEoH3edT409PmYt8shcEJYC4aoiENH6NyxgPv0bIztlKB46v4auwzXwyAzWo9GKpfVr5niekSktdztM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534797; c=relaxed/simple;
	bh=fM0VFuiMREMNY+584mngGa0LdaJ7mBTcKY8yQT4Zb4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FeLMQ4Y9Tp4KeNZW7r4a6Qsi/KC/pBfWqBuUvUvovsZJgpMzCKcpJu3dzTwakD7XLOpTzDAF9HoOYaB2LKOu5BsiPkhaI+jwmCcFcXhi5g0UmlOjpYUEWkwyFNq3URm3PLph2t1ZDhEAOG1VqJ79q0hPsy1T2O4kH/2g/R2Nyks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EEmw5i1b; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EEmw5i1b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751534795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zmW6YKzoCEgs1ffMR1uB9KKsFPVquRoas1pcF/ETX4A=;
	b=EEmw5i1bf1yCVadQ7dLkgk/hU6VYwmGYePsG3SL5cx5B/UQR2dsYjVgqClqslMPixLwbJl
	8nK6ZzocJWesWPHQO6/mHWPVbvgH5oSGDdf3MSOoXV3ukqh0H/jHvCU9lEIxIAr8+3ru0d
	mBjcV3ngPIdFGX2SGrJkj9xOifQxMZc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-y-SnSMwLPAWpHAddGjZ8iQ-1; Thu, 03 Jul 2025 05:26:34 -0400
X-MC-Unique: y-SnSMwLPAWpHAddGjZ8iQ-1
X-Mimecast-MFC-AGG-ID: y-SnSMwLPAWpHAddGjZ8iQ_1751534793
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4e9252ba0so3290597f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 02:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751534792; x=1752139592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmW6YKzoCEgs1ffMR1uB9KKsFPVquRoas1pcF/ETX4A=;
        b=wizEUn7cw6j6RxeOW1j6VMHiC2+BE0YQl0HDkTOkTVPaX7Mr701b1A+6e6CI72gajU
         UGGv8ZIy20N8c/eqxgscKovA85Mn625zKyccz27zFOIS32w+y4N69IJ7FcAHJXRaKa0g
         DsWNvwbw0iBIlZurcGWfPnS785ipnGJeXv3/e5vVZaiI+jsVa/ROYbeangdGzu1W1o6C
         DOeLhQcpr0DW/1xUxlg3gEizaYQF7LN5EIaagF1BVHKLqyJgDYNH1cKaoEz2UxqAHnYV
         nqapG7BrWOyY+16iUjp0jBtsiF/9P2j/fppixbb/P0dAvS+iX/5VRPwEiHt1SCe7fSow
         m1TA==
X-Gm-Message-State: AOJu0Yxb8vfrn1iQUvQSLvZ4Z852fKzrtxHlHYTu3Z5Vxc8XH3+HPTwr
	NMKYFtF2UiOUGAEUEkKf4ky7km4zJPmyQJeR/VrbeWlwo8u9vPXawZU7t+DItiBYW1FRKFg8Q8t
	p1ylr5P/82PK2JxFtO6UUCXlWBbAeXgrvdYXaTuOEl8g0gMyQnHXx866/kUn1BppWupqSGXdgp7
	e4BktQK2xtoWN3q4F8kzdK+kMiMFsGuxnsva8EtbCCADo=
X-Gm-Gg: ASbGncs3Gz7wwe22nW65ZAzw7xzpyntx+d+awDhqIMD5BsO61GF5W/l2yMEEQ4eshNe
	PS3TTngn+t90qUILY6fh23N3qW8RmYwdlUT0NRPGzA46gu99A6lc+yb1DvHQBxP4NpQnutOtgVt
	57xcV6GLMUPTLaiG7o4/jECAvpjLu5GQ8JPZTQl2XJwuJGWkYsFrX1qeqZNt8UnknZCO4TSrrbH
	c9POQa+iOxdKT+t31eqLUPM2/uGVVfmMxM3u5l6P40ulhiF1gWhp7E9g8nNLZOxtOJY9tZzTZc7
	IoyAYKY10IwLLh07
X-Received: by 2002:a05:6000:491a:b0:3a4:ef33:e60 with SMTP id ffacd0b85a97d-3b32da93488mr1960770f8f.40.1751534792425;
        Thu, 03 Jul 2025 02:26:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8b1TQBfjA4pFNMI59PREmCgzTYZIOsLlPCQGGaGlAM2M5yrv0rTLLaT3Od8ohCZ61d5wRvQ==
X-Received: by 2002:a05:6000:491a:b0:3a4:ef33:e60 with SMTP id ffacd0b85a97d-3b32da93488mr1960735f8f.40.1751534791959;
        Thu, 03 Jul 2025 02:26:31 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152e:1400:856d:9957:3ec3:1ddc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa8fasm18050453f8f.28.2025.07.03.02.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 02:26:31 -0700 (PDT)
Date: Thu, 3 Jul 2025 05:26:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Lukas Wunner <lukas@wunner.de>, Keith Busch <kbusch@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Parav Pandit <parav@nvidia.com>, virtualization@lists.linux.dev,
	stefanha@redhat.com, alok.a.tiwari@oracle.com,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: [PATCH RFC v4 2/5] virtio: fix comments, readability
Message-ID: <5cc87ae71e8a61f53e4534bab92f7ad19fc3524a.1751534711.git.mst@redhat.com>
References: <cover.1751534711.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751534711.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent

Fix a couple of comments to match reality.
Initialize config_driver_disabled to be consistent with
other fields (note: the structure is already zero initialized,
so this is not a bugfix as such).

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/virtio/virtio.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
index 95d5d7993e5b..c441c8cc71ef 100644
--- a/drivers/virtio/virtio.c
+++ b/drivers/virtio/virtio.c
@@ -147,7 +147,7 @@ EXPORT_SYMBOL_GPL(virtio_config_changed);
 
 /**
  * virtio_config_driver_disable - disable config change reporting by drivers
- * @dev: the device to reset
+ * @dev: the device to disable
  *
  * This is only allowed to be called by a driver and disabling can't
  * be nested.
@@ -162,7 +162,7 @@ EXPORT_SYMBOL_GPL(virtio_config_driver_disable);
 
 /**
  * virtio_config_driver_enable - enable config change reporting by drivers
- * @dev: the device to reset
+ * @dev: the device to enable
  *
  * This is only allowed to be called by a driver and enabling can't
  * be nested.
@@ -530,6 +530,7 @@ int register_virtio_device(struct virtio_device *dev)
 		goto out_ida_remove;
 
 	spin_lock_init(&dev->config_lock);
+	dev->config_driver_disabled = false;
 	dev->config_core_enabled = false;
 	dev->config_change_pending = false;
 
-- 
MST

