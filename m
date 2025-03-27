Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD2B1EDA10
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108877; cv=none; b=LU41Gigy30gZUNk3F9pXxt9lPMyMZqPqK5OlP3aPmKD3SZ8ecmpliBGZtKZgWhdx4N6Ymk0hg0RrexatMdWEwFUs8Xtjn2xDMZWPoE79940x8n1xHxqM2JS8psKtyyW58r6IzVf7UaHgmeCjduV3k1SXKCX3pBsDfKpGtFriesk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108877; c=relaxed/simple;
	bh=MOixnmZ5KSrzGpzYrCJ9WcwNGK7+qXqOG+AfZbuba5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cBr5c06HbBKXGOPj5IFL1ebQvXXDvrulybPgMxWmgjHABHuFHq4OTo6m1ieK6+zsr2g7rrtFzMSHjTmi8fpzVWVUHJSC0txuJfuieIXXbumyqPOXJjBhrXWzSXZz6UGnCNFGnefDxK/AwlydBP+xrmbFJ78AsLyfNxt/ksPgdOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PE7BOpUe; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PE7BOpUe"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54957f0c657so1656873e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 13:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743108869; x=1743713669; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8UsDIEuQLaBq2B4bFyfUGHpD+OjquB6qiwgS7a8XjY=;
        b=PE7BOpUev2oi5+mTZeoD7RRi4AgaLCCOkG+KFjqaMXamCIqNn8uRFcFR4j4xSlvotL
         p0J9+sfT4o/Og3ug+MTV/Ytk7k5N5jPj60NYOp6R15uj7zi+2Vws5jR06SicpSmAI8Zu
         LaCY23/9D6upSaWur6g7U041d+4tXcVyoe/5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743108869; x=1743713669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8UsDIEuQLaBq2B4bFyfUGHpD+OjquB6qiwgS7a8XjY=;
        b=nOmIuU83QgeLWqMsFoGm7Bg2bYJwgVhf/fUuIQRWuBhm5G3WeTCoV5ZRm15NU4vr4L
         2+GfE2bGRv2kmqBMlPwuTvjiSuhwVuRrsQbhPEQ6pdcDVIuvdw+4ySxhPEo6Au4Z6Iqy
         FqSr2MOVQ6/YLZcVrTqbz08neeHlcdkx1dQYmm0b2sUB8ND/Aiktus7fUl1GREhEUbje
         S6j6SyJToZ8OjnWBO7TRS38zYjCQ3W3VW2bDhkjNRfKOCzpeS5rA3deY3z99AIJdey+9
         VhsDrgvAhLsHSvqrOg0n4OCdYV8m94Jy871v63guW2Vm0xXYdYO8DuxYmFhB+PStClY/
         hFHg==
X-Forwarded-Encrypted: i=1; AJvYcCWxhDZgcxJV8AxNrCLPyJpTIcRIZhaajbXlxtm32LDTgL9+jvYH7NNW4Qdsh1MkZ32657SIpJJLqmehSU0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyixg+N3MIYg+UAz3nXF2k5NexhXi2Y3e0ClGiVspIpnmjbbNqa
	DnSuLUXoImmc+X0GyOet+NssUgb+Sqac/2IrAejvmzw82mWJwcwQobW2/AAWPz17X5oGsCk8/0R
	RND52
X-Gm-Gg: ASbGncu2627dpl6Pj9rZG8zXQjJAqnDQV3/f/fTnxEOuw8/nOn5EzAldbBdMWS6elov
	APtx/ITGuZPHCsNJiQpLAqDsEAzLMPbtZXtOFp7QREE5cwxrhxs5X1cn88BPYInhJ2b5r2IWvZ5
	2sPAjD5ikdiGepjqHpuzSNbwKJ/KPi8X0ou6Uca4Lz9rc8AKO6sd7WRTJkpiBJWgraPTz0HWhkZ
	XmdKpcLEaIFoBuk7z3TMQUCuwffNImOBA4X0nreMfqHbyTDigfHBR8Peu7pGu5RWtY6CESULjxC
	mgtzeVCkcBPyQqa6Sbh13d7/7yDn+AKd6gH29qtpxw/95MyQiTfGf3qe5eT0E2N3NzZ6DwdAPNl
	jf4SHWQMT
