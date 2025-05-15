Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D65E194A44
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 19:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747336980; cv=none; b=kZxNmx5FaJmNuDAsuy1xXb3D8tkV5IUGcmMYi0a3RKXEdhkNsQqqayiKgavZ2e1ASkOHxWTHadyRj19jQs2juKpiW5xc7fwdUUTd6YeBvq0pAbjML8+3QisvThSjVTWo61HttWYz6Zy120WIv7tSRah/rTuzfF6tkqUcjLPIEso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747336980; c=relaxed/simple;
	bh=96N46iqOIStqCIhFVpc7U2TEDGtEL6hnmfMs56TVuk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pdshqkWvXJAeout7gjLZyE8ryKYzlAvaBHgvRVmkDyET01g27Bkj9NgZxEH6+X6b6hTEGbmrKjZ/Udl9ssz4hePF38GO9riIafGqcqelzyj27QbTj7IbrDwGxTmMV/SqTzdCNs2xuYPT2BVBOyeo7PetLPrOhXt1qg4jYDhg3LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=eQelwtN6; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="eQelwtN6"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7423fb98cb1so1626000b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747336976; x=1747941776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fyWm0rF9eCaDvUShSNc7s++hP2H/Glv+MtPcJ7Ax5f0=;
        b=eQelwtN6xcwH2rQghkkeaj12hIAqXyv8M9NeiQZeO4eL947l4e5ddGG7KzLFavkZw/
         oj/uEVfSCYXaDRymncHTSShDyQRDZJNBuMap4r7IMp+57Rzj0ZjtiOTqDvu2XO8RWQg0
         hxJG2TX0vZXZRB1vV7z29+2Ao3ud3jfezDEpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747336976; x=1747941776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fyWm0rF9eCaDvUShSNc7s++hP2H/Glv+MtPcJ7Ax5f0=;
        b=XlGHCrN+L7vATJuc66WVfEcweGJHI2CFQYTvO5REzWf6qcK8llbscbhPHyavo0SzQP
         4WhYX14IPr+NJddNjFE8TusbwNUhKLSlbHKb/NbIrGiSRunnr7db50/yBePaGEnyd0of
         CXNmBuMo40PAyq5PsoC8POUhEY0ShXpNx5GkipmBwkZBRgOM3px7QeYS8Yk+eLtfOolt
         3uF3B3X4uojqbvmJ57iMoA/0/QSN65DVk2Jn7Gt9EYryedOAOqqrPDrwY4KACayeje5I
         fKtHyORPI0Al8h+k3Z/fbXci9xbTbMBdJ/lNTrEZroRhjU74cxzGmpXoXxAXF46owTiA
         ey9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXq15GloLbvrnyzQuz+OknUy8grHq3KG5xo12Yvp5BJJyUsBhtM2hVDwirsy+A7anx6mqZXrNx/fC1+JmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHP53Hkj7yF6FlbZipFn6bghHAufdxjbPHtgn2C/hWZ3sy6Cyv
	udq9BzhvFrvv2dmiuGjtXuT72VcbzygfNk6VKGOOQ1soJo38bvGHN8AguvuUESLonQ==
X-Gm-Gg: ASbGnctmuhjfPDmEIbAT/6tw3e2OhDrs1tQLC5il2JpxQlgs0htkBgFz7f9H9Qsn+Lf
	qwusa/Q6ksT53BRVOWiWeA7tiwDznyngoXn/3X78cyQb7WVPBu1KwCcT/X06SfSX+aOKnjszn71
	iiNEwNzm2UgyVC/ZvInSgYTrPlpTy/A68nr9ecDqgCjHpgkDgehnduOIXqqFOZKyf4l7vnpijn1
	VwaMBLNgeX1nMU8RDYT+wI/8vkRDTnIvIUPEN/0+iJNM/JJfw7SQccZWqnxjk8TtCYTXsAwRiIi
	Gt8qJZ4c/TVbh4uicbCqM8RMOsQYSdiWmQ9NodMzr5EbrUaGdlAfpRlcebxx4hZ9lHzwMnL3TlX
	U
X-Google-Smtp-Source: AGHT+IGjWfUdXhgZL/hXJdI9mgEh2fOX9YaRz+9pHCBuN/jVr88KABTo2oYP+8cK+POae/uJK9WdVQ==
X-Received: by 2002:a05:6a21:3289:b0:215:df3d:d56 with SMTP id adf61e73a8af0-21621902575mr851830637.21.1747336976503;
        Thu, 15 May 2025 12:22:56 -0700 (PDT)
Received: from ubuntu.. ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb0a0b19sm255222a12.74.2025.05.15.12.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:22:55 -0700 (PDT)
From: Ronak Doshi <ronak.doshi@broadcom.com>
To: netdev@vger.kernel.org
Cc: Ronak Doshi <ronak.doshi@broadcom.com>,
	stable@vger.kernel.org,
	Guolin Yang <guolin.yang@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Ronghua Zhang <ronghua@vmware.com>,
	Shreyas Bhatewara <sbhatewara@vmware.com>,
	Bhavesh Davda <bhavesh@vmware.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2] vmxnet3: update MTU after device quiesce
Date: Thu, 15 May 2025 19:04:56 +0000
Message-ID: <20250515190457.8597-1-ronak.doshi@broadcom.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, when device mtu is updated, vmxnet3 updates netdev mtu, quiesces
the device and then reactivates it for the ESXi to know about the new mtu.
So, technically the OS stack can start using the new mtu before ESXi knows
about the new mtu.

This can lead to issues for TSO packets which use mss as per the new mtu
configured. This patch fixes this issue by moving the mtu write after
device quiesce.

Cc: stable@vger.kernel.org
Fixes: d1a890fa37f2 ("net: VMware virtual Ethernet NIC driver: vmxnet3")
Signed-off-by: Ronak Doshi <ronak.doshi@broadcom.com>
Acked-by: Guolin Yang <guolin.yang@broadcom.com>
Changes v1-> v2:
  Moved MTU write after destroy of rx rings
---
 drivers/net/vmxnet3/vmxnet3_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/vmxnet3/vmxnet3_drv.c b/drivers/net/vmxnet3/vmxnet3_drv.c
index 3df6aabc7e33..c676979c7ab9 100644
--- a/drivers/net/vmxnet3/vmxnet3_drv.c
+++ b/drivers/net/vmxnet3/vmxnet3_drv.c
@@ -3607,8 +3607,6 @@ vmxnet3_change_mtu(struct net_device *netdev, int new_mtu)
 	struct vmxnet3_adapter *adapter = netdev_priv(netdev);
 	int err = 0;
 
-	WRITE_ONCE(netdev->mtu, new_mtu);
-
 	/*
 	 * Reset_work may be in the middle of resetting the device, wait for its
 	 * completion.
@@ -3622,6 +3620,7 @@ vmxnet3_change_mtu(struct net_device *netdev, int new_mtu)
 
 		/* we need to re-create the rx queue based on the new mtu */
 		vmxnet3_rq_destroy_all(adapter);
+		WRITE_ONCE(netdev->mtu, new_mtu);
 		vmxnet3_adjust_rx_ring_size(adapter);
 		err = vmxnet3_rq_create_all(adapter);
 		if (err) {
@@ -3638,6 +3637,8 @@ vmxnet3_change_mtu(struct net_device *netdev, int new_mtu)
 				   "Closing it\n", err);
 			goto out;
 		}
+	} else {
+		WRITE_ONCE(netdev->mtu, new_mtu);
 	}
 
 out:
-- 
2.45.2

