Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F302E62B0
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 18:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751306723; cv=none; b=PbOQTqA5lzG7DEfXvxNu6RStzAODrfSM6sEzf8NnTrCHho7HjX019/e56ny3MQwSbsLQEiMYvfi4OmZFsGgWpe9U5NsUdSc05MrAxYNdc1OX/tg3p6lS1uO5SxlOVYfEHimZveXXnm0LnP7nw9G0NTHbE5RAVMaOvd58883sr1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751306723; c=relaxed/simple;
	bh=eRHXJiHdUnhSH42Mt94bnfq1JmoG01wWP7806wesDT0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lhxgLxqJV/cmDq79+4ppfQ3PJluhUuxrPEbe4u9WWm5SKESI23NSIprikBh/NWl6CyvXk/Y+qxdCpv4dVzw6GxfD7p8OGFl8YMK8r7zV6v7ktHvaySDSW26JKNaaheOiWprXoWtPOOArlLuWgGjbH6JT+tCphdXWilNq1J/HI44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fkkO373Q; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fkkO373Q"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so4574023b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751306721; x=1751911521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7HamuIOi93Ir+D7BNI5NjTYA8k3P5m2JucOy/ndy+o=;
        b=fkkO373Q21UxO7jw9EkJXegHtolz7ll+8WuaR9AvyyqlF4Jpn50lGwjR6UPKk3WXn7
         Pha8lXIvDmFjMlXBkdSpzUo4FPDxGXFqUR3G5G+ohcGPq7dmQLFvfh/C9fKzJnq3REx1
         jubjiAGoYCyqZeKBDu+TAYg0CZfARLB1CiiMLqZNiQawkPmHRHghCmPdmYkGZU2tpz/5
         Uflk62nP588NB99YZidtynNULy5PtjOio5TY+X7168CCm4IFY0CR9Wu3a060HtPpOa+p
         UL3TLZxXwTfK4Ubaz3mHPEFlt9Lgvgwx2G6i0bzs2OHhcHaYElwFgNGMlq2ZJE4CFpUn
         j2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751306721; x=1751911521;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7HamuIOi93Ir+D7BNI5NjTYA8k3P5m2JucOy/ndy+o=;
        b=gZ7DNr2hpAOLFL4jDtYaQ9uhA6uIUDxgBIJvxYqsWYk9i+owh6lrQGwGgx3x5ZMvtT
         T3NndIYTdOeVNPfvW4Nv3FTBIx43rVlZVJueMReQ/rWZJvKd1K104ZQLERyd0W4NeOmr
         vvSso+9GiNtF9GmHyoRtC6RvjI/t3sEYVjwXEbE9k8IvWoPxNxLSG60kp9qsZMpSD7Cz
         07yN++k7Tp5PGFlpxPC8GkjyiV8JjqcUFenqqdlKiRLX3wbkCW2gOWxqEW268n8Puphb
         Wy/du3clQpUhiZbBOIguA3PSQllhZNL66Ed5jFQzFPIPuCEPYHRwNrOJTmnNyen6V9gi
         ceyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0dJS6D/V6i72WXrthj+87J+CaO2cZbd4UfIFRCJ7wOYdtq1aOQMQlYONvSYULnctcxYy2ZeM+W4/pLBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR2xBnf+1OGLfbZIxH0aG02G5cadgnIj1cxoUYOYWI/9zOsHka
	pyMhfVw1GBK4ViNZaHLAJ1GK7ytrs3Ww054Ku23NWHVLEhv5sea1AwcWDaK3Z1MeW5E=
X-Gm-Gg: ASbGncubwKDZHUji8DJAL04eCmnYASzPHwcnzfC/OxQY8bAojs+QM01gZmROc0sOV2X
	jZwPYn5cYm7zdBcv2M5xVbqXjL20iGVk2sKI5vmiR7ruucBx1vKf9EbWr7FKrkmd5SI7oMPBcIL
	zmvNDlqJOfX31KCw2DUmdl7IE1MmNoYC11v5+tpw99d9tGBIrYxETn9Vvg0Hd9VhuhlBYfxGZks
	npiae1hT8oJyxKAvDzv6Pb29kjvzi1Y3Zsb3a/Eezgd2lkoFNmBBjvqIXN04xt/43P9bH6QYmHa
	No8SnTUwCZr4oq/Uk1yFxUprBsLvgMdkZW45TCggbjPBt2hiVSnqiS0ac1eQ
X-Google-Smtp-Source: AGHT+IEncS/HJPiBmiJZCLKoJU2/w51Fp/NZyo6t579QG+npzr31j+vLXXC/vxt7lYssL2dcF7zMQw==
X-Received: by 2002:a05:6a00:2ea1:b0:736:4e14:8ec5 with SMTP id d2e1a72fcca58-74b3bca995dmr669511b3a.11.1751306720777;
        Mon, 30 Jun 2025 11:05:20 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af540990bsm9409550b3a.21.2025.06.30.11.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 11:05:20 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Paul Barker <paul.barker@sancloud.com>, 
 Marc Murphy <marc.murphy@sancloud.com>, 
 Kory Maincent <kory.maincent@bootlin.com>
Cc: Jason Kridner <jkridner@gmail.com>, Andrew Davis <afd@ti.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Romain Gantois <romain.gantois@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
References: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
Subject: Re: [PATCH v5 0/5] Add support for BeagleBone Green Eco board
Message-Id: <175130671963.2621907.636669398639023401.b4-ty@baylibre.com>
Date: Mon, 30 Jun 2025 11:05:19 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Fri, 20 Jun 2025 10:15:51 +0200, Kory Maincent wrote:
> SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Green
> (BBG). It has minor differences from the BBG, such as a different PMIC,
> a different Ethernet PHY, and a larger eMMC.
> 
> 

Applied, thanks!

[1/5] arm: dts: omap: am335x-bone-common: Rename tps to generic pmic node
      commit: 297bd457c893966f37fc07b68162862bff3e7c77
[2/5] dt-bindings: omap: Add Seeed BeagleBone Green Eco
      commit: 23c7d1976f52fd8b8031ac0e5f4f60166cdc32b5
[3/5] arm: dts: omap: Add support for BeagleBone Green Eco board
      commit: 6d04ead94d49df8d549122d89999f1faf27b5373
[4/5] arm: omap2plus_defconfig: Enable TPS65219 regulator
      commit: 299c277aa74cb011b00d6aeb5ccece37e9166d91
[5/5] arm: multi_v7_defconfig: Enable TPS65219 regulator
      commit: 536407b5b87d16e048b75439d5f2e1246078d32c

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

