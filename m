Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39F715B99E
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738908679; cv=none; b=S1/1LiQ+VpCxLTcV53k8CfumctMQ33siCTNkIshQ5aqg1r+rpKXE2kc+n8Oq1Mn9caV5HscntGg68kPD68QrdZuKSbATWZcDhSGbh82exSrwtSSq9NMavUtT31f7+rUirsxNLOF/79Iod8d4VBBUHGtbPYmrdradRve/lI0H8pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738908679; c=relaxed/simple;
	bh=jE35WmComX5JeKqlu8MY6L9RXnyoavgFojt+bgtRKqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sZRq+fesCwJ+8roDYqqQAEMUYJNvPZ+lraaHM4UOe0zhypxlCwgWiIO+TPAaaNWnH7KwS3+rAz+SnARiKGRb29gfSz2cjHztnJYwGwDkOgEAm01kFnb0XeiQPqri0TnUcqFFTJNLeme2khz/Ne6AMRFHqiC8pKodvwtU8P+vtpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=nDoZfe5f; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="nDoZfe5f"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21f50895565so5177635ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 22:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1738908676; x=1739513476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgBnzmCjscGqJo3YceNPZPrt+CM1bxg86tC2DNlkHjM=;
        b=nDoZfe5fNttKlPGp0pg8AHWIMQSrS//PVPZnkOL/zPNLcFJ9KS5JryBvAz9UAZ7ibO
         N4mpwvHHrkT24be8/dvDszXvXKsaD2ByR20q1elqKDW4JlBW27aTH5JbyGQQr7Frw+Hv
         lCYYuRbg9tl0SvxvCA4p9SxJ5XE9CTUxhc1qcfGYo354mBp1VH8y3zw8KWgQ/1q9/n6Q
         8tI7gFxXMtMBfQcEECxTTMX7xRHR8Zsc+w4ZbIaFGfmJ/sJ6egExGF8ig/OANUY6kZSr
         CUG/iZ3pqrF0ktdKftfZhc+AqkQIp2RLeTpGfrP7FrkKFjJ3Rssuv65jmyKgUzT3I2h5
         v69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738908676; x=1739513476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgBnzmCjscGqJo3YceNPZPrt+CM1bxg86tC2DNlkHjM=;
        b=EBa80OqX8SYPbWZsRhhirxONZNLNuajWWC4ULCnM/aHyskYhaCqEbr4tsGtt5PAtIH
         /BQiIks4X2vhrntW3Io8svmG1cbLnlgwI9B8OCaiKyJkqo8+220Eedn/8r2mTnKs7zZB
         5d7ZyvmSDbS/4ivBKiT2CSumapB+1jB+dU3RBgkjtp8rb7NFKoTgcrK1Ey/tpr/rklpS
         0wsWXB7x0RFSwjA04gMNBDSfl033bIDCEWU1zug6PlGGwtB4a0HFmilcvTRCdUmhyBFW
         cQ7lf0mb7ciczQyywpBwwllxgTocH+KHMXW6VZbqznATjlZi7/dUOMJqGG6NOkFREJFg
         mYtw==
X-Forwarded-Encrypted: i=1; AJvYcCWBHblVcw6h794s9oZheZTCUYblEzv3S1B3SUmMmOfGqiSTttFq2uezoSN/Db1/pnYTKHokN6MpJW8gmWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPRJaxGfsIJnCJ3YZR2/72YkoBoC9/udu9kAtfeQ0WfnS1b9oS
	stR5bzRTNDxh7x8AWN6d9Sj5gpcAvFml9LQqUbdQqWeTobEivLvWdBy5LLZtCr8=
X-Gm-Gg: ASbGncvrudgZMlh+eSC/m6pAFk5Du5TKEiGQ4MqiNqQS0OgtpMjPxWJueCGCHvSpX7h
	yKggYymfgzza0IdX7xvGuDs96miHNxZ92KFCQqFupcXShcT8H3tv41WmDG1Fw+G2Uwc3mM61C4N
	MpLW+R10W8CZY2wlzRqNqjzPr/VbMaZ1ycu+7wxIUJBhapeXjjmoqZ2ZpWe2qqE2YFU482NIE9U
	JypZQO4q0T1HCjUtBmsUsUYvWJ0ZN37jWo5TPkGKsYAqLWPJuDEDC8aAkDDiizKuYPAq5LIbLHl
	pAhDpWbEXVPvCDk5KCg=
