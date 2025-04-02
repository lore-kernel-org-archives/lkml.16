Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2284C92;
	Wed,  2 Apr 2025 14:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743605812; cv=none; b=G63SIuLzZ6Kcp5NbKiIXy4ynJPCynuQj1NJ6Din4fnzWQEVT+dBQOqmgiPRwVscEos7uVAGssVUhtepwM9gzTZAyz9+GnYi56+/HLhIPPnKfKpR2R29bYYk2Wge7guMer8Nx7J7iaEaucYRXGK9NyxLM06jQA4MtYXoDgVtKMhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743605812; c=relaxed/simple;
	bh=V6ioaO6Ok6DhHKm9EayEdBmnLjX85dgQp0ysosv2gsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p71gqrJPAwQVUK9tAZl0S5J7jC3o7js0mK9I74iIIjZnfwXTy9mQvgZxa1BdjbEoEY5OpGO5j1DRByLTUjdJ6W15uVtD9ajOGP3fksQOfGnB/xfhy6P7rKfHb0y3lmE5dO25H+EDkrLXlrIdmMNndHGdNX4L/ckyDcHDOj9mXp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sq6/5L2R; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sq6/5L2R"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-227b650504fso132993095ad.0;
        Wed, 02 Apr 2025 07:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743605811; x=1744210611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FDiQ32w9pWp2q5FcK81kTMl3a2d7xFZZF0v39lx+vZ0=;
        b=Sq6/5L2RmWwdGhruJgvLhdiLVQflzmmoDPkHW7/Kwu0Vneobbs3NgSWPL35sS4ACvV
         1QT36I2koccy+4U38ZJHMwzlJbkaWxGW94K91hFOwz3QaHcCM+98HpZJi9cG8JCS6MHH
         fpSADk4viCooEPdLA15uust1tTSVNtn6HDyEnYMkK0mjN+arWmrJcJCCY8qvNgFql0so
         wWpaVfiZj1aLc5sWuPS8ilLept5ZUP6DAzg6F6unPfABPza69rYxkZklwNPnTMIceUsr
         uzMybA1VbjykSSzV+e9TYtFZdsvWovG7/rhcrstWDRiOiSQAxrGxe49OxzYb474ZCU0S
         /Lfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743605811; x=1744210611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDiQ32w9pWp2q5FcK81kTMl3a2d7xFZZF0v39lx+vZ0=;
        b=RwYXli3hMrSb9a1fpzJynLuEnUlZ+dGJgY9Qt2CiZnS3QcpivCTfFfPwYTiS49IujZ
         bVOL/rzxI6GjZsjP9TGqfY4RZ/bIhMGF3Ar2NeUvUJo1ed1KOzs53XfxelburUrCIUZS
         8ly9IeDv+JxitBajA44VfXsrad2+397B1+RiRmLtPyoMhsWvIQUdZFkW2gvrrf0tJkG9
         NOIc5E/rJHhsCSt0wEtc9vBYXXxv7cLN7Jq3MrsOyWiBst5GZXPKQgm0BpwmG+VJ1VQP
         wov1487fVudVPfc+uE33ZVhcjl6gjBKyvLHO/7NmvWwzutDP71Sm5IgQg16tbdOGUipU
         ldeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfnxXdV71t5O0nBW9WLNaq4FCO+fW7Lt1Ydcc+1kn/ysFj87Dlc05fzW+z3XiUIRBL/TGRS+8Um2VR/I8=@vger.kernel.org, AJvYcCXsxodUM7GF4Z4cl5s7kp+UH3Qz+FADUpXdfEbrscpeogrJKBWY0sk/zO01HB75J9BLQp3B/lpGUN+aS0hSwbk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGJbg3s3VVU1ApvQoLv5nMw0jBZOx6mMTSeDKnh26GKVC77UgQ
	O8SOPp5xfsd9Fn4RJkZ2Aa159gXy5+R5YeyH+w4v+5SCWZPzEzj/
X-Gm-Gg: ASbGncsmLimTn6ZRr1u5wfAneCPrQpCqZQEce82rF1UPevZTKJ4/vLQQbOgYjLoaLzI
	wJVl3kmQUDcwpis7vyCWXa1M59EBCJhmYOWa4fo0Y+uCn9WT3aYkSaBz42WzyD/3c3snlFSHxTr
	7P3Q9Y6QUVWFhhla5YHEF1rdtakaK7R8ecJeQak92LYfORtkfUlwJ/xrBISUworUaCycnxDwxsj
	V52DCdqtsYsU4CcUGtVOIt0oQay2pk/uumdWSL0JF74XOFOTQ0YyvUlCOzH5c50kldoP85jA9yg
	WDgmy1S/D5/7M48sSMIySrIABB1z/rP6IUfRBBs4cdnh
X-Google-Smtp-Source: AGHT+IEfJmSCeu0BOM5I8HN8mMd4fGWVi5cH1A6Gzg/MEEgVabUWHEFyX6dkNJpIPOnljGOJbeLwmA==
X-Received: by 2002:a17:903:98f:b0:224:6ee:ad with SMTP id d9443c01a7336-2292f9eb6f2mr306001095ad.44.1743605810574;
        Wed, 02 Apr 2025 07:56:50 -0700 (PDT)
Received: from localhost ([216.228.125.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1f560fsm108719085ad.248.2025.04.02.07.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 07:56:49 -0700 (PDT)
Date: Wed, 2 Apr 2025 10:56:47 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>,
	rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Burak Emir <bqe@google.com>
Subject: Re: [PATCH V4 2/2] MAINTAINERS: Add entry for Rust bitmap API
Message-ID: <Z-1QL3XOCRdMX01z@thinkpad>
References: <cover.1743572195.git.viresh.kumar@linaro.org>
 <bf2d798034e5f2c6fd5fbc561a8bd19431e6a9cb.1743572195.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf2d798034e5f2c6fd5fbc561a8bd19431e6a9cb.1743572195.git.viresh.kumar@linaro.org>

On Wed, Apr 02, 2025 at 11:08:43AM +0530, Viresh Kumar wrote:
> Update the MAINTAINERS file to include the Rust abstractions for bitmap
> API.

cpumask API you mean?

> 
> Yury has indicated that he does not wish to maintain the Rust code but
> would like to be listed as a reviewer.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Yury Norov <yury.norov@gmail.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 315cff76df29..f67060f1b3e9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6113,6 +6113,12 @@ L:	linux-riscv@lists.infradead.org
>  S:	Maintained
>  F:	drivers/cpuidle/cpuidle-riscv-sbi.c
>  
> +CPUMASK API [RUST]
> +M:	Viresh Kumar <viresh.kumar@linaro.org>
> +R:	Yury Norov <yury.norov@gmail.com>
> +S:	Maintained
> +F:	rust/kernel/cpumask.rs
> +
>  CRAMFS FILESYSTEM
>  M:	Nicolas Pitre <nico@fluxnic.net>
>  S:	Maintained
> -- 
> 2.31.1.272.g89b43f80a514
