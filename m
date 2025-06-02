Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15542C3254
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 05:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748843359; cv=none; b=N1KSEvH5uAvSqe+nRH+cJOPI5002g4vDDVQowkR/7jo14B8xnyczwr1L4QtLZD/TVFK/87UFrq5LPMqZaOJBLxiE0r9AN9LE4gFx51ZNsLJssYrQ7qeAt3exj1N7GeKhxWFohd30+qifePJWqciygBfTFFGx3aJ7PZ2GkRgmNiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748843359; c=relaxed/simple;
	bh=TTcp0RH5goWWaDtNOyQbRWioZ+PFqTZ1mEjZoQQ13zE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2h4NiCQjBxjf93lR4eX1w0F/taNZ9Ko/YsqDHvHkF5u18WNYyhyA+TBXEZg70zRdhzgbsbQzfzJwViCUVr599CKDfHdx+ke2wKHlY6gsHh4ouEqIE1LLEfnS8m5hP0H8YadOFy8RW45GlwqFbo7+lMG2CHczvdjJ9KsnIrZnlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w7lCvrTU; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w7lCvrTU"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4f71831abso2690914f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 22:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748843356; x=1749448156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eyhHth04KPeox09Lk8fzATKM5wNicRHQ47sc7G5TLEA=;
        b=w7lCvrTUgP4PvPNpssNtUzdi/4jEQDtVOh2hc1CyZwWG8Aj+a0++8n5F9hgqipH2Hk
         reUlahuvA1MoaRJI3kVZwx9qGJ1T6WU5FnWlRADi1+nFH+6ZBEMumqGQysi4fn/96XdN
         +jC+PwOv4rnOuLd2jkJjjiLti+L4olyzKavOJ9YBfM+GhdnGODMjnQ+cDnvcRnfsov8P
         9lGhqViSAlSu159tKzT8jg/eEgOQMF+MUplQoZ+ZcSu5587ZGwfzZ+XEjTSJZDTZSL3c
         AO0QnmRpoUcwzzQiMQv3RDuoRftzI8fbsxtb9xwzTP6wO9MbvWEbn6dx2/cbX+skKkwS
         T/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748843356; x=1749448156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyhHth04KPeox09Lk8fzATKM5wNicRHQ47sc7G5TLEA=;
        b=HggU9gBfHtWKxS8bZcjGOFPNam9HfVvaj+YtUUiZ6iprT9Bon/zMi/DDnfi7UtVYPt
         WS+GjiOXvXrGyxifROxticFwnF4tdbqeHY1wVeU5tYUuPy4hoNWjOg+gn2v96OMD6UOh
         ULOfwQqQlxoZ+F11ou096kWyhGnkeJDRKm69/ZgjWXuDjQgsPNjGHXXRBTGV9U/ly6Jm
         t1jZ1wYtqm7jbHb6+b2iNASo+GPsfv0Mw2iW/tfwlh/WILZtDe6P1aTzhKZEfhYC4QIm
         5u3uOwDP+v9g97menpKKOeHv0Mva0Z3+N/T7ILgwSQeUy0ACTdSX6BYPTkPhRuKiHTdX
         dS4A==
X-Forwarded-Encrypted: i=1; AJvYcCU1p6zEu1zyIpNQKfqbiMwLnYy7ZgvYtRk7jl2iE5+idoHsLwtMX8GWdnP+hY4wpvLjKjzsdDYb8Y8KoKg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2MoxxPKF9CRsU3X1sY6mHpJebIVnKVwuhRFIEB7BuYjJDjoRS
	G9jJFon7zPu0uqE6BmreKcpnc01vfKQCLSTIQc4vUPVSngkkQRpx0G4i17u0yRbXKdTR63Y9igq
	ppot7
X-Gm-Gg: ASbGnctDiyL1xC/q69Zc5hfJRD8umN3ZUpFPBqQPoNR1hoNyZ8ZxfTajM7/f9NQeKfS
	ylqdlaGHjTXj0BHkydjqK225Ch3ZX033KK9IuhfXQZhLW7bKYSLK3NhrNDRyfmZWV4SmldenM6r
	RFq2HX7ER5NS/5YPsQYwzHpxC8lqz3AJFCrmXPFkG/SmOaFTPOMiZeONHBOMwwdSJX962nGMpjd
	XlTRRHoFhNGeVyDwrl9hhNjSaeJS3AmnmYvjuhZLtu9Yn0cColUQ1YLmS//bo4rtc5TROPez0Uu
	YuFjfqRm9TlNrw4AGHu6Af3SO1a1t63NmW8dk0oFskdTwr3LRO9ccjw=
X-Google-Smtp-Source: AGHT+IGEywdUX0aydO7qeLoFT3cz6r5kcLRXivHxspZpsWx9ZaJ8+GE/6DPG8HaQObUmlr8SGOikgA==
X-Received: by 2002:a5d:64e8:0:b0:3a4:dc42:a0ac with SMTP id ffacd0b85a97d-3a4f89dab95mr8160871f8f.49.1748843355821;
        Sun, 01 Jun 2025 22:49:15 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-451d30a227csm43512715e9.0.2025.06.01.22.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 22:49:15 -0700 (PDT)
Date: Mon, 2 Jun 2025 08:49:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, s32@nxp.com,
	linaro-s32@linaro.org, Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: Add compatible strings for
 s32g2/s32g3
Message-ID: <aD07VqXXTEVst79-@stanley.mountain>
References: <cover.1748453565.git.dan.carpenter@linaro.org>
 <2a4317353557e4fac2a7bfa4261a75886eebe41b.1748453565.git.dan.carpenter@linaro.org>
 <aDd+nOo2KV2QmgXr@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDd+nOo2KV2QmgXr@lizhi-Precision-Tower-5810>

On Wed, May 28, 2025 at 05:22:36PM -0400, Frank Li wrote:
> On Wed, May 28, 2025 at 10:57:10PM +0300, Dan Carpenter wrote:
> > From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> >
> > Add the compatible strings for the NXP s32g2 and s32g3.
> >
> > Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 2 ++
> >  Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml  | 2 ++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> > index cc5787a8cfa3..400d885fea96 100644
> > --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> > +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> > @@ -24,6 +24,8 @@ properties:
> >            - nvidia,tegra114-udc
> >            - nvidia,tegra124-udc
> >            - qcom,ci-hdrc
> > +          - nxp,s32g2-usb
> > +          - nxp,s32g3-usb
> 
> keep alphabet order!

Ah, sure.

> Can you use b4 to send patch, look like cc list missed
> imx@lists.linux.dev

It's MAINTAINERS file which is wrong here.

$ ./scripts/get_maintainer.pl -f Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
Greg Kroah-Hartman <gregkh@linuxfoundation.org> (maintainer:USB SUBSYSTEM)
Rob Herring <robh@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Krzysztof Kozlowski <krzk+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Xu Yang <xu.yang_2@nxp.com> (in file)
Peng Fan <peng.fan@nxp.com> (in file)
linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
linux-kernel@vger.kernel.org (open list)
USB SUBSYSTEM status: Supported

regards,
dan carpenter

