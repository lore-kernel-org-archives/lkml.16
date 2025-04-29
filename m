Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1342BF3F7;
	Tue, 29 Apr 2025 13:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745933894; cv=none; b=Gbvrhpu+h5iTPPlidYxno8ihcluSmLI0UiUZ2ZfHdaPGcBVfdWS7T0VJ7UATaQX17ADbhL3LxkHR4X3j9aYfb23d0XsOogl1aJIfCw7WHg56K6YCBR4OAllc5/FiAyC3rrY52SLGjohmtI4E8gel8625XMhofwUT0v2soaG+caI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745933894; c=relaxed/simple;
	bh=P0u5bKOVeiv3vEYAMFrQC5BmOPXNLg3oQQYCtgr8BSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tEyBFmsM7pUBkGY4KHGR+x8tRnBGAW7AGXesyYFN31z3pfE9aYziai6xEHRfnk8O6NGtAdWS05508rayWeTl39W5z/+os+uPACqMduJzEBonGr/V02oOwHfWPcxJ2gXH09bIeUPLk4cWPxLsSIz9JCzQsn1QsCuz3B4d+gb+Xbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXnowBPb; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXnowBPb"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2963dc379so888542066b.2;
        Tue, 29 Apr 2025 06:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745933891; x=1746538691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y26J0iAJoKCmJNS38dntVfyxrAVGftlCnn+OgGntO2A=;
        b=DXnowBPbfjKKyRl1Hcv2Yg2gMaIm9Ue7pWBLElPeE7S6ZHdUwA8T7rI4mmxYHFsMFa
         NRd2EtsriXOzuSJQcqEzQi848vninQULk/7NkT6Vht1NEjRnw+ethS+Qhua0HWLzkRgh
         YJMxc9IzHtGbdhy55u+eK5ybwu6DD7YffXpxvh2q+XCfEXnxqmv/1kt/2iTQTZV1Pn0z
         bMyP6kDZO96J4s+mfonhuBAnRxUVBt/Wvb0RKnkuakWhTUJeYIB7axfWn4ed2q9AE0wT
         QR9zeLtazFHn0UYxw5TgBUUU9qkvwUKxEW0rOVaxCaniSc+nFlfPdvfNEisr4JJeEnuP
         w7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745933891; x=1746538691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y26J0iAJoKCmJNS38dntVfyxrAVGftlCnn+OgGntO2A=;
        b=gEDjCtl8DN4Xi39sBQXK3ahX09gBofe+CptD734tPYl4kZHYu6uXyyMKqaKb6KK88K
         NvtU3Ib+5MlqoxTymmYUZub/RyOQlKs7p7q/Q0BvE/AgdyXL5bvSV5ZfzLSD2WQ6EQiD
         hMMZHX5b3OGMYkzFD9SAtv9WoNDYsOMQbUZVD8KBJEs3InloxruVw77veSSiOWtSmexe
         F4XRv2uzq6MDJ78YHWQeMvsuuI5ytbjGPUR+0I9RXeg40tm722ZwuP7BZv+xyXzMb3Yx
         2XZcTFesgQspOQRSiw0/c3gepy9JxVJ2VU0HQMMd9bu4uO/pXmJAgSdv2gFekEQLBL1B
         aPBw==
X-Forwarded-Encrypted: i=1; AJvYcCWYle87ZITusNgfDPnrBZLvcoUixHV8KQfCh6JKoB44NszVuksYwHVdFnV516OV1l92jnurExxTqnBGnhwK@vger.kernel.org, AJvYcCWfrVe2Nx48tvCEzDFG/WNnmvGJ3JzQWo/08RyYzqCkX5BEm/pis1U1MyadTSrpSX1rPrVAGstPYa2+@vger.kernel.org
X-Gm-Message-State: AOJu0Yym4h6wNa2exz2IU0+NDqR592If7bh1yXk941TlBAwu0Atgl3q5
	7y3JJ0XTtXqtFlh7WFhjilr131/0kVlUiVp5zG68kw8sForR4udL
X-Gm-Gg: ASbGncu1WGxAHysMtGfqrKZEF4TBdNa9i13te+b1/Jx8aKW77RSvNNDPZLMX1amZXMN
	T1JJP3tPoYEMIHj6oiXPyiZ3+7nkDUHKg0sn2sqFqce4oiFvWXBTAf2x7MMeCtgEq6ZfoD5lEYa
	wJ1b/KcRU3C22BxxSFIh0Uxnp/yOPuhzu7kYq59ux7kB1PL/XwLr+YBILnkeRXZWmReKwSBr4Bd
	C0zXYeFjWII1ljAGjjHDhmiVDMSD5wp72X5dKUVnIMo0KUtmnWrI7nBu8/M6oQHGv6+w1IKxc13
	dvRsn0iX9gVzuPfklL61UzrOvATBU5BqIBoT7Co4Z3hM9fcEFvNG3lo=
X-Google-Smtp-Source: AGHT+IECDUUSwqdQe+jFeZC4zccITFBfdZlwb9V2S+BXUJyiLooaUiYpAnL5q+y3JtdKb9LMa4l5/A==
X-Received: by 2002:a17:907:97c9:b0:ace:63b0:6f70 with SMTP id a640c23a62f3a-ace84b71607mr1146290666b.61.1745933891105;
        Tue, 29 Apr 2025 06:38:11 -0700 (PDT)
Received: from localhost ([217.151.144.138])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace6ed72826sm778242466b.154.2025.04.29.06.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 06:38:10 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:37:27 +0200
From: Oliver Graute <oliver.graute@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 6/6] arm64: dts: imx8qm: Add Ethernet aliases
Message-ID: <aBDWF4-63M60EwX9@graute-macos>
References: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
 <20250425-dts-imx-aliases-ethernet-v1-6-15b9d5cca611@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-dts-imx-aliases-ethernet-v1-6-15b9d5cca611@linaro.org>

On 25/04/25, Krzysztof Kozlowski wrote:
> Add Ethernet aliases for predictable names and for firmware or
> bootloader to fill up MAC address.
> 
> Suggested-by: Francesco Dolcini <francesco@dolcini.it>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Oliver Graute <oliver.graute@kococonnector.com>
