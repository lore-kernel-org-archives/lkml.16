Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FF72376E7
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738908717; cv=none; b=PbcO/iU7c6dX1CaGwvTqmyEpjEBmhj1x/JWFpKavQIIvP7hFtm8wZQyop4ORm3oqNtgtRW7ZTvOuTq/UyJSrFInvV4URwkRccqfoBrxQscfkdF62R5Y3uSqir0DHTlvkdNTi1gb0ThZnLNgW1vJBVTjzESAD2HF8WcLhnTHhs1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738908717; c=relaxed/simple;
	bh=HTscNvyC9HJMHKWPJX1Sejy7f+gI0K4OIXa4+ZNvbAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k5LgLoDO+OF/YALWfy/cOulYH76Z6q7XxAZfpMG2DQVY3SzhoXL/sGJrBSFCF9CUC070+cTjDjMpAtc5B7aesd4KwrUoW7aUfvI0hzRnXTZJc/wkoaD9pUDBD8sXaCEtHuozI+icVUobXYPwI8U5PDj/K2WKcuMO8b8jRKDd2ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=AYoCJndz; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="AYoCJndz"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2165448243fso42223895ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 22:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1738908714; x=1739513514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+R57A+roDGJE2oJSDUQxgir3uIkoZEEbg7sX8hwWCo=;
        b=AYoCJndzxK0AsVqnRxIT8ZCSF0ko1nWeMW2iL8QdIDS3H5F26eZIk18IuZ2RLuArmm
         kdOtqUKzdVqNl1/V2cyNB3UDo8vBL8dWk1EtEYhdDQTUS06YlId1KSMQYweXxoKqcM2E
         GX26Znx17apatzBLvLhAdnSrp1PG3ovkf2IjmW96UtoiDbWDhKAPeONF00O4nj34EzOu
         K/lZATUrdaWDmMor4+oKnOJdFs+oc9i15JNMy6W+XJdQKev6tsVhg7bfSCkT0CNl800l
         7UskWins2NHc83WIMykZwE2fiwDlqFfrxWIaQWu79V3FCrQLh7IrA7ftjkSAMMhJPbDG
         RcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738908714; x=1739513514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+R57A+roDGJE2oJSDUQxgir3uIkoZEEbg7sX8hwWCo=;
        b=NikcwIoYL6EVZGDLHnPjGxFrzA6uNSqwUKccIuFgwuU+1kEnwgnvyH7sBLNQMl7cjN
         9yepZg0CdSAOV44L6XXCqGqR4dz7aTTx7tfDIF+fDteiAW/EbdK76xnuxmd1iDs3PpXv
         8rg67axdzCUzzbSICGecuaHRskFDhMJAOvpVcs5JDXYTeA5oulcEI//Q3hVrW5E2TQvF
         3JQhD2AkRnMukMk3Lxn7imxf/ZSOgWu6F4kJldE4loAk1Mq93o7KqUUfrKpKvnfjz1S5
         Q07fHFqYYaacBP+bEzs6O/fr/M0NxCVOG2BOhLV8uEIrEIywcheLe215fd9uwq27qulL
         e+VA==
X-Forwarded-Encrypted: i=1; AJvYcCVA9SxGBX8S08B2zr2LbkDdWMpbBTRlENlKrYZ5r0a/WTzYPwKmxldZBAgn1GRIpYviKtWJghGIdecbGN4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxa9DxwvsQzKXrqm+Lcp0SEhcK/UEPgIdTGRqESLnC+s+sjEx+
	s9SzY8ysgkVWWExFCzTF5jFn210CKmQi4+pAEPC//nz+hblIgQAiXJwlJUntNTQ=
X-Gm-Gg: ASbGncsclmhXlz7EZSS4liP1DW32TG29c5T4Xs5iRn2/3f9nAwK+QwhhBmeL2dESqxo
	ggrh/XP14YIVRfCUEhtq9Nh7uMMGqbolv4QgmK821dUKkAMkyHf4VPRV1c8xfJHahwTF/3Y+VE/
	BmEWid6QFnGdKDdhGk5DdELvqhWKP90hBoKMXzrGagmrLi+jeTL6B7QLUOC9IZuBwd7G01x2COa
	Dbs+SknQljk/1Roi2434rC3Y1ZS7VUFl2/KRcIPMsicmtVVF9+8WvwbiGRJj/XFn6BF/a9z3Ht+
	MORAViQAfkJx4v/YK+U=
