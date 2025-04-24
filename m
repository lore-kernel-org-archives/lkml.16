Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA34288C94
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504046; cv=none; b=gvDDI2We2MuS7ZNDDFfU/rVf1YnEBgyf8eWHV30dD/tfbLlEpuHCFAuiE+enSdc5HXau/h9vStTit2yfhgY4GENmAAqbTIk/L+G2xGMawi2jFGm7ggHl6SMjVV9o5h/80yAAgTvkXCdBmmADP5t066iLEuy5Pcb9lbvdKAuVspM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504046; c=relaxed/simple;
	bh=cRJdZ/BvpG7Nf2HfvkjONlA6iN6G9YZT/kvCa6h8Pqk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T6yRULJQ7TsQxXKV6ODxkoEUp0ixzfs63rgB6a/X7MlfGgtbZU4Ct+to6vH+2EEFkCWmJ/0N6mYXDoFdgYafYphtbcYUdPcSZDFyt1M+wrmXQNMXIJzP/42gTkCmWjapVPnHEv1Er0Q4shmV+Yc7qW5ZSMHlIJ7pjDRpTbRhmbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aAsLp2wi; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aAsLp2wi"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso6357635e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504042; x=1746108842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iugp3VZMso7R61paVQ20sor9LWthQ+vE2iyUDGP7wsk=;
        b=aAsLp2wiL4SnGGfuvk26Iktqh4BJnxFfKcsSxvjPEagGx7fi/GliYmXzZdgxm3FCgY
         R/qwu/efZXZX7uKjiHZUoXchN/W/kcp5mMR2C5anR2hcIJ3vbCm0XaoUacmQvPV2g4gC
         HvHEBkPZop2ckBPqpxuors2ZNP2+rwt8rpotniV0U9YiCzMm2V0lXTsv1bEPFgXatILl
         U/awvhfv2MzQmr0N5FntwhNSvD/lPVBu2z7/NmOrnMklRKIOceLIopPA4Y1gRvEZFHOD
         9Kr+mQE/POTKy/7qng9AwhhvaG/MFOECRAnsoxCXf/aZag79pLOhLgzi7sjdzUZ9WG4K
         /FNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504042; x=1746108842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iugp3VZMso7R61paVQ20sor9LWthQ+vE2iyUDGP7wsk=;
        b=q+w+kVfFwKv28NBN0gyB2iZhcWjx08UB+ZxcWsFx95t0g/YRbArpIUUBPs63LoxurE
         VM2t9fzXkwouC5VgG9zwqDcoWE6Fb/h1zgoF+Vxajoaw7/M9sTRseCZdOzxQL+hBJWQ5
         QjznTDQXzolMoRAOfx4qt2bI3C+7qt+II3nROYwayGSimf2d956wzJ4/NzuP9o1gshDN
         vu8jUdvL0szUD4wyRZJvufWuiTJbtvnIpzLN6TQ//lGAtw/5NiPEDhl9qs93bOhu6l+H
         Y8quChXGrwpPVAJ5ZqigiQ/dkmRXbocTT1ORzSaX4fDiZFElfrvM/2l04yoUcl7NDMII
         2yxw==
X-Gm-Message-State: AOJu0Yz/6Ljr1EWleJ3Gi7jtHyPY2+X2POsXN//zf2sFCpL9ufgeWVpv
	UnTXDn2rINPeyeUgqv99d+3iHswqJJ/YH3H2JklifS77aArqqhSVcfdOVGSVgHD07/Lu++ph4d9
	x
X-Gm-Gg: ASbGncvLsMeb0z4oKgepzrUlHIW1lxxPhIIW7mPhTTR74CM5g8lNNlv6KEoWAsdtm+u
	r8a6otn4XXdLBCExqpLIIz5g02sRoveTbfiuWAPCFKiVkegNw2oiNdtmEUC/qCJokPe2treI7nv
	4fbA7jqfymZ18kOJdJzvwx1YHz3eQrexTzcypnmFaYIcwBdkq/bMGZti+ZmzoNV+SYD2NjORN69
	93kVUC6uKIeJlaKh5SP0mzLbMtyZVA/qFQM4NId0uQBCGQKHPhTJvFu+tYxq/LKzuwIqp3mIqaR
	dYvH8cQaRpmCghjzy21yxFtdDZQDDc/T6/n11KH9/80zsRkdjkO6SVAY7pypVRVPDCPNVg7uxII
	q5wqvL+Mlk5L90xY+
X-Google-Smtp-Source: AGHT+IFb5JrKaNG2KfYhmzfwfaDb/IjykBP33KVSW9og9BEhgmgsW+e69hlvAOQj6I5jNodxA+AwfQ==
X-Received: by 2002:a05:600c:c092:b0:43c:e2dd:98ea with SMTP id 5b1f17b1804b1-4409c3b1e1amr23970305e9.22.1745504042259;
        Thu, 24 Apr 2025 07:14:02 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:01 -0700 (PDT)
