Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C223B251793
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 20:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750798764; cv=none; b=RCb+Lgtm1lMwtGr4XfKPZTLubARqTR0TmP2/16A0EFaKWUOJ014Hd545RF+oFGcgVCRHTU7dQa577bv9eX8ZIBRSZu15/W43d83AbU3RmLxF0v5BFhmz+bHcO8YSd2ybx6Ck7gph/KkSb543V5LSXmGUauHATvfBVl/8dLkpwxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750798764; c=relaxed/simple;
	bh=Qbq5RcKBLbJf9awkrGPL3Mn17sQ8Qc1wxnkEzefzYMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mT3sHGywnq6y1jcxCz7iX3kzyZV/pxskhaLNN0wMaYt2DFzHW9v+m/r0Ok1DFN3sD2Xj7Ho+otQvNQt4yvRIihGqO0ovgD0O5Cjh5tuI1rF8YPuZj/+Hb2TM6XC9vRRmEwRGWpu2O8fJOPG6odZb2Axsjc6UichXCRIfR2HPB/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k89dnIpX; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k89dnIpX"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22c33677183so11003925ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750798759; x=1751403559; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmATIdQ/ffuscr1/9tqMcccuRap6fnp/uwfwA9P/3gs=;
        b=k89dnIpX/GegTHOnEpC2SZ7cjJC4opOMBWWKudkWPyKViubPmfCGqGKRr9m4PievPI
         WwPq4Ovi6BHNTYXXOT8034endIXCtHUavP5obWLUmvMZIBADmFxU+416WHP9acIio4CA
         lpt/C3E2VOsg7WUEa8e6FKGiFdnBqmolhRwQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750798759; x=1751403559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GmATIdQ/ffuscr1/9tqMcccuRap6fnp/uwfwA9P/3gs=;
        b=KWHPfRot+85zVkCm8PU2VnP/T0PrbStrqhqhJshc4lL9kYuMF/dTb2QXD6ZZ8tOg+u
         nL9Fxpqp/1qVV8iA6LoKOPOS3qePmgNsGUEPy/hSzyWWgHHlbu6Y6NiwdOxgpdls4EEB
         1XnuBVbPSpVTI35CNJO4z1JjtvsjlCACMYuAUE2dv+CCZyARnAThABjEC4orqH/FJxXC
         nU093GlCKkPVg0jyIc2rcPavNce9rihktNXLeDxauOV6zKvOfxfRJ0Flciv1pNiLhsvv
         08PYAGVMAGlmwMUHPB9sqztbsGlGHlTibPxtYzCjgKYoXR8WMzwOebHybKG6RlLqYIs3
         azTg==
X-Forwarded-Encrypted: i=1; AJvYcCWC5GZRtubdBQXQmy0dRaSbWez4+kdUI1IwjvcKHFloXYp1ow2V0Xr/frAtYJbj9pg2VE0zl9REUl8duoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjwlxyWs4/iqteWTzbieZLEcUxNJRh3C16xpX7fe3YmOIT+/1P
	mNxcACsqHv/1ca4dwfke2gE6QHe3wg7Evot3UrgYswG6QwScX0IlOmT8IqrPt/TFEtzy4R+VWP7
	zHN4=
X-Gm-Gg: ASbGncswEkE9gxOjNQyGzIOgdVapfNMvdAJVU0fELgY82QmPMhT8kUkWIlPCQNvMNeJ
	SlemMtnnpsYwHiYxCRh5fcIhOrw2E/59q8SjMJIzmntAPiUZM3dJCZsDjqcxc/QWkxlVsYz07US
	D0o6DaItWDHx30uLi2qqOX2M4tUfB/q+Zgle9nPH/cvBCrJfyDw07N5+oU8vY8mFB2p9hgkEqde
	WIZlsWvM87LAbEjWvOgeYJ30DyhLYLjlUp9ULgI6gagrig0Bp0OwDWRCo47+pTGBPuTVSmpjJCi
	fipY+Ygs52fG12bdY7Jc9w5sWIrrmg6OzunW8Ra5in0MFchUeq0jXUvtKSoCFLJPa6LYPmSviW5
	1KJx0Iaw2V98lTrYiotuVhi+TqUVaFdJuIY0V
