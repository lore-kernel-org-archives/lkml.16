Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EFE2DECB7
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750882755; cv=none; b=dMEzCKtKRCGZBX4RL9OnTsnTLok4ialYJNbL7CFkrcHRV9GNRNn5Ti61HC/3ywmOPT8PkGh7ZOBleWSFYpB0AwPT/HKgD2YlvbvuvmSThw5n1rVLbuwW1B/bmulmqJUehC7KUZSnm60UgoJ4MEJ8BXUcB9cF/GKISlW8KX3Dyfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750882755; c=relaxed/simple;
	bh=x3K6oL6zDAKX3oSlTP1PWuUNMB8dHUYGjU9fGTdea7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=osbjaOkqkrE8ZT1RIe0MuuSyRdKU42uuE+HwretmRxirzRn9oSefNZN1Wa1sojennB0MgeRlJlxtUoXNFdR4L3v/IQRhceNKQF1BSq7tZlC41akSXrJw5NfQfy2k4HQ/gjkzzBI+0/Kqqi21dZ0Q1eDn3OyPx7FBB6F3NLu2RnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2eLKVCM; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2eLKVCM"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-40abe6f8f08so211913b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750882752; x=1751487552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f60N3EWufzAACjrb2TEVwWx0frS0X8r/okvyufls31E=;
        b=g2eLKVCMYjIT8ebCAgS09wYZaXeVcN/hVB8Wo1BpkVf7xAOxPCEUPBSjBsX03hveJ+
         uhfCauBzITG89CgkgpfwRtuMeiBsZzh5EUlrAojh9IlgBklejlpszYnDe2xdTi/bO4RW
         gpV46QeCI8giOE4tCdU1JCvIn8xjzZv8g+MkUf9/L0lmgqB6657Qi1ppVLi+Lp+YFaYz
         WBM27uolc3SiULd9JDJp8ECFmaUVqz4O5MpS6HRfiGe/8s/W2L0FvPAZS0+aRuCdIpfz
         kcKTCQvY5W9IxzPhDxL/NpKeXtyX7i+V3u96g4oK+q8u8i4YSWfuCMSHaTwRVrmVh+yZ
         Wh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750882752; x=1751487552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f60N3EWufzAACjrb2TEVwWx0frS0X8r/okvyufls31E=;
        b=O8Bw42tCmP6XpxN/QdWIEsb0aAgmMZYZDmGRtNOQTrSHDcym3rlgkyTex1BC8Z3cpN
         D0R/MQzMH6m2ACLoEhQ9wJ19ecy/HBS93FIKyO7MDBZP6ojlDgDVurGsTZoaINOGeapy
         U7PsKPrzVLk5WxxtvBKVgwIih72tdopcWghj7VslJm5zS1y3N0/+utagV/sR5eeJIoJ4
         zYW0JkSQiUzGeQG9WuWn/pT4sBmg/bLJT25GqkavtYZ+8cR75N5WZPomwgklIuyGFhHO
         bVqkXxOKykJlN178i34TBSc5GHucwmwvvz0KYyqB+OQZrfNKcb65b5oHDSjheGEHW6pD
         Tb6Q==
X-Gm-Message-State: AOJu0YyqAEwdbZbUGR6/liMHek9P0+rhRxPHcyuyfB594q0gNY2lk5d5
	iVKS3cZ1pr2sddit6pgmuP2Kd+v5sWw7sTKepUdDp5KSmDe87ge5Dzq7wZYtZ5AO
X-Gm-Gg: ASbGncvf/uDCPo/aU7bcE4xh0gF52V+zte2tX5MPcWY6Y1Q1gEYGH1RD2kEKOacN/06
	w4xGfE5qcx82Jvwo88sCffIsmbRkS3t+FdgJ94IAcPJLymrSjFfeTuJTSVzkUFsu7TxFzPq4I+r
	rsy7nj80R6UCjQkUHLy4zbBJ+N8Njj5uK3UTpQ/8vVW1+Hnz6mGkIEAgG20EbCu35fz3Ko9/AZl
	71Rb52rqxUho8lOKnbd2WJlqrmd5X2R6sXaYTr6l9DChYgUjHE51LTTa5+YBm93+SYcCPdnrORG
	znAbAjuTbx2ncwmI97m3rgWA4Cc8Fwe24I9+dd94s2/oSXEcY7fei+Pa3suLSEhRdU97q7T6lHu
	RyAmE0+8=
