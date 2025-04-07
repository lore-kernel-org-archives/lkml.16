Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31895254843
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 19:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744055251; cv=none; b=d68+O5eZrn0Yh/DAcakmX+X4cimFXXRu+xzkacMwXesu9kYt5x8YCfPpSU9azE31gDLcw8PKIdbgWN3ogoZpdKya7WkfpceWlgpt1u4wqa6VKNDHCCk9NaDypE02PuFT8aqv9uE7KUuP4KU1VZzappXX33xxlvRTFlT4YN7WGLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744055251; c=relaxed/simple;
	bh=GlvSCAg7UZz5CLYVaV/K4bG/kvWgmBwM9Tx9HBMpwWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XO69qmgvTCSuXg7ofcS2D06e/9IPBmleuh3L9MbEo9L20BEGloc3/wExMeGTNvsSlqUV58pYnmV/oXFB0V45bb2Vl3gp+68tqJ9h6RDimUvB0kDGVQGuFM5nIb6grDHdvQ2sa9cQYLZRK83cTa8AqU3hYkrNwSE6Zh4X835pieA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=hEAFHnsc; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="hEAFHnsc"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4394a823036so44476695e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 12:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1744055247; x=1744660047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hrYH2xrGzaSU8S2zLyagpxpW/r4O7GkaJCHPTe5rovc=;
        b=hEAFHnscDzIzKvXZuol7oLG2dJyYU6B+eT6v1ofM7VVY0D2AUYoaqfv2UcmCrx8x+O
         5D9xBOHGKGvAQDiYRwZ3j3dWekFVxFTKx3YBf7V29E3CiVyeAbJ6zUh/RKyK8eaKdL+E
         NR1dRoWqPz/FiJK1MdMlhPWqIt9R9FRXxRu0GaqVSBGLm6Xco4cFr/HOriHiuFennIdK
         AsTiba6cyy32RtE+6hGfHGtZxNEOf0wftXp/eOvipSkNCzQbssbBZaBhp/1E++krF9M4
         RJkt/hX7J338vOxGWoj7bCGyiNDb27EBta6FXl/VR9M4sBnYo2U6SP/znQBrESrkxkWm
         AKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744055247; x=1744660047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrYH2xrGzaSU8S2zLyagpxpW/r4O7GkaJCHPTe5rovc=;
        b=GGyRrKyR65gtkjgIGaNp86OtlqyYmIQye8KOtRT8r9uIvkwIie4y3l5cv/rb/fALTU
         uvQgPywjNPkTGpOWy2nI9l/M3bK17QTaL7ctCNFU7Yc9hws3bVXAUg97rMLYuLAjx8nj
         c4NqKp/baTijnXK/MX20XycljuDDfRkKDlRgbTNHszhz2Zyv2xN+ZOeMnqxQaD8SwJry
         WhVHjGafNFWVaBn0p+3yQ8ltj5S3/sinSLSTs5G9EO1Pc8dVqF+8xGLwxtPqyoTXy313
         f3KaWO39V7pGl80DbO22ZKc9TSWc/aopCz4pjYiADEOXxzUKBzA1vtYYXIT67eAHTS6c
         Sp0g==
X-Forwarded-Encrypted: i=1; AJvYcCV8JsBba27dHaeBDOTpIUf4VWhtiFMuu7Of0K3ODX3NFuOqCTLgXRzRtfiOCyZihkITJGp7UYKTBCXgisQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi7DgqrHfSLvkMlFVmbJykLZ754pxk+hwdH86EIgK3igoaLKvq
	LZFDeyTM7Xn0UF7TJPh7PEQ7iqdXYts0Pn9Bzw6Hs8ygIXeMiTBF0xKKlZ+9Fps5sip+e+pvOkf
	w8xb24rLAM5jSJgjrUCXY2KqRJhGoQOhcRM1D85R0CVUXmY3mUlN1OAk=
X-Gm-Gg: ASbGncvNszeyDGZRdEbNR7BhvReWvezrmyc96mZUZF04UEHghKR/A4bweiOI3JLE06a
	ji8lVrmOpRGEGiL8RyjKzvtC1K05mCwiByrRP1HbWmJWbil5nLoJ4Fi4fdfF3UQ/4LGWEkWkY3j
	fnbg3rkAW3huXIJkEbcHD/lJwLJr6idaAwOAr/dITarIavcg1Fm6kTOCjmj7GZXk9rPtRAb5FdP
	yif/yDaBb2Je7fCg87vSXcluzCS1gIoFQuRj1UJTvtHC9FfjjOTRhc2gfD2V/m5eB9JhBIMla+N
	EqeXi/2eL6p5b/DvUBnhzlG23qUaGUjOOZ2XjbkLzA==
X-Google-Smtp-Source: AGHT+IFwTRSSMqwURfcuR2x1AC4KD8e1qbSjeKRTEifQNarz2z5giACEeNPbrgkqITItgMZkt4i+YQ==
X-Received: by 2002:a05:600c:1c88:b0:43d:7a:471f with SMTP id 5b1f17b1804b1-43ee0694b80mr88736565e9.18.1744055247268;
        Mon, 07 Apr 2025 12:47:27 -0700 (PDT)
