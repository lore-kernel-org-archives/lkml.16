Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2DC189F45
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 04:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738988080; cv=none; b=odAr0LzFvLFWoZAAza/4mRNHuAhOhwxxKiYwli0A+H09LCaDvh5c0owSjmzkU3sbsfjm7X932XCrGCeS11qyJaW4dm3SWS7rSCoqCDv3Xsn/dkviwZ4AMy8GAxAOKDXfP257GlQJ5TdxPx7xe2/mP+uOuf/TFs4A9LKqaCOjCzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738988080; c=relaxed/simple;
	bh=qMU/SSD+GnDstgplnPhUezCKkpRh9MkYWQpob4UhFaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=emkaS7Q+fLnm7YvkIGEVUV6ErCKi+ex62QQe3Pt7gHvtDj6QQ1+QL0M233N+4tjqNJL3MUgUpkUE9K5LIm91k2EPNIhlF22e6MVD9k66F4AHry9JNeY/w3AMW/rWVKApoxkvCwt/mV67E3ihgDuIrtNKSEsYX68O1f+fNzCmdrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=pxdGGLII; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="pxdGGLII"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f6d2642faso4400695ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 20:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1738988078; x=1739592878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4DJzSaiR41L4hlteYq1D8hTA0O9UNuuENwILLXuiso=;
        b=pxdGGLII/xKi1lFhN8O+lLmzjTr0dbr6fo3JQmUS+Gyf95jSWX0BBxxGAVL9qODOef
         ykMxu4tUqeNjmLkOlhabSvKziab5u7ybG/cFoGa5RmozYQDhjnEjTM2P7Dn0bBZJ+0gf
         BLt89WSVTPMAEsEVitDUwPopWuipnUiQovh3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738988078; x=1739592878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4DJzSaiR41L4hlteYq1D8hTA0O9UNuuENwILLXuiso=;
        b=NUDCR1McZb2MOU+avqRnBF6h/SC31m4JD5Xqbu4k4FN9yNVaEH1FtVC7M5N8J/pQtA
         U4TJXRBAChJ25bK/74E+g6uPPTxtgAINba8iFtmnsk42X4Cz1Km0cuuaSAQwDFsizh+v
         zQF967RBMntFu1ivyM6GE4irs8BWH40GyRWNWeSN20a2QDl1HncbWF2IfViftQKtdi8R
         5hwNL2gxB+ivovknziutOr3AJ5SKb51dnrd5Y1yBV3tQvVcI2C6Ap7oEpQlOW8iNEAUZ
         aLgDikeQ3WmUA/72crJKBJV5SVcbLFeuEA76GGZIMxh6i1aYfpk6czsmwLU/5N9eq5/P
         gBYw==
X-Forwarded-Encrypted: i=1; AJvYcCVYv6WW6M5ZqjaHYOvzOw3OuJYwX8YruOGVVemdTkzD1ijSm32bfJm+/HW9OMipDNw0it9tvAqzIu1SoqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu5dWYGMw/Xlu3tstwZr0C2/VUN+lU6pM1LV33OZKUqajrT+xX
	w9VSZkv2+RL6ht6bXqt3xepPxV4OEIePpHDH9tQklAxS7PAtLSDME194Rs3O6dE=
X-Gm-Gg: ASbGncubeDnRkc7BKNXLUfO/ETHN6Jb9JNS7Eyb2muvx8WT/ndYwpkFHmCRj7zj0/Z7
	NNX9gXKVR0Y6nahJGMg2a8umuZttedF7g2KsEGe+kFaEyWdBCMwnfjijTBSkhRal8UbHJ1u70oZ
	TOYJ4V5W5TrX5uBHUwcf64nVKLoD3BRk8danPNboxDZg8obflH2Au3IhwTSBRPnqkBLvhxgeaHQ
	BtGJuPXbDc0ArNYO4vBTocV+dRTJcLdEKud3JOCC4pTU+9QIjBXQTEFpOu5FkhtyAUtsdMIdvJR
	KKpztshbenWpsLHsBjF6GJQ=
X-Google-Smtp-Source: AGHT+IFZ59NGSqTUMa/FLxvgaYbBKt8+YckD6RRdPZKX9/d1HXQ/rQ9E90HNh7Azr36Zxf8jvckMTA==
X-Received: by 2002:a17:903:1c4:b0:216:4169:f9d7 with SMTP id d9443c01a7336-21f4e6a00f4mr104632155ad.2.1738988078328;
        Fri, 07 Feb 2025 20:14:38 -0800 (PST)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650ce0bsm38567715ad.21.2025.02.07.20.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 20:14:37 -0800 (PST)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: horms@kernel.org,
	kuba@kernel.org,
	Joe Damato <jdamato@fastly.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Mina Almasry <almasrymina@google.com>,
	Martin Karsten <mkarsten@uwaterloo.ca>,
	Sridhar Samudrala <sridhar.samudrala@intel.com>,
	David Wei <dw@davidwei.uk>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next v5 2/3] netdev-genl: Add an XSK attribute to queues
Date: Sat,  8 Feb 2025 04:12:24 +0000
Message-ID: <20250208041248.111118-3-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250208041248.111118-1-jdamato@fastly.com>
References: <20250208041248.111118-1-jdamato@fastly.com>
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
 net/core/netdev-genl.c                  | 11 +++++++++++
 tools/include/uapi/linux/netdev.h       |  6 ++++++
 4 files changed, 35 insertions(+), 1 deletion(-)

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
index 0dcd4faefd8d..b5a93a449af9 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -400,11 +400,22 @@ netdev_nl_queue_fill_one(struct sk_buff *rsp, struct net_device *netdev,
 		if (params->mp_ops &&
 		    params->mp_ops->nl_fill(params->mp_priv, rsp, rxq))
 			goto nla_put_failure;
+
+		if (rxq->pool)
+			if (nla_put_empty_nest(rsp, NETDEV_A_QUEUE_XSK))
+				goto nla_put_failure;
+
 		break;
 	case NETDEV_QUEUE_TYPE_TX:
 		txq = netdev_get_tx_queue(netdev, q_idx);
 		if (nla_put_napi_id(rsp, txq->napi))
 			goto nla_put_failure;
+
+		if (txq->pool)
+			if (nla_put_empty_nest(rsp, NETDEV_A_QUEUE_XSK))
+				goto nla_put_failure;
+
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

