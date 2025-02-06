Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32D419DF61
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867605; cv=none; b=k08qKOM3YMZaZ9b3BNAMMeM8Z0OG0ldWvv0+Cbbn1FPkbAdqryceXOxYHisBNCAFXficVX26ZgtClD4zs/XTCho+Q7iS+QpeD/3bSQUvS+BxwGt3WuIYhNIM34xZWrpEO+GJL+bv6mJP6wDLsh5N9Aop+y0Q36ZGzDzy5t1bpBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867605; c=relaxed/simple;
	bh=P0zr8OoINeTGs7g0sjgckyXehEfeKe5nFPFZvgr4A7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RpJhV3tXeKMjBBxYwGY7HpCLmhK/D+FoNWl5iG3Y+NsxdEGAGKUy3lXB0d8WZZs41Fa+U3VujuyAQmUl3KaGcnE1fxd82moobnt6AnfNZ7aNeYlpsIUiVtf16BVAh5lLT/Zku6hYZRaA1/a0u5zc+vP29rWACGzh4qd8B2mS6Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HSb8bKjl; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HSb8bKjl"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30738a717ffso11478761fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738867600; x=1739472400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0zr8OoINeTGs7g0sjgckyXehEfeKe5nFPFZvgr4A7s=;
        b=HSb8bKjlCso8Q2T33K6TqG78MC1pBc6iML9i+BJ8Q0DgT9npYfT9ppCDFnD8y26dIO
         q/bS5EVPVi0bwLw+Vf13weupn53gFOnG6j8UZB0r6mPsrIUzmM9AMXW9Q1sWhpK/ZvXe
         pUpJUj+ITtePG3fvDFxFRoc60DY/bPX6ssJ/mXBpmZ53Aa4ZMzX6aUSJJVaXWRm20mkV
         EL3ZyJz3zSio1/7DKWPuAWOP4VahXA735Hkg9ngvlmFLp0nr/wwFT8b7P35MVG+5q1Cf
         8lKMd53PhI0MoiAWFLrBlsoQpNgt+NQIFrH9x1RGdk96WrLI6MY5DU9xsUC7hG/UFxFa
         6HPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867600; x=1739472400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0zr8OoINeTGs7g0sjgckyXehEfeKe5nFPFZvgr4A7s=;
        b=w3E6ss5RENLhbHEbgrRqNnJZOTXBqF3zw0LmJAHq3ZPX7e4O6sOcIrvsMkIzc7O1p/
         7PrYtRyn9yuDdMyHMze5UHyI9jGTtfaionG5vU9H8ie9HhdsqqYWWeY7gkqM7m/HA6sS
         gh5ypSGTZF27HRFcLwfUnv8bsh9qjQYjDlzvruYp4WcEG96knrIZtgxq9c23Ua1UyFe4
         wirjUQwtydyC403iEWbZ1oxLZIcJQRjEPfZ2U1+KG/a/aCFv3JZ7kRXHM4xxP4+zIg2O
         qUI2c6Mngo4hKWPewFdBnImd/MW2AucaH8YtC3R/+zCUH6vuivFY9vxwuTOO3dZpKTty
         OXIg==
X-Forwarded-Encrypted: i=1; AJvYcCV3N+ijSlnTea2H8kp/kuwIv4xr77hYXNYrUezyAFYqrTvYfg0sl7xLFpwCpOj3re9ZBRqNYs5Xa1wxMaw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzAraEJE159leU+d1weh6A/M4Zx3iKAfkZ1Tp5Ce+aXp2t95pA
	pDztpAAGRJtBrS4UX3LUlyb6PXRvN9xS/Y8SlyCXSWjX4Gj34m7RTbjrF1ZLQC6YLiEBBzxEjAc
	4b59lVEYkGWJnJ2j3iWe8OXZvbkSv6fp46TEWbw==
X-Gm-Gg: ASbGncuKoigOa0xnOktnFJbQQEz3HWJtD7R19mNUZTrk83/Wpvwp8IAsU8cRDDReqbW
	3ql3vbFDJL1XRm2gMjxZDiLQqBEH8s1cMdOI5nQYin0ttyRubdsC4Q4Lvvdrv+auGr4fbOds=
X-Google-Smtp-Source: AGHT+IEpzVZeWcxUUFevUxXUUtkE4eDoK/ekTj85xIIJYmnvT+leN3VUeeipd/F5aigtmYFlfRv7++sKlMafMRpOAt0=
X-Received: by 2002:a05:651c:548:b0:2ff:a928:a23e with SMTP id
 38308e7fff4ca-307e5a7c213mr216161fa.25.1738867598438; Thu, 06 Feb 2025
 10:46:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203080902.1864382-1-raag.jadav@intel.com> <20250203080902.1864382-11-raag.jadav@intel.com>
In-Reply-To: <20250203080902.1864382-11-raag.jadav@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 19:46:27 +0100
X-Gm-Features: AWEUYZmP4B2GJCmX-AuJOGL0VPK6_mEkpxI9o4n-GutRcEqg2kbz1wZ69XnDlBM
Message-ID: <CACRpkdbKzZ2WWEOE=ustPhL9GjmN3tkoAsgThW3ei7Gjstbp4A@mail.gmail.com>
Subject: Re: [PATCH v3 10/20] input: ipaq-micro-keys: use devm_kmemdup_array()
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, 
	mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com, 
	dmitry.torokhov@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	sre@kernel.org, jic23@kernel.org, przemyslaw.kitszel@intel.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 9:09=E2=80=AFAM Raag Jadav <raag.jadav@intel.com> wr=
ote:

> Convert to use devm_kmemdup_array() which is more robust.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
