Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000C11DC9B8;
	Fri, 27 Jun 2025 08:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751012426; cv=none; b=B2YtOM0bw9TjhVzC9gFjBt4nya9ypvcicptT5HZE4M/yYTXfeAAJxRGy3/Z+HK4mDO+gBfheFGeLv537+Y+ctRTbwsklly0UgwywyUVVn5Layv0UsF+g8waqPG/yrqPcLIt5bVzztpF5dplXiNF3UnfX0ATCGw/9TA9mDACJ5bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751012426; c=relaxed/simple;
	bh=Oh4TD3SGQIYcYPmXM4CeF0rb8he7Z8jtXWch8rytSpA=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHfA+9NmQ4dAP2HGAuUyCBbtPW2hhCT2gyyMasUshXLb1lS9IF4HU7iEAQ/wXe1EM19tPBTy2g6N8ppPwqISD4x3b4ZF34YESZqjXf8acmurUm6WKaDiJqmpZynD8eQgfrbdsZkVO9vaw9WVRoZg2bWP1bnRjmMRqmd5LClWYa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kY8bbLyV; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kY8bbLyV"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so1674796f8f.2;
        Fri, 27 Jun 2025 01:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751012423; x=1751617223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IWBRBcY6kXuI6+1Do3ghha4t7BmkCU/pF8IxkFP+m00=;
        b=kY8bbLyVM8RZnEyJtoRtoBge3f7aOfqzKBZLBIbLekKKwCBWLjwq3XiVxTCP5hQLwn
         hehQU3xP3sWMvnMgyXJQxhlEWt8+ErF3vxCb+XAgVS2U+0ArwBbav18ah3ltHe5aeADI
         reohYZtC4AUpQbU1Cn82G5hZoKrCfVfzvrGXgzHUaGNNrFSKmJy1bDhJ0Yz3LAGflPQS
         DTJg+us7fFKITMJyfSSaS7FHp3tMAnS7VCfgsHzz84xzpav5NS7h8qP3r8MrWWurxVCo
         WTuis5DBdd4dllHFkls1VgxGGSo4NsLAVD40wWLGOI6vGYOVnOi6t2TurfWGF/vetuzd
         p/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751012423; x=1751617223;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWBRBcY6kXuI6+1Do3ghha4t7BmkCU/pF8IxkFP+m00=;
        b=kuHMGvmBzqOULld4keVT6+Uxh7yThI9jxgGaWFD/sEH7ycdxTr87tFrE5+NqJJOb38
         vmQ/N6X8/A08Vhb7m888QgDQUZeiYJzOHToYp/JdOx6Ihth325lOoLfvxOJNX4/6Zq7J
         3n5jD+XjkhvcguFaXCgKFGzIeQntlMmeJ6S+Fo4x0YB612Rbh8nIxZkjfZAlXb+OQacd
         +vMxX9jHIUlH2sjs9XhFCkTzI5LVnx2+YcydaTmCf8y2B0Pal21OYUBl8/AaTc1Sl1uL
         vAw/y4c0hUh8omXCvmMHpqjK6iOEJwDHS7X84mSiC0q5eBNVt4YNtQuNRt32S6bJE9PW
         6f6g==
X-Forwarded-Encrypted: i=1; AJvYcCVH5AIlOtTuHiQee6HzKiIJuzWGFXqQ6u/fgTyhekOibYkID9KSxhw761HefEZEdXzsDaKSMFmS36vp@vger.kernel.org, AJvYcCWQwiCO9OaxBWCeokhx6BzYF0tdkOnvs0vhJKxH/v9t16ngfr7mm26g/izgWn09UkoafhVOW+c5471beM3r@vger.kernel.org, AJvYcCXmO9XZBuqe8YCU+YgajPDRrneM+96y2cg6OAMsAdzSeaF9daepcYH1WLiD1Begtahvi6kreVOuSoqq@vger.kernel.org
X-Gm-Message-State: AOJu0YwVQAXoMbdzTACXk58ym9N3cYikV7chb8qUyNtWtEnj1gxRMlDV
	c0cjYl/QlzGkroxxhN6ymP97nidVPoBbbI0vRk9Aj1v4KcnGtBI+zgO/
