Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648B0151988;
	Wed,  5 Feb 2025 14:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738766268; cv=none; b=oKdmU/RPs7nuWzoSQIVpyKRVJbaC9ePC+iAhQb/ycSc4Rabu69OAtIfGGNIjP/1eWDQ608Dvq8lewS9kYMKmUFX0rhejpm8SqSN7uALUeK4ihCRyVVPj+sx+3gFAUZoEEBE6eZt4cLaFMdprxIB866H/DCM/JOQ3RmoOt+ypeGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738766268; c=relaxed/simple;
	bh=h8qst0td1zw5Z6H2Ng460RAkS+IiIOF6nYwMXJpMbGE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YBN8KPxKdYG/qAJR391DaSG0IIQ/0Q2Qgjhrr2xbPWSMTfMJ0wqGNYpjrJryYvuSyGPLDwC68HdX3ovBZ8pPPt8W8sbME+LXnCTvMfXxlEQlhpOCqWStgx2FvV4tNRFOhGs0XieKSZjAXDqWWMEAoYCCe/5K1dkj1GZctclDWM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=OthwYV5w; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="OthwYV5w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=itgBDC2ytdn3pApg+pHXH0qGhVL8pA2oRw6633a5lAI=;
  b=OthwYV5wrElKxcU5ZzK55lkxWqcJr2FwvnedSBKAOTKkwRxKFoq92Yt5
   Q0nt+fykWP9tIpdTWySA2aWO1Hzl/aORwpFmfm7Y3KD/N8taGfDnDqGZH
   szkQAn+uGcj3L79tlOtjStzc2JuZW2xukWRLcScNTsfyyMRwQw6ilWOGI
   Q=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.13,261,1732575600"; 
   d="scan'208";a="206751283"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 15:36:36 +0100
Date: Wed, 5 Feb 2025 15:36:36 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Geert Uytterhoeven <geert+renesas@glider.be>
cc: Julia Lawall <Julia.Lawall@inria.fr>, 
    Nicolas Palix <nicolas.palix@imag.fr>, Rob Herring <robh@kernel.org>, 
    Saravana Kannan <saravanak@google.com>, 
    Wolfram Sang <wsa+renesas@sang-engineering.com>, cocci@inria.fr, 
    devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH/RFC v2] coccinelle: of_table: Do not add commas after
 sentinels
In-Reply-To: <f4d11c2e43697681678cf3fe0b2781bcd3bf3884.1738765482.git.geert+renesas@glider.be>
Message-ID: <6abd97ee-b9fe-d2eb-4486-b1c43efc0e5@inria.fr>
References: <f4d11c2e43697681678cf3fe0b2781bcd3bf3884.1738765482.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 5 Feb 2025, Geert Uytterhoeven wrote:

> It does not make sense to have a comma after a sentinel, as any new
> elements must be added before the sentinel.  Hence do not add the comma
> when adding the sentinel.
>
> Include the comma after the previous entry, else it will appear after the
> sentinel.
>
> Add a comment to clarify the purpose of the empty element.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Add devicetree people.
>
> This is a patch I wrote last year.
> My original intention was to create a Coccinelle script to remove
> commas after sentinels, and annotate them, to automate the creation of
> patches like commit 0256b6aeee11d705 ("pinctrl: renesas: Annotate
> sentinels in tables").  Unfortunately I could not get that work (blame
> it on this being my first experiment with Coccinelle).  Hence I gave up,
> and instead settled for adapting the existing script to not add these
> commas in the first place...
>
> Known issues:
>
>   1. This generates patches like:
>
> 	+	{/* sentinel */}
>
>      while I would prefer to see:
>
> 	+	{ /* sentinel */ }
>
>      Is there a way to do that, or should I just post-process the
>      generated patches?

Try running with --smpl-spacing.

julia

>
>   2. If the array contains a "{ NULL }" element, this is still flagged
>      as a missing sentinel:
>
> 	-	{ NULL }
> 	+	{ NULL },
> 	+	{},
>
>      Note that this is a pre-existing issue.
> ---
>  scripts/coccinelle/misc/of_table.cocci | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/coccinelle/misc/of_table.cocci b/scripts/coccinelle/misc/of_table.cocci
> index 4693ea7447534144..7ade9766dee89c70 100644
> --- a/scripts/coccinelle/misc/of_table.cocci
> +++ b/scripts/coccinelle/misc/of_table.cocci
> @@ -37,15 +37,14 @@ struct \(of_device_id \| i2c_device_id \| platform_device_id\) arr[] = {
>  	...,
>  	{
>  	.var = E,
> --	}
> -+	},
> -+	{ }
> +	},
> ++	{ /* sentinel */ }
>  };
>  |
>  struct \(of_device_id \| i2c_device_id \| platform_device_id\) arr[] = {
>  	...,
>  	{ ..., E, ... },
> -+	{ },
> ++	{ /* sentinel */ }
>  };
>  )
>
> --
> 2.43.0
>
>
