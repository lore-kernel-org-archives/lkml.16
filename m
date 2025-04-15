Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02A31AD41F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744700546; cv=none; b=t6yiG1MiifUtSUtMThpKvryhmV4x6IpOmBo0tUKNjtM+4OWc1Ppn7dHYeCGxWgxxAJZdIZQPrj6QyQitsuhrPd7NyTLERWyP00dnoXlR+TIqos7XswGWYsaBdxPee4JM619Nck+ieIoR3GVPk2Jmkp3eYmxawVTMmWXoV3HNzdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744700546; c=relaxed/simple;
	bh=2ga1nUM6HtoCk8hWLrk5yxmK9z4M0Ju2AYWLWZGQEvw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g4INSL+I1kd9Csle2SRgQ1paRWPnV4ChdJHxdnNMTmHzuBzhvL3XxLItCO5qan2sByg6BTtrAOxxlWhYSqVl1vAQj1+BSLteC75aphTxXw+MCI3KHnt6FEK2GeMCL2p26ESb/YTagiqYiG/ANqG5Qb003q3qiPj3prcXqgzheKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TbKe/VBO; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TbKe/VBO"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac345bd8e13so899375766b.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744700543; x=1745305343; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2ga1nUM6HtoCk8hWLrk5yxmK9z4M0Ju2AYWLWZGQEvw=;
        b=TbKe/VBO5qsUyVLX0BRs9MUCX2eq7NbfHYjiZhXtKE3zaFX9ynyNFCmMKHpr/ifRFi
         vt4oXI3wOySd4XLkAiJa8iduE2pdbbMDcCu2pLkrCfhEnIWA3kCLp+Nn1snaMFXHtKCt
         DonaZ5Ii+kfgPJnE7xiNOuA086PHSRLLcvqQRhdNpt+lIxFo1QLlhBtm7HZ+SFCoNn1H
         W7HOO96qQUgvFt8PENuIWc5Jgx/IPnIwJ7zUHs0Mx/w36q2asPfqCkauGtWxIv7QaWZX
         vnBu1An7xBMPuzuvewnPn00WHyIIX5KrivBggIhq0qmhexXiWkJ3I07u6CyrmaScO1uL
         glSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744700543; x=1745305343;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ga1nUM6HtoCk8hWLrk5yxmK9z4M0Ju2AYWLWZGQEvw=;
        b=Po7vhFlxOfyrslaRN3uiGOjD8paEe6JnrWcATj09Fw9LmkBMkdeNCveT445yA8RMHH
         YvV08LCB0R6uKBQOTo/ws7wi9lOr+Ez5sJty7fB5pAPsQcotN9fF74hVF/N5y3NyDw2x
         Uudu0ponln+F5dujlY9yhxYRjR6SaFwSqKx2RZ8PJgXlNa+ca9I8LvWjTmI9c20u64jw
         b146/IJSf1A9btIkncSylECq69cQ6uNs3HkvQ9xhN11CKKTwDKpZgj8DpHqDDovjSr2/
         KeIf2BEuT0SbtfBYFvmRXwzoKtFwe3B+h/VLzIglmyvXubn6RTorwCE2WbKu9DdtWLv2
         CAPg==
X-Forwarded-Encrypted: i=1; AJvYcCV02mbZAcKsLGT7OgPuFhhNyblXxQOcWI/APAVrlUlKpRUtaHE9RsCLJQla56E28HJdpC7M67VTuFBRj7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMhs8tn60Cr1F03oRSShelLCP+HSTNcIQDTHVzQfzHU73L27GC
	BnqgbWZT3KqIlRsMQ2/XIGf9tpxzWaX7BYRjzAMolVyQ2XmG+o+3
X-Gm-Gg: ASbGncugWpmtE9DqEufv2xhcbFV2zt8GOAs7vXQ4ucD0HA4Sz8tsNPqbtTuO/olqNnV
	1iS8A9/0vcdlp7URH1oEKOqzq4D8ijBZibkH89a/ijcufiIMbHraxbPG95VIjS7OHj/xgVvGW/I
	XbAmeiKy7fBuO6quzYPmrT/u+WW4uuD1xCT8jCOJ+cvcU/s82jOZWS1mjvfJZW0Q2E9D3KiyOZD
	7eNao/viXClDkTHuQ9chaXOlBP2jTVG0bran3JJ4N9uixYytbm7SAEZMA2eTuO+472R4Ve/xVEG
	eIqjxSoXy5jAD1ywr6YLmX+KG1UrobR5KnHKiMgE6GhN/OV8RszOD/EO8XgJIQddHSOrCWVuuDG
	+7itLzdJnqeNO0sra9w==
