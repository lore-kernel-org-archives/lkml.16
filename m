Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565871E5B81
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739234482; cv=none; b=cUwa5F2NWvV8uN8+fI37ZCqHk/Vm4wxMb3l+TGQvjwgT2Ghr1MNVsG2my/S1k5/xFnkBOo3k6iL++/Dcig2H2IqtwCCxMzLoykD7bR2MpimfPp3a4/mUNL57r+k2yY8e5fmsq9mieRlQZiv6msaFQmV+ULlGxlkrnwuzFvNOW/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739234482; c=relaxed/simple;
	bh=KD5BFpOHNqSvy48hENeZDo81i4H16OBz+7xPO4NE0r0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BYi/Of0rc2WEiZtlJKnEVHBGozJD226/yJs2IS11Sp+VpOgzNN42084w0TKTylWFLC4jjUqksLnp7xDG0NcHs0+AYQ7I71VPhs2w65iEcjjUMQcgKaG0tHtSrnP2Jwzjy2tm6xSkGMkM7/SJs9bjAp8Z4oFkCMTgxOmc8a3ORo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=YUpkXHaE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="YUpkXHaE"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436345cc17bso34411985e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1739234478; x=1739839278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+EI3H1b1PYT7I1BdLZ0sMTpvWIzL+1PSLPvHLdSDaSw=;
        b=YUpkXHaEx091KYbmKYpEGYgGdKH/GpDsCGP1W0xI+xWnp7EtkFpqDwLpw3tkTzagNV
         MGbKjgyYf0Yw2Yn0fdXe0i6Q5PEJCKbBmlSAOgkhqgCMyUsNE9iEHtlOxEwVlSe4G8JZ
         Hpo6TpDmTkkXDMFm5ylTabyIRoVH0MP0XpW0HuUEbBJlFFSK/FOTzBWZ9sjAt6pPCBxO
         n0MQgQ7/745U4XAjZK2RzBKS9IBsDpOpic7TWeZ+SHXKyb0NQ4iQbIcqd7ZRO45a1Vt1
         TLnpWtnxm8fXDG5g0oLhDGXu/CesvEAA2gtu5CNlTeYQuZNauT+NYlUuVTiMjlGhboMx
         mPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739234478; x=1739839278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+EI3H1b1PYT7I1BdLZ0sMTpvWIzL+1PSLPvHLdSDaSw=;
        b=lLkXULh8wTiVE/N3EDHzr83gTWT0vGc0UQBr5tDSBCuqc3linHuwjiP/wwTQVfp1i6
         tos61x9PuDKmdwA7NZk2/dDLpJfLWf8liRm+zY+maYm0AOqYGWa8CY1JqEccqGpBPyy3
         QwocnLHqccEDTdxxf5R9wHrksvixx5dOKU3o+9Hl+tpX4u7LhNjSq97BpHNjTpCISrgP
         nyjtJKvA8dpo0Whg9ZrIaKGuFlcF+jLkZA/r9wq15C4L7/K8ZxPNRFHfWofYHaTEjpUv
         vL3cKmrOYuR0KBDEF2glxcbOrJQgUPeMWyOHXTMuLvc72z6tnj5uUEGIXU+6DKeul0yq
         EqWg==
X-Forwarded-Encrypted: i=1; AJvYcCWaseYHk/pNdVyZbA00Bwa3R7H8gdwMEf+RZg7Slx+WeROgHc/vkq52hTYp5MrUjLwN5I1yCt8kiSz5z0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhYr1TWx8JdAtyPqddq1GY9kokZ5ANUdfV1QHJGn70qejg+GQu
	HvAb5U6GWaRBPm7e+u9ykRiwtsZj9jtqWpmZ7m5xgpaEWSNPl493roPveSIiYtA=
X-Gm-Gg: ASbGncvHRyAyCCzc0xoc5PeTJOCTO2HYM434JuL0paUZHAxLb/O1zq1XwnGvvOyIH+2
	CPoPN4FLrzljP83Z8TSm5lz8XVUlFRxMxLa+tv78ek6jgv4KYcmphunYFr1B1vLIftF3lA3IDN6
	hFePSGe96XxRIiBio5wdJOxmJTnDtAzesBBnJaRwzTIjJo7s3raIHVqUniwE7rV2z0CKIT6YVCn
	fNfpMRxJJAsV47GHH1+A6H6VtcIsCwWVCqKFTFqZywwFSXDSORUCHBsQh4ohp7UTcwtYstxVVeV
	Hbn6PjkWv5d1JHQVFL6d21+Mfj4=
