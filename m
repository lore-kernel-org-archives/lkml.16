Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ED420897F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744969771; cv=none; b=mhaiP3gW0b1Ukz+puKHeQVZ3QnrRhFTx+9W/SDwzXz1wsPFiaGjrpZBnPjU4Djyp2GSym2utFscRs1t5vGwQpoYg7KecGphUgRJs8qYzKnmxdedurlKtBNDL/uldjK6yDXqcjZ9Dyt1L5oGZkASt7yJJzE1o599UPOI/HRnkTKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744969771; c=relaxed/simple;
	bh=6Pq3Dbsaw91zeezOZl7rj7E4CkNxDlFOD8bMl2buu2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CQOKfFFLutXI/k8shRDAZauXixExXD4Q5EML7eMkvn25WpDxofsKXtc3/dIDPzFDr4/XqRbjzRLHTX3cfLmKtRI3dBrSI5WDh5TYGdxHURN4wZ8QanJixjftwFLI57rkx08UwMvpVxWZuqgQ+P3x3oF/Zgng2QD21A6IZDEzEoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aHCsEGUc; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aHCsEGUc"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736c277331eso2623918b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 02:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744969768; x=1745574568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=94mjTCd5D19GYEOOOc42WJyjuO/cBvrP1r4UDcaiP4M=;
        b=aHCsEGUc69XJMZVU6uYS4/HHXA4Lucy1s9aQwdMP1uSDsKlULA1IMnsg21Kvxr4UHM
         xJZ+KGOZugeFXPUDrgx2LqRvz8sq5kniO9nfLy2gH7R8QyWt+uIMU6zaVPACkDZlHMNM
         RNaN7arciUjpjbY+XB0iQP0oggFLlnvF/hNw2TWfOtxkX0E2mlRi5DGzPBpPb00fJabv
         fpv92W4dLiR2tY7HwMbNg8Gzg12x6xuQzSNhG4pJLfiFrkHrmAcyiW3G7S0Oqj4yCQtk
         fvAMBjAgmvlbawBSUHCtRQvUTajE2xkOwb5MxvsQ2UT9vVJur0UbeNOzqDG7ELS/MFYi
         ayfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744969768; x=1745574568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=94mjTCd5D19GYEOOOc42WJyjuO/cBvrP1r4UDcaiP4M=;
        b=kvC09iMyOYAP7KcyPq8eSYPG/rEtlzkdw21DJqdWU5aVTRS4wLr+VMit6bA8pHa1yi
         3Boo1XWSHj+NCnPElNBgCXApnO2LWnoGIKOo0LvTGw0KX6X9cInnix4XK8LH/kDnj+yo
         Bav3JZZAnfoyLdECqtXqpDVdldoG2UY52pG4/oVk+Lz43m5IefUD06Nm6Hfe2Anf69dI
         wSPL0HraxJ1fb7rlgSk9G40x68PB8HyfzX8/rU8qGhT4yZwj+MpCboUPBdR1rabaHTbo
         /AWp/8meiVl3bfs/zEXJifZ2/mxSizQF1Zk2E79gvqvD+UpX4cdCk9XPCs8pqRWfhXOj
         YLDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPoaIFcurqGhnqB/9PLICvciMO05+fjRlgzjJoXf/ao+QnwQ+rVU2UYKcaJ1HsGHdl1UsnNE82SvH2hQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwOV4Jy8Ji8ztP6QCdnY5E0wWjF6PIloPvJHj/JoS6AU26HVZ1
	NCP2rh6spWKP0YqsvSYPBD+CetPhO18KQITI8F4M4I/WwU49WlkpRvea1G8z1Q==
X-Gm-Gg: ASbGncv2bNkWabTs2ReDRoWvsi19FZ878NBa2bqVa3iRKBUS2PaAAdFl+9v4dKjL1n4
	8K+aiIZR9iWBeiMMB9j7trSkvkkTnDDYfg+21YbJyacne3fS0F3najM+hfYPUnC8RYslKywXv3u
	6lv0LuqjfMw/Mdn5jC8VQk+4tIWuacwj+1Zh0Eap1x0mmquVS1EpMeVidyv/ZgFoJ9hQ+FT6whH
	bTrgF7rlyiswYM29J09UFxovJ2XFf4UF1QGzCD7f9Tnu6uZmJlZdjxiVBqz+I4PvH/a0x8AYyk8
	gnQ+4i3SE/We34tsLLP/WQ+E56DeIzyH/LJSqdnpYka2YjQLBKGa
X-Google-Smtp-Source: AGHT+IEco0sKoFDRmf6mUfY5e0OyAEg6+5tFe/Gl6VeKc86avVTKr4g6pIZxHkWblne5PixuG6TsNA==
X-Received: by 2002:a05:6a20:9c9a:b0:1f3:20be:c18a with SMTP id adf61e73a8af0-203cc60880bmr2607193637.10.1744969767905;
        Fri, 18 Apr 2025 02:49:27 -0700 (PDT)
Received: from thinkpad.. ([36.255.17.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db157c783sm1079830a12.77.2025.04.18.02.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 02:49:27 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: bhelgaas@google.com,
	kw@linux.com,
	lpieralisi@kernel.org
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] MAINTAINERS: Move Manivannan Sadhasivam as PCI Native host bridge and endpoint maintainer
Date: Fri, 18 Apr 2025 15:19:02 +0530
Message-ID: <20250418094905.9983-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I'm currently maintaining the PCI endpoint subsystem and reviewing the
native host bridge and endpoint drivers. However, this affects my endpoint
maintainership role since I cannot merge endpoint patches that depend on
the controller drivers (which is more common). Moreover, the controller
driver patches would also benefit from a helping hand in maintaining them.

So I'd like to step up to maintain the native host bridge and endpoint
drivers together with the endpoint subsystem.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ce2b64f4568d..ed035c9b3a61 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18631,7 +18631,7 @@ F:	drivers/pci/controller/pci-xgene-msi.c
 PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS
 M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
 M:	Krzysztof Wilczyński <kw@linux.com>
-R:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 R:	Rob Herring <robh@kernel.org>
 L:	linux-pci@vger.kernel.org
 S:	Supported
-- 
2.43.0

