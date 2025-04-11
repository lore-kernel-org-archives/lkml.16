Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8440129B225
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370593; cv=none; b=Bbakvmocue8NZD1+XvNlPNt83neYYhKjsm/c6U4/mUv72FUn1UEHXLUCx3s8GVavJFZw0TczoewoxqaYr8CFqcVF1uyzRiWfSZs8OuF6XrhE+GaIP1o4w4fHe+t5Th+JKanhFBBNEyDYE7SUrp3WWg0T0jbXkFLwKFyI787DK5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370593; c=relaxed/simple;
	bh=R0iwPCFv2TxOgUfGPaJWLwsVCF8ZMsJL2tVBboocnFw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dOqGxWWYMVogFltOmPlWaWnfMeAOBtvxMeEs5B7edXdWLVCVnKk74OjOopvQzlvceY4qLYqYlETBnr+UALE+RF2m7z97yEDeux0nAj1BDFy43uliuG0CP0E12j9i1JHyT3ohjshz0HPxXp4ifSTofp4KQavLjAds+H6xAEivmSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gblC6lYU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gblC6lYU"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfe574976so13617895e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744370590; x=1744975390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRtX0Tco56vW4mGmeM52+vQurVKi/ujaJalKa4Y92rc=;
        b=gblC6lYU2VSnj66L1oE5y970o0BVnDWW9SugpEbPK+mAT+OLVaOkfjKtMArLM/kn1T
         6p1629rUonm14w4nYv+rZPBORDU8SE2oUD79czl8C3cGLXG85W7xiwOrBnBZYJINJRbW
         2VGLIUwWhRaM+mLvoTEAHOwdJtnQUZNIxCia7Q9p6D2LtsTVSM9J6nEXBJjwoRnFtptV
         HnYS0ixNw+9oe4HVtXP/raFnIsXAqSu50fk2AESfDlzOWLlpswy+X94rHnU+D0qEB7iq
         oqlyFoqzr8M6Vy06ZA/8jk6JCZcdnZO6Dbpo2Lxzo40t2/31yX4R250CmR/5thkq99iM
         9yLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744370590; x=1744975390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kRtX0Tco56vW4mGmeM52+vQurVKi/ujaJalKa4Y92rc=;
        b=IJPJHax4EIA9AiMQG3XngiHW7URF94uQ6YWPN5WAhXLA5MwpnBoBi8MPOED9aTKZos
         hpdUbz+exTWHFKgUxEimaPzEc43IJ+xAhARZTYm6AMknBttrQ+Fu53FtDwGavOg5tqO7
         22JJm1YxPErwYQbqNM6uMK/fBYAMBswDO3fXYu2KfzRwNam8IX2aZfFV1THnwYWMOAAG
         tU4m4ed5Qca6+CkI6zcO33tqJAdP9ZLyXSgZQT1M5ffGkWvADUe7Cg+HEleL9XKWePsY
         ph98mDu723ggsRYe48nNEb8nIZzFR8QHZpPh3infwE+wKdR/xJb7hUKyMdJu7pupzyOG
         iddw==
X-Gm-Message-State: AOJu0YzhBr0JIJqC+gqMDJAIcbUBZwPUFE8TmhurRTrqFLsMZgd4yszy
	u8dRBK/OMNTe+4ZM3keVtVkgkE63c+dZ4h9E4tzqOLCaFS/JYiLdT0FiIkXqiVM=
X-Gm-Gg: ASbGncuhglmkn5codckN4H1k5WX6rS9HIqjMXIY3lUU0rnWiZzOI7Eto4M0hFTX356w
	FTPRe7AQk/pFNKr0Gmx8OrPj/2ltwHF0gvSsOVfokebmo9BJ61ReAprdx1tyl6VsKw7IPOXurCq
	lRiY/cWkqQGeVbZLKW1QURBsnv4Gjvi4Wh64f31qdkIHUQm7OfAgXH9bRRPZmsDSijYslaKEK6f
	kFCh0PaqaZOsi02XEDnGuTG1yIgNqvG3Ft8GHlEywafIejDV+/sL0X6hhE9ZWYfSRj15S1ZHKkc
	14bwb+aR+qjlBTqQm+f5DBoWl3/A5z4bBtqqL2oEvmvuD/IhuWfPtkB//0v2CtcOyA==
X-Google-Smtp-Source: AGHT+IGNkFaJ5b9yPqFEcs05a+UltmHhnXExLp7SGbbShkuRMHnmhiQWDucH9M2JZEHlO7Z5XF4qNg==
X-Received: by 2002:a05:600c:83ca:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-43f3a9597b1mr23420375e9.16.1744370589724;
        Fri, 11 Apr 2025 04:23:09 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc8esm85171445e9.30.2025.04.11.04.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 04:23:08 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	srini@kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RESEND PATCH v3 07/13] dt-bindings: nvmem: fixed-cell: increase bits start value to 31
Date: Fri, 11 Apr 2025 12:22:45 +0100
Message-Id: <20250411112251.68002-8-srinivas.kandagatla@linaro.org>
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

