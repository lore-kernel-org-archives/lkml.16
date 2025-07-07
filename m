Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5E02951BD;
	Mon,  7 Jul 2025 12:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751892659; cv=none; b=aHsfpjRLF6O2zI8lmu2E5SUBzq1j1RYViYU0FmoPIb5ubqaBBqgvf6Il3iqcm5wsArLqWPWms/uML8WSsoYYN2WmNSPMlGeHHu8K94sxGCuGgYJ9YvIY+Op9ed4ofHdEP2ZeyGIlIL2ycowcZviJW/3qT5k2KxgR+tLvdmnSSeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751892659; c=relaxed/simple;
	bh=8D0ND6MgKS2kz8cNEU4c8+mnj+ib8apLrGUAo5hREf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cakvTmj+LraUP/pGMJT/axBrhFu6xZSnxRMn8obkfzWf1ZWuk4e2Eigc0dky0aCDlxQFBur9tDXf8Zcz5uA2k6ljIdxmdZzQ2J51aTkCf6S4Nt7t1PsPaOZrqgfDx4kZNBlL5W5BvllscOwdAYvgLUVJ/6wt+Y7K6gTdjfztjMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CMiHb+qu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CMiHb+qu"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 773DC9CA;
	Mon,  7 Jul 2025 14:50:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751892629;
	bh=8D0ND6MgKS2kz8cNEU4c8+mnj+ib8apLrGUAo5hREf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CMiHb+qu9ZdO1nuBqh6h7K8peGRc4Ah55KElqk+/71H2/uNErvdoEfljgxsDicT78
	 QmIxsuUcTjY8tBFCNOjsTM9rg3ig56UWTdmHaLs2BKXUle4ONX8zYI1CeuJ2/Rtthe
	 +cY4k8xEH+tgssIKXR8yDYLYJjXGpxFUB9E1C1J4=
Date: Mon, 7 Jul 2025 15:50:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Desnes Nunes <desnesn@redhat.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH v2] media: uvcvideo: avoid variable shadowing in
 uvc_ctrl_cleanup_fh
Message-ID: <20250707125028.GB12247@pendragon.ideasonboard.com>
References: <20250701172556.117872-1-desnesn@redhat.com>
 <45b69c6c-e8d5-4b71-9759-cd76eb1a7258@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <45b69c6c-e8d5-4b71-9759-cd76eb1a7258@kernel.org>

Hi Hans,

On Mon, Jul 07, 2025 at 02:43:09PM +0200, Hans de Goede wrote:
> On 1-Jul-25 19:25, Desnes Nunes wrote:
> > This avoids a variable loop shadowing occurring between the local loop
> > iterating through the uvc_entity's controls and the global one going
> > through the pending async controls of the file handle
> > 
> > Cc: stable@kernel.org
> > Fixes: 10acb9101355 ("media: uvcvideo: Increase/decrease the PM counter per IOCTL")
> > Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> 
> Thank you for the new version.
> 
> I've pushed this to uvc/for-next now:
> 
> https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/for-next/

As mentioned during the review (see
20250701192928.GB16835@pendragon.ideasonboard.com), I still prefer local
loop variables. Can we use that please ?

> Note I had to manually apply the patch because of it conflicting with:
> 
> https://gitlab.freedesktop.org/linux-media/users/uvc/-/commit/2b1e8e9f7bb30204ddb42887c4e554c131f003c9
> 
> So if you want this backported to stable you will need to send
> the original version to stable your self.
> 
> I plan to send a pull-request with the changes from for-next this Thursday.
> 
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 44b6513c5264..532615d8484b 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -3260,7 +3260,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
> >  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> >  {
> >  	struct uvc_entity *entity;
> > -	int i;
> > +	unsigned int i;
> >  
> >  	guard(mutex)(&handle->chain->ctrl_mutex);
> >  
> > @@ -3268,7 +3268,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> >  		return;
> >  
> >  	list_for_each_entry(entity, &handle->chain->dev->entities, list) {
> > -		for (unsigned int i = 0; i < entity->ncontrols; ++i) {
> > +		for (i = 0; i < entity->ncontrols; ++i) {
> >  			if (entity->controls[i].handle != handle)
> >  				continue;
> >  			uvc_ctrl_set_handle(handle, &entity->controls[i], NULL);
> 

-- 
Regards,

Laurent Pinchart
