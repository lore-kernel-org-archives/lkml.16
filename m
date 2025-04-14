Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE002797A2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744641171; cv=none; b=sjAMzc3nw+Zdqk6z/f3PBEWdHI6ZoM8ElEU6DLQs6cbFMysw7lXvHJV8vwOTZrbq6p6a72tW/FkQ7xL5MeqKFcHKPW3Mm1eRukzcyYHV5PVbYt+I0xAq/8f9UqZcmnjVmJH3OHOqwAOxQxt277QbaEXZJdZv6LAQhvmT6UABplE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744641171; c=relaxed/simple;
	bh=jpjZmA4zgM3AY74Jxbvk/XGeCsdF79xZ+w0kBMrXYKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PZzie4vkoOtD2NrjB93BssHyidl+qU7Bs2KOBbsKeFUzvuz+Rc+SYpTK17Wl9EwV84c1heQwpdKAMADybsMqyfDHmg8PxHRdqfQvIbag1Rqka/zENnEEnRWqoE8k0eqlVOOZ9atx737QJozO/gqIeRRQCgpdhyqhWGYsLAEwiso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LQHD6mBL; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LQHD6mBL"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-af579e46b5dso3215986a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744641164; x=1745245964; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hEwbITKXTRWO3igClAwf6QVpWecwQU37EfC9bLpZ+hI=;
        b=LQHD6mBLNwA5HqG8UweX+fcqE3YzoeGIZSnJyy/Qx+9WthcwWytYjZhGbt2NKfv4aQ
         Kp5z0bkfMszJLmEUemyChd1CpfRgNB4PADFNya0xYuWm4CX2HU6TBjbEuYFNki8sizNS
         aM5ls2kVrnVh0ZtexiYvjbVH4cmVIELB9/YCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744641164; x=1745245964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hEwbITKXTRWO3igClAwf6QVpWecwQU37EfC9bLpZ+hI=;
        b=vaLR11ykMqoqcgKsZ35xWizQpxr1Luvwv6YvGios5SrUbW+y1+RV+vg/8w/H0+BZI+
         QXvCvYSnuQbz57TMZNlliOf6L+cHIANP/E6w3D1fD9NcCocN6cbxdfi0qpX6bJbGsoBs
         Dsj3uPrZFHJV/ZqxzZ8Bh19x7D6Bi67xupbu4rLEqHPdPlcaG945Cb9nA1zshPhz0mye
         yvgOErX2L5SmIq4ayKXduJ8bpLgnBnV/7XjdzkINy3h/+uV66gZ4SEcc/iY6lpg0fdVM
         CLYIw45UEulKhwF2YWA5gumjYeo92/mruDee0CTQYwWwXWjmVVnPUKSKkHIOQAZcOc+a
         kxDw==
X-Forwarded-Encrypted: i=1; AJvYcCXZHsnKicnmzLsoZSkEbFZA67/y8pEJdmlmiOjbVFyXYGKqEPD0zNsofN09rklTemmZQ/KgDNJ5s+cw+5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YymcTndVxBTkAVTZk/XUoViEanBvDTZvOcnW8UqTsZAAwlXcDvM
	QPZVy5p9ucJDQBxObfqLyXbj7RSJuEo07qTwYb6HYH0BtPursOG3khKPUSmgTj6W8poxT3xd5SM
	=
X-Gm-Gg: ASbGncvzDVaov0vS3PivQfLEQkBsyqHL+nmAq0ybOrJtWEeihv71KXvUNwi/JNNh4WH
	5//i4B3nzlpPWBoPWFJ4z0teQLCXcozwixJeBhGgBjqdEeVTskUQVNZzZbcfwBiVfoE/NK2o6QB
	UJcaZ4D2fyv++i1xkNyPsJKQz+QAtYzwus25d5MzEquTY0meNrAJ5TYr1RFBhdGF3c71+M9W3Yk
	iDKolvO86WceTf8x+FUdvqbQbNdhw09EgsYw+0O+8jHV2QMVNg/3hIJ3lZQ5JuTmIlruh1ErhAL
	fuT4qDhcYgpY/V2zW09PA6kMF+TCh1ESdVkX5LKJH4wwBloV2j0azvX/J/ooX+NbIUAwiG7lOMc
	GsX1NGtyzw5zx7KM=
X-Google-Smtp-Source: AGHT+IF368d+wQI4Jpk60t16L+SwWpA0hf7g4jHNLoDiHNlmjx3Zv0QRv/CIvqooQJXsgfdeu5rfBg==
X-Received: by 2002:a17:903:244c:b0:223:4d7e:e523 with SMTP id d9443c01a7336-22bea4fd198mr166705445ad.50.1744641163448;
        Mon, 14 Apr 2025 07:32:43 -0700 (PDT)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com. [209.85.216.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cf3sm99813615ad.156.2025.04.14.07.32.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 07:32:40 -0700 (PDT)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so4482105a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:32:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXFxxXq9z5QVbxx0HBCdzLJNKJFYJmEN0s84kb/rhQUdyzEQ4efUAlB2JIfJu0cE9zqRlvRF6mRycnwYP0=@vger.kernel.org
X-Received: by 2002:a17:90b:538f:b0:2fe:d766:ad8e with SMTP id
 98e67ed59e1d1-30823624780mr18884993a91.4.1744641159979; Mon, 14 Apr 2025
 07:32:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250413035959.255842-1-tejasvipin76@gmail.com>
In-Reply-To: <20250413035959.255842-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Apr 2025 07:32:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V5bfaBA-ZOyG2UCpCwE=5bGP4GFDTW3qQ671raTVnq=Q@mail.gmail.com>
X-Gm-Features: ATxdqUEtNjRWho83CnY45CQBEgIpB6T8M8gcQk2GkqBNaYtQ6vGZNkbRYOrJfPQ
Message-ID: <CAD=FV=V5bfaBA-ZOyG2UCpCwE=5bGP4GFDTW3qQ671raTVnq=Q@mail.gmail.com>
Subject: Re: [PATCH v3] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, asrivats@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Apr 12, 2025 at 9:00=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> Changes the boe-bf060y8m-aj0 panel to use multi style functions for
> improved error handling. Additionally the MIPI_DSI_MODE_LPM flag is set
> after the off commands are run in boe_bf060y8m_aj0_off regardless of any
> failures, and regulators are disabled if the boe_bf060y8m_aj0_on call in
> boe_bf060y8m_aj0_prepare fails.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v3:
>     - Disable regulators in boe_bf060y8m_aj0_prepare if
>       boe_bf060y8m_aj0_on fails.
> Changes in v2:
>     - Always set MIPI_DSI_MODE_LPM in boe_bf060y8m_aj0_off
>
> Link to v2: https://lore.kernel.org/all/20250331061838.167781-1-tejasvipi=
n76@gmail.com/
> Link to v1: https://lore.kernel.org/all/20250330151304.128417-1-tejasvipi=
n76@gmail.com/
> ---
>  .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    | 114 +++++++-----------
>  1 file changed, 44 insertions(+), 70 deletions(-)

Not worth resending for, but for future reference this probably should
have been marked as "v4". Now there are two versions both marked "v3"
that are not identical.

In any case, looks good to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
