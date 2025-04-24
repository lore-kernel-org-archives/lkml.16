Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78B12957A3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504072; cv=none; b=Y4M8Z7s7Xz/SiHLq8UIjPOPbQ1ITyeO9YShArz3jzI2ScqccqjzwRIF+jAPfSTxp/NIp5wFfPrIEj65bA549DKDQUW05Ni9t8ga2Imk2q3V5ML4usFXXGxqj8fprstDT0/NhXNGp6X/0kJCw8oPR39aK6zfMnYoH7e0Vk4ynp1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504072; c=relaxed/simple;
	bh=D+WfMC8Jh2PxaUkmB3v59ZfRR9QkXj4ch9yqlrdrhtI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AmnW3dnks/kylES9roW6zWhouAfuIv8iva8xUexVRJIZOo8Msy8wOlnAG2tpmBgtr6FxhhjoCNkEdSkax69rUCHPG0csS6bf3xZjk1h0ShWjt0ZOVNo63z5sUxFKfvlRVuaP7sLdBRyhDJhn8Cr2UeQ7gXnEP1x9HHY0IGXveyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cu5ALZQi; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cu5ALZQi"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso7531735e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504068; x=1746108868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oa6gfxRAjkR7wfTiIJFT8jbfGXVVwGTh4OuP6vCgukQ=;
        b=cu5ALZQiIvlO6N17My54QqYBjdiqAlejII9I8zQrhp2pVmzqF+hSfAfcV/5EziFzLU
         HmeTtCwOQjWkkrPhOQMNCO82OS8I6W+dXyRNbCFcrb0mNF7klQL+wk3qmhDVWZ9nKJxD
         cECOGDSYt8P9TYQ0I5tS4Vh7MWWCPiG2tjUwfDYm8YmczxC1zKKXNFsfvanK/KPrvSnE
         hbEuun554g2wES6pGRLaz5MU1gdlj8xo69Pa6LH9iGHhqQir7aSxe/vOHN1G1c7DhIzv
         3+N4PlbC2aobhj+JT5f8pjOv7GHH4FkWZ5UcApKcq5rjRT/mUl1qL8Bmtb+XHj2aB8Vy
         nHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504068; x=1746108868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oa6gfxRAjkR7wfTiIJFT8jbfGXVVwGTh4OuP6vCgukQ=;
        b=LULfIMqwhJvEKqcx3YxoFAELNr8bCNA1IrEIXGKXV9oy+zHbmtKguidgzFmmel6GF8
         q5bWEH7nzuBeyyxPK6CiXNmAeZQLOUAXJD0+7GPmuPf8L/VHYo+9WL/nu8MdAdWlklUh
         RFemyxLgIcyXeIUZQ10iEA6Onv7TcJEYxqS4mTVNufhd+FWMiOmf+jn1Pt6uE9y7JmxB
         sNkLvYAHOUj20hxNDe2sDzCAhFDpLipMChZSiXTFt5ZkAhgq7+E/Q7NOPtZ8jCESPGGH
         tYI7lq5p5HDuL4a6IHTKmmVvtAJNPTBy83QwUtnnkPr/D5A4xE66KId6XzzFiZP/EC/d
         UwmQ==
X-Gm-Message-State: AOJu0Yyo2WHpF5bn3TqbFjmxP2hTQsjiQr2p3qkbhLv/WtKmRG04X1Lh
	F8/iPoY5STQdHxI/t7jV7x98++Vfl0AeBQFEGWBMgxsPas8wP8y4omwjP/gSUJri61VtJ8TZMDs
	B
X-Gm-Gg: ASbGncse2nvBJ9kFdEgowMFvWup8jt4ypDWWATd6b0KXixjSDvqHsOP4jjBWs+zO+s3
	u8syYfZgNikqUebWVJGa6O4r4e5jb7h3ktok7MF0/cAykTCiPzQF/G9zOt57ofRNQOGC0SpVr4X
	ZOOHMrxrJLwjTCsWCLN+rakxLzZEPPUfEayvJAWSZAtPR0UDyj9P+eWHBybQ4Ju9SXdyh2f0Upz
	1ZM/nHbpWejkHsWylaARHV40DHbAdEU9YHhvqOoCRmVdaedMCU6zjUxzvUJSKKWg5LugQklGdwJ
	4dNfLoxAJ/YeSEhHFAYx/D4I2yjZ/FM5Gftd9lKOuinf+xYX3nvSgyafz4sOtJ6YOdNhACTUuiv
	jv1frexuJmHTsXWQr
