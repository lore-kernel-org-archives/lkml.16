Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501ED2343C0
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738908709; cv=none; b=mpZSdfwJ53RYqOPgPRKcDV3830AxGL1MZk/T2+6fznyUhh580H69u9A4aZKhASK+SSYdgNjtT5Hv2qqpq3JOEtqmgsz5cmrzQ+iHfZ6vrPFBelXjYR/Mx7VzKOLtR/UQ8KFZQeOYqFxCbotg8u3/EwAvC47imsAgk54kE/6jl4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738908709; c=relaxed/simple;
	bh=nZIPHAA5zCJF7swo3jDQ5RjM5zm8qMnIWTvWpC5hGqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=STFyALnQS3jtumWf9jX+iBE8RX3gs0PuXcQ+Ut8rIoNphhw5JwTd0LPWnLREkN1rogVwCCjSH8eAFT4RG19rnQisrFt6DryP98GAGZwIW3xFAFkaeAyznOf1nSe9977ra5WFuY0cUfa+bi2fevvJslweMKQJI9o9npv54XeRGoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=Z0GEn7oy; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="Z0GEn7oy"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21f20666e72so35860805ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 22:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1738908706; x=1739513506; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4saBNfFGUdtw4heVChkMZd5FykA/GmW9Q/kNvdZqu3c=;
        b=Z0GEn7oy7nAcn8Yimse7BALKQCW7fwCtEHPpVzB75/3hagaW8sbuotM6pf9VTPzKxm
         8YOh1fsHuReQ7Hg1hbHHZdmmxeBYSabo8pZIybqalOsotkukqeA+HdwBfLvsxHBdVDmE
         HyyNUrEXj9S23lDnsLWSVGx8ZiNlizamy2aimhQpG6N7KEV6823+Lv7a0CjdBU1qHGLz
         w5RuidjRpVdKKgUMSAFsqKdYK9d/rJ2Vip217r7XBVy/itv12JYi2fCbDAPM79/ca+oq
         gLRoHaB197upoPkuygc+o+3JjH7iiRT4nIk6BUatpgXEPg1nA93NfyW+gtONycwPfYTq
         LG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738908706; x=1739513506;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4saBNfFGUdtw4heVChkMZd5FykA/GmW9Q/kNvdZqu3c=;
        b=odZLnXJLFpexx9OF17ATHSQOs3QiiB0xhtiw5DwdTPPxgT8bh3cpLYUmF4qwFtCA/k
         wfpEr166YqPV3OBndhlwx29CdHS9BPGHkdqsfqJbgTxpEtDULgvN+601XtNeYhNQ/KRD
         Teb3dhHGQx3/xF6ZncCawvjZzHxr6SoLWuQxn4OhBmAZgzMgnNAl3SvmG3fRt+HJ6sbx
         DAK/ExVlTfCbu1tMDdt9DjvK94Q93PpdLJahhcm7kyhu6S/C2YBc2+ysfZdCH2zYK2+I
         esnTp1XpJCB52lqDsP566wQr8gcyA8Y5QP7nfx3f3R5eEJlS0oL8lAio4ZAKiVcfYO62
         K/cw==
X-Forwarded-Encrypted: i=1; AJvYcCU4dWIEqEsfh7d4w48glu/dBmlNgfL389p06UwttflbjiMGNJZYKLX9NaWsy/CnjBSS/1V+Xg3V1Gol8ek=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuc1J3N7A0+EoExxhL5C5URu7kbvw6uCU98tyzb7TFUXY4WNFc
	l7qVb+OmiJzPAhMfzAV11LKd0hX+8ajrykHBNwhEM6MyHA/GSqesjY0vD3bq+kQ=
X-Gm-Gg: ASbGncsfuSBLztidYjj/saJdXSH4LY46DKMVfajWxjfyT3i6w73blAjU5rgSvEzN0cA
	XHkdJJvRW2oKCUKKnsGTGHwH2QGamjU126/O9zdUN/wAmNvvtA30K6lR3Q5RJ/4Lg4UzFQ65kgY
	2OdyVuXG8LHydh+ergCwPp+B5pMlJsl5xk/nFLGIYsds0cSOv+Zdf/Dk4dcJEMfHLczQL8W7uYO
	dLXpNAZuItvpcPatH35+7knI2dEb2Q4jy6Ch+DTE1BOgX1CIVg8lTrfBtfVlF3SHCtoM3olrjHA
	O9xHLu2bG1s5ckY6YEQ=
