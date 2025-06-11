Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF5A260575
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749641450; cv=none; b=ASJdyAU+H5xNiumAn0N71wRC6sYW84xRX7xTaZnoiK+OtnoHk3Nkl6rIyPZptPHzUHFa4k2tCvSzQsiUXg1wE3Mw6KykIOyJr3xCP0iDsu/n9Pfn6VYlKeLpxEg1I01J7B17AmkCqIgnduZmvvBszkYedP6tBL2VNakcDJq0z/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749641450; c=relaxed/simple;
	bh=d44pp7bg/0wIIq7z05oaUJ9/FrNJIkkgaZmZ8zOXO7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ettd7AUJXUn+LVSNvqnyThAxinp/bTDg8f8tPm9fgVzy22cdiosUB6MAS3NKfGD0eoc6t36Vqt7r80l1foQoxMxGbc5OSniD7n5LNJG41fEuv3LCO8h1zsEAUQIzNe7A989a/anbkIQwQBZirUjtlLqv6jzpDkNteuMXyz3TmSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QnLMCqXE; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QnLMCqXE"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad891bb0957so1077658866b.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 04:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749641447; x=1750246247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQfQJcrMsIo+AcLVVU2Iyqzi23qikxIRv3R2G7M+wXs=;
        b=QnLMCqXEVo2UxHUNIhBxDhfXy0C/vxPAB4tI9WR3oNTx+H9JO53A98kUYnNIxbbFIU
         a3j+CNjdABQ67jM8Q8EhquGvvedd0adPB4erPrKFthKXrBciwe9NON4juUFTTTbYOdzM
         lUeZEn4YkbvJpLP0ClkliKuK114jd1qJmD7RadRJm/nz006gvayss6CiTZVr2/0Q9gXI
         yOi2XV1uheptzztq9en10qIZ+waqQKbgoK5U2mqhVHSwYosdwt/Fiv1fVUg/681wtR/6
         0iylqkKsZV8TPSM6YAlxBWR44m/JBi+pYshe6MQ/BcC64BCZFUVOD7AsMrVItkKK08rk
         juvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749641447; x=1750246247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQfQJcrMsIo+AcLVVU2Iyqzi23qikxIRv3R2G7M+wXs=;
        b=KRiHJTUhkW7fX9kJCXtEsh7jaGo02ML07vB+lIkd/jidsKudnqYFJX0DQEjxY536Kq
         WK61hsWtwcaDYHxgomj+4zCyBkfYYOw8wB0IIGE1GEd8tpu8h5ZFORJYXafyqElkwBkC
         Tcdn1kwXolIaRoCuVohB+TUz2Ag3kj+oLSwT0hLpJwHY+uPgBhJiMaGhMg9gfl6YIQqj
         eI/17zSzhroUVMRkjldsG+sXPIyisp3E1O0mJ6viWGOakoNzc2ImbG0M4arDqeG+JOUs
         Nkr9NYUlwZYSrXsR/2ayweSyqNxVN9kILreORCcaM5gotBvy+hATqk3XWUub6LGJq/6D
         ldgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkgBJirdSQK75G6Y26fwuajU8kdxKWi92LgINFj44H5zLfURqV44J/2oaD991GGxg/LV7D6HKePxylyBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIMB+fWv/inU6xlBi7pMKp+YbSEK3xACVOcTQsocub4VQT3kJR
	g2bW1iRyHixcB+D0Z1xys3P0U5eEvf/1l+O3CVLAmmYOHiVCdSpsGc6j
X-Gm-Gg: ASbGncsl95oTbbbasRHWoYVySarawQgNzt2/lnOWrWRMHG4lAmjGFFLRp6xGqKJGoLx
	a4S9vEtPEbicOtII2StzZ54Q/TtrPm7zdiMwL4xBfMtmzLHFqc/XMlH4fLUK5fQHD9w4zT4nuQ4
	Q66c+dJxUZqrEQjCwY6ctv6oTgKP37om5u7TU8RhRaBNhY3TIBBx5dsvKPAoND+Ext1qZCFpzBk
	hRNGupYszKWRnYk0iy7EFbRFfsH5MVViLPRnCAp+kthc+/1s7bUDCjnCNcDRxgwaYs3ntMq4xeq
	17Rwmd8+qvkDSUqAVQMTV5n+nk/kjFaQj8wKIhks2tDUtl/Bik5BzS31PtA/ffJdACzMlHFgyNR
	d6V68jKDamWNR
X-Google-Smtp-Source: AGHT+IGVqkQpav6AZSynPjDi3ON2pt10KMqrRL4+tubqyTgnNrFEDCDzjnWQHjGEmF5zvnhCcbKh1A==
X-Received: by 2002:a17:907:3d0b:b0:ad5:27b6:7fd1 with SMTP id a640c23a62f3a-ade89462d04mr271757066b.17.1749641446545;
        Wed, 11 Jun 2025 04:30:46 -0700 (PDT)
Received: from wslxew242.. (11-127.static.abakusbp.net. [46.17.127.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55d6csm870519066b.72.2025.06.11.04.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 04:30:46 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: 
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] MAINTAINERS: Add i.MX8MP Ultra-MACH SBC to ULTRATRONIK BOARD SUPPORT
Date: Wed, 11 Jun 2025 13:30:36 +0200
Message-ID: <20250611113039.304742-2-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611113039.304742-1-goran.radni@gmail.com>
References: <20250611113039.304742-1-goran.radni@gmail.com>
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

