Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2935D2D5408;
	Fri, 13 Jun 2025 11:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749812602; cv=none; b=j1OtCSqZCq6A0MJ02tR9tkoNA2HsEQ0zjAEdUqYzvOD/ryav393UMfnH/rNUXjA5DO540c10hagw7JO0naUQ9x4UX7dJ4SIA3MZE8QUDxRbRjfOcg7Zlg33qY3Uix52PIZRzqD5Mq293fjPlcf92JvqllUl+vmHchfPaYy14WnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749812602; c=relaxed/simple;
	bh=xSacqbNIg/9oGP/awU7ktqaXCqSMSf5bNRHv9Vu8nMU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=s0ZQfL6Relm506/TF2Y0xoN633jGOHXVATeQPbXMygYBXXV9+1YLh3Ds7ETrxCHXR0iTOiseqbsF/m2mBoXGJdVtQFw7fxBYysIg/R1x1n8slw1/6HSbNszNexq5bFM+P43ghpHFrRTulbFhW2f8MMpaThB+cP2ehgy4zQ6dkjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=W74bGSVu; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="W74bGSVu"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0CB3B25F8B;
	Fri, 13 Jun 2025 13:03:18 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vCIuwyLbpHdc; Fri, 13 Jun 2025 13:03:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749812582; bh=xSacqbNIg/9oGP/awU7ktqaXCqSMSf5bNRHv9Vu8nMU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=W74bGSVu8Tkpq7tIWHOgrW5bDW+opJlr9W6rbqBkSHFmg1nBgI1YXJ3qYYlPHqkHc
	 5XRB08DesTbYTA2e600cDbpii29hkzuDYpEj1arI8OmQ2fNroCbMoWsVyIKpvdHY9L
	 dvFT2OqNJKZWZJhMm+l6KYlG+I0NdDgE73rEmo7MeFGe7IQQxVd7cML6QGj28V6Mg4
	 8OHWi77df+UfFnNnHne80ZmAgOJC66QxL3tiZJ10dAIg4Ac+D10tgwTjaybRjZzVz0
	 wUrOaLpZCMyL3t9ygNw/9PgziZxlrHLT2wHqtrvuEhMZKOr2p6FgHOkXIIRvfIxGIt
	 F/u/xfLvxfdsw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 13 Jun 2025 11:03:01 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jessica
 Zhang <jessica.zhang@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm: panel: add support for Samsung S6E8AA5X01 panel
 controller
In-Reply-To: <84ee6388-92af-49c8-988b-b79ed1453d5e@suse.de>
References: <20250612-panel-samsung-s6e8aa5x01-v1-0-06dcba071ea6@disroot.org>
 <20250612-panel-samsung-s6e8aa5x01-v1-2-06dcba071ea6@disroot.org>
 <84ee6388-92af-49c8-988b-b79ed1453d5e@suse.de>
Message-ID: <84663a88789b993a1cab8c55af4e03a7@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2025-06-13 09:39, Thomas Zimmermann wrote:
> Hi
> 
> Am 12.06.25 um 16:52 schrieb Kaustabh Chakraborty:
>> Samsung S6E8AA5X01 is an AMOLED MIPI DSI panel controller. Implement
>> a basic panel driver for such panels.
>>
>> The driver also initializes a backlight device, which works by changing
>> the panel's gamma values and aid brightness levels appropriately, with
>> the help of look-up tables acquired from downstream kernel sources.
>>
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>

[...]

>> +
>> +static void s6e8aa5x01_mcs_protect(struct mipi_dsi_multi_context *dsi,
>> +				   struct s6e8aa5x01_ctx *ctx, bool protect)
> 
> I found this interface confusing. Rather split it up into .  It also does two different things AFAICT.
> 
> - The mcs_mutex protects against concurrent access from update_status and enable

mcs_mutex is meant to prevent any early access protection of the MCS commands.
Suppose there are two functions, A and B, accessing MCS.

ENTRY: A()
(access protection disabled)
...

ENTRY: B()
(access protection disabled)
...
(access protection enabled)
EXIT: B()

[!] cannot access MCS commands here anymore
(access protection enabled)
EXIT: A()

And to avoid such errors a mutex is provided.

> 
> - MSC_ACCESSPROT enable access to hardware state.
> 
> Maybe try this:
> 
> - Move msc_mutex into the callers, so that ->update_status and ->enable acquire and release the lock.
> 
> - Move MCS_ACCESSPROT into ->enable and ->disable and leave it accessible, if the hardware allows that.

Yeah this is a good idea, I'll try it.

>> +{
>> +	if (protect) {
>> +		mipi_dsi_dcs_write_seq_multi(dsi, MCS_ACCESSPROT, 0xa5, 0xa5);
>> +		mutex_unlock(&ctx->mcs_mutex);
>> +	} else {
>> +		mutex_lock(&ctx->mcs_mutex);
>> +		mipi_dsi_dcs_write_seq_multi(dsi, MCS_ACCESSPROT, 0x5a, 0x5a);
>> +	}
>> +}
>> +
>> +static int s6e8aa5x01_update_brightness(struct backlight_device *backlight)#
> 
> Maybe call this function s6e8aa5x01_update_status() to match the callback.
> 
>> +{
>> +	struct mipi_dsi_multi_context dsi = { .dsi = bl_get_data(backlight) };
>> +	struct s6e8aa5x01_ctx *ctx = mipi_dsi_get_drvdata(dsi.dsi);
>> +	u16 lvl = backlight->props.brightness;
> 
> backlight_get_brightness() here ?
> 
> 
> I think you should also check panel->enabled and return if false. AFAIU there will be no gamma changes on disabled hardware anyway.
>

The enable function is never executed when the panel is disabled. This is
because flag checking is done by drm_panel anyway. See drm_panel_enable()
in drivers/gpu/drm/drm_panel.c [1]

>> +
>> +static int s6e8aa5x01_probe(struct mipi_dsi_device *dsi)
>> +{
>> +	struct device *dev = &dsi->dev;
>> +	struct s6e8aa5x01_ctx *ctx;
>> +	int ret;
>> +
>> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> 
> You're possibly using the instance after the hardware device has been removed. Alloc with drmm_kzalloc() or you might end up with UAF errors.

Hmm, none of the panel drivers are using drmm_kzalloc(), or even any
drmm_*(). Are you sure I must use it?

>> +	ret = devm_mutex_init(dev, &ctx->mcs_mutex);
> 
> You're taking this mutex in DRM code, so rather use drmm_mutex_init() here.

(The comment by me above applies here too)

> 
> Best regards
> Thomas

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/gpu/drm/drm_panel.c#n209
