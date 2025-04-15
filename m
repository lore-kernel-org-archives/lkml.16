Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB507143895;
	Tue, 15 Apr 2025 13:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724719; cv=none; b=RT78OFTkkgxkj3xeGSutj/LBFoj1r40W11q/mnQXcZgjkWsnp67q7BFq1yxbuPXD6z55cvRk57t0Zc8M7L3WyXFy/UsnG/qh8tgeAZBb93W/CPSdHCrg5KyCURv61Oa9iqEATbG+Bev0noB9a0EHh6iU5Eq8RzO7EbErCLP9O+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724719; c=relaxed/simple;
	bh=tVYaENywkg7K66SNQ07XcTDJezscNMZmcdIhQ1Ss9Pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iqhHBsrMweciuiBPYTSOVvv7stKzONcFwvZENghWizs/GawnqTe6eR/XXE0h3ecPlChs580GYDvAWLP3O2eUE8R3+Ygb7Ysp4gDHVcWxJOudzwMyw0txsfHwuQhfnwKFJZL+fRMJY5ONiKE5QvREDwHlaJQBM11diqOeyWIb4Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F493+2zx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F493+2zx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1CD5C4CEEF;
	Tue, 15 Apr 2025 13:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744724716;
	bh=tVYaENywkg7K66SNQ07XcTDJezscNMZmcdIhQ1Ss9Pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F493+2zxSK4vWCH85hab1C8FjJJJz4i+b/H55856f2Pr8LgB3/fTa5AxlPNKgECAq
	 OuShHpyMGgts4iU0c/PwsY/mUsFynO8gh1dwhpptb5n1y2WUB+nMwwId32a18Gx+Jg
	 AnEFrMEBeBNNHo6OscHXxvbXdNtMEp++/9qenulU7Lu8cbjYOCnfLuD93x1F7PTiVc
	 t2PnhPWrv+3vgVxdizpsktggQ2x1uz9yjrFrjL20u85bMKzdxuQUqxDFJGujMOequo
	 znNB2cbyP1cWzj2BnXxu86m9UeZjrpwEQGmAe17ILwqpCODY0PdffCoWuUU5syWooU
	 +ajJqSUlee1Xg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u4gbB-000000002zH-2pvP;
	Tue, 15 Apr 2025 15:45:14 +0200
Date: Tue, 15 Apr 2025 15:45:13 +0200
From: Johan Hovold <johan@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-sound@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Peter Rosin <peda@axentia.se>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 1/2] ASoC: codecs: wcd938x: fix mux error handling
Message-ID: <Z_5i6YUSGivzaOCb@hovoldconsulting.com>
References: <20250415074145.7202-2-johan+linaro@kernel.org>
 <18278ed3-fef0-400d-8cba-72f4c573d7ee@web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18278ed3-fef0-400d-8cba-72f4c573d7ee@web.de>

On Tue, Apr 15, 2025 at 12:00:33PM +0200, Markus Elfring wrote:
> …
> > +++ b/sound/soc/codecs/wcd938x.c
> > @@ -3271,18 +3271,13 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
> >  		return dev_err_probe(dev, wcd938x->reset_gpio,
> >  				     "Failed to get reset gpio\n");
> >  
> > -	wcd938x->us_euro_mux = devm_mux_control_get(dev, NULL);
> > -	if (IS_ERR(wcd938x->us_euro_mux)) {
> > -		if (PTR_ERR(wcd938x->us_euro_mux) == -EPROBE_DEFER)
> > -			return -EPROBE_DEFER;
> > +	if (of_property_present(dev->of_node, "mux-controls")) {
> > +		wcd938x->us_euro_mux = devm_mux_control_get(dev, NULL);
> > +		if (IS_ERR(wcd938x->us_euro_mux)) {
> > +			ret = PTR_ERR(wcd938x->us_euro_mux);
> > +			return dev_err_probe(dev, ret, "failed to get mux control\n");
> > +		}
> 
> May the error code assignment statement be omitted here together with extra curly brackets
> (as such a case is demonstrated in a subsequent if branch)?

I considered that, but I prefer using a temporary variable as it is more
readable.

> 
> +			return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_mux),
> +					     "failed to get mux control\n");

Johan
