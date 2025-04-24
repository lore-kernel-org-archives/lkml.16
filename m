Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CD52820D8
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504043; cv=none; b=MdMd6QtGjicLQHqYXJh/pNNGzisC8azVNvt1+x9dgmFvPD/IDItxDuyuH1wq2vHlWaGv6ipBzitym6oNlLd8TPbGUVM/eJz72HmR/ooOgYRjmH6U1rLh+v1lj+OIO+9eR/tCUlbF4upqWB4fBIY1JeDqVF02t+ySHpqf9Os/mvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504043; c=relaxed/simple;
	bh=zpH5RWwn66pK/eMc3LSMNEkV/3yaevWoUA1/kvmrIcs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PdJP7R7IFpp77lSWIdYhnPZ+Z7HnsTfQisAHI44nIxOTzRM5ej2ryKAGXRgH2Q3BGFk3h2FpAZiJSC01BJ6aLd2pIUC7C9Z2VmC2enyzX/U/FHbvFpXvo75zQNKxJnsuRyT+o+mK2SgxkEaA+45hsqj85HcsbAv+mgWw2iAxfck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j9+iKa4W; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j9+iKa4W"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso1250939f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504038; x=1746108838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RusfJk/Wwgs+hfa3WlHRZBdqt7Zg7qYVP8LFIn+weQg=;
        b=j9+iKa4WCT/mz4U6jOuEjxqBAIM17fNBuPra7vwuEWL0QXoKe6DkDeChGdfSfN2jqZ
         uCaRbiExMKGx6vkJmOf6uDYYMezLzUdvO3PzNablg6nTHG7sKC5ygO7dxRWP12DQb/Lo
         ncNWWVX00LNc9y6vT9WTBjPdHkjhCEe1ppVdr+2tyhjPTJf7tIR0lHWwMgINoRHhtrzz
         KBZh7idT029V7GaVEdLIlUlagIvjMV72pL5JYshgff1oMFthqajbTK4j6rmb1Xy/vP62
         O6qovaWNGZ14gRNMMC0hn7jK7GW9RnF132Bax0dN4BK/6ziNhLy/woVUD4piL85of4bM
         P50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504038; x=1746108838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RusfJk/Wwgs+hfa3WlHRZBdqt7Zg7qYVP8LFIn+weQg=;
        b=v6p+HV8AgzuXeHcYRY90rMqtbxJMC2w8x2OesOCLaM4VxZBNhVDBEbwakg/IQtSFQN
         0c41evVfVdAPgS79HFlotDKaYFc+SfkuNl4iy7bs3qegS2hgrNMHMsLtWA9D4FmvrQgp
         MEIfmossjhbfECpvQJF9XGmvyT1e7guT/7RmZahP9ii6lC5/sJcZxL3Pr2UUFLQExJa/
         Dfx18P3228X2jhS7RYMctIL7eWUevjCEiIRMDhKDW7FDlm391LCmgPjsH/W47rJrNcbt
         ZRudV5tsh3yljMurdiawtJVUL+8MhuFb9X7R0aAVROq4Zt3kk4YtoT4ngyMamQdoTANm
         59RQ==
X-Gm-Message-State: AOJu0YzVbywbo95DjqPd0LSKM5F9+fXkOHhrLlrL7heuusI6B3VnzHV2
	DNDIlhXY7Ifv7N1lz0xZXMtLeyXqahqsbiBG2GZCNnGqGR1YRlJroMsrEpqN2gjwkHpJQJ6cKZN
	SjvQ=
X-Gm-Gg: ASbGncvrk6f5V+FgqW7we4BC6q9/7aMG6hqtaCspgo9Wr1XBppi19G+ycQTHPMtCrwH
	38C29mYiu9D7UbE3r2M9If9tgq99aZILFeRCcIIeSFbVw6RzXheOzWR6nmwMFKI7Th98RF38bg3
	rUyU086MkdswAuJO0IEmkYQQiM+0UjNUP8LEQiTxwPXAMqvLth9/jLxBx3BW02l//C6eWylU+4c
	/jn6VZY8+lsZ17fPoxB2h7AQnE9EUwHM/hc7A6YetvspCf9j1MIExlAc60NhEr/zPbrCTvsTk9S
	JPdeQB0Z4dL3mnGT+cv+ZvMRJ0kLVTTqfn4DcjFn6ErOtKtmXOEiVU1kAJ0iObKsVX08+76LECT
	wsut1a+p7YaA/9ccCJbjYAtyCYZ0=
X-Google-Smtp-Source: AGHT+IFmkqrLYBA6pxT3bgHP40xSeHaZYwIrDUExxYU5PjMxiNNE1p1s+eiHaAutjdes9ZQldE7V0g==
X-Received: by 2002:a05:6000:188d:b0:39e:dbee:f644 with SMTP id ffacd0b85a97d-3a06cfa5a93mr2715557f8f.46.1745504038249;
        Thu, 24 Apr 2025 07:13:58 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:13:57 -0700 (PDT)
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
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Alex Elder <elder@linaro.org>
Subject: [RFC PATCH 10/34] gunyah: Common types and error codes for Gunyah hypercalls
Date: Thu, 24 Apr 2025 15:13:17 +0100
Message-Id: <20250424141341.841734-11-karim.manaouil@linaro.org>
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

