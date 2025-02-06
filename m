Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67493239564
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738861983; cv=none; b=q6EXldMO+30BT6D8Vue7geAe2hP5gwf9rUsg+vOTGq4g3eZlSjVqsslswd3iFf6HFLrVPTNwpDQ4k0HtErEgOEPMEvJZRj9SKq4o8ogegMaNjDjJISmnh7yD554TNnPCty19XqXDaR2pJfCh9tsekbZR0wyovTFrOgTZggbUj5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738861983; c=relaxed/simple;
	bh=JD2RvonAJ9DBFMXuKGU9NeO0g72GuuyBmB4wD3G1Gnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cnlqtXGeeg2bJLA66lKaUIpx1Znw/Q86uFtZVlnmUQeNG3ZIAS8hpjQhJSlTFxrFwc57abvOXBOC+kP08nT+wkzyGYzzOLiOSjo0007BqWubMdgZ77rq2ONMgYIyK5m75uGziSJUqS2Te1U+nxbkOUaRnLQNjh5nAoSXzhZhB6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SMvR7Uen; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SMvR7Uen"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30761be8fa7so11008141fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 09:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738861978; x=1739466778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2RdyVj5jOCd3ia3pc2+O1XE+ZT30tuGGwdgIs4fbdI=;
        b=SMvR7UenLjMWpx3bCiVlgHwYA5MZgaTQegLwMQQ8By0XAkIfVAIu45Hp9Ut3eFUZHY
         qtwZWL3lToreh83rwj4epHAZpRQ6nfa0DcsdUOCCOx/I4Jc7Ro2PRfudDDAquIehkkQs
         jzgIfFQyryXIVkEkrUWDcmo9FZh3oNh53e+cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738861978; x=1739466778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2RdyVj5jOCd3ia3pc2+O1XE+ZT30tuGGwdgIs4fbdI=;
        b=u4z4pBf7vCAHBLGfwvmoCnPSEqgpXpNcIyrEo5cfh2yWF7X6e9c1r78/aWYeOK7brb
         cdUUV7Ny5UPjATXlsNh8vhRn41uVjjyK1ZKLclG3Z9Brpj5bfJqCwaMMMeofVIoGLwon
         TwqWlxOioqDFpknS9m8rdPbzDQzJXx12ujLq9G9qYarNzxZii6X5Ws40KSo3dx9WykMH
         O4W1b9etwT3LwGpxaIr+RrtSmgjUqXJj+5vEHyY7IRmLyco/u4kroXisigultaxBLPX9
         lFs5ewYi0+paAf/foCRdQQp6PKxHZ/2gFRla0If+jIoDfiqINc4/PHoy/3UhEduck2mb
         JQmw==
X-Forwarded-Encrypted: i=1; AJvYcCVgHB3lzd4PbunxxtoDFD8QIWkqPdXE4aEPSkUJ8K7XSmy9oBNyhe3Zc8faXP3v3wADHIy/S5UaYAaxSnw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj7I6t5EZN7azrHq7GX9/r7Zu0Z7jloxCzlZ8iF3TCJsm2s1X0
	9ZP6n9oWDuHe/wmFavGU+xyTRDDEfJGYj6+Iw07VRPXi0+zecRxlVp6DBi554ikDuzXHO62q6/M
	Uzg==
X-Gm-Gg: ASbGncvZIm0dysflQqVNrsSd2X0vQjLVVdJntIXLfw0Mb+ovIxIB2hW6d18l4u5Oztb
	wqPdz0zZlCAGDE+piVmMzMFScHlmZWmsIkh1s9ZKh11d8Sw+GIlfOu2hf6G+EKhyOREgc4BXLOo
	rrx5Qg+PI1pYOrIti8aEUkdNxO6gsCrJJ+cp8nawzVbXCfwvN57kLipR89VrV2bccSMLgSio/4Y
	Du4rLI0bt9qpKdNvcyNfdAU6SaiGxuScy1YGrTraF+Dm2d83ACUtRJ4hsdGxIj1uWEe2Hmcg/Rw
	FJ8SgfSaf1ruWHCKLwXpHZA+X69R/5OsKQAfclBCGEUrpE4h1PT3KAU=
X-Google-Smtp-Source: AGHT+IFj/N6bSMIV+Rac0ekkTr9BujokRFQ3ROOnbX04xZAf6tHVfKMImx01C3DDP0ESLCOh2YQ8Cw==
X-Received: by 2002:a05:651c:220b:b0:302:40ee:4c2e with SMTP id 38308e7fff4ca-307cf301980mr31892471fa.2.1738861977950;
        Thu, 06 Feb 2025 09:12:57 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de2dbea9sm1669551fa.100.2025.02.06.09.12.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 09:12:57 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-543e4bbcd86so1316417e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 09:12:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXByu1wvX4xO9XPqBvknOAVECghXhtWDlO9PEF/QAhrIod8lfkEN+OGBp9IOdzNyVDY4EbiJLUvIodgU1M=@vger.kernel.org
X-Received: by 2002:a05:6512:118b:b0:543:f1a0:9e88 with SMTP id
 2adb3069b0e04-54405a67331mr3046321e87.32.1738861976679; Thu, 06 Feb 2025
 09:12:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
 <20250206131300.1295111-2-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250206131300.1295111-2-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Feb 2025 09:12:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UfWJoUsKzYMkyU3U4Yn1ufAs=NHMCDL+db887Uec9fww@mail.gmail.com>
X-Gm-Features: AWEUYZkoK-bVDmYrUZC5ORoOtjHMjmCrwad94ZOQdmJPAxCPBnzPQFDM-XcGn8w
Message-ID: <CAD=FV=UfWJoUsKzYMkyU3U4Yn1ufAs=NHMCDL+db887Uec9fww@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor: add csot
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 6, 2025 at 5:13=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> Add "csot" to the Devicetree Vendor Prefix Registry.
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 42d14899d584..375f1f7c79ef 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -336,6 +336,8 @@ patternProperties:
>      description: Crystalfontz America, Inc.
>    "^csky,.*":
>      description: Hangzhou C-SKY Microsystems Co., Ltd
> +  "^csot,.*":
> +    description: Guangzhou China Star Optoelectronics Technology Co., Lt=
d

Doing a `git log` on
`Documentation/devicetree/bindings/vendor-prefixes.yaml` shows that
most patches use the subject prefix `dt-bindings: vendor-prefixes`,
not `dt-bindings: vendor`. If device-tree folks care about this
difference and they don't want to fix it when applying, they might
request you to send a new version.

In any case, that's fairly minor so I'm OK with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I would assume this will go through the DT tree, not drm-misc. If this
is wrong then someone should shout.

-Doug
