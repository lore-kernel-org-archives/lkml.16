Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D1BC8FE
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 18:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749667979; cv=none; b=KDTg+M1meljzV4NliwVT71DCF2+npVjNTxmB+jtOKiW8PaCvYOlHjbjwEdK+hJ/CIYBsuvX5n1+6OJ+xhPagJ5z/4pJ87npfG5oZAAF03ApEWjIP9zqmcG38HoCF8jbOOas3NB56FYcdpEmdrYOvZhAOgd3HDHUyagTpylmzfBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749667979; c=relaxed/simple;
	bh=25JBJAgIXFS08dNDEiC8zvUMiqMQsQA6DbNmeCGj8r4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UO3Nbmio4mlu82x8KxiIi6Fx9DlQNf6Le3uIffXBje/0UyXTDmf21GWV/GVTmpFCDDwqNmdckpYK/jqqoBbx+3LaV2vvJ5gm6mGKADB6H1G4146IxlQDNacgncPS0D4lEUMG7IEnN8niGeAsAYdkNOOf1fJM0P7ww2chKC0NdXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=kVRmlsVZ; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="kVRmlsVZ"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so1263925e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749667976; x=1750272776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1HvQOSloFUJuOvrTrxYnPItKpyHsMY9uuKArRqxCHV4=;
        b=kVRmlsVZT3Vh5kzPXsgBfY+IfjSIuAh4Sq04GDwBioNqn7Hec4zXWsl1B3uB1+tdxy
         5IQx09kaVVhJNj261dCKcvq77Ae41SkbUkB7n7cGeNETWhunrbCQOTf0SezYlj8qoHIK
         8SFxSEkKiH4omrGezR9MxbtsyCTB2NTTAoEpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749667976; x=1750272776;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HvQOSloFUJuOvrTrxYnPItKpyHsMY9uuKArRqxCHV4=;
        b=tMjMZF5vsibXc/oBqnAOLZT0qDZTLlDSaqDO1DmskfqhnhjGgoPDRpeBRgEkKDO6ib
         f9AUPK8OK46b6Q8+6B3kYzmc94D53JSZZDcyag+hto+rbFn1QYs81rzqtqqHfKJaMaFm
         stJeECRa4cQNSzNXiTNcoiK2GTeJxavE6JL29REZf0rGxZp2thLQ+MoTGVRdfj4RtiiC
         /bJHoy7Tx+/xhmUun/DhEeVnO4PJjJWCSlddrT8ixEpjV4oQqraMtKX2Cw4aWYFJ34Dw
         r7t78W1fYH+oc+3ArkExX9MqEn2Nje+NPy87R+bJ6MfnAB2x/twEWxZkjyLz7Gd6nCS/
         8GwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP3XxLeaN8/9yuiquVlzlQS5DN1UuWEVBtsL+9VEAAkDsDZjDCCnnp2wnFW2lxTpAPvPtgHelwrIDLvPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCcUurea15I3KSQya5MnMdXlPfJmc1xYfUw1HjIlLXcsD8MWc4
	P6Z04vwGY/RCBN35N7AKgwhH0iWXQTzl2xfD+1tdWsOEQOMo1imj40XNrXvzSQDKql0=
X-Gm-Gg: ASbGncvUt4cM7oolScBVeKb6sJJq7Knp0c/YULRuq60hbf2OeTLYM17+rq8T7VhQFtY
	BPH7a9vCFdsiS5BYHF4cn6fh6JULEly3ZlVjfQdFUUAZuodQ4tKecK1Slv9HPLUYVOrXN3olpOs
	Z5Re0/BN5OPngsY1tgfqETiHM+mGheijahnFjbWgkg4Fml+S1cY5hQ3N9Y6LrvP4CdVec7RFr2c
	7VUyqeW7czzzPOGf9SPfIuzHcM4XCjtq4ZlZ0dQYH8WABGMhwZtk0lRGGsPgxCv0XJKDYCgsjvJ
	TlC2eWjIi41Iswv4RPragY5urTT/pn8hb7MM5VEuCPHlBOgMqJ0o3/itNUSMTAzg5OPab8Sh1w8
	=
X-Google-Smtp-Source: AGHT+IECkRlImHY4D8j9QVPAtH3CecusVeqTNVtqoND4Ebv/U5Jwpb3yWzuYMtckSVBGNvir12TCuw==
X-Received: by 2002:a05:600c:5303:b0:442:f904:1305 with SMTP id 5b1f17b1804b1-4532c27bc4cmr5264645e9.6.1749667975579;
        Wed, 11 Jun 2025 11:52:55 -0700 (PDT)
