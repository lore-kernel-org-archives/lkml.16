Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28EC26772C
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 07:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746170523; cv=none; b=OiSgVisq1aoE+vdJzed2dRSQFuBQ7hUK8ArBk0BjjAY9QlHT4UoWPqM2t9EK5qilFkCLQ8pmtAStIMuZM9G2Y04acKpuLNbsmD41pNj3XzFmBRkC5UuC4BVNniGwXluHNMDY8yxCINGVZX892bIboiuoFFdiE+dW/3V/OHPYHTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746170523; c=relaxed/simple;
	bh=DGBpbhXvuQ0xEpNrO0isiwgt3s6etMZ8qjti7C0evdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GP7rNlswJgEDvHYcD0/FX8w2pIuX6cSxgAeczBGnf42pqlAuPtov1TEe3kIRI/VV0N5MjGOHu8v+mPxw91WojRjQ7JdFJ/o7u97yyK8pAVgElzreGvDGVahzXd6pknluT7ZB66CXn8AG44kituV/FJURKcBPNYPfKdT1+pffjfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+D3zhA6; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+D3zhA6"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac7bd86f637so519323366b.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 00:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746170520; x=1746775320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLe9Nl33nhWrZdDvjcJcQXnden9NZdZx4I15zXBAdL8=;
        b=d+D3zhA6u2gRT1ULafZ4DG28fnQ8IIH5GSooq8mPcuoEymfTz66DsxfYimj8iNYy70
         IbiJAJm029dOhIlIgyGRaMXiVMtDFXcqye1wQ/aKSDEkp5UtA+9M05anLnGBal29Gx9a
         4THtWFXxryJ1WQOpEfCfTq0otuvsAbo9jloiaGmEfaGy8Q6pnz5wtkee0qp2eZQqeeD8
         uaMLMmhqaO0WCE16ePln6QhermVK3umVYERvtRPMVL0UtEdb5b5F9N3gIaU1ksMtNwLl
         aFXrHkK3vIY40wjeft9nq5Y+gQtbD0z/8zi41ZEaillgvKH3pW+0Ijr5ShH6G9lMySOg
         5u8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746170520; x=1746775320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLe9Nl33nhWrZdDvjcJcQXnden9NZdZx4I15zXBAdL8=;
        b=aMu4iCIz5fj3XxpfTH7BF/nChJwUMO63T1Iw3AcarLmVN2/dgwCpPf/B6c3UPXuc/g
         sKpc01I3UIPN3oFiB2Bh1VyFm0zkvl429m54gYqpRyN4hLbRCAz3NEbtff1TOKvG5Tz+
         lHhMYazKVoB2KUlIAvzdq50wZVxex93ZmLFTanTPBT1iTFAODwB1gslK+ynGckaVFqzi
         1RP4lQw/pHcxbeAayiTMoCp/XJiE4cAmMU7Egyn1Zvbwcq3Na+ND7+rTpPe8taVN2J8c
         QdaCfK7pBmn/ZvgDjh1k+iQtZursWud589HngSnYrub2P07D0zptpoK24yovUMGDjKHM
         jjCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd4KHQsLfuDBRoJr7dquBySDpQyhgQ6Qm4bhLOBEj6nXt4wGF587Z3VSP6WbqqmXdK+883J1EaljLf/IM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdfBb/gy1gQ6d5eVrKTV1KSsT5SeQHhMDpR67cOj3aoMXE5YZ0
	c6/vJY1wVwirAcNzjDDzC9isTb8Twr3Cg+DQjmArwfEPiVRNNI88yP8S7IeHaf4=
X-Gm-Gg: ASbGncsmOyhyaH3Uz9n1AAXPxEbZ0a6dXHpU+1ACZ5GF8gc6tkSH2lUBws+gBNkCi/j
	p0EnrW07JRo02wvA3D4lz8AGM5HuX+gMZ1ODSuumCMwUeHxjlLeRl6lbBGsF2UVINsCu1X7stGR
	PDPe9AfHGQoFU007CStH7hxuITis7MlCgJJ0MWSMSup0FIaryIQhaJKaAVag3WJuz1b7TKz41z4
	FiudgRNo0j5i2Zx5UYRxwyhHPA6Ih6wqzHhTWAWvn8mz33zzJRr8/TBordWFLob5jzr0HNVd7LF
	ttNJEA3/BTY/mNpW9gU35WwdjcAdSVvZu2WIdzWRfXrGYBuerfE=
X-Google-Smtp-Source: AGHT+IGGnXUM/UQfhKQAG9Tm1E7L6eKCt04VW7CfVNhHGdFuc1+THezAG4bQV2RaqhajC9diCRAP4A==
X-Received: by 2002:a17:907:d204:b0:ace:be7c:11df with SMTP id a640c23a62f3a-ad17ad444b4mr189350166b.6.1746170519991;
        Fri, 02 May 2025 00:21:59 -0700 (PDT)
Received: from localhost.localdomain ([178.25.124.12])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891f3c6bsm5691966b.82.2025.05.02.00.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:21:59 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 3/3 V2] staging: gpib: Avoid unused variable warning
Date: Fri,  2 May 2025 09:21:50 +0200
Message-ID: <20250502072150.32714-4-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502072150.32714-1-dpenkler@gmail.com>
References: <20250502072150.32714-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This addresses a warning produced by make W=1 with the configuration
parameter CONFIG_GPIB_PCMCIA=y

ines/ines_gpib.c:1115:28: warning: variable 'dev' set but not used [-Wunused-but-set-variable]

Remove the declaration and assignment of the unused variable.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
V1 -> V2
  Remove the setting of the unused variable and say so in
  the commit message

 drivers/staging/gpib/ines/ines_gpib.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index a16219c0f7c8..c851fd014f48 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -1112,12 +1112,9 @@ static int ines_gpib_config_iteration(struct pcmcia_device *link, void *priv_dat
  */
 static int ines_gpib_config(struct pcmcia_device *link)
 {
-	struct local_info *dev;
 	int retval;
 	void __iomem *virt;
 
-	dev = link->priv;
-
 	retval = pcmcia_loop_config(link, &ines_gpib_config_iteration, NULL);
 	if (retval) {
 		dev_warn(&link->dev, "no configuration found\n");
-- 
2.49.0

