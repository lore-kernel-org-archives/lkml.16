Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94761E9B0D
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 04:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748580650; cv=none; b=QAdb3j+3dsg0ejnYGDqgJ6WPRAP64bGLypdxVBEEZwOK3TumVJ3L88L/2yUmIfFpFB7ezgT/Wr+m03CkUV34HTVJ5DLiNDLu4p+bYnBPwWBc/tG7wiYDn0MBnIzSrS+Bn1EvhjjuM7RFKxwLznPCQnS2rAEqTEhGG09oR2W03u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748580650; c=relaxed/simple;
	bh=vXBLYAWx+KT8NixkiW+nmAmAP6uEmWPDiyypcFhaZWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=MVIK+aznsyEx4zgk21kyFabi4Od/ppnGlUawBU06wPnfBP8/0IBef4iK9G1zTwbFRQv3MEVoMZAZFSalAHVzRSuh3w346A8IkCQQkBRecrqBsW2d2RsVLmifM2Ku0OsyeDDX9mZ3ZUepmNK4M1CjszSe0+hP7Jh4mVaclk3qRaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=CV3TSHii; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="CV3TSHii"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b2c4476d381so1483626a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 21:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1748580648; x=1749185448; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bke5K22c3HD9w23wmyNQv3eteVxt8661CPm0yQIUlGQ=;
        b=CV3TSHiiy/PAYpWIwEH4fxABUSk2ozOglgsCzJ5B+QhWFdPkhbXu8pvJ47F+fvzf6e
         faa3uU2PqLAUudehmtn25v+SsRFuCqhOI7jz5RAjVc+ntgtFvIqtCqN4yg4OARgOqgYa
         7J7rjdrNgmBiuXmseqFZmhjDetvjuSna7G4TE/NCRaEU5Eiaw01Qgh8xe7HN89W7U4Ek
         8q8kQBTiT2fbUKeXV0w9EYJ0NgsUeZqSOC8msWP5S2glVfVgU51WQRSOV0K19BwrJeKg
         VMc1UxRBdSbqvVAF6SlxFcnOBJL0+d6OR7CIgS1DiIJbVkUigDlF15RoYjbm3sxaChTT
         zx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748580648; x=1749185448;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bke5K22c3HD9w23wmyNQv3eteVxt8661CPm0yQIUlGQ=;
        b=EW6odWwctvlDkr+TDZP4ztI7xd9MENm7tOdN5SWiMUNTb6FyOss+Vl1ZhV9iGZ+noN
         x24GUasZxvEnBpyGNIpDfsERe+eOEtkzTVvBAwnETop6HEUqGL3ll40a9i7HNpXlykgb
         1jgD3mExibxmhjn4OcvjjIE8nxZCCodtnVMH4OrxPVY1aqwkfOPNi7pJCEA2ZQymb6kV
         CR4nNcWGbyAsQs4UYmgGv2UV+8MBnpf7brkW7+hZUAbGomL5W8vXHJKvT1XIMd6HjFIT
         64coMfn7YrgTI5xvFaSe5QQIdEPlETyJHcteDSmZ3KGXqvzkk6ItSmdCnVAEbv8JRtTu
         f6/w==
X-Forwarded-Encrypted: i=1; AJvYcCVYVjPWbxa59+SJWDz4h1j/GiPvAGxbXpg+IQuT3n3e4vBs4t+UAJbhPErwKr38/8SjVeeGiVZVR9SZC9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuBdvMPPefMZYS00KrgOBPQQeH5vczz3qu1orhvXG1hajtRfqh
	PgxV2/bqgWck+s8LDagcVGftfq/TulE3/A0+Q21nL3tYFE6Y5w+mrYVXvcQwCXNXTp0=
X-Gm-Gg: ASbGncsEG7KXpDhWa139R1FgsAkuJjq5df7nShchoPJPmOEY3fB4SiH+zvkN2VBkN0c
	AwllwTnX0hbOU0dV6pGX0dN4vQfl2aLVjjBpm5ZILoJz1xV2jX9L0qV26leHC4NQWee8wAkIvd6
	S2c3U1D83DRTq1pjQalofNVLhxCwA4lcjmZAF90YR93JNmhHT+LD38jrG5lCJLNtLqPhxw9mMLQ
	VCEZIwvqth2p+xP4+zeM/mzeahnOjmKRKLgUgGJ9NvqFX9maMP25CUb8Zp4l3ou8wwXcJRC+JZQ
	zTKu56EaqWhw2sv3eOWKVUK5fjn05fTL2fsI+9kibS5rpoyJArsRnI3+/WoXoig=
