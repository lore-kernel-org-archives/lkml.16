Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A84306DC8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 23:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751411877; cv=none; b=KIy8AIno9aIg+JkLxx0y/FVlQqcBMEy3qAs2TMUKK51kvRN/PJz8fbvzrMpEXrD0A8tSZzaBKOnmDu+h8pfAlJMxmD3f5gRJsduQ+dqzWTHjEMdtpY/qgI+IzuZ1q+w0YYhV909/W6v7S3ehYuPAX2UfmFPSNhcaQFCm9kioBhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751411877; c=relaxed/simple;
	bh=UU6tATJzFwq5dTFLMgHMJ4uimWg5kKSYyOmbxAGd6QI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VgiGGTnbi45zWDJ9WTxay6pj0GcWW9En+7odo74cFKDPbbuH4jzPD8yJpP35ez/lF9/czSwVaI4ypeCMmFbBzerF6cCl0TgKO4ktz5aAM5OqXimww+Yyz0yqF8qyQVPUXJzq9sa5Q9BPQh8VBYbg2vBgTDCaUvUciE45VVodpks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=Zk9Cb5ae; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="Zk9Cb5ae"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1751411874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p+eDwq2SRc8vLb6yDGCfDM1xp95H0CTlXPndJnkQFbw=;
	b=Zk9Cb5aeMjekttl+MmszNTrH0ywUv7Xk5AgL8fa3b1t/L79KsBbkt/QaLbVLcKisWUo4MN
	VDzci9KmhMjKSmpGc4dWPexHPBcH5WB6/7JxKVPaiv6gOOOE4iP9S8nIJezDTp6/l9Wcgt
	mPnveOncPL+GUY3T2lhP2q73gwWqa1gIP2eorGxz4qKP/DYmrDny2mroYb82PxSlmlbJIB
	AdWQGWrEB3osWwllXEmV+4vkNxu5qPeXmCi3K0Du1hm/D2PBTL+pN4fFy+xpfVFoRQa2Ts
	esjH6yilR2beDKTXrKre0wPt+AifdiNO7/m5LLsocCdoETTl1p0bgTQc1jm/+A==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] firmware: qcom: scm: Allow QSEECOM on Dell Inspiron 7441 / Latitude 7455
Date: Tue,  1 Jul 2025 19:53:27 -0300
Message-ID: <20250701231643.568854-5-val@packett.cool>
In-Reply-To: <20250701231643.568854-1-val@packett.cool>
References: <20250701231643.568854-1-val@packett.cool>
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

