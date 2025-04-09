Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BC827816F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224869; cv=none; b=oP17gLPhrtYJGh9yJyel8zageJ96fLQPC0nka9qJbn6vB+nQkOgMeTDRwQXYtPUtjt00/q+Sy0lButIcu3usX2qP9eK62pHwbmJov8TuEbm3hTOBIgpFWtF3PDQ52xAUXAY+QKedJyLRQbEqx3GKMqNsa0mXrDUZWIECe2521r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224869; c=relaxed/simple;
	bh=syPUBIzkEdarCp+N7WDiwHDCNIOV6P5QwWnIfqZVWLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YDP/1Be15/lwuJCiKDaTXqhJvFred+b/bn8KKC1Mtm1Uifn0aTvzUT98VYQfdT/jFdjN3arIUa0d6cUlsU/e8UPgxikkwBaADxUic94LwTC/o3yhIl5ZftgWoMg1lhjwSt//TOjk8jTUB6vEdrDzLxqUBuFULK2ajpZhSJr7sJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YfJq30qN; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YfJq30qN"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-af59c920d32so51237a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744224867; x=1744829667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EuoB16/glHZs8DH9yStavq4EmyDzORTC/5S9hgU6uRQ=;
        b=YfJq30qNt2eazDQvF4ru6jdllvyjlGpTAJzqLbUOFSL9VSJev4ElvKMvIME1R3GiYq
         sXqMHcoeeSoA3hSqgdrihAOmz9gs/eIVuSZ4cCKjCC+iD/q0MGfQKRTDe2ncYB+nl2HQ
         zBllJMa6NnDp0usZ/Xi2qxLHOhUYAUYJ5cpXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224867; x=1744829667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EuoB16/glHZs8DH9yStavq4EmyDzORTC/5S9hgU6uRQ=;
        b=bsvkd0m9U5+NmhnSKUzhDgQSRtd3Rlpmh7A987SKDVHObUtz6TQBGh7Bz7owaWu0Oq
         Uhjc4vbuAU5Dp5WYp624KKDmXWi515eAxG8ATa8RVDh+k1P369ZRea9MTprA/tKl4QHb
         V6+ROwKYH8W2IfQw1aBAw3sUbNVNlbAuJU/Zdqlz9Gcoiaf+yIYuBjRwm2nsbMkpnpSF
         AViCVv2bsFlgLd6DsZUgpdF6Prf/dDv0KnFM3u/tVnDtBOpCTUlrAE7/NEbiGlryIIh9
         ZGXV/4P4ibUWIEtlacBfbiusHycekQj6BoNX5+Ke/vifxtZfoc64hevUMQe+8YX/HjN0
         almA==
X-Gm-Message-State: AOJu0YzVXDSIgfelKePXFe3ZM+QpjmIJ3iqwfl7gcSFm0Zds+Jcqf653
	nTtv70QiqsWujsN+FvZlDPvgVjtR3ipm/H/CPsbVEA27O7LO2mz6AZu6H/49Sg==
X-Gm-Gg: ASbGncvaYpxoWXhgXJy6ljbWI3pBfseHAbPUqsztEs1yWA2qEUSv9wWJ1wS/0l3sRyc
	MU94xMtspPtZ8zx3FSJ8OP4IQ4eagvnhpoBcQv4lz1u9qoFrH1yq5+UWDTfYUSCrv86255SzpsR
	8aFUft+TA5PgYkcmlYW/1YUO9EqWj/5Dn+yfjtCtxk4BVZC9ZvP1tDbVh/yZPQEOv028RO6XbrS
	f7DP+hQve3G1g34d7TnoctteYqi6uen4Pe41GFNfUjFPwN6/rMBDySptz/yre7HzL/FuIoasBf5
	AitwgHV3oJZVWRC8hQfGCpjfPwAlEP2l9W8TxMnvaw4pBck+kN5k68kA+HvH/GVNHTlXnBk4sVc
	+7g==
X-Google-Smtp-Source: AGHT+IFaHlE9ZoUh5364MdBMCmTSlfQCXd+iwEWJTQuSiqhbGD8ldtSoWxeJNBTDXaBLlDhuQihS0Q==
X-Received: by 2002:a17:90b:53c8:b0:2ee:cded:9ac7 with SMTP id 98e67ed59e1d1-30718b83034mr77258a91.20.1744224867680;
        Wed, 09 Apr 2025 11:54:27 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:461b:92cc:c320:f98])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22ac7b642besm15656375ad.46.2025.04.09.11.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 11:54:27 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Brian Norris <briannorris@google.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH] PCI/pwrctrl: Cancel outstanding rescan work when unregistering
Date: Wed,  9 Apr 2025 11:53:13 -0700
Message-ID: <20250409115313.1.Ia319526ed4ef06bec3180378c9a008340cec9658@changeid>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brian Norris <briannorris@google.com>

It's possible to trigger use-after-free here by:
(a) forcing rescan_work_func() to take a long time and
(b) utilizing a pwrctrl driver that may be unloaded for some reason.

I'm unlucky to trigger both of these in development. It's likely much
more difficult to hit this in practice.

Anyway, we should ensure our work is finished before we allow our data
structures to be cleaned up.

Fixes: 8f62819aaace ("PCI/pwrctl: Rescan bus on a separate thread")
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Brian Norris <briannorris@google.com>
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/pci/pwrctrl/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/pwrctrl/core.c b/drivers/pci/pwrctrl/core.c
index 9cc7e2b7f2b5..6bdbfed584d6 100644
--- a/drivers/pci/pwrctrl/core.c
+++ b/drivers/pci/pwrctrl/core.c
@@ -101,6 +101,8 @@ EXPORT_SYMBOL_GPL(pci_pwrctrl_device_set_ready);
  */
 void pci_pwrctrl_device_unset_ready(struct pci_pwrctrl *pwrctrl)
 {
+	cancel_work_sync(&pwrctrl->work);
+
 	/*
 	 * We don't have to delete the link here. Typically, this function
 	 * is only called when the power control device is being detached. If
-- 
2.49.0.604.gff1f9ca942-goog