Add architecture-independent standard error codes, types, and macros for
Gunyah hypercalls.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 include/linux/gunyah.h | 106 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 include/linux/gunyah.h

diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
new file mode 100644
index 000000000000..1eab631a49b6
--- /dev/null
+++ b/include/linux/gunyah.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _LINUX_GUNYAH_H
+#define _LINUX_GUNYAH_H
+
+#include <linux/errno.h>
+#include <linux/interrupt.h>
+#include <linux/limits.h>
+
+/* Matches resource manager's resource types for VM_GET_HYP_RESOURCES RPC */
+enum gunyah_resource_type {
+	/* clang-format off */
+	GUNYAH_RESOURCE_TYPE_BELL_TX	= 0,
+	GUNYAH_RESOURCE_TYPE_BELL_RX	= 1,
+	GUNYAH_RESOURCE_TYPE_MSGQ_TX	= 2,
+	GUNYAH_RESOURCE_TYPE_MSGQ_RX	= 3,
+	GUNYAH_RESOURCE_TYPE_VCPU	= 4,
+	GUNYAH_RESOURCE_TYPE_MEM_EXTENT	= 9,
+	GUNYAH_RESOURCE_TYPE_ADDR_SPACE	= 10,
+	/* clang-format on */
+};
+
+struct gunyah_resource {
+	enum gunyah_resource_type type;
+	u64 capid;
+	unsigned int irq;
+};
+
+/******************************************************************************/
+/* Common arch-independent definitions for Gunyah hypercalls                  */
+#define GUNYAH_CAPID_INVAL U64_MAX
+#define GUNYAH_VMID_ROOT_VM 0xff
+
+enum gunyah_error {
+	/* clang-format off */
+	GUNYAH_ERROR_OK				= 0,
+	GUNYAH_ERROR_UNIMPLEMENTED		= -1,
+	GUNYAH_ERROR_RETRY			= -2,
+
+	GUNYAH_ERROR_ARG_INVAL			= 1,
+	GUNYAH_ERROR_ARG_SIZE			= 2,
+	GUNYAH_ERROR_ARG_ALIGN			= 3,
+
+	GUNYAH_ERROR_NOMEM			= 10,
+
+	GUNYAH_ERROR_ADDR_OVFL			= 20,
+	GUNYAH_ERROR_ADDR_UNFL			= 21,
+	GUNYAH_ERROR_ADDR_INVAL			= 22,
+
+	GUNYAH_ERROR_DENIED			= 30,
+	GUNYAH_ERROR_BUSY			= 31,
+	GUNYAH_ERROR_IDLE			= 32,
+
+	GUNYAH_ERROR_IRQ_BOUND			= 40,
+	GUNYAH_ERROR_IRQ_UNBOUND		= 41,
+
+	GUNYAH_ERROR_CSPACE_CAP_NULL		= 50,
+	GUNYAH_ERROR_CSPACE_CAP_REVOKED		= 51,
+	GUNYAH_ERROR_CSPACE_WRONG_OBJ_TYPE	= 52,
+	GUNYAH_ERROR_CSPACE_INSUF_RIGHTS	= 53,
+	GUNYAH_ERROR_CSPACE_FULL		= 54,
+
+	GUNYAH_ERROR_MSGQUEUE_EMPTY		= 60,
+	GUNYAH_ERROR_MSGQUEUE_FULL		= 61,
+	/* clang-format on */
+};
+
+/**
+ * gunyah_error_remap() - Remap Gunyah hypervisor errors into a Linux error code
+ * @gunyah_error: Gunyah hypercall return value
+ */
+static inline int gunyah_error_remap(enum gunyah_error gunyah_error)
+{
+	switch (gunyah_error) {
+	case GUNYAH_ERROR_OK:
+		return 0;
+	case GUNYAH_ERROR_NOMEM:
+		return -ENOMEM;
+	case GUNYAH_ERROR_DENIED:
+	case GUNYAH_ERROR_CSPACE_CAP_NULL:
+	case GUNYAH_ERROR_CSPACE_CAP_REVOKED:
+	case GUNYAH_ERROR_CSPACE_WRONG_OBJ_TYPE:
+	case GUNYAH_ERROR_CSPACE_INSUF_RIGHTS:
+		return -EACCES;
+	case GUNYAH_ERROR_CSPACE_FULL:
+	case GUNYAH_ERROR_BUSY:
+	case GUNYAH_ERROR_IDLE:
+		return -EBUSY;
+	case GUNYAH_ERROR_IRQ_BOUND:
+	case GUNYAH_ERROR_IRQ_UNBOUND:
+	case GUNYAH_ERROR_MSGQUEUE_FULL:
+	case GUNYAH_ERROR_MSGQUEUE_EMPTY:
+		return -EIO;
+	case GUNYAH_ERROR_UNIMPLEMENTED:
+		return -EOPNOTSUPP;
+	case GUNYAH_ERROR_RETRY:
+		return -EAGAIN;
+	default:
+		return -EINVAL;
+	}
+}
+
+#endif
-- 
2.39.5

