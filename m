Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E513F4315A
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 00:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749859692; cv=none; b=SBtpA2lirDimECi6+yZ8+ukxiKZi6kA1VZ9xfXqh+9OR7+bdSwlQJkV/R9Aw9Z1ULhpMo3h3yXtfO8oWB9he6lJjBaXa5P639VTeM5YltIfJ57tTi3YWqVci9m6sgMU+eG9pvrOdEWNbXwpYzMeEMGm2qyv5iuzvI59jwtiy5K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749859692; c=relaxed/simple;
	bh=AUqZSuiBe3PPkayRXE+1vl6STB7+UaA9jA3sUFVwyeo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sWJblNJJ2ZouyDVtCshr3JQkB1DYmDgQyCzWQbdOxHsk5LXmAmjvHu/mG9pUseoGC+NT5k+n9I3H3ksaccBBqTaN4KK0BOmBiL4no07FWK79TKdqdWje0AVhNnAWtgDU3cJyYhQ9jNaWg5FRASgr7ZlwKHE2gZQGdYFq4LB/U4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qCEd4C8/; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qCEd4C8/"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b31814efd1cso290600a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 17:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749859690; x=1750464490; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wQ77PoXoZhxHkicjW2DRoewCReIJSoD7R1A24IDLpDg=;
        b=qCEd4C8/2EGolwlNypZa9xDJr8wIKtEr+Z7QPrbX62lFBc5CFowAGfBH08ZhspgcBO
         oQt9uhFzr2h6erpB3HEANu+Hne1EKF358VLxIqZkVUxN9IQPfL9W8Z9NEoLe9eIwc03V
         WeQE/bRGEFSrRrdCnZXITo7CNAYAqm+IWDzhot+MPHBgwmlixsAIx3xYHjzCa7iWi82l
         n2ZNT4ehMN9lSefLl+6+H8N7WGgWZ0KKoQOwSnzYH2iemi6rc98jhLa06J+wBtD6lKG0
         K1Ww4Ab6rQNhBBOkosIjyBRjbpdhH06RKVYZs1L6BN8NvjMTy1B/DIZK3ND4WIP3s7Sf
         bBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749859690; x=1750464490;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wQ77PoXoZhxHkicjW2DRoewCReIJSoD7R1A24IDLpDg=;
        b=b3avNtQwi7rA3F4+QML48qRyF0FFBQt1iRFt0jZOh/lsGF6PaFY8pdcSWPgdGv1+aA
         60qTvUbbmLHHMCXU3EVINNklEqvke0JhFHnyt6uJJqDX+g9fe5OSKdfdEYq9SQBdhz0U
         ZmsAqwBUV5/Uwtd6Pn9yTKki8RmP91UMn/9FVEJlnEOkFlgnLiuCqPNPinBELf2S5fuS
         azYNnwM0NNfm1ViDU1dl6X3UXd7uYtUu5JffbCmcCDDRw5KAkygZVMk/qlb2jmt+Kn8X
         NwXZDmk6xrFiVgfDwN23BcU6jgwyoLNLpWDGOEbVnNoIn8g87sWQb3puV6aJ/w9ZQXYU
         67eA==
X-Forwarded-Encrypted: i=1; AJvYcCWL/ix+bGJBCz1P8UgMtvIi52fIevBIFbUUq/XvW8FMe2CmEbikky/vKoC08pILVl1SfKO+CtNzSVH386g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyycZhMEQ4ukvdnxwFgsB0CyHV1rhDMeo0eC44lCpCSDcSXIXw9
	tA1P6qNSfaPp4XH0l81a3Tdl/C1EKkR9EUK2yRh7lvIzG3pe4p1JNDlknuwKI7Z/fKglUVD/kuN
	dCbt0kZAEjvN/Lta5yxpKaqqLjQ==
X-Google-Smtp-Source: AGHT+IGpt8cTMfKUdKgjk+25Jrog2GjB0qM8UCNp6eTJcDfJyHbgtJn77pvdxSnRwYARFCY1cI+LKo5NauUFzP/O3Q==
X-Received: from pfwy28.prod.google.com ([2002:a05:6a00:1c9c:b0:746:2414:11ef])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:47df:b0:21f:becf:5f4d with SMTP id adf61e73a8af0-21fbecf5f6dmr999246637.20.1749859690301;
 Fri, 13 Jun 2025 17:08:10 -0700 (PDT)
Date: Sat, 14 Jun 2025 00:07:52 +0000
In-Reply-To: <20250614000754.164827-1-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250614000754.164827-1-hramamurthy@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250614000754.164827-7-hramamurthy@google.com>
Subject: [PATCH net-next v5 6/8] gve: Add rx hardware timestamp expansion
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
2.50.0.rc1.591.g9c95f17f64-goog

