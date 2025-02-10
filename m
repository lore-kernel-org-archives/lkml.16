Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38541253F0A
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739216367; cv=none; b=pQVJImxTsTF6+KxcUlnsCxN950ZHJECNgrpt7L3L1RLZofkxn3GPQNzz62prKCRphsVABzjCW3C9yM2rVDNpli5FHmrw+DoR/TjaOcxayflHVV7XDYrUoJZBkQNJGbYHzxO27HLWVyIgfItZ1Z+nGjAdKD0NUvPdXz4BADhg1PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739216367; c=relaxed/simple;
	bh=hMmqLC7rYBOTSWKloyLAMgjzYZ7GVSeG1WEosbA+PJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mavbglAqTVS42XYEa4JzsAcmoJBFnUS5Hb1HuhzzH5NjsGUaVE0Jux/4Izl9K1llfT7vjiUcqiFlcReVgmpDpsgqwaxpcthp1R4ja2yqMXYOQ97RLdj8W9kVXR1zpKlKij6iHjKQKqGOPfNH6sLyMHk7gZEFHga86PD2wgv4TuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=abmVMmn/; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="abmVMmn/"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fa4493a695so3484585a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1739216365; x=1739821165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjSm8SciJzh3IllyDU052OHbkLq8PHE5L98omSDGOLg=;
        b=abmVMmn/NbJp1ZOshLZu90Vm5VGiUOixYZmY90VuYcXbs6/poT4/YqmCvutDOgC/7Q
         EMpg5vXqs5NQKAQ6sUSo6U/RFaFANHj12UsPs9xrvs9WV8Hx/YrAXblwYIDo4E6pjATP
         3nhqri1zRRDcDBmwcjofT3DNDJMvs2Mggy6EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739216365; x=1739821165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjSm8SciJzh3IllyDU052OHbkLq8PHE5L98omSDGOLg=;
        b=SW9fGKIW1mkkAZD8K52wTPn9z6OFg5g7xrrs6P0Urte90ihWbCCUBWUmTXlrXM+sFV
         9qI/3azGeAb59rhM2JK4K5fW7wYdkYBEHX7NVVOtX0+eMxfOO2zUVcscroVwrfDupd5b
         gxB8ghCiPAh1YIepEj6DsGtuGYMuhksKcoIou5wSX0uH3aWIn7WzlbJgoRqLDqjZAx/v
         tmMClmsTRecv7bHSyLXduIAtCHOVCFFkchFHOfJo5DzH81lTM3z2GAzqNCh8BGOStoUq
         lWccTx9u8h5sZSxU1D+h1kFxgad/NjulhocqxlFRTi59Ld0WvcoG1LMnWUeAXLF0hlQi
         KEhg==
X-Forwarded-Encrypted: i=1; AJvYcCVcAljqLAtaX024PiQblduQkeIr6SvIS2oyqMcHm3Ddb7eQB3Q69AempcdN+XKq+iZuPDdihcla0PYsNg8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEyYMC7rmRZPqnkR+KSYK16PRVKrMaBezgOIK2wQ9F2zw7df35
	yWK0CBIUAIm2/gl/SriCStnnCtgzq183sX0dGkzzoTX8c70vlYbutY//4Yvnsao=
X-Gm-Gg: ASbGnctkbbZP8BY+yFFAj7kbCmNuapwZxNgDMj5Vqe5KzyakHzDhUlgb/M+8ZF1Yjlh
	upj3IANI4ZMCR/+fkijjRn8SUYJ67z7SQzEtZCT6XbdYs68MX2g1l5GaotBE+ZjAgTiHgTJ0B5G
	n4qq2v/+gTAIjnaSkveLGMxAN5eNbapgTVwWxjTfTn4APg4PA0DVNF0LZf+xpmRolnqwVgRRU1J
	KT8XcfzSVKG2nN8xH4YZyeW6jTj5jsFbIm/YCKsLivSoR85pbmBcCLzhuaCRU7F9CZ7VOsSwPDM
	AU6TnzwqZlrqAr5yUaCXgl4=
X-Google-Smtp-Source: AGHT+IH/yLGsQ5ai7U7Bkr2H+eeSCW+22PccYgnQz5Obbw7zdbZ6IeR4y1tv0W+bzubZOpOmWCy85w==
X-Received: by 2002:a17:90b:4aca:b0:2ee:f80c:6889 with SMTP id 98e67ed59e1d1-2fa243ef19cmr26320757a91.33.1739216365432;
        Mon, 10 Feb 2025 11:39:25 -0800 (PST)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa2ecbca6dsm4226510a91.0.2025.02.10.11.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 11:39:25 -0800 (PST)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: stfomichev@gmail.com,
	horms@kernel.org,
	kuba@kernel.org,
	Joe Damato <jdamato@fastly.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Mina Almasry <almasrymina@google.com>,
	David Wei <dw@davidwei.uk>,
	Amritha Nambiar <amritha.nambiar@intel.com>,
	Daniel Jurgens <danielj@nvidia.com>,
	Martin Karsten <mkarsten@uwaterloo.ca>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next v6 2/3] netdev-genl: Add an XSK attribute to queues
Date: Mon, 10 Feb 2025 19:38:40 +0000
Message-ID: <20250210193903.16235-3-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250210193903.16235-1-jdamato@fastly.com>
References: <20250210193903.16235-1-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose a new per-queue nest attribute, xsk, which will be present for
queues that are being used for AF_XDP. If the queue is not being used for
AF_XDP, the nest will not be present.

In the future, this attribute can be extended to include more data about
XSK as it is needed.

