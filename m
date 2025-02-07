Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F059F10E9
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 03:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738897788; cv=none; b=HlQHA1lbNAj8v9ima+r8pBhT+wV5ZiBdHkQtzlByPl6InklBu+TaCUDrzwwIh7Tj0rLVv+i9XDqfVoQkh45pd9YfQOErScqSdGJKkMsWMn+ebdBOKpLFoWu3i2abNPhgVGh+wyP4jhTgGH/J5ChQtHpw1wbMl8pf8HCMg7GuV7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738897788; c=relaxed/simple;
	bh=t2bdWXIhCRgtjCrRvBiAo9wr6E1Q0gMByrBMpkptx1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nntfxdRa/7fihg9g9Nr3GMRLzKzm8lA8niLXC5SkFnL6fxkRRv99bmM5dOzZW5PaYXJgbXxL3VF6wk2foooe81+QKDeD27pCMI6sw/ThivJZPa2/9687SRjxqgmC6U0znQeY9/p8/AW4GupwHHqUqivBRBvVN00cbFMcNrrvf04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=sM9k2lNd; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="sM9k2lNd"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2f9d627b5fbso2853388a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 19:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1738897785; x=1739502585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvN5IEuSm1GAFZydLhqU2iZKnjJwS5x3mE7p0JmTwi4=;
        b=sM9k2lNdHYMkyZ0xvtGYwtcJTcA/JUCWZxTT4IhUx85n1yg2Dqe2HQWNa767ORoIUq
         1t+U7wxIpLSBGYW5gNSe6DMY+eWhUI62ROjQO2Zv+PA1Y3QRsWgvJpont40UEFFRx/SF
         Jdc4jltJtMuvBJpCQvptA/GWd00n3gXvZBd44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738897785; x=1739502585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvN5IEuSm1GAFZydLhqU2iZKnjJwS5x3mE7p0JmTwi4=;
        b=SsTth/NIgl13OvHoMNrP35xleupzo6Z37xHwWp+ZAG2pHkHCfncsoouPbO1eHqddU3
         01BuwKYqzL3OSMcWFb28+OqLghhUKDGg09OHxVU+1stTLQ8Oycsun1oTA6yOpflnCCol
         VEwJ8ObTd28MDQFH5uLyJu/oSun034IAi+5wvwrKH/FFHAivM28T1ZR20tFKBza7gc/0
         1/ZWtt8F9QYjSL+KmRYkio8ZIX/+6axGBsmcGBfbzS52WLUgWAhzCaAbIBGaXrGUuspJ
         rHNrJkX6l8UTlFrD1b0fCw8OhcRBK2hNy4zhamtCOZJXi23fw63wOAO99lmgC7qF55G7
         eWGw==
X-Forwarded-Encrypted: i=1; AJvYcCU5M7zMzV9PMbaSxZ5lqRMUvRM0VP9JmZ66riqYlmnZ/J5wY90O+1d3ibzmbnU2hHxf9CQpjt+CXB8Tlxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjU/GkcIzArIx3K5fftU8RW6vyfzbIYxyetNttfG1u3y1X0RT9
	i+11p54IefS01ngcUb/kY94eRSOUAu3CvJH+ojTbRdPRL1XjqyEvOljPYg1TxDTmJ57OQfPNElv
	E
X-Gm-Gg: ASbGncuUs35wss/Fo0F7vZKMUjQDDInUFkR5egvapx8QZKPnNoWM4kRnPtvzbJionRY
	0ug5bWOLAd+KmQPBtKvkyMKzffAJ9xxhsFjwk/lutngAq69kYYnhW0vhkF/t+a7c6e+VHpwRhJ8
	WLqWJDTPsCNmlR5GS251V3GUj0kJGS3B6J4Qt99wHuL28wOx57ULeuxxEs7qkjHCgtnlp/jvniX
	yaLAjKQu0CKrg9Zmns3/y5GP2YonawGpIWlqqFE5lJBAj4sYIRkSXR95ppgCh/5bMD43RX/h11/
	WO0JePw0XyY0LX00WmYz6XU=
X-Google-Smtp-Source: AGHT+IGNhUT+Jhkp7Cdh5BBlscWIQjRyb/gjVd9oZk2GyDRuojRmIDKCiibURXvJHpU9HUPT4RJIwA==
X-Received: by 2002:a17:90b:23cb:b0:2ee:d63f:d77 with SMTP id 98e67ed59e1d1-2fa24063c18mr2555688a91.9.1738897785457;
        Thu, 06 Feb 2025 19:09:45 -0800 (PST)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368ab196sm20348955ad.222.2025.02.06.19.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 19:09:45 -0800 (PST)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: pabeni@redhat.com,
	edumazet@google.com,
	sridhar.samudrala@intel.com,
	Joe Damato <jdamato@fastly.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Mina Almasry <almasrymina@google.com>,
	Daniel Jurgens <danielj@nvidia.com>,
	Amritha Nambiar <amritha.nambiar@intel.com>,
	David Wei <dw@davidwei.uk>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next v4 2/3] netdev-genl: Add an XSK attribute to queues
Date: Fri,  7 Feb 2025 03:08:54 +0000
Message-ID: <20250207030916.32751-3-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250207030916.32751-1-jdamato@fastly.com>
References: <20250207030916.32751-1-jdamato@fastly.com>
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
index 0dcd4faefd8d..75ca111aa591 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -380,6 +380,7 @@ netdev_nl_queue_fill_one(struct sk_buff *rsp, struct net_device *netdev,
 	struct netdev_rx_queue *rxq;
 	struct netdev_queue *txq;
 	void *hdr;
+	int ret;
 
 	hdr = genlmsg_iput(rsp, info);
 	if (!hdr)
@@ -400,11 +401,22 @@ netdev_nl_queue_fill_one(struct sk_buff *rsp, struct net_device *netdev,
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

