Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA6128F52E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715868; cv=none; b=iV2E9QJprv4iVw8z8m3jvmg5FzPr8KGYL+Wtayxvjo9Gy7FzjFcmp+hqxX6R+RXuJ1IPQtnriQX/FY4toK9Tlh7TcetP1t9E8LQizWXXVauW3Xd32Zj7gNsUDWLrkEqOjChhDDjwsYAblK5bPv+xt1V9SDqA5mt3sylIkDuaZho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715868; c=relaxed/simple;
	bh=f2L/6MV3WoY+r58AHmJzHD1uZB1yXOJNNlPf35u+BQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FdOZSCu2iICUIaL3kk9opMV5dn3cbvo3Lc2cYFPQ6Igyiq/K/Fo3WRNOWqIPmoOxsX6hag1ju/r1qHwh56D/aSjlmnDSm0652mHId8EFAo15Yjf6Hputxxu67ao35hbYbuV0y/eJeo/zPVCz+8DoQdAflqNbV08/N1JM6OKdS94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=a3p/Jopz; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="a3p/Jopz"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c1efc457bso3598380f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1744715863; x=1745320663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9WYY/11xBcIOkdKUznP/08VpnWtjoWEZk7RzwrODJkE=;
        b=a3p/Jopzb2Ad1EWqHIHFnpxP6QRwW40Jgxp1CxXRbxi2GpgWvSkzo1OzMKk7Mr3zXr
         WG8CkPSfJGWtnwP/e6rWBWosxd+XXdhToMLfON/oLJasww4iqcgBcLxRPDvJQfmOl8gi
         adI9xBwXLiDPOPSfZCKFTtcRpiXnJK+9jZw6sF1RSMdfYj9IBk7cJXdYf8M15vLmfhMT
         EGzGV/jcPUtr7Kcsq/MAm4P8Xs59rD6+cU12RyXCd1LC+BOfC6aR4CS9FqvdAlxaDsH/
         E+iSFg6+e0dD5IGnc+lvOE7J+/mKY3u3nW7UfFPIlBpHNBAtrEoyJAemLNCZ0Ti37i5H
         qPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744715863; x=1745320663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9WYY/11xBcIOkdKUznP/08VpnWtjoWEZk7RzwrODJkE=;
        b=SFSQy2yNx110Bxu+KwxRXxFfbTCUHgWIijCkDcavHmHEc4iprl9hG+Tq1yddrZbWRN
         r1o06RhwIULEq8qObuo3oipzciNmh0lcVrH/vXMbewh/ihnq88oUY9Cad6o8D3z8/wzn
         0G+/SIYTOPuWEH7uDW+97Z1i8oebyxs7+PEpqfR9uLazdAtDbNaNY/qCkPZYljOubw+r
         8gb9Jrr6azMMb5EzLt6bq182S9B0kTon73O1MzENrVcsSNyDQu/1XxV+13VC66SP3htY
         HJm9xCYs0eai/mvjl2lUrdH/JpGLfNzj/Z4L5PjiOiCJXss26VYnhNpq9efatyCsKzj5
         zIJA==
X-Forwarded-Encrypted: i=1; AJvYcCXIFfuyw5WNzjJE13P/DQqE9tjObfA8BVJ1ZpzoxZrNKx/Nq0kA1fbpPwrPIcThH7fLG0S1dAHG1sSuuzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP0zO3e3Bfe8bNCS8Zu4exx9u0rJwakEnFqNGQdl0kmNn5ZDw2
	SYcabMXKxs9qUtqBqLLzus8h2z0t5acEb+ZzzzP1NYJ7ZRBYPgeOY81632H72/vHhC0kOleQO0G
	MHNIf67KEGcS1FTv2eZNuiC13B8ctlZGXRM5wc7AburloRWTSaPs8xk8=
