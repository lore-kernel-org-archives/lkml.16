Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8C21B87D0
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738328216; cv=none; b=A50QfLrApEvkhb5rNjgKrB+GXPMZTDQm8cZTsPKvQi81RYKNwPT5cQt4PObopbKFa451LOqDGeGFnkzwd/0bFwR5zTygmxw6fiHwfIA/bzfQpjTb6mwyfjF74SPWHvz2HH42Z0fOXOdOmjX94/wb/Ow9rAtGbr31ptf+SHfIbtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738328216; c=relaxed/simple;
	bh=PkMi/cLj9fmqmCPZVMgdyLDHlVWfRFuzPlkZm5yX4+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ThXKDvh1hNIOeRxvjT/o0Yx8dSnF3LL4+MtsMMiFyCzzIRPGo22prxwuSzjCJKFZnGyZK8w61w38J4eVVK6PUAELPKb5/PMji7pZpP1OmOFtdarTxKv9wK7yfGbNa2gMoNjkCPo2AefalCwChkkrWHszzOE1L6DhUxLtPKW/FAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=ObGVA5f3; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="ObGVA5f3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=/FoI0hcOWWKx3ZDDab4Xa9u6v7y9BGQr2tGgLwIcnOM=; b=ObGVA5f3t35MDUOj
	57qdyRZw7FkLaRYghMy/WiNCiGtPzCwRdOds0dIJWht+8qv7VSX2L0XiIrI6A77eZgtUAFN2Yf92v
	ZlrZ1MS35oJTPxwI5IG472cWhFH9eLSQoXgcDGF1w0xLLLes6NsFDqvYodhvhQqJBA7n290VAUo2C
	N0ldzsW09QOcQni/JWde03+by4A9s44a7glwxPfrBEkxNKwq/kosr3Tm/mhATwBMWfobPsMkdti3U
	E+2fV7W8QWgX9sakrAMVsVuV385NFz/+UYlEpm9Hk2mDYdmU+PsrcSZ8CKcAsJEdqqb63lL3gyG9e
	2EEpHuSqBZbO9WbjNA==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1tdqZW-00CwEi-2A;
	Fri, 31 Jan 2025 12:56:34 +0000
Date: Fri, 31 Jan 2025 12:56:34 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ville.syrjala@linux.intel.com, jfalempe@redhat.com,
	tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] Revert "drm/client: Add
 drm_client_modeset_check()"
Message-ID: <Z5zIgmCn4Hl56mS6@gallifrey>
References: <20241029234706.285087-1-linux@treblig.org>
 <20241029234706.285087-4-linux@treblig.org>
 <4ysvn7vcynvmjc53frgj2nwuctf6kd6xdphgfjm3ulgfaxwngm@mod6oqvfmxav>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <4ysvn7vcynvmjc53frgj2nwuctf6kd6xdphgfjm3ulgfaxwngm@mod6oqvfmxav>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 12:53:50 up 268 days, 7 min,  1 user,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Dmitry Baryshkov (dmitry.baryshkov@linaro.org) wrote:
> On Tue, Oct 29, 2024 at 11:47:05PM +0000, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > drm_client_modeset_check() was explicitly added in 2020 by
> > commit 64593f2a6fc9 ("drm/client: Add drm_client_modeset_check()")
> > but has never been used.
> > 
> > This reverts commit 64593f2a6fc933bb9a410bc3f8c261f3e57a9601.
> 
> Nit: Usually this comes before the commit message.  No need for repost
> though.
> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Hi,
  Just checking, has anyone got this in a pull?
Dmitry's review was at the end of October.
(There's also a few others that Dmitry was kind enough to review
still outstanding:
  drm: encoder_slave: Remove unused encoder functions
and
  gpu: ipu-v3: Remove unused functions
)

