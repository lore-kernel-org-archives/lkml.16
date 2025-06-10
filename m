Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2090B2820DD
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543133; cv=none; b=Z5HfIBwYO+PYvxlLqizN+txi4XSWQHeV+U9VsI6u0J3HXbN38U4HqTCsnj84e3F+WoWDiqHBRYeddxf1lOh8QheA8A0/BBwSbEPyGZRGsRAq/g88LnmVxxWPPtCl2U/aPJKRdMnMG3YVHzoY+JHvoyfrFjvIj2J19wQWmlhsNPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543133; c=relaxed/simple;
	bh=oJYRsQDIZIFS1gyuxKSeATK987ZVV/SuTaXBG/5waxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EhCLUKlHUN2QepmSXa8OyeC9PlDWzgJoJfhgoEVkgHxAR8VpGLiMgLW5Fw5JOo4L+2+i+o23nG8WkuodLxI4un+JU1dy0qj5ddCYkPRp/u4j8jEp0loWmaNw3K3qlfhOFoZLUDDusBNsZfhjN99aS5xXwOd9xVlxnM11p22+5GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VSTJ3ZQb; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VSTJ3ZQb"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a53359dea5so2094265f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749543128; x=1750147928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQOikj5+hOjYofyjQTxrgd5Ve5lIEwTQk5A2jm1d/4w=;
        b=VSTJ3ZQbLKJ73vDbsJTxvlGnM+HqfKpGH/byEpyxS+kwzYNjznr83uVz//Gf1Low3v
         DGZmfprQp6kN/SRATd/Y1UwanZrBqX/dppygYNtAUIa6QifJG65z4k19NbyIH14x4GLK
         J/kVAHKF/wm+9S9yp8+R6L6G1MYklbKtZB5SfV+IBDSFcLkom/cpPDgm+bOwvOLfTDYz
         F6oxtwp4tC7Ip7GH6dUejzYZb2QO3zRiovCt0YzbZu3akdee95l95rpj2IQU89hcSGOB
         LUit1EHgTVi+ChscFqOxeKGSLlkFmLxE57jILytCM0eHvxDWGbzno7jdMQQ7+l74P8R8
         /fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543128; x=1750147928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQOikj5+hOjYofyjQTxrgd5Ve5lIEwTQk5A2jm1d/4w=;
        b=bPh3okDHbfoo5xe4O/01vQueePZRcd+ZJ8L2e35wFZdRjtCQqYYIBRe4atfZmQPJ1Z
         3Z6neBOC5ai7H+ZtaQ2YqSdFNGl0tSQWMG470zo75MKjSvQFh4VT2PXmUQsv2HHh9PqY
         pQxRZvXytIBPSmeViYjuna1XWA3E17U/i1RezFZFmDr0k8FG0j7mmmZWU7x67jkETjGh
         d0ztRyPB5HHzhdYWrusZuAILYTpnMjVupl8UJw4azRfWb3LiXZB5wJjxUR9I2a0KQSZ5
         cQBFlau9ABuZGqw4mjm27eIngdGNgafthFY3ZMsCVIuFxILP3x+mFMI2aQX5HIomsNZ9
         B4Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUHi+dOLN/6pYq8Uc5sGj7/1R9EeeXlo1bhFJPjCM9JMRSsDzdZtvO5PAL4j4bPIQHV6wg+LLJT3enqtFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhLrq+MsWvJkDGSBIIdyaRMHTmUD+/Ed8gTc68Ir6GkNNST7Ef
	G8PaiegZxlgcht9TQPDTNGU6Tjkmtkbt9fouPL+Tg+ilxdzfmeTLWQxLnZ0PT0TURK+39Kj0yN+
	858jB
X-Gm-Gg: ASbGncu7ldb4AV0ZYoIxFuE1btDkj4CoOTk8J1dwp/i0XLCqDX6i6Hi/uamTVCqSZ5O
	h6gpciiKqmxDMfxfRTZE5kFeDpYW6NQxZ36W+mwWOQppwuzqdGGfkTIDKOCQ0+Eavm/EwqAUntw
	OjDyWAWrmD2pd5qQEGSkFWVDACnMPDRC7ohGGEOc4aDXQnr1yyDJWC1AzGUJGRqDTQ8DaIdkMOR
	//6ay/KDwwzPzCooVTFCFKFv0FARArHRnChzcSV9zhQYxPX5qQelocIh7Myrp28aA1thvK4RujA
	UesXSWb8zha3mltCQq9i4M2mpRKECmka068mVtnta1Yy5tIeihQgR2VAB3Td
X-Google-Smtp-Source: AGHT+IHeh5JOUa/6DesJDFgxEXglaZaNBYUlWKW1tsF1e+6vqxndSIUGrZ0XXtHALOHyX4qbc6zicA==
X-Received: by 2002:a5d:64c6:0:b0:3a4:ec23:dba7 with SMTP id ffacd0b85a97d-3a531886727mr13057182f8f.31.1749543128214;
        Tue, 10 Jun 2025 01:12:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b9b3esm130838565e9.25.2025.06.10.01.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:12:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH v3 1/1] dt-bindings: gpio: convert gpio-74xx-mmio.txt to yaml format
Date: Tue, 10 Jun 2025 10:11:55 +0200
Message-ID: <174954311123.28634.14290388105456519016.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250604144631.1141430-1-Frank.Li@nxp.com>
References: <20250604144631.1141430-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 04 Jun 2025 10:46:30 -0400, Frank Li wrote:
> Convert gpio-74xx-mmio.txt to yaml format.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: convert gpio-74xx-mmio.txt to yaml format
      https://git.kernel.org/brgl/linux/c/0e3b7b8759a7f3597e64fc12a8a017111edbf777

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