X-Gm-Gg: ASbGncvLttxiWV9FTabWm/FY3zrvHmiy0n69t32r0GDBaWApE1rxgYKB45PgW2vbLRH
	iuSqcDc9tgzv+WAsAq/vnOhyNOCBSUPpnBeDu0TlMJu5vN8hTuqJ9wOTgxS7IsXfz5zQ+nk5lTL
	2eYVzpqd8lk/wOwxZRjfO+sTgUXpF2UFnLRHzufGdO/IocvDCyR0Ppt2IgzEKjsiAYdLgvV2xWI
	Naa09gCoES1T4kpRXUl9UiN5FIGTVay9OjpklePfyXgABfI5UENlbrNWoxMAt3JQ0J9kNw66QDK
	aKz+W5Z+qMZlIaC/NHwjCEkd/q47YAYzSSYZg1Fwxz0Z/1yhr1BofgxCIoWaXTNIS29UjxvRoOl
	T1p4akl1xcjXz8B6VdxULJqjMrp9U
X-Google-Smtp-Source: AGHT+IFyrWOPafLVznMIr337ZwVduzg2vwEuHZZVpqaz1/9FfTAHeXsSa1kc2uxwBBxJaIqMooSWoQ==
X-Received: by 2002:a05:6000:2893:b0:3a9:dc5:df15 with SMTP id ffacd0b85a97d-3a90dc5df54mr2292293f8f.13.1751012423025;
        Fri, 27 Jun 2025 01:20:23 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7ec6aesm2009045f8f.5.2025.06.27.01.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 01:20:22 -0700 (PDT)
Message-ID: <685e5446.df0a0220.369e9e.8cb1@mx.google.com>
X-Google-Original-Message-ID: <aF5UQC9s3T1sDuzo@Ansuel-XPS.>
Date: Fri, 27 Jun 2025 10:20:16 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/10] dt-bindings: clock: airoha: Document new
 property airoha,chip-scu
References: <20250617130455.32682-1-ansuelsmth@gmail.com>
 <20250617130455.32682-7-ansuelsmth@gmail.com>
 <20250627-determined-helpful-rabbit-be2dfe@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-determined-helpful-rabbit-be2dfe@krzk-bin>

On Fri, Jun 27, 2025 at 09:59:34AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Jun 17, 2025 at 03:04:49PM +0200, Christian Marangi wrote:
> > Document new property airoha,chip-scu used on new Airoha SoC to
> > reference the Chip SCU syscon node used for PCIe configuration.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../devicetree/bindings/clock/airoha,en7523-scu.yaml      | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > index fe2c5c1baf43..bce77a14c938 100644
> > --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > @@ -49,6 +49,11 @@ properties:
> >      description: ID of the controller reset line
> >      const: 1
> >  
> > +  airoha,chip-scu:
> 
> So the scu has phandle to scu... That's not what we discussed. Your
> changelog also is very vague here, no links to previous discussions does
> not make reviewing it easier.
>

Do you think it might be better to add to the changlog link to the
previous version?

> You clearly said you have SCU node wich clocks and now you claim you
> have here some different device thus you need phandle. This is what your
> schema says.
> 

There is "SCU" and "Chip SCU". This new schema is to keep consistency
with an7581 as MFD is quite problematic.

Also I implemented the current mdio schema with 2 line with compatible
and reg from suggestion of Rob review.

> No.
> 
> Where is the DTS with COMPLETE picture?
> 
> 

Here the current DTS [1]. Nothing is stable for this and we can change
it but I want to stress that the current HW block are VERY CONFUSING and
SCRAMBELED. So it's really a matter of finding the least bad solution.

In SCU there are:
- PART fot the clock register
- 2 MDIO controller register

In chip SCU:
- Other part of the clock register
- Thermal driver register
- PART of the pinctrl register

[1] https://github.com/Ansuel/openwrt/blob/openwrt-24.10-airoha-an7581-stable/target/linux/airoha/dts/an7583.dtsi#L361

-- 
	Ansuel
