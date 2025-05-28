Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CA7272E5D
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419909; cv=none; b=SdSicsmqyzMi6ZYbCRT6voZDiqLtV9WQI8rLh2ZlawSy+co3QJJL+RCeTYPCtUXIdy9vipu7WrrWZrK36BMZepq0rmTRjlS/+cEVDjMVK5SDb8P+hZPX+SZ+oQ5TiNWfzbymvf1/bGIx8bBw5WiQ9aOtLR9i6CP8aI8+17n6QLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419909; c=relaxed/simple;
	bh=vaHMQ2ZjJxntFZc5U5J5R37wyOU0aE1VASANrNBzvTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V3o1MhNlFCTq2AE4inNz7BVIOq/ITvk/AHcbWnBTUO23wqXmoLibbE5a0xdsRBwjaTEw+90s7GlCPKDyGo/GpKOQxjCHkO5ZeSuMI7Ar5ugoXU+OX0kR92MWKOFAKUGmsCk6inYZH1fMkciofA/FB2WMADZVok3SNoqlxcdjQjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D+zUWDuL; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D+zUWDuL"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4dd5f69e7so1830994f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 01:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748419905; x=1749024705; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z/FCb16iLm7G0e3WCUiTZyQQx/X2uoabvGUpmWxpr2A=;
        b=D+zUWDuLXuCSyHSpEM6Xa5G8GHzw1Fh0FidaHr98vmF0wMx7IPIeMMaEoBqjoTQ17v
         FxN2bnHvAz8Z0Ijsxxi5ffVM7v9/F7lmfi6a63Cmgb3RfTU0o7qSAJIX5HQEWC5L/ioI
         1FhqrHl7h9EDm6+enRbK4ao/QyyF+l7vaiABxGy+3ydVTbaYKV6XoXZxMaaqu747SDuc
         F2/0qhrK6Wjs7khqLXCH/6SFvdDm8GP1z/6Fu1v2gYXF2BTj7MsDI4lo12DWRGHiL9tg
         7Z6G4rFf3vBQgblbuvAdYaDBqpxhbzYOBKg3+eCEtHoQkV7ME6fPFFpN4VoCV2F6SE5C
         kCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748419905; x=1749024705;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z/FCb16iLm7G0e3WCUiTZyQQx/X2uoabvGUpmWxpr2A=;
        b=Lkc9QHWiMK374HiGcZFIKLODgf5XXDZYBwtp/s/RLAYn2wfka7Iq7KWvPIw3qxak17
         IjQqV033ABcDyw9rzKBRxp8IOEB4tla0CuKiYeqsVhaxUSbC9BiltA65j8GTbxaHYSKC
         +HkYKjHJZZPYopVhPTydZPLgKaSla6BsR+6ipeVJ9tpuaMR6BlomLG5gafAtt3RxYK+g
         u4L9rwQSTw7weifmgwbv00/4VCW4txJu1xN2rs9YalAiW8oQTEip1QyV4h1Q4ehEb4ZN
         2GxSL1+JXqSNwywp0sKX0d0PDoNZejmB29jrRVEOnfvv0dWNXJgc/Z6esNLpop23MfdD
         Hg0w==
X-Forwarded-Encrypted: i=1; AJvYcCXwyOvRJZInzvEpR0NhhWBVS2Qe1nikpkFpLfCjATXNBV5wcuIG5PWL/fkxtiBsYxJDXtcxDbw/OUUv/P4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsu+rOQDsBLJzO7NFk+Lc/j1t/LHRXGa+4YISGDB+WQFxkdn4n
	hG8byb9zfwZRO9Zf1yE8E1odidmCYZz+YLBcK9EKSygMahFz85Eh5uhWkyiW4HsEnKU=
X-Gm-Gg: ASbGncuZ+F6CtfGR/oDxn835aDVoKMfyriG3S8TcX3pMMi8nfIxT81Ld7qO3C8Acr5G
	9tIhK00HcqRO7hDlYf/E5M3d7mQWWfRX9B7m0tGABwYvVfi877n5lY2/CaxMnAZhQu/OQkw8T08
	yiCVjLRAivrZsH/IxksWYe4eWBRdUtjlbn3IXEZwEGr/OjX0fVViJ/iK4ffPmmMUw6ePYzV8/yT
	QFYrNb/yzYTtJZZCJB3rZYEVsF87yt0CWppBqu+vqN5JIcYwkAhkpFuTjlHndnYjw9u/Kqw0kdR
	MQVjnz0ZDcjHIRohvuKbDl7MvIB+xLGzdn36gR7zLpmC4H0S/Te9BrPppKPySUf5Jqs=
X-Google-Smtp-Source: AGHT+IF/wZakUcvuphAcq2wGl7JnOIxHt9unsVJgGESVrVbsKufI2U86TIxeSul0ISFVlHUGaRAdxA==
X-Received: by 2002:a05:6000:2282:b0:3a3:6958:88dd with SMTP id ffacd0b85a97d-3a4cb436d3amr13082654f8f.23.1748419905264;
        Wed, 28 May 2025 01:11:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4eac6eb45sm798948f8f.12.2025.05.28.01.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 01:11:44 -0700 (PDT)
Date: Wed, 28 May 2025 11:11:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shiju Jose <shiju.jose@huawei.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Li Ming <ming.li@zohomail.com>, Fan Ni <fan.ni@samsung.com>,
	linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] cxl: fix return value in cxlctl_validate_set_features()
Message-ID: <aDbFPSCujpJLY1if@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The cxlctl_validate_set_features() function is type bool.  It's supposed
to return true for valid requests and false for invalid.  However, this
error path returns ERR_PTR(-EINVAL) which is true when it was intended to
return false.

Fixes: f76e0bbc8bc3 ("cxl: Update prototype of function get_support_feature_info()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/cxl/core/features.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cxl/core/features.c b/drivers/cxl/core/features.c
index 6f2eae1eb126..7c750599ea69 100644
--- a/drivers/cxl/core/features.c
+++ b/drivers/cxl/core/features.c
@@ -544,7 +544,7 @@ static bool cxlctl_validate_set_features(struct cxl_features_state *cxlfs,
 	u32 flags;
 
 	if (rpc_in->op_size < sizeof(uuid_t))
-		return ERR_PTR(-EINVAL);
+		return false;
 
 	feat = cxl_feature_info(cxlfs, &rpc_in->set_feat_in.uuid);
 	if (IS_ERR(feat))
-- 
2.47.2

