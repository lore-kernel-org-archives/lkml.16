Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AA328F501
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788685; cv=none; b=Ik6rGVndMvDqmoH8epJXbGreyjkzI7UbqHUVBffFYTc1o2GWH53gCFXrL/jFRjHS30ypXv8J4rwnSkHImyuVJlIbbsvUSFbOOePbs5rCXZrMy+hflCVO78IMAvLyMxLIwkFhoFTD/100rLYdCIdiwF3ht+P+9ZzdwGLo/nCLOmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788685; c=relaxed/simple;
	bh=UzuA6fjwkhP66mADTRQf11cpL/C54VNA/uX0S41rG5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXUXeZQP+8xqwYTTM7LA6l/s0+L88zeYBk9RnbRPJHJFuZPUtWdXVdniSMTyJhaTAiTqWOnYSnKChjB5tIq4YiWfqXiyBXf2tHgYavoLjR5zbmSr6phL/bpceuVlcHId4eQQFtiymvIhAqHQOItuKxdLKYI38FW10mKEqGnzFmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eELNe7HU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eELNe7HU"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso13151985e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 04:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788681; x=1747393481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8MiJZaTLkXXn5poCl8egUQZo+oj0wsGgvhPlEKD64U=;
        b=eELNe7HUu5S63nvKZHh1mwfc1S18tkYn3zXXYEKcpEDmi1pSQcPX+mehFA2t6lSwKY
         pA+KRfaRruw9PiXg8U4SP2VJUiU/s6rgoX7HSRQ4rkoA8E6mOiDCBCHl7MXMQW+fLLbD
         n8CYy5yZqgJhBCeWENoIK6ptptEc+dq4ascZAyLklqfRt1w3laaH+SJVSIdD3DmVSFdU
         S5Ovwu96CKiD+bJvvZApdewNVa8L7C+AF9XPWKAZUKCMsDmlRUR6OR/SeIaFz2Jp7gki
         fRnoGVSRjYzii2KbqO9R75zfxLwHxdNEpRFFUkUbI/sYDlYpluTpBCZg1f2CdMnlti9M
         e43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788681; x=1747393481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8MiJZaTLkXXn5poCl8egUQZo+oj0wsGgvhPlEKD64U=;
        b=q4iUr2QhQr11dts9JZ1BqM2U6Ugrb5CHljGCPAqa3E30QgUYMRN/mTTOHqumLr5liw
         kXqRw7cYH0fO+utD5kAnXVZi0j/nvYnuAy4TRR+hteXAXLeH4DxIdyQCBxRglByaJB59
         713Rhw4Fwy2dvUGc2g424TiOhopKgHlW3l0+gUksgFeNXQS/4lc5kjO8j+6gD+3UNNUO
         9fD/Ni8F12cp+b/dXfG5DQ3XAYKB1OlAsMWuZLVo9GUKuvCFSmq3TxmCAKI2cGixBMul
         IKR7tOetEMuHrnWE137dFfpSHCxizd/bqjFa/WP6jmv5PaJ8ppsflC/QwUVTRTv5gfl8
         zbOw==
X-Forwarded-Encrypted: i=1; AJvYcCXsjf3BpAHbJlxQPd2pAWOqSKAAVYJAHMg1eczx4P+vz23M6XrDmw9QfScRHCIhszQH6LOVviJHHCtT9nc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3T7mxZuyrmweuefBRCLfVwfT1QL+7F38mS20vDzsnzvPEFT6Y
	lU7ceCgN+Z10aN448FcSYJuume7YgH8x9bQEJSjpVzUoR2grYQoIz0sJ7cUst/U=
X-Gm-Gg: ASbGncve1UXqYUq8GpKIkhJR5ac/PFbpgYqO6JveIoY6pYg9S1yW0qFBNGnjM47hC63
	5HWRYn4jRK6K4E9FMFPL76CWXQa4dOSeG+PDRvu8vEBw1WEDaCGap44Nj31id8zVnqlh1HnllLI
	VOffD2LKxyUSSBPBIjEEfJ32EMf+jJkuM507XA44aGJSpsdp48ea1SJforERRF590nte1mgIe3N
	EudGq+7kLbMFSXo542i+XlZb0bMrvor0JIbGT4yYze92XMCGb/+mdPHnHMz5oj4ot/ZYIahCXtM
	9DLFkSAAjH84KeN1SaGzIIbI3n3uw+qMi3LqmJN+5+7G+w==
X-Google-Smtp-Source: AGHT+IH8/NzuhQIHAiiCvtk5klNpsdsTuvJWt/oDUURnYu6Ufz/YNp+rlGVB1mscySmEvgSO0iuJ/Q==
X-Received: by 2002:a05:600c:3ac9:b0:441:bf4e:89c8 with SMTP id 5b1f17b1804b1-442d6d18cc5mr21966385e9.3.1746788681116;
        Fri, 09 May 2025 04:04:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442d687bdcbsm26022585e9.40.2025.05.09.04.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:04:40 -0700 (PDT)
Date: Fri, 9 May 2025 14:04:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] memory: stm32_omm: Fix NULL vs IS_ERR() check in probe()
Message-ID: <a1645f1eedaa9b2ae62ac07feed0552eea75bc46.1746781081.git.dan.carpenter@linaro.org>
References: <cover.1746781081.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746781081.git.dan.carpenter@linaro.org>

The platform_get_resource_byname() function returns NULL on error.  It
doesn't return error pointers.  Update the check to match.

Fixes: 8181d061dcff ("memory: Add STM32 Octo Memory Manager driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/memory/stm32_omm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
index fa0f75e4a6e8..c8de785401f2 100644
--- a/drivers/memory/stm32_omm.c
+++ b/drivers/memory/stm32_omm.c
@@ -320,8 +320,8 @@ static int stm32_omm_probe(struct platform_device *pdev)
 		return PTR_ERR(omm->io_base);
 
 	omm->mm_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "memory_map");
-	if (IS_ERR(omm->mm_res))
-		return PTR_ERR(omm->mm_res);
+	if (!omm->mm_res)
+		return -ENODEV;
 
 	/* check child's access */
 	for_each_child_of_node_scoped(dev->of_node, child) {
-- 
2.47.2

