Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69696088F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033172; cv=none; b=iVYk5MGyLnAYYOlP/xtaW0V2BAydGseeA1fWysNDsgSy4/cK3DA3OvjeHhp9quEZf0GtKx/h83iNRyxTk6rtv+CLKLpHjkhsY0w9ZyFpMbdrvwCk3Oet+C3K1No4N65zqQizBJDm2bDV+3IdQ8Eekz3/n2BoDGyo745t1Z+sraA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033172; c=relaxed/simple;
	bh=o1QpMVYuowvMwl78lRZxWOt199b0ID1HRsKYatOYaEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A8HDZnEjl1QWUQZWIKf7w447mFt+vsdD7GUJnAm/GeCpQF65YVCh6BD4N2E5B1tqlAM3iBU6Gl/RhfhgLqJ+2/GfLKw8JHdzKAIoVIGi7s5pn5v/dbFKhUtTQPm+Rk+MBw/B0KwK/TwaLzsjXvtP+i50zDZ9pg5Xz7qBg4gDn+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=AnUSn8Q0; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="AnUSn8Q0"
Date: Mon, 7 Apr 2025 09:39:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744033157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0XIUj5MzVf7FhQ0vyFo3sl3uOZZc7cydDbrjDL7zEyw=;
	b=AnUSn8Q0qW8EJbxaYpV//3gIq1BNV/l5jNmEnDrt4l/wo2PakV7tNGYR3IGv8dO3t9xeD3
	+NN/OvaHFh8FOR7dTh1CsE5vkBE7vez9xz0VrEfZ6dv3STH+Rf7ckwxp2tWoIei8Igcy+b
	5ZL1vloSJpacSgEcvZajunglNsWrXrPJtUwTkeD4TUBaP4z2lKD81FrWDJHzISwRmWBHK5
	ffSD87Wb3JhA4PhsNHKX94CjNbepPnT4bxu/TzV5+cArtmVlca9UXRCb1L+gXrzL+5pZEh
	XjUw/m5gpT2xdAw7014fsH5NKMpbUjw5qodLb7bWpla2dQqp8SCvv990JnvcKA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Aditya Garg <gargaditya08@live.com>
Cc: Petr Mladek <pmladek@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Aun-Ali Zaidi <admin@kodeit.net>,
	Maxime Ripard <mripard@kernel.org>, airlied@redhat.com,
	Simona Vetter <simona@ffwll.ch>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com,
	joe@perches.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
	Kees Cook <kees@kernel.org>, tamird@gmail.com,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	Hector Martin <marcan@marcan.st>,
	Asahi Linux Mailing List <asahi@lists.linux.dev>
Subject: Re: [PATCH v3 3/3] drm/appletbdrm: use %p4cl instead of %p4cc
Message-ID: <Z_PVfqVzvscBFND_@blossom>
References: <8153cb02-d8f1-4e59-b2d5-0dfdde7a832e@live.com>
 <PN3PR01MB9597A66B39FF5824E3718EC3B8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3PR01MB9597A66B39FF5824E3718EC3B8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Migadu-Flow: FLOW_OUT

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Mon , Apr 07, 2025 at 07:07:54PM +0530, Aditya Garg a écrit :
> From: Aditya Garg <gargaditya08@live.com>
> 
> Due to lack of a proper printk format, %p4cc was being used instead of
> %p4cl for the purpose of printing FourCCs. But the disadvange was that
> they were being printed in a reverse order. %p4cl should correct this
> issue.
> 
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> ---
>  drivers/gpu/drm/tiny/appletbdrm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/appletbdrm.c b/drivers/gpu/drm/tiny/appletbdrm.c
> index 703b9a41a..751b05753 100644
> --- a/drivers/gpu/drm/tiny/appletbdrm.c
> +++ b/drivers/gpu/drm/tiny/appletbdrm.c
> @@ -212,7 +212,7 @@ static int appletbdrm_read_response(struct appletbdrm_device *adev,
>  	}
>  
>  	if (response->msg != expected_response) {
> -		drm_err(drm, "Unexpected response from device (expected %p4cc found %p4cc)\n",
> +		drm_err(drm, "Unexpected response from device (expected %p4cl found %p4cl)\n",
>  			&expected_response, &response->msg);
>  		return -EIO;
>  	}
> @@ -286,7 +286,7 @@ static int appletbdrm_get_information(struct appletbdrm_device *adev)
>  	}
>  
>  	if (pixel_format != APPLETBDRM_PIXEL_FORMAT) {
> -		drm_err(drm, "Encountered unknown pixel format (%p4cc)\n", &pixel_format);
> +		drm_err(drm, "Encountered unknown pixel format (%p4cl)\n", &pixel_format);
>  		ret = -EINVAL;
>  		goto free_info;
>  	}
> -- 
> 2.43.0
> 