X-Google-Smtp-Source: AGHT+IHNm8Qe5PeRd2q8oSkdrncjlnlT7yuIXN9pgtXzJ5BMLmj/G1sZ2QlSRnuDA+GVs8YfE9jCcA==
X-Received: by 2002:a05:6a00:244e:b0:727:3c8f:3707 with SMTP id d2e1a72fcca58-7305d53a584mr3469430b3a.23.1738908676268;
        Thu, 06 Feb 2025 22:11:16 -0800 (PST)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73048ad2623sm2302419b3a.60.2025.02.06.22.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 22:11:15 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Fri, 07 Feb 2025 15:10:52 +0900
Subject: [PATCH net-next v6 2/7] tun: Keep hdr_len in tun_get_user()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-tun-v6-2-fb49cf8b103e@daynix.com>
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

hdr_len is repeatedly used so keep it in a local variable.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Willem de Bruijn <willemb@google.com>
---
 drivers/net/tun.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index 4b189cbd28e63ec6325073d9a7678f4210bff3e1..c204c1c0d75bc7d336ec315099a5a60d5d70ea82 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -1747,6 +1747,7 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 	struct virtio_net_hdr gso = { 0 };
 	int good_linear;
 	int copylen;
+	int hdr_len = 0;
 	bool zerocopy = false;
 	int err;
 	u32 rxhash = 0;
@@ -1773,19 +1774,21 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 		if (!copy_from_iter_full(&gso, sizeof(gso), from))
 			return -EFAULT;
 
-		if ((gso.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) &&
-		    tun16_to_cpu(tun, gso.csum_start) + tun16_to_cpu(tun, gso.csum_offset) + 2 > tun16_to_cpu(tun, gso.hdr_len))
-			gso.hdr_len = cpu_to_tun16(tun, tun16_to_cpu(tun, gso.csum_start) + tun16_to_cpu(tun, gso.csum_offset) + 2);
+		hdr_len = tun16_to_cpu(tun, gso.hdr_len);
 
-		if (tun16_to_cpu(tun, gso.hdr_len) > len)
+		if (gso.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
+			hdr_len = max(tun16_to_cpu(tun, gso.csum_start) + tun16_to_cpu(tun, gso.csum_offset) + 2, hdr_len);
+			gso.hdr_len = cpu_to_tun16(tun, hdr_len);
+		}
+
+		if (hdr_len > len)
 			return -EINVAL;
 		iov_iter_advance(from, vnet_hdr_sz - sizeof(gso));
 	}
 
 	if ((tun->flags & TUN_TYPE_MASK) == IFF_TAP) {
 		align += NET_IP_ALIGN;
-		if (unlikely(len < ETH_HLEN ||
-			     (gso.hdr_len && tun16_to_cpu(tun, gso.hdr_len) < ETH_HLEN)))
+		if (unlikely(len < ETH_HLEN || (hdr_len && hdr_len < ETH_HLEN)))
 			return -EINVAL;
 	}
 
@@ -1798,9 +1801,7 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 		 * enough room for skb expand head in case it is used.
 		 * The rest of the buffer is mapped from userspace.
 		 */
-		copylen = gso.hdr_len ? tun16_to_cpu(tun, gso.hdr_len) : GOODCOPY_LEN;
-		if (copylen > good_linear)
-			copylen = good_linear;
+		copylen = min(hdr_len ? hdr_len : GOODCOPY_LEN, good_linear);
 		linear = copylen;
 		iov_iter_advance(&i, copylen);
 		if (iov_iter_npages(&i, INT_MAX) <= MAX_SKB_FRAGS)
@@ -1821,10 +1822,7 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 	} else {
 		if (!zerocopy) {
 			copylen = len;
-			if (tun16_to_cpu(tun, gso.hdr_len) > good_linear)
-				linear = good_linear;
-			else
-				linear = tun16_to_cpu(tun, gso.hdr_len);
+			linear = min(hdr_len, good_linear);
 		}
 
 		if (frags) {

-- 
2.48.1