X-Gm-Gg: ASbGncvJSRkuaaoITN9XdkSIFjCOkdjKgxwiA3Kdj0ybscdzuhrjSgqXA9Id40htTDn
	c+KHoJtHnKNiQB0cqhbImBXKs8pLCcf3RgnsVZv1ouE2r8esJrtBPCDTWMglAwK+T2YuZoIVEkl
	f0Ivy59jEMW5ucNJ10lFkU0Akbh/03AGS6XZ1nmOetvoPsPHFTdmY8zmGyU24ksn5szgMQxjeN/
	kdY2gUrAomCt3PAr7vfJIVAQ7Grg4frUb+4y8B1IRfr88mh7qqMcUyZcmbvMrn5UZ97XM7e7v8a
	miaWa6GsWm/XzuUGR2JiG9j4khb7MV3OeG236nDIYxVVmZ7d
X-Google-Smtp-Source: AGHT+IGxnmTpIEZoPgKS6KSxnbaUdq8NgL5AA63J7oNVT7dDt++Ud3v8hl4tc0WEstdoOJvr+/JphA==
X-Received: by 2002:a05:6000:2401:b0:391:20ef:62d6 with SMTP id ffacd0b85a97d-39ea51ee240mr13529343f8f.11.1744715863426;
        Tue, 15 Apr 2025 04:17:43 -0700 (PDT)
