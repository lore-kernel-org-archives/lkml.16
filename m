Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E98C14F9D6
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 14:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749133661; cv=none; b=FvSqvDfbynxns4T8m5sDeZ7RMjYIJl8OgmwUDsYfwz9C/b9XUbHCDBS5Ac7dJc5JFvb/wsThJrbjsRaiRQBVUXiXJJMbAlF1VXs85/BZBPpk3LyO56Sr1dYhQ+Zz+DaK2tiZ4Fn8d0sAJz24Rh1kz6B0DCfkS78eHe+7hxB3ync=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749133661; c=relaxed/simple;
	bh=d44pp7bg/0wIIq7z05oaUJ9/FrNJIkkgaZmZ8zOXO7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ldg80DaDXjAU24HIoYZUZQ8GhAjr5Iv8NiPDzfO2XMS5W6OrvJ7ISFtYuSXMs/4DUQB/FMGbbEdeI01bMgbOIBBk2MJXWZbTN5XQqOtrOvj30xKN48WlA1Kjdoq+JHyvem1n7Ay+DuezsHolB3rTny+pkY9TnUnYWQgHP/LYTyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZT9yqr9X; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZT9yqr9X"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad8a6c202ffso188231066b.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 07:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749133658; x=1749738458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQfQJcrMsIo+AcLVVU2Iyqzi23qikxIRv3R2G7M+wXs=;
        b=ZT9yqr9XJFdsPu66DFZz+b2vknmW808ND7ytveK65/EiJsvzGQzOZsNkSMIeanN0sO
         4LuzqhsE1EhL717PG2OcRweGl8evimmMTaDBo67kjPVYrG8ERRdEzy94Gux1ruKjgsVM
         /8EkDH0Uiky0Pk1b9h4GZbXJXKC1K9/leZtzAu9YpfptA5co+IyMb4/3oa17XTSCSmhD
         qmW0hqQZww2whEuswUihugCK3D0NvLGSXVNx8epdW7V/mJB5krWQAHf9F9lHOiVBEk8H
         assRz+owvp3x1mwy4hjyM/UTiBmOh4R+7GoWMxs0crikHvsuvsHhm4k1L3f70sdZxUJJ
         BoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749133658; x=1749738458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQfQJcrMsIo+AcLVVU2Iyqzi23qikxIRv3R2G7M+wXs=;
        b=XwdpDNeY4nJcD8ByxffrxnLccMiSDQbYWnL84JwKMLpC4oS3IAF7ZOI/XIK0XehB/8
         tQQxkamEESS8XImkpMo3lFgKKsrTTL3isZeAZK0X0irWwiIx5MZozzCXN+ympCy7Saaf
         0fQJz9X4SoEPKC1PGATrL9rsI8ofiFmdq3H92uyRnkKYTEq0J4qUURxxJFI+3jkAiuPU
         HhFXI9o3WOPWaGrBvTVwdwm9CizT/nJlcrR1pvn2XYCXLgnB47A890rjGzuqS7aniBPF
         4AIy0rvmM4qqJi7QPs8Q5hfozzmSn4IImRbyGI5yRKixbBxYQz16wMkhMN2iaOJTnmRU
         vIxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO6xPgXk2SOLj/O3uuJuYDGaw8tCxjBm5WH67FRUsUhYmZEBjNQRPvAsuafYQ/v5/+8+iGVf7VGysPdLw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuFAjDayuNNIxhFz1MYZ/Hjh/NGXFreHykoQf4P1ozMEmxeBPx
	4lYX9AVix9ELqJ04VEUkEWIFiVnlzeqSISKJCs/HPcCgKX1k0NgcEzNe
X-Gm-Gg: ASbGncvi5assYODsnIVHj/RCWf4yOAX/OlwW0/A9u6DweMGGS3UTwK6w4u4QDrf5x17
	OSVG3gtNOi/iCuvnx+VBwQ0t/5As/JqzFLgzdK7UpXJ4Kb6tWfK5AMaG8l5do5FkhYP8JKIGVii
	xdkV7jLVAXhupnbSMatOmvBYxE4QyvCEzpAGSIc0vA7ueQmVH2Cl6SA//OXsZ25P1uVHiAAHLtS
	U/Y2GgwhfIiPOU5GRj5TMQ1DqIFlTvGSusX3HADNuGn0EQ2qFxcQZkBi6+mAqiXKRGPQfmodAsL
	z8HKN5VwwYw4OZCp6xdnPzGbZ+ktuf9aLtXre5ZlIQLl6+rma+o5+Cxw3ny3D0cGpQ==
X-Google-Smtp-Source: AGHT+IFwe5C2o1uAZSF+9u7N6eEltXe4b3nbmDH17scLJ4d9dAAMM1rmb/nxcKD3C/dbzwVJsBft+Q==
X-Received: by 2002:a17:906:dc93:b0:ad2:3f1f:7974 with SMTP id a640c23a62f3a-addf8c9a9f3mr665611966b.10.1749133658230;
        Thu, 05 Jun 2025 07:27:38 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d84e75fsm1259338066b.81.2025.06.05.07.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 07:27:37 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] MAINTAINERS: Add i.MX8MP Ultra-MACH SBC to ULTRATRONIK BOARD SUPPORT
Date: Thu,  5 Jun 2025 16:27:24 +0200
Message-ID: <20250605142728.2891465-2-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605142728.2891465-1-goran.radni@gmail.com>
References: <20250605142728.2891465-1-goran.radni@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The i.MX8MP-based Ultra-MACH SBC is supported by Ultratronik, and its
device tree has been added under arch/arm64/boot/dts/freescale/.

To ensure proper maintainer coverage and notification of relevant
changes, add the imx8mp-ultra-mach-sbc.dts file to the existing
ULTRATRONIK BOARD SUPPORT section.

This follows the established pattern already used for the STM32MP157C-
based Ultra-FLY SBC.

Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 75da23034e18..d830e6709c82 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25281,6 +25281,7 @@ M:	Goran Rađenović <goran.radni@gmail.com>
 M:	Börge Strümpfel <boerge.struempfel@gmail.com>
 S:	Maintained
 F:	arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts
+F:	arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
 
 UNICODE SUBSYSTEM
 M:	Gabriel Krisman Bertazi <krisman@kernel.org>
-- 
2.43.0

