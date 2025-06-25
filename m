Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9F7212F89
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839295; cv=none; b=fC5RHL9n//ugiNnIB+Khe/avGatceL+t2MmdMcQd4L/ADYTfLO+ZWP7su0cXA0H7TTmMvHPK3Uy8hlfZW2BKV1BEnkvmNssgeIJ+i9H4tFhfqb7OdjLQIov6hpDtyHl1GoEoUuBUcgeRV3J68fhT94ENQ9f3/ATGdZb3GctE/cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839295; c=relaxed/simple;
	bh=fdB5IottOpfY3egi52zqvBVxl9fvhOG2JywIrJMbHic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Igt646EjRLPy2wtgYzg/GHpWXs8QrIlrXV+LgpnvTombnZKTmVOBCEWEpoB6QsodvScDMLDRaVukdHHPKsD4zjOHPqUYMEx4kuhwYVI6f7pNgI612+ZPFCRpetuX+kQ6orQdmupHkiGycB/lDh/UShuYHNjce1X5j1hoNaF1eSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2gGzog7T; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2gGzog7T"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso857066f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750839291; x=1751444091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ED6dhruIb+QIUuQOz9kWiIXGChQPqNuSf+7wga72VuM=;
        b=2gGzog7TT/vdLTQRbOckKqCEeXPbmBmB8lKn+LtwH2SqvDSdgHTQlCkx0udjGSBNrN
         4nRUSRtPXNsBf1OWiIHs5HR4Ygs9Ed8gpcX7gybJyiOK2NNfh7Z6eHgpIEFfy14UEZKZ
         TQqshwZ3cJYeSjNKofCGzWI5zWvKb6ZE5oQO9mTPrEoraLmn1oOnKztTEOM9IB1HEPEW
         QGTzjln+gx3pr4TgLtKW5hbY1uVSFcPOY2Z/RtTvRvMb7tnh4rj4CV/3KcfEbkasN1n4
         ZUAwT0yWdGnJo0dlMA2xc7tpSQ/rR+Et5XhvvvLzL5tAEjrLJuebm69bSe0jC5tWibNr
         US1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750839291; x=1751444091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ED6dhruIb+QIUuQOz9kWiIXGChQPqNuSf+7wga72VuM=;
        b=S9bCACzqNrLyjy5J5hQsWfCOMtQb+zbCZ8im/MQClaE37xZJJKdDxdasG7Dy7p+X/i
         Kz+s8qoqpcWFEqkYVPS4tpVMBtVmeTdVJu7090xV9wALshJ1L1PTbwmle9vi2L0kfpBf
         QH07wAW/jU0sGYGWcjPKTmu5snPoBXw0MFkJy40mRE7qEElIBLJrLBhhb6y4oB/W2rdN
         qh0Jn7qhUA9wpbmLHhIWsa3ReJmuEHi4XCWAYrMdiwNVC5NC4SzAQ0uSS6M7qlazLtuQ
         Shu+13niwh6Vg6c0Vpu0Ph2vnFp/N6uHrc2KzR8dkkIdiKe1E2yn2B46iXg7nvf0lFoa
         vrmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQobaIA6cCerd8rV+xcRZwzAXzSK6Hr94qMzT80C5L4Yu3MGuAZg69pbXt4nm6GQ1UE3z4ARX9PCWiAQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG98c3RJ9HzplBBHbnydTkrZICzmZLrk00XK5ECyHdK5tyjkAP
	lu4AstSKWXkcbX8Y+RCPTqsCoj6ydrO0PSrg7XcVkxav5JgqFSjipkX3SpeTLSssg2Y=
X-Gm-Gg: ASbGncsw0ajB76NLuz//C3MjoGIhAWb8LsjfOV/I4Tb6QI4LuBbi47Eftox5qVaIfOQ
	EUGPWpG7jY8TXimiGLxGc5qZNu+MUskPN57Vh6Q3tmvZysDhSzINe6t0OjxwdlgjjgQjGjZDDbh
	BnSdU52I98KDzQa0yAIhDalyekoGagp9w+IlWUQOrcA4ACyTQcQnqXMgCrGpB54dtGLBLaBuNYO
	QMpb0xsmWxeybEn8BESFkJHYDn2mwKsVU6zOvivLip5otUodxhGvgbKGpP3rMlmy2SiOIWjErZD
	VEtEpkspJP42N8T6sMAKywh12ywaHv80gVEp2Homea4c7seKrKCkg//C
X-Google-Smtp-Source: AGHT+IGrJra0HCkMUIy4YxpsjN26bVIxyBea7r8VOZLb/fU3h0SvFfA+o0Zi8pQUx7dC7hq4QUgdug==
X-Received: by 2002:a05:6000:657:b0:3a4:e672:deef with SMTP id ffacd0b85a97d-3a6ed655cc3mr1409506f8f.36.1750839291389;
        Wed, 25 Jun 2025 01:14:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45380705351sm20215035e9.0.2025.06.25.01.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 01:14:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 10:14:48 +0200
Subject: [PATCH 1/4] firmware: qcom: scm: remove unused arguments from SHM
 bridge routines
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-qcom-scm-race-v1-1-45601e1f248b@linaro.org>
References: <20250625-qcom-scm-race-v1-0-45601e1f248b@linaro.org>
In-Reply-To: <20250625-qcom-scm-race-v1-0-45601e1f248b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3182;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=doHat/la11mFrInrFzs0V97NeBO7G6mUZ0qmFIG2Vc0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW6/4LV2bP9pH9GKPriBpGcjXCSMWivuIoRJXu
 5c68/2YgziJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFuv+AAKCRARpy6gFHHX
 cinFD/0cAaKjCRlAiKEGD40icXhFPHuE+ea1FZiaYgJk4ysuenuMc9F74VlcnmrOXHA07Fgo432
 NOsu6VzHiNOBd8pLO+6M96D5bv1Pl+8+zDNaAymIBalVwalQl8F7FmnY2YKfgus8xYI6P+uhZBv
 +bJ1ptQaypGJLzWaFMVbC1QeDD/Ppno6DsimpMGWGAn1NJvO9JL05p4E02QZg/bsrDjfGuCvpZX
 pUDBbbmKSoO91hzNzdlZOMtCVQn02vj8KgtYuUheMN7vUFgSyTb83/3vxmqtvdg6R5BTEbzra2S
 Q5qDz29AHRTLa60XAGbT9Mmc5YDM9An5axJoJ8yY6Q2vZiRnmxJmmLkyjfjPzQBXn8HbwoFEzhY
 ggOS/G2B8YX2Es5WP1KAlOyxzCada2FnJmn4/iDthxidjIEWy7OuOitAUxBX6nfB6i/6vIU8RJm
 KhP2btxM8CvtTH6bbAEmGOYTeN7cSL+wPgoJOmCrTUFwm6ZrNLdGuL9tCVdT1JDCaV5tAuEUs8U
 8MfSq2q4qgOqWJX9SsKAO1+xdqYj40xBHSEN632LhsvrYqxirby2+6A67b76LWHFdtVwKltdgEu
 58XjDGMGIPHPP+thWxiLYkLM5s8TxXhgU0KCI4j3jzg1qOZ8bs/iSDZBbeDIRSv00nWoYz/iUbc
 og9yvNLJNNlg9ZQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

qcom_scm_shm_bridge_create() and qcom_scm_shm_bridge_delete() take
struct device as argument but don't use it. Remove it from these
functions' prototypes.

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

