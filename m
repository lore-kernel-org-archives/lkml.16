Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E3F24EF97
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691534; cv=none; b=YURRyE+ytvekV97NUuHU26LeF4g4NYvpNJNzRustohE5jK1TmVzYYc7gBiOS81cqwfm30f+RhqnJg1osB6UveMHCozy1giaENt+1faYo3N5xNfo+WKGtm5isOsOd3k2eeIwEQRGJwmEhOEqQ/PSUeu4T0cfNOQiyNFjrG16ZIm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691534; c=relaxed/simple;
	bh=dGSufDZev2QnQviFvcBnIsmi07aLyjmsV8qATZd6Sdc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QoR9TLX+wjdBrRdDEC4sygwV48UfzCzIzl+cLnFz059tkuu8KJiwj/Hmj9mMe09sX9mOg+2kg6auERNSlE3ddGHZqcmWK9ZZ9yRMxc259JozhMAVjPb/fw1Y3qHHgkJ8YrMYmH8pgJUkE1Q3SQcxmdNhvGaILyCD4QeU6CDJkY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RtN3XgHv; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RtN3XgHv"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c14016868so901336f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743691531; x=1744296331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oljn2yRDTGh2uUzf7dOnwcTZL+reSqVlKX1rZt0zRyU=;
        b=RtN3XgHvE16D3w8nOW9i/ieK87Ieih9JIk5oM0COxz6GCNsfvUe7KMv9F9HDtrf/Zm
         8piWC7pPdLz1/KQo5KruROkCxj+CVVtd046jGCwNjxMmC6dD2NRCErDCQAL1dFCEIDcH
         dU2x5jsqAYDBokRjWP22Wso7tLhoIvd7EiMdqDLLSxGm/buadBMyZ9/jNrtS3CalE/BB
         dZ3WA1ok+lMs9P8/O1XzJa8PuMcKfEDbXfVYwkbxmZy6SwM0gRKDGUl58Z7BRFiXfMdV
         s6EQEzhvTvyeYdEI9v0n4w1hbbIurlqvvDfaqns7JrUSoa42ICwwVFa8y1Divqhi4D3l
         SoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743691531; x=1744296331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oljn2yRDTGh2uUzf7dOnwcTZL+reSqVlKX1rZt0zRyU=;
        b=NRcyECZ3bZVoKQRlf0ZSLfJTlEdnsSll1/EAgHnFq1HlBlt5NuGo4kKu1Z9bwpjb87
         kKLJvbQTpeFwu/auLHu8t/3jYb/K4TVlh6zfPxznNWPn1C42/b2n7vV/1Oz/GUscQyJG
         TkDzvMCQopgxf2lBfrViDEqBjdQ7bGsVSN4bLSo5/S43wHb94bl/Gz1UT7RuXZtf/hlO
         eghfkRuRtFkO9Oe6oZpbHO4PTlaI5Hmu0vHc8yhzbYCmynckhdFiJ2TLs8J1ti1UVZ0G
         FB+o3NyDTrg7rmQ2OwCV1hppYjCBGZZygiTKTQiem6+jU1Q9ONUJuzaer8Xnrn2wjX+B
         NZ5A==
X-Gm-Message-State: AOJu0YzHijeyh3OYAsrlYh1wTpIo6vW6E7HuOQSnGvAclr56K7XuYcWj
	8ZQ7hoGRkXpOLEUETPhLZ/xCGYIkWAwGPP3MxqeYSEKinV0rhkOfQ+sFsuuPp4I=
X-Gm-Gg: ASbGncs/gweAOgS76sWwIVEWM28pNgJjqerWPoRui6yD0u62jZf+QxllPTxNGlztO3V
	DQnyeFcbkqqOWWf2gjxkb7F00RvUFW7IN1F+IgyjNHAcyrI0GJFHKEDBKKnEy3//pj5upTaRaWH
	iIdNLvD9pv6kMbiropBsd52c9tIfFHoPRzi2mn9GGlFvbjTNA/Q6aTdYDUCslsleNVqkEJpmMFA
	w3s2f8lSMGFnV8MNyprrT7nuzwTyGcpF+/wMPl6tVSXnI8OqU0f6x3GctxsZXQbneU5unXviSRN
	4YLKkTLE4L8LvgDFJvLPX1rpJaNiJuGOLEx0vq5CY+Nf1PN9pizArPQezSdQh563mIyppw==
X-Google-Smtp-Source: AGHT+IHnMI62oV6azmODfftBfoU7uF/3vY5Kg1RdVCXDVFbnZivRCJPXwlgN4QqhAODnM3xohthGmg==
X-Received: by 2002:a05:6000:42ca:b0:38f:30a3:51fe with SMTP id ffacd0b85a97d-39c12117a99mr13267239f8f.42.1743691531451;
        Thu, 03 Apr 2025 07:45:31 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d661sm2044374f8f.66.2025.04.03.07.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:45:30 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 10/13] nvmem: core: update raw_len if the bit reading is required
Date: Thu,  3 Apr 2025 15:44:58 +0100
Message-Id: <20250403144501.202742-11-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
References: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=999; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=6o2wzllNpXzhs6trxDlkHyVJbZYKpTR68bXt6jsCi1k=; b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBn7p7jboJ8XxL0UyZ73ssdMQeBJBYfMcuFV+Wn2 kjZEOmMDKKJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZ+6e4wAKCRB6of1ZxzRV N2i4B/9iOLMMFNB4XiTLe/mblgmJKaF80deufEJDCTikFMfY7B3JOb8ML/jjfqotRQCxj2lrr3L WA1fkhBq7PWv5rIiAkYyUEUSxT0s6fRDsM8/XoHbuMmMzFRSfcB1qaEUIcDVuFfZjwAD141guqe 56RuHE9XnxE4So2IoIoRyzgR613AXx6Mq8gKhld5zAkkUmWVleRD+E4VUVJkZKqMSER1rxbxsAy 8hc6oVC3dC9I6RA/YBdSxpOfAUlpCiB/vsYSew7UhCZB2ME7SqS4+AAqxc4RqZcsOTm2DWi0rKK CNdB23epCYmbH+ildXOoiDtPhjXYBPNiGYYd0xBuVAt5IWxl
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

If NVMEM cell uses bit offset or specifies bit truncation, update
raw_len manually (following the cell->bytes update), ensuring that the
NVMEM access is still word-aligned.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/nvmem/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 7b8c85f9e035..e206efc29a00 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -594,9 +594,11 @@ static int nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
 	cell->nbits = info->nbits;
 	cell->np = info->np;
 
-	if (cell->nbits)
+	if (cell->nbits) {
 		cell->bytes = DIV_ROUND_UP(cell->nbits + cell->bit_offset,
 					   BITS_PER_BYTE);
+		cell->raw_len = ALIGN(cell->bytes, nvmem->word_size);
+	}
 
 	if (!IS_ALIGNED(cell->offset, nvmem->stride)) {
 		dev_err(&nvmem->dev,
-- 
2.25.1

