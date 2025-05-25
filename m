Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6AB265CB3
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 19:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748201180; cv=none; b=ONYqCP1MOynTam57vtLi5L3qiwJgvgqf5llzWpHqzCViUJ6DB4TA517Sww9zXB+E5cLWnAS3OZTNfjsqykMkMRJhZc2oWcf8ttMOMaKzR8Ox4wmYp4HxO75S+acR7/Twz7i6cmi9BRaVXldgHz6U876gheQdThaka7YjanNRXek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748201180; c=relaxed/simple;
	bh=Sm3IbikRxGrXe/Gygal0RcvZGGE5Vm9xAe0Sy1mv/PU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lZI+med47snBx/w2xv+F7x/slcl2dkvjg/5SouohE9TsoXNgQHElyfJx9mEL81W8VXF3wesKz+D+nR5/ylJjZukbtvYnir+Dbl24LFgt9m/AkfqI2gbpLD7PTj2nYFx9h4uF19FpSWcjrUWRSFlplFhxkccNFqtZR/su55gT4/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hz2NPo7V; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hz2NPo7V"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad55ded6e84so50180166b.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 12:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748201177; x=1748805977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+KYB356hjRUGEK2kucuFd88ZkvKFuYQT9LdCpggTLBM=;
        b=hz2NPo7VQc448cohplA+OqzluFFWBW7IRMe5yIzDEBHFDJTiUUZSX6Fm87UxX1iEzW
         1jKqdcC+7js1CF8s6k0gIsz1BioBYITpkbYnpLql3NZTQoKIdwR9YLsCNRKGmyM4SwG6
         /vTpdyRaXkpLWe5PxF+rRjM40VYW60RYBV0RMGddsSGvWtXBt4cy0Dpq/cARxsgVV0/z
         4lSeT7FImVbFJnBZj8xZTr1I36yMugHYGxj5hZdgnJieszLYXRZSrMP6T7If4wYitkWL
         VstyaIULchtp6mx1WiM0aPa74UINql+UkHKxFejp72dydgHZf3aIuCucoU/RzAk2Yo4+
         MWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748201177; x=1748805977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KYB356hjRUGEK2kucuFd88ZkvKFuYQT9LdCpggTLBM=;
        b=QKi4INO3D3FjiPMESSMsazH0FdT/zfjpReUJMw5dO2nXEs5spHF9fN/dR6F8sUh964
         JqwijYxxz9cLHjL+gVzjyr3W1UsTwj4ABsDKQnigRbmaMUVCy60HVmVa7K6t8nWzjq7J
         LOSMq7S9B5xJybZ5V7cykmsJ6dZzWmN5ogKukyu9rTP6YSymGe+WVEA+JDk40ZK1hAzc
         g8Jt719u7Dq+8r6DCiflxz4sbo3TcFxL8RkPg+ChJ/bydiSQ7nwugjOfgwxJ4nv1VHMD
         8afHvwD+1TY1AdiN8hKe5CdojdG+zvGeqDErSKmqUYRTFvuDDy2MC8I1SjC1GN3KqTIa
         knLw==
X-Forwarded-Encrypted: i=1; AJvYcCXDQDfDSPjEGlBaUzo4QIrjHWDNke144CD3AQXzGr6MKRCujl32L1aOQDfNnVoSzlM4sBnnYaKFKUu68E8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCWC6obSDXbM1agigrw69Z49RXZN3/hm4/fcxRQSufGwcvyz6p
	/VmK7oiUbL+/aLhdc0xoD3xv8G1brvJRvzWDwwV4dOkrTvRBBGGXMdvy0ibTpaimYDM=
X-Gm-Gg: ASbGncu35UfdspEiamj2ftOq7AMiS0hUAfnPbQByPMUp6QsHcpXDPvso9N2LvhYR2z2
	7YHc4YBbbTF4C6ovvSZ9P84bC8dQ23zVNFLOUlureJ/sqW1gm9uR4WsIgWIqh4zReKYnsyS9GNh
	wg5LvVMFxmf62q/8Z7cLyOej6ZoiA5/rV3rDpRhqkrJ6DjF/CWZALTKvyjX0ClT/LXZoGfPQlu9
	WQ4Nkpq5yqXTxI7373r7MLDiAXvgziHjRjaLuchGqNmWbVlwCElNoMm838z4/sKIJqCg0BSDozb
	lQYW2Z/+GofsxNYekwkTtIpoWcUf2FfShtRcdMWVqelRc1WaLKiCzOcsKjDBlqWri6vAJuY=
