Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66AB1DFD84
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747752424; cv=none; b=bfQGDX0AMze2LW2rW5ZE7Lh0lV7dtUyJt+Gfau+kmvbE6LTsCPHi/wyZD78ZZ3g0H+kicYiimbPqDABXxYg4Xfi2bYamZQYCYQNCQcSIULCgQjdPlSASwyPto1CR5KT3P7Q1r8vx41nIdtpBLhSBVDhTSRb1/trIsg5u5MQpllA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747752424; c=relaxed/simple;
	bh=ZRQ3Q9G+wKen49/SUgW1eKjlAVd7SYSuATHQNLfuGaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MYs9+RnWU629XnTo0U5Ym917rEuy2PZoUhYvgfGgUWN9X4mZYrCha/1I6JGaUoW6svbq2j8jV30xs3gKtJyiBDe05z4qLOd5FgNbgNRvEVbCLw+j8c9BTjtlTHTnpSvjlHbr9NyzbrdlYuaUYqKJgDGr3cVV/wbhqmrSC3OLJEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GE2zvWnt; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GE2zvWnt"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b1fb650bdf7so3414925a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 07:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747752419; x=1748357219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4vJaDxoDG9WGh9CletqNGUQTpz+mcDhT/atRFz9AQ4=;
        b=GE2zvWntVmUVu8aBJy6M/LWY6PhJWTOWUb8hmqO9dRbmeWf9Aw+CemCwTMBB5XBn/u
         VeMJ6aJI/lP7fFcEUmXC/V6uff9/OuX3Wu2mkqAOslK2wMjgqUpd6+PeP4+WtEI0EzQX
         T4wit/SJX6/d0bWygn/69Ny9jGOIhW9x6UQFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747752419; x=1748357219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4vJaDxoDG9WGh9CletqNGUQTpz+mcDhT/atRFz9AQ4=;
        b=MT1ylVEhsmQkS1y269fb/aA9BRTCCdF36OZvK6/AFXmlolNzXEJmYCtPwNZr1+Vo1j
         zdPZS7obWv4rrrlsAVkxxxI8/fnpuqwvp303svzuFy67dXmgxTtyPjNYgHhKLCovl3Br
         NRmgGMSjFmQ1tIaFom39iu7gS7BjyCD2AkrzM3A2WzBszBOvzlq6/x88ScMiBhkxLQct
         ZHNgb/2XhJ6rfzTmbA8mJg4a7SAybUYZ3egGeC0fr11UGkmZwtDNIXDE1eoxAeGoMwBi
         WTk7x57ZrmM944nv0huQMa1U79ZEEZ5wtUz16OYDnoBc0crUGvRaBoFF+lWzElt3h1nS
         Xfgw==
X-Forwarded-Encrypted: i=1; AJvYcCV0ipcoRHVpFSrD1mOD6QPDOD7Rv14NVNWiifdbX4nkBDUFgbiVhQzKxWXR7nQSM3o+8HBiAATXB71Fzx0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtLM7F3pq71n9JxM3mYOgoV/kvvPRRKDKOLLPS98EtuXYWS2xo
	mJDeD4mCGi6QBO1ZmeVr9CUt2fchBKpiFqEoxBelqbQCizJNx8N76tqzMgURsWSFxjddftsB8af
	9ne4=
X-Gm-Gg: ASbGncvjzKfg25Goi6iWrYGPiPWSR67kZFIhrGhWSM3fK2xW0BYbzaWbluquEZH6yDg
	hznNNtJLFcqCNJABcQYHdEm1HMNylw3bRrAx2oqxOPFj0arZKaa5Q29lYcVFlHx15AXH0LcI04F
	o20UB/QdyslKcgNM1W8S7Cf98qKVIbB+bRahxdgvSsxiMHSrUZSkT9PpmEWkmU1KQUuLGH7Z2uf
	L5H29U7/6X/2NcCThcv0ziVXIEWORBVQwp9FtHkn7oGX2pazaQc00GkoSPwLNHUPcSsrjj/99aH
	7smwdeJSjAEgDYFv0oHeIcxX+8wbTNWeV7f9Kic9pAd4frUV90o4HWm3xWA0dps0Bew6kg1hONr
	G1W1uq9FpKrunxOH0Ddc8AGgFLV16lA==
X-Google-Smtp-Source: AGHT+IHIHl8GsjmsBiaaykvd91xNrwXRJblPMtZBk5Rx8UxPGNwMrH4TqvdzOtGILQ3V+Ymt6R+Qbw==
X-Received: by 2002:a17:902:e74c:b0:22e:59cc:a44e with SMTP id d9443c01a7336-231de3b96femr252229815ad.44.1747752418583;
        Tue, 20 May 2025 07:46:58 -0700 (PDT)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com. [209.85.214.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231e26d8448sm74477935ad.21.2025.05.20.07.46.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 07:46:56 -0700 (PDT)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-231fc83a33aso31430525ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 07:46:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVN9b8wEj+XDqSR+ytUzEwlL8y2HPi0tgae+rBG2XnRIz1SlKr2w9BVva8YAAWDJM0osfcW/glXoQI4/+A=@vger.kernel.org
X-Received: by 2002:a17:902:ea05:b0:223:f9a4:3fa8 with SMTP id
 d9443c01a7336-231de36a90cmr233267205ad.19.1747752415759; Tue, 20 May 2025
 07:46:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520124332.71705-1-ernest.vanhoecke@toradex.com>
In-Reply-To: <20250520124332.71705-1-ernest.vanhoecke@toradex.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 20 May 2025 07:46:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vwu=Oy_HA3Noj0bLX_GcqHLnrRd6kTRZFe0R7Z8-JD2Q@mail.gmail.com>
X-Gm-Features: AX0GCFviZ27GtZgXi5xqwESNlGLrxUC3PhVAhYxJBxB4B6ZFxbz3vrPQhk_NcqI
Message-ID: <CAD=FV=Vwu=Oy_HA3Noj0bLX_GcqHLnrRd6kTRZFe0R7Z8-JD2Q@mail.gmail.com>
Subject: Re: [PATCH v1] drm/panel-edp: Add support for AUO G156HAN03.0 panel
To: ernestvanhoecke@gmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, 
	Francesco Dolcini <francesco.dolcini@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 20, 2025 at 5:43=E2=80=AFAM <ernestvanhoecke@gmail.com> wrote:
>
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
> AUO G156HAN03.0 EDID:
>
> 00 ff ff ff ff ff ff 00 06 af ed 30 00 00 00 00
> 1a 1c 01 04 a5 22 13 78 02 05 b5 94 59 59 92 28
> 1d 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 78 37 80 b4 70 38 2e 40 6c 30
> aa 00 58 c1 10 00 00 18 00 00 00 0f 00 00 00 00
> 00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
> 55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
> 00 47 31 35 36 48 41 4e 30 33 2e 30 20 0a 00 bb
>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/panel-edp: Add support for AUO G156HAN03.0 panel
      commit: a4b4e3fd536763b3405c70ef97a6e7f9af8a00dc
