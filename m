Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9881226B0BC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744281447; cv=none; b=YxzCioWQEp1zViqHutNoWFk01Ez/F7wKG58h8t3v1F4ICasM20QIp44fem0JaZzV3+lpbK7EnTiNLCn65BGSL7Loz5N+cAeZs29IbOpQflFeJFLADL8GQCWGY4NWSehy4mjUu3rJoQDkXR+lRFIgAL118BpCKS7cduJg3LzFH2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744281447; c=relaxed/simple;
	bh=g82gY1xhxcNU1gWfdeY5y//QX6zBB8SepcGIdHSH0QM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WBkuCGU2DZUABz50Dyj/dp9SJ4P9l695uPSaEKiF7S8SQjmC9KrnhirJ6m9kUDnmuOJD5OIluPye5i1VVd2O3SzjawTlmByxCqUzmBFaFse/B10CU3epk/nSlw5XWIZd6HiD6egJzzTC/V6EuFPvjX/1dB0shr2Yqm5S/dwLVBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gnqMRPJZ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gnqMRPJZ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c1efc4577so315603f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744281444; x=1744886244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Nnbd5v6TVKVB045KCik5mojpozdPs3L2r4qsLSnC+U=;
        b=gnqMRPJZo5aP7o1vHEGfuK3h1pKekorBctl3L/20jw5ufFR2kDHg9CL77aSlk8btZw
         b1LLvj2qG+E6z6UCKjvhxuosRqEWrU/Da/S5l9uNaG/YDMCxAS5KeBx9np1OacMzN0/z
         ohYwwktv2wLlUT1/glp3j9pQTNlXqBXlpOnNwsbtzMk+veCXv+IxHoJb+CNP7FBu3f6/
         +9qpsYJMVDJgAhtjlO7VgPPCqZ6tYZbFksLZQrhXuDorsctfwaQ/suycI5+MZKtPVsKS
         vWL0UIC4Em54EyL+Sk6rA5388WFyNuPSu6p3CqtvrzoqRDICwRMdTE4dcTimLLgKrsLe
         8pmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744281444; x=1744886244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Nnbd5v6TVKVB045KCik5mojpozdPs3L2r4qsLSnC+U=;
        b=ZAakGKRs1IwGqfEs1OViV4jheMbmM13l0EjI//CCQU/up82QUYD9OjPhTNYOTNEgTn
         92GWgyM44IkCmePtyK4qnkNvDmDtZAB98D5/nS3E1UQDIFCzG/pM3FdzBNylHzJDBbps
         Ptijcp+G70t7+97oyTH4mf7+s7T1jTX71MR/C8DcCwhGmc652/gpD2TmROxbJu2Pn6b4
         tEy7vd1eqC5vuENPCcwhg5b0QP1o/182FKVCaZFbFpZzGaKI0Jxo0v0cZiOLddZBQF6y
         UYaT/gLN3w7J+JXYGofEtgBMMD8bRzk7/kMukrsuBu+M2TM9F+y6rl0bnfGZZjFfLcZz
         i6IA==
X-Forwarded-Encrypted: i=1; AJvYcCX0WUsdjBBwUCEFM56fcC19MJJA7LdUMqQ4q21ng/g4Nfv4t7MDrA0C/tsK8bQaNT/8iL0Mh5awG1L6xoA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy45Jh96XIrScmxPPRe8W3kcABLSadF+zx5EXEr8gdsjKbtrOo5
	fIffetwPS05ZtID8pq4ghdoLzrQdC2stzUyiHpnDRGeYV3gwrU8aYD0a4twIxBw=
