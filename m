Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259542F0032
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 15:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555469; cv=none; b=ihHtAnAgTxOlgLOmiIWpI1zXjto3Oe2I+yBF2Vno4uBqr4vrEd+ONLK30hdFVjZSj6FtQ/A6Vq33YCM1P0c16hjPS/21kPR9TXJDAeRCdv4UIxTQQD+gA0MnC+wo//zU8EE/cOQa40zZ9zVEk2ltXNWzXonxJwRMF+g1gvz0jLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555469; c=relaxed/simple;
	bh=QGSsl/5Ibq08H1mWTYhreoVrbh0mx1K0v5BCTNTA59s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXauEKveO5A7p6C/lYhsS+kPatc9T9mxidnBKuvPwnyCs5HMp3edqNbj0N7eQfnGziV73Zz7Dx9aUMQo1qXKB9CBprjRgMgAA8XmR71XUno0VqBzOKzMTPqXeI1BfQ7yWAx08zyShsE5aPQ7kAbjJsQV1FdeYut10gRNPkiKt+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bjq3PSD2; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bjq3PSD2"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so9636485a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 08:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751555466; x=1752160266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AmKfwzTfOhC2oXAq+cEF+jaaYpcNa1VuxJKcbwQc1W0=;
        b=Bjq3PSD2a7xMxFiM94OzmodQ/ejrh4n8rcnVYdMtSe53e9RMXBKKOASjrQoBN7+dx2
         Fd4WDw81Ec+6F3KrQjQEwDdvcmNKmyAg0Ds2iQyL9kcqhxaY8x5UaWuh1jqcAb7Bp39k
         8tn/piKtp/e6HoQemoGc7Jyhu8OuHZrsGzC/vr0IITkGJDHDKDyUjDm8J8W5QsLm5bOa
         8pXQgL5C4x68veywqBp2QpOCi3KjMQ9XBokwkm6dDMh0ZEfaAR+FS8iSyCzgLufKfpCd
         gfMC2ktz3S7YJLPF7+s01nUa2IPijmd5dljtg4xZFnZjfik27+5Es425KnAh4jHagi4d
         oHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555466; x=1752160266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmKfwzTfOhC2oXAq+cEF+jaaYpcNa1VuxJKcbwQc1W0=;
        b=Rt9ucUVZYxsA9NkkcDoayS0m1nNd4cVDN6cQKiEuv3r++jPisNsUqq0+JCoPcRY/sS
         WtdhDOfd8C9iS96wKw/R1pnNeEV00ISFcQZhp4/c3rHkuVODzhKjEYjAIp3ZAFNINCUC
         x/aJ3xAh+4XMMnD3EcBN2v2+FMtljKyqgOP7MPqQz0nY/zhIstKYQKJB2vaKk0mJmwji
         Un8qk7i0zPgG+kja1gazAqt0wSI334mVfUvgLFzi/fdMOuAuGe8Wy+VqQS1w5syMZOkx
         x8idi5wL+kBJX1yR5St3SVdq1vLUNszyFqs30VplEIat6HfGN/AOfPvIHYCp88KNOW1h
         xbuA==
X-Forwarded-Encrypted: i=1; AJvYcCVGM7SNtzQxHom2CT4ST5pJneBoqnhzQ7WjuvOakRHMbsfYpn9VP8WlIx7tXGeVlFnCZV5IZf326285MXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMo3kTwu2yJaUwyzlMmMN03TsGfj4tmxSkX/obserazOjgRrgR
	UCLHLbmDJ9vxPaknoe9ui/bZPIyfl5H7FgWFgrgMu0yMhYQ1a3e9kd25+DIMG3eoz80zOQ4vpfO
	1JfkJ
X-Gm-Gg: ASbGncsLhGyT2Njo5bnv+WtrQ9gWDEQJ04mI/19N6nNXPDwKEECPaKhzYvRsnmeG7Br
	4UgeC5Y6aEYOQjaKfUWtA0B6AQwJX158MffQ9jIx/mMdSiralghfXH1dN715Orp9+tN14Vxo/t+
	j+7FzrcBwcOhodbYn2+shuhyuU1hjb/65VHlHYZyYu8ZSM6eVqMJlK8RTVAr+mVLRCIgDhzA+SG
	HxQfqumkkWJv4g4qs69RJZPcIAT+1lZcS+Rylv9/X0mB2NT5IF+PEzcwP99qGCgXS3a0jc3pt+h
	TyWkk/j5TD4p9D0wbxuzN7hozPSRBJFTABW/ohDsBxo+QE5Y/jDCX9UzxHg=
X-Google-Smtp-Source: AGHT+IHzpMVd5ZdMJKAden1BEk7leNnkWoWJcBZRiZrrIpoemL5vbs9A7FF6CC6wG99E12R7ltKp/Q==
X-Received: by 2002:a50:a412:0:b0:604:bbd2:7c88 with SMTP id 4fb4d7f45d1cf-60e5350025emr5522209a12.26.1751555466332;
        Thu, 03 Jul 2025 08:11:06 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fbf791d06sm258603a12.2.2025.07.03.08.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:11:05 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:11:04 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sandor Yu <Sandor.yu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v2 3/5] clk: imx95-blk-ctl: Rename lvds and displaymix
 csr blk
Message-ID: <aGadiPWIKbqDVek9@linaro.org>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
 <20250703-imx95-blk-ctl-7-1-v2-3-b378ad796330@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-3-b378ad796330@nxp.com>

On 25-07-03 11:40:22, Peng Fan wrote:
> From: Sandor Yu <Sandor.yu@nxp.com>
> 
> Rename i.MX95 lvds and displaymix csr blk drvdata in order to add
> support for i.MX943.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
