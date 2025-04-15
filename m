Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2FD2957DF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744720507; cv=none; b=c1qL+euCt92wWP5H4HDTceUNCmIMdAo7Lkzqyv5p7UcqzC9hIw/byl8JRt0ObNAIaR7sq3eDdQ/xcloNQu5gIBdkpPvLKr3vr1nvzN6W0SEAEEpctVIjd4pI+unTPatEYgvHejf3obHPjIIJP3sGb2agTQHOOp6ooTAtUb1j8OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744720507; c=relaxed/simple;
	bh=2bbXyacdzPk+p8lyYhXlZXFDt5Cp5S5tHs7kevP8R2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJ4WDG51Sy9/SuaXCAOEjDO5vpfeT7w+YDo/gq9enNnpV5ImOrGUWrJtDkUwBChsrCYljjTRIsBbFxYWoK15bm5kfbrKEXMWe7QCwFmCVxpVRZVLUcOmKP9pwhrf++Pz8jc5mF0DgXvQEMKpm5qgCALgL/5Pyuo7FM9GPoesPGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQ7qGav9; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQ7qGav9"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736aaeed234so4351696b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 05:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744720505; x=1745325305; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cjJuU9Lc3xslp690vxv/4ft6FfULL/9oC8TX+DX3eQw=;
        b=dQ7qGav92ohH8JB0es1QaSK+ZOUnju2a6TjtXiU3/UW9qYhFQtgfclcmOEfNTCKXQA
         NN87UcduiQPeOOsUx4urFxnwdQlrUmHqodeWu5KCeAich6ie/0KrR5NPRC4s1WdmBsJh
         wS7BhRawZy9PIzy55XoDIZIJR455gSSEIegp+W5fMdDVQNTJ+AIcXrRhbTGACmqJzvTd
         aVBsDNerfv1TOJ5zSgbT99P2e/2IFIxRMrSeQ+PhuX4BkhDDOti54m3b5aMSWRTIFAkM
         b+dlU34Qpg+YJ3g4kv1E7GePWIGF+mRcUVReT751i3CnqveM42KMSKbAkDY6JmpdFGS1
         rEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744720505; x=1745325305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjJuU9Lc3xslp690vxv/4ft6FfULL/9oC8TX+DX3eQw=;
        b=qTcHkFawkLTvXhbLakz3jxRcLaDB3BDIF0F0EOckvx4ZWGz8QhBEPWBNeOpDZt/R6Z
         W/RWjU2mcAYxlDopF0hdwZewBaJF/TFV2rQtznuK20iq9SH7DSjCYMQixssT3XtDq17J
         S0LcsCYZBnepOerzDk44JvN66yMEApGif2ti0U42ca67MnI2YFSB4kA1C0S9CWTiu9eI
         Zbel35KjP4p4RoPZZRsYm0aFXqYZ8M+1iXSowPlNslpgzmmmvUvg3JdxZ51oeyNoJXDq
         y0voziAhGYxejhPrHLA+Zx94/5imaIFYHQwhu7JXGfROE6YU7AjlrcBfGyqCAaK+7xmJ
         y2Rw==
X-Gm-Message-State: AOJu0YwNxEf8ezXtf2WiKGHeUj6UEkC6E097/w48SjDHLEP9H3EXs81v
	v1t9s9+flHlCckb1czYHMNxAqB1bcXnFDAIx9y1i6kVd/Y6dxK46
X-Gm-Gg: ASbGnct3dtnJvAQG1WN+7FAMngdMOcdhZt6YmALpjMq03McP3sxDsNUqSjou5qzaT1C
	6eWQw9cMqopwsSHsTRzghnUcGtrtKphzcVNkFyGWXdqBp+L2Pxl0vdlZSlaLwWs47w9WhAYpykW
	mB22GfqfazwvLiwXxLPRF53Dyc3T/HTuuqF28NJzz0aFtOwrdIKG4MXmEOK+cNjwmgluJZM79SP
	FrDqrjrxsHDKJxuQ3OvXEJKxD2puP+TpU81OuNiko9d6KH1UJngW7rQwduvTeuaA5L6QJWfLOrU
	UKeGVYs9MnoQj2pSGuiHhY5YzqS52minuuLyNAFxLUkTV1QWsb0=
X-Google-Smtp-Source: AGHT+IHyyUBCwSPhooS9BQfOHuxBYn0PWQz551UcysGaeWq7htXJoZ/v3MVq0hslhiaMoWw4IjM8+A==
X-Received: by 2002:a05:6a00:21c3:b0:736:4e0a:7e82 with SMTP id d2e1a72fcca58-73bd11e2d4dmr22471437b3a.10.1744720504732;
        Tue, 15 Apr 2025 05:35:04 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f0f72sm8347960b3a.89.2025.04.15.05.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:35:04 -0700 (PDT)
Date: Tue, 15 Apr 2025 08:35:02 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v1 0/2] bitmap-str: A couple of cleanups
Message-ID: <Z_5SdhGGyg5MtEZU@yury>
References: <20250415083156.303914-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415083156.303914-1-andriy.shevchenko@linux.intel.com>

On Tue, Apr 15, 2025 at 11:31:18AM +0300, Andy Shevchenko wrote:
> A couple of simple cleanups to the bitmap-str.h.
> 
> Andy Shevchenko (2):
>   bitmap-str: Get rid of extern
>   bitmap-str: Add missing header(s)
> 
>  include/linux/bitmap-str.h | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Hi Andy,

Can you please resend with non-empty commit message?

Thanks,
Yury