X-Google-Smtp-Source: AGHT+IHlCc/QLtRw9JwUBPb1D2TfS/bysYZ2EBR/Oh5kx6V1EMQBjR3blXWCBV04Zttp3n8xrEcfHg==
X-Received: by 2002:a17:902:c40e:b0:21f:1549:a55f with SMTP id d9443c01a7336-21f4e6c0f49mr42137015ad.19.1738908714189;
        Thu, 06 Feb 2025 22:11:54 -0800 (PST)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21f368d79a7sm22677855ad.253.2025.02.06.22.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 22:11:53 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Fri, 07 Feb 2025 15:10:57 +0900
Subject: [PATCH net-next v6 7/7] tap: Use tun's vnet-related code
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-tun-v6-7-fb49cf8b103e@daynix.com>
References: <20250207-tun-v6-0-fb49cf8b103e@daynix.com>
In-Reply-To: <20250207-tun-v6-0-fb49cf8b103e@daynix.com>
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
 devel@daynix.com, Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Willem de Bruijn <willemb@google.com>
X-Mailer: b4 0.14.2

tun and tap implements the same vnet-related features so reuse the code.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Willem de Bruijn <willemb@google.com>
---
 drivers/net/tap.c | 152 ++++++------------------------------------------------
 1 file changed, 16 insertions(+), 136 deletions(-)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index 8cb002616a6143b54258b65b483fed0c3af2c7a0..1287e241f4454fb8ec4975bbaded5fbaa88e3cc8 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -26,74 +26,9 @@
 #include <linux/virtio_net.h>
 #include <linux/skb_array.h>
 
-#define TAP_IFFEATURES (IFF_VNET_HDR | IFF_MULTI_QUEUE)
-
-#define TAP_VNET_LE 0x80000000
-#define TAP_VNET_BE 0x40000000
-
-#ifdef CONFIG_TUN_VNET_CROSS_LE
-static inline bool tap_legacy_is_little_endian(struct tap_queue *q)
-{
-	return q->flags & TAP_VNET_BE ? false :
-		virtio_legacy_is_little_endian();
-}
-
-static long tap_get_vnet_be(struct tap_queue *q, int __user *sp)
-{
-	int s = !!(q->flags & TAP_VNET_BE);
-
-	if (put_user(s, sp))
-		return -EFAULT;
-
-	return 0;
-}
-
-static long tap_set_vnet_be(struct tap_queue *q, int __user *sp)
-{
-	int s;
-
-	if (get_user(s, sp))
-		return -EFAULT;
-
-	if (s)
-		q->flags |= TAP_VNET_BE;
-	else
-		q->flags &= ~TAP_VNET_BE;
-
-	return 0;
-}
-#else
-static inline bool tap_legacy_is_little_endian(struct tap_queue *q)
-{
-	return virtio_legacy_is_little_endian();
-}
-
-static long tap_get_vnet_be(struct tap_queue *q, int __user *argp)
-{
-	return -EINVAL;
-}
-
-static long tap_set_vnet_be(struct tap_queue *q, int __user *argp)
-{
-	return -EINVAL;
-}
-#endif /* CONFIG_TUN_VNET_CROSS_LE */
-
-static inline bool tap_is_little_endian(struct tap_queue *q)
-{
-	return q->flags & TAP_VNET_LE ||
-		tap_legacy_is_little_endian(q);
-}
-
-static inline u16 tap16_to_cpu(struct tap_queue *q, __virtio16 val)
-{
-	return __virtio16_to_cpu(tap_is_little_endian(q), val);
-}
+#include "tun_vnet.h"
 
