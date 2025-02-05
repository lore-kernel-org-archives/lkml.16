Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7EC22A1E1
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 06:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738736578; cv=none; b=Uz5oc8/BNxZIdy1GckNiDyBsb8/IxJGxfnn5TBaVxQSdSdXDjCKXv0K8hwTSOyffFThEEOWvviOFIjNtCA94RviwwzRY+mHiL64f4iO0Bo+heRMUZLfUhJgFQXsR+MQA3wOJe6hPFo9wWeWuyfAGc80q8Lfj6KmW5EZ874Rbqns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738736578; c=relaxed/simple;
	bh=VkcnSd9uth+aU0TZc6KkQboitOv8PTLAY/tRU375O50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VI60v9ihhm4+7wqiqpDejZEOe/bcbPde8uksjnv3vWyiYmLISJUvYJpI9kvQTmuAufDW1HGnyDYz67C+xCSitXLx5VWtW5ELMEdLjOko8LIO/iCGeYwUmw2bfiAgdhAfiNQIP+xnJtrmH+KRGNZVD4cmKxQxGg6arVfTW6loLbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=PSnHI9wJ; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="PSnHI9wJ"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2f9cd8ecbceso2231920a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 22:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1738736574; x=1739341374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7yiQ+gp/M7O1wWD8DLiQZcyuh3+HlUYoKsvgOw1BTbw=;
        b=PSnHI9wJHtraDhc+/07QzNWgs54+5IWTCeMQOERelHPD00c/Yfb7UrNzC6IOqux9aA
         zFiZsrkk1XuoYV04VEf/xTkhYDbQQ57BXK/aA/Ny03tUPZllCzUc8FEerX2ktKz5khZK
         YjK+piER6NMlX6mvLlJt6OUvAtHkv8dzgpy2JtXnbf81vge0CuVsOSeBUFPmN7Ee4Qk5
         1Qeyiqtfxcu8QR0Tnov6Oe74ojlYZeWt1F1bFxVOqYKJvan8+RqZY8SZJlYAl82I2UYa
         LM/s1nYZl/VK5EIt/8SW2hwb45Ht9Zq3/BsvpAPte0Z1SmN+/07PDHtdf6oj+oJKqgfo
         4gCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738736574; x=1739341374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7yiQ+gp/M7O1wWD8DLiQZcyuh3+HlUYoKsvgOw1BTbw=;
        b=UX6IIg8gEc2T8c+jFjh9N244KAHc92bjWkm2rQk2fUS7226LtuahBHB03X6MXOKN0l
         CgSgDQlg0Kwz+WRY23rbDFvqaBWFzIuC1At6c5/BWGoNfvwQbNZ5cHBFsio8tl+JC+Fh
         gg5Z+LfGVhO7I6dBVRtJ08ayAS+UhV9GQGR3u3XP6Kav84HiEUNRCOiIj2IKneXhn0Ed
         bZELTRknBmjb9NvoJ2wZhm1phf5e1XpAN5ve8YfbT5Xm/1M94JOczDf9igxm1jWfh/Ak
         95s60iRfnYCEvSHjxCBczQGHSPaimXyAbM464lZe/1cdN2JLxEPmLwOG0sMNgEAKA4Rf
         3owQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUuHxxMs40V+GYKJZ8EDHUg/8nGwbHhlI5tIUX/7rBAbPa8DgLcyATb/gsIIPfl9YdhT0olK5+ogfKBkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGSBxxJFelGdOMmM9Vv5V2nNki2450RDpAAuQLrO6VG5lmM+P/
	L+zvVTsAk0MgyLjqLnX0xVv1f18eeDqZ3Su/ZwIDjC357vZVBWR4R4hofS4DTtk=
X-Gm-Gg: ASbGncvUmfxap3+TgyNRn5YsicPnjyKhVLUxb3X+evhKE1tjlUOIrN9Gg9YpXjxgDKY
	3pGOsma+eD85o8rODcpIPG3zQYTz5vDo30iKGEQKskG60/hR4inqZVOcfXlWz18qIgPTgGA6QmJ
	R3/RUTiBJEN6tW0AYEwOOjgwLSNEJNzqI29d78CpHOxihcoLNjNa3ZHhffcVyO83ZpHpSEmNvzh
	2p8KezwgleVmi+NLnNvj4B0K7NKU8/u4yQedCi/IRzn7akuOQn7HEO0eFe7ZDTXfT+VbsSWsWeg
	o6k/VDOtY3tBqBhQC8M=
