Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8871F2DE713
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542275; cv=none; b=JMm31ZV3NO36pksJcXtLyQQNYe/k2rUu7xOXfZ41RTHD8Zgk5VD6zSRJA2N+odAxLkJpNoV46qF54Uj6iFDqxAvjpdeDDh+HfFEg7zyYtk2Joon+0Yxz8suorRfZSTusLj7xQt/Vw0XWdKKBDyFqC/eMcwnGwmMJdLUamda9BlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542275; c=relaxed/simple;
	bh=51fwn9UR6sLo33WSntk5b8fVMnu6/RCpawuylEc4EYg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Fh1xONWnZ6mRw8jxorNN2CS69ghCepm7R8xzZXCwa0XUNrBgPZuD1/bEv9ixn/3iEIWNx8ylEI4ImQFUiXeTw1b40QSjAULiyveTZ15blbUuPco5QzaItCvHGAQKx3jECWxZAgoeZliOjFfg9c7F7W4GyxyoofRFyS0CmkXWOFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MBKS4Rke; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MBKS4Rke"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3122368d7c4so6506118a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 04:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751542272; x=1752147072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WcCs7vej7EmjlOgqSL2DpUmA/zZePV2jjeUjmDVA2Io=;
        b=MBKS4Rke/iaMAIf1WMrycjRYmqOpZrRV8X3eZBS8L4Vs330zK4ns8qECwZtXsY1jjV
         k4SgRGOGg+cjcx8p6gyi9arVaXyU87xZKCBerQzNNehHGfyolmunAYu4ne0PKcO0Ku1j
         jeCNdLRvjpW+4Ul+TRAQlO7pLnTs/vJtpFnIjm/aJtQAdvnxXNYoFdhykVEkrD2d5Ya5
         k8NjFdYDlhSaTA+JdEcdzGGvKJMfATEmPEaQuF6Du9SEsHgrRb56lrUdYFI9ZlGIo3mJ
         t3/JM8lI6ZWU88MngP11Zlm70/NrvLQZbg9Ul6FGYMZUgf//nKxxTOvkTCAaBb1dpZxJ
         KoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751542272; x=1752147072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WcCs7vej7EmjlOgqSL2DpUmA/zZePV2jjeUjmDVA2Io=;
        b=F0PifxmAHSHA/n8z1UE2dQ15QLQoVm5LpGc3GawHjkdPp4fmd7zNLBi7XHjS+Gq7c+
         49H/3sUClEp09jCKL+uf/U66RGrgRZfmstQmv7MhF2TofGZoZ59wZOFP1uGBxBIvu34U
         n2X841b/jDk1N4WOgBXmnirPe0doakevpfZZghnoMM1sQFCPdURsZVv4sv15iRMiTHMU
         9arUA0IQNaXXZXcGGksRCqAeWPMhn6Mr7E0XAcivQTSA/YWH46XPqMJfXRWRpqoMHfQS
         Zb6ZdpusZ0wKrKyEB+8sSYUSY7IQM05wl3ciLNfDwd+XNDyJ/u0I/OSKnR1pgtKCCKbk
         qUlw==
X-Forwarded-Encrypted: i=1; AJvYcCWVtAvt0+y4FfQA4mdasEvMelILtzavwv0e8XosSWaXbvODsyi9i6oJFer5mFBeYDisC43UaadIwf621Eo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfJv5HmsEH+wcv965dl6hV8FEhVlAv+ON1KYZz2FbnxVWR6FMz
	WXBlRQtm/DbEBxTnpqShbbk3r5/V439+7zf6NKuFCvpcWFmeArBz0n1t4nfPaiwgu1s=
X-Gm-Gg: ASbGnctL4pTUnET1P3AVXDTjLcXYzIXFMMwtcj4ehvOA1KKPPilv53PNvAAXv1tngde
	1Ynn1cMQBcUd9oNU9D/AIxCx5PYGgGAU4KSdCFLTSY3mgiCISJ1LLC5LjcpnBqOwVQpm8T1l3la
	dxPDscOKu9hfzA9Lt24XJNhz7oX6pIifngm62fgioWDs1v1aTjfk0tRzB4g5DDediVuyR/82Ryk
	g5avleDk2OcEKH6CRf8Z+XOfjddwXZ1IF55IWdt7zU6Fc/rtnZmdgMlddNdw8FlcBrmSYh0oUA+
	92YNemmvb0gQtK1RCYC1vEGp1mw1ObINiBMMxvAqK7lbFQlx3YvNGIdoX/0CaAM=
X-Google-Smtp-Source: AGHT+IFhAcA3OhH5rYHEhAy0zGIw//i/uHwlpC2u5oxSV4TXYQftB+zfMaEw/b96QQcNkfPz/Z4ybw==
X-Received: by 2002:a17:90b:524d:b0:311:baa0:89ca with SMTP id 98e67ed59e1d1-31a9dfaaff5mr2743821a91.34.1751542271841;
        Thu, 03 Jul 2025 04:31:11 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a9cc65bc3sm2166551a91.14.2025.07.03.04.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 04:31:11 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>,
	"Chen, Jian Jun" <jian.jun.chen@intel.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	linux-i2c@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: virtio: Avoid hang by using interruptible completion wait
Date: Thu,  3 Jul 2025 17:01:02 +0530
Message-Id: <b8944e9cab8eb959d888ae80add6f2a686159ba2.1751541962.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current implementation uses wait_for_completion(), which can cause
the caller to hang indefinitely if the transfer never completes.

Switch to wait_for_completion_interruptible() so that the operation can
be interrupted by signals.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/i2c/busses/i2c-virtio.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
index 2a351f961b89..c8c40ff9765d 100644
--- a/drivers/i2c/busses/i2c-virtio.c
+++ b/drivers/i2c/busses/i2c-virtio.c
@@ -116,15 +116,16 @@ static int virtio_i2c_complete_reqs(struct virtqueue *vq,
 	for (i = 0; i < num; i++) {
 		struct virtio_i2c_req *req = &reqs[i];
 
-		wait_for_completion(&req->completion);
-
-		if (!failed && req->in_hdr.status != VIRTIO_I2C_MSG_OK)
-			failed = true;
+		if (!failed) {
+			if (wait_for_completion_interruptible(&req->completion))
+				failed = true;
+			else if (req->in_hdr.status != VIRTIO_I2C_MSG_OK)
+				failed = true;
+			else
+				j++;
+		}
 
 		i2c_put_dma_safe_msg_buf(reqs[i].buf, &msgs[i], !failed);
-
-		if (!failed)
-			j++;
 	}
 
 	return j;
-- 
2.31.1.272.g89b43f80a514

