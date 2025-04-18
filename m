Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB0A25393C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 22:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745014386; cv=none; b=hZoqzEQQKi2bSudpgS6W8uvFOIRVNTzE7M7m3HWAsgJ/dAWDNnwApvoB80sBtOWtqFFfzeMdqLzlmyN9eh3sqhF1ZeL1eZUO9BRLHRJ/u3nyWo8oDih8JhUMAzUnCX79tBY4Zx4yRVJRh+sxwz0UjgkmE0dliOABxNadOgZaLYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745014386; c=relaxed/simple;
	bh=LDgGYHe8WA8ukbxnUNq27MZRp/79LOgnW+Ea0tdUQtI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UEWKR+HMsswK9Kl9kKFXSE+vgeb3bfJcLwYRMtjJYha8lfyeYE348XPr+2jBW1sIIr6nwdkYXqcPGXqw5ChZjSKCmtNZHmFTQ3ChRWc2q2L/cBuqFAYjiCRwAs5YGOlEZgPLlFYC0eAFO30YY0plocYGmCTs0aza2gothFLgdbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PSROWmdI; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PSROWmdI"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7375e2642b4so1543540b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745014384; x=1745619184; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3az9duQD4SoXSFpkKw6AxoXhKZsRVTLRACFG0KE1Wlc=;
        b=PSROWmdIa7vPOJTrXTI1W3OiBMySpMUnVS1YH1or+2fOtX5ZNO4YldOmrGGwcY0AI0
         aXNO1qKAmFFzxXPWWtUIvB43KwcNdfgf1pXRQqUaPLYxcbY8yJ4cLZJgYBb1qiOjojeo
         jVcMDegGO643Jtnqdf2N5aT875j9w+M9eV67zIfwUsQKT79902iJj1vboThJ+/r/l4Yx
         BG061Tf2HPvGnbb/prt785C4NYmtnWix/yMgEKFoHkM7Vw2DNDMhnaYHmGpTIdDVb5of
         j+KYPilCkYyblBDtbS3JnOExSTKxbpox9jSeM17Smn+coWA6Ej2Yqb6RFjpPaFzvpCO/
         6nMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745014384; x=1745619184;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3az9duQD4SoXSFpkKw6AxoXhKZsRVTLRACFG0KE1Wlc=;
        b=jE6lC/cNcPmRffHU+6Tc+Qm5W9TgsrpzQtgn5oPMtBSQOg7zhV7p4SwL37TNVd5t+J
         wNMjsnhgpULDRSYjZH2J/c/iXNKUyoo9jQcBG0rrAh9WTpwsqQrYt8rhQuD6OWx4jDwo
         4fGCxNY09TowqeLVodqTRFB+7U0/ijFGvQIVgTgHxBgH4byH/jH3zjeFxsH+ued1Lkwm
         1QJmg5aLYlF8hkKlbJk+0hiWYxc5GkpY0mHYGJIt6RGoDI5HeDgOBFNJnB8YGn2tdnWX
         EmsteYuY0TrTtK6eee2Din+ykdyIfHmHuUXTfZ85FYf9BjrtU4E7zM8fiLIOAUwh0nEK
         91Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ8rWtQnafJs9vYtB6pOXWM4DZgAyrajb8FMPnMPDxogQSSJzzyn8Obqhm/NNpIdN2vA2na4+zB+88vTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGCahV1Nd64LTBrMOtUyZAuLzi2Gq6fyEf3G5/hBiHewZ3BHXc
	bPNV2Q7Wxbdp29k0FGSqjw24m2M8P1fHepMZo5QhMAI5UUosANEDTNyD5CkZdiWkA9Q2VmeNXVX
	HdwGFodtQteYzTmT2Tn8lmw==
X-Google-Smtp-Source: AGHT+IG4xLR4Go44keFo94aEtdtI/SjU6ph+hUQLL+hTOgGcr7s91IwoXVMEfwjbG57hwdEPTAMppEXJYrzLVk7ovg==
X-Received: from pgie8.prod.google.com ([2002:a63:ee08:0:b0:b0e:1d1:49c9])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3a92:b0:1fd:f56f:1cbe with SMTP id adf61e73a8af0-203cbc53800mr6359235637.13.1745014383952;
 Fri, 18 Apr 2025 15:13:03 -0700 (PDT)
Date: Fri, 18 Apr 2025 22:12:52 +0000
In-Reply-To: <20250418221254.112433-1-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250418221254.112433-1-hramamurthy@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250418221254.112433-5-hramamurthy@google.com>
Subject: [PATCH net-next 4/6] gve: Add rx hardware timestamp expansion
From: Harshitha Ramamurthy <hramamurthy@google.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, jeroendb@google.com, hramamurthy@google.com, 
	andrew+netdev@lunn.ch, willemb@google.com, ziweixiao@google.com, 
	pkaligineedi@google.com, yyd@google.com, joshwash@google.com, 
	shailend@google.com, linux@treblig.org, thostet@google.com, 
	jfraker@google.com, horms@kernel.org, linux-kernel@vger.kernel.org
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

Co-developed-by: Ziwei Xiao <ziweixiao@google.com>
Signed-off-by: Ziwei Xiao <ziweixiao@google.com>
Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: John Fraker <jfraker@google.com>
Signed-off-by: Harshitha Ramamurthy <hramamurthy@google.com>
---
 drivers/net/ethernet/google/gve/gve_rx_dqo.c | 23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/net/ethernet/google/gve/gve_rx_dqo.c b/drivers/net/ethernet/google/gve/gve_rx_dqo.c
index dcb0545baa50..483d188d33ab 100644
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
+	s64 last_read = rx->gve->last_sync_nic_counter;
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
2.49.0.805.g082f7c87e0-goog