From: Karim Manaouil <karim.manaouil@linaro.org>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Karim Manaouil <karim.manaouil@linaro.org>,
	Alexander Graf <graf@amazon.com>,
	Alex Elder <elder@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Quentin Perret <qperret@google.com>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Haripranesh S <haripran@qti.qualcomm.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Murali Nalajala <mnalajal@quicinc.com>,
	Sreenivasulu Chalamcharla <sreeniva@qti.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Alex Elder <elder@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RFC PATCH 13/34] gunyah: Add hypercalls to send and receive messages
Date: Thu, 24 Apr 2025 15:13:20 +0100
Message-Id: <20250424141341.841734-14-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Elliot Berman <quic_eberman@quicinc.com>

Add hypercalls to send and receive messages on a Gunyah message queue.

Reviewed-by: Alex Elder <elder@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/gunyah/gunyah_hypercall.c | 55 ++++++++++++++++++++++++++++
 include/linux/gunyah.h               |  8 ++++
 2 files changed, 63 insertions(+)

diff --git a/arch/arm64/gunyah/gunyah_hypercall.c b/arch/arm64/gunyah/gunyah_hypercall.c
index d44663334f38..1302e128be6e 100644
--- a/arch/arm64/gunyah/gunyah_hypercall.c
+++ b/arch/arm64/gunyah/gunyah_hypercall.c
@@ -37,6 +37,8 @@ EXPORT_SYMBOL_GPL(arch_is_gunyah_guest);
 
 /* clang-format off */
 #define GUNYAH_HYPERCALL_HYP_IDENTIFY		GUNYAH_HYPERCALL(0x8000)
+#define GUNYAH_HYPERCALL_MSGQ_SEND		GUNYAH_HYPERCALL(0x801B)
+#define GUNYAH_HYPERCALL_MSGQ_RECV		GUNYAH_HYPERCALL(0x801C)
 /* clang-format on */
 
 /**
@@ -58,5 +60,58 @@ void gunyah_hypercall_hyp_identify(
 }
 EXPORT_SYMBOL_GPL(gunyah_hypercall_hyp_identify);
 
+/**
+ * gunyah_hypercall_msgq_send() - Send a buffer on a message queue
+ * @capid: capability ID of the message queue to add message
+ * @size: Size of @buff
+ * @buff: Address of buffer to send
+ * @tx_flags: See GUNYAH_HYPERCALL_MSGQ_TX_FLAGS_*
+ * @ready: If the send was successful, ready is filled with true if more
+ *         messages can be sent on the queue. If false, then the tx IRQ will
+ *         be raised in future when send can succeed.
+ */
+enum gunyah_error gunyah_hypercall_msgq_send(u64 capid, size_t size, void *buff,
+					     u64 tx_flags, bool *ready)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_hvc(GUNYAH_HYPERCALL_MSGQ_SEND, capid, size,
+			  (uintptr_t)buff, tx_flags, 0, &res);
+
+	if (res.a0 == GUNYAH_ERROR_OK)
+		*ready = !!res.a1;
+
+	return res.a0;
+}
+EXPORT_SYMBOL_GPL(gunyah_hypercall_msgq_send);
+
+/**
+ * gunyah_hypercall_msgq_recv() - Send a buffer on a message queue
+ * @capid: capability ID of the message queue to add message
+ * @buff: Address of buffer to copy received data into
+ * @size: Size of @buff
+ * @recv_size: If the receive was successful, recv_size is filled with the
+ *             size of data received. Will be <= size.
+ * @ready: If the receive was successful, ready is filled with true if more
+ *         messages are ready to be received on the queue. If false, then the
+ *         rx IRQ will be raised in future when recv can succeed.
+ */
+enum gunyah_error gunyah_hypercall_msgq_recv(u64 capid, void *buff, size_t size,
+					     size_t *recv_size, bool *ready)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_hvc(GUNYAH_HYPERCALL_MSGQ_RECV, capid, (uintptr_t)buff,
+			  size, 0, &res);
+
+	if (res.a0 == GUNYAH_ERROR_OK) {
+		*recv_size = res.a1;
+		*ready = !!res.a2;
+	}
+
+	return res.a0;
+}
+EXPORT_SYMBOL_GPL(gunyah_hypercall_msgq_recv);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Gunyah Hypervisor Hypercalls");
diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
index 33bcbd22d39f..acd70f982425 100644
--- a/include/linux/gunyah.h
+++ b/include/linux/gunyah.h
@@ -141,4 +141,12 @@ gunyah_api_version(const struct gunyah_hypercall_hyp_identify_resp *gunyah_api)
 void gunyah_hypercall_hyp_identify(
 	struct gunyah_hypercall_hyp_identify_resp *hyp_identity);
 
+/* Immediately raise RX vIRQ on receiver VM */
+#define GUNYAH_HYPERCALL_MSGQ_TX_FLAGS_PUSH BIT(0)
+
+enum gunyah_error gunyah_hypercall_msgq_send(u64 capid, size_t size, void *buff,
+					     u64 tx_flags, bool *ready);
+enum gunyah_error gunyah_hypercall_msgq_recv(u64 capid, void *buff, size_t size,
+					     size_t *recv_size, bool *ready);
+
 #endif
-- 
2.39.5

