Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761863C00;
	Tue,  8 Apr 2025 13:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744118438; cv=none; b=m7BET0+TXsEQOvI3dl+j0tCXWqeDBA0T66Jd24t6itwgtjleCxOxlusbppRmKvZeFWFoYwVr0o236IWuucKOJBEv//6ocVBjkSKwvLC2gz2ATPXPWQfBnPFgW7jBLY5a49Q/1eol3QHBXTDnUtR2ZVFzQPtYnIMLxLHmbYnKHNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744118438; c=relaxed/simple;
	bh=ew77iTJXMeiY7VLKA7ubX/P/8KCT6I6hHqItB2aZ9EM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0g3kHJss3bau8I7e0R1ZQR3gmsTWa9NX5cvTNTBnQl24d8Zvq4u/vlbQWMbfE3Nwfb1MBxDtD8xU0/xuW+YgpdFqFrNKWe0TAO8ldTKMEFVfTXyqvrtf1+qbzE2Koo1i7ODGG35yMgmZLqU89ggxAV0kVJuKjwKLi9myMq9yoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSKRHRPb; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSKRHRPb"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30dd5a93b49so50166781fa.0;
        Tue, 08 Apr 2025 06:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744118434; x=1744723234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AqGCWUN00EqG8+9hEzWouzwuxZo1aHhQ8hA3XaHvu/w=;
        b=ZSKRHRPbrqln8Q+BwDg2095fjZ5SfX5UxbG1dYhfkxS2/1St1Eb5dymp31kiu33pWG
         ziXnRuJH6N61QdgeuDQAJ7bkj/y0KjAi88ptB78nDxk8vmL5SQgB+QgtcjmH6rXbGizN
         pqwj9WwCPti2trztibNS9Ns3d0Vw0JaBaYQJI3HvTrdn4RRl5U3Wn21owhgMIcvuziHV
         KSwpEX+nrd6vKdPNueUJ3o+lOtHPuspfhnGt95GnYzoVZXU2A9BCO552N2shu+KVgP7D
         acfC28is8zX8J4BLRnAoduZNuTe5Za+sAIWD0GQ9kKWksdyL3K6BvUmt99YS5dy3F71i
         9eBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744118434; x=1744723234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqGCWUN00EqG8+9hEzWouzwuxZo1aHhQ8hA3XaHvu/w=;
        b=rkPbpQPaG3UmWTKTL8zoYC56iz/IfzW6W/KqDMTE4EXY43MUVpX1alpdTARTsXGthJ
         E4H3/FkxdeOqzFkMmVwyQ+BJavuFL4ogGDwwmkHuLjA+nhhBcTqUYdQB6ZpVm4JrdjYD
         jo7flnCQumPPvnhj0MrdYC35IHjypkZTLX4qPUAF76SzBWbKUC69RWO0fD/exFxJC6/i
         fNrD+4+M+P+xSQqW8wrWptBY//d3GQIQgCBeBA6+hjaWGEXJu5shToFRKGzCt8756ONp
         6HzbohvmoBhLbywl2/emcYjnaQPbhvFJ1906w1vw15uOOl+dhLOS6N8q0jADwyrXZQzV
         dS4A==
X-Forwarded-Encrypted: i=1; AJvYcCUUbcO1EywQ3P9ZBUGf0U+2+8tZWdMXcggKsKSR6gaLBLPiw+vlDgUpNyzzyIWwbzDoVmTH/jM/ha+6@vger.kernel.org, AJvYcCXcv4gyPf+SyRkRw26arfbxA0m9H27JyPabiLyU/buDwClzQCiDDjkda9rQx2Xgn4Qxsyw5c709Zignmn7W@vger.kernel.org
X-Gm-Message-State: AOJu0YxkUw5TD2LoSKgrWsSkqTnl1TaVJj+U69hOwC3ILz0uIIskxOBY
	IbvWTvuCYrU0ADF97b/ptzx19MewA4b0TH8LKwwvxh8+EAs2prao
X-Gm-Gg: ASbGncsmB0kjfNH/uN1Okw/oDG9/FiUMtmZMkjF6HbOiEtllvHfyi0V8y1otXzPQEFD
	8Y78PM1fiBapKGRpVcPPrR3GrrJY/r0NWI533thzXRMFJbWkp4eH5Q6pzqEoTCDhGHyxTo5hFDd
	WM3s2EVweT56KgtJ+2rG0K5y8PazhODQTdeYsN9I3u8PhJy5za+SLh9Rt0sVsg2+WCafkjUqUYe
	eNiAP3qT7mYHXkHab8kS+JYdthvZkdxKVk775b2pft3fdp92+l+yYC3mamYOJnd+6Wxi+brIAQ8
	h882W2SJNGA6gHQXFhzAMCEw2ULp7fLAOrYBEtVZ275kWEIjTC+tcs1T7oFalxtO84DAB9TUcNQ
	ij/p9ww==
