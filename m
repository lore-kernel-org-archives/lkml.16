Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A574C195B37
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739187108; cv=none; b=lMrXLaozJlbIR/9wNLJoise4h77bMgVaERuI/0AG67m4gv+SJkv8yzR4DFFpTUQqf2pCx96ueprstvAaeCnPIkoeJh9FjY6gUZJox0nOFNJ7Tz2WtdqqbkPC53EIdRw5gMZMVp/H0QTQ36mYX3Y3LN/ti2TVT0cvPfGQi1HTPFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739187108; c=relaxed/simple;
	bh=uD24vpMHjIDvnNg9Yk5gleO0qA/L2sqeXXlSpc2KcRc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=avItoE6jEpKsbXKkvl1Sh/qzrznnVlB9DHwu4U11tjKOzm/kSeO00TnsnGK8e0DqHj0DdVGt+Abm8QGTcmZld22nid9Af6ZuFYYlBqDMY6gC6EjvBmKbBxyVlgv9sTeOzzgxzlyatM56QL1315ciM+//VmsL+HZyWFBqbB0OgUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BAWeicZi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAWeicZi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739187106; x=1770723106;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=uD24vpMHjIDvnNg9Yk5gleO0qA/L2sqeXXlSpc2KcRc=;
  b=BAWeicZiy0yffIT8fUZMD5OSz7bZBla7LcM5cLaOmNmU2BKRdGMDj3yk
   IffXkEG3oUVecxB975OB7W6dLoIHE3D+RgOv6Ly0KcWmVMUkAbxCnSb53
   6gX501WVOwaWL0T4YM6AXVWwuJtVl/zQ7GX6kjuSC8dbhEGJTv2dVUO0y
   qnP61GfwyZnnDs+20Y4f5x7n9lTe4QLiiKgV/R10BX+YF9CzQHiS/i5Pu
   bYW3r2jftcg3T4f6JYB8C0Zp+Uufd+cfnf6MNOSnP6hRSQiElS1Xf4jms
   Mcan1oIX1XODV9TjTLjl8CHaTAnZq9qbd8GqANHcpuSb+4vM/WDhlYh6B
   A==;
X-CSE-ConnectionGUID: 0Tt34ubVQjO8Vuobg+33mQ==
X-CSE-MsgGUID: cqB77i2CTUqrXWce1vZtFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="50401477"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="50401477"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 03:31:45 -0800
X-CSE-ConnectionGUID: Y1wboBuoQ4Wpsg8HqlW5tQ==
X-CSE-MsgGUID: MpoMJlTqQwSp7FuMSscSbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117376393"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.244])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 03:31:41 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Egor Vorontsov <sdoregor@sdore.me>, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Egor Vorontsov
 <sdoregor@sdore.me>
Subject: Re: [PATCH RESEND] drm/edid: Implement DisplayID Type IX & X timing
 blocks parsing
In-Reply-To: <e60254ec3544d37367c9917bc0e1cd5fdb95248d.camel@sdore.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <e60254ec3544d37367c9917bc0e1cd5fdb95248d.camel@sdore.me>
Date: Mon, 10 Feb 2025 13:31:38 +0200
Message-ID: <87o6za3ujp.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, 08 Feb 2025, Egor Vorontsov <sdoregor@sdore.me> wrote:
> Some newer high refresh rate consumer monitors (including those by Samsun=
g)
> make use of DisplayID 2.1 timing blocks in their EDID data, notably for
> their highest refresh rate modes. Such modes won't be available as of now.
>
> Implement partial support for such blocks in order to enable native
> support of HRR modes of most such monitors for users without having to re=
ly
> on EDID patching/override (or need thereof).

Thanks for the patch. It appears to do what's desired, but please find
quite a bit of comments inline.

> Link: https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/55

I think "Closes:" is what we want.

> Suggested-by: Maximilian Bo=C3=9Fe <max@bosse.io>
> Signed-off-by: Egor Vorontsov <sdoregor@sdore.me>
>
> ---
>
> The formatting was taken from the neighboring code for consistency,
> thus some warnings.

Sometimes it's good to follow the surrounding code, but let's not
duplicate existing mistakes. ;)

>
> [Resent due to some Spamhaus issues that are now resolved.]
>
>  drivers/gpu/drm/drm_displayid_internal.h | 13 +++++
>  drivers/gpu/drm/drm_edid.c               | 61 ++++++++++++++++++++++++
>  2 files changed, 74 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_displayid_internal.h b/drivers/gpu/drm/d=
rm_displayid_internal.h
> index aee1b86a73c1..a75d0f637b72 100644
> --- a/drivers/gpu/drm/drm_displayid_internal.h
> +++ b/drivers/gpu/drm/drm_displayid_internal.h
> @@ -66,6 +66,7 @@ struct drm_edid;
>  #define DATA_BLOCK_2_STEREO_DISPLAY_INTERFACE	0x27
>  #define DATA_BLOCK_2_TILED_DISPLAY_TOPOLOGY	0x28
>  #define DATA_BLOCK_2_CONTAINER_ID		0x29
> +#define DATA_BLOCK_2_TYPE_10_FORMULA_TIMING	0x2a
>  #define DATA_BLOCK_2_VENDOR_SPECIFIC		0x7e
>  #define DATA_BLOCK_2_CTA_DISPLAY_ID		0x81
>=20=20
> @@ -129,6 +130,18 @@ struct displayid_detailed_timing_block {
>  	struct displayid_detailed_timings_1 timings[];
>  };
>=20=20
> +struct displayid_formula_timings_9 {
> +	u8 flags;
> +	u8 hactive[2];
> +	u8 vactive[2];

Regardless of what was done in struct displayid_detailed_timings_1, I'd
go for defining these as:

	__be16 hactive;
	__be16 vactive;

and using be16_to_cpu() instead of hand-rolling it.

> +	u8 refresh;

Nitpick, I'd go for vrefresh.

> +} __packed;
> +
> +struct displayid_formula_timing_block {
> +	struct displayid_block base;
> +	struct displayid_formula_timings_9 timings[];
> +};

