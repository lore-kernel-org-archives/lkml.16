Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C22314A8B
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 01:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738976907; cv=none; b=uxQy5xC0vhz2nICsuj6Q8T6XvNJp6dkszv1GAjuZ4f8c8Eda60i0RTc0k5PwKVwe/XxZfi91uF5Om4UtY7dMfqCJtwAGlA+n76OYMH7P0QrpHPaRlQLkS02qsyUH7wZ9yuQVNizkQdP5Gl44lmjSh5FsRYITEfS6r4PfHaVT6OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738976907; c=relaxed/simple;
	bh=SNufANpx2ETTDicneo+rDQQ3BAbvZtGaAmzZoTBb85U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rkOgFLzifvDiF5vZAYVJWt/y7QkVFN+xgOZspLy0ndTpwX1Aem10S9FgXvGJDo/ODfFjecRcVcVJR9NpYtYNbfzqItUglo1AqaLfI5rjWx7xmXm2yjTaETRKxffMeB6amSTDrt9oGPy5AE1TNq8bIT7OfIA7pXUe/KoKxbWsKSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TvyrspA8; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TvyrspA8"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5440f22aabdso2457238e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 17:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738976903; x=1739581703; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wVrbWDXXYM0CQX9h6yILLnqWA7VmPSj8PhYgMA/4GQ=;
        b=TvyrspA82W7oyZZQh+pJ7eI7cuxc9Y7WYDkSw+qE/7uhDfMZ1yF5x4QzG+MIAUPfPL
         hI77b6NYi7+fYXBGgAwLo/YSee5Lb+J5qeKLSjqBub1tA9IOTLqgxDV/yyc1Kf8lvL1g
         aR2yswWRDRAD1oagY9qJ0viVoNFc+Ed75MPdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738976903; x=1739581703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wVrbWDXXYM0CQX9h6yILLnqWA7VmPSj8PhYgMA/4GQ=;
        b=N0DO65Dk53hazYUys9JnrQHh6xy9/gOK1aq9vXBL4riLV3GLimzyLKIZaUECSHy5kn
         e3ITtvls9XuroZaUfFti1db5I+io7TyGwCOMz1GNmX6ngGeJtJYUmxzngaGTw60DhYez
         iC49sdym0ZwXAYUlmnlD1f+C3Ye7Gbe8LtZiOx3qlgdWaoAShxjba9Otel5DlBJ14ATR
         Ct7C5RSz+9vy4kX/jUehpEiBBqdyEJcWc12MABGAYw72gWEhzvuV6nker3SvUXzN0R13
         z9ymcUQ70wp3OcBMBP03t/kj8KxqY+pPvR81lnY3yA/696MrGc9PZlaD58C50uxvMmYN
         ap9g==
X-Forwarded-Encrypted: i=1; AJvYcCUZMDLsd92h9drme5vxpopR953dpBk6bP792OgcRS3tQ+gdmRk0bscNdQbzDasSDHAjSj+ykkxcKkh1Yvw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2KlvZERk4xtbdVnV4lCgjQxNV8N1D8GH7uM/g/d78JKhSzelZ
	Hybad9BaXoWZE2c5/yrsGoBA6RXyqLFTk3mq4f6oDyrq5vg3jxUg0Ub2m8tRr4a381wyTMSh8Fe
	QKKlB
X-Gm-Gg: ASbGncuYCAG3VL6pEhoK7EbJg62zRLbfFTVFuS3l1CILzk7ogPGfo5ZNmges9szqy/9
	IOVyEULZ3MXGaJxi+WUQpRZHKCBQtZF8DrO2xCaRL81UGbm9pvW2eXA1L5sU4vojuHHP4xDZtwx
	wdDtZoNUuLU6xatLzYfdhyhzTjoLIXRegoJK+2wwmHBSmlQsHGpd0NR1Gm3bnB8hu6UkHYvqFyR
	tfFm/C5/tVTMeFuUaDr+uXPV/dY4itRyVJLLWXwqdRUFP97SGP0JMRAXgSRZbYQVZbwgjFbbFJT
	Lyo39By6oYG25WrJFQfGMmfiKTsx1zUzCfdz9KQ/qdi29vpvfWun0Oo=
X-Google-Smtp-Source: AGHT+IErrGuMY2jcyJJmXXNqSCI1h6uQE9X2jsV7Yy8n+sjNN/p4pGZq30d9fosfliRBrE7tZZVXoA==
X-Received: by 2002:a05:6512:1385:b0:544:ed3:c22f with SMTP id 2adb3069b0e04-54414abb4bdmr1630061e87.26.1738976903062;
        Fri, 07 Feb 2025 17:08:23 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105643ecsm605942e87.105.2025.02.07.17.08.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 17:08:21 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401c52000dso2778423e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 17:08:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrZhImQl7R+2z26swhaZZnTTcJzI2e3yCtD1QSZoJwEK6CvLzQm0Ws38e1u4zWNANjFwi49AITkR4tOgI=@vger.kernel.org
X-Received: by 2002:a05:6512:1247:b0:543:f1a0:9e88 with SMTP id
 2adb3069b0e04-54414b01b82mr2226286e87.32.1738976901540; Fri, 07 Feb 2025
 17:08:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org> <20250204-bridge-connector-v2-18-35dd6c834e08@kernel.org>
In-Reply-To: <20250204-bridge-connector-v2-18-35dd6c834e08@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 7 Feb 2025 17:08:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U0FVUTYbAHUu4+eAUMpdLjN4VugJfkz=w8nTFUWsCxdw@mail.gmail.com>
X-Gm-Features: AWEUYZlKhL9EQkxrrPGn2Xxl9dRf0ql99TamMut4CnEufz_dZhA1D8oIf-xamMo
Message-ID: <CAD=FV=U0FVUTYbAHUu4+eAUMpdLjN4VugJfkz=w8nTFUWsCxdw@mail.gmail.com>
Subject: Re: [PATCH v2 18/35] drm/bridge: Change parameter name of drm_atomic_bridge_chain_pre_enable()
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
> drm_atomic_bridge_chain_pre_enable() enables all bridges affected by
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
> index ab166972b1b0df239ca014296be49846a857df6e..02ddfe962b99bed4316b2a7b0=
c72112e127afa8b 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -672,23 +672,23 @@ void drm_atomic_bridge_chain_post_disable(struct dr=
m_bridge *bridge,
>         }
>  }
>  EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
>
>  static void drm_atomic_bridge_call_pre_enable(struct drm_bridge *bridge,
> -                                             struct drm_atomic_state *ol=
d_state)
> +                                             struct drm_atomic_state *st=
ate)
>  {
>         if (old_state && bridge->funcs->atomic_pre_enable)

drivers/gpu/drm/drm_bridge.c:683:6: error: use of undeclared
identifier 'old_state'; did you mean 'node_state'?
  683 |         if (old_state && bridge->funcs->atomic_pre_enable)
      |             ^~~~~~~~~
      |             node_state
