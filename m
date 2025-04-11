Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2251D29CB5C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370599; cv=none; b=FQyOqOo09q5IjHOY99aRTIBzezVaaFPCK+ZAB1+3l5kHuw5SLn/fjFHtgDT2lI9vmyh1+DemwwoRstrnE/lj1DtdvkO/NNzkohGYFT/57BsxLHeo1up6qfufiz/OtMQO7h+CBMv8cc7bvPgRl0JmdDXNZEhb+UsfMvLJiDS/7Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370599; c=relaxed/simple;
	bh=dGSufDZev2QnQviFvcBnIsmi07aLyjmsV8qATZd6Sdc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u3faZmWSkwn1+ndxWy+FLsFVYK46Yz/VDQ7witWG9otSYotpW/jY3339uQNiozJ7n/nMIDcQW8oJov8a+VNobZ5FnVUpEZLfax7wOObyIg5Yj26XVF8Ip/cl/z4sOfn2K5rKjR4n2ltEoopxPby9jZ5R6uqNJrmn7zkblDMa37s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V8aJtza3; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V8aJtza3"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso13965375e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744370594; x=1744975394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oljn2yRDTGh2uUzf7dOnwcTZL+reSqVlKX1rZt0zRyU=;
        b=V8aJtza3RrP5k3kBlfdzMqSoq3sD6kzlU9u9XmR7VwTt4CXr3hoxQC62Dt5ybOlojT
         a1t3rSf7O1MIZGveJn5GX1bt0QT6zO5RB6gAIkHzUcZb62IeCLfbgLQq03bu7OcHA9m8
         C4ZtsZu0rBQgGjcKCcMVNRhGgoJO19G7sXI5neh3Ev5YU27MlXjyAzjnhUiSuWfUdn1d
         4QhFDQPZOT9q0zxUS02G6X9LX66xg+7PCkwMyUe583/1jRQ7OdisxqD+0fcW6i2Dn0Tl
         BTAWy65r79dGDqpiUU6eWAleut1p1qW9UZMjyoSDkMuyd4yqhDOSu3ahnPvOjZcMKQZw
         TdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744370594; x=1744975394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oljn2yRDTGh2uUzf7dOnwcTZL+reSqVlKX1rZt0zRyU=;
        b=sR9p9SfO9wUKfnPEgPBgYXgJSQkbCJ1g+MiBoOX9e8mSosAR2bBdwpC6o9aJB4gfZp
         Noin3/C4r7eqw4JAJHJqjfEufLmEQgV769ou3U3xeHNhsCxlTDEW35tNyumxekDIK/4Q
         tfN6nMq2rXR5wpr7vcXYgwCcoVeK0qVl9R7g5YlRvQzZ6hSruTIGh5Hz/hxWIFxBjEs4
         E93kKy9e2qdcxmHRATm8kJjKfLKUVcPOxuX7n9dwE7QlyYhABiO6KhWxhrRgwsMMcibf
         j0PV+fQ/c6inpMnvBpo5w4i9diMugyujSVhcC6o3jF40S8KHYY85jYXqcRrOkLqECks8
         +kTw==
X-Gm-Message-State: AOJu0YznpdE1P7cURM74ktJQRO2/FU3R+ztw40YB+vx1Xjm7HQeaJCxW
	Jmtpn3F6BIOQ4xqsZJ5pjaPfrJsVuglDTJ7j9oZweFNRzscI6MzV8oV02r2tm4oh90ZmDMphpXW
	WzqY=
X-Gm-Gg: ASbGnctU5dEMwJdCzL7OW77csUOhrG3Ieny3Cpln2FR//2SMFitdRrwL1gKU9qk2aWv
	6x2Bc8F+K1xrpMRfANgp+ekUz5SAPrWYlck8mTV1YKZuMZ+cDAZB/9jVKj5w3JmhI+dYic36Bsm
	04FXT/Ts9QrXYGcOxdpdhUfSYha7sC08T+HjP203XiXnwkvMQRbWmnfWmZUxlYKNauI0JjUbXnb
	K6/ii/3w/wrcgCpM99yeozGSq2St0qQS9bX5sEsGOGUunVxwvaedvuAyzL9VTgmuRVf1XvfZy6K
	nCLvOVGZe+BzPRF6FC8S7dgjVwOgAswQAk3PC89c3HPeJxeo//SwqZCil1zM7Q9wcA==
X-Google-Smtp-Source: AGHT+IFO5fGZ8NW03DMl/xn3+V+LMT1h0UNaDS9aMFDgRhDi+MsRb6tu8PjagTSl9BHPzZhuP3cG/g==
X-Received: by 2002:a05:600c:5107:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-43f3a925477mr18588605e9.7.1744370594327;
        Fri, 11 Apr 2025 04:23:14 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc8esm85171445e9.30.2025.04.11.04.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 04:23:13 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	srini@kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RESEND PATCH v3 10/13] nvmem: core: update raw_len if the bit reading is required
Date: Fri, 11 Apr 2025 12:22:48 +0100
Message-Id: <20250411112251.68002-11-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250411112251.68002-1-srinivas.kandagatla@linaro.org>
References: <20250411112251.68002-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
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

