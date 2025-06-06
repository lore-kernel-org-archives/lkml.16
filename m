Received: from zm-mta-out-3.u-ga.fr (zm-mta-out-3.u-ga.fr [152.77.200.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09235149C7B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.77.200.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749194772; cv=none; b=edMSXgTobZzXtlySZh98tAOi++JxpaiQ79L1PYO8O6lpqR9W/dN71oSEpDFgd9MYmcYdqoKj+8W2WYGdxB+GIQ00PhWxIM3gFIKLHjbKrWAtFxbFWUSuuLGCdJvAQzMxwt9knwRIc8Lp/l+PTwKc+2yM1OeWmO6HJVQCz3bToC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749194772; c=relaxed/simple;
	bh=pqT/dZ8MQ0553PB7mS7ex1pcWsm6e5wUh41kLMj5oW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D838tEDYdGRSaGKqvrIgHdV/of+OIMWiprhImDvLcoObnBcnYUEoVFBDJOvJVRYDVb7Lo3XpqGV+KTJK6UKpe3/7VHEErLfGXNftxrwPv9u8sjyDvrPpjC4g+TcwvcvFCmaAJewTm/DA9DRB2ull05lnvalAnb0qDInAhJz+2Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=imag.fr; spf=pass smtp.mailfrom=imag.fr; dkim=pass (2048-bit key) header.d=imag.fr header.i=@imag.fr header.b=CgjqmxcQ; arc=none smtp.client-ip=152.77.200.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=imag.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imag.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imag.fr header.i=@imag.fr header.b="CgjqmxcQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=imag.fr; s=2022;
	t=1749194766; bh=pqT/dZ8MQ0553PB7mS7ex1pcWsm6e5wUh41kLMj5oW8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CgjqmxcQUaC8STOfd05tri/ZpoCR6dXHcIFeB+IlqgFllZUC/Ja9D2cCHQMUDGt3x
	 uGblyaNgzXZ11GW1IKy1oWvaAasgdqQLy3z1IulIv8LFjRXYLQ2uj7onb653nDae3t
	 /2F7h5frzzy2V0G2LFSOiirHEwv9KPrf4cV9eI9YHsudCxp+2AAIQv1NGAIKUyDS3f
	 TlsU37XTpyRWaPZ3HWPbzNeQgSlP4hWMI0MjKuKGhTwW/Gt3y4JhlkaviSi7kcbu1I
	 s3h17m5prx9P0lZCenY5NABvON9g/5o+1+SuVk6PlrGBfqmMP3Ujl3fmd9BrN6PXAQ
	 sZKJhAC4S+46A==
Received: from mailhub-2.u-ga.fr (mailhub-2.u-ga.fr [129.88.178.102])
	by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id E564440225;
	Fri,  6 Jun 2025 09:26:06 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
	by mailhub-2.u-ga.fr (Postfix) with ESMTP id D842BFF993;
	Fri,  6 Jun 2025 09:26:06 +0200 (CEST)
Received: from [129.88.53.236] (erods-yttrium2.imag.fr [129.88.53.236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: palixn@univ-grenoble-alpes.fr)
	by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id B4BDA1400A2;
	Fri,  6 Jun 2025 09:26:06 +0200 (CEST)
Message-ID: <54b6e30f-a194-4f5f-9df4-5df0d3d4d738@imag.fr>
Date: Fri, 6 Jun 2025 09:26:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] scripts: coccicheck: filter *.cocci files by MODE
To: Songwei Chai <quic_songchai@quicinc.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, cocci@inria.fr
Cc: linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com,
 quic_jinlmao@quicinc.com
References: <20250606060936.2756980-1-quic_songchai@quicinc.com>
Content-Language: en-US, fr
From: Nicolas Palix <nicolas.palix@imag.fr>
Organization: LIG
In-Reply-To: <20250606060936.2756980-1-quic_songchai@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (palixn@univ-grenoble-alpes.fr) via submission-587 ACL (41)

Le 06/06/2025 à 08:09, Songwei Chai a écrit :
> Enhance the coccicheck script to filter *.cocci files based on the
> specified MODE (e.g., report, patch). This ensures that only compatible
> semantic patch files are executed, preventing errors such as:
> 
>      "virtual rule report not supported"
> 
> This error occurs when a .cocci file does not define a 'virtual <MODE>'
> rule, yet is executed in that mode.
> 
> For example:
> 
>      make coccicheck M=drivers/hwtracing/coresight/ MODE=report
> 
> In this case, running "secs_to_jiffies.cocci" would trigger the error
> because it lacks support for 'report' mode. With this change, such files
> are skipped automatically, improving robustness and developer
> experience.
> 
> Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
Acked-by: Nicolas Palix <nicolas.palix@imag.fr>
> ---
>   scripts/coccicheck | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/coccicheck b/scripts/coccicheck
> index 0e6bc5a10320..89d591af5f3e 100755
> --- a/scripts/coccicheck
> +++ b/scripts/coccicheck
> @@ -270,7 +270,11 @@ fi
>   
>   if [ "$COCCI" = "" ] ; then
>       for f in `find $srctree/scripts/coccinelle/ -name '*.cocci' -type f | sort`; do
> -	coccinelle $f
> +        if grep -q "virtual[[:space:]]\+$MODE" "$f"; then
> +                coccinelle $f
> +        else
> +                echo "warning: Skipping $f as it does not match mode '$MODE'"
> +        fi
>       done
>   else
>       coccinelle $COCCI
> 

