Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E672D29DE
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747958273; cv=none; b=J2R/KcxwxYYqPe0YvUc19VSYKBTsIXi8Hr3sw/1YVpC11OE65h2NjwvvcVIP+uG6qtjOftV6xfZo3bNpQK0VwNl0UERI2qmba3O36ksfdnGFckZYIfbOpZIqzz7Xfq3rByO+rtcwaCqg/Em+jryecjfkzO4oaxO2QnR/hVor0JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747958273; c=relaxed/simple;
	bh=KsU85/LVK/RVxvxFqeEmiH8e3CRbB9hHdYDVZaU9NXQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c0T3PjOU70nvFbTblvUXQIGbr4iH405yFioI/uqGBo5YUZihaZ0E2sGBiVZc/n21BBzYl485FWzNLVk+kQ7+0+LQMrBXMUT/1LP2qq9Fh0QK7TBk4+Kve75LmCcXJ0qsirxDoG5TzpmgS1DkovVBOXdJhh5rTmSIBJarGXiZJCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=waae8oH/; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="waae8oH/"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7429f7f9ee3so6104932b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747958270; x=1748563070; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/U4F4F2baZjVLSiJ5F9H7XP7MI6hq4zoM+YfBft1UC4=;
        b=waae8oH/sCJjko+/EAqIpvri4iQvuZZJHxZakfRhb2zERy58+9rQ1i6u92OAZJqoPE
         BkFMVWxTIKiy89XiDW5P8okf2oPOYj429a9hH2j38FH8BiovDqsxbw3tdNMHK2HN1hKp
         7Lrs1Vxwk/yEguYF5hIKuDYUDB/XSGubxlvSnklm/wvy1oXxx1ddYR9Gm4gLJnheypBa
         07L9LGFqdvEyj6nXl5AfC+2O08O4vZsm630eM52Ja/NjnIDSCIC2tzz1vXU+GpVH/APT
         skw8XEs6+cTKjn7XOHR3DLbw90YdElNFTjOYgtXswR94Z5iBH1TTVgZMOcyL6hf2Qq5L
         YPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747958270; x=1748563070;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/U4F4F2baZjVLSiJ5F9H7XP7MI6hq4zoM+YfBft1UC4=;
        b=C0SrNGxULXNOsHeIaBvCOdHZqShHWuw0ezS8kEJEXSAeXYmTC+oDNWgYtkvP06CEo1
         BfK2PF/tKR9wKIHVWrTDsU4vXr87Y3EXHggXm0Hc8+XeGPng9L7uY1BpARKhWysdQxbR
         kr5YnRZ25flBbZWqqvbsHpU+Aolb/Yt5PtB6dGNVelyhYCvdmRPWOflRnXdb2rXV0mEt
         d3zaeAbtebnO4wZoTYpC/pAXj6ocBI9j3hG1R0rfivR2j9lib33rvjW/VVZ3EdVLCpEA
         QZE1n2agt7DWAlMcsKU6DSTQ1nrd27jhlwk3NLiT4Lo4mZbl9o9ApFdi6Mi/3d/NE5gB
         0OpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBbeUXrr27HFi/vdbtWDNPneMd23T4rKZEOUz5CnyR1gDj2R35gWIWLyJSFMUUJqJ4c4lXx5ryCfRny9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDkniop5srXBoYdL9B6neKNwlqvjo+Y33GLps/NvjffoTznwbn
	VgY3t5+L4T/6DrHfyyhW3o8BK6tlF/svZVk6teywycsjAYmfaS018HWh3Vr8h1ScVBn+NtQgoPM
	Ge8Q6tnffKbCW54NWv+MnybFsnQ==