X-Google-Smtp-Source: AGHT+IES1fBH9Xm1hn7eMcWgU4qwNM0YJ/XgnSVms60Xt5aaLNJShgX4JEQoDPxBZLAVM7x/w27pJw==
X-Received: by 2002:a17:902:d502:b0:21c:15b3:e3a8 with SMTP id d9443c01a7336-21f4e7636d6mr31492145ad.37.1738908706650;
        Thu, 06 Feb 2025 22:11:46 -0800 (PST)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21f3650cd10sm22742625ad.31.2025.02.06.22.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 22:11:46 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Fri, 07 Feb 2025 15:10:56 +0900
Subject: [PATCH net-next v6 6/7] tap: Keep hdr_len in tap_get_user()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-tun-v6-6-fb49cf8b103e@daynix.com>
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
X-Mailer: b4 0.14.2

hdr_len is repeatedly used so keep it in a local variable.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/net/tap.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index 5aa41d5f7765a6dcf185bccd3cba2299bad89398..8cb002616a6143b54258b65b483fed0c3af2c7a0 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -645,6 +645,7 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 	int err;
 	struct virtio_net_hdr vnet_hdr = { 0 };
 	int vnet_hdr_len = 0;
+	int hdr_len = 0;
 	int copylen = 0;
 	int depth;
 	bool zerocopy = false;
@@ -663,13 +664,13 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 		if (!copy_from_iter_full(&vnet_hdr, sizeof(vnet_hdr), from))
 			goto err;
 		iov_iter_advance(from, vnet_hdr_len - sizeof(vnet_hdr));
-		if ((vnet_hdr.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) &&
-		     tap16_to_cpu(q, vnet_hdr.csum_start) +
-		     tap16_to_cpu(q, vnet_hdr.csum_offset) + 2 >
-			     tap16_to_cpu(q, vnet_hdr.hdr_len))
-			vnet_hdr.hdr_len = cpu_to_tap16(q,
-				 tap16_to_cpu(q, vnet_hdr.csum_start) +
-				 tap16_to_cpu(q, vnet_hdr.csum_offset) + 2);
+		hdr_len = tap16_to_cpu(q, vnet_hdr.hdr_len);
+		if (vnet_hdr.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
+			hdr_len = max(tap16_to_cpu(q, vnet_hdr.csum_start) +
+				      tap16_to_cpu(q, vnet_hdr.csum_offset) + 2,
+				      hdr_len);
+			vnet_hdr.hdr_len = cpu_to_tap16(q, hdr_len);
+		}
 		err = -EINVAL;
 		if (tap16_to_cpu(q, vnet_hdr.hdr_len) > len)
 			goto err;
@@ -682,12 +683,7 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 	if (msg_control && sock_flag(&q->sk, SOCK_ZEROCOPY)) {
 		struct iov_iter i;
 
-		copylen = vnet_hdr.hdr_len ?
-			tap16_to_cpu(q, vnet_hdr.hdr_len) : GOODCOPY_LEN;
-		if (copylen > good_linear)
-			copylen = good_linear;
-		else if (copylen < ETH_HLEN)
-			copylen = ETH_HLEN;
+		copylen = clamp(hdr_len ?: GOODCOPY_LEN, ETH_HLEN, good_linear);
 		linear = copylen;
 		i = *from;
 		iov_iter_advance(&i, copylen);
@@ -697,11 +693,7 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 
 	if (!zerocopy) {
 		copylen = len;
-		linear = tap16_to_cpu(q, vnet_hdr.hdr_len);
-		if (linear > good_linear)
-			linear = good_linear;
-		else if (linear < ETH_HLEN)
-			linear = ETH_HLEN;
+		linear = clamp(hdr_len, ETH_HLEN, good_linear);
 	}
 
 	skb = tap_alloc_skb(&q->sk, TAP_RESERVE, copylen,

-- 
2.48.1

