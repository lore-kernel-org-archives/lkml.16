Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393C218FC92
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747405094; cv=none; b=E963W4h+QA4BA8NTb//+c6jb0Epn6hEzlmOVgI/N9bTKJ/V2LkEN/G6lqDdwRpBA5tPQWHH1VqcrfXlPrV2hTvq4fe7+HGf52XTkzSi8aKezaF5CY0I8lTVZm6iEn6k7MlVKx3j1w0uMOUunKDj8GmpMRiOMNuTsobIzczF51y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747405094; c=relaxed/simple;
	bh=eMAldY621LGBuYWnS0DttmFZTqueAPJOlZY/rBYz5WY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dNL6GlZkFB3qDMgwNlL0va6qIAv/vF+iDCtV75DykDJpOhqTpjM0Xm0cmtGC84zlUi5sH7Kz5Cmzus+vv5Irs4O+NIaQ69OmljKF/y3UApjYy7GzWEhPTCCtHMqmxGalB2TDu72gxE2kH+LntosvJOH+LwRfHCWklCVV4Uh7G5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maine.edu; spf=pass smtp.mailfrom=maine.edu; dkim=pass (1024-bit key) header.d=maine.edu header.i=@maine.edu header.b=NeZPS+LI; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maine.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maine.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maine.edu header.i=@maine.edu header.b="NeZPS+LI"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c5b2472969so217902185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 07:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maine.edu; s=google; t=1747405089; x=1748009889; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=owY4nRaaHwvI0FEJzLInMFg5XKLo1UFESw5ag0F5X+w=;
        b=NeZPS+LIdYd8rZsx68P/1Fr/6QxTqVyMCcRY5T7d3L4VUWLKuA10Dha32ET9/bYE2V
         JFyM0eG8ApelM+O1795yEvvIjMDLG+pobTO9QU7eZhXvSMB5IfmRs84EhNpmX+XYbYLv
         KoGphNopelw223F5CluNFoAhI3SS6yrKIQaSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747405089; x=1748009889;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=owY4nRaaHwvI0FEJzLInMFg5XKLo1UFESw5ag0F5X+w=;
        b=ocz/Y1/1PE+Icrgh0k3KsW1xnCsDG54iU8hVxa/GltUwd3fYRZNvV5tdUNOmSRBL8r
         b3QDtuK7oEVhAGP8kDnnwxH22u7rARNwdILZL/6MaR/m1ch7YJwZcYS9LGO71aIHEsWs
         pwfS0yEcVeOa2b/RhWUbmREin/+hhxBwBcBsiLmC0AghX2NgpMJaDDP5ecHUZA9J9Jf+
         t2/6mEyeeGLhS/JS5IJwzlhvc5c+gziEDqRrROjFLN58b/8po7wQADA431HDCRiQyoeM
         Cge1VtepqdLKpVWniuCaMmEvJY0scn9k9LMTWwVYikBpN0lz2qN4Qtag8yBHdVWSmLgp
         T2Kg==
X-Gm-Message-State: AOJu0Yx4gMJ5tY5SZuMZlaJL1DGi1bcFdq17vB0J92iMBWzxn+QwxYYU
	03wv+6MbZjAdPahB95zdSdchbDyTlH6lGeNowv0JVKrNlH3yYxFHvxf2frEdycS9sDmdxaWHEm3
	XMhQevA==
X-Gm-Gg: ASbGncuvlfY0nnil8iuAvb9bXn1EHw633sXNzIObhnBb2Rx/v2NfkI6U5HECuW3Y2li
	1Zai+8AyLnF4dyyk48lbduj7OzSernRu+swwLSVHnzFlTn5Z4R7+C6D0+bFZrcvXGID67n+ov0V
	knFqTj3k0yWZvXoJt2cPv1Ahw370F0Evzr5x0osXEs5lgG8gkjBiSEPOW/Nq71uZubABhN/lZIT
	CNv3o14MgoX+uvfQQMOfRHKCFv9Nw2tpN4Ypv4V8GDim6a0rRpp+lKqmT0VvaFLqtbiyqZQzaVz
	WiaCm60WWhsMroFFmT6nhj3sBdPQCv+QwEG320A3jEmRPrVr6MA/NODAHjBr7eC8wrP9fLs=
X-Google-Smtp-Source: AGHT+IHX54JGF3VTnio+m8DU2sCiIbyBg5xhIiMGOX8DYyY/nAQMnnooQoTr9NQ1eTWo+ItnU0AtUg==
X-Received: by 2002:a05:620a:444d:b0:7c5:5f19:c64f with SMTP id af79cd13be357-7cd46708138mr549132785a.4.1747405089444;
        Fri, 16 May 2025 07:18:09 -0700 (PDT)
Received: from [192.168.8.146] (weaver.eece.maine.edu. [130.111.218.23])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467db690sm123338585a.48.2025.05.16.07.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 07:18:08 -0700 (PDT)
From: Vince Weaver <vincent.weaver@maine.edu>
X-Google-Original-From: Vince Weaver <vince@maine.edu>
Date: Fri, 16 May 2025 10:18:07 -0400 (EDT)
To: linux-kernel@vger.kernel.org
cc: linux-tip-commits@vger.kernel.org, Sandipan Das <sandipan.das@amd.com>, 
    Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
    linux-perf-users@vger.kernel.org, x86@kernel.org
Subject: Re: [tip: perf/urgent] perf/x86/amd/core: Fix Family 17h+ instruction
 cache events
In-Reply-To: <174740303900.406.5499797802401271693.tip-bot2@tip-bot2>
Message-ID: <c409c331-da7d-7424-e0db-a4c61ea423ca@maine.edu>
References: =?utf-8?q?=3C2f475a1ba4b240111e69644fc2d5bf93b2e39c99=2E174661?= =?utf-8?q?8724=2Egit=2Esandipan=2Edas=40amd=2Ecom=3E?= <174740303900.406.5499797802401271693.tip-bot2@tip-bot2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 May 2025, tip-bot2 for Sandipan Das wrote:

> The following commit has been merged into the perf/urgent branch of tip:
> 

> perf/x86/amd/core: Fix Family 17h+ instruction cache events
> 
> PMCx080 and PMCx081 report incorrect IC accesses and misses respectively
> for all Family 17h and later processors. PMCx060 unit mask 0x10 replaces
> PMCx081 for counting IC misses but there is no suitable replacement for
> counting IC accesses.

can you link to the errata document that describes this problem as well as 
maybe give a rundown of how and why this breaks?

Vince Weaver
vincent.weaver@maine.edu