X-Gm-Gg: ASbGncsAUuiqWDiyp4uvvtbN9RUsLPaLOgm2MiyhY4NPhvF9r5Zl47QjTbbe5nk269v
	OXpjzGVZ+4Bi5mvG+1WPZ3PWIixkXSw41xsuqDWXRHbfluNk3RQO+CfjVXQxmkpzd9WUvTKV/Ig
	K8WdKCOAQLkoy8Lrvk5dmFKFAZUY8tcO7ljShAoMmqw/S2KyfmspgTL5mzVV4Woxd4Yf+Xajp1/
	TWr3bYvOjHSVtw/qrFlN4AKoXJwIG9Ye7qGh0Gj2Ze/vg1428QwPL16slrKnlAtcObdCs8uBTCZ
	agcS3JSlE0DbU7/5A1pIGg8eptW3YyPhIWQwP3N3PTfNozFa2oBrMsLbcItcU3OmMw==
X-Google-Smtp-Source: AGHT+IEHtath/9fjeA3GlI+26reTGsqkfkI9JQfy2xnJmqeyhEm1jWIGOX2/OQqJlhE3Dk/VrZDbzw==
X-Received: by 2002:a05:6000:4383:b0:391:3157:7717 with SMTP id ffacd0b85a97d-39d8f491bcfmr1794974f8f.34.1744281443890;
        Thu, 10 Apr 2025 03:37:23 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893612dbsm4309388f8f.1.2025.04.10.03.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:37:22 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	srini@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/2] MAINTAINERS: use kernel.org alias
Date: Thu, 10 Apr 2025 11:37:12 +0100
Message-Id: <20250410103713.24875-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250410103713.24875-1-srinivas.kandagatla@linaro.org>
References: <20250410103713.24875-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1711; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=X081G5b8ZJlECnTTMUpLb1rMWL1BAhU9ovFKI7eRRN4=; b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBn959YJ14iAJU7//C7aknncCha6Mtq08dvOrWyn /HNnuNGqKqJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZ/efWAAKCRB6of1ZxzRV N3txB/9AnD2EaTyqWg9hTGWre3HhXjm+e4ArOy4+kihuI5qZt/0DIFRwwhMl5TagJHghVSfRqDI fgFMaFEx/F3yTAb+6B7jGn9MWe0GMteRQL/MysODm5+PBjeuYckxpEUsO9hcaI60xzkXcVzUGye a4vxJ0ozhUaROwiAPId3n2aPFUfHG/ko8X5KCSLrFCF5QRBOy3A1apUomNvdN4MhMoNTY2QRpWO hUih2OClr3o2uTC2eYmSNAw/FhE3tk2WpA3g53iMViuSRvQrVgTrm6ubCUZL7g3CHEF3mk6fuAl 2zu6QU2DVNut+mt8rwLSWlEwmydhaJP2VaekFFSSeVeuuyse
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

My Linaro email will stop working soon. Use @kernel.org email instead.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 MAINTAINERS | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..f9a9d3dced67 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17368,7 +17368,7 @@ T:	git git://git.infradead.org/nvme.git
 F:	drivers/nvme/target/
 
 NVMEM FRAMEWORK
-M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+M:	Srinivas Kandagatla <srini@kernel.org>
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git
 F:	Documentation/ABI/stable/sysfs-bus-nvmem
@@ -19573,7 +19573,7 @@ S:	Supported
 F:	drivers/crypto/intel/qat/
 
 QCOM AUDIO (ASoC) DRIVERS
-M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+M:	Srinivas Kandagatla <srini@kernel.org>
 L:	linux-sound@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Supported
@@ -19873,7 +19873,7 @@ F:	Documentation/devicetree/bindings/net/qcom,ethqos.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
 
 QUALCOMM FASTRPC DRIVER
-M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+M:	Srinivas Kandagatla <srini@kernel.org>
 M:	Amol Maheshwari <amahesh@qti.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
@@ -21921,7 +21921,7 @@ S:	Maintained
 F:	drivers/media/rc/serial_ir.c
 
 SERIAL LOW-POWER INTER-CHIP MEDIA BUS (SLIMbus)
-M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+M:	Srinivas Kandagatla <srini@kernel.org>
 L:	linux-sound@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/slimbus/
-- 
2.25.1