X-Google-Smtp-Source: AGHT+IGSd69oFRRuK4lTduVM0ZF5zNmM4jyAvZgQPgB6jq6cdPe4LXym+7JQTROU4ygX8AexHC9tJQ==
X-Received: by 2002:a17:902:e84a:b0:215:58be:3349 with SMTP id d9443c01a7336-2352b06d218mr31860065ad.14.1748580648014;
        Thu, 29 May 2025 21:50:48 -0700 (PDT)
Received: from localhost ([157.82.128.1])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23506bc889csm20244645ad.15.2025.05.29.21.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 21:50:47 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Fri, 30 May 2025 13:50:09 +0900
Subject: [PATCH net-next v12 05/10] tun: Introduce virtio-net hash feature
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-rss-v12-5-95d8b348de91@daynix.com>
References: <20250530-rss-v12-0-95d8b348de91@daynix.com>
In-Reply-To: <20250530-rss-v12-0-95d8b348de91@daynix.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, kvm@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
 Yuri Benditovich <yuri.benditovich@daynix.com>, 
 Andrew Melnychenko <andrew@daynix.com>, 
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com, 
 Lei Yang <leiyang@redhat.com>, Simon Horman <horms@kernel.org>, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6

Add ioctls and storage required for the virtio-net hash feature to TUN.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/net/Kconfig    |  1 +
 drivers/net/tun.c      | 56 ++++++++++++++++++++++++++++++++++++++++++--------
 include/linux/skbuff.h |  3 +++
 net/core/skbuff.c      |  4 ++++
 4 files changed, 56 insertions(+), 8 deletions(-)

diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
index 1fd5acdc73c6..aecfd244dd83 100644
--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -395,6 +395,7 @@ config TUN
 	tristate "Universal TUN/TAP device driver support"
 	depends on INET
 	select CRC32
+	select SKB_EXTENSIONS
 	help
 	  TUN/TAP provides packet reception and transmission for user space
 	  programs.  It can be viewed as a simple Point-to-Point or Ethernet
diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index 03d47799e9bd..0a34db248e03 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -209,6 +209,7 @@ struct tun_struct {
 	struct bpf_prog __rcu *xdp_prog;
 	struct tun_prog __rcu *steering_prog;
 	struct tun_prog __rcu *filter_prog;
+	struct tun_vnet_hash __rcu *vnet_hash;
 	struct ethtool_link_ksettings link_ksettings;
 	/* init args */
 	struct file *file;
@@ -451,9 +452,14 @@ static inline void tun_flow_save_rps_rxhash(struct tun_flow_entry *e, u32 hash)
 		e->rps_rxhash = hash;
 }
 
+static struct virtio_net_hash *tun_add_hash(struct sk_buff *skb)
+{
+	return skb_ext_add(skb, SKB_EXT_TUN_VNET_HASH);
+}
+
 static const struct virtio_net_hash *tun_find_hash(const struct sk_buff *skb)
 {
-	return NULL;
+	return skb_ext_find(skb, SKB_EXT_TUN_VNET_HASH);
 }
 
 /* We try to identify a flow through its rxhash. The reason that
@@ -462,14 +468,21 @@ static const struct virtio_net_hash *tun_find_hash(const struct sk_buff *skb)
  * the userspace application move between processors, we may get a
  * different rxq no. here.
  */
-static u16 tun_automq_select_queue(struct tun_struct *tun, struct sk_buff *skb)
+static u16 tun_automq_select_queue(struct tun_struct *tun,
+				   const struct tun_vnet_hash *vnet_hash,
+				   struct sk_buff *skb)
 {
+	struct flow_keys keys;
+	struct flow_keys_basic keys_basic;
 	struct tun_flow_entry *e;
 	u32 txq, numqueues;
 
 	numqueues = READ_ONCE(tun->numqueues);
 
-	txq = __skb_get_hash_symmetric(skb);
+	memset(&keys, 0, sizeof(keys));
+	skb_flow_dissect(skb, &flow_keys_dissector_symmetric, &keys, 0);
+
+	txq = flow_hash_from_keys(&keys);
 	e = tun_flow_find(&tun->flows[tun_hashfn(txq)], txq);
 	if (e) {
 		tun_flow_save_rps_rxhash(e, txq);
@@ -478,6 +491,13 @@ static u16 tun_automq_select_queue(struct tun_struct *tun, struct sk_buff *skb)
 		txq = reciprocal_scale(txq, numqueues);
 	}
 
+	keys_basic = (struct flow_keys_basic) {
+		.control = keys.control,
+		.basic = keys.basic
+	};
+	tun_vnet_hash_report(vnet_hash, skb, &keys_basic, skb->l4_hash ? skb->hash : txq,
+			     tun_add_hash);
+
 	return txq;
 }
 
