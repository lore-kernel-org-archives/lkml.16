Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CB425A631
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 19:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748201174; cv=none; b=rn8/9jqFHuMPegrVbH0a9wV8uL3mLeudUIjaRB5BYJkDy3gWo76gfBcGUBbp7YzN1xddXaP8WxENRysoBZkl6fKt8onR3Ii/r7ZbgQcDEKbWQ4mb9HJZ2QzB6+OZTYpLlUEsr/dn/aEaQkj6dE5pZAKKjeOcVChy8/z1qbY5FjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748201174; c=relaxed/simple;
	bh=jE7IlBQlM0F3rIIfVaJxXemnfRPX/+Oc/0OR0K58/Tw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TiG/pzyRa4KeQfav9wJV0PTfFoZJWb3fBhruXbFNk3ySq/lySdt8xQ+CCM3qemTJxSk86WTHPj4KnKnIrnvATInFW4O0HNMFRO63L7z47tZHXBgbJiqk4IGrf9JAshtkjjm7cEza4zRUlw6go4ngao6eyuiwXVkF0kMBV/zQfDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r0gH0rhG; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r0gH0rhG"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5f6f86580ecso347343a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 12:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748201171; x=1748805971; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eYX2VxTDW3I8LwPElWAPGFQp/0/pEA9CwguT2DQks9Y=;
        b=r0gH0rhGMr+1FVNQ68Flvrf0W2kPz0akxB3UVMJtJbgWWQK8qP6SxMqKHVrmIwgj7k
         HiOmPnUWK53GR5jy/wW1lp8BcMc1BOowSeWuRfB+7aOm+i0r6d2pfvia9DtYPnOp9Wfm
         ciUiq86UBte0Ro19dtLG4AwNJ+Hwk5GDyDFqK+GB4ss/kOdtQIiqzxLpNP1SNy1FPluc
         YytPbes7tpHvxpIxrh2Wq8NZCafk8RmvPToSWnqminbp+og5aiPJoPXI67D42Qz6HjkN
         3JyJKPUmRrKULsOVp5xRUxSZU6s/jCvOpntd8wrw346lyGlyMvdpiSctkeAiq6zMI0ng
         Cn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748201171; x=1748805971;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eYX2VxTDW3I8LwPElWAPGFQp/0/pEA9CwguT2DQks9Y=;
        b=GW7x4LLKclQFsV7fLbvABSAJLz9Jn82jEBkzkbUu2hm2LHmNil4EgBRX8Ep6jBXGYc
         US4/XE4a+GSvrHTjkxajtcuCpE/cz0iLa0Ttg8FhF1sSUhWourGw09UKO383672+j+qe
         xXRLPX9FGBW7aANf3f/jyfUsIM+Y+kb8fCd71gJ6uNazvRlK8RQvVU2Zuwm4y1ZKHKrn
         mqyAhBv2nBxd4SD8CZWUNcVV2WguAld+liKrj3BiFU9QWndAvcP2ejrLuA3rWZWYh63W
         Chkv6nC15ubrbLSFyz8HUg09tXyFQbKp+dZSv2IEQp1EZhWf6D2iiMx3coQOMKPm07ty
         DPZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyEEi10VPaEGaRRFmRi1Ue8xmOIwZNGf1c4a31IziNTB+ySVK63MUDoTAVqpI4XMmY8J3LdORDY8+3I0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTHquBtp8nHlQEDS6mNp9+GILJT3k2aEh+2BL6wLfxO0MBQRzT
	ueIIZHxqXEq7MdbFbs4IbIo3SmFfLkfJmqWlPK4HYXF+fW0Hysw391tL5vxuXsjlM+0=
X-Gm-Gg: ASbGncsJcJlhXwasb2m86zdZUXEfEme1gPv0ohkGbYuFwLQ3OpQRBZ8HdPZ+vo0wBoo
	O304eyHFrPQtKUooGlDWkSQXLE2wFaXk1okUiNk/ilP2RTcPDXZ3AHLybWOAKUIZjcXxbsHzdBK
	2ElOTp4m/2OkGSU3S06bXW4PN70R1Y+H1syUY+UE98KvhuRDRNrg48v1ELVgZcorNPAg9vivqLP
	vQNe2jr5oFpM/hErD8mMELiunnFUaT6F1X5Yo5Ilfoz75/NdOrljdOPVnV6TCIwYSQaD4+FPjjr
	I+OCxyb+J+y4B/dUk8YLcaG7iqxnNr4xP90oa33nYQ3WiONLKwmOYpd3B9UJ9OahPw/KbWk=
