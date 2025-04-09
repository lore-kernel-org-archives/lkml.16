Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D0223A562
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 08:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188032; cv=none; b=SVfXtzBjHmsfEB7shLWnosPPQFi3p/S4pvFOd478zs3poSl1NBBZylu1MTlRb8BdkUWCf81TckHolXLKgEzUmN+4cU7dXXQa5U0yoDCWUAz2ympeypquYuIbLTLwqIvBvPd9aG2idbuXHTmfUIN/OeLZ51y8f3TvjYz6d6PGK/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188032; c=relaxed/simple;
	bh=q54ISzeguJ9lPIJtvtdQyT1rx08b8j76Hf0WHg/XzKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s5G5Fgpxw/kr16mbkqJxCvDrlmM2QLtLVpFT6uaoqRgk1pISqEk0Az+cQ+hVbbczKLRM5Nt8mQJUsMoFV+fJrxuzLGU8cs0cq3QzMxdu6prK9+o8x3YgLogh0xvmvXihVa2aTFphkoT+XLBRBzQo5SaJcORaGSw6KYjdbG69fr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=O3lOgIBA; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="O3lOgIBA"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-af52a624283so414151a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 01:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744188030; x=1744792830; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QmKa4CWZYpgoBno9ey2ENQmH1yn8Vca6Nt7aqMHaMwA=;
        b=O3lOgIBAWJ7/0zAqurjvRFegHs6R+gaxfxoL29AzBr9jn1WLBgWJuwvA+FwOs7Ipm6
         HRA4ZR3DlI7JCIFjDLbh7rG/qP2wxU0e4wcc1sZp9/aXSd82ZtKP6G19ZcCKmx/0QfZi
         etusL+ld3JazZNpKve/w6c5W1TneOnwKxAhD6Rkr9AZfZ5DjgUFQEqi1lrgZtzvHfdol
         GuWcfu+ke5ysllj6iGVRUOtZCGWlyLJV0Yiav4MLPkXnnnZOOwUo7yth0I657sZEvFeF
         p+SYNaUIJ2d5QlZvWtLGSCiy+HARi/Fro/OjsOaUWi5oPlVDpzORdF1nI7mwTsQYgSRa
         TqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744188030; x=1744792830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QmKa4CWZYpgoBno9ey2ENQmH1yn8Vca6Nt7aqMHaMwA=;
        b=al1icG4KtKpCxchliCdxXZgMqAVc+DSpOpbZ30qG8pum6UBRhBUH9NAFOifihvUj1q
         OJhsRCC8ARcNUz9t3bZjR5X2xRx528hICV9uC8AzacqeVyKnrHrBAFQN22aM8yzxbyfn
         z8i515yBdkosrBxAafDCZFHtnd+LU15jt+e8A8baCD6Q5uNG2zDGbwTtIZ4mv2GGSnxb
         wOKZOfbKF1uvs+zL+If3DV65U85141PVYXNFYZwAOy09zh1KRnzOjq0JtT0QoAbVyF3O
         aHC0lwsrUlO1V+0xaSWKcmP2LfY2crVDz5pClXH/oguqyCYPXiGnlJiVmSAqPVbpgFRa
         crSA==
X-Forwarded-Encrypted: i=1; AJvYcCWWLpYiGNncfzz46Yh3rzDyGacKHsclQ5YdaMOQp5kIlgp1lw/8zzxcGNcRs6Ri9lTsiQihWnr761b0U9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ8Z9lrsX6OCn+TR8EV+PFccg4RiPvNyg8VeEGJJYl4upawKKs
	FzcQQWoLvKZcjlL+n7hHESMK3BATgbfOniBFaWA+AdkjDNOsaDgQbRsd19xTTEY=
