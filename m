Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4A52571A2
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750758868; cv=none; b=kJvaBww2f91Ob1iwaJMhtQzWkWjSDaPTLL6lou5Pr14VNDlkg7knmRHvKd7pVnhYWY0rnGCYjiQ0rWRKMaxT307ZEW5J5ZUjyto8PjolQ//FWgcQC9AswK+mhzmsO2qPWrFdOwecytJKBU+rZIJy0Pub+xkq3D/JYhmVBI/8viY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750758868; c=relaxed/simple;
	bh=aVicvWb2z9asxVyGNaHwfqwI/PWtxFm6n16ZTbYiSFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KhQ/ARc09iRwy5bxheS6Pz5QhQqK8BHbSCU6OH6clcPBpLyPdjfq4sBCA5ech9OTAuosFEgPOFwBnYLr3afaMb+j5iyh1CfSFMy0yS/gAa+WtybbbS2F06w7YeM9xXsuL+mca4IDATgbaREK+Uu0YI/8eSgKGPfgwZ/yEQ2a8pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rbox.co; spf=pass smtp.mailfrom=rbox.co; dkim=pass (2048-bit key) header.d=rbox.co header.i=@rbox.co header.b=tV7kDYan; arc=none smtp.client-ip=185.226.149.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rbox.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rbox.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rbox.co header.i=@rbox.co header.b="tV7kDYan"
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <mhal@rbox.co>)
	id 1uU0M5-00AvYY-Sa; Tue, 24 Jun 2025 11:54:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rbox.co;
	s=selector2; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From;
	bh=30g1ZM1uCabAJyCAmaZGsFvTePUdMNQ+ZO3xiXDVNWM=; b=tV7kDYansE5dJeC9l3H5LGVRtz
	zzUC1jD0tHscxG8lMf93xoOHVTLd8MmANZMFlVwufdZjaTFRgo7NnVn8Dyer2tyX6nQtHMhmbqoGP
	WztFccTUf+d9BbXaCOBCbpRnG9pLVKxyXy9mQBAWh6nUeq6sb/E+ORiSl4JURBudHTuJ3x+jOnvzy
	o5Xm0T/QD+c7xz3MBwKXf1TbISPtsGAInFCfj/AE+cZnHSarZ9yKf/kwmtY1ZBsl7RvqcC/n0d09q
	+ODhylckE70EuxbauE0HcnAwDjZzlszZHkH1MjcgDCpXJ0B/D8ewMFM/7x6QwFxnImv1Y2RorB++w
	MxQYfV4w==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <mhal@rbox.co>)
	id 1uU0M5-0002Yk-Hg; Tue, 24 Jun 2025 11:54:17 +0200
Received: by submission02.runbox with esmtpsa  [Authenticated ID (604044)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1uU0Ln-00FYQf-Ew; Tue, 24 Jun 2025 11:53:59 +0200
From: Michal Luczaj <mhal@rbox.co>
Date: Tue, 24 Jun 2025 11:53:54 +0200
Subject: [PATCH net-next 7/7] net: skbuff: Drop unused @skb
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-splice-drop-unused-v1-7-cf641a676d04@rbox.co>
References: <20250624-splice-drop-unused-v1-0-cf641a676d04@rbox.co>
In-Reply-To: <20250624-splice-drop-unused-v1-0-cf641a676d04@rbox.co>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
 David Ahern <dsahern@kernel.org>, Boris Pismenny <borisp@nvidia.com>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Ayush Sawal <ayush.sawal@chelsio.com>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michal Luczaj <mhal@rbox.co>
X-Mailer: b4 0.14.2

Since its introduction in commit ce098da1497c ("skbuff: Introduce
slab_build_skb()"), __slab_build_skb() never used the @skb argument. Remove
it and adapt both callers.

No functional change intended.

Signed-off-by: Michal Luczaj <mhal@rbox.co>
---
 net/core/skbuff.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index b4f7843430a3f8f84aed387bf41ae761d97687ad..b5f685b6611c177c199f70bb16fd3940bce8cded 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -384,8 +384,7 @@ static inline void __finalize_skb_around(struct sk_buff *skb, void *data,
 	skb_set_kcov_handle(skb, kcov_common_handle());
 }
 
-static inline void *__slab_build_skb(struct sk_buff *skb, void *data,
-				     unsigned int *size)
+static inline void *__slab_build_skb(void *data, unsigned int *size)
 {
 	void *resized;
 
@@ -418,7 +417,7 @@ struct sk_buff *slab_build_skb(void *data)
 		return NULL;
 
 	memset(skb, 0, offsetof(struct sk_buff, tail));
-	data = __slab_build_skb(skb, data, &size);
+	data = __slab_build_skb(data, &size);
 	__finalize_skb_around(skb, data, size);
 
 	return skb;
@@ -435,7 +434,7 @@ static void __build_skb_around(struct sk_buff *skb, void *data,
 	 * using slab buffer should use slab_build_skb() instead.
 	 */
 	if (WARN_ONCE(size == 0, "Use slab_build_skb() instead"))
-		data = __slab_build_skb(skb, data, &size);
+		data = __slab_build_skb(data, &size);
 
 	__finalize_skb_around(skb, data, size);
 }

-- 
2.49.0

