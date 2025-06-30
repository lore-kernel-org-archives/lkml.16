Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE51289E00
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751285533; cv=none; b=f9RbyNPEtkDEMbotLK+iAJpt3rRH00rCKBuzwolVDdWjVhmrw/vk5x99nPttAaWc9KeRu6YO0hKCBoIUK78t8rxZJz3uaDBwajmxqq4i8w/FKTVzPo843Icv72UDDBl8Bsny9lXjsn2IZhaZbqKK2WUu2KhJkXIusVrDEpM5Dig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751285533; c=relaxed/simple;
	bh=JHEMWVgoh1hSEWV3+LxISOVNHVENn+umGgBSK+L7G3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=neIc2ROZIYMi1rVzbzVCfgLszBYdbOn+OKWRIZwv+UBggwJe7IdyWHVYitehb93ylkCRY6r36i56hcbWO9Tr4Lt16HdfIuRUvizrVp1A89wf5BytNstB20wTbBwvz6Ulvc9CwNmE592V+oLkyHWAg2EZ/jSjDSH3HxiXMaI4AdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cciHYJrA; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cciHYJrA"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a52874d593so1732335f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 05:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751285531; x=1751890331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2w7Xf8pzyPjjaTg20uEoTHzkbLaYJGlVAM+8SRoxsE=;
        b=cciHYJrAXlUy1SPHDsCQucTPvkh5WgD/ijOhyQ2Q+aazK4ZAzTEpGAANIDmrjMDTyp
         sWg/Vx4lKB1UnY0vdX2ubq9jFYEIBGKLW3ZGrIbROlPeIMCBIhuo+KpNUtYgoQlXvt8s
         lMzJJJEDSi4Rr4zpgv1F8+suZUAJR0R71S3E2VabUlbf90opKkPQvNLYOYya40SZeWq+
         Wf6ye/0oGv/2lCGEFWmmyndI5OsNZFPGJHp8jz2xJqG5q/BpXX8s7iZMiXgtxTfPj5MO
         rN/TGSLk0z3aWCy8CB3Q+BIc7t08+DwQD4kjNXXvxlQRqjMmYZ9AyVT+XGQ/xnqi7F7Q
         3UHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751285531; x=1751890331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2w7Xf8pzyPjjaTg20uEoTHzkbLaYJGlVAM+8SRoxsE=;
        b=Scv+oXMOT+Xhb11A89YtaVrrTsW6fqQEeB++SCue4YQoGBqUsJ5zmgtvkCg7HIs/wU
         Y8RnKv645hm2cNm0Q4wOJH2IKM9wyHan4mdBtX+zC6LHtLc1GNUsr11t8SeFAfLIBCv8
         wm8LOd/qpP0EimubAmTvjWFLIWiJHZ5bP7FJOqqEytmrTHMdJ0DfAW+lYjBmGshLcXft
         /9dWiXwkY+eWdQTZhJth2C1VUY9TNoBkagaviKQO3ws22McNkMlqsFiK4SgoloRwrbcc
         /mweW2M7YbMndch7b5RUl0tafGjiwq+UBAQ+Eco1ycFD5EtOjCQOhCMxYxdQZZ77nva0
         kbtg==
X-Forwarded-Encrypted: i=1; AJvYcCXbElwPpdPkif9p+ejDvJjLZZj7NEadcCLUMwpRYpW1ivzT3uhJP0XUcod15j/vxRxe4+XyMIyIqMZILPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfnjTkUGRX7pDqgACAKtevyAdejgOCN6KanMCUT+wtC/GavLA8
	RVo9WBps7LsrkR6XtFc/hDjH6/44CiACFLoZAE/53+ZoRx+PuqMdhJ1dAYQuj/Wizk4=
X-Gm-Gg: ASbGncuPXp+poVbOhRD26kiQnB0nO6YG0nFr78c68p2W3CT0mDnsC5MuSVswjHuWpqO
	WbG8yvr9mSQdpWQO863auEVfOSTXrbYW5oPmoOrIH+JSivAx9MSZw13akS346VX7QqJB4iyyXRz
	Xc10Mdsg/BG92Q7MApOEZFARLWm931SDP6fn63QdkDoorNIhzA/R8+dTSDvGbjZhoOnjZSd7svl
	WBYO2D2EgHr+0S6rMS5ZwrPS3NaWpsIxuajsrqSZ9wQThj8IiGHvrB/WVIkTPtPmEutzMaF9ti9
	y68YMeiD8WnhFhYx3VXbWN6FdkFb5Yx3BPFyWUPMQx3AECyQV2QLDubN
X-Google-Smtp-Source: AGHT+IFhId39qI7YjHzEzjthugvk1G5r/371+xQVx/G8j/lKjEuyHz1PoyVGN9Y5kQEyv/NFSXv6lw==
X-Received: by 2002:adf:cb8c:0:b0:3a5:8a68:b81d with SMTP id ffacd0b85a97d-3a8ff520200mr8265438f8f.43.1751285530559;
        Mon, 30 Jun 2025 05:12:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:19e3:6e9c:f7cd:ff6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c800eaasm10470472f8f.37.2025.06.30.05.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 05:12:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Jun 2025 14:12:02 +0200
