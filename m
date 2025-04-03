Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0402517AA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 18:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743705216; cv=none; b=Ctr6os3WtGblcQzE49Ye5fJZGWJT1159r7XZsdoG3OxTKG3jQvdFolTvnk7RoulbjCovMJXdVoGKMDlj9KE0g9oM8aYHIBJRuNivBf1nnJjM3EzKU1rTzDZ+2d52CGKAQGDGXJyXtGj2kcxYzRgs053ZLHJGVKQZCjYYCGPhBuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743705216; c=relaxed/simple;
	bh=nTZuGsFING6MIGVPoQQdW0z8/bAf29Sjd0udlbQBoTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cimeUQ3s4DvgtpKjgKbYxmxEClKXjGnt914cHwqj0qLldykr2esryeeJnquiQZCYOUoISHhWEtaYOxkGQene23QHXBf6OXXdKtseihlyYoC46FykF8bCKK17rlsk8Za5KRyaVPPxbWJUzKoj4KDmQG+m8AkL2MSKCesxMiWd4Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wv7FXSdH; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wv7FXSdH"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-548430564d9so1208148e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 11:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743705212; x=1744310012; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6FpVBVSrBp6UsJLd/05pqTv+7X/fXLRZyX/z8dAfA8=;
        b=wv7FXSdHa96vMLpr6yHrQSyYr8WYW6zUP1oQoGYY4KOe5lhIS8GCaqX4Zcvpzdw7UB
         Bh7GANwgOBT8ncAxuX7ETRoq9QvRn9z9vQYtQZbCym9bbnL79aEgX5oboNbTUlRhfAa2
         yDq3ZdmyTEzPYWZoiBacthaSOeHp8BsqG4cDUDWNRcumsKzW7+84Ehf2s9luiiMXoODs
         4GMQHyhgkGO6lcuD1+KgDPqZoikTOud33RpHgSB2CGIu3Uli+CSBKq33WR3yp463Jzja
         LeQYj8kWSCY3uCwnGTGDRH5o9TzFcgYyHKGBt1Iu17T/lY2J+Vds1cQiWIQ8bIL7yl2U
         GAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743705212; x=1744310012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6FpVBVSrBp6UsJLd/05pqTv+7X/fXLRZyX/z8dAfA8=;
        b=FO5dCn5kLnExccEXREin8a7t0C81necXdiTg22Yn17/4GcEyU3IzgyuACIQL74CG8A
         kEPnsF8sZXQWM27lP+HvLwr53KuH7IYhKumfTSoUosHJVStkOIuqn68fuSjdAJxaZ9bz
         7Mk/G82QdzdcKYatuJYlDycauQR6B+Q7lBpGTxb5dErHiF835C2t2FZO0tgA2UXJpr34
         ysLDrSvH2qUtzFTv56pCq8CstBHsHHxisvKvpH1GxMgwQ81Oobv+erZyuZ8ZXn7Hm0Nf
         Mb8MMgKiUxuA7Z1w7mOVOgErD6kDHN5dbhLAI9aIyyRayYwxuvwmQp+D6Rw9LouH2tiC
         DqjA==
X-Forwarded-Encrypted: i=1; AJvYcCWP6qFt0hrCG2TLxcvQxUaKHrCOqoDKObsOFo8uS6n5uJW+l4qM4kkoCVFGiXyzzBanZ0dCqDiH1AOmvro=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY8llc0cgpksEUoTymRU7ibv/pjr1jRVyQo+9gVro3g316qQm6
	j9LAdwdQk0XtGBXoCARkDzJA9pYM2QbbDGOvP9ri+ulUG4qCipEb3sIO/WJAC9wA1FIA7Mzs4ji
	bfdYVfRdhUpvYmNp4A6+hzVAXMzareqiJVJIT
X-Gm-Gg: ASbGncsQE2m2lhhpukgAHumUiuRkghOCs0u2oKF80B8GJ8I7Z5w3OjYgsCCHLlK7Xrj
	38V12AIrLwUZKXRoMRpck4dtbKake2HHowb8Va4x5eQAFvKBD6zX/JAWBdpnOKciNGi28ag4JdB
	6t91Tvdb4To6WCUreFgB1bzXB+bSg8BK6+2Qf66yDVOh3rzYUBCohA
X-Google-Smtp-Source: AGHT+IGGElQxxzJStMl02DU8ACSS/S4gavMbWxl4jrrkrwKF8pltAulp7F6pmLGK9uI2hw2C8NndmdlVm47F388sLto=
X-Received: by 2002:a05:6512:3b85:b0:54a:c4af:18 with SMTP id
 2adb3069b0e04-54c22784b65mr66148e87.22.1743705211956; Thu, 03 Apr 2025
 11:33:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403181907.1947517-1-sean.anderson@linux.dev> <20250403182758.1948569-1-sean.anderson@linux.dev>
In-Reply-To: <20250403182758.1948569-1-sean.anderson@linux.dev>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 3 Apr 2025 11:32:55 -0700
X-Gm-Features: AQ5f1Joj6PPNXYtzD5r8kgx1fQnzai2slPTaoQvR1K8EcGM4YKlTmyOgm6rJ8rM
Message-ID: <CAGETcx9v610XhvU705R=Mjth=iAbCU04rqNnQPhQua37Jc4TRQ@mail.gmail.com>
Subject: Re: [RFC net-next PATCH 11/13] of: property: Add device link support
 for PCS
To: Sean Anderson <sean.anderson@linux.dev>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, Christian Marangi <ansuelsmth@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, linux-kernel@vger.kernel.org, upstream@airoha.com, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 11:28=E2=80=AFAM Sean Anderson <sean.anderson@linux.=
dev> wrote:
>
> This adds device link support for PCS devices, providing
> better probe ordering.
>
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
>
>  drivers/of/property.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index c1feb631e383..f3e0c390ddba 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1379,6 +1379,7 @@ DEFINE_SIMPLE_PROP(pses, "pses", "#pse-cells")
>  DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
>  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
>  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
> +DEFINE_SIMPLE_PROP(pcs_handle, "pcs-handle", NULL)
>
>  static struct device_node *parse_gpios(struct device_node *np,
>                                        const char *prop_name, int index)
> @@ -1535,6 +1536,7 @@ static const struct supplier_bindings of_supplier_b=
indings[] =3D {
>                 .parse_prop =3D parse_post_init_providers,
>                 .fwlink_flags =3D FWLINK_FLAG_IGNORE,
>         },
> +       { .parse_prop =3D parse_pcs_handle, },

Can you add this in the right order please? All the simple ones come
before the SUFFIX ones so that it's less expensive/fewer comparisons
before you parse the simple properties.

-Saravana

>         {}
>  };
>
> --
> 2.35.1.1320.gc452695387.dirty
>