X-Google-Smtp-Source: AGHT+IF5ka75jbvTjBNXuR8hKu8LFh4jM4MbKJb+EKox7FPWdyzZ86fidkMWsWR4NDR3GMf86r6dew==
X-Received: by 2002:a05:651c:2115:b0:30c:5c6:91e0 with SMTP id 38308e7fff4ca-30f0a0ec026mr52056281fa.2.1744118433999;
        Tue, 08 Apr 2025 06:20:33 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0314b908sm19189081fa.55.2025.04.08.06.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 06:20:33 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:20:31 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v3 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
Message-ID: <Z_Uin2dvmbantQU4@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZXwCdfs2wH9Csgkp"
Content-Disposition: inline
In-Reply-To: <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>


--ZXwCdfs2wH9Csgkp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Javier,

Thank you for your review and suggestions.

On Tue, Apr 08, 2025 at 12:44:46PM +0200, Javier Martinez Canillas wrote:
> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
>=20
> Hello Marcus,
>=20
> > Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
> > The controller has a SPI, I2C and 8bit parallel interface, this
> > driver is for the I2C interface only.
> >
>=20
> I would structure the driver differently. For example, what was done
> for the Solomon SSD130X display controllers, that also support these
> three interfaces:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/gpu/drm/solomon
>=20
> Basically, it was split in a ssd130x.c module that's agnostic of the
> transport interface and implements all the core logic for the driver.
>=20
> And a set of different modules that have the interface specific bits:
> ssd130x-i2c.c and ssd130x-spi.c.
>=20
> That way, adding for example SPI support to your driver would be quite
> trivial and won't require any refactoring. Specially since you already
> are using regmap, which abstracts away the I2C interface bits.

Yes, I had in mind to start looking into this after the initial version.
The driver is writtin in this in mind, everything that is common for all
interfaces is easy to move out.

>=20
> > Reviewed-by: Thomas Zimmermann <tzimmrmann@suse.de>
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
> >  drivers/gpu/drm/tiny/Kconfig      |  11 +
> >  drivers/gpu/drm/tiny/Makefile     |   1 +
> >  drivers/gpu/drm/tiny/st7571-i2c.c | 721 ++++++++++++++++++++++++++++++=
++++++++
>=20
> I personally think that the tiny sub-directory is slowly becoming a
> dumping ground for small drivers. Instead, maybe we should create a
> drivers/gpu/drm/sitronix/ sub-dir and put all Sitronix drivers there?
>=20
> So far we have drivers in tiny for: ST7735R, ST7586 and ST7571 with
> your driver. And also have a few more Sitronix drivers in the panel
> sub-directory (although those likely should remain there).
>=20
> I have a ST7565S and plan to write a driver for it. And I know someone
> who is working on a ST7920 driver. That would be 5 Sitronix drivers and
> the reason why I think that a dedicated sub-dir would be more organized.
>=20
> Maybe there's even common code among these drivers and could be reused?
>=20
> Just a thought though, it's OK to keep your driver as-is and we could do
> refactor / move drivers around as follow-up if agreed that is desirable.

That sounds like a good idea.

[...]

>=20
> > +#define drm_to_st7571(_dev) container_of(_dev, struct st7571_device, d=
ev)
> > +
>=20
> I usually prefer these to be static inline functions instead of a
> macro. That way you get type checking and the end result should be
> basically the same.

I agree, I will change this to a static inline function.