X-Google-Smtp-Source: AGHT+IFb/WvyaRMShqXmEGsLHBs2VTsKNp0rNR0kfAcGtsbKVyXl57PvKN1tBQlqoyjWIvu4rRgAGw==
X-Received: by 2002:a17:907:3fa2:b0:ac7:edc4:3d42 with SMTP id a640c23a62f3a-acad349a039mr1313249166b.24.1744700542673;
        Tue, 15 Apr 2025 00:02:22 -0700 (PDT)
Received: from dominikat-nb.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1c0227bsm1035369466b.82.2025.04.15.00.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:02:22 -0700 (PDT)
Message-ID: <cb035f597291488e45d36c3b37a0559d6c80ea26.camel@gmail.com>
Subject: Re: [PATCH v3 00/17] drm/bridge: cdns-dsi: Make it work a bit better
From: Parth Panchoil <parth105105@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jyri Sarha
 <jyri.sarha@iki.fi>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
  Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,  Simona Vetter
 <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,  Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jayesh
 Choudhary <j-choudhary@ti.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Devarsh Thakkar <devarsht@ti.com>
Date: Tue, 15 Apr 2025 09:02:20 +0200
In-Reply-To: <20250414-cdns-dsi-impro-v3-0-4e52551d4f07@ideasonboard.com>
References: <20250414-cdns-dsi-impro-v3-0-4e52551d4f07@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-04-14 at 14:11 +0300, Tomi Valkeinen wrote:
> While trying to get the cdns-dsi to work on Toradex's AM69 Aquila
> platform, I hit multiple issues in the driver. Basicaly nothing
> worked
> for with the board.
>=20
> This series fixes those issues. While I itch to make much larger
> changes
> to the cdns-dsi driver, I opted to keep this series relatively simple
> to
> make the fixes more clear and possibly help with backporting.
>=20
> The series also touches tidss, but those changes are not strictly
> needed, and can be merged separately. And the series also touches
> cdns-dphy, and those changes are needed.
>=20
> This has been tested on Toradex AM69 Aquila (upstream) and AM62P
> Verdin
> (Toradex's BSP), with:
> - HDMI output using lontium lt8912b
> - LVDS panel (sn65dsi84 + panel-lvds)
>=20
> =C2=A0Tomi
>=20
>=20
(For the entire series)

Tested-by: Parth Pancholi <parth.pancholi@toradex.com>

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Changes in v3:
> - Add Aradhya's "drm/bridge: cdns-dsi: Fix the _atomic_check()" to
> the
> =C2=A0 dependencies
> - The above patch from Aradhya allowed adding "drm/bridge: cdns-dsi:
> =C2=A0 Drop crtc_* code", which resulted in quite large changes in the
> =C2=A0 commits, even if the end result doesn't really differ.
> - Reordered commits to decrease back-and-forth (e.g. fixing something
> in
> =C2=A0 a a code that will be removed in the next commits)
> - The reordering caused quite big changes in the commits (even if the
> =C2=A0 final end result is more or less the same), so I chose not to add
> =C2=A0 tested-by tags.
> - Rename 'cdns_get_dphy_pll_cfg' to 'cdns_dphy_get_pll_cfg'
> - Use div_u64() instead of div64_u64()
> - Drop "Fail if HS rate changed when validating PHY config". This was
> =C2=A0 too strict, as clock rounding (especially with DRM's 1kHz
> =C2=A0 resolution...) leads to clock rates that do not match exactly.
> =C2=A0 However, the rate mismatch should be fine as the commits adjust th=
e
> =C2=A0 pixel clock, and the resulting differences should be so small that
> we
> =C2=A0 can't even improve the timings match by adjusting the DSI HFP, as
> the
> =C2=A0 adjustment rounds to 0.
> - Link to v2:
> https://lore.kernel.org/r/20250402-cdns-dsi-impro-v2-0-4a093eaa5e27@ideas=
onboard.com
>=20
> Changes in v2:
> - Change the tidss clock adjustment from mode_fixup() to
> atomic_check()
> - Link to v1:
> https://lore.kernel.org/r/20250320-cdns-dsi-impro-v1-0-725277c5f43b@ideas=
onboard.com
>=20
> ---
> Tomi Valkeinen (17):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/tidss: Fix missing includes and struct=
 decls
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/tidss: Use the crtc_* timings when pro=
gramming the HW
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/tidss: Adjust the pclk based on the HW=
 capabilities
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phy: cdns-dphy: Store hs_clk_rate and retu=
rn it
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phy: cdns-dphy: Remove leftover code
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/bridge: cdns-dsi: Remove extra line at=
 the end of the file
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/bridge: cdns-dsi: Drop crtc_* code
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/bridge: cdns-dsi: Remove broken fifo e=
mptying check
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/bridge: cdns-dsi: Drop checks that sho=
uldn't be in
> .mode_valid()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/bridge: cdns-dsi: Update htotal in cdn=
s_dsi_mode2cfg()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/bridge: cdns-dsi: Drop cdns_dsi_adjust=
_phy_config()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/bridge: cdns-dsi: Adjust mode to negat=
ive syncs
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/bridge: cdns-dsi: Fix REG_WAKEUP_TIME =
value
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/bridge: cdns-dsi: Use video mode and c=
lean up
> cdns_dsi_mode2cfg()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/bridge: cdns-dsi: Fix event mode
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/bridge: cdns-dsi: Tune adjusted_mode->=
clock according to
> dsi needs
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/bridge: cdns-dsi: Don't fail on MIPI_D=
SI_MODE_VIDEO_BURST
>=20
> =C2=A0drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 211 +++++++++++---=
-
> ----------
> =C2=A0drivers/gpu/drm/tidss/tidss_crtc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 25 ++-
> =C2=A0drivers/gpu/drm/tidss/tidss_dispc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 22 ++-
> =C2=A0drivers/gpu/drm/tidss/tidss_dispc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +
> =C2=A0drivers/gpu/drm/tidss/tidss_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/gpu/drm/tidss/tidss_plane.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/gpu/drm/tidss/tidss_scale_coefs.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/phy/cadence/cdns-dphy.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 24 ++-
> =C2=A08 files changed, 142 insertions(+), 151 deletions(-)
> ---
> base-commit: 10646ddac2917b31c985ceff0e4982c42a9c924b
> change-id: 20250320-cdns-dsi-impro-3d8fbd7848d1
> prerequisite-message-id:
> 20250226155228.564289-1-aradhya.bhatia@linux.dev
> prerequisite-patch-id: 46845a8d15042dd343a29a17fc0b9d0eec2605f5
> prerequisite-patch-id: 7ce82c26cb9e18884492d2282a72ff2a760aefda
> prerequisite-patch-id: ec2071425cab81da72e0805ad92fc52731d7a24d
> prerequisite-patch-id: 32cde02288e0c36ed687f67778937a61f78b2d90
> prerequisite-patch-id: 5f302e2bead8994763699a909ad0b5501f09ed9f
> prerequisite-patch-id: 30611df6ef38c7872107d6bf6dde4504d46ab224
> prerequisite-patch-id: 99831bcaa13e25b957d83a6320f34bcec223b939
> prerequisite-patch-id: b0ad38bc6b323ceea7a1d2266b0fab8deaa6b05e
> prerequisite-patch-id: 38dbce2b9302a764be9dbdc551578f02d797dfcc
> prerequisite-patch-id: 133f8b1dab4f47d429b1924df981564ce3736233
> prerequisite-patch-id: 879c546693a53e4b72c1ee25954c894ae57a441f
> prerequisite-patch-id: 3e7edc818ac078a138f0e42e3f47fd685fffb84f
> prerequisite-patch-id: 673b9f0b1936b5a49973b71cab5d13774583de38
> prerequisite-message-id:
> 20250410134646.96811-1-aradhya.bhatia@linux.dev
> prerequisite-patch-id: 04f9a2440cebc87891b51d3f77996c88f7525d1c
>=20
> Best regards,

