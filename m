Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F542512EA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691534; cv=none; b=X9dFIKudNzCyX/shUGd0jqzNTwYen88AYZ4ykGyXTw6Duyn+2C0Qj83WNVaQ1z6YNsYO6f2xXnru3HzYWNfsCvjLz6LqQzQfvZvQ1Kce9/dsGu2lM0ZiVsQ8lDbjAJ0f1owylpd90ySACN+Bts5AtbZHrRyyIlkTf6ZAS1dAMCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691534; c=relaxed/simple;
	bh=uhHFr5ZcBYSXRZg+1EFSf+qV4LAGtXIShJKYOeyyoPg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c7JwxSvw133HWmVBS49e0S87dyu9+Zqwh1f+EaUK2dVMm2pTPJUuA91xj3mfDVC6HVeE6VFx2vGu1jtMmaIsGzk5ICUiJA+ILEhIx/EtAk5nFyLKKF7G0E01l34AE0sComLaJOnuk5cRsXeLIoKf2iMPBd8gr5oXFxvHYYqHEZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v/TOjytg; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v/TOjytg"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so871216f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743691530; x=1744296330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBbc0AKb6l4hZdbfGv438FhQVfxtFcmRgrMMnsTyw9c=;
        b=v/TOjytgIX3FFlkpIGFG0TIp29EZPJnzom9vKOW+y+m59rbKulnmTXHeRq4qWk1jjE
         WeJnVArE4lq/slMxS9VQcPrbptsJNui4DyFFUB4NomdwORtFRmasfcTVLITzXEirAzC9
         LjsfFpnBqKrr8dBKtUQ3lTea4scCvMDJMu2oQ7Qb/ktIPYdXQDTB4QnxegzBaO+8ahah
         jaXaszcYprJ1QulyVdMUsYVeDrifLGmM99sQFHbR+wX4VPInqVsrGb18lFj2QXlVDwmB
         iLMEc3Ss2ynnWLTCaytkWuxt++JJv/x53avW8n2HOOuy0ZDnQ6zBktLMC6QvUC6GzpYA
         mCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743691530; x=1744296330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aBbc0AKb6l4hZdbfGv438FhQVfxtFcmRgrMMnsTyw9c=;
        b=UgvgLEuGjxRTnl+U1Ap1VAaYuEeznxbDXuJXUScgxWi08S7czbLl6OkVjVixy9pWVN
         ruC/xnD7fRFCqzzsX36OoM3kXMJ8TjL6xSCZhXm01Tf9AkbdWbgEeM7JpdAjMLLJLip+
         Uzg+TiCQnFYnsjwLHuuJeBlKNE4yWHpFavHufNpBAMrAHpuxGsBeGz18+wzsswRLfv4P
         hTjROL17tznMiwnGObjPep39rfJFHFumOmdtRsbQIf3ZtufiwEApwgAjgtBl6zhgFFQH
         4q19pIXBj0STVHwY5TbF1rgZmEqLVatPjB3ylrHQUh6HTfOF/hFQjcnkOq1XicmHDEa+
         lvXg==
X-Gm-Message-State: AOJu0YxpbBtz0v3kGr2soXBnirm4jTiZVsRhjjFTovEiMfn+UslIKhEY
	dCSTnDP0O+4ePd2rZeUDt/RdreIAJWnPjKfRRFXt8ru0ivhCCZjEKFe0uN5S1y8=
X-Gm-Gg: ASbGnculgaRa1mPlFLsAPlagWszelyjh10PMI9lpd5apZ2fi/utGzTlKJjAnmVoixH4
	sSAaWHbN9qMlwA8wEb3EmVVtdTrTjgTOYndrdVuzsl4z/HLlBUV7zqm2cRU26zxlq1wmDohFedD
	aF2wTWapUyT8WGWqY44chC5gd6vN5JiRPBOemCBWwFx+Jq9Jt9ShZdKcskY8SF11zjRkH4/O333
	dcHr2Y8CRJs+ysFhKOvDnFe8uyzheEff/Wav3Y4ItDA0ihtu1xm+w3e6ahI86inxUOV4urd2hXh
	UUeQ11iMoPgZKDficMeX9FmnIlqfKZR9olRPSpV3jrh6itXQYlEyojmiNb9ppZdO7DfZ4g==
X-Google-Smtp-Source: AGHT+IHKNHe4NxRV7kW7xVP47CYRww7kX1PKyAs6zHZ+qXUBuUIW9bJBqrb3jzhopaghvefCFyEV4g==
X-Received: by 2002:a5d:5f85:0:b0:391:12a5:3cb3 with SMTP id ffacd0b85a97d-39c120c8e36mr16844531f8f.3.1743691530174;
        Thu, 03 Apr 2025 07:45:30 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d661sm2044374f8f.66.2025.04.03.07.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:45:28 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 09/13] nvmem: core: verify cell's raw_len
Date: Thu,  3 Apr 2025 15:44:57 +0100
Message-Id: <20250403144501.202742-10-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
References: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=JKsSzG/sjkpcuFD+zlm0BqfW6mfZc8rShFE3F/wWs4E=; b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBn7p7j+xU7dYgwj+icd5hmOJkkWKWoxYggK1RNy 6W/gO1yZL6JATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZ+6e4wAKCRB6of1ZxzRV N9YfB/9nnfwf55Vh3hB6rdKthnNo+YHE4Fp73emOb7AG24GSK13lGR11DP+gNOeeEoYVMUPYJtV 2img86MUlIwLpliETuVbyugogvaDHwUXcpaEWeOflfhsBXpguBOmZuJWVYg1GHkKsNF8LHU2DnV zJDCJyqyrjhzjo2cuwrNSgzYk32GT0oqy2p0I56rxlM0t3qYWFNjw7XkZFqpx4BQV2K0CJb3wyZ DgGs47avIteZUWj5snch5sfQaf/JDSCIZ2XwHiNWgpWDaE/jDZxOGqJZNfdKucRz3IxW6a+Q/Dk 0R7Q3vaUO3MTtsJYc+QGqeGa6gzzNywJw75Ffr+kQY8m0kE4
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Check that the NVMEM cell's raw_len is a aligned to word_size. Otherwise
Otherwise drivers might face incomplete read while accessing the last
part of the NVMEM cell.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/nvmem/core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 7872903c08a1..7b8c85f9e035 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -605,6 +605,18 @@ static int nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
 		return -EINVAL;
 	}
 
+	if (!IS_ALIGNED(cell->raw_len, nvmem->word_size)) {
+		dev_err(&nvmem->dev,
+			"cell %s raw len %zd unaligned to nvmem word size %d\n",
+			cell->name ?: "<unknown>", cell->raw_len,
+			nvmem->word_size);
+
+		if (info->raw_len)
+			return -EINVAL;
+
+		cell->raw_len = ALIGN(cell->raw_len, nvmem->word_size);
+	}
+
 	return 0;
 }
 
-- 
2.25.1