(There's also drm/i915/gvt: Remove intel_gvt_ggtt_h2g<->index
and co that I've seen in Next but not in a pull yet)

Thanks,

Dave

> 
> 
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > ---
> >  drivers/gpu/drm/drm_client_modeset.c | 35 ++++------------------------
> >  include/drm/drm_client.h             |  1 -
> >  2 files changed, 4 insertions(+), 32 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> > index cee5eafbfb81..39201c11eaac 100644
> > --- a/drivers/gpu/drm/drm_client_modeset.c
> > +++ b/drivers/gpu/drm/drm_client_modeset.c
> > @@ -995,7 +995,7 @@ bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation)
> >  }
> >  EXPORT_SYMBOL(drm_client_rotation);
> >  
> > -static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool active, bool check)
> > +static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool active)
> >  {
> >  	struct drm_device *dev = client->dev;
> >  	struct drm_plane *plane;
> > @@ -1062,10 +1062,7 @@ static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool
> >  		}
> >  	}
> >  
> > -	if (check)
> > -		ret = drm_atomic_check_only(state);
> > -	else
> > -		ret = drm_atomic_commit(state);
> > +	ret = drm_atomic_commit(state);
> >  
> >  out_state:
> >  	if (ret == -EDEADLK)
> > @@ -1126,30 +1123,6 @@ static int drm_client_modeset_commit_legacy(struct drm_client_dev *client)
> >  	return ret;
> >  }
> >  
> > -/**
> > - * drm_client_modeset_check() - Check modeset configuration
> > - * @client: DRM client
> > - *
> > - * Check modeset configuration.
> > - *
> > - * Returns:
> > - * Zero on success or negative error code on failure.
> > - */
> > -int drm_client_modeset_check(struct drm_client_dev *client)
> > -{
> > -	int ret;
> > -
> > -	if (!drm_drv_uses_atomic_modeset(client->dev))
> > -		return 0;
> > -
> > -	mutex_lock(&client->modeset_mutex);
> > -	ret = drm_client_modeset_commit_atomic(client, true, true);
> > -	mutex_unlock(&client->modeset_mutex);
> > -
> > -	return ret;
> > -}
> > -EXPORT_SYMBOL(drm_client_modeset_check);
> > -
> >  /**
> >   * drm_client_modeset_commit_locked() - Force commit CRTC configuration
> >   * @client: DRM client
> > @@ -1168,7 +1141,7 @@ int drm_client_modeset_commit_locked(struct drm_client_dev *client)
> >  
> >  	mutex_lock(&client->modeset_mutex);
> >  	if (drm_drv_uses_atomic_modeset(dev))
> > -		ret = drm_client_modeset_commit_atomic(client, true, false);
> > +		ret = drm_client_modeset_commit_atomic(client, true);
> >  	else
> >  		ret = drm_client_modeset_commit_legacy(client);
> >  	mutex_unlock(&client->modeset_mutex);
> > @@ -1246,7 +1219,7 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
> >  
> >  	mutex_lock(&client->modeset_mutex);
> >  	if (drm_drv_uses_atomic_modeset(dev))
> > -		ret = drm_client_modeset_commit_atomic(client, mode == DRM_MODE_DPMS_ON, false);
> > +		ret = drm_client_modeset_commit_atomic(client, mode == DRM_MODE_DPMS_ON);
> >  	else
> >  		drm_client_modeset_dpms_legacy(client, mode);
> >  	mutex_unlock(&client->modeset_mutex);
> > diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> > index bc0e66f9c425..ead3c3526ee3 100644
> > --- a/include/drm/drm_client.h
> > +++ b/include/drm/drm_client.h
> > @@ -177,7 +177,6 @@ int drm_client_modeset_create(struct drm_client_dev *client);
> >  void drm_client_modeset_free(struct drm_client_dev *client);
> >  int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width, unsigned int height);
> >  bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation);
> > -int drm_client_modeset_check(struct drm_client_dev *client);
> >  int drm_client_modeset_commit_locked(struct drm_client_dev *client);
> >  int drm_client_modeset_commit(struct drm_client_dev *client);
> >  int drm_client_modeset_dpms(struct drm_client_dev *client, int mode);
> > -- 
> > 2.47.0
> > 
> 
> -- 
> With best wishes
> Dmitry
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