X-Google-Smtp-Source: AGHT+IFKSdsxUH0mb61Yv8dAVEGvPV8nyRzJdwcsKzf0RWS0xgzb4/3SNNPkbAAI2sAkmgFuFxDXbw==
X-Received: by 2002:a05:600c:4e13:b0:434:9499:9e87 with SMTP id 5b1f17b1804b1-4394c8538fdmr13205315e9.25.1739234478587;
        Mon, 10 Feb 2025 16:41:18 -0800 (PST)
Received: from serenity.mandelbit.com ([2001:67c:2fbc:1:1255:949f:f81c:4f95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394dc1bed2sm3388435e9.0.2025.02.10.16.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 16:41:18 -0800 (PST)
From: Antonio Quartulli <antonio@openvpn.net>
Date: Tue, 11 Feb 2025 01:40:07 +0100
Subject: [PATCH net-next v19 14/26] ovpn: add support for MSG_NOSIGNAL in
 tcp_sendmsg
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-b4-ovpn-v19-14-86d5daf2a47a@openvpn.net>
References: <20250211-b4-ovpn-v19-0-86d5daf2a47a@openvpn.net>
In-Reply-To: <20250211-b4-ovpn-v19-0-86d5daf2a47a@openvpn.net>
To: netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Antonio Quartulli <antonio@openvpn.net>, Shuah Khan <shuah@kernel.org>, 
 sd@queasysnail.net, ryazanov.s.a@gmail.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Xiao Liang <shaw.leon@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2456; i=antonio@openvpn.net;
 h=from:subject:message-id; bh=KD5BFpOHNqSvy48hENeZDo81i4H16OBz+7xPO4NE0r0=;
 b=owEBbQGS/pANAwAIAQtw5TqgONWHAcsmYgBnqpyNw21/hSe4FFL2FB90CoPI8CErMCqUwISSR
 b0KPLN4+omJATMEAAEIAB0WIQSZq9xs+NQS5N5fwPwLcOU6oDjVhwUCZ6qcjQAKCRALcOU6oDjV
 h+hJCACw4xagGSlZCHvOYq7pyy+QacdWEq0boNs7Y5MNnj4dTkcTDE40KlY+hm/PLHcde3PjZUv
 46qUAzT8iKBWyErBWxcw7dnbaVEU61U2W1+YQsCET2ai0u4gRf40CMOFCPQixYEgoAMCntCcop/
 ek3yc8Zxgj8LqUF/elVwPiyEuzqQcKNtLJ7TNnYj9WubT7zAWxVP3F2HJEY4kmWeTqc9fap2TpV
 XCYszQES0HzAjJ3RDwThMTdZu0o0Pn5ys1bDbEzW7iF/UL6VjJ+klIIjvPc/lLlUNwjrJYX3D7f
 9Bwm+2mlK+aJnksQIQVYbDgKvJYK9FZYUCJ6p8Lv4j9eh0CS
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
index 6a256684d68682bd4dfab93dbff092d238192316..e4df039f959e8af945844b2bbcd9ea416e1bcec9 100644
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
index c7eb96d79e0229d178e1cf090cea45361730685e..c4d90cfeaaf7d032270fa2c9cb78f4ca7745750f 100644
--- a/drivers/net/ovpn/tcp.c
+++ b/drivers/net/ovpn/tcp.c
@@ -210,6 +210,7 @@ void ovpn_tcp_socket_detach(struct ovpn_socket *ovpn_sock)
 static void ovpn_tcp_send_sock(struct ovpn_peer *peer, struct sock *sk)
 {
 	struct sk_buff *skb = peer->tcp.out_msg.skb;
+	int ret, flags;
 
 	if (!skb)
 		return;
@@ -220,9 +221,11 @@ static void ovpn_tcp_send_sock(struct ovpn_peer *peer, struct sock *sk)
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
@@ -363,7 +366,7 @@ static int ovpn_tcp_sendmsg(struct sock *sk, struct msghdr *msg, size_t size)
 
 	lock_sock(sk);
 
-	if (msg->msg_flags & ~MSG_DONTWAIT) {
+	if (msg->msg_flags & ~(MSG_DONTWAIT | MSG_NOSIGNAL)) {
 		ret = -EOPNOTSUPP;
 		goto peer_free;
 	}
@@ -396,6 +399,7 @@ static int ovpn_tcp_sendmsg(struct sock *sk, struct msghdr *msg, size_t size)
 		goto peer_free;
 	}
 
+	ovpn_skb_cb(skb)->nosignal = msg->msg_flags & MSG_NOSIGNAL;
 	ovpn_tcp_send_sock_skb(peer, sk, skb);
 	ret = size;
 peer_free:

-- 
2.45.3

