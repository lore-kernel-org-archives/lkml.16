Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A94268C5D
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747641858; cv=none; b=ngYcBb0WrpodbfGPDqFd5mriGs5mkHDXLmhcYVJQhhGhfHkIZnOr/ASf32K/m1YSkgTJB6eOM3h7mhYRgK/fNyDIZw+Oy5ex9ZjEYvlNcExkBg8Ob0EkTWht7GsM3edexOmSdxD0bPGPC9Le6fTIQ+c5eIi3qz6/BPgGwZVEjCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747641858; c=relaxed/simple;
	bh=VUdwMl2EDx/kLd0p575B5cQxJDHQqyuqcSnezXdDKmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFE+e2p19VDuGjmyGSQpQEVnXM3WxYoR9VILcb16u20/9+VMmTaYlN9QPrgHSRuB28ISjx1weOuYLC5oyDB9jRnThpzsT/LWagW6syWIT+uJWCzAo5HKsVkDMHiG7BmNyCXQD/kjaaSHKOMuRKr+vtwQtQYyPgLrOX4wuq7rqX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GhVXodyB; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GhVXodyB"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-86135d11760so353190639f.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747641855; x=1748246655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5dWiTSlIihNPV24ZOdK3DTwhr4M0WoIPXXLyt2EfOMo=;
        b=GhVXodyB0TUkvwY252M3K32P2qG2K2qUut14J5bZq28wfkvAaT5wbyUhFd23q6jpgU
         48M66eAWxkqdfqNqWMqpwuRbQSRT+QwP/2E95l/DAjqBuO3yXRezCBXBGobOptEVGTUa
         MFPP+OiccCq8eN8p7jA1FNxnr/qyW3YAZEnW8Y8wgUWgUo+6MO0LW0n49qG+t6YILhAx
         Em46Wprp3vl7RrKc+WhSwbsDhBIuFbeTAzMHF/d1APUS9HErfqDssVi92lJlMCj9Yrzv
         01QM5IXukVunXOkDZmBq7iZhQvvaDioqzqEasdh1pxgvro4trCDzwT54MNIeNAHp8qoP
         7JXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747641855; x=1748246655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dWiTSlIihNPV24ZOdK3DTwhr4M0WoIPXXLyt2EfOMo=;
        b=Y4zVjTGxnHQGFnURf2bKhFySqsH97NwiTkfgEqAaK9gvPnUMhvqOdKoSm5v1578CpA
         YraaBuP88ubzt+J5fb+lYMeDGVdcTUMbonbjIp8HKZTJmFLAioMsA6/nM1GLkVUUGoon
         zQpIDL2NeCiJpybuWhe32HGoC598f+GUo90dh1Xt+CTUIMwm+TGCI79YKGRtOBLV4tkx
         AURr8TQAE4haASOUTzbTFeWTfZLgbreq9N6qW39c0lzCR/mfGVn7Jj8d1COYIUESCn6H
         Ltish5AAPIRRMqU1QGePSidHCRzBWKd9sHsEk4GrlBAo5+Z77EVDbTdAhwhGygRlO7pg
         Zi5w==
X-Forwarded-Encrypted: i=1; AJvYcCWSxK+Id4EAy0widZN+/Db5drtvGRZ+tvLE8ZQXBpxWvh/PzlcEya8nLJqgcb/S8Ug1qxBSgdK3fZ2HGgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJR2RGtmgX3zXgULErWa/MOu9HiY2qtE8pNa/AHVhdzD+KGBRN
	Bs8ANtUO6cgmg5njfF/ghjo9+ulR/PFz7+LIo9q/NrKhGh3XsKIyvLs9W68em+4w29VJJDUctsq
	BL47D
X-Gm-Gg: ASbGncvhaJNFh32kkeM1br2FIPBpIspHNNGX/cLfZQQ+mFfGKVs8KMY16smzNxB8RXY
	DsOiW+jVKWzV61h1yPMho3nQJ0+uyGdsRlE9fmfcZeRip4P104GPUdkUEq2dtXK7s6MA4/eAqeT
	yuR5ahuCE9fnVTBQvHk3f/hUzaM1IvPiTqJeYsWXc2XkDP/LoZ5NwL6gYgJ0uPNiTmYnI3nn5AQ
	tixUd21jLRe1bUOyjN1jXLIKFuJhP8lv4+a7UZVlkCiYf9j1nv/yK85S70LnS9Sei/dVfoxgoii
	ukt/FZSyvmyFbn/PlP9sOkzaC6gluDZojFq5bGCf9w80kNHzrToptnwRtpIZSsk=
X-Google-Smtp-Source: AGHT+IFiygUcuvV8c/dwB0jF8vCoHy5520l6844k6wdSN3SQZcjM1VDME1146PS+wxk6VHlMkCP5Vw==
X-Received: by 2002:a17:903:228b:b0:231:c05f:29d5 with SMTP id d9443c01a7336-231d438b54emr137262895ad.6.1747641844321;
        Mon, 19 May 2025 01:04:04 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebaf53sm54244945ad.187.2025.05.19.01.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:04:03 -0700 (PDT)
Date: Mon, 19 May 2025 13:34:01 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 st,spear3xx-shirq to DT schema
Message-ID: <20250519080401.u2xnw7tytywh4vdf@vireshk-i7>
References: <20250505144851.1293180-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505144851.1293180-1-robh@kernel.org>

On 05-05-25, 09:48, Rob Herring (Arm) wrote:
> Convert the SPEAr3xx Shared interrupt controller binding to schema
> format. It's a straight-forward conversion of the typical interrupt
> controller.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../st,spear300-shirq.yaml                    | 67 +++++++++++++++++++
>  .../st,spear3xx-shirq.txt                     | 44 ------------
>  2 files changed, 67 insertions(+), 44 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/st,spear300-shirq.yaml
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/st,spear3xx-shirq.txt

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
