Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1279255E23
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750685509; cv=none; b=JXh+BZC60alTpFGMM6QscgTA0c8itNjUUvd0mJnaY/jAXBxnQpkOrNEOwls6l+U8o9Bbzqwvsr/5V+qoOPVxJZRKsk1DRIwtZII09kmptp/pSh/eN9bzkOibm1zHDJhG7o/1MgG2ySta/KxYf88T9yWc3VYMf+K97pp/VASxsP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750685509; c=relaxed/simple;
	bh=eeI965bZjLro05LN9x1g2IrBacFgY7A1LEArY7+ur64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=btz2i4/2uhZT3g6L4dYdotH9mfGUUsyJeDFgY1tII5gox/PDZD8K1O0ic9ia4StSqKtsrnFMWe78q8077aedlcuL9KksZZLvTeQIsSh4dKDMj2ht2b3ZYUnBrJ2wy/kx6bmA4gJz5Pl/Aak5kIo2N3KahW6Yj5bRyplJbT8xsuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=EiPUkA+W; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EiPUkA+W"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a52874d593so4160463f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750685504; x=1751290304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcRT+NYpbdzPXOED5vFm930hD+F6AH0QJgXxP3RxDZk=;
        b=EiPUkA+WDAXeRWNUdlerVUk095LN56mFQ77UzQrwtEmfyQLf29XuTNONjW77WoBd4a
         Nn2wWVO1rv2/OPDVUsq6o/KV9trPUtd3Q39T1BzMrdzoIG2Sgz94s4GKysx6uZ7GwLth
         yCOrdhvfBz6RWftkHWwhZvS5FpTxUA4r3wZco9/ckVh/AXSE0NSlzZCTENCEmZqp3HLK
         iEUBy+g2EzVEFmbfHZ+SGNeYPjatGnelUnzBQ6ZNELINhqWqWkAVtmdHmptprby1AKan
         JpqIcU9ONv2T4SJIPZcZfKVkNnrpgrG1eiqpTYldNyFLY6icFIAVrRoxoLy4bQR4oXNa
         2HaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750685504; x=1751290304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BcRT+NYpbdzPXOED5vFm930hD+F6AH0QJgXxP3RxDZk=;
        b=jrsW0mtLQ0JdIyW03J2Jpl/iLG/5UFwjA0b81+oRZJR1SaLDO4yeKKGv+pxrLdDf7o
         TWXtSDxs1v43W0fIRx5+QH67+A3LtGMnwNLLf+1h+pymLh9j5F1RVhk+I8Jv12Jge6fg
         +t3iPiwo1eNPf6cBjGAij18pP4lel+HHQgVGvUL5jcA0RCkQAL/uCgpzKqrcd58G8SdN
         0hfPGxwFir/ADS5Df/7ZsfGRfjrZ5hAK/Tk0A1WxHuFfFcjlYT3U3DDZswoJpO/iPOl6
         /tiKy7qlVOOVL97Eah9HCIY2KiuNbrTi32N1BFIfjeTSowIkL9AthOe8cx1Wwu1CIGs4
         iCRA==
X-Forwarded-Encrypted: i=1; AJvYcCWK/SobLunelRGQjdWlsxS8452hcsXkjCoLIxqyJeo9PTrRkxEQQ01Fz3Tb7fcK/prOdQcVo6ef/2NMEwc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8nR9soeSmzQZ+3GAPGHfK2B9bX37M/1gZgDpw9u+zKGweR05Y
	MAzxklzVmd/UEIgpKK/o070VZI0RGX6SGWIKtlViY/N69oYolVG3EW5/3F/D+PtaAUE=
X-Gm-Gg: ASbGncsTLhK9K5yh5a4BN/HQ1A6IIICASf7U4j+LeNggdsMmuJGVfZxQC91r1u8nXxh
	mQ10IWclUrlQkCmo1cM8QLvkr/fqT1/8R7nI5L12zzuUrkMksN5OzgflBeApt1/9bnWF5OJPhjH
	ToXIGlwaPUDucWBWIPwCKyRCL7qaVqZxZX56rjA7F2R8yuH9iEN8mj/m25gWZM0F4lUsYk+CTRg
	GM+ImlOY1GnzVB2kpEfv6Ncla/lWekii8tHwzvP9Eo1x6fKtNIY2u2RJpu7bYzRf+A8M/CJau/G
	kyem/RaNnLm856sZzby3v5X/UIG9lM3s6+acYRSBZDipSXo5ITaisU4V2by/fXlZ
X-Google-Smtp-Source: AGHT+IFMA6wLpwWOu66ZBT/Uwcl+XoqhLxK9+V0tMp8/c191NViuqFm+b+1J2RS5eF5XWF43kziHdw==
X-Received: by 2002:a05:6000:491c:b0:3a4:f7dd:234b with SMTP id ffacd0b85a97d-3a6d1164217mr12380643f8f.0.1750685504100;
        Mon, 23 Jun 2025 06:31:44 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:7b0f:c522:cad6:acd1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1808bsm9401818f8f.24.2025.06.23.06.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:31:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: (subset) [PATCH 0/4] clk: use the auxiliary device creation helper
Date: Mon, 23 Jun 2025 15:29:56 +0200
Message-ID: <175068537068.1888277.981802582113061223.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
References: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Applied to clk-meson (clk-meson-next), thanks!

[4/4] clk: amlogic: axg-audio: use the auxiliary reset driver
      https://github.com/BayLibre/clk-meson/commit/301b96e0668a

Best regards,
--
Jerome