X-Google-Smtp-Source: AGHT+IGY5IBd1z66/du4TlRG+M4D5MbhMOYD3sYEIBAG5BcmYK4WZDTuR9Zx90TCb9Ox6R+6iJuIjw==
X-Received: by 2002:a17:907:1df1:b0:ad5:2b38:aa6d with SMTP id a640c23a62f3a-ad85b2ba866mr163136166b.13.1748201171003;
        Sun, 25 May 2025 12:26:11 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d047738sm1578899866b.19.2025.05.25.12.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 12:26:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/5] dmaengine: Minor fixes and cleanups
Date: Sun, 25 May 2025 21:26:00 +0200
Message-Id: <20250525-dma-fixes-v1-0-89d06dac9bcb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMhuM2gC/y2MQQrCMBBFrxJm7UCMDEKvIl2k6URnkVQzUQqld
 3ewLt//j7eBchNWGNwGjT+islSD88lBesR6Z5TZGIIP5CkQziVilpUV/UTXnDhRDh7Mfzb+Hab
 fxoMbv96W7McIU1TGtJQifXCV147/7AXGff8CnALkdIwAAAA=
X-Change-ID: 20250525-dma-fixes-0b57fcec5f20
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Vinod Koul <vkoul@kernel.org>, 
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=962;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=jE7IlBQlM0F3rIIfVaJxXemnfRPX/+Oc/0OR0K58/Tw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoM27MQSnocEls/HhQypawyfu0BaUs0u0+VFH8/
 /LERg9+uXGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDNuzAAKCRDBN2bmhouD
 1zf3EACNIKCh/Z6bW2K+8696jp9c86f5Qs4KVSWacPTu2cHmrNBJIn0WXa5/WYZcbiC2lr6sBaK
 k+VkqgovuPRqo9KI+SX9nkZlYDV9k1qyFvTxznPWnfgkwYi8XK7Dn9+OBE6Arpc8PKM/AtHONXs
 NWHz/Mtti04KKnhOfalOUfCtQDoHvlMhpzQlSczCdyWVLT4EJ8tjPkWkAkhjUI+bpKhafYzDq2X
 IzefUKT8V0k2cALakyGpcCIwbPsMksym6/Iy8yr6Ie3hA/g6hktIK+AUrEOGZjUIPpikxeFSFtY
 hyKyE6s7Bz5HqDqcy1d9NrVSeVZJaIwStYfPuHKy3c4E2o9ZqBPyftfQPwAhR93dkamRFWTLCKf
 /DAVoPB7vI5ao0CtQCW3Sf7dCy5PBhlpK9TiPYtssm3isdrxuGMOzUyAfxYHfsNZT35G8hlUTlW
 /tmKhhniJazrUly4qWvzW9WMUU3Xlu1e5VthTvRqYfxHnUHXpVGIwn8A87nqm3ZIiZS5RyaOjUd
 U2BIg8e/2eiL/rf7oNg9iF3+hqTRpOQ9FSHz274Xf3GTE/Oz9Cq7nKxo3K6hnbuX6ZDgtWsB6of
 W01lh05oTYSiFRn8fVKSnfx19Z2BX0INqDhjcCRr8KTuH7PyXHMqnhtS2fhH+cBeT+QseEBa6Gh
 YNKMsau1w76OABw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just few cleanups and fixes.  Funny thing that the reported cast error
I fix the second time.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      dmaengine: dw-edma: Drop unused dchan2dev() and chan2dev()
      dmaengine: fsl-dpaa2-qdma: Drop unused mc_enc()
      dmaengine: qcom: gpi: Drop unused gpi_write_reg_field()
      dmaengine: fsl-qdma: Add missing fsl_qdma_format kerneldoc
      dmaengine: mmp: Fix again Wvoid-pointer-to-enum-cast warning

 drivers/dma/dw-edma/dw-edma-core.c  | 12 ------------
 drivers/dma/fsl-dpaa2-qdma/dpdmai.c |  5 -----
 drivers/dma/fsl-qdma.c              |  3 +++
 drivers/dma/mmp_tdma.c              |  2 +-
 drivers/dma/qcom/gpi.c              | 11 -----------
 5 files changed, 4 insertions(+), 29 deletions(-)
---
base-commit: 781af674a40df73239e8907d5862fd6fbcf01a9a
change-id: 20250525-dma-fixes-0b57fcec5f20

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