Received: from [192.168.86.29] ([90.250.112.104])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532522669bsm28877195e9.35.2025.06.11.11.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 11:52:55 -0700 (PDT)
Message-ID: <df2d4900-b543-47c4-977e-8604d2482744@citrix.com>
Date: Wed, 11 Jun 2025 19:52:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/cpu: Mark Ice Lake model 7D and 9D as unreleased
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, x86@kernel.org
Cc: tony.luck@intel.com, "H. Peter Anvin" <hpa@zytor.com>,
 linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>
References: <20250611-icelake-cleanup-v1-1-0f82472dbc8f@linux.intel.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250611-icelake-cleanup-v1-1-0f82472dbc8f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/06/2025 7:00 pm, Pawan Gupta wrote:
> These models were never officially released, but they made it into
> intel-family.h. There is no evidence that these models are being used in
> production. As a matter of fact, Intel's affected CPU list[1] does not
> contain these models.
>
> During CPU mitigations it gets confusing whether to include these models
> with other Ice Lake models or not. Add the comment in the intel-family.h to
> indicate that these models were never released. Also taint and warn about
> these unreleased models, except when running as a guest.
>
> [1] https://www.intel.com/content/www/us/en/developer/topic-technology/software-security-guidance/processors-affected-consolidated-product-cpu-model.html
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Suggested-by: Dave Hansen <dave.hansen@linux.intel.com>
> Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> ---
> Please scream if you believe that the assumptions made in this patch are
> incorrect.
> ---
>  arch/x86/include/asm/intel-family.h |  4 ++--
>  arch/x86/kernel/cpu/intel.c         | 12 ++++++++++++
>  2 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/include/asm/intel-family.h b/arch/x86/include/asm/intel-family.h
> index be10c188614fe24ad41e2e1912b8d5640c6ea171..948e0a057a9629dc57671e4c666b5f62e762d4bb 100644
> --- a/arch/x86/include/asm/intel-family.h
> +++ b/arch/x86/include/asm/intel-family.h
> @@ -110,9 +110,9 @@
>  
>  #define INTEL_ICELAKE_X			IFM(6, 0x6A) /* Sunny Cove */
>  #define INTEL_ICELAKE_D			IFM(6, 0x6C) /* Sunny Cove */
> -#define INTEL_ICELAKE			IFM(6, 0x7D) /* Sunny Cove */
> +#define INTEL_ICELAKE			IFM(6, 0x7D) /* Sunny Cove, never released */
>  #define INTEL_ICELAKE_L			IFM(6, 0x7E) /* Sunny Cove */
> -#define INTEL_ICELAKE_NNPI		IFM(6, 0x9D) /* Sunny Cove */
> +#define INTEL_ICELAKE_NNPI		IFM(6, 0x9D) /* Sunny Cove, never released */

These comments are fine, although I'd suggest ", not released in the end".

>  
>  #define INTEL_ROCKETLAKE		IFM(6, 0xA7) /* Cypress Cove */
>  
> diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
> index 076eaa41b8c81b2dd9be129d14dc7c8041eb2e79..b7eb8d5ee4351bf4a31e6a2792d24f7dbc0773ed 100644
> --- a/arch/x86/kernel/cpu/intel.c
> +++ b/arch/x86/kernel/cpu/intel.c
> @@ -337,9 +337,21 @@ static void early_init_intel(struct cpuinfo_x86 *c)
>  		detect_tme_early(c);
>  }
>  
> +static const struct x86_cpu_id unreleased_cpus[] = {
> +	X86_MATCH_VFM(INTEL_ICELAKE,		0),
> +	X86_MATCH_VFM(INTEL_ICELAKE_NNPI,	0),
> +	{},
> +};
> +
>  static void bsp_init_intel(struct cpuinfo_x86 *c)
>  {
>  	resctrl_cpu_detect(c);
> +
> +	if (x86_match_cpu(unreleased_cpus) && !cpu_has(c, X86_FEATURE_HYPERVISOR)) {
> +		add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_STILL_OK);
> +		WARN_ONCE(1, "WARNING: CPU family=0x%x, model=0x%x is unreleased, tainting\n",
> +			  c->x86, c->x86_model);
> +	}

I don't think this is a useful change.

What if Intel suddenly find there's a >50% gross market opportunity
selling ICX-NNPI and release this model after all?  (Ok fine, unlikely,
but the point stands).

What about unallocated model numbers?  What about A0 stepping of
released models?  What about Cannon Lake which did technically ship to
customers, but for most intents and purposes doesn't exist.

Calling these two out in isolation isn't helpful.

~Andrew
