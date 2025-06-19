Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E67200127;
	Thu, 19 Jun 2025 08:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750323267; cv=none; b=EfWRjClmbHrU9txzh3/3PXaZX53yR/oQLNQ5dv+yCbnB0HzjSbAwrjVbNdS41mCdqttxPHefwjVnCl/qVsKkf33tZQf28wOo24ubv8oivgpS+G06FWKDr7pi7M3sVHz/p7VLcPf0qqjM1UQ2lfkSYOEbb2Y/Z2ovOcU0chHlJsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750323267; c=relaxed/simple;
	bh=5TsKhf5TFRjYNYJ1lfoUHSCn3Ye0Fxta6qs1C8pi8eE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GE06LdpmlC5Fe+kAe7zPhwJJAOugVZl9/2zd18k8uBnySjF3a79ZTGj/Hj5ZCEpfeFU6M7/aM3//as+j5gmxbeVqiPShRo6UkKhHAk8n7EfOfJJq1PaSP/7z61nlKQRlIi4cGOfShy68aTq61f9p3cbfbueV+YOIystaK5rOVxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRnctNSj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRnctNSj"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so6152735e9.1;
        Thu, 19 Jun 2025 01:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750323264; x=1750928064; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BgTuvT3u6AIqLm/PQRYt/22SDLcCwFXFs+qer6/yKE=;
        b=fRnctNSj2kH9uNpxIF2m3a/TTdBMdEdmlCrNMw98v4JDDNva6cfn3UzYvmy7gezxUf
         BwMir0NTHcwklEfjI+hXtaVBT6x/YyhynVnXxP3G+df5UfeDuykRY2M3aq4meJboaqe2
         3Xg5apE9ioduKNAKWx85l0V8pYvzNWbzBpDJIefVCw0fpzisNSq2/wgm6bMKahMQIfwS
         66Z5rlgA2eyIoMVPsG9GgXqLt2Bwdw0yRxwxHJBwnhXoySXxp4liFMc34MqkWZ4rseq6
         qoMRLhZXPnMovWxAqrbrYujf+Ee3rPdqha8Lf3164p6NZWJBW1SGwQTCutAFAmNMC92M
         KIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750323264; x=1750928064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BgTuvT3u6AIqLm/PQRYt/22SDLcCwFXFs+qer6/yKE=;
        b=oZwlywC9G2+EZS7vM3rZpB4+Bmq8kllNyJEo+fm3wF7gYi6yNERr3hHrW7Oykd3fxj
         kkvzbeVNC6wpbUB6RJED/GbGrN2DsooLyhWNZusQSow3xP3mDR/X2kIjZWmn5ynEaFuB
         UQrrsYYmtc+gY8qMToKbX+4AmDMjR+6ocgRG3ijgKLukNEx+cjRQICS4KRxn1D0GUABY
         Ytvz4p94OMIdAVcS6uhpDtCjKVMhoF8P4HaLJaM7KvGmkerYNigfDCecvObOMrjBpLIp
         o1tgIYvIOBNxwOlZtyoxRnKNRo3wNmEaQt8xO6EavnmUi3Kt9alqykOyPr4EVPYCIphp
         lR5g==
X-Forwarded-Encrypted: i=1; AJvYcCXkJFllQAW72oZqgfBoOT8rl8QFJ8aoB4FlxQp1yCpqVoKFqn7HAembIO7MWHjL646G74bveqtuXt8t@vger.kernel.org, AJvYcCXqFfekZO/a/u0k14nGsjBb+jfmTAfgCmis/NReawNg6NxPbzNYwpeP/EuTxDhVjJDX0ToLJQdCzC70m1Z2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4js1hFF9XyjFEI5/G3kPUU1r1/XMpp/h8IlfMwqGwno1lRxAH
	JSs94i74i3331qTRZd8DHlQALtpwCQ8W5PRp2q+PP8FLJSwJ6mDGyrgdM8fKS8SIvGx5ldrPrJz
	2f/pQpPoIysjaZfs3CPQSokdknU/mtJs=
