Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19671EA65
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 02:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745808382; cv=none; b=mTILg1WcM9WotSq91sbnbzfN5jJnXaNUpToO5M5qC8LmbhxOK+IuRB0M9x20By+qScGXsgPpMFaQPAPz2t6Y9b+rTYocwkie0huauxkJcwyx6ASgqeovqhtf7f6PN8Gj84dcFzJP+9RRakrAkseZ7lvAZ23mnRKxgDkYNUK+ezU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745808382; c=relaxed/simple;
	bh=IfKzZySM9EUQJqp8130gsM0h0TRncUUI3ZQ+y8xX3+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U/RUIt+YkHditgvY4FBsTv0DiM24kvCfawsSAvSNA2Bz2p5kuI06sEnDCNOt+Z2v/DLzVWQOnejP7V3UAhkjCHzsKkgoKjXfKB5jE232mdMQufci1vfTsiq0ehYk6gzUBKSujpTspcc7P8KK3Cyb4F8vGpqAFgc1UYRXh4U7OcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lessconfused.com; spf=pass smtp.mailfrom=lessconfused.com; dkim=pass (1024-bit key) header.d=lessconfused.com header.i=@lessconfused.com header.b=BdF9VBkW; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lessconfused.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lessconfused.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lessconfused.com header.i=@lessconfused.com header.b="BdF9VBkW"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so5786817a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 19:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1745808379; x=1746413179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IfKzZySM9EUQJqp8130gsM0h0TRncUUI3ZQ+y8xX3+w=;
        b=BdF9VBkWdKw+1BagUbbp5tNHDs26sfsUdiU8uiiRiR5qIGuvAc3uNoz5HiFkT2PTXa
         zY06/bRY7Tv60JzLbXDCQbXlOBeUz6dvqzk1ZP6FS0b4eALUiF3VW2VukbP147J9vEls
         +Dpk6KKwaQdPf/+9kkvqS/kU0d923tl29zsnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745808379; x=1746413179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IfKzZySM9EUQJqp8130gsM0h0TRncUUI3ZQ+y8xX3+w=;
        b=r38rlN9mSaS18zfGQZFPiYu9rkeayyaM/5EkujsGVPzVMuMBXNz0M4rqQh090AvvuF
         kf7OzKlIOHleHsKfjrzYfaja7fEDIHAFVKoOv0g0r9Jcs5kUh/col8vjIqffjlNVWiOV
         bH2a9/xSjuy2MyyyfS5A203AbmybRnQKFDB+I21ae39i9Q3XtkK5S439tJJWAbef2bgV
         l7GGd7jfBaQgE/PG7F5yE17LbXOi6n+hRGn6AIqgClPI0AP1wriohrfPGBlEETmBJb1J
         nT55nrZ9/+hJSLMU32UR5XriRfFB5dCEPpI9EEkZfHwOe2oGX4NUKQ+dCU8A/psO3cWk
         iq4A==
X-Forwarded-Encrypted: i=1; AJvYcCVLbv4BdaRxDIrRlHqeljJhbSlypOIRtCGbCBWW2Sh1MNnHoKyLMkZPm9M8YqtNOPSaf4z5V1f8SZx9FtA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWrEK2psnhw9cHU7+L3skguuvtDB/DvMGULRH8aYEnUtKz7Q76
	mN9FOXsrj5DEsCq7L0JGPcZahZpTkCjBFeDRcjgW4hpyS3zx8x0ZHPqej5TX+rxRbQvW68Hj5qY
	fkuhxskAl2q769A4Do/8ZElh8ayXLJryj1vnBNg==
X-Gm-Gg: ASbGncuTd1euACdkf7hB2np5ewIKD4/211j+laV/ZglgvYcGB3nxscDLhO8jgrKlePP
	ldSh1azaluyojXyrzjFbi0noXSwLvzxGY0xmCbgdq9QEgUID72xZUlOA7KAJ7QmnQqLayqLAdbs
	DoCetnpEw0FAQJ4BvH1fgjGQ0SUrfwf0OS+hmxuDC94XDX3eoM3atr7NI=
X-Google-Smtp-Source: AGHT+IFnzBUOX899hEhTQB+VFNRLl+PxXCq+IL10Ns4KASmw7qSvMl53RlFdnCNy3FuGcz9Ynut9j1cIj9JyY2lnZPI=
X-Received: by 2002:a17:90b:3944:b0:301:98fc:9b5a with SMTP id
 98e67ed59e1d1-309f7da6d2fmr14756992a91.6.1745808378981; Sun, 27 Apr 2025
 19:46:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425203118.1444481-1-da@libre.computer> <CAFBinCCUQizs=XWq7knm-4=3=hzPDNee9RZj9LDD2Mi6DHYBrQ@mail.gmail.com>
In-Reply-To: <CAFBinCCUQizs=XWq7knm-4=3=hzPDNee9RZj9LDD2Mi6DHYBrQ@mail.gmail.com>
From: Da Xue <da@lessconfused.com>
Date: Sun, 27 Apr 2025 22:46:07 -0400
X-Gm-Features: ATxdqUGWEOGuPy-ymNWEfY9-YxSHKLuGJnDXSl4c3NrXQIsa-1uCWVa4Pkv940Q
Message-ID: <CACdvmAhn_25GWtOwGsChU-U3PV481_h6-pC3o3G4p7T0Z5dHog@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: gxl: set i2c bias to pull-up
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 27, 2025 at 5:11=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Fri, Apr 25, 2025 at 10:31=E2=80=AFPM Da Xue <da@libre.computer> wrote=
:
> >
> > GXL I2C pins need internal pull-up enabled to operate if there
> > is no external resistor. The pull-up is 60kohms per the datasheet.
> >
> > We should set the bias when i2c pinmux is enabled.
> >
> > Signed-off-by: Da Xue <da@libre.computer>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> +Xianwei Zhao (who has recently upstreamed Amlogic A4 pinctrl support).
> I suspect we need a similar change for all other (Meson8, Meson8b,
> GXBB, G12A, ...) SoCs as well.
> Can you confirm this? And if not, why does only GXL need this special tre=
atment?

We've only tested this extensively on GXL (S805X, S905D, S905X). I
think we should enable it for all SoCs if this patch doesn't cause any
issues. I don't see most Amlogic boards implement pull-ups but I
haven't tested that as extensively as I've done for these.

>
>
> Best regards,
> Martin
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
