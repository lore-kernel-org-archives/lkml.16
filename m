Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CE4230BD6
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747383391; cv=none; b=SerjDvHmArFqc9lkD1i/jyMIVD3BMPhV3x5edKbEmaBM/mf3MiecbYFYAvp+ynt5jwS3R2TCFmCvHNsXef2LOK88Yh5d0c/uNmp8BYtVOTKpnzcoWvi0U/npgj2YKamwlI9VlEUp8TRq06+FjqJxmzntGFC/Hh6pgKZB4jA8CIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747383391; c=relaxed/simple;
	bh=9Om3pCVh4DQs/g5WxN71tZrY8Z5myBckCvfA7xSo7S8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CQXseWKG1peKjgzTgCTmW37Nwfa2X0O/RW5jphbS9bR6FocVUqt1/XICGUPZT+iTJmi/20zYIKXA4tYvjTUqNPAVnQf9II5Ed67bvv16HhnTreVXlJkLO2E2VQNOKw40yfw9/Y3/1SQGVpCY0o5j27r52VaH594he4aHx8xnP5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dq76bI5L; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dq76bI5L"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-441c0d8eb3bso2671745e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 01:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747383388; x=1747988188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Tv+bX6ZlmsD2MRpJhDybpIJBQMc8p+o4XGgPlDD6Nw=;
        b=Dq76bI5LfkjFzuOI8RJKVdK5jr1DdiSTsDu5uXepnQ9TLJdRc4Sg9Y9imPxZmrLaga
         z8br3TJXE6PPX3+yc7yJl0zWWmNLo2sQN+HncrTKq8TClrYZrCm1Sgb0QcF++1O8fLBt
         RWhhXtRcfeX/iyoxgJwrZZ5losDUWm6LbACXbT5oRFdYXdkOqxeMobLcVKc0d4sHc237
         Mw3gA5HdXsJ1DHobSho5UDXnjEwnPzGusD7UZXgUqIup6ruJmXMtXhO0pK5mEQyDQpcz
         xf7MsTSW5dGLdrpYQmVOvtU9eXbQC7/Ftxt01PxvBhjAMOQZsfdH1ddIVibqg0tkSTPD
         z6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747383388; x=1747988188;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Tv+bX6ZlmsD2MRpJhDybpIJBQMc8p+o4XGgPlDD6Nw=;
        b=Zzkx9WqNrpZeubZ3o9vUr4wRq9dQ3mDngDc7uaJfn2Q1sYpkiz8ehvFclrRiw/t9SK
         66D8Cqx10HxvuaNDbhM7mW1oc0DnZU26R1fWvWPqsCq4lIThqZLRqqLSp2m0KH2VrFm3
         P0N6ctds0tYNTNFZJzpdMQ3u8fa11VrMsr25w3u9m3yRgCZwvK7nTfKHkDpcTUvJXMnZ
         /yZKHx7OKLlIh9VxvzNSXo3LAc/yalBXTvQiqiYFCkRhGihGnQ7MDZluBo/bNzlviis2
         iLkY8AhUQO4i+vJnVl/d7Fg4R/ZPDKBaGz5tpra5hXGBF81DH6bXPT5RZ1j7hce7DKn3
         QGKA==
X-Forwarded-Encrypted: i=1; AJvYcCWe2oaMZCbC83YiCXT8YRow9PDKwSKfSMIqEtZxSUAPNasgzVStkN1lwawmmgBdSJ3EtNdvRgKmjazR7Xw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4FGAZ1DSt/aXC2x3X0gcwG+RJvdh99yh226jw5FdCAkDbQNCt
	pJxlsgkeq+hSU6fQmE6jPTmXH92lmNUU9WCOWkxBX0Qm7OUWNxYq37S+wbWkax5dFcg=
X-Gm-Gg: ASbGncv/qDEnenFj12ibh92K/A01tWESP6hY4m+MGCDDYcJ+RhPwXy3TwFWsA95c3d8
	k/nFFvsgm3rD9r1FRwubLVMIqCsfKr1Nah8VmSPp37mxjqfgDlC+/L+bFzmbDumItkdRKynzgxt
	PqEqlFULhmFeePTVnLTOo6eOx+IK5sT/MwP0P/r3TYo2GQ8yFS9hUHTphPELuUbeZKWUW9NJCgy
	SrcU5ODLxRaIXNm9coSQQTbX8d9En8Jz0w6qB+4JOLlEmOdWVezd7oeWRBipL+Y6UPdDdiLFf88
	+Qyd5hk6AfBRzjM/+agh2yil8pKKUS0dOwcFixpjhlZvtGePwmMuUg/rVBaQCZH2zAsO+NcMBsx
	YQm2/C5NGECJlZJ8DLg==
X-Google-Smtp-Source: AGHT+IEkIkw5elhOyTB83C87OFiQ0tJrARVHpD24DDqhIh7HG2A3aYWsL0sD6JFgRgRzOP8Mln1ztg==
X-Received: by 2002:a05:600c:46cf:b0:43e:94fa:4aef with SMTP id 5b1f17b1804b1-442fd6845d2mr8039595e9.8.1747383387870;
        Fri, 16 May 2025 01:16:27 -0700 (PDT)
Received: from [10.61.0.48] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd515130sm23980885e9.18.2025.05.16.01.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 01:16:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Davis <afd@ti.com>, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: kernel test robot <lkp@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <20250515140555.325601-2-krzysztof.kozlowski@linaro.org>
References: <20250515140555.325601-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] mux: mmio: Fix missing CONFIG_REGMAP_MMIO
Message-Id: <174738338644.6332.8007717408731919554.b4-ty@linaro.org>
Date: Fri, 16 May 2025 10:16:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 15 May 2025 16:05:56 +0200, Krzysztof Kozlowski wrote:
> MMIO mux uses now regmap_init_mmio(), so one way or another
> CONFIG_REGMAP_MMIO should be enabled, because there are no stubs for
> !REGMAP_MMIO case:
> 
>   ERROR: modpost: "__regmap_init_mmio_clk" [drivers/mux/mux-mmio.ko] undefined!
> 
> REGMAP_MMIO should be, because it is a non-visible symbol, but this
> causes a circular dependency:
> 
> [...]

Applied, thanks!

[1/1] mux: mmio: Fix missing CONFIG_REGMAP_MMIO
      https://git.kernel.org/krzk/linux/c/39bff565b40d26cc51f6e85b3b224c86a563367e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

