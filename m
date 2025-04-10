Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37EF20371D;
	Thu, 10 Apr 2025 06:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267386; cv=none; b=SArj9hSJsdvXGzQKGr5Hjw0v6gxA/5rp28YUqAYVm++vg+ljPmcCOhlMOdXatEJL+eV7vW5VYArU0nXKQxWDcLNx1n1CxnhAC9B078PgdwYS8weYDSrjGlzpcL9NX/qfSSlnb2gp7xWyTXCh1WgiIzkgV1d3eezJYCbhLP9Rj/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267386; c=relaxed/simple;
	bh=kTO6UhYzw0IJ0LAt7kC1M5FyfmyVXCWONfGYVQ5KXmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UApVZd5ymGCDH3/APJ7Gy41gWmAYJKlEHLVrT01mOTw74qtou3FsvuGcojlYj/MrRc5mXSor4rGpIrwJjR0PgE0+BHzMrBWFP2e1iJcOzAiuVRm/Cu3kSPlwCgCzzI9w0Fzjxr9kBv9FubRel8Qt1dlTm/yx9z+rr9Yh8gs67XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yxfsa/O8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yxfsa/O8"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso2221785e9.0;
        Wed, 09 Apr 2025 23:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744267383; x=1744872183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTO6UhYzw0IJ0LAt7kC1M5FyfmyVXCWONfGYVQ5KXmY=;
        b=Yxfsa/O8/xqCYgkakik8UMCYbXLzqjcgIYC2ObxN8hXPCiLya/KPnSkuuvdW9schKv
         RuW9r9rWvqSWcuitfh68xDkz/vFS1cHBK3tac2yzKU+EYO/hJUzjh0eaO1fYIXpALiXg
         x5JxbHA7Iok/Vdary3odick1m31a/8dJdBDgdQlsq5GgsYlPTjX278Crf1fsKtHTkDkT
         5p+FclsTPdrfjoeQ8JHZu4AsvxzhO/vHoJcEv69O4ULZ77r7pkJ6SgDtr6ijpN1G+zb3
         dT2NBgV8lfqOZ9Lc0eJXen2lHDoDEmNJu4DU/i/fmQ27HRfZsGZYfgvfPcdCgRePqJ2o
         NnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744267383; x=1744872183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTO6UhYzw0IJ0LAt7kC1M5FyfmyVXCWONfGYVQ5KXmY=;
        b=st+/D4pMNoIqL3BxMXia3iw1ec9eVwHvBoU0mT7ATukJXo0MEca9k9Jf7wiE2fgYMV
         qT58y4U1xpVE/rk19R6Z9RgrqTtIeV3vcOtHDUc2+7JQI8v9Gf5v8unYCV0HymXXOFqk
         OA32pFJhqK87otu0p/Z/SVygVdI3q20KYlPsp0BsrPE5YaSzTdxVp46zAV9udcjYg2R5
         0KhQINkTJmAF1uLve3dRCQmYadX90npA4gQBtP0AvLpaD0/TYy/GoRe9DKTZnAoFQOJf
         9yhYnZ6vf5XsTb62PfTOqgvCrd6q1v/XMvV1D2sgczkxAQprmpWe76I5wpywOhz4AH5f
         Df8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSTWeVOoM5BfK4ErtSls7OHBpNd71jxdXcalJs/gzuWjfmmEJLXHOWnQg04+0nAz94R737d5UIiiviLP4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy5sQ0BTEKIQRP8LdXWjJs7rfErJ8V5xXPpA3RW+F7UN+nMXfd
	bV0BXCNt1VzGO6rtQpUkoQfZVQdolzwDgKKhqs/DuNDhsIxxtFkJ
X-Gm-Gg: ASbGncsS2TPUH0bTVvh9Y+3NuR/GlDr67ZrbPTWMr+UsXzvlacR8Qut+NU0uKnMRKYq
	ytq4uloje0IvX7FxKNnOSVQ+zoEYcD3SERvPXJnOnyMkXh5OJ8U47LhrBWM2p/Xdaet4CKZYZ8f
	SBnYL2YqhnoEmyfJ2YLGbEZSEnZmb/23kwcs6FdAZp4YHQngZPcnOeaaklFu+VngKXDj8kBKU4e
	2grmzQjFaZ0e7vq04oJfy6LmbSZO48+Ff9+GnZxdG/R6l+vvlBQ8ghsv+HuUn2QWIxijD3puvbo
	R2AffywX+plyTCo8iSdBEB2VaNHo3mrlvhIZ7mdp5sMRfMAOzhIyHTVaE2Ikgrh1g9sDm8sr4C/
	nw9yyWyXO7eVIxYFp
X-Google-Smtp-Source: AGHT+IGD3pEoyOISIn1Zfw6v9W1npm1S6qIsP7cYoTCH8BploIFWDI5dRtvNA2LJBx5ej5GOm8Sf4A==
X-Received: by 2002:a05:600c:1e1e:b0:43d:fa58:81d3 with SMTP id 5b1f17b1804b1-43f2d9a3c76mr13488945e9.32.1744267382701;
        Wed, 09 Apr 2025 23:43:02 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207c8fb4sm43670385e9.35.2025.04.09.23.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:43:02 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] arm/arm64: dts: allwinner: Use preferred node names for cooling
 maps
Date: Thu, 10 Apr 2025 08:43:00 +0200
Message-ID: <5874556.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20250409203613.1506047-1-robh@kernel.org>
References: <20250409203613.1506047-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 9. april 2025 ob 22:36:12 Srednjeevropski poletni =C4=8Das je Ro=
b Herring (Arm) napisal(a):
> The preferred node name for cooling map nodes is a 'map' prefix. Use
> 'map0' like most other platforms.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


