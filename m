Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641CE26461D
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 01:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746839937; cv=none; b=XbKgyEhh60aAA8mqi9DHqk7B/7xANQch2siJBfEDn1cND7mV/fChErAZVw6412AYz8JFDBfHAFjao/FfMy/yPdEkKuGp09utDv4KspodYzAPmEKGgt0G/Tb/ekV/TvK61pRojXcMhxdlLd2dtaZ0pj+2rOYXWLlWzjLdwOwBVhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746839937; c=relaxed/simple;
	bh=MVFP26o3JRYFN82Czfr3I5Vz03DmDe+QuR/wItUQxJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qz9uPAUyogvNO4eFExxCUwaNhT5MVvgVg/Re3MwJ7V4Bl92yZlMC9V10XbXi4WA8o7x3ht1yqPHE5dIYncq2V2xTJhFP0Nj/4yCYj7ALwQuoRINeFmBuoAZTPT2nsINOCILcoRYAKAFBu0Wg0Cjth0xEU84VmG/tVH4VhPibGiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MheHkrQy; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MheHkrQy"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so14167075e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 18:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746839933; x=1747444733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcbRw7WL1aA35JdPyMCk8b9GQjgHfODnY0TIqzziuqQ=;
        b=MheHkrQyzPmlA4cw86cfaAW1j+PbduiMU1qa+jj5wqDgJ+igMraQJ+5HTv6fBkf3JA
         fHF5pgFMTGTB8JXQxvlO43drbRTbH2WLCdyDlZcpKnyhBxFBW7SQ+Xko+so7jZRueHHm
         nUJdG7oFSG4xOzOwQyGhi/GDDx8XBb3esn/xove2co0OlcZAtXEvIxHIeAw+J4E6D9Rp
         HzC2HOHBeyufvAaKChfvTvoJHPXXjR+W6GMwK9MSRYM1XfF++vMiyeqNHH9QtDhkBkSu
         WCtxj8RInTlX9PmTbt7h/+7psnnm+gA40vomrvTR0JFFSJ5oGvJ9JRic+8Zr31r/jUb0
         5EkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746839933; x=1747444733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KcbRw7WL1aA35JdPyMCk8b9GQjgHfODnY0TIqzziuqQ=;
        b=eu4PAkrDogEQXhRTL4dC5cHS6+9dp8pTGxC7jp5YjiLCM7+SeKvV5myYHo+4x/SAj9
         Mx0lgufPYEPCYTO7m7stZYD86rNhCDlbG/CKSqZ/Qi5AT1RK5XgUoxs4Kpq97f3KeVZ0
         iT4qB2O1y30WUQjXQMx5QW+R3A8R7GqNT6KkMoQa7tYAGM7/2k4pPQirlzNcSGfvpkZp
         hjxDp8eahP2vWAtWUetSx0fG1CsQPDoL2gzeWjOduHvot2izfxrNeRUIGXBHPicTeA/k
         TMw5J9ePvW5/xgMLNv9kfMgWgy9tE1DUCfYytSTJmRlBFrcsrTVDhSLwlV7iVP6vdEWl
         si+A==
X-Forwarded-Encrypted: i=1; AJvYcCVozuaKTLhvHizMWlki7WG532596XemCpmVlqSak3/YznlrdT5Y/j7DNLcqhKkljwKfLwzJtB8Zm/vA+sw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRTNgWmEcADsdjQlRVU/TvbqhapTOO1bgwSQ74woKRBLZF1UbY
	2ADXNFZhXSh/4x8Tu/hdPyzBfxXAEGp6892MwRFJxu8n1ekwedh0
X-Gm-Gg: ASbGncvtDDANJXDxTe5ZNwPFd7UsNLwm6cNMxMSmuyUgRCOFlb/GECfu/+fzeeva4pk
	6OCLEnwE0adMX1lPt2Wm3IyZvJlFb6X1rV9T6pQ1ZGJJXrHO0cXbr0f1XOWboPMHPMP951uEgOX
	IJomBIkJ/qWZTAS4/0TuOQn5qgj5Jy/nWBOIeywetgIC4L+sESeZFU8Er91ioTgqR7ZHwXf7PHE
	/Xrcto78KE6W9ToTR1IFCMtxRMWdd5WuA+GKnJmtBzkQFQp0++fL3naVOlaudjf2Q7w5bRdJiAC
	w3JsTpMa5JbQVZspGpk//oGLbD6xW9M4FyvqpiqQJO+zNDysfDZsyQ4AVbQJvoe+dRjtD4w=
X-Google-Smtp-Source: AGHT+IHslDelJiKBr0u5zFkfUSe0cpcfUyw7dLCX3sH7zQ7C2K0jEXgxo60/V/aqM7KalwC2bIriTg==
X-Received: by 2002:a05:600c:8207:b0:43c:ee62:33f5 with SMTP id 5b1f17b1804b1-442d6ddcf2dmr42021515e9.27.1746839933274;
        Fri, 09 May 2025 18:18:53 -0700 (PDT)
Received: from localhost.localdomain ([176.206.99.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f0easm86967305e9.12.2025.05.09.18.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 18:18:53 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH 3/3] ARM: imxrt_defconfig: define CONFIG_ARCH_NXP
Date: Sat, 10 May 2025 03:18:06 +0200
Message-ID: <20250510011806.13470-4-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250510011806.13470-1-benato.denis96@gmail.com>
References: <20250510011806.13470-1-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define CONFIG_ARCH_NXP so that CONFIG_ARCH_MXC won't be disabled
as it depends on CONFIG_ARCH_NXP.

Signed-off-by: Denis Benato <benato.denis96@gmail.com>
---
 arch/arm/configs/imxrt_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imxrt_defconfig b/arch/arm/configs/imxrt_defconfig
index 52dba3762996..7cc1555c0231 100644
--- a/arch/arm/configs/imxrt_defconfig
+++ b/arch/arm/configs/imxrt_defconfig
@@ -2,6 +2,7 @@
 CONFIG_BPF_SYSCALL=y
 CONFIG_SCHED_AUTOGROUP=y
 # CONFIG_MMU is not set
+CONFIG_ARCH_NXP=y
 CONFIG_ARCH_MXC=y
 CONFIG_SOC_IMXRT=y
 CONFIG_SET_MEM_PARAM=y
-- 
2.49.0