X-Google-Smtp-Source: AGHT+IEcJOQFpqxKnvfD+cBwESRfxy45G0iiGCxNTZyVh5qCbjumW7AjokC8QvgMCRhfirYMLiipfw==
X-Received: by 2002:a05:6a00:3cc1:b0:72d:2444:da2d with SMTP id d2e1a72fcca58-7303511c75dmr2598853b3a.9.1738736574442;
        Tue, 04 Feb 2025 22:22:54 -0800 (PST)
Received: from localhost ([157.82.207.107])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72fe69cd801sm11624244b3a.123.2025.02.04.22.22.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 22:22:54 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 05 Feb 2025 15:22:25 +0900
Subject: [PATCH net-next v5 3/7] tun: Decouple vnet from tun_struct
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-tun-v5-3-15d0b32e87fa@daynix.com>
References: <20250205-tun-v5-0-15d0b32e87fa@daynix.com>
In-Reply-To: <20250205-tun-v5-0-15d0b32e87fa@daynix.com>
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
index 9d4aabc3b63c8f9baab82d7ab2bba567e9075484..8ddd4b352f0307e52cdff75254b5ac1d259d51f8 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -298,16 +298,16 @@ static bool tun_napi_frags_enabled(const struct tun_file *tfile)
 	return tfile->napi_frags_enabled;
 }
 
-static inline bool tun_legacy_is_little_endian(struct tun_struct *tun)
+static inline bool tun_legacy_is_little_endian(unsigned int flags)
 {
 	return !(IS_ENABLED(CONFIG_TUN_VNET_CROSS_LE) &&
-		 (tun->flags & TUN_VNET_BE)) &&
+		 (flags & TUN_VNET_BE)) &&
 		virtio_legacy_is_little_endian();
 }
 
-static long tun_get_vnet_be(struct tun_struct *tun, int __user *argp)
+static long tun_get_vnet_be(unsigned int flags, int __user *argp)
 {
-	int be = !!(tun->flags & TUN_VNET_BE);
+	int be = !!(flags & TUN_VNET_BE);
 
 	if (!IS_ENABLED(CONFIG_TUN_VNET_CROSS_LE))
 		return -EINVAL;
@@ -318,7 +318,7 @@ static long tun_get_vnet_be(struct tun_struct *tun, int __user *argp)
 	return 0;
 }
 
-static long tun_set_vnet_be(struct tun_struct *tun, int __user *argp)
+static long tun_set_vnet_be(unsigned int *flags, int __user *argp)
 {
 	int be;
 
@@ -329,27 +329,26 @@ static long tun_set_vnet_be(struct tun_struct *tun, int __user *argp)
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
@@ -1765,6 +1764,7 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 
 	if (tun->flags & IFF_VNET_HDR) {
 		int vnet_hdr_sz = READ_ONCE(tun->vnet_hdr_sz);
+		int flags = tun->flags;
 
 		if (len < vnet_hdr_sz)
 			return -EINVAL;
@@ -1773,11 +1773,11 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
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
@@ -1856,7 +1856,7 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 		}
 	}
 
-	if (virtio_net_hdr_to_skb(skb, &gso, tun_is_little_endian(tun))) {
+	if (virtio_net_hdr_to_skb(skb, &gso, tun_is_little_endian(tun->flags))) {
 		atomic_long_inc(&tun->rx_frame_errors);
 		err = -EINVAL;
 		goto free_skb;
@@ -2110,23 +2110,24 @@ static ssize_t tun_put_user(struct tun_struct *tun,
 
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
@@ -2495,7 +2496,7 @@ static int tun_xdp_one(struct tun_struct *tun,
 	skb_reserve(skb, xdp->data - xdp->data_hard_start);
 	skb_put(skb, xdp->data_end - xdp->data);
 
-	if (virtio_net_hdr_to_skb(skb, gso, tun_is_little_endian(tun))) {
+	if (virtio_net_hdr_to_skb(skb, gso, tun_is_little_endian(tun->flags))) {
 		atomic_long_inc(&tun->rx_frame_errors);
 		kfree_skb(skb);
 		ret = -EINVAL;
@@ -3324,11 +3325,11 @@ static long __tun_chr_ioctl(struct file *file, unsigned int cmd,
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

