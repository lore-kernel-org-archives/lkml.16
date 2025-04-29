Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F742AE96
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 04:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745902106; cv=none; b=eKMUTuYyHSG9g+9bybkSoL9PY3QyEBdypULDpsRzOwqAw44xj/xbZUrv/APxmeKP8dxdYUkrCILP0/d8FCS+Syu4SBDsksu88qoVEMDxKtgGILRmnLr6Zl3+gGh5G6utOhtR5yIrGWf1Nq1KJFY4s0VbhxXUUvpiU4qUC5Ra66k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745902106; c=relaxed/simple;
	bh=VCMJJve88anrsuxyVK+TfXE7cbneFl3RnHO8/EQ2TMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btNi5Y/0AtPTKomsv5oNxDJ4/jujlwzipE0ZV/FgyRKtPXG87STi0y5aYCrPe1rXSacOGoYCgJ80wS/2iRQkBCfhUQXojEuZdn3p1RjiyF2DSu64CbFUr9QpWp1pkoa9zaib4lq+7sUbJLAr9iWaoFeKBVHauvamD5BW6PJGiEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AsA7UZRe; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AsA7UZRe"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so4406036a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745902104; x=1746506904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xtMz8/ccT5uwWHv0d7bgFO8EnSen4dzqNoDx/0ufVro=;
        b=AsA7UZRe/bKvL6j23s81PqHxdN9d2VJq0CcOn0HC6OqPtbqsMoE1pf7amKw99Rkm/I
         oItE07NNUogV4KAMfqfgrjqsDOuGniYeDATflZIqV3AQOUBR/E/k9+eWOk1iZihxOjr7
         3+lqcPZDRz7VMn7NanbuEKo4q6QJ4x2EAkHbpP1laew/cnh4+N+XzyH91pVxB2tMG413
         xxvosxhaLAAys9TOgSFtt2icnwoeHQvcMyT+rY2AVX+mWJ2/ikudSaj1ybZVEcx94AXX
         qEu14NmlR4QjkzcpHYbLflpLhIcyZ1R+k1C2PK8ybX98wuaOxe1LRLCPMpHf26EJuQmg
         8XYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745902104; x=1746506904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtMz8/ccT5uwWHv0d7bgFO8EnSen4dzqNoDx/0ufVro=;
        b=GF0tHYAllSNT3DF8NbP0pI50BPuhcX+TBfUaba4KT5iH2/dbqRKSVvkO/x0ACiG2m9
         dFvhprgh5b3jxLx8+UC6mTKOo7gyuamF4xgUf4M0NLuff1jEFbRWA3NRqSnEGvIE3+rA
         I4K/MLE4ZPVJsol+DQFEBboG6Vw6aD3cfw1e1z9z5gqlD1qNDYLbzPP1mSRZENQqp1zz
         ZhFvsBllf4Umpl9KvkRJ3SBnA+wa/Nh7AbIu56aKUHwRUkeEWO/MXX1wQ7Bp7z1BKGZX
         lLMfKiVsGiYeFIGpN791zeDlWLX35AwBNeofs/ystlZWsRpkZdgB2zryUf5D1BJKCrX1
         CiUA==
X-Gm-Message-State: AOJu0YxoCSTr2M6LqTJcilHL7aU2T5JcvBAc70dH04ELI4wAIS3VRnod
	dD4bJAeVZ1Vl5z+zeO/Mgat89C7BVKoycSv49Vq/VKp3HSkBuBtnv3aaiHh0Ui4=
X-Gm-Gg: ASbGncuiZ2ZHnDYnbaI9DnT8MPnZ5knKfnhiJs/Ay30kxKDqPLlh/Uc7vNBVlDj83Iz
	5O0y+ZVL18z5/oU4E+if8MgJGq0zN6x96HzZNzE6dosKcNtrBOYJhfAHfpk/h/ap4yOirXpKElt
	TL8510PdFILS4+Y7MAROqypWtiD3+t0QB6ulxIuFBK2rPBSfRJLn78w6YxuBGwoqGeXUnXEjMDs
	IBMPE9avKL7QYATBskb1jpBZSXRpb43E+gjw/R2KzBnJLX+NXgNHo/vEilLjB/ZA7Ei/f53am8j
	5QkO+qQC1qtESmjJFHvtw+hITgnikTYcioMWkUyhqg==
X-Google-Smtp-Source: AGHT+IH3WduLwf1iQegeQVT+a+cT23q3eY/eYp9SYidIViTtTzAqj1+j2VCGMd7VupPgujLuG8AGRw==
X-Received: by 2002:a17:903:2309:b0:220:faa2:c917 with SMTP id d9443c01a7336-22de6066b8dmr29539615ad.34.1745902103964;
        Mon, 28 Apr 2025 21:48:23 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76cfasm92771715ad.47.2025.04.28.21.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 21:48:23 -0700 (PDT)
Date: Tue, 29 Apr 2025 10:18:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the cpufreq-arm tree
Message-ID: <20250429044820.2yhrr3xvmy6riwgc@vireshk-i7>
References: <20250428115704.46e31d9c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428115704.46e31d9c@canb.auug.org.au>

On 28-04-25, 11:57, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the cpufreq-arm tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> error[E0308]: mismatched types
>    --> rust/kernel/cpufreq.rs:950:18
>     |
> 950 |             Some(Self::update_limits_callback)
>     |             ---- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected fn pointer, found fn item
>     |             |
>     |             arguments to this enum variant are incorrect
>     |
>     = note: expected fn pointer `unsafe extern "C" fn(*mut bindings::cpufreq_policy)`
>                   found fn item `extern "C" fn(u32) {cpufreq::Registration::<T>::update_limits_callback}`
> help: the type constructed contains `extern "C" fn(u32) {cpufreq::Registration::<T>::update_limits_callback}` due to the type of the argument passed
>    --> rust/kernel/cpufreq.rs:950:13
>     |
> 950 |             Some(Self::update_limits_callback)
>     |             ^^^^^----------------------------^
>     |                  |
>     |                  this argument influences the type of `Some`
> note: tuple variant defined here
>    --> /usr/lib/rustlib/src/rust/library/core/src/option.rs:580:5
>     |
> 580 |     Some(#[stable(feature = "rust1", since = "1.0.0")] T),
>     |     ^^^^
> 
> error: aborting due to 1 previous error
> 
> For more information about this error, try `rustc --explain E0308`.
> 
> Caused by commit
> 
>   c490d1f07bec ("rust: cpufreq: Extend abstractions for driver registration")
> 
> I have used the cpufreq-arm tree from next-20250424 for today.

Fixed and pushed. Thanks. There was a conflict against a recent update
in the PM tree.

-- 
viresh
