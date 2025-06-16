Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CEA216E26
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750091075; cv=none; b=R3zFFV5ANmzPHTLd2XKW67jBtZuZbguU9pO+XHTqG+raHfmMeBGsKXN/ZIGfrPDafgnUIW15cJ/NaEWS16gGeb2t/ZRRGOS1BcCrMT4g/q0zr9v0xv6zEilgPU3k36OUx2jvtNpAE+ePVGlH9kuLroDg0L4bb4PZ7YlELNl9jQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750091075; c=relaxed/simple;
	bh=Y4VyjNxxY6W3sU2TV0gRB/KV8PY0ccpcCfdQGFBPWvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IsNJrxmhk5+fZHJD8NoYmPS3726Tvv1prPXKZLNUNuz+42cM0SvqUox3X86lzHMa4UCV+H3lx8A6TE17ChyU2tY5tho3LiRKlLXQvkH14UXXQQSEnxuHSswgtvUqANyFNaj1HqwunsL7z6c6uWxe0kpgnh/I4zL26cJ31N7OpN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gBvRlXgz; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gBvRlXgz"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-236470b2dceso39745375ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750091070; x=1750695870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jn+pl8Ukndl7fV/3rtDt80K83DzVb4ofgvMyTIgGDxE=;
        b=gBvRlXgzTj/pLxVOyRF78AMU8rmkAIEv+VXcwr9KsEGabp2BxM2xvZMePz31G3CiYu
         jSdEyCXeWa0v06QALmIgwjKoDsQWhXaN5cCG2OjHCvUEnPzdybYPfzERv+RyOLkcozOe
         UCbnTXSkLHw3SFXOZbQUUu42gX1oJ2YYlSWiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750091070; x=1750695870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jn+pl8Ukndl7fV/3rtDt80K83DzVb4ofgvMyTIgGDxE=;
        b=wyLwB+efsOSpFJsNaneqwWyjqJ/yNH5wwA2u5qN0qOdx8+jmS0VeLqz0BUAzQSJneV
         hPn/sQMXOkiN/8XVctVAIuzoBFbDiYI5sA2gWw2ZMx2wgxAlphLCOTx7Z55i/sh9ENIs
         c6vtkUEEAX9TAQS/tXOgOwh1Tc5S446lP/gwZL/cUejV3hISeleYoFVBKe2xFT3VnmUC
         y4Nzvw9HCxkEQ3o2ojqAsXrG30RhycdkcoKTwMA53+iKpg7DF1NImMLRnOzyIZm0pz4E
         QWxM/YBe8arUw4m8XqEfICHtFm2zEsijgbDNVNRTyEBrCN9v3U6q+rrX87C/LeuR0nUp
         K5SA==
X-Forwarded-Encrypted: i=1; AJvYcCUahoN8SpYq4Bio9O0rvMLdxLoxrNElClxuA2pC9byET2uWFN+HzMTOT/GvDgzYSLGLz8wYfusKBplx4LU=@vger.kernel.org
X-Gm-Message-State: AOJu0YylcA9UA14zg2Fyk5WJSeZ5TcvthblVVmqm++IsRaFH+SRrx+9z
	m4R5MgGCVExOSzh+kIhPKA2rbDo6ssfNJmW5ADGF7MFKOZMcTZux8TGwYb6A4aeoO5qiRzT818r
	eXTg=
X-Gm-Gg: ASbGncvGBnGJsNwjb4Qp1whrndJI/vaB4A+4HDWdxJEEXwpQtWM0HxgNjICnvUfgCBw
	FPdHPzVauU1JY0giycD8klbfSR9VZ5dv1T1g0asVt3FPrlJDE3yZuBz+H2YLy5ryJpVA3zng5l5
	x3Nrx3EpBIOSRvIl0wgX3dmlTCmj9xYao2d9SNt3LkbEwoh42Wx460qP9XvNztlS4vVr4bABcPU
	XkBGjgPK3BjJqm04T78mDouQRwtWGo7UTvgI2MgyV3wc/vgpZlRaBVQGwe3isyYq37XZcoGdzSD
	0tta4PailspldwTUZpqr5K+pbzV+duMkrp1uE2H6K17appt8CKthAWA1OStQvZTBmYuKJjg5619
	FAmY1U7FC6ggn5otEStws4ldO7OoGwA==
X-Google-Smtp-Source: AGHT+IFhSb0g33+iwpE0YteOGYofG1LGCmkj9VUmu5y+T+TsgMWq5NIUZk8m+XaYjVmyH36otKQR/w==
X-Received: by 2002:a17:903:32cf:b0:234:e655:a618 with SMTP id d9443c01a7336-2366b3ad2d9mr147687395ad.25.1750091069774;
        Mon, 16 Jun 2025 09:24:29 -0700 (PDT)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com. [209.85.214.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365decc11fsm62856905ad.222.2025.06.16.09.24.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 09:24:28 -0700 (PDT)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23636167afeso45627385ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:24:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVpmlD2H3J5vzzsfqS8hUDL8UL38O8oM2wGkwN45jKD2PlAeyCwuKeVBZaBpduNq/wIv8j5iOEs2Jjcxok=@vger.kernel.org
X-Received: by 2002:a17:90b:35ce:b0:311:d670:a10d with SMTP id
 98e67ed59e1d1-313f1d96b23mr13483334a91.26.1750091067151; Mon, 16 Jun 2025
 09:24:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616093240.499094-1-j-choudhary@ti.com>
In-Reply-To: <20250616093240.499094-1-j-choudhary@ti.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Jun 2025 09:24:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wb=bWXDfCyF8XhJ93dBRU2rUKM+B0X5uYh39FHRgT1Ww@mail.gmail.com>
X-Gm-Features: AX0GCFvx1jdSZ7AywPO9rUfFoTu7hX2oWiRuFWLsC1T8ClrkXmqFBGVmsbCBYTw
Message-ID: <CAD=FV=Wb=bWXDfCyF8XhJ93dBRU2rUKM+B0X5uYh39FHRgT1Ww@mail.gmail.com>
Subject: Re: [PATCH v5] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org, 
	tomi.valkeinen@ideasonboard.com, max.krummenacher@toradex.com, 
	ernestvanhoecke@gmail.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, kieran.bingham+renesas@ideasonboard.com, 
	linux-kernel@vger.kernel.org, max.oss.09@gmail.com, devarsht@ti.com, 
	geert@linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 16, 2025 at 2:32=E2=80=AFAM Jayesh Choudhary <j-choudhary@ti.co=
m> wrote:
>
> @@ -1220,6 +1231,27 @@ static void ti_sn65dsi86_debugfs_init(struct drm_b=
ridge *bridge, struct dentry *
>         debugfs_create_file("status", 0600, debugfs, pdata, &status_fops)=
;
>  }
>
> +static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
> +{
> +       struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> +
> +       /*
> +        * Device needs to be powered on before reading the HPD state
> +        * for reliable hpd detection in ti_sn_bridge_detect() due to
> +        * the high debounce time.
> +        */
> +
> +       pm_runtime_get_sync(pdata->dev);
> +}
> +
> +static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
> +{
> +       struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> +
> +       pm_runtime_mark_last_busy(pdata->dev);
> +       pm_runtime_put_autosuspend(pdata->dev);

nit: you don't need the pm_runtime_mark_last_busy() here, do you? Just
call pm_runtime_put_autosuspend().

Aside from the nit, this looks reasonable to me now.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
