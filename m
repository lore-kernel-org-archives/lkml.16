Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726AD25BF19
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750854177; cv=none; b=XpzpbHCPOGoFPAIhd5/kM2ymIgP4R7/zYq3EzlgX+JDQtvQn68yWs4Vk5iKTX73EN/Aa8gBe17ZUN9olFXd4ERiYMPRY15Db3/+z2dTVJfRH/89W/IOWB6o9P4YCNY/taqsdLdTXH1P3hYPfSML47Uet6CfqB/+Gms6OC4KUW0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750854177; c=relaxed/simple;
	bh=PsQfHCEp6q5tQuX0x3zpsjWToWnh6oGziT5EQjTRAgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0ZRBuwl9lnRRCb3W5CptLfwzrbZn/Ymn7Uyu0ZZxFd8z5zaD9XsVIYiqODksZaLu0fOCyaAufCsUQhSe1knLm+xGR4h5LR99qOBPaGWGYuwZvlukrXf1/OPoU/oHyIyXXxmgeu+3MfxsFLdfq3xaYvffNUQnu5BpnTz3t348tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CCkUBFo0; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CCkUBFo0"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60c4521ae2cso1874276a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 05:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750854174; x=1751458974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OiG8sr1KaclHSbf6egC7naRu8LsxzyFDngHY6EqehU8=;
        b=CCkUBFo08RV9mwv/My2zY+JomS+EdxLdXYwQt3AO5S+Mx9uf56OOgAiI3Rf6IwyQcB
         WI5ubRZYNZ5SA0y14frj3SWRacmOfg3HGgEy+KKMn6lOjGiOdkpfICO/nDVSXR5NAiID
         QQl860zh0dezLjQkD+yuQkQsmnY8zN8riyIqepLb8S/liGcTp5qYvcLOB8KvTFodTz0y
         BVR1dxydusZkX8fTWF1ThqQtCt0PqD+ZliEumVkBE9N4auAvyE65wRS5Bcv8CfaaZKiL
         LOL+NWxOl2ybxLtMFnBwbworXLYk7lHKNSrRcqcYGoH+cykazwPvfS7amKXRVcmVWcHh
         Xr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750854174; x=1751458974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiG8sr1KaclHSbf6egC7naRu8LsxzyFDngHY6EqehU8=;
        b=qN0mCmYwMTve1LUH0gr37yXc7Y9Kj012JyFtxE93Wzznq0sk6FbjFGJrku9oN+9sxJ
         jY2tdRK5HJDFVW1QWP4fi6sVn4PbhHKNbzz9GCUF4+ru9Ah06LNitPXR62Yoeri5rhd3
         lFo7gQ383aXyev3WEEutsH1IMwmPJ04EXw1qHOQxpxSW7wuW/hQ/SCUBODWAY96Lt6NW
         A2oZVbuoTdXQBtBnkhbPmw4lDpTSPBc2zkXjIccyF2QYbQV3AVPvtUnw1MVmuBopmRl9
         Lc9rExSCXAnu6HnZcxqa8hntrgnArqtfprJi6cbup9IL78VEjUPBogUor0tIvFZo9gd3
         TWew==
X-Gm-Message-State: AOJu0Yx+nlw2oM09rCbozCwy5WD9qcdbI5iUMWko2m1oCNnFgASpNal5
	fFg3qLb7JjxACcgvIjVGDCBaSkdxZUt1CPcme0grHc5LKAMgmsRJcLUDpKVGLk8+2Q==
X-Gm-Gg: ASbGncsnNPxu2ZHiP6EfNT3tAqvu8IOLafQ62ThwwSJHO+zg9rxv+cVOj3gbU+E189l
	mfOUkkD9qfOLuhOrvK9N2n4H0JgWmnpsTxmwk8gyYVgsSjn0tnHzsMXYU5F6UzY/IdCJjmcv7yr
	bmWz5pqEMrN24mDMjri616FB+RvUpvG0i9hENdJaTGjIXnBMBhDfLtRwngkFIG5o+JT7+yO8Hf9
	R+zUqKtgnW2O9LFRAKsZJ14aEGkrCvYipm6P4C30GfHDPVrkwTs/Dp8UVX7YP+1UdV7HyiLg7ik
	QzljWDO9qHtZfGFFvMoadIUNN7YI5WXkjS1LsLKGqJbFeyYYU/9fBix7mEC/kkihl0Fmx7EpPfW
	S1AyJR0gLdwhWTzyxFtIV
X-Google-Smtp-Source: AGHT+IGcp1aoFc2EzYV/tl3RR8TA0Ug87fzOHVR52rNGNEdbDQoI9r/5HqWjJE0hOyK5C5jflubayA==
X-Received: by 2002:a05:6402:27d2:b0:607:ea0c:65b2 with SMTP id 4fb4d7f45d1cf-60c4de78e8amr1953498a12.31.1750854173425;
        Wed, 25 Jun 2025 05:22:53 -0700 (PDT)
Received: from google.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f4681a8sm2391073a12.38.2025.06.25.05.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 05:22:51 -0700 (PDT)
Date: Wed, 25 Jun 2025 12:22:45 +0000
From: Quentin Perret <qperret@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix error path in init_hyp_mode()
Message-ID: <aFvqFdwNYI0-3zWY@google.com>
References: <20250625113301.580253-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625113301.580253-1-smostafa@google.com>

On Wednesday 25 Jun 2025 at 11:33:01 (+0000), Mostafa Saleh wrote:
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 38a91bb5d4c7..5bb36c3b06b5 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -2344,15 +2344,22 @@ static void __init teardown_hyp_mode(void)
>  	int cpu;
>  
>  	free_hyp_pgds();
> +	/* Order matches the order of initialization init_hyp_mode() */
>  	for_each_possible_cpu(cpu) {
> +		if (!per_cpu(kvm_arm_hyp_stack_base, cpu))
> +			continue;
>  		free_pages(per_cpu(kvm_arm_hyp_stack_base, cpu), NVHE_STACK_SHIFT - PAGE_SHIFT);
> +
> +		if (!kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu])
> +			continue;
>  		free_pages(kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu], nvhe_percpu_order());
>  
>  		if (free_sve) {
>  			struct cpu_sve_state *sve_state;
>  
>  			sve_state = per_cpu_ptr_nvhe_sym(kvm_host_data, cpu)->sve_state;
> -			free_pages((unsigned long) sve_state, pkvm_host_sve_state_order());
> +			if (sve_state)
> +				free_pages((unsigned long) sve_state, pkvm_host_sve_state_order());

I'm a bit confused by these extra checks -- free_pages() should be safe
to call on NULL?

IIUC correctly, the actual issue is that per_cpu_ptr_nvhe_sym() will
dereference the per-cpu pages to find the sve state, which is entirely
bogus if the per-cpu pages have not been allocated. Now, looking at
this, it looks like the bigger problem is that we literally free the
per-cpu pages right before the sve state...

Should we at least change the freeing order here?

Thanks,
Quentin
