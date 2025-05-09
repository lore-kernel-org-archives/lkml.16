Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BED22F755
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746805105; cv=none; b=eDUrc50HcONNiE//fnG3gITNACtabTI6AFUulNtkc+bZOXqZMpkyMXR57oQGYejswxmt/yYiRCa6ZvODEGVcBbI+okykI4bHjrvy+amZDDYFiYhx0poWrmkn55z55W4VJT4MifZHaGeSpPghFskHvif/wyRuFlSshu7ghDWUHMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746805105; c=relaxed/simple;
	bh=YskSAaS8PR8HyKDm7tD0WRxWkFzOK9kndYNsHcCm1TQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NHJc2/SL/2bV0gMWRYmuGobhaFHN9s8GB9/+uLZD3MSR6DY5STSK1DlpGIw7IngWTZNslPjs3jiIUQzJPwquS6DLToy046KT7F5GruqHOYp9ixlZCMkajHTSUVAWD4AwtZkWQA+BB2YjpgNSUAxUuUNoSKwOfhwUVjzQunU9UG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jOktoj2P; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jOktoj2P"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a1f5d2d91eso828738f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 08:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746805102; x=1747409902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhGArMwmGNgqoLRw4DWsBA14SdvN354OIbHqJyYkB5Y=;
        b=jOktoj2Pw57aRnppVL5lOfU9CRaRJ30MqFa1JBXtdIfWEacO3XOwxeRfvrolPR3ycx
         Q218sCYsYJ3Ftf2SImkDj6AOH3N5iwjmKmZkoDYepCF9PMV2rX1zCfWmaasf2drNf3Nr
         ywTRISSfrJKMX+Bqx49uVi489AaHK0+acqQR1WEaVzQ856MDzIKdLLPB3M+dYJvhUkwZ
         qy6DbDr0pHmGMlcob6AVOWiE9Xn8W0uqan0d13Y8UNB1nlIVJgfvhgeXbmpQ1tA1wNPl
         Mh29jZXby4hVhbOxM5G2Ygb5KTcQCVQ0j6a5Zz1VQwcCeO5+iLS4zZzS8NmuQz7q5CJW
         jqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746805102; x=1747409902;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhGArMwmGNgqoLRw4DWsBA14SdvN354OIbHqJyYkB5Y=;
        b=T/jFoMNTjq/sPj98Q5JAJMzZHbzn1FDn75c1kmL7lFiLocA4qkKtL7uT04O+38Iou/
         JSnQAzUa8zHGtnzKoUYQUP/ctEce9/97sKY8v40grYOwil2LNgE7uIwY48gUe/Lemq/9
         7lppXJPfT7zHIuIq23pM37j/VlLVjir35/Jqna+CLbQFK1IXbsEuoMgVA5YHzt0DW1ot
         JskOUtX+nQJBWASi3J6tsMx5eTojEzTFvmrcC3CTOHAsjTezLm8sm20f0i7ukqmH5Plz
         5aXlbQoqs1mNgDX8r6oN8pWh49qa2A99vok3oQyP2+YOijxCKSiVyctzm3xAh5cbpH+5
         b2+g==
X-Forwarded-Encrypted: i=1; AJvYcCWK51r+aFeamW3IW039bXPoAg886qHqq+g0zlrQ96cysDKzzWu5RGlzY4FwGa3G7TsPyafWrEh/PV3iL8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVrNMpUqEblE7HBHJiM2cQmwNqx3LyZWbL3Pk+F+O5thQ+gpYv
	ntXZS7Kh1B/Be/SzK5gJCEmxceP4hoMUpwG9XD5bmvcTbc4Xfx5octmNoxMCuwY=
X-Gm-Gg: ASbGncvUu3+zTZe5ViDn0eCYbmwDr+tnzYYpzlmToynzbNmm+TumSweAriGku51Lx7W
	GOd/GEXzXT8kSUvKUa+5JjdUPxhoC9amfn00jZ9yNx546Tjt9af2+0Y56gxwJjRxCw0IQ29xzxq
	YPt8flO1FadnSsv8zPFYGRxCpyDFN5zey2uIwq6BX/uTsNX7ecm5QQvLA7oJUoelBWOlI5Id3jT
	mW0Qnph0LcP+UnVdgG/eFERGQTFqQx89GlNfh2VUPCHLKTmvrJXZIwdSicY9XJbZ5r84EK7wOx5
	tY6KnjusdGsA54C12pslZzZ0dI4pLGsG0Cir+vpFFImLewzPAWpi5vXxs8lf8A==
X-Google-Smtp-Source: AGHT+IELPNVARSPPy9VWxcC1mPIuPocRVxRHDPQtOXcwVJLTnqF0Y7JWN34ll3uKvovEm327XMwanQ==
X-Received: by 2002:a05:6000:2502:b0:3a0:b941:dc24 with SMTP id ffacd0b85a97d-3a1f6429658mr3094134f8f.11.1746805102066;
        Fri, 09 May 2025 08:38:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ebe4fsm3663912f8f.39.2025.05.09.08.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:38:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20250428-fernsehfee-v2-0-293b98a43a91@posteo.net>
References: <20250428-fernsehfee-v2-0-293b98a43a91@posteo.net>
Subject: Re: [PATCH v2 0/4] Board support for Fernsehfee 3.0
Message-Id: <174680510148.3108291.15356174367489186455.b4-ty@linaro.org>
Date: Fri, 09 May 2025 17:38:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2

Hi,

On Mon, 28 Apr 2025 12:44:27 +0200, J. Neuschäfer wrote:
> Fernsehfee[1] ("TV fairy") is a family of set-top boxes marketed as
> ad-blocking appliances. This patchset adds board support in the form of
> a device tree for the third generation, Fernsehfee 3.0.
> 
> [1]: https://fernsehfee.de/ (German), https://www.telefairy.com/ (English)
> 
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm-dt)

[1/4] dt-bindings: vendor-prefixes: Add TC Unterhaltungselektronik AG
      https://git.kernel.org/amlogic/c/40f983aa2d809b4934a260c76b82e9ff19c09a88
[2/4] dt-bindings: arm: amlogic: Add TCU Fernsehfee 3.0 board
      https://git.kernel.org/amlogic/c/eb7af1268e0042e83607918229cd62c3669cdcb8
[3/4] ARM: dts: amlogic: Add TCU Fernsehfee 3.0
      https://git.kernel.org/amlogic/c/dac928757928a8ea06eaf5694d5deae53a21616f
[4/4] ARM: dts: amlogic: meson8-fernsehfee3: Describe regulators
      https://git.kernel.org/amlogic/c/2c1879a440315e0b292bbff0fa63a73bd8a52e34

These changes has been applied on the intermediate git tree [1].

The v6.16/arm-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

