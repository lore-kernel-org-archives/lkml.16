Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B97219A97
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 19:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738696281; cv=none; b=KUL7YUDVZE4dHTQ4BQx5FRAbRJUtaHcSdJSWrDaFZ+XiulYExMujQ0VEAk6ok57W1vyRSDgbO5dkASf+GwJyk3DLB+NkkoY/P+SVntxX5s/g3UzOQipvW/kc7SPcWOO3HqeE2IAqS8liu5AzBJkR0xyKHZ41GRkKu/gSG8aTU1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738696281; c=relaxed/simple;
	bh=fgvav/VSEIHUhdT3806VLJC6JLGbBXBOxRebuhnQQjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=udCiNiSPvNCjZoWsNPIPXyw05QOnmgM96Fk0g/DeZCDxvYsPUWLwS01BCSO7CStgyTLaMhyU8wv4V51WBaMJqvHAUEtRR4Rg5exjsh8C9kfVaRlxK3/kGtCgrva8yqA1kAMkJRl6mJ+ALm49KTq+93A7fp1wt5/7S2aRFkVJgJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=OQWImNpN; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="OQWImNpN"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21654fdd5daso104710225ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 11:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1738696279; x=1739301079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ei3U9MNfcrzrg5+3o/MWatj/iskGcRz4y7XoQJ1XwqM=;
        b=OQWImNpNhViTmOEBUaszmLwtXp5zOCoHastSl5nYsGF+bA+9jEgqXOb5g+eSe1OL4S
         +rr8MWb73du0gRKwU+2kr/h/3td1m4SM1YwNIjZr34G8IjdJ/tvRDznjQQFGcOq6W32D
         ECS+9WxWfO8NJbeTbShHDIQ9RsmvXI48iBmWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738696279; x=1739301079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ei3U9MNfcrzrg5+3o/MWatj/iskGcRz4y7XoQJ1XwqM=;
        b=JEwTteSShmgXRGbBLzOgHJ4KZ0Q1FAmIK8uGs4jCuUuXiXO7sNUkLp4TxQRG/yrF3L
         sHOJhU+3ArGyjRejyo3S9UJueIXd5TyXQx/DXiMNWGNjCjNsstkV0VXMiYwXamf52nBM
         53Hm3/nQmdSkmHAlCaW1s5II54D3medxoYP/4RyE9ZYDDQ0fQ3OJsVbMeV/EEGg4kIBh
         C3IAKctXfZt3h3MkbxMw/NWF7XT9whql64WSQY4bhV2Gz5ZY9idJ4kF7kZ1X72+YAGpg
         rvk3+G39lMo+XZm6YoAGKwKQ+ll3ijN/KC/f++rEliueCDdvMJJoPyuxnwYu2pw71fp9
         hQLg==
X-Forwarded-Encrypted: i=1; AJvYcCWILYSHGbEs2egd/8k4113k7uQkmHk/UPMCZ5GvZP6Dfc3Ub5L5ckI8H/YgLxFidbVj9tiUxnMrR/DTRbc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJqHffCS4WM2JXJFUJpexBETtq5JrISAY1Zkbi4lxNeQNF+4VC
	bQq9Et1DHejwW286huGvAG0HpDIzM+/U5r1CtD8/huqIYMuNhRaqBPqBFkfQn60=
X-Gm-Gg: ASbGncsN/zhJCxkRbgbho3PsiANEdI6+SKnGeX91PBYIOK4V9ciHDlwY7BojOR+O25P
	TAikObpwv5wDEXsBJTpksNgzlGpurX3B1qIevN+/XuY1+jgWeEqsPeuADfkmm/R7Y2wY3w0z7YF
	9RrSDdl9xirvKa4Ooh7tCs88ZgxY4miGTz4lfTH+hlcKuOUBURzqQeVrJuIraAYbMcbn6TfRTo1
	woshV6Mc0DBrRKE9S44BWJ6w0gCfEx8T/FjXBAZKZOaC1lJRaNnO0koOrUa/dqtth8w7g5cnsXA
	USd+vKRmcXPj3h3UxkdvOiY=
X-Google-Smtp-Source: AGHT+IFDh9gs6Xfs+/RVL/J/t2NGVsuVNJafDRrtG3U1S6uJvHYeab0nLFKvV5EhsD7qlxJ2kf73GA==
X-Received: by 2002:a17:902:cecd:b0:21e:ff31:531 with SMTP id d9443c01a7336-21eff31073fmr77506595ad.22.1738696278887;
        Tue, 04 Feb 2025 11:11:18 -0800 (PST)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ea5f1sm100749785ad.130.2025.02.04.11.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 11:11:18 -0800 (PST)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: kuba@kernel.org,
	Joe Damato <jdamato@fastly.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Mina Almasry <almasrymina@google.com>,
	Daniel Jurgens <danielj@nvidia.com>,
	Martin Karsten <mkarsten@uwaterloo.ca>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next v3 1/2] netdev-genl: Add an XSK attribute to queues
