Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EE11F2C24
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341441; cv=none; b=WBcaEah48SMq/loBuCECIhJ69xlCXAaO5ebPVZQqMt7jfHYMcnOcADvd9thl84T7sMWJtnwut54+89/NVIc2MtsN2vhigH2DblV+XgX/POflypCPpVQK4QihpoM0tcC5dfHx83kf9PueoU6+D3QoH6xrNbxvDdIPPRA88noCQbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341441; c=relaxed/simple;
	bh=6PxJERCfOlWdvjBBvwuCTiAa/h2g6rjj12EfEqksNAg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kmxMdwpU7+Ict2ANqFLmAEn40FGYxNjyg++qtTogZoCUlLj6ZuqtfKmc6OUWcI2I82sptrF9hUn3Dt+sMijiCShfVUpWWkt28P8odJkegfm64u9jTyhPqnvX3gPK3AQzrfWhHeA7o+E4YQt2ML2FiO1ygCNMvoXOU7DedXDeqU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fYzy2ldk; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fYzy2ldk"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43624b2d453so26127295e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 08:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738341438; x=1738946238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMx2YnOlJPDXeo1XJnfHHROuTOY3+drwNmWAuq+4lIg=;
        b=fYzy2ldkXyrqgsmrhEnM/t0NNjNkMx4gvHm0o6VcrTaTT4yU9DqCQmpYV3ldYykfob
         GS/28EUrrPEDcH6EuuArMgCbTCIxOYJTx1obMXA8RpFP7r7T6lpYOCNzvi7gy3N2q8FG
         e/cZwIc/lRgWC0zDWk4bLFKsqgsIpHzC6cY00CvxQTocZfsXPl/GbTRi0OR8ZiOVO33G
         +Rzu/TQ0yJQzVxeoGlCvAI+6aCrBOwqWhVU/XVspbnk/3YgC4nXrUJkOAfZtPr0yr5mG
         Wr9IBTbbTwHL63dD8mpQiR3fq6P3P5Qw9AJwn0VZvpjOd+ltd01sM+k9iRgN9aZ+6jya
         nL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738341438; x=1738946238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMx2YnOlJPDXeo1XJnfHHROuTOY3+drwNmWAuq+4lIg=;
        b=tHmg65BpIF8CXTxnobWK0Q7xL2pi0NFEhhxQTLE/AqAhIXXX9UEKwVQ3lS/gq8viys
         EMryUx6wuNB2KGG9ZKPF3eRzW1iPAsNMCpc4neYJ+G0MX0Wyis/lkEKlnSEukJkzW90c
         KNk+EXXoD2Xm/POTSnXAENM5dB/xvIdpj3mloMCOlUlAT7HWILDe6hbnMYxkf/pACLEn
         hf2x5l/ADIPaUZfOZt3qam82P9SMlvwdlw6ySJzt2VC667D1fVTA9eDrHhI1+uigUSiG
         Ejhckdr2GDlKu/skHyxcQ2mUoR/HzWSLN3/DsMDyx3BlWrbYHb3pmMlI1dnyi3zy4zpA
         goCA==
X-Forwarded-Encrypted: i=1; AJvYcCXvctYfBopsGiV6vFCuUwzXosTXQvKd1kBj2UpxIYZggwvk6tTEYAFENaqxOS8hTarXMjZdyny91PRydY8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo3s4PnE3g2HNbxFmPO9ZYzNd/sJVWfrNc1pH+4Zbu5blT6KTW
	amxq8CcDxVG4PlrIsj3ODTq+9wnDDbYEjqORT5FKIymquhVO7NTWtmJkjdQ9y+0=
X-Gm-Gg: ASbGncth28ONGqWvx0oPY7vTuYD6ha9CUPtHHFuc09FreizeLbDNkt68SwKinlI0FDV
	jHD4Gdd2w0ZokBtK47xZD3RtVV1vf8fMQum8FgMbZzBG8c6FsXEuFkqlYTHYoJiRcTARBS1Vs66
	6q1/d7Gb2lyMxC25ROvbsP79qmNZJ52ueejCBv+RQaoXIvuzpIPbC4j830HojCW6W9uEz2PnM3N
	VjkLVp9akXlmEOfH1i1T3Tf7aMMuB+eDfS93M65WVRGyc6zE9TtkOV9KXXCVbTPmv3ymybdlGl/
	20P8bk9UgfiMGQE=
X-Google-Smtp-Source: AGHT+IEK8aXASXk07qexYhvsAde0vZ0pJEgD444D81jkJ1PplRhBIzhtI0G4gtXUjh/qBfrt6nphdA==
X-Received: by 2002:a05:600c:4ec7:b0:436:e751:e436 with SMTP id 5b1f17b1804b1-438dc40d574mr116288475e9.19.1738341437975;
        Fri, 31 Jan 2025 08:37:17 -0800 (PST)
Received: from pop-os.. ([145.224.90.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1e8f53sm4975118f8f.100.2025.01.31.08.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:37:11 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: quic_jiegan@quicinc.com
Cc: quic_tingweiz@quicinc.com,
	quic_jinlmao@quicinc.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	alexander.shishkin@linux.intel.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	James Clark <james.clark@linaro.org>
Subject: [PATCH 2/3] coresight: Export coresight_get_sink()
Date: Fri, 31 Jan 2025 16:36:14 +0000
Message-Id: <20250131163617.1730505-3-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131163617.1730505-1-james.clark@linaro.org>
References: <d5332d6d-237f-4b78-9eaf-2619bd97b7bd@quicinc.com>
 <20250131163617.1730505-1-james.clark@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 253ef02fde12..f31c8477f7b7 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -526,6 +526,7 @@ struct coresight_device *coresight_get_sink(struct list_head *path)
 
 	return csdev;
 }
+EXPORT_SYMBOL_GPL(coresight_get_sink);
 
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
-- 
2.34.1

