Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94458224FA
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464357; cv=none; b=Ckfx7I8tqHkHpvGSy7U9mwxMjyCnEdWnjP6vad5AcQRylLrYaWc2fHFgYZ3y0qVcU1YkNLVvQtSUqhESF01XlOvYmq3ewx1E6McZlHKcsq5NMRxX4TrzCVL6WSy1jvS2uH87uqV/0CngwDjBlj6U4ADvlPzT9tsn3ZdegNfbG/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464357; c=relaxed/simple;
	bh=BylYn8q7LLGpihaul8nEhkkxHdcEIUxw1xX1MbZ7Bk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oPTiLmYNJ1+DjpDzPBh/4gWZpkQO1o15TutzK868prGMp37nmKRZ8b8DZSistKbvV5h4nEG88vJwfeVGB+5oubmpA4MbxzbMV10jM65ZWYwStivoH+0M0pPBtdIuZUtfil/nR1xFbEV4eqlO+wwvLqBzFQZn3q8yqZwDWVbQPTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g5PYHr/x; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g5PYHr/x"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so25851625e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 03:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749464354; x=1750069154; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r5mHztYrkrGmqdzQD2l85P8GCoJYxyAbRSWs0LTryIY=;
        b=g5PYHr/xrTZNRe37cw7Ozawlk5BPv45Upa+BM6VYjLyGM36b8ZKSLvQAx66klREF9/
         M8b+dWGVtokcAr8HFhpsCpTr9lQwlZDLkBpm84kiSe+b8mMLQPHjfUIGVO4angJbuKhL
         +StxJy9mlPOQIEKiH7ZNSxnVhTH9oGecviVk1aGYin+GzFV6axvuLwNwRtH3TAlNF1ta
         vdLxmES3183sG521EC9CBd6GjUE8wKxpjC5W8Xnp5GvJpgLS4UsrX+UdEHYBMs06VBRF
         14//Wzi6FYHFIHHbXc2fpuBd9S2MNI0I1ZA7DxZAJf3IusG9QTGN3d50pWCmRheXmEF3
         GKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749464354; x=1750069154;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5mHztYrkrGmqdzQD2l85P8GCoJYxyAbRSWs0LTryIY=;
        b=d1IFDixmLuzXm/VoErnDvU/wfrM0Aq66QwI6Dg5SHotKc0p716sWkskmHG05SDM90X
         CyZEwE9PXVIkdfaOj43Y6SQYb1aA16zNko0lPLuRO3AA/FKi09gdTBX0mDh/jBJbZpG7
         QFCvYgHGb0aKc/DWnyyDyd73hx4RpTvnAvXAKYeYvaO4C37bvEUnZ75n8AqEpxhttywg
         qt4CctSgrv5fKDHBzhry7WpJ47QMUtLPKeeOFXE64UppIasPJ+SIoBr5RgT0L4snxgw1
         HlF5JrGlsl6U3ctsl0siyS87YWj6DzN6Yoco1eMT9upMHG9X/sHHfduCddPS7gTCpGqM
         5rUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq62+z4W1RLihlv6Rwm3J4JeE6SaarIR+8y4xOK0U4lkZEReUh3GMQL7HcegsObrV7gXzIWFLxsPJcZBA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2PvnDcstLtZI9IzFVanED6thDf0ID5UGrl81FnrhVKrAubsVh
	TV4n6VC/IoEZ26btQfjc8e/kQA6VBJBxFYTtIiLLRwAGKg7n8Shapsc2M3vevAfQ259GQWt94Un
	AJOIru0E=
X-Gm-Gg: ASbGncvnLZlBvbpLvT+fNoAu41Exwh3ry0K6km86ykrQZaBrR8ODSsUDiskMvMlbQLT
	pEJxrhN86oyZ9rzzfgs0/lDMOQG+X6L1KAiZCDftlxMEXub5jw9nNHhamoXFQX0MtMk7ETQggzG
	kfuyPWj1JoIRBN1FZ8uTtelz6O6MFDwxVYaq611kztrtcwySm3cY6b8Sk9nUzNUasPYJAGf8Iu9
	36tf6twgXgOmUgphz0uPmkR98YsUuw5Jz9S4YIMt91v5vxgtC9yC7Tagfi5Wp1yPNq1xZcnRJq2
	Q5dsU7TofTu+hj7uXLitNV5BZlNBO2njfRUeFaSGEAti3ONbZCcfsSvNlzknkLzIIGMcCBwaOPL
	1AjMTMw==
X-Google-Smtp-Source: AGHT+IEt0L7eowj9syhu7VRI/x9xDxOk4NVySIoO/3E1zTrZVuto/UX1U8TTcSHn+qx8a5cyBIqbyw==
X-Received: by 2002:a05:600c:6212:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-45201350ea1mr143952555e9.10.1749464353901;
        Mon, 09 Jun 2025 03:19:13 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213709686sm107272345e9.23.2025.06.09.03.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:19:13 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 09 Jun 2025 11:19:05 +0100
Subject: [PATCH] coresight: trbe: Add ISB after TRBLIMITR write
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-james-cs-trblimitr-isb-v1-1-3a2aa4ee6770@linaro.org>
X-B4-Tracking: v=1; b=H4sIABi1RmgC/x3Myw5AQAxA0V+RrjUZ4+1XxAJTVLzSikjEv5tYn
 sW9DygJk0IVPCB0sfK+eURhAP3UbiMhO2+wxqYmMyXO7UqKveIp3cIrn4KsHaY2HqxxRZ64DHx
 8CA18/+O6ed8P4pYsUGgAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Marc Zyngier <maz@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

DEN0154 states that hardware will be allowed to ignore writes to TRB*
registers while the trace buffer is enabled. Add an ISB to ensure that
it's disabled before clearing the other registers.

This is purely defensive because it's expected that arm_trbe_disable()
would be called before teardown which has the required ISB.

Fixes: a2b579c41fe9 ("coresight: trbe: Remove redundant disable call")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 8267dd1a2130..10f3fb401edf 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -257,6 +257,7 @@ static void trbe_drain_and_disable_local(struct trbe_cpudata *cpudata)
 static void trbe_reset_local(struct trbe_cpudata *cpudata)
 {
 	write_sysreg_s(0, SYS_TRBLIMITR_EL1);
+	isb();
 	trbe_drain_buffer();
 	write_sysreg_s(0, SYS_TRBPTR_EL1);
 	write_sysreg_s(0, SYS_TRBBASER_EL1);

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250609-james-cs-trblimitr-isb-523f20d874d6

Best regards,
-- 
James Clark <james.clark@linaro.org>