Date: Tue,  4 Feb 2025 19:10:47 +0000
Message-ID: <20250204191108.161046-2-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204191108.161046-1-jdamato@fastly.com>
References: <20250204191108.161046-1-jdamato@fastly.com>
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
 v2:
   - Patch adjusted to include an attribute, xsk, which is an empty nest
     and exposed for queues which have a pool.

 Documentation/netlink/specs/netdev.yaml | 13 ++++++++++++-
 include/uapi/linux/netdev.h             |  6 ++++++
 net/core/netdev-genl.c                  | 11 +++++++++++
 tools/include/uapi/linux/netdev.h       |  6 ++++++
 4 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
index cbb544bd6c84..4c3eda5ba754 100644
--- a/Documentation/netlink/specs/netdev.yaml
+++ b/Documentation/netlink/specs/netdev.yaml
@@ -268,6 +268,9 @@ attribute-sets:
         doc: The timeout, in nanoseconds, of how long to suspend irq
              processing, if event polling finds events
         type: uint
+  -
+    name: xsk-info
+    attributes: []
   -
     name: queue
     attributes:
@@ -286,6 +289,9 @@ attribute-sets:
       -
         name: type
         doc: Queue type as rx, tx. Each queue type defines a separate ID space.
+             XDP TX queues allocated in the kernel are not linked to NAPIs and
+             thus not listed. AF_XDP queues will have more information set in
+             the xsk attribute.
         type: u32
         enum: queue-type
       -
@@ -296,7 +302,11 @@ attribute-sets:
         name: dmabuf
         doc: ID of the dmabuf attached to this queue, if any.
         type: u32
-
+      -
+        name: xsk
+        doc: XSK information for this queue, if any.
+        type: nest
+        nested-attributes: xsk-info
   -
     name: qstats
     doc: |
@@ -637,6 +647,7 @@ operations:
             - napi-id
             - ifindex
             - dmabuf
+            - xsk
       dump:
         request:
           attributes:
diff --git a/include/uapi/linux/netdev.h b/include/uapi/linux/netdev.h
index e4be227d3ad6..46bdb0b67a39 100644
--- a/include/uapi/linux/netdev.h
+++ b/include/uapi/linux/netdev.h
@@ -130,12 +130,18 @@ enum {
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
 	NETDEV_A_QUEUE_TYPE,
 	NETDEV_A_QUEUE_NAPI_ID,
 	NETDEV_A_QUEUE_DMABUF,
+	NETDEV_A_QUEUE_XSK,
 
 	__NETDEV_A_QUEUE_MAX,
 	NETDEV_A_QUEUE_MAX = (__NETDEV_A_QUEUE_MAX - 1)
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 715f85c6b62e..efaccfb6438e 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -371,6 +371,7 @@ netdev_nl_queue_fill_one(struct sk_buff *rsp, struct net_device *netdev,
 	struct net_devmem_dmabuf_binding *binding;
 	struct netdev_rx_queue *rxq;
 	struct netdev_queue *txq;
+	struct nlattr *nest;
 	void *hdr;
 
 	hdr = genlmsg_iput(rsp, info);
@@ -394,12 +395,22 @@ netdev_nl_queue_fill_one(struct sk_buff *rsp, struct net_device *netdev,
 		    nla_put_u32(rsp, NETDEV_A_QUEUE_DMABUF, binding->id))
 			goto nla_put_failure;
 
+		if (rxq->pool) {
+			nest = nla_nest_start(rsp, NETDEV_A_QUEUE_XSK);
+			nla_nest_end(rsp, nest);
+		}
+
 		break;
 	case NETDEV_QUEUE_TYPE_TX:
 		txq = netdev_get_tx_queue(netdev, q_idx);
 		if (txq->napi && nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
 					     txq->napi->napi_id))
 			goto nla_put_failure;
+
+		if (txq->pool) {
+			nest = nla_nest_start(rsp, NETDEV_A_QUEUE_XSK);
+			nla_nest_end(rsp, nest);
+		}
 	}
 
 	genlmsg_end(rsp, hdr);
diff --git a/tools/include/uapi/linux/netdev.h b/tools/include/uapi/linux/netdev.h
index e4be227d3ad6..46bdb0b67a39 100644
--- a/tools/include/uapi/linux/netdev.h
+++ b/tools/include/uapi/linux/netdev.h
@@ -130,12 +130,18 @@ enum {
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
 	NETDEV_A_QUEUE_TYPE,
 	NETDEV_A_QUEUE_NAPI_ID,
 	NETDEV_A_QUEUE_DMABUF,
+	NETDEV_A_QUEUE_XSK,
 
 	__NETDEV_A_QUEUE_MAX,
 	NETDEV_A_QUEUE_MAX = (__NETDEV_A_QUEUE_MAX - 1)
-- 
2.43.0

