Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BFC257AF2
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750422247; cv=none; b=VYfHA/KMVB4U0oH+N2PgPS4+/6pA27G705VGsMXlYok+/5pek2vonF7KOm4DIFseM04q13WoWfWtPBeI5WQGqQcNQWJszij0Y+MuVCbginHuGUhUCyMkwwcdtV/kUswkfKS4C8uWLh1+nughJyJtw1f7/FZNNvToc6WFvT5KguU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750422247; c=relaxed/simple;
	bh=XqIm4uYSe9J4HhhUcc4ZTvJSrW2dIFzgMEDdCxXHdUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XZbzk1Tvh6NILmysS3nelk+JaaAR3kOM8o/XVXTM5XJ+lW3syIHaLA2a3x7GruzSugH5u8ykcUAY7Rkco56t3bzgD+RA+x3UGHnUUDjA+9BDybuFdIZPGYkVcWK/bMA/CnNCF2A+dY5rOFquAWL7BkfWT0sZE9a3zYZrAWep1GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLSq8Csq; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLSq8Csq"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ade5a0442dfso345949766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 05:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750422245; x=1751027045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/X/dlehBBIC60yZRCgtx+MPNkFtpOBUXBdaA+NSTO8=;
        b=FLSq8Csq0dy0OW7FEWmHy+cA9BWRZQalU6ysgvnpWhrpm/fZ++smKOPqa/a08uAVlE
         1mrSf81Ev3XHjxJ12+4+04LUijcqkmjfuus6M7eI6vtiO/P/TWD0BKDFhZm3mjFKSIvb
         Bvv/Gom9ecdiH/HWW0BXeZf6+KAwUwRHBfkWb4UQolcmEuHpmgQXOgehg3BUlnNhMPgH
         Hlr3t0K0vVJVsul/bZFMVo59ZIkBuKXQ0yiRd8LGNgSMANXi41YMjhxc5ZPhlh6EvV1p
         DQuQoJTJlfr/gR9aLUe3FBp8qlMbTYBHjOF5BDbd6lANAL20JnavyfcLmTUPNWAGa67A
         i2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750422245; x=1751027045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/X/dlehBBIC60yZRCgtx+MPNkFtpOBUXBdaA+NSTO8=;
        b=FFMHvLaGfjriydAc3tTM9kxewiXgV51PmICNvm/y0k2Ntgla9cyk96kS2f9DliHF/M
         bt3ARaK3ggeRvRJKWD4KhPwPQRKAsK6ztekazzsW2l8jLVd9SzLRKCAN81aDQgRXSSaC
         XWQXYAzWut/ekze6Qc/3CNCD6AcyD9hW7ywnAhW9OuKsBUn/00xGmDWy4ZQLHKtF+PMf
         2pwKfPfgmEz+eFLj30Hr50oDsLB+rrJKLvn2MnLaAj+OSl1wPqhib835tYpVuLG1I8ve
         6NJLuCqXYc4Pwyr3j8OtHY3EDEwUhflOjbaXth1xzLJ60UC8onLRPR0aPumuXLYNgxoN
         Lo6w==
X-Forwarded-Encrypted: i=1; AJvYcCV0Jo2I+huwFldLGSTnuJzKyezw5+Zr9O4vvg0fKCPNl9Oj0uG32ciykhFaltWZJCgHJiZT7pSGMx/OFcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YynRynnnkoFBJQwHiLz4Rw1BwPpgB/rt4H6QG9rts1J6AeqN4P/
	1KxLFqxFYH5ZO4dIXA7IM8Z2mkrsR5WLiFeMM1nY8x7iEUj+fpGV0/by
X-Gm-Gg: ASbGncvB+lN10HQd6C85n659fY4nv+Obr4UGlMURABiIh9TEWyEF7TfGFue9d3KrbFM
	3rKYc9VT2Dte/cafUfrsnJ4MtG5/iEUYq6oMVgZk2reRcyJtdz0wwa0MmofsR0PkzhZ4I7DD7u0
	XqFpDkhPXoy8uTStSVF0W5NlTipMtlTmcZ6ayskp0lDMGTcQzDsnNZh5Nw3Uh37EQ7G0EeazlcZ
	eheyibQpUZ2jFHpy5CaQHdul2lTM7fVQxUzoJAI7eIEybVCHEtzySQoOHrczPgBSMZ0iz0tnomJ
	CJNg6OhiTlKQMTsK/v2B45aK+JCoY3tac7uRmqNx/ZO02HiU3b3tlI2BAzwGzW3aOgJKK17GdNC
	Gjdwhf44aDqxE
X-Google-Smtp-Source: AGHT+IE/WYdtL1IPUdi8cBLG1G8bcuOFx88HDX7hvfB4yXyUgPKmgyCVJk524thn4U7jQKPbsYXaag==
X-Received: by 2002:a17:907:6d0a:b0:ade:9b6d:779f with SMTP id a640c23a62f3a-ae057acdadamr251760766b.32.1750422244371;
        Fri, 20 Jun 2025 05:24:04 -0700 (PDT)
Received: from wslxew242.. (11-127.static.abakusbp.net. [46.17.127.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e809f6sm154000566b.1.2025.06.20.05.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:24:03 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: 
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] MAINTAINERS: Add i.MX8MP Ultra-MACH SBC to ULTRATRONIK BOARD SUPPORT
Date: Fri, 20 Jun 2025 14:23:49 +0200
Message-ID: <20250620122353.150700-2-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620122353.150700-1-goran.radni@gmail.com>
References: <20250620122353.150700-1-goran.radni@gmail.com>
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
index f584e170cfc3..1971edf8e5d4 100644
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

