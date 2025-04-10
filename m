Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CF42905
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744324482; cv=none; b=aLVJhrmJfh6EJX/Obc6fiBnqzZ/LwHug8m6YkNneLzmk/WHGhZmEI3shcW0L8Z5/fTc0AQ/mrnrZ8IZILfgUKo5oOvaISmEdUWMnTt4EWVlDPE2nsXh7wBysnmP20VlB5lPmIOfWAYZCH0n7TxmXObdv+k4/QnrL5HEzRf7s4CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744324482; c=relaxed/simple;
	bh=Wxm965eZNAy9BW5/MykKmQUsmb3umX7nRNXwA9XN5e4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LUtk62oTj6Ibe3Htubcov8zsAOVSwnoWbwUFAx/xzd9BoCsiv9+PJXxGcwVoWDAMYm0WmWVYv7STjerjFbVFKk8qukzM4neauWc+ZmJEmlwpZjxWO+ztdGxojTgINjSySGGevA1Q1h+9vU13w7ajJDv+Xp5wdmy80/d1Mo65biM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jYqxCwHd; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jYqxCwHd"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so12725731fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744324477; x=1744929277; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wxm965eZNAy9BW5/MykKmQUsmb3umX7nRNXwA9XN5e4=;
        b=jYqxCwHdHnnqKhroxew6oXqaqFEI2JsfqqI/rdYg3v6VU/L85Hg337AbxJy3m4qhRp
         JP+wPeyXYM2I9lK2hFZvsKRpGH8GlBv2K6zubBKnAMzJTx+IWUm8zcFRUV4HsMAyeAj5
         qd28iTFS/qCksMWxft3xpUEyKfTLdY8hfHDKo0rpG+okX9pK2N1cIienzfwKARr/cbAn
         J1s/Mo7Eez1JAF8Dffr5p0ELBkyHDOjNk8USgmyW1DHCauh53C+zFNY+breMxKq2uzPQ
         SgTiOP8+wxzzsCF7lvGqkfk5kBCOzYxNEE3A698K04LX/d0ZTq9HnLwcfR6YVpDjdjzZ
         H7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744324477; x=1744929277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wxm965eZNAy9BW5/MykKmQUsmb3umX7nRNXwA9XN5e4=;
        b=wzDRpyyYC+JFYktKo82POWYDKlnm8LlNG3ZsQqxrelBFT7Fw/TD4DQiSjKAPOtQQKQ
         H793IJaddxPNXu7TTvuRNuuDbwg3E3O9lPSoeog0b5jXWANBFKrcMKChsb0AUYsyl3ft
         +A4i9sHrgURw3d/paAXCbad/Z9idl5DD8ZWcLk6Cca5TtaatsiiNiGgYi4sUzvLlvd9D
         a6cnH7SuiRGTsAZqgoyZJ3Jhw0/7fRTNTMuIEio40407kJB/+389K/Kwfo7i9Bx4Ccxj
         gG4ZPNhbXtraekshqvmA+P05dIGXM1dhZL2fiG3nAMYDK7OAOrULsqOdayFQjsrlfnFz
         Vi0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrvi5lttrHG/HBTUUcL6pC9tZrZEfNseOcUAPdzHiKNHasu9FN2a8ttTpDfb6bDry165/ij5jqPo8get0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCDhBqpTKG6VKpfIdaTZZA3AEMKcw9ehyD612ewHtkT+ze5tCr
	nPKGXwctX9HAD4gcLZGy1qVgfzgkM51KkaU5Nxd9Zg2TuWi2LM1YsqqsqlrWrhObTFTdKKDt9gY
	F0A/2+Sa4hDRNCrQEP06r2yXPreLVqmgjNqcQbw==
X-Gm-Gg: ASbGncvBKgDU5Nhbh66Z8MDjzW1EGog/2/v0k7kwK3M4K7BNJmf7C+MsLFlHwdkje81
	DtQGgkCUprM5zYPJElhlGIpBU8uenfvo2+fRg8JE5nNXWoeJyRldhSg2h9NQ1YQ1ziITnNiBLus
	bZwT7qvYQpvK6mwKmVxB4=
X-Google-Smtp-Source: AGHT+IFQ5X/At+JSFNbUE1xnp5LyBwwxt4xHNs/nHrO41KOgi6pNuGUXCpYt2H8bLi1d5Neb0s+pA/F8NRLAxfh8kDo=
X-Received: by 2002:a2e:ad92:0:b0:30b:d63c:ad20 with SMTP id
 38308e7fff4ca-31049a25e74mr1251291fa.24.1744324477293; Thu, 10 Apr 2025
 15:34:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318030717.781-1-vulab@iscas.ac.cn>
In-Reply-To: <20250318030717.781-1-vulab@iscas.ac.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Apr 2025 00:34:26 +0200
X-Gm-Features: ATxdqUFAOAmsanh_qMDDdICzYFdtcgmjMNVzfkr1X-a4RyLKP9cm2UhbygtlpGw
Message-ID: <CACRpkdZ+VTCXudLC8L0zK6+Pwd+_NpFDfnR7nf16BXgEnXExeQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: at91: Add error handling for pinctrl_utils_add_map_mux()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: ludovic.desroches@microchip.com, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 4:07=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:

> In atmel_pctl_dt_subnode_to_map(), the return value of
> pinctrl_utils_add_map_mux() needs to be checked, for the function
> will fail to associate group when the group map is full. Add error
> handling for pinctrl_utils_add_map_mux() to return immediately and
> propagate the error code to caller function when the function fails.
>
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Patch applied.

Yours,
Linus Walleij
