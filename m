Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EEE27CB29
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321539; cv=none; b=jShqi/7vMFGFRKjK4YhA382OKfsKBnyH4zVEdtcwjrPOvVBM4ZSTSWx2j+ZiHaRfTo4Ay/pNNsUkNammsveXHsEzBDzIoxy+pAbphEb2h/TkQ0aksJ1hVhPN0SM5pYwfOM9Pw200BuDvj++l2jt5kA6eKhCj8vVw0Pp1KpJ84Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321539; c=relaxed/simple;
	bh=6Ex4TDV2zsYu1F8S7MzsO2fAsL/9qH/bHusCYK0VeV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dk8CZkxzFaczj0sbffE2Qp4tHrRpk6AReIPVDN7Q70SZ0s++NdsKwOkhgyX3RVvgQRTe+mgTX7+2DWUlIIzlw/VNoIk5ndFobtGJJyVfxNxAzS+jjceKrHEzNYQQin6CisIrFnqMkkngzDDTg/QzqiAdC06xzP1lIvBEhwTOnhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YDqvVgVw; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YDqvVgVw"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39ee651e419so2804780f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321536; x=1745926336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdGiljQFkRF0Dbr2acCgX0s9x3K0UlpkYw5viR3VBTU=;
        b=YDqvVgVw/Dleryy20k5uU6BSRNuUwsC+OcGiu/jiGzAVKqE4WS/veIsAN+xi23/DFG
         J8Q6myPs9EmBgkabyi6bltBiU1jelBDnn2ORpENjgLm2iIxKD35igd9NWjbZhnjmY6UG
         YX62IKZ58TWFfFdyvjSfLblKKtfPkYLg4i0LYuCkbpqAWKZ1vIqassupGBbEfnubamBC
         PQzwn0Zi/dSyls3c/PZmwWInViKcadEp7uSDWbz0gc2sp+egC1K0qc5FXJjfRe7CPCwT
         ksSFu7OrC8K5H2GaEOQpIWEGfU0A77u6icbZ8VPywf22dCvDv9RGAzm1Z/Daa0NU+0ZG
         7uDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321536; x=1745926336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OdGiljQFkRF0Dbr2acCgX0s9x3K0UlpkYw5viR3VBTU=;
        b=DZJfoIh1kyZKVlBGIZKGcrlr3M2aoMeRPl736AkUCJLUI5OZx/jOyQw7BeTxhVioqb
         2PpfcVxjME0aphHtoinuieoD9vDbpQ/ZCZ4JvIT4+WoNSLmairoetvQ3K4BbJdRyKTLk
         00aKIRfvQgZboWQ4j+yNCaT8tVmDBMaTUu97qcdOLLN+XfwH1lrEQrHCo3lD4HZVt1IR
         ivrV07+Y58ql0llO8UXuwXj5jHhw2eu6WfkSwqY6CJNwY4JF0GdOG8HEjPJboNDAQGym
         XYao3LVOBymYn/iCTdbEnnr5VelasTseO8EKx9sV+Bzi33Sss3hAcgHXEk54ULK6JbIu
         YaCw==
X-Gm-Message-State: AOJu0Yx7dPBC9KEUDtoThBaF60D7m8PfZxArXdTCvox8m+rQmBAVYz3N
	/P89/0z4C5D9FDBQ04fswy9u+9mfQGx7DEX671zY0z7P+3+znMHw65bbBTQDYUs48aqF4Uy1gkD
	X
X-Gm-Gg: ASbGnct4F9RebOLfSoV2JltK//CInNzGJVSKU7mIHgLVb+NcZpUPTIOFLlQIZ1dHqHe
	ujgPgCxdm3siowq64WnB5wxSP955A+PBnkhx3PdC8VpPaSPTGa9QJGDveHxFMAKjO44QsPHr0V5
	MMDW/zP+j/Yrm9gUHIAr8nRygsXPbtTPkubmA5UkAHWIPwmoDRXhPOzpyEszV0lbuKhqhX6WasI
	ly3yHRji9OULFv6Mzn84668/iKyHnbraXjZPVgFoEDo0XFK17su4NDEjrMIPQjJDNmlwCteJ0GR
	dQb2MNVTi2y2CCSGD1f0Q8rONoCHtHINeS45GOPc+FbZtKtum0mS
X-Google-Smtp-Source: AGHT+IG0T8nDsUkbBz1LgLUHc4nOz1k/hW6xtvig54WUQh6HRN014aiXPO5h8JbbZcarpvLjXHIJ/g==
X-Received: by 2002:a05:6000:4012:b0:390:f9d0:5e3 with SMTP id ffacd0b85a97d-39efba37dbfmr12326916f8f.1.1745321535721;
        Tue, 22 Apr 2025 04:32:15 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:15 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 04/14] soc: qcom: smem: add minidump device
Date: Tue, 22 Apr 2025 14:31:46 +0300
Message-ID: <20250422113156.575971-5-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a minidump platform device.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/soc/qcom/smem.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 592819701809..985147b563f8 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -270,6 +270,7 @@ struct smem_region {
  * @partitions: list of partitions of current processor/host
  * @item_count: max accepted item number
  * @socinfo:	platform device pointer
+ * @mdinfo:	minidump device pointer
  * @num_regions: number of @regions
  * @regions:	list of the memory regions defining the shared memory
  */
@@ -280,6 +281,7 @@ struct qcom_smem {
 
 	u32 item_count;
 	struct platform_device *socinfo;
+	struct platform_device *mdinfo;
 	struct smem_ptable *ptable;
 	struct smem_partition global_partition;
 	struct smem_partition partitions[SMEM_HOST_COUNT];
@@ -1236,12 +1238,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
 	if (IS_ERR(smem->socinfo))
 		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
 
+	smem->mdinfo = platform_device_register_data(&pdev->dev, "qcom-md",
+						     PLATFORM_DEVID_AUTO, NULL,
+						     0);
+	if (IS_ERR(smem->mdinfo))
+		dev_err(&pdev->dev, "failed to register platform md device\n");
+
 	return 0;
 }
 
 static void qcom_smem_remove(struct platform_device *pdev)
 {
 	platform_device_unregister(__smem->socinfo);
+	if (!IS_ERR(__smem->mdinfo))
+		platform_device_unregister(__smem->mdinfo);
 
 	hwspin_lock_free(__smem->hwlock);
 	__smem = NULL;
-- 
2.43.0