X-Google-Smtp-Source: AGHT+IEJdalaKRNSP2s4lpQ4yBO8ShRBy3a/J7ixPVGUEG0s+ijq9EKgywPOSNxjqQNTcKp5dNY+vqa+ntvXZiBf0A==
X-Received: from pfux21.prod.google.com ([2002:a05:6a00:bd5:b0:740:b53a:e67f])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:a18:b0:740:afda:a742 with SMTP id d2e1a72fcca58-745ed7763dbmr1443151b3a.0.1747958269860;
 Thu, 22 May 2025 16:57:49 -0700 (PDT)
Date: Thu, 22 May 2025 23:57:35 +0000
In-Reply-To: <20250522235737.1925605-1-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250522235737.1925605-1-hramamurthy@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235737.1925605-7-hramamurthy@google.com>
Subject: [PATCH net-next v3 6/8] gve: Add rx hardware timestamp expansion
From: Harshitha Ramamurthy <hramamurthy@google.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, jeroendb@google.com, hramamurthy@google.com, 
	andrew+netdev@lunn.ch, willemb@google.com, ziweixiao@google.com, 
	pkaligineedi@google.com, yyd@google.com, joshwash@google.com, 
	shailend@google.com, linux@treblig.org, thostet@google.com, 
	jfraker@google.com, richardcochran@gmail.com, jdamato@fastly.com, 
	vadim.fedorenko@linux.dev, horms@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: John Fraker <jfraker@google.com>

Allow the rx path to recover the high 32 bits of the full 64 bit rx
timestamp.

Use the low 32 bits of the last synced nic time and the 32 bits of the
timestamp provided in the rx descriptor to generate a difference, which
is then applied to the last synced nic time to reconstruct the complete
64-bit timestamp.

This scheme remains accurate as long as no more than ~2 seconds have
passed between the last read of the nic clock and the timestamping
application of the received packet.

Signed-off-by: John Fraker <jfraker@google.com>
Signed-off-by: Ziwei Xiao <ziweixiao@google.com>
Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Harshitha Ramamurthy <hramamurthy@google.com>
---
 Changes in v3:
 - Change the last_read to be u64 (Vadim Fedorenko)

 Changes in v2:
 - Add the missing READ_ONCE (Joe Damato)
---
 drivers/net/ethernet/google/gve/gve_rx_dqo.c | 23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/net/ethernet/google/gve/gve_rx_dqo.c b/drivers/net/ethernet/google/gve/gve_rx_dqo.c
index dcb0545baa50..9aadf8435f8b 100644
--- a/drivers/net/ethernet/google/gve/gve_rx_dqo.c
+++ b/drivers/net/ethernet/google/gve/gve_rx_dqo.c
@@ -437,6 +437,29 @@ static void gve_rx_skb_hash(struct sk_buff *skb,
 	skb_set_hash(skb, le32_to_cpu(compl_desc->hash), hash_type);
 }
 
+/* Expand the hardware timestamp to the full 64 bits of width, and add it to the
+ * skb.
+ *
+ * This algorithm works by using the passed hardware timestamp to generate a
+ * diff relative to the last read of the nic clock. This diff can be positive or
+ * negative, as it is possible that we have read the clock more recently than
+ * the hardware has received this packet. To detect this, we use the high bit of
+ * the diff, and assume that the read is more recent if the high bit is set. In
+ * this case we invert the process.
+ *
+ * Note that this means if the time delta between packet reception and the last
+ * clock read is greater than ~2 seconds, this will provide invalid results.
+ */
+static void __maybe_unused gve_rx_skb_hwtstamp(struct gve_rx_ring *rx, u32 hwts)
+{
+	u64 last_read = READ_ONCE(rx->gve->last_sync_nic_counter);
+	struct sk_buff *skb = rx->ctx.skb_head;
+	u32 low = (u32)last_read;
+	s32 diff = hwts - low;
+
+	skb_hwtstamps(skb)->hwtstamp = ns_to_ktime(last_read + diff);
+}
+
 static void gve_rx_free_skb(struct napi_struct *napi, struct gve_rx_ring *rx)
 {
 	if (!rx->ctx.skb_head)
-- 
2.49.0.1143.g0be31eac6b-goog