Received: from [127.0.0.1] ([2001:67c:2fbc:1:83ac:73b4:720f:dc99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d26bsm210836255e9.22.2025.04.15.04.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 04:17:42 -0700 (PDT)
From: Antonio Quartulli <antonio@openvpn.net>
Date: Tue, 15 Apr 2025 13:17:29 +0200
Subject: [PATCH net-next v26 12/23] skb: implement
 skb_send_sock_locked_with_flags()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-b4-ovpn-v26-12-577f6097b964@openvpn.net>
References: <20250415-b4-ovpn-v26-0-577f6097b964@openvpn.net>
In-Reply-To: <20250415-b4-ovpn-v26-0-577f6097b964@openvpn.net>
To: netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Antonio Quartulli <antonio@openvpn.net>, Shuah Khan <shuah@kernel.org>, 
 sd@queasysnail.net, ryazanov.s.a@gmail.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Xiao Liang <shaw.leon@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3763; i=antonio@openvpn.net;
 h=from:subject:message-id; bh=f2L/6MV3WoY+r58AHmJzHD1uZB1yXOJNNlPf35u+BQk=;
 b=owGbwMvMwMHIXfDUaoHF1XbG02pJDOn/HJyiXoau2Hdf+eVp3mXTziazBBS8/NLn2bQxboJrq
 2X0d9faTkZjFgZGDgZZMUWWmavv5Py4IvTkXvyBPzCDWJlApjBwcQrAREQcORjWJM4wtUyWduXv
 dA3dLR3LVOOqOXM3h1Yzx4H9d+NyY1zPqWfGLdkmIHnNrNTVJO2fjglvpFCIqJ5DQ3i41/PM1+8
 Y16dGNP2+eLLuafQe7xuSS9P7DfWmfOU2ilPwKOLWLCzUM+WPP2Ux9diXzUd2/oh3zr/m5X4leL
 G+2Nr4RV1c//e+NWKwlJt8Q2P1amnNu3uS4iavYXGrfpcWM+t16x053+Vrz2VzGE1NSmlttZu43
 fHAZX3Wn1UlewLnsZ9JiC+aeO1YqE6d76LDi6QuVJYFnc0q6s3X6yreXW90bEOg0IzX0nb3bsy+
 cvyLoV5asMaNSGZZNesvyQzqLeeuWUf8z0tyzn+e+7wIAA==
X-Developer-Key: i=antonio@openvpn.net; a=openpgp;
 fpr=CABDA1282017C267219885C748F0CCB68F59D14C

When sending an skb over a socket using skb_send_sock_locked(),
it is currently not possible to specify any flag to be set in
msghdr->msg_flags.

However, we may want to pass flags the user may have specified,
like MSG_NOSIGNAL.

Extend __skb_send_sock() with a new argument 'flags' and add a
new interface named skb_send_sock_locked_with_flags().

Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>
Signed-off-by: Antonio Quartulli <antonio@openvpn.net>
---
 include/linux/skbuff.h |  2 ++
 net/core/skbuff.c      | 18 +++++++++++++-----
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index f1381aff0f896220b2b6bc706aaca17b8f28fd8b..beb084ee4f4d2a83165e08d3a5918d0bc9bfc069 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -4145,6 +4145,8 @@ int skb_splice_bits(struct sk_buff *skb, struct sock *sk, unsigned int offset,
 		    unsigned int flags);
 int skb_send_sock_locked(struct sock *sk, struct sk_buff *skb, int offset,
 			 int len);
+int skb_send_sock_locked_with_flags(struct sock *sk, struct sk_buff *skb,
+				    int offset, int len, int flags);
 int skb_send_sock(struct sock *sk, struct sk_buff *skb, int offset, int len);
 void skb_copy_and_csum_dev(const struct sk_buff *skb, u8 *to);
 unsigned int skb_zerocopy_headlen(const struct sk_buff *from);
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 74a2d886a35b518d55b6d3cafcb8442212f9beee..d73ad79fe739d1c412615ed01f0850dbf4c9e09e 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3227,7 +3227,7 @@ static int sendmsg_unlocked(struct sock *sk, struct msghdr *msg)
 
 typedef int (*sendmsg_func)(struct sock *sk, struct msghdr *msg);
 static int __skb_send_sock(struct sock *sk, struct sk_buff *skb, int offset,
-			   int len, sendmsg_func sendmsg)
+			   int len, sendmsg_func sendmsg, int flags)
 {
 	unsigned int orig_len = len;
 	struct sk_buff *head = skb;
@@ -3245,7 +3245,7 @@ static int __skb_send_sock(struct sock *sk, struct sk_buff *skb, int offset,
 		kv.iov_base = skb->data + offset;
 		kv.iov_len = slen;
 		memset(&msg, 0, sizeof(msg));
-		msg.msg_flags = MSG_DONTWAIT;
+		msg.msg_flags = MSG_DONTWAIT | flags;
 
 		iov_iter_kvec(&msg.msg_iter, ITER_SOURCE, &kv, 1, slen);
 		ret = INDIRECT_CALL_2(sendmsg, sendmsg_locked,
@@ -3282,7 +3282,8 @@ static int __skb_send_sock(struct sock *sk, struct sk_buff *skb, int offset,
 		while (slen) {
 			struct bio_vec bvec;
 			struct msghdr msg = {
-				.msg_flags = MSG_SPLICE_PAGES | MSG_DONTWAIT,
+				.msg_flags = MSG_SPLICE_PAGES | MSG_DONTWAIT |
+					     flags,
 			};
 
 			bvec_set_page(&bvec, skb_frag_page(frag), slen,
@@ -3328,14 +3329,21 @@ static int __skb_send_sock(struct sock *sk, struct sk_buff *skb, int offset,
 int skb_send_sock_locked(struct sock *sk, struct sk_buff *skb, int offset,
 			 int len)
 {
-	return __skb_send_sock(sk, skb, offset, len, sendmsg_locked);
+	return __skb_send_sock(sk, skb, offset, len, sendmsg_locked, 0);
 }
 EXPORT_SYMBOL_GPL(skb_send_sock_locked);
 
+int skb_send_sock_locked_with_flags(struct sock *sk, struct sk_buff *skb,
+				    int offset, int len, int flags)
+{
+	return __skb_send_sock(sk, skb, offset, len, sendmsg_locked, flags);
+}
+EXPORT_SYMBOL_GPL(skb_send_sock_locked_with_flags);
+
 /* Send skb data on a socket. Socket must be unlocked. */
 int skb_send_sock(struct sock *sk, struct sk_buff *skb, int offset, int len)
 {
-	return __skb_send_sock(sk, skb, offset, len, sendmsg_unlocked);
+	return __skb_send_sock(sk, skb, offset, len, sendmsg_unlocked, 0);
 }
 
 /**

-- 
2.49.0