-static inline __virtio16 cpu_to_tap16(struct tap_queue *q, u16 val)
-{
-	return __cpu_to_virtio16(tap_is_little_endian(q), val);
-}
+#define TAP_IFFEATURES (IFF_VNET_HDR | IFF_MULTI_QUEUE)
 
 static struct proto tap_proto = {
 	.name = "tap",
@@ -655,25 +590,13 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 	if (q->flags & IFF_VNET_HDR) {
 		vnet_hdr_len = READ_ONCE(q->vnet_hdr_sz);
 
-		err = -EINVAL;
-		if (len < vnet_hdr_len)
+		hdr_len = tun_vnet_hdr_get(vnet_hdr_len, q->flags, from, &vnet_hdr);
+		if (hdr_len < 0) {
+			err = hdr_len;
 			goto err;
-		len -= vnet_hdr_len;
-
-		err = -EFAULT;
-		if (!copy_from_iter_full(&vnet_hdr, sizeof(vnet_hdr), from))
-			goto err;
-		iov_iter_advance(from, vnet_hdr_len - sizeof(vnet_hdr));
-		hdr_len = tap16_to_cpu(q, vnet_hdr.hdr_len);
-		if (vnet_hdr.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
-			hdr_len = max(tap16_to_cpu(q, vnet_hdr.csum_start) +
-				      tap16_to_cpu(q, vnet_hdr.csum_offset) + 2,
-				      hdr_len);
-			vnet_hdr.hdr_len = cpu_to_tap16(q, hdr_len);
 		}
-		err = -EINVAL;
-		if (tap16_to_cpu(q, vnet_hdr.hdr_len) > len)
-			goto err;
+
+		len -= vnet_hdr_len;
 	}
 
 	err = -EINVAL;
@@ -725,8 +648,7 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 	skb->dev = tap->dev;
 
 	if (vnet_hdr_len) {
-		err = virtio_net_hdr_to_skb(skb, &vnet_hdr,
-					    tap_is_little_endian(q));
+		err = tun_vnet_hdr_to_skb(q->flags, skb, &vnet_hdr);
 		if (err) {
 			rcu_read_unlock();
 			drop_reason = SKB_DROP_REASON_DEV_HDR;
@@ -789,23 +711,17 @@ static ssize_t tap_put_user(struct tap_queue *q,
 	int total;
 
 	if (q->flags & IFF_VNET_HDR) {
-		int vlan_hlen = skb_vlan_tag_present(skb) ? VLAN_HLEN : 0;
 		struct virtio_net_hdr vnet_hdr;
 
 		vnet_hdr_len = READ_ONCE(q->vnet_hdr_sz);
-		if (iov_iter_count(iter) < vnet_hdr_len)
-			return -EINVAL;
-
-		if (virtio_net_hdr_from_skb(skb, &vnet_hdr,
-					    tap_is_little_endian(q), true,
-					    vlan_hlen))
-			BUG();
 
-		if (copy_to_iter(&vnet_hdr, sizeof(vnet_hdr), iter) !=
-		    sizeof(vnet_hdr))
-			return -EFAULT;
+		ret = tun_vnet_hdr_from_skb(q->flags, NULL, skb, &vnet_hdr);
+		if (ret)
+			return ret;
 
-		iov_iter_advance(iter, vnet_hdr_len - sizeof(vnet_hdr));
+		ret = tun_vnet_hdr_put(vnet_hdr_len, iter, &vnet_hdr);
+		if (ret)
+			return ret;
 	}
 	total = vnet_hdr_len;
 	total += skb->len;
@@ -1064,42 +980,6 @@ static long tap_ioctl(struct file *file, unsigned int cmd,
 		q->sk.sk_sndbuf = s;
 		return 0;
 
-	case TUNGETVNETHDRSZ:
-		s = q->vnet_hdr_sz;
-		if (put_user(s, sp))
-			return -EFAULT;
-		return 0;
-
-	case TUNSETVNETHDRSZ:
-		if (get_user(s, sp))
-			return -EFAULT;
-		if (s < (int)sizeof(struct virtio_net_hdr))
-			return -EINVAL;
-
-		q->vnet_hdr_sz = s;
-		return 0;
-
-	case TUNGETVNETLE:
-		s = !!(q->flags & TAP_VNET_LE);
-		if (put_user(s, sp))
-			return -EFAULT;
-		return 0;
-
-	case TUNSETVNETLE:
-		if (get_user(s, sp))
-			return -EFAULT;
-		if (s)
-			q->flags |= TAP_VNET_LE;
-		else
-			q->flags &= ~TAP_VNET_LE;
-		return 0;
-
-	case TUNGETVNETBE:
-		return tap_get_vnet_be(q, sp);
-
-	case TUNSETVNETBE:
-		return tap_set_vnet_be(q, sp);
-
 	case TUNSETOFFLOAD:
 		/* let the user check for future flags */
 		if (arg & ~(TUN_F_CSUM | TUN_F_TSO4 | TUN_F_TSO6 |
@@ -1143,7 +1023,7 @@ static long tap_ioctl(struct file *file, unsigned int cmd,
 		return ret;
 
 	default:
-		return -EINVAL;
+		return tun_vnet_ioctl(&q->vnet_hdr_sz, &q->flags, cmd, sp);
 	}
 }
 
@@ -1190,7 +1070,7 @@ static int tap_get_user_xdp(struct tap_queue *q, struct xdp_buff *xdp)
 	skb->protocol = eth_hdr(skb)->h_proto;
 
 	if (vnet_hdr_len) {
-		err = virtio_net_hdr_to_skb(skb, gso, tap_is_little_endian(q));
+		err = tun_vnet_hdr_to_skb(q->flags, skb, gso);
 		if (err)
 			goto err_kfree;
 	}

-- 
2.48.1