X-Gm-Gg: ASbGnct9DGFyF4Jt9f4fKz57jAX82hty6mrblP1QeJc+jM/U6RUk34h9LlwggJ1eNLG
	Sc1ihNLI42TZZuhEFa/Bp/5YwuuSltLYRGsohZepUaVE8cyZC10ygtE/esqUfUW/hVAb9ENe1YU
	pbfa4TkW1GhWR4FsRhB2Xky6UCCwIagJbXTGdGzLwzAFaUwI7gceiL4vgUFKTu3oWPQTiiVIyuX
	XlIzOZO9HTUnVdNmG8W8hUJxZ0p2Ahp+BZmEB72FZ/pqlAvbcmMkm76OpbMQVG7gXttwlLxxAl7
	gKALfzljl5zrn6wTG++Qp2hbnXDDHBHsUl8Fm1/4o0HXAZHb7Kwdy4mwUxbvbX9Jm31vOlrwTjw
	o
X-Google-Smtp-Source: AGHT+IGsjauNZ+5/GC/nZjSunHRmkAUzg5IoFGDp2f/2A4+hPimavOQXB5e0AQHxXFkAnu0UzdWshg==
X-Received: by 2002:a05:6a21:2d0a:b0:1f2:f1a8:70ca with SMTP id adf61e73a8af0-20143921c85mr8989716637.5.1744188030229;
        Wed, 09 Apr 2025 01:40:30 -0700 (PDT)
Received: from dev-linux (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a0dee30asm691019a12.32.2025.04.09.01.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:40:29 -0700 (PDT)
Date: Wed, 9 Apr 2025 01:40:27 -0700
From: Sukrut Bellary <sbellary@baylibre.com>
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: clock: ti: add ti,autoidle.yaml
 reference
Message-ID: <Z/Yye/z+g5CZJRzg@dev-linux>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
 <20250404014500.2789830-5-sbellary@baylibre.com>
 <20250404194206.GA171263-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404194206.GA171263-robh@kernel.org>

On Fri, Apr 04, 2025 at 02:42:06PM -0500, Rob Herring wrote:
> On Thu, Apr 03, 2025 at 06:45:00PM -0700, Sukrut Bellary wrote:
> > ti,divider-clock uses properties from ti,autoidle.
> > 
> > As we are converting autoidle binding to ti,autoidle.yaml,
> > fix the reference here.
> > 
> > Add dual license.
> 
> Do you have rights to do so?

I will keep it as is.
May be Andreas can take care of this.

> > 
> > Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
> > ---
> >  .../bindings/clock/ti/ti,divider-clock.yaml   | 24 ++++---------------
> >  1 file changed, 5 insertions(+), 19 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
> > index 3fbe236eb565..aba879ae302d 100644
> > --- a/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
> > +++ b/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
> > @@ -1,4 +1,4 @@
> > -# SPDX-License-Identifier: GPL-2.0-only
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >  %YAML 1.2
> >  ---
> >  $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
> > @@ -55,9 +55,10 @@ description: |
> >    is missing it is the same as supplying a zero shift.
> >  
> >    This binding can also optionally provide support to the hardware autoidle
> > -  feature, see [1].
> > +  feature.
> >  
> > -  [1] Documentation/devicetree/bindings/clock/ti/autoidle.txt
> > +allOf:
> > +  - $ref: /schemas/clock/ti/ti,autoidle.yaml#
> >  
> >  properties:
> >    compatible:
> > @@ -97,7 +98,6 @@ properties:
> >      minimum: 1
> >      default: 1
> >  
> > -
> >    ti,max-div:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >      description:
> > @@ -116,20 +116,6 @@ properties:
> >        valid divisor programming must be a power of two,
> >        only valid if ti,dividers is not defined.
> >  
> > -  ti,autoidle-shift:
> > -    $ref: /schemas/types.yaml#/definitions/uint32
> > -    description:
> > -      bit shift of the autoidle enable bit for the clock,
> > -      see [1].
> > -    maximum: 31
> > -    default: 0
> > -
> > -  ti,invert-autoidle-bit:
> > -    type: boolean
> > -    description:
> > -      autoidle is enabled by setting the bit to 0,
> > -      see [1]
> > -
> >    ti,set-rate-parent:
> >      type: boolean
> >      description:
> > @@ -156,7 +142,7 @@ required:
> >    - clocks
> >    - reg
> >  
> > -additionalProperties: false
> > +unevaluatedProperties: false
> >  
> >  examples:
> >    - |
> > -- 
> > 2.34.1
> > 
