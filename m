Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B388235BEA
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738908686; cv=none; b=Xhg+QkfFlUUL/BJ+9RrYeRoN46E6Xvx+t5l51LuejRlSw+m0HyqPc23Kvsobw/1TnKTJCJgq//y1Q3wPk10cN/biLuE1yLgahMRuV6qzn2xtmu1lWLhIcuzBxIFE0PpWtAqrAABTPHI4b3QRgq6ePib0531RYeebqCwMfQ8A3QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738908686; c=relaxed/simple;
	bh=bBQXhUVCx6X6zVGj6QFAXw2H5wdiIPqhAd8Xerl1xf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CAzyYkwcU7KOUhkf7hL2S9iEx+WxkhDgkyiMK1Xp/n5WmPU13yp1hBjPXNqNLH0NZE60M3NiXJPpCDYsK1SOamJHhLooWiGOAYEOzLjcmlyw0EWuev/tXD322AWd0LyR3VZ9vaPISHkD/R/j4xQr/eGqOg6+J/7fHjx0cs56d6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=qslocyaP; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="qslocyaP"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21f20666e72so35854745ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 22:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1738908684; x=1739513484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/RuN2hMDX+DTthFVqrAA3p7jQCQREQBjwaJUnbA1mI=;
        b=qslocyaPwuARW/7d/Lfk6LcV7OSOxduHKY8FvvF5dnIF3J6MfSYTHqrLEbja7R3v0L
         C29IZkXXYSupvfp1kZrXJI4WJKr+V17cIQ08kernY4791Lfif8jBt59PxuIUkkWDDDU6
         cZPDZxsEDHrmos58bd9dCmXc0IIY72ZYMla+KQnL6SORZDoknh1obgcADQbzCIYYG55l
         GDQLomgJd4I2Y6LEIuMfM6kwaTXCX2fBDE2wPUHtVT0SQXjABKe6WOUAL0ajHUChoLfY
         046HKLED9vxkYaEwZ2UlzBz4KQHQhu9UT1EzOinaEE67DCPnlw0mrmDmEZSRvoeIhxi7
         UIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738908684; x=1739513484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/RuN2hMDX+DTthFVqrAA3p7jQCQREQBjwaJUnbA1mI=;
        b=rd27kfUkd5pMxG8266mRobF5/PdMYof49AaJ+sOFfgLIvn8KFLF8R3wVbH7kAYIZP6
         V71AUa5/uO4D+l0eaMf3jp/SqgswFDNodfulWMm7PVqPsNKkOH/mJXjAn8mjrHVwHZ8Z
         8tMnRn5GBKbH8Z9PGVRyuBd72Zrt+0FGcu0ngkXlamosYZAF8OPUdOSM/6+hSFxG9cI7
         D8pjU5gRKRHpnvd0hniy+EjLbn6kvb13iR4lUTSCTpW9Q1+glUrty6ngnNXVp7Fe6TFh
         Kbx5c2LigFFMdPFgkfmK67K8yvXKSTnAU8rwKZl6udggKYz+AVUEybfdEz4ob45asNvf
         rTig==
X-Forwarded-Encrypted: i=1; AJvYcCX1XQWYR+zLXXFNJuVjpZblRUBrYSLnLVe4ltAkMAW5JG/Y2svH3a4gT/YSIVTwH8OZzsmATrHHfRuTxH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcrzSh75hE+8Ip8O4zwQHohS16QemUeXlWl4TbmZqGHuabRZ/Q
	1wfyBz85LRv1F3qmpdlzHRaithDBE+terju0jvcQt83qFfjSEg2wHyX9YVuOnUc=
X-Gm-Gg: ASbGncvCMLFr1uYZkJE9e5Rn10ELFkfi0VKyM4ftxbdPSkOXHzc75mREA8llzoYpHw7
	2C685wVSJLFBL80mrclh+xwnYYBW9KhDVMh/dYC33t7Xj1jwLR/mOg5gdbeWPbNkiKX3X2HTMlz
	5La8aSAcrjbjq9G6NnEyvecNImE4+auztlkXbwXO+Hg0aMYtTpsCrjXO9iND8yt60nwYfc+JMQv
	X0sCEMPlYbJ/SxUjHWHrCKcd8KDpdu56Av3YeIjw5V4XayTKT+RjLcE5q8336QAlyafHKi7nc/m
	qtE7qGmpRY7HIS/e1YQ=