Received: from [127.0.0.1] ([2001:67c:2fbc:1:fb98:cd95:3ed6:f7c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342a3dfsm141433545e9.4.2025.04.07.12.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 12:47:26 -0700 (PDT)
From: Antonio Quartulli <antonio@openvpn.net>
Date: Mon, 07 Apr 2025 21:46:21 +0200
Subject: [PATCH net-next v25 13/23] ovpn: add support for MSG_NOSIGNAL in
 tcp_sendmsg
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-b4-ovpn-v25-13-a04eae86e016@openvpn.net>
References: <20250407-b4-ovpn-v25-0-a04eae86e016@openvpn.net>
In-Reply-To: <20250407-b4-ovpn-v25-0-a04eae86e016@openvpn.net>
To: netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Antonio Quartulli <antonio@openvpn.net>, Shuah Khan <shuah@kernel.org>, 
 sd@queasysnail.net, ryazanov.s.a@gmail.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Xiao Liang <shaw.leon@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2479; i=antonio@openvpn.net;
 h=from:subject:message-id; bh=GlvSCAg7UZz5CLYVaV/K4bG/kvWgmBwM9Tx9HBMpwWw=;
 b=owEBbQGS/pANAwAIAQtw5TqgONWHAcsmYgBn9Cu14qyqyGw7y5ZyFPZKkEU04TRKHYhcP30/U
 tTaEwjNW/qJATMEAAEIAB0WIQSZq9xs+NQS5N5fwPwLcOU6oDjVhwUCZ/QrtQAKCRALcOU6oDjV
 hy9gCACYwdKmPU3ICRaoAM3abyWxpho+3x01dUiCIVT7kosMwa/Ed0/+OZgoSuI47PbOsF0jbGK
 ZI85Hyxcjww5PKcKv4tLaYDxZEkDVCF1jOOH4P87sPVRNQ1KTFv+HsvOahjbe+W2HlA4U4tCgB3
 5Ul1vxyjYSin00oZ/P7LED5V1juCZW4IAhaswKanLsd7Mlo2rX9XdTk64QOJhhPxFLBsf16FOHN
 pC4wSV3QOsdESGRdxNJG0+qRZo6h9pVZajPh0vabJs/c9QNuwBLwZjncgNQEqc9DzH0N0e0dXVm
 vfnP3x3ThjnZy8PokM1R8/ubn2XT7WR1GgJSbhJlTt75w54D
X-Developer-Key: i=antonio@openvpn.net; a=openpgp;
 fpr=CABDA1282017C267219885C748F0CCB68F59D14C

Userspace may want to pass the MSG_NOSIGNAL flag to
tcp_sendmsg() in order to avoid generating a SIGPIPE.

To pass this flag down the TCP stack a new skb sending API
accepting a flags argument is introduced.

Cc: Eric Dumazet <edumazet@google.com>
Cc: Paolo Abeni <pabeni@redhat.com>
Signed-off-by: Antonio Quartulli <antonio@openvpn.net>
---
 drivers/net/ovpn/skb.h |  1 +
 drivers/net/ovpn/tcp.c | 12 ++++++++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ovpn/skb.h b/drivers/net/ovpn/skb.h
index bd3cbcfc770d2c28d234fcdd081b4d02e6496ea0..64430880f1dae33a41f698d713cf151be5b38577 100644
--- a/drivers/net/ovpn/skb.h
+++ b/drivers/net/ovpn/skb.h
@@ -25,6 +25,7 @@ struct ovpn_cb {
 	struct scatterlist *sg;
 	u8 *iv;
 	unsigned int payload_offset;
+	bool nosignal;
 };
 
 static inline struct ovpn_cb *ovpn_skb_cb(struct sk_buff *skb)
diff --git a/drivers/net/ovpn/tcp.c b/drivers/net/ovpn/tcp.c
index e643cd8a66350eb92c6785317440fcda6c5ab6eb..dde9707d74442a9a6a9e38631196d2c4a09a74f9 100644
--- a/drivers/net/ovpn/tcp.c
+++ b/drivers/net/ovpn/tcp.c
@@ -220,6 +220,7 @@ void ovpn_tcp_socket_wait_finish(struct ovpn_socket *sock)
 static void ovpn_tcp_send_sock(struct ovpn_peer *peer, struct sock *sk)
 {
 	struct sk_buff *skb = peer->tcp.out_msg.skb;
+	int ret, flags;
 
 	if (!skb)
 		return;
@@ -230,9 +231,11 @@ static void ovpn_tcp_send_sock(struct ovpn_peer *peer, struct sock *sk)
 	peer->tcp.tx_in_progress = true;
 
 	do {
-		int ret = skb_send_sock_locked(sk, skb,
-					       peer->tcp.out_msg.offset,
-					       peer->tcp.out_msg.len);
+		flags = ovpn_skb_cb(skb)->nosignal ? MSG_NOSIGNAL : 0;
+		ret = skb_send_sock_locked_with_flags(sk, skb,
+						      peer->tcp.out_msg.offset,
+						      peer->tcp.out_msg.len,
+						      flags);
 		if (unlikely(ret < 0)) {
 			if (ret == -EAGAIN)
 				goto out;
@@ -380,7 +383,7 @@ static int ovpn_tcp_sendmsg(struct sock *sk, struct msghdr *msg, size_t size)
 	rcu_read_unlock();
 	peer = sock->peer;
 
-	if (msg->msg_flags & ~MSG_DONTWAIT) {
+	if (msg->msg_flags & ~(MSG_DONTWAIT | MSG_NOSIGNAL)) {
 		ret = -EOPNOTSUPP;
 		goto peer_free;
 	}
@@ -413,6 +416,7 @@ static int ovpn_tcp_sendmsg(struct sock *sk, struct msghdr *msg, size_t size)
 		goto peer_free;
 	}
 
+	ovpn_skb_cb(skb)->nosignal = msg->msg_flags & MSG_NOSIGNAL;
 	ovpn_tcp_send_sock_skb(peer, sk, skb);
 	ret = size;
 peer_free:

-- 
2.49.0