>=20
> > +struct st7571_device {
> > +	struct drm_device dev;
> > +
> > +	struct drm_plane primary_plane;
> > +	struct drm_crtc crtc;
> > +	struct drm_encoder encoder;
> > +	struct drm_connector connector;
> > +
> > +	struct drm_display_mode mode;
> > +
> > +	struct i2c_client *client;
> > +	struct regmap *regmap;
> > +	bool ignore_nak;
> > +
>=20
> I know you mentioned that the chip sometimes nacks some I2C messages but
> maybe we want to better understand why that is the case before adding a
> flag like this?
>=20
> In particular, I see in the "6.4 MICROPROCESSOR INTERFACE" section of the
> datasheet the following note:
>=20
> "By connecting SDA_OUT to SDA_IN externally, the SDA line becomes fully
> I2C interface compatible. Separating acknowledge-output from serial data
> input is advantageous for chip-on-glass (COG) applications. In COG
> applications, the ITO resistance and the pull-up resistor will form a
> voltage  divider, which affects acknowledge-signal level. Larger ITO
> resistance will raise the acknowledged-signal level and system cannot
> recognize this level as a valid logic =E2=80=9C0=E2=80=9D level. By separ=
ating SDA_IN from
> SDA_OUT, the IC can be used in a mode that ignores the acknowledge-bit.
> For applications which check acknowledge-bit, it is necessary to minimize
> the ITO resistance of the SDA_OUT trace to guarantee a valid low level."

This has completely flown under the radar, thank you for pointing it out.

I will put the text from the datasheet together with ignore_nak.

>=20
> ...
>=20
> > +static int st7571_set_pixel_format(struct st7571_device *st7571,
> > +				   u32 pixel_format)
> > +{
> > +	switch (pixel_format) {
> > +	case DRM_FORMAT_C1:
> > +		return st7571_set_color_mode(st7571, ST7571_COLOR_MODE_BLACKWHITE);
> > +	case DRM_FORMAT_C2:
> > +		return st7571_set_color_mode(st7571, ST7571_COLOR_MODE_GRAY);
> > +	default:
> > +		return -EINVAL;
> > +	}
>=20
> These should be DRM_FORMAT_R1 and DRM_FORMAT_R2 and not C{1,2}. The former
> is for displays have a single color (i.e: grey) while the latter is when a
> pixel can have different color, whose values are defined by a CLUT table.
>=20

I see.
Does fbdev only works with CLUT formats? I get this error when I switch
to DRM_FORMAT_R{1,2}:

[drm] Initialized st7571 1.0.0 for 0-003f on minor 0
st7571 0-003f: [drm] format C1   little-endian (0x20203143) not supported
st7571 0-003f: [drm] No compatible format found
st7571 0-003f: [drm] *ERROR* fbdev: Failed to setup emulation (ret=3D-22)


> ...
>=20
> > +
> > +static const uint32_t st7571_primary_plane_formats[] =3D {
> > +	DRM_FORMAT_C1,
> > +	DRM_FORMAT_C2,
> > +};
> > +
>=20
> I would add a DRM_FORMAT_XRGB8888 format. This will allow your display to
> be compatible with any user-space. Your st7571_fb_blit_rect() can then do
> a pixel format conversion from XRGB8888 to the native pixel format.

This were discussed in v2, but there were limitations in the helper
functions that we currently have.

I will look into how this could be implemented in a generic way, but maybe =
that is
something for a follow up patch?


[...]
> > +
> > +static const struct drm_plane_helper_funcs st7571_primary_plane_helper=
_funcs =3D {
> > +	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> > +	.atomic_check =3D st7571_primary_plane_helper_atomic_check,
> > +	.atomic_update =3D st7571_primary_plane_helper_atomic_update,
> > +};
>=20
> Maybe you want an .atomic_disable callback that clears your screen ?

Good point, yes, I will add that.

>=20
>=20
> > +
> > +/*
> > + * CRTC
> > + */
> > +
> > +static const struct drm_crtc_helper_funcs st7571_crtc_helper_funcs =3D=
 {
> > +	.atomic_check =3D drm_crtc_helper_atomic_check,
>=20
> I think you could have an .mode_valid callback that just checks the fixed=
 mode.

Got it.

>=20
> > +/*
> > + * Encoder
> > + */
> > +
> > +static const struct drm_encoder_funcs st7571_encoder_funcs =3D {
> > +	.destroy =3D drm_encoder_cleanup,
> > +};
>=20
> I recommend to have an encoder .atomic_{en,dis}able callbacks to init and=
 turn=20
> off your display respectively. That way, the driver can call st7571_lcd_i=
nit()
> only when the display is going to be used instead of at probe time.

I will look into this as well.

>=20
> ...
>=20
> > +static enum drm_mode_status st7571_mode_config_mode_valid(struct drm_d=
evice *dev,
> > +						       const struct drm_display_mode *mode)
> > +{
> > +	struct st7571_device *st7571 =3D drm_to_st7571(dev);
> > +
> > +	return drm_crtc_helper_mode_valid_fixed(&st7571->crtc, mode, &st7571-=
>mode);
> > +}
>=20
> The fact that you are calling a drm_crtc_helper here is an indication tha=
t probably
> this should be done in a struct drm_crtc_helper_funcs .mode_valid callbac=
k instead,
> as mentioned above.

I will move it to drm_crtc_helper_funcs.

>=20
> > +
> > +static const struct drm_mode_config_funcs st7571_mode_config_funcs =3D=
 {
> > +	.fb_create =3D drm_gem_fb_create_with_dirty,
> > +	.mode_valid =3D st7571_mode_config_mode_valid,
>=20
> And that way you could just drop this handler.

Yep, thanks.

>=20
> > +	.atomic_check =3D drm_atomic_helper_check,
> > +	.atomic_commit =3D drm_atomic_helper_commit,
> > +};
> > +
>=20
> ...
>=20
> > +static int st7571_probe(struct i2c_client *client)
> > +{
> > +	struct st7571_device *st7571;
> > +	struct drm_device *dev;
> > +	int ret;
> > +
> > +	st7571 =3D devm_drm_dev_alloc(&client->dev, &st7571_driver,
> > +				    struct st7571_device, dev);
> > +	if (IS_ERR(st7571))
> > +		return PTR_ERR(st7571);
> > +
> > +	dev =3D &st7571->dev;
> > +	st7571->client =3D client;
> > +	i2c_set_clientdata(client, st7571);
> > +
> > +	ret =3D st7571_parse_dt(st7571);
> > +	if (ret)
> > +		return ret;
> > +
> > +	st7571->mode =3D st7571_mode(st7571);
> > +
> > +	/*
> > +	 * The chip nacks some messages but still works as expected.
> > +	 * If the adapter does not support protocol mangling do
> > +	 * not set the I2C_M_IGNORE_NAK flag at the expense * of possible
> > +	 * cruft in the logs.
> > +	 */
> > +	if (i2c_check_functionality(client->adapter, I2C_FUNC_PROTOCOL_MANGLI=
NG))
> > +		st7571->ignore_nak =3D true;
> > +
> > +	st7571->regmap =3D devm_regmap_init(&client->dev, &st7571_regmap_bus,
> > +					   client, &st7571_regmap_config);
> > +	if (IS_ERR(st7571->regmap)) {
> > +		dev_err(&client->dev, "Failed to initialize regmap\n");
>=20
> If you use dev_err_probe(), you can give some indication to users about
> what failed. It prints messages in the /sys/kernel/debug/devices_deferred
> debugfs entry.

Got it, thanks.

>=20
> > +
> > +static void st7571_remove(struct i2c_client *client)
> > +{
> > +	struct st7571_device *st7571 =3D i2c_get_clientdata(client);
> > +
> > +	drm_dev_unplug(&st7571->dev);
>=20
> I think you are missing a drm_atomic_helper_shutdown() here.

This is a change for v3. As the device has been unplugged already, it
won't do anything, so I removed it.

Isn't it right to do so?


>=20
> And also a struct i2c_driver .shutdown callback to call to
> drm_atomic_helper_shutdown() as well.
>=20
> --=20
> Best regards,
>=20
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>=20

Best regards,
Marcus Folkesson

--ZXwCdfs2wH9Csgkp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmf1IpoACgkQiIBOb1ld
UjIDKA/+PSZ5CWmnyWYCRXKWBsPRzDUm1rsoRl2NmXt9DdQ8DxNWfgOOv/Itogj+
3ifsnIvctBee7IKub3+TXFKXqlkxVwmkmrNdy27ut6jGcA2oldEJMeeLYk2kXiVC
gNZgCg9tTw/MBGzccNDy9D9rssA/MxJM1Uvep0LKo6dTc5KKs73ITF8KJNSmCauj
h7THDMOzOcacGyb0/WuGe8qqiIZmiNoHdoIMjHc9vbTgYFRyoCGMLvaZTo5b1NO/
v0wvdSX5Zi4Gz/fOcz7eIOtVIZvrKEobWDNzWosvOAbtw6NM8iApmcdn7HfpADH6
Wt+IdzMi28sbOZ0dHmtkfgUhtR6pnorLyYl8hwuzYKoPjyitP3BgSVTGQeHjdxaV
HiShRHa7bhNMOXxfF+BXeUmTqBxWFJiqn6QD8nRCBPMy+I/I91ZrbdE8eIedp0s2
tRtBbFCqBG1rmlcp/RlDPq/Ftllk8JmmfcDpaTYGl8jX4y2FIDnGB3JYvKiOTxaO
w6BckLC3Lcpce0VlGcpDktW89ossTJQ+RjEH6/SjFVfNevuSFaoe0eAvG1YOni3B
FD97Hqm6umjp+yyulTcTr0NLgQbkBxXwMhB3GRABKwssdxHP2zkXGgjA3gYCYNNA
TsOzTs8Ntkxo+U6QsqKNW7yTvkRYzDX6YJ5N7ofUuKBkhKpmB5Q=
=6hqo
-----END PGP SIGNATURE-----

--ZXwCdfs2wH9Csgkp--