Signed-off-by: Joe Damato <jdamato@fastly.com>
Suggested-by: Jakub Kicinski <kuba@kernel.org>
---
 v6:
   - Added ifdefs to netdev_nl_queue_fill_one for CONFIG_XDP_SOCKETS.

 v5:
   - Removed unused variable, ret, from netdev_nl_queue_fill_one.

 v4:
   - Updated netdev_nl_queue_fill_one to use the empty nest helper added
     in patch 1.

 v2:
   - Patch adjusted to include an attribute, xsk, which is an empty nest
     and exposed for queues which have a pool.

 Documentation/netlink/specs/netdev.yaml | 13 ++++++++++++-
 include/uapi/linux/netdev.h             |  6 ++++++
 net/core/netdev-genl.c                  | 12 ++++++++++++
 tools/include/uapi/linux/netdev.h       |  6 ++++++
 4 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
index 288923e965ae..85402a2e289c 100644
--- a/Documentation/netlink/specs/netdev.yaml
+++ b/Documentation/netlink/specs/netdev.yaml
@@ -276,6 +276,9 @@ attribute-sets:
         doc: The timeout, in nanoseconds, of how long to suspend irq
              processing, if event polling finds events
         type: uint
+  -
+    name: xsk-info
+    attributes: []
   -
     name: queue
     attributes:
@@ -294,6 +297,9 @@ attribute-sets:
       -
         name: type
         doc: Queue type as rx, tx. Each queue type defines a separate ID space.
+             XDP TX queues allocated in the kernel are not linked to NAPIs and
+             thus not listed. AF_XDP queues will have more information set in
+             the xsk attribute.
         type: u32
         enum: queue-type
       -
@@ -309,7 +315,11 @@ attribute-sets:
         doc: io_uring memory provider information.
         type: nest
         nested-attributes: io-uring-provider-info
-
+      -
+        name: xsk
+        doc: XSK information for this queue, if any.
+        type: nest
+        nested-attributes: xsk-info
   -
     name: qstats
     doc: |
@@ -652,6 +662,7 @@ operations:
             - ifindex
             - dmabuf
             - io-uring
+            - xsk
       dump:
         request:
           attributes:
diff --git a/include/uapi/linux/netdev.h b/include/uapi/linux/netdev.h
index 6c6ee183802d..4e82f3871473 100644
--- a/include/uapi/linux/netdev.h
+++ b/include/uapi/linux/netdev.h
@@ -136,6 +136,11 @@ enum {
 	NETDEV_A_NAPI_MAX = (__NETDEV_A_NAPI_MAX - 1)
 };
 
+enum {
+	__NETDEV_A_XSK_INFO_MAX,
+	NETDEV_A_XSK_INFO_MAX = (__NETDEV_A_XSK_INFO_MAX - 1)
+};
+
 enum {
 	NETDEV_A_QUEUE_ID = 1,
 	NETDEV_A_QUEUE_IFINDEX,
@@ -143,6 +148,7 @@ enum {
 	NETDEV_A_QUEUE_NAPI_ID,
 	NETDEV_A_QUEUE_DMABUF,
 	NETDEV_A_QUEUE_IO_URING,
+	NETDEV_A_QUEUE_XSK,
 
 	__NETDEV_A_QUEUE_MAX,
 	NETDEV_A_QUEUE_MAX = (__NETDEV_A_QUEUE_MAX - 1)
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 0dcd4faefd8d..49b2b2248821 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -400,11 +400,23 @@ netdev_nl_queue_fill_one(struct sk_buff *rsp, struct net_device *netdev,
 		if (params->mp_ops &&
 		    params->mp_ops->nl_fill(params->mp_priv, rsp, rxq))
 			goto nla_put_failure;
+#ifdef CONFIG_XDP_SOCKETS
+		if (rxq->pool)
+			if (nla_put_empty_nest(rsp, NETDEV_A_QUEUE_XSK))
+				goto nla_put_failure;
+#endif
+
 		break;
 	case NETDEV_QUEUE_TYPE_TX:
 		txq = netdev_get_tx_queue(netdev, q_idx);
 		if (nla_put_napi_id(rsp, txq->napi))
 			goto nla_put_failure;
+#ifdef CONFIG_XDP_SOCKETS
+		if (txq->pool)
+			if (nla_put_empty_nest(rsp, NETDEV_A_QUEUE_XSK))
+				goto nla_put_failure;
+#endif
+		break;
 	}
 
 	genlmsg_end(rsp, hdr);
diff --git a/tools/include/uapi/linux/netdev.h b/tools/include/uapi/linux/netdev.h
index 6c6ee183802d..4e82f3871473 100644
--- a/tools/include/uapi/linux/netdev.h
+++ b/tools/include/uapi/linux/netdev.h
@@ -136,6 +136,11 @@ enum {
 	NETDEV_A_NAPI_MAX = (__NETDEV_A_NAPI_MAX - 1)
 };
 
+enum {
+	__NETDEV_A_XSK_INFO_MAX,
+	NETDEV_A_XSK_INFO_MAX = (__NETDEV_A_XSK_INFO_MAX - 1)
+};
+
 enum {
 	NETDEV_A_QUEUE_ID = 1,
 	NETDEV_A_QUEUE_IFINDEX,
@@ -143,6 +148,7 @@ enum {
 	NETDEV_A_QUEUE_NAPI_ID,
 	NETDEV_A_QUEUE_DMABUF,
 	NETDEV_A_QUEUE_IO_URING,
+	NETDEV_A_QUEUE_XSK,
 
 	__NETDEV_A_QUEUE_MAX,
 	NETDEV_A_QUEUE_MAX = (__NETDEV_A_QUEUE_MAX - 1)
-- 
2.43.0

