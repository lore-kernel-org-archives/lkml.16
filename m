Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66F94315A;
	Tue,  6 May 2025 20:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746563265; cv=none; b=bXoPzcI6wi1Asa8XimffC/+gPn2pHncCiuIatAROAP66MduAxAL9zlgSmSOBNZ77rkXy79tQX1aFBt6bbuRjY6vVo/AFbJqPmPG4WCKowOKjtM050xZ6y/mX5yC0DK6LfsIeOzrc18ThcqMm4bZ/4gbyJ9Tz6z7M3iPnwfM+DwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746563265; c=relaxed/simple;
	bh=Z4dfHFOdc8zbOCs+oia3qZiHTU10t25uC5QYhcTXUng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVgdcIYIMd+XK0wH2O/9msFAPAcnitPH2RlUz0aCk7PT++/5SbNAkEeAIi4jF0q1m9J7k/vNnd/T6HtxYOOJKy5PE62bOx/rrdJA8ob2EqnuMBwz2mJ0CYLh3iE1HvFhfC7QFHN7b2UZi8Ga5BLzJBjiMXiTNAw5uluaBP8Z17s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LnliKpHY; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnliKpHY"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso970600866b.1;
        Tue, 06 May 2025 13:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746563262; x=1747168062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dSv1f72q2Br/HkTLRvnIUjJKIt36w5BUq7xaU114oLk=;
        b=LnliKpHYCREHcWBBM98qDZEzVFYPS6ptwGapfr8ulnYyGS8wUnb4xyFByDIWeObIZB
         R6jcH5lJXSf4FrivXgHPUV1/GXB9S+rbQt8mtsnCeIrpzSaIS5/rC0dLSe/N0pxAyGi/
         Oc1l96oGw21EZNxm9tYCo31J6IlctuTJWigpbppKIVgf/OYBnPQ0Led21sVtJ162UDSs
         xMo5y13OI//S04xRkyp5iolGcwj/c2lHaSROGMcfZUQ2Lroggb87jZ2FXV8w2fxo3Rca
         1pERmWysN0O8R7RledkOgNBAMAxEUILLlC3epViXSjACRWjPXsYY7IJGsAeoAtYtxeyN
         NZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746563262; x=1747168062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSv1f72q2Br/HkTLRvnIUjJKIt36w5BUq7xaU114oLk=;
        b=pS6Ktzd0NCE81PaxAKM6Bzx2wwOrMrAJ+7nw8Ekshq529pDsv1m0KtZfIoRSE2mk1K
         goicJY4YV7SaHfRckLVBzkJrUTkXVW8hHkIl3wZ0HMDwv6Qeakm0HzCKXFTjDnFBPSyK
         RLXRU4gckv4hYw8io5QdZoSaV9zlsVNC4yRw6kkb0Vg4vpI2RBNs3WBuwNGLwOJbXdSZ
         cwhzs+SHwIDXyH+Uf9cInxkyWuvEACmQF9wiK7knyVkIkjJ3pIvw3Cu/EVl/EwYrYfLK
         mF6XCx5FgzvDZoFEY6gCBQI2EbK+dNzfzQfViTM44KJy5tSdCSCuY/9x9DmnsX4Eq+2B
         1KiA==
X-Forwarded-Encrypted: i=1; AJvYcCWnzmewzBqym5xKt4ch1576L1EyChgVONO4eCD59bRGrmQLEB0jKUL3dLEVljMqY9qdH7BrElqI+ZnErdCC@vger.kernel.org, AJvYcCWye5wXwCKXeUd3jb8aefLKoh0LTxgTMkxdusbFc9FaF66IQY1qxkWUuJ8BozBd8cm9utBGIxDlKYLI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7mh2v5rVDyuyo5ZzUNYA8rm1vmitQItYIn2hnYeGKaleK0RKX
	Pdos2uRTdIwPM+VkVohCmyuGX12OUVco2vd/3XgqcnO+VjmD7xQm
