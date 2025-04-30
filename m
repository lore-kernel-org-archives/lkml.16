Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABBE77104
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 17:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746034182; cv=none; b=CyGwhUDM9XWJt/1r7iQHspHdwu/P3XdpTZ2pC3lmUVU62MAGwyx2SCrRDniC4tKGKeDXgU06Y2pCoDfUeKJQfSHQ+3TG7P2C38v3t592hl+1nghLByfKDt38NcIwJEsRzflGCgPOqfIFPt0TRiS5rncL5P2H330UhYt7OIUH/iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746034182; c=relaxed/simple;
	bh=8b7Bqu3LD7foyjvQRHymGo1eOumlODvyLsmaXgPy/SY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTMbnFu3Z5qfNd4DceC98i9rpV1CRZWDkU4way+co0lyFUFTHaFQOfXleKxdAID3f9mUutfSXEhODQr8UmHeuU/kimHgeW11kqX3lKK6zx0RTetlUMMYynxgjWqaG4aVKmsTJw6akvSSCWrqkv1mdQlNVp9+/w5f9p/bx0z2F4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C3hf7HrS; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C3hf7HrS"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso43310f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746034178; x=1746638978; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/d2mdUEZU0W5ewPmxWru9I72D9hiUx6jBl16Iw4eyIQ=;
        b=C3hf7HrSl01pAGdMjtNzH5AWCTfg9iy6g89rp7fNTxsYFHqgP6zeZnMYeO/b5ben/C
         QlI+0vPWXNgFgcIRbJ9sAmqU0Ac6H4RUbkHQV0I1sPwVtTRZrDvrDVIDj7mX57H2x+im
         7aPxmcdE3yN8RZzIXjzlTVQ8pGTDydDGABzV4kp7w2uqBg9YcqKjjmSgxr7twDIDkCXI
         lFBjrUg7Mr2X/WMi9gyLCKzWKcdw81vFkNj0RyrfvfTJHLVlSBk+u0IZijBCSTJcinCW
         Pmue+mlRrXfpaEkuxtt7EVM1THgKWyZfzkmOAQECI30bf2kD7Og/+2qjxy2DFaKIsO3M
         K1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746034178; x=1746638978;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/d2mdUEZU0W5ewPmxWru9I72D9hiUx6jBl16Iw4eyIQ=;
        b=Gq7LxGKzziNSMf0LlM+W2IF8IW36TtOjRQJfzjHnvtbuZUp+Cext1UJx2ytXYiL8Y7
         i0yiPhlMd3aYGejwqzLJU5pQ2hkiTROnNSQhMZYE5+vBk2fQRzzKDTW+GNBgJFpFR6Vp
         fCgP00RQ43SpA0tM2NTnh+8BqpMaymF7PbFzbAYju9LTAkwvs5JUCeuiloUZpxrk64uD
         KgkrWgni6DtUxEvAO0CZ6LYQK/LZD6Q86u+adO4ut4NTvT79H+JZYB0YazNVtUw6m4hi
         DNM+dvY2OjkbPeRNh8xnAlQfFCbc/OaoylhvoTfno6H/dolWEJpmdaU3R0VKPElV5bpB
         CANg==
X-Forwarded-Encrypted: i=1; AJvYcCX2R80oa3aMiRKrDvtRs3K77oZbSm2iJyNBf/Tb/eBPP7wsVNhQbfulGser/+6DUmxr9Fm9DLm2LZr3FOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSFhyWSMdFaS6QWmheZbB1f3FzZcZUdVVVjZuU8ziECne1f+Q7
	juaj4sHAWB49ECxdOV2X6veId4Z/WzniHdtCwIrF6dxHs/DxDxsecSqeHKTGwGYWeiatvwcf3F7
	I
X-Gm-Gg: ASbGncvlVeDRvi6saHD/wBCoH8ur/b9/ghDQHRC2sMJpG36Fsg0y/hXQ6H/xAye8U+O
	lY8v//UNa8cQd0x9+VtaCQEWUA8DxPIb0xZP9MjyhP+y9kwN9x4mevZe6hlDz1AZOqUhaYfWs0a
	l7OBHgLn+qcTRrTID6zjfIRrGRcMwCXczyjVfwbJqBuRQIIxOnJOP+34WTN3sD8GIKyE/Wss9qL
	DT1cbzYhNnQ8O8Dk1du+fVWAbcka9G3P0OIQRioxLCdn0low9qb1QdsZ2DVr7Bh9nAH+JUnkvF1
	pLkMSq9c72tPsUH+nuUBXe2csWzT2waAw7M7yS80Kk4GpswRFgAWtpaXCvY00u2xltsqga6lsOk
	itzI=
X-Google-Smtp-Source: AGHT+IGs1c8sYMZsyj9z2U0RULcNOGnmtGihhFGKINWCPv7w8C/Dxte7jQvye5V9MA1ApwGcschH3w==
X-Received: by 2002:adf:fbc4:0:b0:3a0:7fd4:2848 with SMTP id ffacd0b85a97d-3a08f7a4abamr2974046f8f.52.1746034178446;
        Wed, 30 Apr 2025 10:29:38 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cbeda3sm17724596f8f.50.2025.04.30.10.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 10:29:37 -0700 (PDT)
Date: Wed, 30 Apr 2025 19:29:36 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Bai Ping <ping.bai@nxp.com>,
	"open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: timer: nxp,sysctr-timer: Add i.MX94 support
Message-ID: <aBJeAFb0dBYAMTqA@mai.linaro.org>
References: <20250306170902.241057-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250306170902.241057-1-Frank.Li@nxp.com>

On Thu, Mar 06, 2025 at 12:09:02PM -0500, Frank Li wrote:
> Add compatible string "nxp,imx94-sysctr-timer" for the i.MX94 chip, which
> is backward compatible with i.MX95. Set it to fall back to
> "nxp,imx95-sysctr-timer".
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
