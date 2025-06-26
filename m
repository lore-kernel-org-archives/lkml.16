Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84B62EAD0E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750948800; cv=none; b=JQtHBdJNqJ+QzWGFo6msmhpIDznaSS29M8yxO1znBPZKV9qA2lejPcNA45tDnWh0SoZ4rgrhLpzedoOKmnep3m9OhmTsclslLuWzrtfPmTsrv+zn2LLY7S74pHe7+GXV2w7aljo19N+WwrfAGAAQiStZW53Ivvvtu/uhw4xS5J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750948800; c=relaxed/simple;
	bh=UJf4eeSoOBTLWXE3jQ5PrH2R7qMOPCIdaK8JlFrestM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HbMw1uHK6jMvrw8oVEdJwOmoeiRpCk3vHW1/cE92mHrSBJeu9rz+Nk/bNeJhg6Xa7q/+Ug7nDOzBTsJFDmf241OJQ/j/oNjrxkPp8DYpDUE09vXyVwxqqV67uU15lAjq9uzk7zfdkhjzCqvavSZSx5rQN1GbzRC+afdngm/sFX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a53c3MlZ; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a53c3MlZ"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-748fe69a7baso1124343b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750948797; x=1751553597; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NbDqFXySj+gbUU6xSTy3Imp3ynt9ccm9VYTmcwbQNg=;
        b=a53c3MlZzSAOkHAxC7Dw4xhckqnEClglnqX9cz/1f8DhcGOBDQ3awwnzStqpsQnzW4
         xOEBLTL925pjrghJBU38y029StmJxTiWj7SbxEoUujdsKrsKLtXSUhGprcdn4YEy3GkO
         j/SEs4OWBcuAhLXRexRIAtwLEIEcWqewEzNlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750948797; x=1751553597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0NbDqFXySj+gbUU6xSTy3Imp3ynt9ccm9VYTmcwbQNg=;
        b=wP1cakGNdeX+U3SPBB+y3VM8EcH5RZTRvQpyLSjHMwtyF/gHI1AuPg0TV/fhhaVX2R
         hn+OhB1NudbnL2TQaGXZ4kggT5R3LnQCTU/whKjtU+2o5MTc+g6mQTXDrGMpNu83kOBL
         sRBnXuYTUWD7llKibzufE/zrSjglTHrepvA34i9Z0IcqaqeXArx5LZJ3xVDiAubaQ1Yj
         LydjSZzs7xS3dNZHpVfhE18GynahR0KzhoulUCHnfMK+u/0rrkpO5diB7FSXMw/lm5Gy
         VvDrfkS3EhFROPXIpAqGQCmwAqP2u3xSGhjFaQ6/Ir+DGqs875KqRm7anPdjGBZjoYQo
         /ztA==
X-Forwarded-Encrypted: i=1; AJvYcCV5TcWYwvi3vSDg6G4YSV43PR/uZjDb3USbfy4yV43Zw6RhoGwyxQCAOd1/PZDBnoiVZ5O5Ot9EcXCyLjs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjnJYogWoUbA1auii0u0WeZSQp86qq2Vje7/1R3UhdofTLpQB/
	7Pq81RjbqM0OYZ6uIVT+vWYiV7PxwSR1lGMxhvbZwyylaK12Xn6if7YyTbtbCZQIEtP8D0Ynv4d
	OezCW/EDu
X-Gm-Gg: ASbGncufgJi/jGZyA4PUR/ve0ZboYN4mvo30F6lm50tACqt/1Hn2/q+7tQAcIVWnF8S
	Njqi/KE+N4Q4DxDC8w4Jk+Dk2kyF7DfFuyPRta6aodGJ0BXSXUGHZFLj+Rezigc4trvdk8myFBl
	R3fFCHkv0yYWsImjWERq8RdidvGModfVog2/+Zb7nasNtAJp1UhvdsX3uGBNtwvHg+K93hAWvcN
	oinILv5Cl4HEzyb1qhiMQ4Ey2IBLwj5/FJRiTYPG+d5LJ4XDU0XbRCSK0gTZFzF8l04mcEx34Xv
	ugK6mXbC+6vJ8fFmvRjAPn4PO31TNEYC/8+WvBnVLEYkxTgzRqSbBqNYUzgtlNVc4UysDY7mvcr
	O3bdD4uMNxqx0kM2cc2L6JrszAR8hmsROw+9p
X-Google-Smtp-Source: AGHT+IHSvkboQkjK2+15IgtYGspu2lSp0MLcWhYhqtOu9//RmtMpYYXfuvTjpNRmFozGeFo/IWcq/g==
X-Received: by 2002:a05:6a00:3d08:b0:748:fcfa:8be2 with SMTP id d2e1a72fcca58-74af4888968mr127811b3a.2.1750948797175;
        Thu, 26 Jun 2025 07:39:57 -0700 (PDT)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com. [209.85.216.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e4293dsm7638844b3a.66.2025.06.26.07.39.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 07:39:56 -0700 (PDT)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3138e64b42aso1282324a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:39:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUODTq48ypJC4jWLTXkIa6F0F8AXGFCCACQ1ozzuqz6Df8CoxDOXBa2+tohNhRkgpZNzyDqZBuYCr2hcAQ=@vger.kernel.org
X-Received: by 2002:a17:90b:5212:b0:312:db8f:9a09 with SMTP id
 98e67ed59e1d1-315f25e698bmr11249585a91.14.1750948795378; Thu, 26 Jun 2025
 07:39:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626122854.193239-1-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250626122854.193239-1-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 26 Jun 2025 07:39:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XHVKvsJwHzuL+7bv70LvcC2Y-y1C3_aZ7rsAki3cJOGg@mail.gmail.com>
X-Gm-Features: Ac12FXxkqZPpQXyw5nU2lsKO8nED1gWJWX73WnTNQEt8Js0cUhmqSOeE9SC36iU
Message-ID: <CAD=FV=XHVKvsJwHzuL+7bv70LvcC2Y-y1C3_aZ7rsAki3cJOGg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add CMN N116BCJ-EAK
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 26, 2025 at 5:29=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> Add support for the CMN N116BCJ-EAK, pleace the EDID here for
> subsequent reference.
>
> 00 ff ff ff ff ff ff 00 0d ae 63 11 00 00 00 00
> 19 22 01 04 95 1a 0e 78 02 67 75 98 59 53 90 27
> 1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 da 1d 56 e2 50 00 20 30 30 20
> a6 00 00 90 10 00 00 18 00 00 00 fe 00 4e 31 31
> 36 42 43 4a 2d 45 41 4b 0a 20 00 00 00 fe 00 43
> 4d 4e 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
> 00 4e 31 31 36 42 43 4a 2d 45 41 4b 0a 20 00 80
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 6c45c9e879ec..3796c41629cc 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1967,6 +1967,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x115e, &delay_200_500_e80_d50, "N=
116BCA-EA1"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1160, &delay_200_500_e80_d50, "N=
116BCJ-EAK"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1161, &delay_200_500_e80, "N116B=
CP-EA2"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1163, &delay_200_500_e80_d50, "N=
116BCJ-EAK"),

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...and pushed to drm-misc-next:

[1/1] drm/panel-edp: Add CMN N116BCJ-EAK
      commit: 34a3554a1c7059b861db2aafb052a256f38813d6