X-Google-Smtp-Source: AGHT+IHkuoLwwomZCcsBErFL19H6yB+kPnlaQoi4fKoMrOde6G8mnghCGbbT8/M/SSHBkWuXUyowgA==
X-Received: by 2002:a17:907:2cf8:b0:ad2:23d0:cde3 with SMTP id a640c23a62f3a-ad85b2178famr169938866b.15.1748201177180;
        Sun, 25 May 2025 12:26:17 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d047738sm1578899866b.19.2025.05.25.12.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 12:26:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 25 May 2025 21:26:04 +0200
Subject: [PATCH 4/5] dmaengine: fsl-qdma: Add missing fsl_qdma_format
 kerneldoc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250525-dma-fixes-v1-4-89d06dac9bcb@linaro.org>
References: <20250525-dma-fixes-v1-0-89d06dac9bcb@linaro.org>
In-Reply-To: <20250525-dma-fixes-v1-0-89d06dac9bcb@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Vinod Koul <vkoul@kernel.org>, 
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1062;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Sm3IbikRxGrXe/Gygal0RcvZGGE5Vm9xAe0Sy1mv/PU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoM27QW6O28ENwDMIgLoVAwIdJvteqy1tPicytR
 BfWmJV0pSqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDNu0AAKCRDBN2bmhouD
 17GRD/4v8X01UCwnBhEJ/X49zBCMCGI/MAbmL54jLi2/WSqphrmRNW0Y4KOAyfaP9EuJBniGf73
 bjAlg5nd0qIQrAtppNrjr+IKB6U9yrEKuSjCg8/BwmBWQdmHZ+TvsEXkYYr+SSvSo8bCSlS5p+Q
 UL897us4/f7Zsv3lu7YjLqd0OhGeAwbnncLzAHWoyLzqemX1aWGVSHjz1SBoi3LCWCGWhOGG+RY
 SSeFxSUJ/tEfpZAqJqsXIcJhjBiJ6pW3WQ/3ZJvbhSjyNwsLPZwOaYFJwmBA28D8EIplIHpMosU
 O376GQgalZqkfotPw1w8egRPis/R5P64XDrODtY6EEC7YdFCfYQSGO3/HSS68P17DtBGxw8Gc2S
 Jy40O38OT4v+KyKpMAMDGVud292G1lfseiHQ+yXSDPytfxjR0VC6w73RbwzlKf6GLoLrFCciYJk
 6MZji3NotdKEFMeze0mFxCaBL7lg7PA4qFcCOMRGcpIyFF8b8HobyXdOeBt0ghbidlB3DlB9w4q
 XOhc6Zd9zfTlbtQCmhEFcot/vAVdQ7WOxrQFsVoW+Wqs4jEpOWxy+3VhvHwma/qH9/OieJDuRWF
 SvB7jB8N9pNR4k/tbBxHj1v1R4ttV8RkYRlx3e1ZhWoje3ylFkjogHxNuS7vcy8k+gXKywoEIaA
 MK7VdioVfAQsNBw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Document '__reserved2' and 'cmd' fields of 'struct fsl_qdma_format' to
fix W=1 warnings:

  fsl-qdma.c:169 struct member '__reserved2' not described in 'fsl_qdma_format'
  fsl-qdma.c:169 struct member 'cmd' not described in 'fsl_qdma_format'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/dma/fsl-qdma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/fsl-qdma.c b/drivers/dma/fsl-qdma.c
index 823f5c6bc2e1a5bc5e30ea7175bff31e53ff8744..21e13f1207cbe6e82a45c828b93edcadf88b52d1 100644
--- a/drivers/dma/fsl-qdma.c
+++ b/drivers/dma/fsl-qdma.c
@@ -148,6 +148,9 @@
  * @__reserved1:	    Reserved field.
  * @cfg8b_w1:		    Compound descriptor command queue origin produced
  *			    by qDMA and dynamic debug field.
+ * @__reserved2:	    Reserved field.
+ * @cmd:		    Command for QDMA (see FSL_QDMA_CMD_RWTTYPE and
+ *			     others).
  * @data:		    Pointer to the memory 40-bit address, describes DMA
  *			    source information and DMA destination information.
  */

-- 
2.45.2