X-Google-Smtp-Source: AGHT+IGgfJXYJoSirD0tRCwP+Ex3fowP1id/LdAZwZbfwvCY8NKMWyFPsZRRtIbbxX61Er5wiY/59w==
X-Received: by 2002:a05:6512:334b:b0:549:929c:e896 with SMTP id 2adb3069b0e04-54b0ac79fe3mr109978e87.11.1743108869077;
        Thu, 27 Mar 2025 13:54:29 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2aa916asm801441fa.18.2025.03.27.13.54.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 13:54:28 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54957f0c657so1656786e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 13:54:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXCY6V5FkmaIqKpX4IRGv6lD29jf4n8O7is6Xv2nM1EXVzwRA2JHjK3eFTL29TqrZi6H7MVbZ2jfrm4hcM=@vger.kernel.org
X-Received: by 2002:a05:6512:1145:b0:54a:f743:3137 with SMTP id
 2adb3069b0e04-54b0acd179cmr72751e87.19.1743108866803; Thu, 27 Mar 2025
 13:54:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326-b4-panel-ls043t1le01-v3-1-96c554c0ea2b@redhat.com>
In-Reply-To: <20250326-b4-panel-ls043t1le01-v3-1-96c554c0ea2b@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 27 Mar 2025 13:54:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WvD6tTu_rLTm0njXM5-S_1WBg2rf+TyFZvdi8xUT7yQA@mail.gmail.com>
X-Gm-Features: AQ5f1JqwXpRnI1xK0FFhWi1aSV1krHZ9nkiYrhEk988aBRX6Vsz34UXOhp11Tyw
Message-ID: <CAD=FV=WvD6tTu_rLTm0njXM5-S_1WBg2rf+TyFZvdi8xUT7yQA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/panel/sharp-ls043t1le01: Use _multi variants
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Tejas Vipin <tejasvipin76@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 26, 2025 at 8:29=E2=80=AFPM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:
>
> Move away from using deprecated API and use _multi variants
> if available. Use mipi_dsi_msleep() and mipi_dsi_usleep_range()
> instead of msleep() and usleep_range() respectively.
>
> Used Coccinelle to find the _multi variant APIs,replacing
> mpi_dsi_msleep() where necessary and for returning
> dsi_ctx.accum_err in these functions. mipi_dsi_dcs_write()
> does not have a corresponding _multi() variant. Replacing it with
> mipi_dsi_dcs_write_seq_multi() instead. This change is manual.
>
> The Coccinelle script is the same as the one in commit c8ba07caaecc
> ("drm/panel/synaptics-r63353: Use _multi variants")
>
> v2: Use mipi_dsi_write_buffer_multi() in place of
> mipi_dsi_dcs_write(). (Dmitry)
>
> v3: add commit details where the same coccinelle script is
> used and remove the actual script from commit log.
> Use mipi_dsi_dcs_write_seq_multi() for mipi_dsi_dcs_write() (Doug)
>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Tejas Vipin <tejasvipin76@gmail.com>
> Cc: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
> Changes in v3:
> - Simplify commit log by adding a reference to a patch that uses the
>   same script.
> - Simplify code by using a helper that doesnt need additional code
>   changes other then using the helper itself.
>
> - Link to v2: https://lore.kernel.org/r/20250324-b4-panel-ls043t1le01-v2-=
1-e43aedc115be@redhat.com
>
> Changes in v2:
> - While mipi_dsi_dcs_write() does not have a corresponding _multi()
>   variant replace it with mipi_dsi_dcs_write_buffer_multi() to have all
>   APIs following _multi() usage for easier error handling
>
> - Link to v1: https://lore.kernel.org/r/20250316-b4-panel-ls043t1le01-v1-=
1-ee38371b0ba0@redhat.com
> ---
>  drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c | 41 +++++++++----------=
------
>  1 file changed, 15 insertions(+), 26 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
