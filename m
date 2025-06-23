Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600AC29CB47;
	Mon, 23 Jun 2025 17:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750701424; cv=none; b=Vq2vnkJ5jrMB8omAo/EvGzBp2Ck7zWEy4mHpL5ULZEKZusHOYOh0iIj9nFcNbstWKDcCGRItEOZosA9etVTN7324KgxXFMaKTjPYxUTOKQPMWbNtmOl2ygn38cJNQkBlUBDqFpylJ0tT1lmFZSdxSXTNuW1EkwajsBGOuPVebWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750701424; c=relaxed/simple;
	bh=iqi9+lFhwuVbsEJqB/2U+YkRVbQ2OOdsUUnDDZxkbY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E5Fbz/SaXah0RXZGDqjdFFc6Qd8P7wGudISJ/vKtHbFINqH0BUwIGGhLxd47+Hk8lLAxFccWSsU/WC5EOwg2gPzV2Bk9ZElJDPVKETssWbBkG2YGcj85aU2gwixPgCtNoGwH0ighr08Lo/MA/ed9WoNABT3VDL+K6qo02LxOPHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/z6tlod; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/z6tlod"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60867565fb5so7448740a12.3;
        Mon, 23 Jun 2025 10:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750701421; x=1751306221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wV1xdbkNsJPajHeiS4I3l8fMjaxYCyZUEva8YqrT++4=;
        b=U/z6tlodahtBFqD8OI9Rnshkv79+u41fagPebvGuaIa4HQCb4GxOv8DeG/6GES8bO7
         vurH44d3tWZSTjV8cQoQdot4DT5ltiO13rx6W4UYIa0W3dPuSA/HT69TbdBJ2rALXu6b
         1PuAUB/XlLlFLLco2z/waiRUIw1AOOCQOkxXNHD+n7y5IGKI1htWoUyO/LNIRvWwm/0x
         7CLxlObAmXtx5lkuZ7tWZiXqzvl+rbhJz9j3Q4GUrOl9KfT6fnIEtTM2z6sQ7kWCrxSR
         uRy8L8S1EK0mdxVtuNCcHWIetiXBayN576Ior/QhxRR6jXnEwJAEPFEef2GyG9KyywzJ
         e8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750701421; x=1751306221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wV1xdbkNsJPajHeiS4I3l8fMjaxYCyZUEva8YqrT++4=;
        b=e2cGGe+w8/4K2+AVnqu0hpeQJ+Mn24WFtwitMADPwXkKZNdSFNHzI4B0yh3u788ZRD
         gNa7KpgTtKXzoG63soMwZd6qrkdwTei05FPK7RULgFgdw7QImCAASohbqzDBQ/Oz+lK5
         UpMJ7zsKs3Wa+rMPEHaunQwUYCV2hdKpTHHemumMoeokfelBB2y7V1WyxYUNboGcRd1Z
         fRuotQnv3iKRd15jsdToyBhf19oi0YNIJ1DK8K+DXmpRGHidJEb6Ij52RWrLC2csophd
         p3zMJ0d0gbhsTJlCxj5hwO0PifHeP5xRkGps9jiv6bEyYI63KQq18PtDbeGgb9T6vQOH
         /Bmw==
X-Forwarded-Encrypted: i=1; AJvYcCU2+hZEabYAuWSiM/CtfHutQ5f9AgT/UxuyHXZDUDQoJMJj2nTkt18DuxfXggEqCR35aOnZtVBshSCZLp7j@vger.kernel.org, AJvYcCXVKpTvTtm8spNVljZ+qrrtISXsIq8k/ksKGne6RRnXqtt2jI4p+iWyey375BT5Wril0nfzrrVzmGcu@vger.kernel.org
X-Gm-Message-State: AOJu0YwsRioYvPEDIszeJVx6OMfU0lfYZkE0JDGCG5QtpXbuc1yX8mYm
	/ertq67DhisYx8txemkjTfxcEID3Io87uGXUG53SGSitlQcFeJQmUeDQ
X-Gm-Gg: ASbGnct+QxjXnqlD3fW+gg+fDMNRhumJ87udo1ewyNa9RwHuPPCVP0PneGhVo1ouGN4
	XPCCmSAJfAmxgRXemc7DFV/3x6/UY1sWe76qGKpunedwZgHu1PiQIaHWpr/RWCX7CfGtBl4fUs0
	G6b5mUL4DTnfgA1pzulqSWthG1EumFQOVQBivXLzgq+aLQH7OBa2ZFcwA+gDvYEbj+3dDByLV2L
	nbcnir3IveH7UD3O7GIm4+GFlOzgg7TgNqzXmHsCFzffSao49bryBdcelL9kRb3NqWpl/77DXYr
	hHDIqnXaKIzSPIwOdPvaCzpwZJtKZgLIf0JzEvmYPlMBZMV5//0vjOB3SxhjLZb9vQ==
X-Google-Smtp-Source: AGHT+IHR5nn3u6Mv7ocbuLDN61MWU9EZWoqVXA0uTBbGSLbAMV2C/+qnL1ce0DHE5uebTg0oqAbKoQ==
X-Received: by 2002:a05:6402:1a4b:b0:602:f026:7cfa with SMTP id 4fb4d7f45d1cf-60a1cd30fcfmr11406465a12.13.1750701420638;
        Mon, 23 Jun 2025 10:57:00 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cb9e5dsm6360789a12.53.2025.06.23.10.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 10:57:00 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Frank.li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	boerge.struempfel@gmail.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/3] MAINTAINERS: Add i.MX8MP Ultra-MACH SBC to ULTRATRONIK BOARD SUPPORT
Date: Mon, 23 Jun 2025 19:56:50 +0200
Message-ID: <20250623175654.844281-2-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250623175654.844281-1-goran.radni@gmail.com>
References: <20250623175654.844281-1-goran.radni@gmail.com>
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
index c3f7fbd0d67a..48af272eb62b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25411,6 +25411,7 @@ M:	Goran Rađenović <goran.radni@gmail.com>
 M:	Börge Strümpfel <boerge.struempfel@gmail.com>
 S:	Maintained
 F:	arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts
+F:	arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
 
 UNICODE SUBSYSTEM
 M:	Gabriel Krisman Bertazi <krisman@kernel.org>
-- 
2.43.0

