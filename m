Received: from zm-mta-out-3.u-ga.fr (zm-mta-out-3.u-ga.fr [152.77.200.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27BC2777E4
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 17:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.77.200.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145809; cv=none; b=fhEd3CZp4dmpE0cRdnYDZt9Mw9aQsvTJV3+fJBwHu2tXX654I7s2SlZTiCVzIhlgSGVwUa9s+Fa4ovvCJWoy6CEmxdw4oYOM8OpBvrefyCSiuerQkwgm39kJ1YUKGyPkx99HUm8ZrJYeyycy8AhGSVqpl+T9bNjJ42P+TF3AmYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145809; c=relaxed/simple;
	bh=477VCimCiTfccZ61itzmeWM2c2Jc7goY4wvB2OQY1l0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DLTH+mO7uojc6c2KShMT3t3DG9M4GqKal79jcLprdP3sPyipltjYRCPgD6sg/7Fk5HmtBxNlTNDvN+nLVF4Gxe60/z4W+F3XGjpJxL1byWTwvg4tS9PBQ6gv/aPjQ5H20nB6FBe/ySk+EcBV1LXEY9vwV1XwcI1c3W8bfWqU4Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=imag.fr; spf=pass smtp.mailfrom=imag.fr; dkim=pass (2048-bit key) header.d=imag.fr header.i=@imag.fr header.b=K8gyncPr; arc=none smtp.client-ip=152.77.200.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=imag.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imag.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imag.fr header.i=@imag.fr header.b="K8gyncPr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=imag.fr; s=2022;
	t=1749145400; bh=477VCimCiTfccZ61itzmeWM2c2Jc7goY4wvB2OQY1l0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K8gyncPrqZOaj4hsIUmtg0P6S97JUBctmO+QyxeJaiAltO589Sdg4mBrERLp+Cgfc
	 y829XuKBvHeEJ8RZLEshyWVLqP/hqtoVOYY1ozdPpyUxL5eldWjzopDoDvElsSx7CA
	 14E/M64xDcI+Xzeha3q5zHDrIolw352D7xIcVH/Ly90sauoOJ0lzemuOgSmBD4zjsH
	 9CaSHFqZlNhGKy+Qlh1IeeFnkc5fZLUyTUi/X5FKI4YPYu8MoAzVvTgTseb4quh6tV
	 lBYMjSadeRxHmVupIK6rOPKGhHUPwdWpWOMIkWa0UoXcr1vuCw3J40X/Ce3Gdd6NQp
	 MT7iIFv+6E59g==
Received: from mailhub-1.u-ga.fr (mailhub-1.u-ga.fr [129.88.178.98])
	by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id A59C94029E;
	Thu,  5 Jun 2025 19:43:20 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
	by mailhub-1.u-ga.fr (Postfix) with ESMTP id A2290FF853;
	Thu,  5 Jun 2025 19:43:20 +0200 (CEST)
Received: from [192.168.1.87] (unknown [87.89.124.250])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: palixn@univ-grenoble-alpes.fr)
	by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 335B71400A2;
	Thu,  5 Jun 2025 19:43:20 +0200 (CEST)
Message-ID: <e8221cc5-cf5b-49f8-871d-e49d6621fc6e@imag.fr>
Date: Thu, 5 Jun 2025 19:43:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] scripts: coccicheck: filter *.cocci files by MODE
To: Songwei Chai <quic_songchai@quicinc.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, cocci@inria.fr
Cc: linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com,
 quic_jinlmao@quicinc.com
References: <20250605044405.2057511-1-quic_songchai@quicinc.com>
Content-Language: en-US, fr
From: Nicolas Palix <nicolas.palix@imag.fr>
Organization: LIG
In-Reply-To: <20250605044405.2057511-1-quic_songchai@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (palixn@univ-grenoble-alpes.fr) via submission-587 ACL (41)

Hi Songwei,

Le 05/06/2025 à 06:44, Songwei Chai a écrit :
> Enhance the coccicheck script to filter *.cocci files based on the
> specified MODE (e.g., report, patch). This ensures that only compatible
> semantic patch files are executed, preventing errors such as:
> 
>      "virtual rule report not supported"
> 
> This error occurs when a .cocci file does not define a 'virtual <MODE>'
> rule, yet is executed in that mode.

I am fine with the idea even if the orignal idea was to be exhaustive in 
the implementation of the mode in each SP.

However, silently discarding the patch is maybe not what one would 
expect as the considered SP will vary according to the mode.

Hence, could I suggest to add an else branch reporting a warning at least ?

Regards,

> 
> For example:
> 
>      make coccicheck M=drivers/hwtracing/coresight/ MODE=report
> 
> In this case, running "secs_to_jiffies.cocci" would trigger the error
> because it lacks support for 'report' mode. With this change, such files
> are skipped automatically, improving robustness and developer experience.
> 
> Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
> ---
>   scripts/coccicheck | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/coccicheck b/scripts/coccicheck
> index 0e6bc5a10320..18a69edcea66 100755
> --- a/scripts/coccicheck
> +++ b/scripts/coccicheck
> @@ -270,7 +270,9 @@ fi
>   
>   if [ "$COCCI" = "" ] ; then
>       for f in `find $srctree/scripts/coccinelle/ -name '*.cocci' -type f | sort`; do
> -	coccinelle $f
> +        if grep -q "virtual[[:space:]]\+$MODE" "$f"; then
> +	        coccinelle $f
> +        fi
>       done
>   else
>       coccinelle $COCCI
> 

