Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2788E2609D3
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 23:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746143355; cv=none; b=iNcY7JAC6/shg1eSHkJ77Or8TQAksmPFsySMe+DqyT9/rc+fuW8K5qTszobgJAQ3SDk3W8byQzD6ShW/HBVfHhIHbc2wkZmauGJX+bgWfxvZG1cltsHYJQ53kwWD8RPoQVuAx8aIZKx4LlEuKSMaHFrd+ZVCu1aXzXGrvlZpPNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746143355; c=relaxed/simple;
	bh=/1Fw8fdC6D275HXaKMAr3s4APSaQDNS5F3C9KwJey+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WtgY+JGkLZuyydEwg0ATlyZ7eC3eQmYfkCVIKVqyeyFGPIq3gYCkZRSJ4MZXreypkDdz9hhuNKy4TzT38s7qcewPYBr3gLZkyGo0cJWjdxKZx6yrV7PJzoBOTywAQ70/4F+vsUFb+aJ+bnVLiIeUJlEsK59PQcqBaTYaK+IIlOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d17q2GWg; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d17q2GWg"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22401f4d35aso17847825ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 16:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746143353; x=1746748153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fpAIzRfEeZEVGfn6ebiTrTsfh9UyLOEfos/wb/ewUbs=;
        b=d17q2GWgOu7PqOy7vpCs3QpgrY9TyO4mIeh6TY2KFUdzKHfiKaRIjrV5X5r/9w42LE
         KAZfh+HjTBRsaIUUK6GkmMFUKvrR5MgZUhp1qwiWHyeFIXWRiRGF3+2IjCk+I2sFu4Cg
         sMmym0k8RqPZ+71tcASWHyRvrFw8sq4qAeeiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746143353; x=1746748153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fpAIzRfEeZEVGfn6ebiTrTsfh9UyLOEfos/wb/ewUbs=;
        b=ENOpdP4iDcxjln3vQ7YnS4SUTly5+Uy9HbbmDGT4xvHI21wxvgOIZDmejTi518jTas
         dOybcW8chIeq22dQiP/tBrU3kbDVu8mcudOhpwzNESxmcbqLycl7FMJv3wTJEDyXoT9+
         BgEqyfUyKFD1JyPz5vCLMvFMC6qyBiESN+zBSxqhuNDmnB2qvWopnhqrD9FhapJrrdW0
         eKqeEKvg3lKbkFdYM20oeNCFGJTcQ0McJO4Aljqszy4Yliq6MSZCBfbNAi8KwXsjLXpF
         urgq3y81J7thmaSBxJLoOGpvRIsOj4W7gaXfZnqQIoI0Su+Ixz6Wbp7vJZpOOBBuNwYf
         FPFw==
X-Forwarded-Encrypted: i=1; AJvYcCXtBdLFZl2YgwjRYmO2UsaLdGO0NYOnQ5wvAWIfJjTbefMjF+mXU5nWfPCSBmUESKJxMjmZnMiyOEFRJDI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh5EtotgeF4DOo3nolJ4hDJ9Ye2OXqmdBz4sU3g2eTgriSghaq
	ogEdtJmQf24fLWoFlCmeOHABpKRQ1Q55nQN6Wl3n29yjchLgxeFlPu3XK1KJvg==
X-Gm-Gg: ASbGncusNX9pqFscWdkGPtxzfJNC3dB/c8G3GVKrolYmajREwdWWcfYJAA+pF/tQoAc
	RijfGCzGnmkN/yf7xmAIJL/ioJKIbrWlpSxZPq6cuwRt48ocg70IkIXZYOKDSMTJDRbcjmBSU0q
	3BtNnWJd3XsRRnvZTVwEcMfNGfTdionL0YCmKOD2fY489Ycpn11xYkpEBj8f16N4FkRi9GtIcJT
	DlLsNAHH7eOCjDTWimoShnHMZkzAE7B754PVpqKTgiwrpq7bfHp6mIWunMtc4AckQK60EiTQNtc
	5URpEP6ZqE4SM1w91gngyioe1of3KlSfr6sb3RmdVoZA
X-Google-Smtp-Source: AGHT+IHx5M56icWIbybEAyPSBfgLbmHwfrlIQNcxFmbiHbnKmmGAE/jGMqMcB7/2IW+lwBydqbftmQ==
X-Received: by 2002:a17:903:22c2:b0:223:5e76:637a with SMTP id d9443c01a7336-22e102e4e6bmr14338205ad.23.1746143353411;
        Thu, 01 May 2025 16:49:13 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:7255:67a0:34ee:5b40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e108fb862sm2079025ad.134.2025.05.01.16.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 16:49:12 -0700 (PDT)
Date: Fri, 2 May 2025 08:49:08 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: Yosry Ahmed <yosry.ahmed@linux.dev>, linux-mm@kvack.org, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Igor Belousov <igor.b@beldev.am>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v4] mm: add zblock allocator
Message-ID: <gullx3kk2dogzyxopmvtrhuv5ymfsjbn5mvtwskqkjjfjinqij@s6mmdq2mfwzs>
References: <20250412154207.2152667-1-vitaly.wool@konsulko.se>
 <aAdzjdv674Jn6G63@Asmaa.>
 <e764d05a-6a83-4563-9f28-3f1a3e28727b@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e764d05a-6a83-4563-9f28-3f1a3e28727b@konsulko.se>

On (25/04/23 21:53), Vitaly Wool wrote:
[..]
> * zsmalloc/zstd/make -j32 bzImage
> 	real	8m0.594s
> 	user	39m37.783s
> 	sys	8m24.262s
> 	Zswap:            200600 kB <-- after build completion
> 	Zswapped:         854072 kB <-- after build completion
> 	zswpin 309774
> 	zswpout 1538332
> 
> * zblock/zstd/make -j32 bzImage
> 	real	7m35.546s
> 	user	38m03.475s
> 	sys	7m47.407s
> 	Zswap:            250940 kB <-- after build completion
> 	Zswapped:         870660 kB <-- after build completion
> 	zswpin 248606
> 	zswpout 1277319

I'm sorry but what does this test test?  That under memory pressure the
kernel swaps out different pages with different compression characteristics?