X-Gm-Gg: ASbGncvSjuHdfapcazY08RbkKa64OY1MZokACROOvSWMv4S2MM4oao6tNKAtTqfImaa
	r+i3Lvhs3eJfrBu4QQeTtmkOyvQZiHR3xf9tCS9q1U5jjAnebGljKbz1WMYNYdO+SPrt5AbJSdS
	tX6FoEkRCH7lDJJ1tOGU3/7UiFFbpDBDOL0T5t3OTgp0I7
X-Google-Smtp-Source: AGHT+IEPcrAct2MvP6lMu67WHWgZkRHjbRH9x4L5SPSXZCedtmDIaEdykoVs3GdsAansa3lx+5kGChF4gR2TEuObCOU=
X-Received: by 2002:a05:6000:144f:b0:3a4:f72a:b18a with SMTP id
 ffacd0b85a97d-3a5723a197amr16822801f8f.26.1750323263687; Thu, 19 Jun 2025
 01:54:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526114353.12081-1-clamor95@gmail.com>
In-Reply-To: <20250526114353.12081-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 19 Jun 2025 11:54:12 +0300
X-Gm-Features: Ac12FXzaBC7401W2R75FUry1Dj9NV-cb1lVlcCWDqwkSkHUUU5xEZJLQ_IxV-to
Message-ID: <CAPVz0n3QJHBVbTvfW8A-4nTDmagEiav4iwiekFd-z2nQTvUegg@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] drm: bridge: add ssd2825 RGB/DSI bridge support
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 26 =D1=82=D1=80=D0=B0=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 14:4=
4 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Solomon SSD2825 is a RGB to MIPI DSI bridge used in LG Optimus 4D P880
> and LG Optimus Vu P895
>
> ---
> Changes on switching from v5 to v6:
> - set correct module name in Kconfig help
> - return error if spi sync failed for reading
>
> Changes on switching from v4 to v5:
> - rebased on top of drm-misc-next with adjustments to fit
>
> Changes on switching from v3 to v4:
> - no changes, resend
>
> Changes on switching from v2 to v3:
> - added mutex guard
> - configuration register flags parametrized using panel flags
> - removed unneded debug messages
> - removed unimplemented modes checks
> - added check for maximum pixel row length
> - use types header
> - remove ssd2825_to_ns
> - shift bridge setup into atomic pre-enable
> - cleaned default values of hzd and hpd
>
> Changes on switching from v1 to v2:
> - added description for clock
> - removed clock-names
> - added boundries for hs-zero-delay-ns and hs-prep-delay-ns
> - added mutex lock for host transfers
> - converted to atomic ops
> - get drm_display_mode mode with atomic helpers
> - parameterized INTERFACE_CTRL_REG_6 configuration
> - added video mode validation and fixup
> - removed clock name
> - switched to devm_regulator_bulk_get_const
> - added default timings
> ---
>
> Svyatoslav Ryhel (2):
>   dt-bindings: display: bridge: Document Solomon SSD2825
>   drm: bridge: Add support for Solomon SSD2825 RGB/DSI bridge
>
>  .../display/bridge/solomon,ssd2825.yaml       | 141 +++
>  drivers/gpu/drm/bridge/Kconfig                |  13 +
>  drivers/gpu/drm/bridge/Makefile               |   1 +
>  drivers/gpu/drm/bridge/ssd2825.c              | 814 ++++++++++++++++++
>  4 files changed, 969 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/solo=
mon,ssd2825.yaml
>  create mode 100644 drivers/gpu/drm/bridge/ssd2825.c
>
> --
> 2.48.1
>

These patches had no activity/feedback from DRM maintainers for a
while, so, in case they got lost in the depths of email box, this is a
friendly reminder that they are still relevant and I would like them
to move on.

Best regards,
Svyatoslav R.
