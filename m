Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5611D47B4
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 09:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748166945; cv=none; b=En2ydYXOBPyeSEYYgeLY38iuMQJrVGDi2kFVpFf9wMoeJRgyuxgqmxhXI1+7ygF+0KtUDkLMLRFET3j+opV36zcrYHy+kijPXZYnmV+I/RPqXXOR5Y/xyWN2twkqeWI2wev+sds2WcOL5SHQ9epU/wRzsQYug1WpwSSbfCGhCzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748166945; c=relaxed/simple;
	bh=SsWCsaTwRZqs68+Glbe46xtIRdbeOyelv0DnKF+MkjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bu1k/gjswQn1zk/PeFA3f0rPdkDAAJAS+zJp/UgK5Y3AJUC4E8pHfXOL5uUtZ1q/OGwkMwODzcLlA8g3M0xH7fe/VzmCvIAnDPFS7aRaTA05Rff1pyPGzfGe5rNZA4Vp56T2HGKmSGsuQS2jc+gKLHWYqXItJgVM4yqBu5cuvyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=TwLfEerM; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="TwLfEerM"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1748166941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HFG28AXljMj0pG+QxD5VLHaTyFSd5w20nyiugUfeqN4=;
	b=TwLfEerM6CNKDBHRYWpT/vWfRw8c1GP/tjP/GJPKf2od24thxZscLIjWyKjb2Fh/q81IcB
	fP50ft1WsxAD+1thLRNK1w9+MDnrnhj6rdW0ojlnpHcQ1CDpuGD0eHVdkppzsQ2b+k7CdO
	DSv0inyl14TeWna7SMY1T1kjXqsCCeVgom3WiqrFEVhNfEgkxg3JCX9FehIt2jNK1r7Ks4
	DElun2G7o+rWISSUkJwYTN9x8g1TG9EgA19skt0KRvLfUqGoE+qDhdW3GBhyBAtTcqd0XM
	rqCRo9wvQPlN9rVbs9kXh56U0b8YQuU+SEDcc9ygY17RS3mmea2tIR6gnMiNNA==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] firmware: qcom: scm: Allow QSEECOM on Dell Latitude 7455
Date: Sun, 25 May 2025 06:53:35 -0300
Message-ID: <20250525095341.12462-5-val@packett.cool>
In-Reply-To: <20250525095341.12462-2-val@packett.cool>
References: <20250525095341.12462-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Allow this machine to access efivars through qseecom/uefisecapp.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f63b716be5b0..e01ce1e37459 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1988,6 +1988,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "asus,zenbook-a14-ux3407qa" },
 	{ .compatible = "asus,zenbook-a14-ux3407ra" },
+	{ .compatible = "dell,latitude-7455" },
 	{ .compatible = "dell,xps13-9345" },
 	{ .compatible = "hp,elitebook-ultra-g1q" },
 	{ .compatible = "hp,omnibook-x14" },
-- 
2.49.0

