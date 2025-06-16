Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D59F1F4CAE
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750060747; cv=none; b=AgBXYllZ1NO2c7ZtX7gp78mQ6/wauT/DDbdTds77zqtDfXdy8XvKBRvKsjjkQvAbbT7F8BxOi0VV0+cxdJ+cGm7xxd0y64h+Lll1/CzYNVDtt9tmeA+RAgnJGo/qDi8WNAHQ7Mv2htSaIRWCqnkm91oufCn1kvBn1vu+26l0bMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750060747; c=relaxed/simple;
	bh=1T6IjBkkCJHFBnh407HmUfHb7FioXPddTUWWBz5WE20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b9p5qAyoLl4AXG2ToZgqtWOjJl9JRNByEAI31FTpZtGiqCMCLYKQouY7QRieLzT9hcvtv51c6X/Tp2TgAurYqqWlLGx3aZL8Hut1Aj0+Feq3FDtSADihLm1/khvXERMyNPVxANA9mHhTH87WHPiynHFOUcdSGnWB82rvpNdt6Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BelxP/me; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BelxP/me"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso1039101e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750060744; x=1750665544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2If63ODRfbrLnHFFfJzruxm7jiaMfANCbY2ty3Qo6Q=;
        b=BelxP/meLxsFS4kqLnYujCEVSd5BmNUvX7G6XGN7v2JCcDp+yXOwwZau74YvLiZcIi
         Oz656V1y4Rxyxc8HE8IV8OMW1fcWactlh8/Oxbxj8hrIbOsAnN3lV3mqMhr+LJZiEAmX
         zPLEj8dkPiDPbj6IElDEAB/E3gG8fXIk51mXfI7+XWcrLYhzFd7FR02dcGWuXLoFacw2
         c11z4lM2ksjyWq4RGpLqK3nXdIJA0w19Ju3/XlnydHr2Gbnt52/sQ2K2ip+As06ZOIR9
         I37wocXsD2tnTkebEWMgLf0Flz5Jf4fbwZws76rhyqldiJX7WBSPYO605NKeb2M4Z1Wn
         Fljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750060744; x=1750665544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2If63ODRfbrLnHFFfJzruxm7jiaMfANCbY2ty3Qo6Q=;
        b=EV0LLMaTtwnF5NH4JgpX1mO70LEvpB1gEI3fp7E0QxH5KqjrcieMnfHSzi9pMnPSmR
         5FRlsQDZt5jT3ERqPAz8nUN++mbmClTkC66P7N5lcHL6CXOuQRgjUUaXDOd19wnb1PGX
         TH2kXfXC5t4Kq1dbaRnYTy3jFrwm4qMsKSTOljURkcnjS0+dnWfBLTRrbtXMB3BkCZ76
         a3v7JhHF+ukDEIRJfDwUqlsBjCPaa3zrtt1559ifvxxiB+esocVPlLiDsFK3SC7Rw2UR
         38ngW/ToVlVH1cBhKnm//AGKdl5TJV9iopCT5LiEzyTpbCIrjT4bgiYI3gz0SK2jUbZ8
         ZPpw==
X-Forwarded-Encrypted: i=1; AJvYcCX9xw7QREbDej2nJ9v/DCFXA2mtphMiKjp5W+VAGjJ9RZHxiIWp7/A7i2RXry0rUKinJZQfYqUhRvJRixM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBLE7BuNkSKXMkNWZs7pXndoZdqXkvOokUrrJWF7XwwDB69qRM
	v8cMHj7VVrTVpk63ZHawO0E+UxecqmNbKfyKsuoA1s8jG1GAK9T91iOvkq3BTkHE04DXzqrZZ1/
	idRgc8SN9He+KHICQ24qwlFm3f32T3RhvpUTBtz6r2w==
X-Gm-Gg: ASbGnctkQTaE3RLkAVm/dnYVMN35amDlpTcLSAjc32/j//wpMflt9wWusai5ETfXrfK
	qOQmDNjezDrdjgIs9v5UtCsc6X8lqNRo6HYQF2Fe3FehjpXVum7tt048JClMSAJXarNe3N1FPuV
	1zeKeibxQ6ocpmEG8OrQqeMj2Gvo70dGk9r9cXRHeoN04zVPX8Hl1ObHdabSuIjI1PdfnvgCX+Z
	f39DMrA2C3Vkw==
X-Google-Smtp-Source: AGHT+IFLwE4JolYrqDY3ucORLYbsDctWANWwZn+tNURixWHAHEPOkz0T4RT3JCHwLsZUBmNxDU0qg9OgbnLEQQotids=
X-Received: by 2002:a05:6512:691:b0:553:268e:5006 with SMTP id
 2adb3069b0e04-553b6f48e6fmr1780051e87.55.1750060744234; Mon, 16 Jun 2025
 00:59:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613163443.1065217-1-davthompson@nvidia.com>
In-Reply-To: <20250613163443.1065217-1-davthompson@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 09:58:53 +0200
X-Gm-Features: AX0GCFtnLMsiIB7hgD5na3cNfej1HTSWmpdWk_0nyRo1gv66sbuxt9MHDo3g7SI
Message-ID: <CAMRc=McQ-dAdt=eAkk+j+5qs7ZyVDuipE0ptQTrbmGHXf9jjKA@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: mlxbf3: only get IRQ for device instance 0
To: David Thompson <davthompson@nvidia.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shravan Kumar Ramani <shravankr@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 6:35=E2=80=AFPM David Thompson <davthompson@nvidia.=
com> wrote:
>
> The gpio-mlxbf3 driver interfaces with two GPIO controllers,
> device instance 0 and 1. There is a single IRQ resource shared
> between the two controllers, and it is found in the ACPI table for
> device instance 0.  The driver should not attempt to get an IRQ
> resource when probing device instance 1, otherwise the following
> error is logged:
>   mlxbf3_gpio MLNXBF33:01: error -ENXIO: IRQ index 0 not found
>
> Signed-off-by: David Thompson <davthompson@nvidia.com>
> Reviewed-by: Shravan Kumar Ramani <shravankr@nvidia.com>
> ---

This looks like a fix, does it miss the Fixes: and Cc: stable tags?

Bartosz
