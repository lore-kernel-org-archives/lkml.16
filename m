Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911D2250BE8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691530; cv=none; b=hihe8UVir2BUOhdZ7J/AeszyXGbxsR+u8Qrs69Wizh2v27oGUr/8qa+smUjZ/LHKonCaOW+oCfCM4MZk+dMqhXkW21akQHUlHqzsZ20nboBv7YXnKWuXCo5fKywWOd/CXUSfPJsRSHil5Idxlxn6kyAEJpFNGF9eE3FKeywPJBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691530; c=relaxed/simple;
	bh=R0iwPCFv2TxOgUfGPaJWLwsVCF8ZMsJL2tVBboocnFw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OvW2mxi565PrgEPlp/n+vJm3prxvbYBGtcq6Pext7FsSuV55A0oqtqg/XxF5IY028DZvit4kgb50VDSM5TCJK8XueguDZIH4F7rwhWt0RS9GMrm9s9oXRTHVDLHYmB9wboEE00k1TpHI9Gr3V2rcEhaO8+WNjP0dFR+jTOnxLcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F+mmxHXi; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F+mmxHXi"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4394036c0efso7109065e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743691527; x=1744296327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRtX0Tco56vW4mGmeM52+vQurVKi/ujaJalKa4Y92rc=;
        b=F+mmxHXijYzHYvhWb3cAcSTUcu4N6wnBWHaQBwUGho0RDJ/6izoCh01xiaynvzdlA9
         ufJydzks4AH6SK6ACp93t6TYVOYol+NhYrLkAocqlbPV/OMYxLQ9XLL51Ex1veR449zz
         22iTMKB9T03Z4yK69KrOddQfjWhrmA5BB91uR2ypDy2V9YJBl+/RsPPpdzr3XHvi0oGM
         MXME/WIevj2ORAGx07bJhptV5A8FMlEU+w0dQNqFeArdcstrXyV/9jPjzNcnclYgrP2h
         p6354xRDWVG4B0V6hlRfaYPsgA9yDneiEIYwWb0kyiF5Q3/fLLML0ybFcWUUiVz4xA98
         82uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743691527; x=1744296327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kRtX0Tco56vW4mGmeM52+vQurVKi/ujaJalKa4Y92rc=;
        b=oOjgjjPDW+pGznUGf70mqlVgY+ce7LpSyCBoO4ajOSwu3ZulHLkaUfOUTkMHxW6NtU
         wuOsNK6QTLXgZww9SQxQPwi4nEDqxIzJC4MmUucjgeOlCzhTLkkVQAxnBhZyETr+mTeV
         4NUq4DcERr4gvMfwbA+sCDyX/LIhAVJuTcG3gHCZWTe5/CXUTwxDKfxRHkVrFotOjGUG
         RL8vL4P6/G4fLGRpZv1IXsZKaqsQDDntZTwyBZoNl4zzN+ihtK2nHMsoQXLYksYqpizD
         hAuMR6MM+FG1Xj54DXEdd8ooUKnHaCBO9oPg0TJVgMIhdxzb0OKdUxxCkAVizv/3T9Mh
         jTnw==
X-Gm-Message-State: AOJu0YyItNM4Ejpz+t/niQx0c/GZoNLYqWoz4ZqWeXMi0OcO0SxlqliC
	hWyyS2DOqa5p3Iqfpf/GsJ8w8LE1Vk49hXFpN5VfNaNVcvo67qb1EkS9vaLoI7eK+ACUee66v1N
	N1FE=
X-Gm-Gg: ASbGncuazz+Y9A6dRZVnzqEJS3ULbB05cD+CxsdZhR2aD44O5Y2zhSGP0lih9bpKVNR
	dkAVH+1qQzj1gIdH+zbXEEslW19NAlS6ZwSQ+4vgn0vZaqc3nRZS7X8Utl+PeR6CH0Q0KBoAGZj
	16IIH1LEOnB3zDfBbuVgziuuVw1tm0q6U/9sST6uwyBjSplqyPnGgDwboGxlK9NunddbwsfkCTr
	9ADcj2P4/0/05WwJHuOX/RtUoTwdddrO9TZ/DD0J/xfn/cTIVFfzZORlNJLU+EO4ArBhjuSrWx2
	IUtRy+Pm1svrwjUv7vWlop6TiulOA1HdT88BnoBQWLaOCX9lklD8Fa1uLzMIKwxZQMoXIg==
X-Google-Smtp-Source: AGHT+IGjtFe8WV4yN3fO3CrpBcjlBg/YgYEHtyK6a5IuJ7McZivyNaJsK/qztkjq7apOuxidtC0tRg==
X-Received: by 2002:a05:600c:4f0e:b0:43d:abd:ad1c with SMTP id 5b1f17b1804b1-43db61b3623mr179312165e9.6.1743691526896;
        Thu, 03 Apr 2025 07:45:26 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d661sm2044374f8f.66.2025.04.03.07.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:45:26 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 07/13] dt-bindings: nvmem: fixed-cell: increase bits start value to 31
Date: Thu,  3 Apr 2025 15:44:55 +0100
Message-Id: <20250403144501.202742-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
References: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=vvMLJHbQfUn7pa1OVJZqJEDv122+kRbgZS1YYVxpPyU=; b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBn7p7jsbTHVoHKZK3CWDl2/UfwjN0TVxhNXstCm pNyqWWbYtaJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZ+6e4wAKCRB6of1ZxzRV NzD5B/9gorefTV8mgehglVpujy7FKwBqStPg3LZ+oXDzlKYIkIaIkpsOhzRtjQp87oMXnGIiwww yMUVL32/uelu7/0juhUO3ZTTIBjzWvKMgt5SFRjbnHVWOMVeBx/zpGjb75qjoyDfV1O1I7j9vmo ANj9z5Rk+4XGpdv7/eOaSlOpgfrzUsGquCXwzbiV6p9CxA2JT5bo3tv6vtZ5rzWDjLI5yI9euS2 5s6lEET9uGvvlTi5RsmUQJp7cHZjzRonsXhGNGS6fNbsPdDuS3buOUng+efcw1/tcp8rUJhV9aq zd/E8aJfP8IiLInnDf3F0bL7C+cl/SeUCfggWL+JcKVlxImD
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

If NVMEM uses a data stride bigger than a byte, the starting bit of the
cell might be bigger than a byte (e.g. if the data comes in the second
byte of the 4-byte word). Allow the staring bit to be 8 or greater to
reflect such usecases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
index 8b3826243ddd..38e3ad50ff4f 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
@@ -27,7 +27,7 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     items:
       - minimum: 0
-        maximum: 7
+        maximum: 31
         description:
           Offset in bit within the address range specified by reg.
       - minimum: 1
-- 
2.25.1