I know it's lacking in struct displayid_detailed_timing_block, but I'd
add __packed here too.

> +
>  #define DISPLAYID_VESA_MSO_OVERLAP	GENMASK(3, 0)
>  #define DISPLAYID_VESA_MSO_MODE		GENMASK(6, 5)
>=20=20
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 13bc4c290b17..8a4dec1d781c 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6833,6 +6833,64 @@ static int add_displayid_detailed_1_modes(struct d=
rm_connector *connector,
>  	return num_modes;
>  }
>=20=20
> +static struct drm_display_mode *drm_mode_displayid_formula(struct drm_de=
vice *dev,
> +							   struct displayid_formula_timings_9 *timings,

const

> +							   bool type_10)
> +{
> +	struct drm_display_mode *mode;
> +	unsigned hactive =3D (timings->hactive[0] | timings->hactive[1] << 8) +=
 1;
> +	unsigned vactive =3D (timings->vactive[0] | timings->vactive[1] << 8) +=
 1;

	u16 hactive =3D be16_to_cpu(timings->hactive) + 1;
        etc.

> +	u8 rb =3D timings->flags & 0b111;

I'd call this formula or algorithm instead of just rb.

Please avoid 0b, it's very rarely used. Just 0x7. Or we could start
defining macros for these in drm_displayid_internal.h...

Please add a blank line between declarations and code here.

> +	/* TODO: support RB-v2 & RB-v3 */
> +	if (rb > 1)
> +		return NULL;
> +
> +	mode =3D drm_cvt_mode(dev, hactive, vactive, timings->refresh, rb =3D=
=3D 1, false, false);

Refresh rate is -1 in the data block, so this needs timings->refresh +
1.

> +	if (!mode)
> +		return NULL;
> +
> +	/* TODO: interpret S3D flags */

More important is TODO for fractional refresh rate indicated by bit 4 of
flags.

> +
> +	mode->type =3D DRM_MODE_TYPE_DRIVER;
> +
> +	if (timings->flags & 0x80)
> +		mode->type |=3D DRM_MODE_TYPE_PREFERRED;

There's no such thing?

> +	drm_mode_set_name(mode);
> +
> +	return mode;
> +}
> +
> +static int add_displayid_formula_modes(struct drm_connector *connector,
> +				       const struct displayid_block *block)
> +{
> +	struct displayid_formula_timing_block *fb =3D (struct displayid_formula=
_timing_block *)block;

Please avoid fb as the name for this. Everyone's going to go all
"framebuffer", wtf, backtrack, oh, "formula block". ;)

This should also be a const pointer. (I know, the detailed modes one
isn't. Let's not duplicate mistakes from there.)

> +	int num_timings;
> +	struct drm_display_mode *newmode;
> +	int num_modes =3D 0;
> +	bool type_10 =3D block->tag =3D=3D DATA_BLOCK_2_TYPE_10_FORMULA_TIMING;
> +	u8 timing_size =3D 6 + ((fb->base.rev & 0x70) >> 4);

I'd go for int timing_size.

Blank line here.

> +	/* extended blocks are not supported yet */
> +	if (timing_size !=3D 6)
> +		return 0;
> +
> +	if (block->num_bytes % timing_size)
> +		return 0;
> +
> +	num_timings =3D block->num_bytes / timing_size;
> +	for (int i =3D 0; i < num_timings; i++) {
> +		struct displayid_formula_timings_9 *timings =3D \

const. Please don't use \ line continuations, it's not necessary.

> +			(struct displayid_formula_timings_9 *)&((u8 *)fb->timings)[i * timing=
_size];

Since we only support the one size for now, and that size is fixed in
struct displayid_formula_timings_9, there's no need to do all this
hackery. Just formula->timings[i].

Whoever fixes this for size 7 might have a better idea how to handle the
size anyway.

> +
> +		newmode =3D drm_mode_displayid_formula(connector->dev, timings, type_1=
0);
> +		if (!newmode)
> +			continue;
> +
> +		drm_mode_probed_add(connector, newmode);
> +		num_modes++;
> +	}
> +	return num_modes;
> +}
> +
>  static int add_displayid_detailed_modes(struct drm_connector *connector,
>  					const struct drm_edid *drm_edid)
>  {
> @@ -6845,6 +6903,9 @@ static int add_displayid_detailed_modes(struct drm_=
connector *connector,
>  		if (block->tag =3D=3D DATA_BLOCK_TYPE_1_DETAILED_TIMING ||
>  		    block->tag =3D=3D DATA_BLOCK_2_TYPE_7_DETAILED_TIMING)
>  			num_modes +=3D add_displayid_detailed_1_modes(connector, block);
> +		else if (block->tag =3D=3D DATA_BLOCK_2_TYPE_9_FORMULA_TIMING ||
> +			 block->tag =3D=3D DATA_BLOCK_2_TYPE_10_FORMULA_TIMING)
> +			num_modes +=3D add_displayid_formula_modes(connector, block);
>  	}
>  	displayid_iter_end(&iter);

--=20
Jani Nikula, Intel