Subject: [PATCH v2 1/4] firmware: qcom: scm: remove unused arguments from
 SHM bridge routines
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-qcom-scm-race-v2-1-fa3851c98611@linaro.org>
References: <20250630-qcom-scm-race-v2-0-fa3851c98611@linaro.org>
In-Reply-To: <20250630-qcom-scm-race-v2-0-fa3851c98611@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3243;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=tDndb84vpRLLlB0tqAD10LKSmWnhIuaAzdlt5YEE7gM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoYn8X/J+02BKiQNIqcB/qSsY5HFRAecbon0pNX
 9L1Tl2a5UyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGJ/FwAKCRARpy6gFHHX
 cmPuD/99ROP6cyXEEdebUl5yHEUYgSjlKZ56OZ5qC8VeYAbPj5FbN19gApc9L6fd4UGu96fNJQF
 BkE9QqPgjk046VHjE3n2auh0Gvj0+wYwN4FblV8vqf+BgD3mlF7UMlVMR40pxTIiYZiuy6jPeOH
 etOO5Gzc0sjzcb2OWjfMhwz5ex52jH8ICbRWUeS9ZV/s7MxzBEL93t0JPvyjJ7Cpw1cGLbGN7c9
 smdQpWN+D8ti+fJpjZ/2icgkgTMHCT0INfogztBZyxCCwd+IooCqR7I/J++H6UsWW0Vq1inegjS
 Uu0tRgpJ4xYOob4R5No+dSMFJgi0Ut9uuFTJru9lOPqvQ4oyIRAsKd0+ETc2BGphz15RlkOiftc
 OO0BbNRmHlULs5IXxnSpa7oAsEir4CgsHz4r7YImjwHlFTCp2OHY0WQT+4oNs/wmy9J2toyEzAp
 +e/P8r041rGi5jxXnqmXcRr+DZ8MV6ZJ5NhvG/wiBfD3mYvzLZd0mwOc9RCXL8Hw3X/9XHZIu36
 bX2tp7wRhVSGnaCf3LkzgnTvK32VmR5SAxPCQd25hQxaPeAJUi6E+8E+s9q8PVgodVkrUs7ohtS
 lXQOicMwbFoA6yGI1KkcIXUYUQ0buj5ntClbpeCtoNQxI5xmM62Zuzrw7mSl+FDfvtUKjwSOBjt
 /EBQFtreWnouIOQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

qcom_scm_shm_bridge_create() and qcom_scm_shm_bridge_delete() take
struct device as argument but don't use it. Remove it from these
functions' prototypes.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/firmware/qcom/qcom_scm.c       | 4 ++--
 drivers/firmware/qcom/qcom_tzmem.c     | 8 ++++----
 include/linux/firmware/qcom/qcom_scm.h | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f63b716be5b027550ae3a987e784f0814ea6d678..d830511a0082a6a52e544a4b247b2863d8b06dbd 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1631,7 +1631,7 @@ int qcom_scm_shm_bridge_enable(void)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_enable);
 
-int qcom_scm_shm_bridge_create(struct device *dev, u64 pfn_and_ns_perm_flags,
+int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,
 			       u64 ipfn_and_s_perm_flags, u64 size_and_flags,
 			       u64 ns_vmids, u64 *handle)
 {
@@ -1659,7 +1659,7 @@ int qcom_scm_shm_bridge_create(struct device *dev, u64 pfn_and_ns_perm_flags,
 }
 EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_create);
 
-int qcom_scm_shm_bridge_delete(struct device *dev, u64 handle)
+int qcom_scm_shm_bridge_delete(u64 handle)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_MP,
diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 94196ad87105c6efc229bccebfd15e0be55f72c0..4fe333fd2f075a4e92ac6462d854848255665e18 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -124,9 +124,9 @@ static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
 	if (!handle)
 		return -ENOMEM;
 
-	ret = qcom_scm_shm_bridge_create(qcom_tzmem_dev, pfn_and_ns_perm,
-					 ipfn_and_s_perm, size_and_flags,
-					 QCOM_SCM_VMID_HLOS, handle);
+	ret = qcom_scm_shm_bridge_create(pfn_and_ns_perm, ipfn_and_s_perm,
+					 size_and_flags, QCOM_SCM_VMID_HLOS,
+					 handle);
 	if (ret)
 		return ret;
 
@@ -142,7 +142,7 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
 	if (!qcom_tzmem_using_shm_bridge)
 		return;
 
-	qcom_scm_shm_bridge_delete(qcom_tzmem_dev, *handle);
+	qcom_scm_shm_bridge_delete(*handle);
 	kfree(handle);
 }
 
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 983e1591bbba75215cc1ae3eb28455c0c360e0ce..82b1b8c50ca3e5f97665e6975e8d7e8e4299e65d 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -149,10 +149,10 @@ bool qcom_scm_lmh_dcvsh_available(void);
 int qcom_scm_gpu_init_regs(u32 gpu_req);
 
 int qcom_scm_shm_bridge_enable(void);
-int qcom_scm_shm_bridge_create(struct device *dev, u64 pfn_and_ns_perm_flags,
+int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,
 			       u64 ipfn_and_s_perm_flags, u64 size_and_flags,
 			       u64 ns_vmids, u64 *handle);
-int qcom_scm_shm_bridge_delete(struct device *dev, u64 handle);
+int qcom_scm_shm_bridge_delete(u64 handle);
 
 #ifdef CONFIG_QCOM_QSEECOM
 

-- 
2.48.1

