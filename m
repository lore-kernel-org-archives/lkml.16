Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A35B1E573F
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739234481; cv=none; b=tfPefWMkiJPizgXQ42F2V/aa6hxXDvFXKayn5w6YRL+GLz9Xwxp8sLEfyGjmSWUJ2kqP8cyLaDm20aD63z/dARR0M14NPi7EZ1KsKBn9bhsajL7e0nX3/FNY38f1FWEGbdP579ivMvuBFF8sL1MRVFiwL1UzdEjbhezKhG5PU4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739234481; c=relaxed/simple;
	bh=HM//bHTohG8SvGOgFgZGSFroiEuOnVDx8FaefbIl69A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LxK5A/1OOWdqeJKE9NvWyQ5NczEo52VRS1PinUbYHw0577a9C18Y6PRYHvQq/+mHP+dI8mmbEH8gUcYXWE6eVEk7I/CK1OMkhgNmh9rKKSDr3s7fW3sS80hS8gmmr8WVlEDCGDMYrHmP8sE6BzBcdH4pYu6z36RFYKBLi600zRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=EsdC+dYu; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="EsdC+dYu"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361815b96cso33256575e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1739234477; x=1739839277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptgiyCj4pUS1E/CVtWO5d7FE/mkFEtjVVkKloLWtXBs=;
        b=EsdC+dYu8YPs8FmKSuiRmtRMmYJjkPKm088V/FRXv9qicXPq14cAYcP64QMHJ0R8Vj
         nM2IXESJN7nT7NGO5it2kNdlT1kTXnGN1g6+aKa6Mgf+TNmI+R7Ckv+mQYe6wPm4pEYf
         fZZ2uLTeHpBmfLisQOqEkWf5jUZx5t5UUrhNWu2f4vekUH+iSqVwIDDF47VOqqU3Ig/B
         RDVlFw+mbdTEU0B5s3f8oKeSQqNfkFwwjhh2aoJzUPUfsovQe17jXuN7uIPww09mpTCq
         J0Ri7E9vd5Y3KcIy7KVzCDiY87FllNsfI20pRjAxvYLd3C4AOHPa8qM8T1dZHT62UQs1
         AMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739234477; x=1739839277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptgiyCj4pUS1E/CVtWO5d7FE/mkFEtjVVkKloLWtXBs=;
        b=RLaYTyAbyW+kUhf5iMAjnzIhy29bDi4aRf+HrVIzGg3O3FqToYDttffI41EJ6sTtq5
         erSvLomzMOnSOEKyGlaUsd4XrcMzEA+koqneCtXaLtkrwOHagdaMfZHqwjEQOn+NFApQ
         92yiFokA1pWqmKz1u4iuPwevJpVUbow/Hyd23pC5Fvuk/PU+3nDRV9j5DbGinAxK5DmF
         krdidIVknigrGnh6s/SPSdt4jxH1qLCzVmxPGTokdcL6CDXo9ZpiWpMrW+WvDNno1PTm
         9ZucHQLiWkOPcQv+nhy5rCmXHmyEld7M/hCpnAVCvuLLkGeoECCnqBW5g0gyYKRgsOrk
         Xf9A==
X-Forwarded-Encrypted: i=1; AJvYcCUnzI5ucyWH52xTUswlf/fdsqLVEs9C4gQsi5gjdC3v3FMg9s5jqygkTf9yjaSStsRvnyQwLXqplSQkB+M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5x7emBlzx1VPxWqvs1VXfmHKmC7zchOzhLp76FMKdm5QQvGfz
	SWM1Z8OgLK+RVeKgffqglaY00I43nN/wgBqbvq/dXRM1BQCob8Z933fIeaamUpI=
X-Gm-Gg: ASbGnct/AzB9jXQbDzm0+/XtWKbNo98LNqLd99Rurf5S4aWswP9mKzm1LJz/Njl/Auk
	d9Iy6SrH9QbABX7PIPoUPPiQ0UdgJCM8g6SDp3D5QaTOJqRvliwWktTzTbJFXpHClm5pdNufgRD
	nnsGhf0DCWfLkA5h9ftnysOcmzXbg3d5oh9VFT4aiKc00xlCF1qHmVeqI+wUMzpb8FFAaDv+GRr
	Icp7ah52mCoBjDbCZ4lnfD9ww2cZqMRfSW5In49CQ1nU758LmlOePAedjeq5ppzm6w8muFJE7Zj
	o2mgT7MZAbWVyXa4kY2wc1Ngsrg=
X-Google-Smtp-Source: AGHT+IFRCSU+ybIfkI/DJ4SVGZSjIRgj8dfuW9WaCHij7uURHFTOjTNFFX0M6AGiMWdTD3/w/BrHhA==
X-Received: by 2002:a05:600c:1e0e:b0:431:5e3c:2ff0 with SMTP id 5b1f17b1804b1-439249889a8mr122163395e9.8.1739234477434;
        Mon, 10 Feb 2025 16:41:17 -0800 (PST)
