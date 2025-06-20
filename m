Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF95E28CF73
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750430507; cv=none; b=FWL1vj6MHTeI9FI711SocgiCHlhefnKQY4zIOuMF49L/BYJBew/ZlW9uZkDmNc/Me8x/FTzDTdGxsPOfdgXm3yzvaahOARpM698yPlmyxO1kCrJiO7kh6J6Mfs/sduiKBG1aZWEai+VWnHYoXS70i9WG2UYElF5boTp3EvutrO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750430507; c=relaxed/simple;
	bh=UVl9/GcvPzlj6vRv+RKV0prvyFXfvuRFdEzNz6T73+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D8rHWJ8WliDNcZqmYNM7Ml9pEHp9ZhQXnT3jME+8w749icYQGXr2g2x9PMJabgHoGnPNwpFSfIATa+8zQ3n2RvauH8/+B17AEiVMWalHi5wI+uF368oyJlIl7bxnmC1wfoZx7VzAK1WCgBWLXZfQrFRJMwdBfGk7Zk3j1S1WBM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NgLucXQp; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NgLucXQp"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4067106dd56so1294264b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 07:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750430504; x=1751035304; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KT4DQcewRXgTOMNaBYIe1ub0iebCscNnZe8/5h5B18=;
        b=NgLucXQp89ofTGKIsHPj/SdZHgiEo/cSmkuQWF/RtwDIexWBHqNZ6QEMuQaE18OSNC
         43CdNm+It18h+nlP/fZzeaabgnDQPrMDRp9ovXpD6Rc9wz0GBDDag0REtEdIPgy+CyKv
         yrHw9lsw2kSApuwV67yTihtSOraWLWMT66gZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750430504; x=1751035304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8KT4DQcewRXgTOMNaBYIe1ub0iebCscNnZe8/5h5B18=;
        b=ZMO9dSDtp8qlGQN4BENp+jxkxaMUr59w6wFXW/8M152ODpIW8cZYZRu37Wj/Uhbj4K
         mPxDAZJ35OM7SWXV9RNfTgWvwY+f9kYikFfS2gXVaDUuMOAARu6KDBuEaH7ekxOtMkwm
         /h20dD828UG6MPjXWp+7TkGlCXo7O5l8jhaY51KtJi5hP+G8uSQdv2/C4ybLRv5a181u
         1DKEvlgNH6Z2XU0/CD/LlX2RB4EZO32ZqTiDGrn5rVeci6gpI4rAtU1A9GWk1Agwz8Ep
         NPuhbTf5n+IFSG8HVqNjRToee1jNe8kBLhxtGfYavKqIXoklwv8MkwRwuUuelz9k69DQ
         6/aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFT0M0nDUDleBlBn925OSqTmpMpjQL2m5a24RFzAN/aaVzZRoVK/lp9Aa1M2l7uqM9t0ht6mPS2pLaL/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Bst12IZkLwQTidBJCFcc7OIzR6regMuJ5uTu5pTRNbfSAvjd
	nmjM7iVBe6oPxZciD/QxAUWJvLKDbSSNT/yQcDuXs5tRKiKCeFEc1sBKglfF8Cm8MbcAAvRc/Qp
	OF/NC95zt
X-Gm-Gg: ASbGncs9SkXWTWI/dq8AAqlq3/HZnEOBYPUHDhCcmWkANdBcjF7uazGFQTJVv3fNaLh
	vPuwLB/iG7uYkRB3l6aO75+L+RtqnpyfqWweOZ7HYbAdsXhEUSX9ufFS5etxVWYsDYtfsGEGINU
	/Z4qDAD0VYi45yMPlLTuJL/trt+BcFYOLRHuAaA7rIdGDjt2K6We1AiVXuTACpEDD7cf7i8f2P8
	TPlSHYy2hx7yvrlxDBBV0cynGBjGAo0uhZfJxgoeTnjRHduQkjyeX098+YByp6aRJAbqzmQ6E6j
	qVAvVADfYYEHbrYYMZd0zXZDBffp0+KhgaBuxmB3GB3Kk6wExSLR8NIUB4hNjEXCrEcC+RTSVkV
	rK5V8x3sCtNauWg29WhqXNwROdw==
