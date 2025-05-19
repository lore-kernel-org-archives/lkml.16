Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057DC27CCEB
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747664544; cv=none; b=ULt3tUdNMeJbiilZR3JP+BQga9NzfJ473AKyiR9qREMSMBTctDVlGhLqjHzRrCa0meOgF6wlYnd/mTguwEM9se4ZtFGWE+Ba3kryiI+vL35eLHAjYQjwDxEmerJwnU5/WFVq3lYZaV6I5JFYJ16UHXEwG6w3h2RO0l74+sRl98o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747664544; c=relaxed/simple;
	bh=xbm6RIGH0CJZMP9dG3aiux1usLbAUaOL5mgEvxLAyA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sOY010XXFPE6wteFRAxpZMRcAQ70zlss9bCCzniBC0FkKovazoixysRTjOQYpipjlXFbJ3uJEZMZ38kfSL/y638Frakt5GY3FbD9a9CvaJuk2RsjoKPoPv7m+3J+GZUU9BoJ4KKr+ckyAPly19JiM+AbfEnUkvqUjHlgIgp68sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qjw3JMqi; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qjw3JMqi"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6000f2f217dso3448194a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747664541; x=1748269341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kQSuEqcHJXFQ1exNbmtWM5VfdOVLBSlLfO7byhWtGpI=;
        b=Qjw3JMqinxRCVofC27KXSdMdsVzicOkPcDpUzDmfC3on/t3enLfAbDemvL/Q9V27nS
         hvApcnibZxIs6PI61xJwPuVSwqhFX7UuicZ+YiJ/7yKo0TWS0vElW4XBRiuqJa5hOXcr
         bbnX/4rS7BUTKi+sgdEMG6fXoimEG6p6B3BH0uWzrFcNBOFYHyjZfKhiALwuHCqntmBC
         1YSRalkTtMjvve5qDMh74AALivvm3VzLVM90+7tLo5iVAgkLwzxEb9bF8GxUxGzz5yc3
         5u4JJPl50eoVscAorjv5Fq8e2hJlKEMpst5LPlZDBu9RDpZs0aTmhxmbvdRKPjVfB0RT
         4W8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747664541; x=1748269341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQSuEqcHJXFQ1exNbmtWM5VfdOVLBSlLfO7byhWtGpI=;
        b=OoNXrjGnntS0rrWTSO95bABqJ/0GGmoJcAThAopKjdrTOiOsWtqhK3P4sLXajCQnRg
         mwiGPzuo2adjFmZ5haMfQLVv9wU0/hQjnkBiXLwcp4Hh8ozlrlCGOeQJcRCjcg2Vlpnd
         OQxCBM5rmyOcGA2v0QZiNdU5Hp3CW1W830wmHmJ/b6m7sZ5Q14APE4ar8GWvRLNzNG+i
         hMS6tEXFHLPQV1N8T0LqJ1RC+/XVXAKT4IVyVkalN+eoh0+S6oz5XqzA5wvd+Sc8uCs7
         vW8jxvGXhoBTTD609iCwwf+R3ghzutRl51Z/gVuqFJSPZWxycqvCNdDYf2X5w+blMU+t
         p/FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC/qhGIqgzFhhoBfVCBc2nSltNiy/QHvk2Qljh10ZreqYrq26ezKPTP/uiVuTlyY75jeMKRJavs0gaa10=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVMb4AzqhLwNeiMTbAwKKezB4lcRtxt0RAO/WYB6fgFpOLshyl
	N3XLoVtmsqtli3fTtwvMlkll4Vhgj5/wizpGTHUDE0dmT9RUxSZMOTKurgyTv+MbuKQLOy7ra8g
	MdJo42A==
X-Gm-Gg: ASbGncsV5RgQzUHMhdziB47dP67+r33zASnipme/0HT78wvguOCyeIzl3qBzH1gVsul
	Yz5nXpAAOB4myigZwfdx3kGTc1wQS7vcZqzoQtvwY5jiyCusUmOnLnRh0VYt7rpzSRtJjUdcIKX
	i5Kb/8CM93XAWntHsCyCY0KQttpl2wDZ5rYG4IL5PLtFyK30uACNjS7v8Cos1TgNxtFMdjeRCXM
	ZsRiCNi74tHWN3Zqtc1fSkHmVqmwSWRn/Gnk3Q+9u+ir82OFBsPNXH2dDDrMbBiZJ6opJjnnr/r
	xnTnOcVlEwtGI1VSIuHCMTSQesvThfw55XwyrTxiErhn4YLYlPztGbJXhAmqsoBasTo3hIZnVSj
	YE/6vdfl3eUhFaMmrpXm/
X-Google-Smtp-Source: AGHT+IFH5dLBwEyWAFcQq1e+DL6BqjO9tw6VuHfBFByUGGuIQ9a/huk1aiNUfDOMwmKFocYhB49/Cg==
X-Received: by 2002:a17:907:9412:b0:ad5:69e7:181e with SMTP id a640c23a62f3a-ad569e71f30mr348649466b.61.1747664530363;
        Mon, 19 May 2025 07:22:10 -0700 (PDT)
Received: from google.com (68.57.204.35.bc.googleusercontent.com. [35.204.57.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d498747sm595489966b.137.2025.05.19.07.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 07:22:09 -0700 (PDT)
Date: Mon, 19 May 2025 14:22:05 +0000
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v4 07/10] KVM: arm64: Convert pkvm_mappings to interval
 tree
Message-ID: <aCs-jYUrEraCnLaX@google.com>
References: <20250509131706.2336138-1-vdonnefort@google.com>
 <20250509131706.2336138-8-vdonnefort@google.com>
 <867c2gg0hq.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <867c2gg0hq.wl-maz@kernel.org>

On Friday 16 May 2025 at 14:15:45 (+0100), Marc Zyngier wrote:
> > -/*
> > - * __tmp is updated to rb_next(__tmp) *before* entering the body of the loop to allow freeing
> > - * of __map inline.
> > - */
> > +INTERVAL_TREE_DEFINE(struct pkvm_mapping, node, u64, __subtree_last,
> > +		     __pkvm_mapping_start, __pkvm_mapping_end, static,
> > +		     pkvm_mapping);
> > +
> >  #define for_each_mapping_in_range_safe(__pgt, __start, __end, __map)				\
> > -	for (struct rb_node *__tmp = find_first_mapping_node(&(__pgt)->pkvm_mappings,		\
> > -							     ((__start) >> PAGE_SHIFT));	\
> > +	for (struct pkvm_mapping *__tmp = pkvm_mapping_iter_first(&(__pgt)->pkvm_mappings,	\
> > +								  __start, __end - 1);		\
> >  	     __tmp && ({									\
> > -				__map = rb_entry(__tmp, struct pkvm_mapping, node);		\
> > -				__tmp = rb_next(__tmp);						\
> > +				__map = __tmp;							\
> > +				__tmp = pkvm_mapping_iter_next(__map, __start, __end - 1);	\
> >  				true;								\
> >  		       });									\
> > -	    )											\
> > -		if (__map->gfn < ((__start) >> PAGE_SHIFT))					\
> > -			continue;								\
> > -		else if (__map->gfn >= ((__end) >> PAGE_SHIFT))					\
> > -			break;									\
> > -		else
> > +	    )
> 
> The removal of the comment worries me a bit. Is this iterator still
> safe wrt freeing of the iterator in the loop?

Yep it is still safe (we're still caching the next value in __tmp before
entering the body of the loop). But we shouldn't remove the comment
altogether, it just needs an update.

Cheers,
Quentin
