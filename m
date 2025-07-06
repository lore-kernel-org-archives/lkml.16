Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28DB2BD5BB
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 20:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751835555; cv=none; b=bWJyZ9BqXYtDh3NTTz22Dm4ZRXB4vdxTMDROVb66A5YVA6KBrMAkTi9x9KGp+WIyfHGLpt2g/vGak1l1rP4V737EDetgkrM4aMX1ToNE7pcxVd6612wJCXv/x18h3ZaCk0KDdVtSR62r4sd22YvnwxC58SSJoahDEZL/lVV3vj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751835555; c=relaxed/simple;
	bh=UU6tATJzFwq5dTFLMgHMJ4uimWg5kKSYyOmbxAGd6QI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RQnOVw0ua7+LRWP294CJMjFYQtzZRIdJZHs69Dsj+6+3wip4DopvYN0Kanw21AWlcjEhblg+5ootWOLPm5Em+khfJSLRq6Re6NVih+RV/mITsjhJx7xwoLa4Q0of6llv/1T1T0ohaKEvU644/evHlW74HmCrSifAaqyQGz+8ve8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=ZOvFP4HH; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="ZOvFP4HH"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1751835551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p+eDwq2SRc8vLb6yDGCfDM1xp95H0CTlXPndJnkQFbw=;
	b=ZOvFP4HH+mmziRCo2hRrKYYMuFqfc+olZJU5uncY5tw45plyUJ03tPWDWUHcVvrUgHP66C
	hLkd8s5Tlek3b44S7nRmwzcIjHVqKh5aJErOmE0HMprliHe1N0ZO+N3YoaRKvtCXrNAFDd
	rNqeMmEBmzqKSlB51jxO09I+n7oHhk2gVAgI9d6dksTKC2Epb6vXfjyQXXrFE4l8d/ZUCt
	z8CqGf32fwham772AK7hbPNZ5CwaCTWKbccXsklS0cdDdqQoO2E/LFJy0NWwNh2IfCqM30
	TSKAFGAAimgIg+1fjYZ8VAbvCxR72bz11RLrEftd0Vc6J0HQgjDKdxpMzl+iWA==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] firmware: qcom: scm: Allow QSEECOM on Dell Inspiron 7441 / Latitude 7455
Date: Sun,  6 Jul 2025 17:50:26 -0300
Message-ID: <20250706205723.9790-6-val@packett.cool>
In-Reply-To: <20250706205723.9790-2-val@packett.cool>
References: <20250706205723.9790-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Allow these machines to access efivars through qseecom/uefisecapp.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/firmware/qcom/qcom_scm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f63b716be5b0..b001208fefe0 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1988,6 +1988,8 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "asus,zenbook-a14-ux3407qa" },
 	{ .compatible = "asus,zenbook-a14-ux3407ra" },
+	{ .compatible = "dell,inspiron-14-plus-7441" },
+	{ .compatible = "dell,latitude-7455" },
 	{ .compatible = "dell,xps13-9345" },
 	{ .compatible = "hp,elitebook-ultra-g1q" },
 	{ .compatible = "hp,omnibook-x14" },
-- 
2.49.0