X-Google-Smtp-Source: AGHT+IERVpNU2DILo0bvt8R4DAynThAP/fjqterv2/ng44U7A/g/KpyVK5SJtSkw42xdSMDhah0Vrw==
X-Received: by 2002:a05:6000:1acb:b0:391:2f15:c1f4 with SMTP id ffacd0b85a97d-3a06cfad64amr2138772f8f.55.1745504067786;
        Thu, 24 Apr 2025 07:14:27 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:27 -0700 (PDT)
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
	Alex Elder <elder@linaro.org>
Subject: [RFC PATCH 32/34] gunyah: Add hypercalls for sending doorbell
Date: Thu, 24 Apr 2025 15:13:39 +0100
Message-Id: <20250424141341.841734-33-karim.manaouil@linaro.org>
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

Gunyah doorbells allow a virtual machine to signal another using
interrupts. Add the hypercalls needed to assert the interrupt.

Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/gunyah/gunyah_hypercall.c | 38 ++++++++++++++++++++++++++++
 include/linux/gunyah.h               |  5 ++++
 2 files changed, 43 insertions(+)

diff --git a/arch/arm64/gunyah/gunyah_hypercall.c b/arch/arm64/gunyah/gunyah_hypercall.c
index 38403dc28c66..3c2672d683ae 100644
--- a/arch/arm64/gunyah/gunyah_hypercall.c
+++ b/arch/arm64/gunyah/gunyah_hypercall.c
@@ -37,6 +37,8 @@ EXPORT_SYMBOL_GPL(arch_is_gunyah_guest);
 
 /* clang-format off */
 #define GUNYAH_HYPERCALL_HYP_IDENTIFY		GUNYAH_HYPERCALL(0x8000)
+#define GUNYAH_HYPERCALL_BELL_SEND		GUNYAH_HYPERCALL(0x8012)
+#define GUNYAH_HYPERCALL_BELL_SET_MASK		GUNYAH_HYPERCALL(0x8015)
 #define GUNYAH_HYPERCALL_MSGQ_SEND		GUNYAH_HYPERCALL(0x801B)
 #define GUNYAH_HYPERCALL_MSGQ_RECV		GUNYAH_HYPERCALL(0x801C)
 #define GUNYAH_HYPERCALL_ADDRSPACE_MAP		GUNYAH_HYPERCALL(0x802B)
@@ -64,6 +66,42 @@ void gunyah_hypercall_hyp_identify(
 }
 EXPORT_SYMBOL_GPL(gunyah_hypercall_hyp_identify);
 
+/**
+ * gunyah_hypercall_bell_send() - Assert a gunyah doorbell
+ * @capid: capability ID of the doorbell
+ * @new_flags: bits to set on the doorbell
+ * @old_flags: Filled with the bits set before the send call if return value is GUNYAH_ERROR_OK
+ */
+enum gunyah_error gunyah_hypercall_bell_send(u64 capid, u64 new_flags, u64 *old_flags)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_hvc(GUNYAH_HYPERCALL_BELL_SEND, capid, new_flags, 0, &res);
+
+	if (res.a0 == GUNYAH_ERROR_OK && old_flags)
+		*old_flags = res.a1;
+
+	return res.a0;
+}
+EXPORT_SYMBOL_GPL(gunyah_hypercall_bell_send);
+
+/**
+ * gunyah_hypercall_bell_set_mask() - Set masks on a Gunyah doorbell
+ * @capid: capability ID of the doorbell
+ * @enable_mask: which bits trigger the receiver interrupt
+ * @ack_mask: which bits are automatically acknowledged when the receiver
+ *            interrupt is ack'd
+ */
+enum gunyah_error gunyah_hypercall_bell_set_mask(u64 capid, u64 enable_mask, u64 ack_mask)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_hvc(GUNYAH_HYPERCALL_BELL_SET_MASK, capid, enable_mask, ack_mask, 0, &res);
+
+	return res.a0;
+}
+EXPORT_SYMBOL_GPL(gunyah_hypercall_bell_set_mask);
+
 /**
  * gunyah_hypercall_msgq_send() - Send a buffer on a message queue
  * @capid: capability ID of the message queue to add message
diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
index 72aafc813664..26fdfa3174da 100644
--- a/include/linux/gunyah.h
+++ b/include/linux/gunyah.h
@@ -329,6 +329,11 @@ gunyah_api_version(const struct gunyah_hypercall_hyp_identify_resp *gunyah_api)
 void gunyah_hypercall_hyp_identify(
 	struct gunyah_hypercall_hyp_identify_resp *hyp_identity);
 
+enum gunyah_error gunyah_hypercall_bell_send(u64 capid, u64 new_flags,
+					     u64 *old_flags);
+enum gunyah_error gunyah_hypercall_bell_set_mask(u64 capid, u64 enable_mask,
+						 u64 ack_mask);
+
 /* Immediately raise RX vIRQ on receiver VM */
 #define GUNYAH_HYPERCALL_MSGQ_TX_FLAGS_PUSH BIT(0)
 
-- 
2.39.5

