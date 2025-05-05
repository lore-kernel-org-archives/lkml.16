Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6A5267B87;
	Mon,  5 May 2025 16:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746460904; cv=none; b=cpc9JpjUQHv0Q6CxsUgHGXO587WSXLG+UmL4vo1K4LQi9dQtKXipYP5yvhh6hzHtw3n9uKDPkkhWrXc/oImzirUE3BxQs3zgPDs3IRMyrfwSvxZcYbUnzbhUasp5PRoGsmhlBk8Q5brvx4aPYGc7RKCApBZQNH7X14ykCgbyTdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746460904; c=relaxed/simple;
	bh=Xs8bl10bcylz4Dw8GlP0/8FtrLWuB7u/NZgpuQFIpMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KaH9iOa57Y4RDTjf4ROGqgFPAfl9gJlj3QQwPEe9IdER02y+vRTWRjxfbUygebOBGOczAeylXF2hy08vZLJNMclELYWg5tA6xfGoSJKxftc7ewnXkJkP3KuHUrO+GqkYCnVOnZW53NRUbfN9tMNBhkNxuZ6l6yUFamvvLXqAoZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eyyESiok; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eyyESiok"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B99C4CEE4;
	Mon,  5 May 2025 16:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746460900;
	bh=Xs8bl10bcylz4Dw8GlP0/8FtrLWuB7u/NZgpuQFIpMI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eyyESiokYLh9ubQLqmcx3M8PwoqCmkggVGqtBunwTi9BzsVgRchaLwGELiO2ND/8d
	 PK/hM9TqNRxLJHS5dB/PEiD3kRNBteQ+mtPFVOyrFwCwnTJDCCjRF4Y9izOQ/i0+0W
	 G8iKmNGwN2Mj33Hia2usrDmu2G/uQ4edfIS0RpL7yKrpU3R/iIeavwDwYZNnbl39PR
	 3AhESrBbm9eAMzfoRMXqry4LzdNT4QN33n9NsUDyVn5h3UMUTBzPWl/hO3dc8O/bip
	 c17wsUQu6XOw/GdgHgJ/4tlPfRTexJ7CPYMXCyYf/NBHK6oNVoapo1k1GXMOGOJaMH
	 7P04+Mkg47XUg==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac7bd86f637so1037900266b.1;
        Mon, 05 May 2025 09:01:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwT55WNtEd1U/LYu2L0rCfiY2v5O2kkbkleow+PEwi7xiOsVYjtjhW3XgGOfn636EC61NCtkvQdYCtW8TD@vger.kernel.org, AJvYcCVQJ2mm2Z0A0yDlZ49ER4WyocrTbKpnBE4aNScmizMtNUDWlfGgcihn5v1t6RmvlumXAtrt+u9O/3hF@vger.kernel.org
X-Gm-Message-State: AOJu0YwXMTAaDlRPNJE5658HF2uksZZfNi3dwquufun9e/vWgd2wgkOl
	/DFY/wNt4W3vGLRVp7e32H5yi514EyU4bbmE4M/42dHxlUt3IJzFQT+Fb/Ti4kDFuFCxPlySgFC
	xVtDdo1qo0K6x4RbQxJArqYcWYA==
X-Google-Smtp-Source: AGHT+IHfviMcBncTTa/1eCjWCnBct7i6MyJt6T+Wrpj1Wgj48u+M8H6U/CUxCGyw206ENd08m+4pjdY+JLqyuk5X1H4=
X-Received: by 2002:a17:907:7b9f:b0:acb:4d5b:d1c0 with SMTP id
 a640c23a62f3a-ad1d2e7a8camr3126266b.6.1746460899312; Mon, 05 May 2025
 09:01:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505144743.1290672-1-robh@kernel.org> <dd9795f1-872a-4f7f-b4df-52cee65151a7@lunn.ch>
In-Reply-To: <dd9795f1-872a-4f7f-b4df-52cee65151a7@lunn.ch>
From: Rob Herring <robh@kernel.org>
Date: Mon, 5 May 2025 11:01:27 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJx9ayQkwGP9Hjh+UfnDauW0Shcx0VjD02Nb8Yv21v0pQ@mail.gmail.com>
X-Gm-Features: ATxdqUFssFJdVgx2aD1amm6bObYdHX-rX_gIiMecci16s8o1EMllLhzA-cGGGBA
Message-ID: <CAL_JsqJx9ayQkwGP9Hjh+UfnDauW0Shcx0VjD02Nb8Yv21v0pQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 marvell,orion-bridge-intc to DT schema
To: Andrew Lunn <andrew@lunn.ch>
Cc: Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 10:09=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,or=
ion-bridge-intc.yaml
> > @@ -0,0 +1,53 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/marvell,orion-=
bridge-intc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Marvell Orion SoC Bridge Interrupt Controller
> > +
> > +maintainers:
> > +  - Andrew Lunn <andrew@lunn.ch>
> > +  - Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
>
> You should probably drop Sebastian. I've not heard from him in years.

Okay. I would have (probably) if he was not still listed in
MAINTAINERS. Perhaps should be dropped from there too?

Note that the lists here were all generated from what MAINTAINERS said
(if anything) or the author(s) of the original .txt binding.

Rob