@@ -513,8 +533,15 @@ static u16 tun_select_queue(struct net_device *dev, struct sk_buff *skb,
 	u16 ret;
 
 	rcu_read_lock();
-	if (!tun_ebpf_select_queue(tun, skb, &ret))
-		ret = tun_automq_select_queue(tun, skb);
+	if (!tun_ebpf_select_queue(tun, skb, &ret)) {
+		struct tun_vnet_hash *vnet_hash = rcu_dereference(tun->vnet_hash);
+
+		if (vnet_hash && vnet_hash->rss)
+			ret = tun_vnet_rss_select_queue(READ_ONCE(tun->numqueues), vnet_hash,
+							skb, tun_add_hash);
+		else
+			ret = tun_automq_select_queue(tun, vnet_hash, skb);
+	}
 	rcu_read_unlock();
 
 	return ret;
@@ -2235,6 +2262,7 @@ static void tun_free_netdev(struct net_device *dev)
 	security_tun_dev_free_security(tun->security);
 	__tun_set_ebpf(tun, &tun->steering_prog, NULL);
 	__tun_set_ebpf(tun, &tun->filter_prog, NULL);
+	kfree_rcu_mightsleep(rcu_access_pointer(tun->vnet_hash));
 }
 
 static void tun_setup(struct net_device *dev)
@@ -3014,16 +3042,22 @@ static long __tun_chr_ioctl(struct file *file, unsigned int cmd,
 	} else {
 		memset(&ifr, 0, sizeof(ifr));
 	}
-	if (cmd == TUNGETFEATURES) {
+	switch (cmd) {
+	case TUNGETFEATURES:
 		/* Currently this just means: "what IFF flags are valid?".
 		 * This is needed because we never checked for invalid flags on
 		 * TUNSETIFF.
 		 */
 		return put_user(IFF_TUN | IFF_TAP | IFF_NO_CARRIER |
 				TUN_FEATURES, (unsigned int __user*)argp);
-	} else if (cmd == TUNSETQUEUE) {
+
+	case TUNSETQUEUE:
 		return tun_set_queue(file, &ifr);
-	} else if (cmd == SIOCGSKNS) {
+
+	case TUNGETVNETHASHTYPES:
+		return tun_vnet_ioctl_gethashtypes(argp);
+
+	case SIOCGSKNS:
 		if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
 			return -EPERM;
 		return open_related_ns(&net->ns, get_net_ns);
@@ -3264,6 +3298,12 @@ static long __tun_chr_ioctl(struct file *file, unsigned int cmd,
 		ret = open_related_ns(&net->ns, get_net_ns);
 		break;
 
+	case TUNSETVNETREPORTINGAUTOMQ:
+	case TUNSETVNETREPORTINGRSS:
+	case TUNSETVNETRSS:
+		ret = tun_vnet_ioctl_sethash(&tun->vnet_hash, cmd, argp);
+		break;
+
 	default:
 		ret = tun_vnet_ioctl(&tun->vnet_hdr_sz, &tun->flags, cmd, argp);
 		break;
diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index bb2b751d274a..cdd793f1c360 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -4842,6 +4842,9 @@ enum skb_ext_id {
 #endif
 #if IS_ENABLED(CONFIG_MCTP_FLOWS)
 	SKB_EXT_MCTP,
+#endif
+#if IS_ENABLED(CONFIG_TUN)
+	SKB_EXT_TUN_VNET_HASH,
 #endif
 	SKB_EXT_NUM, /* must be last */
 };
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index b1c81687e9d8..75d48217a20f 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -64,6 +64,7 @@
 #include <linux/mpls.h>
 #include <linux/kcov.h>
 #include <linux/iov_iter.h>
+#include <linux/virtio_net.h>
 
 #include <net/protocol.h>
 #include <net/dst.h>
@@ -4969,6 +4970,9 @@ static const u8 skb_ext_type_len[] = {
 #if IS_ENABLED(CONFIG_MCTP_FLOWS)
 	[SKB_EXT_MCTP] = SKB_EXT_CHUNKSIZEOF(struct mctp_flow),
 #endif
+#if IS_ENABLED(CONFIG_TUN)
+	[SKB_EXT_TUN_VNET_HASH] = SKB_EXT_CHUNKSIZEOF(struct virtio_net_hash),
+#endif
 };
 
 static __always_inline unsigned int skb_ext_total_length(void)

-- 
2.49.0

