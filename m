Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7734AEE0
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 15:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.77.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749049615; cv=none; b=YiqAAxyS++HChVKAra5IezrQLqVL0qh5IsPW05CkC7RT+hXTv98UXDVootBAkdJz/FcfMy/qTWLUXI7vUEfdk0l/u3GIhSzfS0tyQSL8e/IxRTUc/GOuNWbTyjAVYpgNy/7Tw19pwO/XYyV9/VTsvvWSlM6TaI/JeJVu4P/iPvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749049615; c=relaxed/simple;
	bh=bNcCPvV34cKVyTSPI57sGlqSvF8/jG8Uxv8bCwnhi0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwDjuPOw3G81CShBiIt3r6Db5tYEUMfGruURFHuMOtS6ZC9H9XUUsSMWiCIcs1PwBM45nmEYhj/u63SBxS6lF+sGRobZFKsrqsvyIgZBjTXwidkQxFSur5c/P71WtHny/Av/5c9vi+tXWh+YNwV6cjJO/biDn7ky6oXh9YTksAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org; spf=pass smtp.mailfrom=bounce.ens-lyon.org; arc=none smtp.client-ip=140.77.166.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce.ens-lyon.org
Received: from localhost (localhost [127.0.0.1])
	by sonata.ens-lyon.org (Postfix) with ESMTP id 7A9C4A5E1A;
	Wed,  4 Jun 2025 16:58:08 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
	by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vTXMXiec2PkD; Wed,  4 Jun 2025 16:58:08 +0200 (CEST)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr [194.199.1.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by sonata.ens-lyon.org (Postfix) with ESMTPSA id B481CA5DE2;
	Wed,  4 Jun 2025 16:58:07 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98.2)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1uMpZ9-000000065Wf-16Fm;
	Wed, 04 Jun 2025 16:58:07 +0200
Date: Wed, 4 Jun 2025 16:58:07 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jagadeesh Yalapalli <jagadeesharm14@gmail.com>
Cc: William Hubbs <w.d.hubbs@gmail.com>,
	Chris Brannon <chris@the-brannons.com>,
	Kirk Reiser <kirk@reisers.ca>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, speakup@linux-speakup.org,
	linux-kernel@vger.kernel.org,
	Jagadeesh Yalapalli <jagadeesh.yalapalli@einfochips.com>
Subject: Re: [PATCH v1] speakup: Replace u_short with u16 for spk_chartab
Message-ID: <aEBe_wji03rJPBwj@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jagadeesh Yalapalli <jagadeesharm14@gmail.com>,
	William Hubbs <w.d.hubbs@gmail.com>,
	Chris Brannon <chris@the-brannons.com>,
	Kirk Reiser <kirk@reisers.ca>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, speakup@linux-speakup.org,
	linux-kernel@vger.kernel.org,
	Jagadeesh Yalapalli <jagadeesh.yalapalli@einfochips.com>
References: <20250604135846.46184-1-jagadeesharm14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604135846.46184-1-jagadeesharm14@gmail.com>
Organization: I am not organized

Hello,

Jagadeesh Yalapalli, le mer. 04 juin 2025 13:58:36 +0000, a ecrit:
> From: Jagadeesh Yalapalli <jagadeesh.yalapalli@einfochips.com>
> 
> The spk_chartab array was previously declared as `u_short`,
> which is a non-standard type and may vary in size across platforms.
> Replace it with `u16` to ensure consistent 16-bit width and improve
> code portability and readability.

There is much more to it than just this line: there is also the
declaration in speakup.h, and the comment above, and all related
variables such as default_chartab, the variables in functions such as
charclass, mask, char_type, ch_type, ...

Samuel

> Signed-off-by: Jagadeesh Yalapalli <jagadeesh.yalapalli@einfochips.com>
> ---
>  drivers/accessibility/speakup/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accessibility/speakup/main.c b/drivers/accessibility/speakup/main.c
> index e68cf1d83787..34c7cb6a9b43 100644
> --- a/drivers/accessibility/speakup/main.c
> +++ b/drivers/accessibility/speakup/main.c
> @@ -187,7 +187,7 @@ char *spk_default_chars[256] = {
>   * initialized to default_chartab and user selectable via
>   * /sys/module/speakup/parameters/chartab
>   */
> -u_short spk_chartab[256];
> +u16 spk_chartab[256];
>  
>  static u_short default_chartab[256] = {
>  	B_CTL, B_CTL, B_CTL, B_CTL, B_CTL, B_CTL, B_CTL, B_CTL,	/* 0-7 */
> -- 
> 2.43.0
