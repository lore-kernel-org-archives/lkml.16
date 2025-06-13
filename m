Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB0F19C558
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 17:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749835093; cv=none; b=A5nW5MPwhzKlF1sgOwg8Q0/f6GhMLprMDopds3KV5Sx36X09TXe1AS4guiBsngDoLyvsNO/OKbsyWf5gvjk/HvLxwHZJ2GnwfHQlNdDxuD7Ya2TO5ydPraMl0GBgS+OD8EmLEtiP5/XDk1MjmXI9VI+wIUQEBPbrUjd8t9seb+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749835093; c=relaxed/simple;
	bh=qOAaSK0i4JY+2lxY4sFKnHMudgOX455/UPjJpdmjGWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gm88PEpAJzUBR3IbDVN/kD7jq012yCfFzp3ehfhEnODDKoquY7jnbB0REL+LAYy3Pa5VgZbNcu6s1QJIC1N13Rrl6y/JXff0WXoaIIWYNaKQ5omf5EmKeVgLNkCaQblEPBwr/HbnvtbqJS/WOXZn2USMy3LBWee6WQ7euD8Oz5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kqcp4lZK; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kqcp4lZK"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b3182c6d03bso108377a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 10:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749835091; x=1750439891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lsmpqmL7w+/CwGWjuLFXFQAJZbzAXyTWyTM4rCVagQk=;
        b=Kqcp4lZKZJrFzMPGJ5JHm4t0CPwqeBokHlwvVWGbIvE+aebaOJ+aE0KZa2TXznaiAN
         PFtPAt4wimEN/I80VGEh3GDplvqV6YuUGo/y2CWahUpFqot/7hJCCOM9fuIXVNJAxnsp
         eNb9/uoL5KjEILnZFpToUlkOaX9OZnW0xCOXMeVIRvvoBU0tNhI5WEQNWGpvQady3JQ6
         o111PgQqB0bI3Fzf6PwR5Bs7GXF6d0yIYPKzQH07CFnEygrUGpyzFMc1N7VmHEOJDudC
         PA//iuY9OXaB33/+0o5k+vZ1YiqBHMeXnTfctzKIJ2zcOFM5cU1EdVoEFtZA77gUJCLn
         PBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749835091; x=1750439891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lsmpqmL7w+/CwGWjuLFXFQAJZbzAXyTWyTM4rCVagQk=;
        b=nXQYvNeSEZ3rpfVQoLxTl0ZBeVes1GDV9/T9U6vblpIa02Tt4n2OeSWtkWYQN6PuEA
         EMHXRddzxT4RtzIDy/d60CuFGam5Xxynl/BpU/J7Ed6HoN8fPtiiyH7TFEbNAP8PffFV
         MA0+or9kdpNtpYeeXxAVIiEtic91ORX+4c7w+mbx+1YfD33s1UGoYrOY3DJH4bpJk0Ja
         UBUt02ueQWNr0gXzMCLn0Udsr3btiBa3TLMZXrsvikCrAGJatHOv6dqkM9v2dYHlvV8w
         weLNK+yqf9saPJS0RGZ5OLNYCET9/9iahqXomkc8U0c2wzYeNLyxyEHY0nDRZSo3kcR+
         4QUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+AZ2dEdiLllxsoKVeLSPnU1PWmnO2H2Edg7sx1XXfnUn8frymzeUbG2HE69rnF1ZZ+c+6A5vf8Uaqcss=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+8xngW79+/1iGxZq4z0sldgsH9o+3HDH/eRnaBwtsaxI3a7NZ
	UHNgTdr/cXlGIhKdp6e4BFnfi54m/A1jqkBN/YE271Vxp3DpBFAlYqqcxGXJX259pmQ=
X-Gm-Gg: ASbGnctqaf7vGey+pnlcwhYc0DfPebrigySJNAxj+6XbkML8lBkSXINdI7GbV2azWZq
	KdxbNVpzlJtGz8uuj3lZ/aMayf73YAinMIoehwxA5gvSrf7ienpkV+Vwyx9CqNeb12l2DbnddNg
	3gZxicLp8ZRC8g18FeF0y861O3PvmExXamLwlMSlfZydKrRXbIkaM7UoqtzR4a+m6C1YTSEwlhL
	f9eRy9xvBrtyDCE8afxJgGwJacgCYKoDVw7vESi8ulvSROJZBZFJD/TCIglsejLVgzdlFpzKYiu
	fVxqpo1aG80NkwGX5zJ0STrlhCuLxHPOzE4NlsDDsMhkwbJ7WKmdQZI2+veojUGLRfM+ZzxOiX9
	R
X-Google-Smtp-Source: AGHT+IHRbOM7ma3p28dCl6i5/2joUrRoZmrADPn6tljhIXUnu27s94ck2LDSzPrDTEtJSYt8rUqnkg==
X-Received: by 2002:a05:6a20:a115:b0:218:c01:ddce with SMTP id adf61e73a8af0-21fbd5d90aemr223503637.40.1749835090617;
        Fri, 13 Jun 2025 10:18:10 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5219:d969:f11e:ad3c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d29a2sm1915223b3a.175.2025.06.13.10.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 10:18:10 -0700 (PDT)
Date: Fri, 13 Jun 2025 11:18:08 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: xlnx: allow single core use in split mode
Message-ID: <aExdUKf4JYjZt_nf@p14s>
References: <20250610192738.3095247-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610192738.3095247-1-tanmay.shah@amd.com>

Good day,

On Tue, Jun 10, 2025 at 12:27:38PM -0700, Tanmay Shah wrote:
> It's a valid use case to have only one core enabled in cluster in split
> mode. Remove exact core count expecatation from the driver.

I suggest:

"When operating in split mode, it is a valid usecase to have only one core
enabled in the cluster. Remove..."

> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Change in v2:
>   - limit core_count to max 2
> 
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 1af89782e116..a1beaa2acc96 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -1336,12 +1336,9 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
>  	 * and ignore core1 dt node.
>  	 */
>  	core_count = of_get_available_child_count(dev_node);
> -	if (core_count == 0) {
> +	if (core_count == 0 || core_count > 2) {
>  		dev_err(dev, "Invalid number of r5 cores %d", core_count);
>  		return -EINVAL;
> -	} else if (cluster_mode == SPLIT_MODE && core_count != 2) {
> -		dev_err(dev, "Invalid number of r5 cores for split mode\n");
> -		return -EINVAL;
>  	} else if (cluster_mode == LOCKSTEP_MODE && core_count == 2) {
>  		dev_warn(dev, "Only r5 core0 will be used\n");
>  		core_count = 1;

When thinking about the specific usecase where, in split mode, a single core is
enabled - can it be either core0 or core1 or does it have to be core0?

Is the code in the driver ready to handle this configuration?

The inline comments you already have to explain the possible configurations
need to be update to address this new usecase.

Thanks,
Mathieu

> 
> base-commit: dc8417021bcd01914a416bf8bab811a6c5e7d99a
> -- 
> 2.34.1
> 