X-Google-Smtp-Source: AGHT+IGKXNfBtm98NzYUcrTp3XJuz6e3YpYHzpl1lbmzgAWqjm0gMeX4pN7AZUkDcA3OCHSyub6G8g==
X-Received: by 2002:a17:902:ef09:b0:216:386e:dbc with SMTP id d9443c01a7336-21f4e6c22e7mr33527705ad.13.1738908683719;
        Thu, 06 Feb 2025 22:11:23 -0800 (PST)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21f3687c5d5sm22833125ad.166.2025.02.06.22.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 22:11:23 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Fri, 07 Feb 2025 15:10:53 +0900
Subject: [PATCH net-next v6 3/7] tun: Decouple vnet from tun_struct
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-tun-v6-3-fb49cf8b103e@daynix.com>
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

Decouple vnet-related functions from tun_struct so that we can reuse
them for tap in the future.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Willem de Bruijn <willemb@google.com>
---
 drivers/net/tun.c | 51 ++++++++++++++++++++++++++-------------------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index c204c1c0d75bc7d336ec315099a5a60d5d70ea82..28a1af1de9d704ed5cc51aac3d99bc095cb28ba5 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -298,17 +298,17 @@ static bool tun_napi_frags_enabled(const struct tun_file *tfile)
 	return tfile->napi_frags_enabled;
 }
 
-static inline bool tun_legacy_is_little_endian(struct tun_struct *tun)
+static inline bool tun_legacy_is_little_endian(unsigned int flags)
 {
 	bool be = IS_ENABLED(CONFIG_TUN_VNET_CROSS_LE) &&
-		  (tun->flags & TUN_VNET_BE);
+		  (flags & TUN_VNET_BE);
 
 	return !be && virtio_legacy_is_little_endian();
 }
 
-static long tun_get_vnet_be(struct tun_struct *tun, int __user *argp)
+static long tun_get_vnet_be(unsigned int flags, int __user *argp)
 {
-	int be = !!(tun->flags & TUN_VNET_BE);
+	int be = !!(flags & TUN_VNET_BE);
 
 	if (!IS_ENABLED(CONFIG_TUN_VNET_CROSS_LE))
 		return -EINVAL;
@@ -319,7 +319,7 @@ static long tun_get_vnet_be(struct tun_struct *tun, int __user *argp)
 	return 0;
 }
 
-static long tun_set_vnet_be(struct tun_struct *tun, int __user *argp)
+static long tun_set_vnet_be(unsigned int *flags, int __user *argp)
 {
 	int be;
 
@@ -330,27 +330,26 @@ static long tun_set_vnet_be(struct tun_struct *tun, int __user *argp)
 		return -EFAULT;
 
 	if (be)
-		tun->flags |= TUN_VNET_BE;
+		*flags |= TUN_VNET_BE;
 	else
-		tun->flags &= ~TUN_VNET_BE;
+		*flags &= ~TUN_VNET_BE;
 
 	return 0;
 }
 
-static inline bool tun_is_little_endian(struct tun_struct *tun)
+static inline bool tun_is_little_endian(unsigned int flags)
 {
-	return tun->flags & TUN_VNET_LE ||
-		tun_legacy_is_little_endian(tun);
+	return flags & TUN_VNET_LE || tun_legacy_is_little_endian(flags);
 }
 
-static inline u16 tun16_to_cpu(struct tun_struct *tun, __virtio16 val)
+static inline u16 tun16_to_cpu(unsigned int flags, __virtio16 val)
 {
-	return __virtio16_to_cpu(tun_is_little_endian(tun), val);
+	return __virtio16_to_cpu(tun_is_little_endian(flags), val);
 }
 
-static inline __virtio16 cpu_to_tun16(struct tun_struct *tun, u16 val)
+static inline __virtio16 cpu_to_tun16(unsigned int flags, u16 val)
 {
-	return __cpu_to_virtio16(tun_is_little_endian(tun), val);
+	return __cpu_to_virtio16(tun_is_little_endian(flags), val);
 }
 
 static inline u32 tun_hashfn(u32 rxhash)
