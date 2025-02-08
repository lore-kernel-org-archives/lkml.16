Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7588E5028C
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 01:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738977359; cv=none; b=KWTovEI3Zm7t/SLGWSGSfoc8/7G7kAwMP6trIAhfGYENp6V5Fc7g6KkvCSimEMiZYHU8NrVeHUZxaQZqY4Tu0ffX9zuTJgRw6IVwzbOL+B29rgxLWC80JqWn2fZIxWh7ZnBeMB+so871TpbGWXfWxsyQz05kL4Sjn+fdCpXRou0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738977359; c=relaxed/simple;
	bh=9sRkAwpgoudX+LWtPGxfoY3flg9eH9nDcQMvqDpIao8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YZwLB4AH6C8U9QGhXakMGwAFzA+W4/8VWl77bqOve2zwBK0XGdnzRxg3AAn8K8Hjk2WfkYybt4HfZlNmxQ7K+TAeVrNoo/jKdVnVmuxQZgugwwrpme757HxzZuaCzRQvBSmpS7zUmUXJBhATnpQHnzFvfh16FFMjEzkAepJ6kJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R5hCYjMd; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R5hCYjMd"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso460074566b.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 17:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738977355; x=1739582155; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHszUqSCGBMCxsD58rJHaZBPKTZWyVcaex7WlbuvwjY=;
        b=R5hCYjMdStQpuSgNEN9KOE0IMQPAgWQbrvCVOHgGHbHHvkm8jDmW6iFh0caBSIM6Pk
         xY3VYrH0YK32OtjLOEwYM263ePvCt2n+5e2sVfXxNB4vGYlMX70GVGFg9Ih2MWbjL/BM
         tx4uvBB3l32GFyOzSoMOYeWMBmp0nQn2M5PbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738977355; x=1739582155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHszUqSCGBMCxsD58rJHaZBPKTZWyVcaex7WlbuvwjY=;
        b=TuTOCQiw7GMSC0+LW81sKxznFiFJ9LwbQ2dExMKynuk73I9ucOjoBYjCr4hByx6nVq
         SS3eBpmi3C6MnIGMrawInWfgYsaW183qq9juLLd+nsIjO1DBL/bZuhP34TOnDY+ozF2G
         33h7syvI7T3mORGDXkjhXJPH32lPTqmBJ1zWvyHT0f0ByuyRlnOYwys+wZ8OR8aR2Vx0
         CMyXDdoXFjxWo2Qy6yfA37YqDHZTOujLxvtE19RduOlf/aYVFkqU7Uf1LMy8qLjkMMcI
         MAVw1EuS3JsS+YVqwt5c4qxXSxOzwyclGU9gzUXI4W4b/n6T3KzLhU2BAr8C/5KRIs1I
         P8Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVw/6D7/cbHSNgehtx9DYgf73jxUWFnaOzvwujBaGBDfe/ErC4L2o8fyY8g8flXdkDAoslxydNwcwjxHW0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0zBGby0a6Z22gry90jms0so3wLbODd+c2jA0WCvxj/cwlncgv
	WPmbZCPWn8C3SPQ8nvEypXcIxDcF7j9JbzUcB8sKVMbmdl9382Wh4n9EPTcdyZeYzw3U0GCe29A
	YdDQ9
X-Gm-Gg: ASbGncsscIl+Kia7LJhZ/V50hPPtlLHK+LUS7Rn8f27dI+8feAALSwXZOtMolc5D8d1
	7xGpq7soQXulaI7yq1joZs5pTOi2VxjMx1I4rlG/tLHaLX/4mx/y8PYQe1mhol+lI2c4VTFqMAh
	Lrq5/dlLkLLYGEFbgFr5eJkKAmvDc7Gh0KzXu+83fFYARo7kDWsR6Zd7OkumK/srrN2uFrlJ2ty
	m/qpvibfg4il++iwDQfie07/KjefjL69QQYtGue/C1edJRFfF0y50unFtOTFe55P4/oObtKyzvf
	Dglu3lsxKsmt334eri/J3C3hvWlLQxNL2+bRnT6BIYGR4LZLG5fIFeI=
X-Google-Smtp-Source: AGHT+IHm53/+O8IKUXkeR28C1lR8eQsfIJ1OWuW35kD/F6jBP1nUA6RMosOZ/uzyLCIIkggiajHRaA==
X-Received: by 2002:a17:907:9721:b0:ab7:a277:fb7f with SMTP id a640c23a62f3a-ab7a277fea7mr50744466b.55.1738977355292;
        Fri, 07 Feb 2025 17:15:55 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab78b9b09b3sm212795566b.99.2025.02.07.17.15.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 17:15:55 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so25950155e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 17:15:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWoik0Ac1L7mtE9OGrAeku3LCWw9A5XUtjdIsz4SmZuLumlcVmz1e5lgEPFkohK0SUWfcpZRCPcbuIHfD8=@vger.kernel.org
X-Received: by 2002:a05:6512:3ba8:b0:543:9b0f:7d39 with SMTP id
 2adb3069b0e04-54414ae0de2mr2057368e87.32.1738976902442; Fri, 07 Feb 2025
 17:08:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org> <20250204-bridge-connector-v2-13-35dd6c834e08@kernel.org>
In-Reply-To: <20250204-bridge-connector-v2-13-35dd6c834e08@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 7 Feb 2025 17:08:11 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wu4cGQ9FsQteju78rE04v9O9rTUz0W3Punhr+BZM=66A@mail.gmail.com>
X-Gm-Features: AWEUYZmDTTmxI72piEcHcrC-LMDJ3meTMFGoKV0AJrQqDxffv63GCAjRlxWZiEc
Message-ID: <CAD=FV=Wu4cGQ9FsQteju78rE04v9O9rTUz0W3Punhr+BZM=66A@mail.gmail.com>
Subject: Re: [PATCH v2 13/35] drm/bridge: Change parameter name of drm_atomic_bridge_chain_post_disable()
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 4, 2025 at 6:59=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> drm_atomic_bridge_chain_post_disable() disables all bridges affected by
> a new commit. It takes the drm_atomic_state being committed as a
> parameter.
>
> However, that parameter name is called (and documented) as old_state,
> which is pretty confusing. Let's rename that variable as state.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_bridge.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 0a8c7176959d13937124d2a3bf7e69309898b947..ab166972b1b0df239ca014296=
be49846a857df6e 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -577,23 +577,23 @@ void drm_atomic_bridge_chain_disable(struct drm_bri=
dge *bridge,
>         }
>  }
>  EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
>
>  static void drm_atomic_bridge_call_post_disable(struct drm_bridge *bridg=
e,
> -                                               struct drm_atomic_state *=
old_state)
> +                                               struct drm_atomic_state *=
state)
>  {
>         if (old_state && bridge->funcs->atomic_post_disable)

drivers/gpu/drm/drm_bridge.c:588:6: error: use of undeclared
identifier 'old_state'; did you mean 'node_state'?
  588 |         if (old_state && bridge->funcs->atomic_post_disable)
      |             ^~~~~~~~~
      |             node_state