X-Google-Smtp-Source: AGHT+IFecu4IvwBRBtD9KKeeIEBtMQNisadOKAlQAfQu5N6ZaQAf5vZU4rFuirb2EKNWFgpjnkgJiA==
X-Received: by 2002:a05:6871:2310:b0:2b8:78c0:2592 with SMTP id 586e51a60fabf-2eeee6271c2mr2147264fac.23.1750430504073;
        Fri, 20 Jun 2025 07:41:44 -0700 (PDT)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eead8e16fesm398183fac.45.2025.06.20.07.41.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 07:41:43 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-72c27166ab3so1293681a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 07:41:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqkMNdjuKomDCOpngoG+cPBF3Dc6/MhlvxpMPsiJN/9d1dg14u6RJu2Gyvh0Sxp8b4p7vq72EqbGrS2yw=@vger.kernel.org
X-Received: by 2002:a05:6871:4195:b0:2e9:9e9:d94b with SMTP id
 586e51a60fabf-2ef0094c0cbmr2001638fac.39.1750430501165; Fri, 20 Jun 2025
 07:41:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402174156.1246171-1-jim.cromie@gmail.com> <20250402174156.1246171-29-jim.cromie@gmail.com>
In-Reply-To: <20250402174156.1246171-29-jim.cromie@gmail.com>
From: Sean Paul <seanpaul@chromium.org>
Date: Fri, 20 Jun 2025 10:41:03 -0400
X-Gmail-Original-Message-ID: <CAOw6vbJwbvcVARNmx3O7mTbOr+A_Vo_DaUXFfN8HFFLqdG-VPQ@mail.gmail.com>
X-Gm-Features: Ac12FXysVBlI9m3EGLlNcwPGQBWhWDrHdfE7f5KsOCiBBCH_bJGVrs_uGmTAM7k
Message-ID: <CAOw6vbJwbvcVARNmx3O7mTbOr+A_Vo_DaUXFfN8HFFLqdG-VPQ@mail.gmail.com>
Subject: Re: [PATCH v3 28/54] dyndbg: restore classmap protection when theres
 a controlling_param
To: Jim Cromie <jim.cromie@gmail.com>
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
	louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
	intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
	ville.syrjala@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 9:48=E2=80=AFAM Jim Cromie <jim.cromie@gmail.com> wr=
ote:
>

\snip

>
> -static void ddebug_match_apply_kparam(const struct kernel_param *kp,
> -                                     const struct _ddebug_class_map *map=
,
> -                                     const char *mod_name)
> +static struct _ddebug_class_param *
> +ddebug_get_classmap_kparam(const struct kernel_param *kp,
> +                          const struct _ddebug_class_map *map)
>  {
>         struct _ddebug_class_param *dcp;
>
>         if (kp->ops !=3D &param_ops_dyndbg_classes)
> -               return;
> +               return false;

Return type is struct _ddebug_class_param *, should this be NULL?

>
>         dcp =3D (struct _ddebug_class_param *)kp->arg;
>
> -       if (map =3D=3D dcp->map) {
> +       return (map =3D=3D dcp->map)
> +               ? dcp : (struct _ddebug_class_param *)NULL;
> +}
> +
> +static void ddebug_match_apply_kparam(const struct kernel_param *kp,
> +                                     struct _ddebug_class_map *map,
> +                                     const char *mod_name)
> +{
> +       struct _ddebug_class_param *dcp =3D ddebug_get_classmap_kparam(kp=
, map);
> +
> +       if (dcp) {
> +               map->controlling_param =3D dcp;
>                 v2pr_info(" kp:%s.%s =3D0x%lx", mod_name, kp->name, *dcp-=
>bits);
>                 vpr_cm_info(map, " %s mapped to: ", mod_name);
>                 ddebug_sync_classbits(kp, mod_name);
>         }
>  }
>
> -static void ddebug_apply_params(const struct _ddebug_class_map *cm, cons=
t char *mod_name)
> +static void ddebug_apply_params(struct _ddebug_class_map *cm, const char=
 *mod_name)
>  {
>         const struct kernel_param *kp;
>  #if IS_ENABLED(CONFIG_MODULES)
> @@ -1266,6 +1288,13 @@ static void ddebug_apply_params(const struct _ddeb=
ug_class_map *cm, const char *
>         }
>  }
>
> +/*
> + * called from add_module, ie early. it can find controlling kparams,
> + * which can/does? enable protection of this classmap from class-less
> + * queries, on the grounds that the user created the kparam, means to
> + * use it, and expects it to reflect reality.  We should oblige him,
> + * and protect those classmaps from classless "-p" changes.
> + */
>  static void ddebug_apply_class_maps(const struct _ddebug_info *di)
>  {
>         struct _ddebug_class_map *cm;
> --
> 2.49.0
>