Received: from serenity.mandelbit.com ([2001:67c:2fbc:1:1255:949f:f81c:4f95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394dc1bed2sm3388435e9.0.2025.02.10.16.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 16:41:15 -0800 (PST)
From: Antonio Quartulli <antonio@openvpn.net>
Date: Tue, 11 Feb 2025 01:40:06 +0100
Subject: [PATCH net-next v19 13/26] skb: implement
 skb_send_sock_locked_with_flags()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-b4-ovpn-v19-13-86d5daf2a47a@openvpn.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3763; i=antonio@openvpn.net;
 h=from:subject:message-id; bh=HM//bHTohG8SvGOgFgZGSFroiEuOnVDx8FaefbIl69A=;
 b=owEBbQGS/pANAwAIAQtw5TqgONWHAcsmYgBnqpyNfPmbwysZS6fzCYc1ZtrfcCXd1vj7nUbNQ
 dbtvjPYQeiJATMEAAEIAB0WIQSZq9xs+NQS5N5fwPwLcOU6oDjVhwUCZ6qcjQAKCRALcOU6oDjV
 h859B/9s8DriVDTwh4l7CRvY9KfqzFoBdRro6mK412+Xi7fpyEmPrYthaMjcVZcNAN3Bl8vXqT0
 t59wZQnqrszLf+ezCMZn+vptUQwkPvFJIPtHbQsZgDr1Rl0qlpyHzRuG4eMu/TGqyMFUiUdyXzH
 +EVmpY8UFA2MES9OWJt4N+GZMMX3s1bcCZEP4VXY4MYTSQLGghuVpg0yyweRUFbW+2XvVPdMoug
 yerjap5yrjrZsYVlzAy6fuNec+Pbrz/eUiUVSjV+h2XyPqb11GliJwFzrEjHe3m51jmcSXfcFEy
 iLSOzJnDLm4PWbMkLoF0E1XYVxLrl5rjdEmAqfrycRGuHCq3
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
index bb2b751d274acff931281a72e8b4b0c699b4e8af..c7afa7871e1c26e0caad4f77facf8a225425bce5 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -4162,6 +4162,8 @@ int skb_splice_bits(struct sk_buff *skb, struct sock *sk, unsigned int offset,
 		    unsigned int flags);
 int skb_send_sock_locked(struct sock *sk, struct sk_buff *skb, int offset,
 			 int len);
+int skb_send_sock_locked_with_flags(struct sock *sk, struct sk_buff *skb,
+				    int offset, int len, int flags);
 int skb_send_sock(struct sock *sk, struct sk_buff *skb, int offset, int len);
 void skb_copy_and_csum_dev(const struct sk_buff *skb, u8 *to);
 unsigned int skb_zerocopy_headlen(const struct sk_buff *from);
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index a441613a1e6c1765f7fc2e40f982b81f8f8fdb96..e83327bcbce37625f5c0b8b0581d6e3bf5fb55a5 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3267,7 +3267,7 @@ static int sendmsg_unlocked(struct sock *sk, struct msghdr *msg)
 
 typedef int (*sendmsg_func)(struct sock *sk, struct msghdr *msg);
 static int __skb_send_sock(struct sock *sk, struct sk_buff *skb, int offset,
-			   int len, sendmsg_func sendmsg)
+			   int len, sendmsg_func sendmsg, int flags)
 {
 	unsigned int orig_len = len;
 	struct sk_buff *head = skb;
@@ -3285,7 +3285,7 @@ static int __skb_send_sock(struct sock *sk, struct sk_buff *skb, int offset,
 		kv.iov_base = skb->data + offset;
 		kv.iov_len = slen;
 		memset(&msg, 0, sizeof(msg));
-		msg.msg_flags = MSG_DONTWAIT;
+		msg.msg_flags = MSG_DONTWAIT | flags;
 
 		iov_iter_kvec(&msg.msg_iter, ITER_SOURCE, &kv, 1, slen);
 		ret = INDIRECT_CALL_2(sendmsg, sendmsg_locked,
@@ -3322,7 +3322,8 @@ static int __skb_send_sock(struct sock *sk, struct sk_buff *skb, int offset,
 		while (slen) {
 			struct bio_vec bvec;
 			struct msghdr msg = {
-				.msg_flags = MSG_SPLICE_PAGES | MSG_DONTWAIT,
+				.msg_flags = MSG_SPLICE_PAGES | MSG_DONTWAIT |
+					     flags,
 			};
 
 			bvec_set_page(&bvec, skb_frag_page(frag), slen,
@@ -3368,14 +3369,21 @@ static int __skb_send_sock(struct sock *sk, struct sk_buff *skb, int offset,
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
2.45.3