@@ -1766,6 +1765,7 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 
 	if (tun->flags & IFF_VNET_HDR) {
 		int vnet_hdr_sz = READ_ONCE(tun->vnet_hdr_sz);
+		int flags = tun->flags;
 
 		if (len < vnet_hdr_sz)
 			return -EINVAL;
@@ -1774,11 +1774,11 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 		if (!copy_from_iter_full(&gso, sizeof(gso), from))
 			return -EFAULT;
 
-		hdr_len = tun16_to_cpu(tun, gso.hdr_len);
+		hdr_len = tun16_to_cpu(flags, gso.hdr_len);
 
 		if (gso.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
-			hdr_len = max(tun16_to_cpu(tun, gso.csum_start) + tun16_to_cpu(tun, gso.csum_offset) + 2, hdr_len);
-			gso.hdr_len = cpu_to_tun16(tun, hdr_len);
+			hdr_len = max(tun16_to_cpu(flags, gso.csum_start) + tun16_to_cpu(flags, gso.csum_offset) + 2, hdr_len);
+			gso.hdr_len = cpu_to_tun16(flags, hdr_len);
 		}
 
 		if (hdr_len > len)
@@ -1857,7 +1857,7 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 		}
 	}
 
-	if (virtio_net_hdr_to_skb(skb, &gso, tun_is_little_endian(tun))) {
+	if (virtio_net_hdr_to_skb(skb, &gso, tun_is_little_endian(tun->flags))) {
 		atomic_long_inc(&tun->rx_frame_errors);
 		err = -EINVAL;
 		goto free_skb;
@@ -2111,23 +2111,24 @@ static ssize_t tun_put_user(struct tun_struct *tun,
 
 	if (vnet_hdr_sz) {
 		struct virtio_net_hdr gso;
+		int flags = tun->flags;
 
 		if (iov_iter_count(iter) < vnet_hdr_sz)
 			return -EINVAL;
 
 		if (virtio_net_hdr_from_skb(skb, &gso,
-					    tun_is_little_endian(tun), true,
+					    tun_is_little_endian(flags), true,
 					    vlan_hlen)) {
 			struct skb_shared_info *sinfo = skb_shinfo(skb);
 
 			if (net_ratelimit()) {
 				netdev_err(tun->dev, "unexpected GSO type: 0x%x, gso_size %d, hdr_len %d\n",
-					   sinfo->gso_type, tun16_to_cpu(tun, gso.gso_size),
-					   tun16_to_cpu(tun, gso.hdr_len));
+					   sinfo->gso_type, tun16_to_cpu(flags, gso.gso_size),
+					   tun16_to_cpu(flags, gso.hdr_len));
 				print_hex_dump(KERN_ERR, "tun: ",
 					       DUMP_PREFIX_NONE,
 					       16, 1, skb->head,
-					       min((int)tun16_to_cpu(tun, gso.hdr_len), 64), true);
+					       min((int)tun16_to_cpu(flags, gso.hdr_len), 64), true);
 			}
 			WARN_ON_ONCE(1);
 			return -EINVAL;
@@ -2496,7 +2497,7 @@ static int tun_xdp_one(struct tun_struct *tun,
 	skb_reserve(skb, xdp->data - xdp->data_hard_start);
 	skb_put(skb, xdp->data_end - xdp->data);
 
-	if (virtio_net_hdr_to_skb(skb, gso, tun_is_little_endian(tun))) {
+	if (virtio_net_hdr_to_skb(skb, gso, tun_is_little_endian(tun->flags))) {
 		atomic_long_inc(&tun->rx_frame_errors);
 		kfree_skb(skb);
 		ret = -EINVAL;
@@ -3325,11 +3326,11 @@ static long __tun_chr_ioctl(struct file *file, unsigned int cmd,
 		break;
 
 	case TUNGETVNETBE:
-		ret = tun_get_vnet_be(tun, argp);
+		ret = tun_get_vnet_be(tun->flags, argp);
 		break;
 
 	case TUNSETVNETBE:
-		ret = tun_set_vnet_be(tun, argp);
+		ret = tun_set_vnet_be(&tun->flags, argp);
 		break;
 
 	case TUNATTACHFILTER:

-- 
2.48.1