X-Gm-Gg: ASbGnctSa57PhFZcDWv8CetwqLuIERnvdmd9BrnjC6qvHD4/285R5SzYv/D1Q7fYbcT
	/0NOTZFo7ZgdwsyEcfc5PJjaQ8NF7KsfLBFVTNshSDxxfg/A6H6ntFuNW5RGOCh47Nexv26KlfS
	vEqgWqWq/XQAcIwnFDf9xbthUMIhP+p1XDpvMKY6iFy2ziwA+ZOv+Xfn4NXo2nLXX17ao+wXcme
	NTLzMoRzMDI4OTDWT+0UvcxNv/b4egnvQNoeMrehZRWYqGmn05Pt16wT3K9vTzJYPIOaUDB0Nmn
	SneI7kJYbHGxHON4R93vUklrcQ9Oap+a01vz3WAMfq0QOnax7G5jXd1Cv95RHgbgGUFAj890Adw
	gf8uv
X-Google-Smtp-Source: AGHT+IF28dWY6dX03yamEtrxQ8IDoIkzwFAJdcmE10A1YLS8hxpcBSo7uXAa2s4AhgXsBNi1jsAeTw==
X-Received: by 2002:a17:907:7e82:b0:ace:c225:c723 with SMTP id a640c23a62f3a-ad1e8b92275mr82948466b.12.1746563261544;
        Tue, 06 May 2025 13:27:41 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a1e60sm764564166b.47.2025.05.06.13.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:27:41 -0700 (PDT)
Date: Tue, 6 May 2025 22:27:39 +0200
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v8 5/9] mfd: bcm590xx: Add PMU ID/revision parsing
 function
Message-ID: <aBpwu0rEK_K-9tcu@standask-GA-A55M-S2HP>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-5-e4cf638169a4@gmail.com>
 <aBo0qzqHOkfFxaXs@standask-GA-A55M-S2HP>
 <7eeaa7b4-b76d-4658-ac78-705a5f8e54df@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7eeaa7b4-b76d-4658-ac78-705a5f8e54df@gmail.com>

On Tue, May 06, 2025 at 09:03:15PM +0200, Artur Weber wrote:
> On 5/6/25 18:11, Stanislav Jakubek wrote:
> > Hi Artur,
> > one note below.
> > 
> > On Wed, Apr 30, 2025 at 09:07:09AM +0200, Artur Weber wrote:
> > > The BCM590xx PMUs have two I2C registers for reading the PMU ID
> > > and revision. The revision is useful for subdevice drivers, since
> > > different revisions may have slight differences in behavior (for
> > > example - BCM59054 has different regulator configurations for
> > > revision A0 and A1).
> > > 
> > > Check the PMU ID register and make sure it matches the DT compatible.
> > > Fetch the digital and analog revision from the PMUREV register
> > > so that it can be used in subdevice drivers.
> > > 
> > > Also add some known revision values to bcm590xx.h, for convenience
> > > when writing subdevice drivers.
> > > 
> > > Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> > > ---
> > 
> > [snip]
> > 
> > > diff --git a/include/linux/mfd/bcm590xx.h b/include/linux/mfd/bcm590xx.h
> > > index 8d146e3b102a7dbce6f4dbab9f8ae5a9c4e68c0e..fbc458e94bef923ca1b69afe2cac944adf6fedf8 100644
> > > --- a/include/linux/mfd/bcm590xx.h
> > > +++ b/include/linux/mfd/bcm590xx.h
> > > @@ -17,6 +17,16 @@
> > >   #define BCM590XX_PMUID_BCM59054		0x54
> > >   #define BCM590XX_PMUID_BCM59056		0x56
> > > +/* Known chip revision IDs */
> > > +#define BCM59054_REV_DIGITAL_A1		1
> > 
> > 1 seems to be the digital revision ID for A0 (couldn't find the analog
> > revision ID), see [1].
> > 
> > Other values seems to match downstream (as far as I can tell anyway).
> > 
> > [1] https://github.com/Samsung-KYLEPROXX/android_kernel_samsung_kyleproxx/blob/cm-13.0/include/linux/mfd/bcmpmu59xxx.h#L82
> From my testing on a device with the BCM59054A1 (BCM23550-based Samsung
> Galaxy Grand Neo), the digital value is also 1 on this model:
> 
>   bcm590xx 0-0008: PMU ID 0x54 (BCM59054), revision: dig 1 ana 2
> 
> (This constant is not actually used anywhere in code yet - I just
> included it for the sake of completeness, since the BCM59056 headers
> in downstream listed both values...)
> 
> Best regards
> Artur

Thanks for checking Artur!

I guess both BCM59054 A0 and A1 have the same digital revision?
Well, to be sure we'd have to get the hardware, since downstream doesn't
use this value either.
So I guess the patch is good as-is, we can add known IDs when we... know them ;)

Regards,
Stanislav