X-Google-Smtp-Source: AGHT+IE1GiyMI3FcPixO8wBehxm6oIdPGjQDw2GVFgAwIwdC14AZtTmqP0n8EzwJ7ZQqJDCh44hL0g==
X-Received: by 2002:a05:6808:150f:b0:40a:a633:b1f8 with SMTP id 5614622812f47-40b05a81997mr3795477b6e.9.1750882752169;
        Wed, 25 Jun 2025 13:19:12 -0700 (PDT)
Received: from localhost.localdomain ([143.166.81.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40ac6d22c23sm2319188b6e.42.2025.06.25.13.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 13:19:11 -0700 (PDT)
From: Stuart Hayes <stuart.w.hayes@gmail.com>
To: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Martin Belanger <Martin.Belanger@dell.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Daniel Wagner <dwagner@suse.de>,
	Keith Busch <kbusch@kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	David Jeffery <djeffery@redhat.com>,
	Jeremy Allison <jallison@ciq.com>,
	Jens Axboe <axboe@fb.com>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Jan Kiszka <jan.kiszka@seimens.com>,
	Bert Karwatzki <spasswolf@web.de>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH v10 3/5] driver core: separate function to shutdown one device
Date: Wed, 25 Jun 2025 15:18:51 -0500
Message-Id: <20250625201853.84062-4-stuart.w.hayes@gmail.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20250625201853.84062-1-stuart.w.hayes@gmail.com>
References: <20250625201853.84062-1-stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make a separate function for the part of device_shutdown() that does the
shutown for a single device. This is in preparation for making device
shutdown asynchronous.

Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
Signed-off-by: David Jeffery <djeffery@redhat.com>
---
 drivers/base/core.c | 66 ++++++++++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 30 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 58c772785606..39502621e88e 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -4786,6 +4786,41 @@ int device_change_owner(struct device *dev, kuid_t kuid, kgid_t kgid)
 }
 EXPORT_SYMBOL_GPL(device_change_owner);
 
+static void shutdown_one_device(struct device *dev)
+{
+	/* hold lock to avoid race with probe/release */
+	if (dev->parent && dev->bus && dev->bus->need_parent_lock)
+		device_lock(dev->parent);
+	device_lock(dev);
+
+	/* Don't allow any more runtime suspends */
+	pm_runtime_get_noresume(dev);
+	pm_runtime_barrier(dev);
+
+	if (dev->class && dev->class->shutdown_pre) {
+		if (initcall_debug)
+			dev_info(dev, "shutdown_pre\n");
+		dev->class->shutdown_pre(dev);
+	}
+	if (dev->bus && dev->bus->shutdown) {
+		if (initcall_debug)
+			dev_info(dev, "shutdown\n");
+		dev->bus->shutdown(dev);
+	} else if (dev->driver && dev->driver->shutdown) {
+		if (initcall_debug)
+			dev_info(dev, "shutdown\n");
+		dev->driver->shutdown(dev);
+	}
+
+	device_unlock(dev);
+	if (dev->parent && dev->bus && dev->bus->need_parent_lock)
+		device_unlock(dev->parent);
+
+	if (dev->parent)
+		put_device(dev->parent);
+	put_device(dev);
+}
+
 /**
  * device_shutdown - call ->shutdown() on each device to shutdown.
  */
@@ -4822,36 +4857,7 @@ void device_shutdown(void)
 		list_del_init(&dev->kobj.entry);
 		spin_unlock(&devices_kset->list_lock);
 
-		/* hold lock to avoid race with probe/release */
-		if (parent && dev->bus && dev->bus->need_parent_lock)
-			device_lock(parent);
-		device_lock(dev);
-
-		/* Don't allow any more runtime suspends */
-		pm_runtime_get_noresume(dev);
-		pm_runtime_barrier(dev);
-
-		if (dev->class && dev->class->shutdown_pre) {
-			if (initcall_debug)
-				dev_info(dev, "shutdown_pre\n");
-			dev->class->shutdown_pre(dev);
-		}
-		if (dev->bus && dev->bus->shutdown) {
-			if (initcall_debug)
-				dev_info(dev, "shutdown\n");
-			dev->bus->shutdown(dev);
-		} else if (dev->driver && dev->driver->shutdown) {
-			if (initcall_debug)
-				dev_info(dev, "shutdown\n");
-			dev->driver->shutdown(dev);
-		}
-
-		device_unlock(dev);
-		if (parent && dev->bus && dev->bus->need_parent_lock)
-			device_unlock(parent);
-
-		put_device(dev);
-		put_device(parent);
+		shutdown_one_device(dev);
 
 		spin_lock(&devices_kset->list_lock);
 	}
-- 
2.39.3