X-Google-Smtp-Source: AGHT+IGgBeFvyP2FEhsXIiDf+86NxGLVtwls3cJNhBxDejgjaPWPwmRN4qRpEeS2zUFPmUKOMkHZyw==
X-Received: by 2002:a17:903:b43:b0:234:c549:d9dd with SMTP id d9443c01a7336-23824384fb6mr11513525ad.48.1750798759459;
        Tue, 24 Jun 2025 13:59:19 -0700 (PDT)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com. [209.85.216.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86628ffsm113975575ad.156.2025.06.24.13.59.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 13:59:17 -0700 (PDT)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-31393526d0dso797821a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:59:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWGfgC5XkijI+ajLm+6Yqj+VFG5a72AKvGVafzgkmvH1eP1LyuEInH3mvb8IreeznLB21GjRpNm1uqD5u8=@vger.kernel.org
X-Received: by 2002:a17:90b:5210:b0:312:e9bd:5d37 with SMTP id
 98e67ed59e1d1-315f2613846mr422766a91.6.1750798756465; Tue, 24 Jun 2025
 13:59:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624044835.165708-1-j-choudhary@ti.com>
In-Reply-To: <20250624044835.165708-1-j-choudhary@ti.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 24 Jun 2025 13:59:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WgLCwZ5De1B0Cs6MS7310xRa45po_LW7065W2bPNT3Xg@mail.gmail.com>
X-Gm-Features: AX0GCFsuP_XCTbLoYyR2QmXPmrUMfyrQTUAlc0NxhI0dj1sXsPCFPgIpb-cazDo
Message-ID: <CAD=FV=WgLCwZ5De1B0Cs6MS7310xRa45po_LW7065W2bPNT3Xg@mail.gmail.com>
Subject: Re: [PATCH v6] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org, 
	devarsht@ti.com, tomi.valkeinen@ideasonboard.com, 
	kieran.bingham+renesas@ideasonboard.com, ernest.vanhoecke@toradex.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	linux-kernel@vger.kernel.org, max.oss.09@gmail.com, geert@linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 23, 2025 at 9:48=E2=80=AFPM Jayesh Choudhary <j-choudhary@ti.co=
m> wrote:
>
> By default, HPD was disabled on SN65DSI86 bridge. When the driver was
> added (commit "a095f15c00e27"), the HPD_DISABLE bit was set in pre-enable
> call which was moved to other function calls subsequently.
> Later on, commit "c312b0df3b13" added detect utility for DP mode. But wit=
h
> HPD_DISABLE bit set, all the HPD events are disabled[0] and the debounced
> state always return 1 (always connected state).
>
> Set HPD_DISABLE bit conditionally based on display sink's connector type.
> Since the HPD_STATE is reflected correctly only after waiting for debounc=
e
> time (~100-400ms) and adding this delay in detect() is not feasible
> owing to the performace impact (glitches and frame drop), remove runtime
> calls in detect() and add hpd_enable()/disable() bridge hooks with runtim=
e
> calls, to detect hpd properly without any delay.
>
> [0]: <https://www.ti.com/lit/gpn/SN65DSI86> (Pg. 32)
>
> Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge connecto=
r operations for DP")
> Cc: Max Krummenacher <max.krummenacher@toradex.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>
> Changelog v5->v6:
> - Drop pm_runtime_mark_last_busy()
> - Pick up tags
>
> v5 patch link:
> <https://lore.kernel.org/all/20250616093240.499094-1-j-choudhary@ti.com/>
>
> Changelog v4->v5:
> - Make suspend asynchronous in hpd_disable()
> - Update HPD_DISABLE in probe function to address the case for when
>   comms are already enabled. Comments taken verbatim from [2]
> - Update comments
>
> v4 patch link:
> <https://lore.kernel.org/all/20250611052947.5776-1-j-choudhary@ti.com/>
>
> Changelog v3->v4:
> - Remove "no-hpd" support due to backward compatibility issues
> - Change the conditional from "no-hpd" back to connector type
>   but still address [1]
>
> v3 patch link:
> <https://lore.kernel.org/all/20250529110418.481756-1-j-choudhary@ti.com/>
>
> Changelog v2->v3:
> - Change conditional based on no-hpd property to address [1]
> - Remove runtime calls in detect() with appropriate comments
> - Add hpd_enable() and hpd_disable() in drm_bridge_funcs
>
> v2 patch link:
> <https://lore.kernel.org/all/20250508115433.449102-1-j-choudhary@ti.com/>
>
> Changelog v1->v2:
> - Drop additional property in bindings and use conditional.
> - Instead of register read for HPD state, use dpcd read which returns 0
>   for success and error codes for no connection
> - Add relevant history for the required change in commit message
> - Drop RFC subject-prefix in v2
> - Add "Cc:" tag
>
> v1 patch link:
> <https://lore.kernel.org/all/20250424105432.255309-1-j-choudhary@ti.com/>
>
> [1]: <https://lore.kernel.org/all/mwh35anw57d6nvre3sguetzq3miu4kd43rokegv=
ul7fk266lys@5h2euthpk7vq/>
> [2]: <https://lore.kernel.org/all/CAD=3DFV=3DWvH73d78De3PrbiG7b6OaS_BysGt=
xQ=3DmJTj4z-h0LYWA@mail.gmail.com/>
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 69 +++++++++++++++++++++++----
>  1 file changed, 60 insertions(+), 9 deletions(-)

I'll plan to push this to drm-misc-fixes tomorrow morning unless there
are any objections or requests for me to wait.

-Doug
