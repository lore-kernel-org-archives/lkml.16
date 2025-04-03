Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9B81993B1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 16:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743698866; cv=none; b=DS8C4l+Fw7str/4F1MnLlNnPf24a00SbrUCSkFZs40uVlNoFtPd1Q4tf39p4zXyCCIfHBZxcGUoVi6WMREjNFLhZ4Ygz8Vwy2I1bEzgjspQvwR1kvzK14wekel/vGNa6tyyHhl7e5Ctw1cL+jO+WOQWY+NArkzBzTUHO7lSuJT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743698866; c=relaxed/simple;
	bh=hDTReC1/mrfRfARGTXPr2AFJZNz3CIDF1/HOyaOPQg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYSfh6VFjr7U/Ru4VB2hPCvItCbUvDTMEuFiHHkLFo9rAZz45EHAu74QAFR3BE9icEC41SyxTwlvNQdlqpuCJWDhjk6zQXD1BfLtEfINjm+YjB7FnKviiqA2Z6CcHIMEXJRN14qF21pWZaTWw21XUrlNuH7+GTUx5ic9hIQyIF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=fiUhHyuY; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="fiUhHyuY"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e41e17645dso12533946d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 09:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1743698863; x=1744303663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Nud2fc5RcW4evh9vy/G4Ts8NFlLn8W5YgcQMx1TJsk=;
        b=fiUhHyuY6IFVq3Avo+eX/Zt1DvpKrJWqObukeHkd9jBWHgZcebFF9zaSulluvFQ8K+
         /p2qIb6TrP7cu3ZaZV9zYjzlIZ06e64htc2D+ENki+EdMmTvVR++gsOz05VYVREJXZ78
         uHUM1gjJmDvXgoY4Vhrjuj8AZPdRCjAusY8mn3l3xZSPC+G1YwV8SzOFnZ5iqaQ0ATiP
         irEh0HDvEODv+AfYQ/7JrlItFJndjVHDRchLlFJOSWtUmoKXwUmOVjjtxTMGeeIH9lAh
         AOZcuc3tfGxAJGr7HaTTBUcvhyM14IQiPu7JJZ4yqYVQYsMrS9vkL1Q7cmQVP3rE0z7q
         FQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743698863; x=1744303663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Nud2fc5RcW4evh9vy/G4Ts8NFlLn8W5YgcQMx1TJsk=;
        b=h+rk5//Y3gaiPcPIF9fdb73k72PMacAIuIsoe6Ob1bBCYIoDpb64qiKpYg6sba5j9v
         as5XqYECCYQTNbi6bvJr/N8o/5Ty6nZ/B1q0IzeukJ7jEgL+o5wDn54y7mlhQ0mrvOFa
         4B1lh9e9TO6Xr5zfEX6QuuUjtB3YTHVN3o2QdOhoILNdMYtav7jjRMV8/337hNaMJuLK
         ppHKnV7q+GtdCIvSQimemjFCghUoGHIakM7/ckHzgE7YRZs+2HQ9Cxv1UxmXaC4rJ/dD
         SXcvLTZX0xFNnEmrO0KgOPT4OlG6Jz3/4pZh5uUkpeuaz8MviOAs1WkBqBF74FfpyaUs
         fG4A==
X-Forwarded-Encrypted: i=1; AJvYcCXet+KDfdjlJysGCQmtcHvVldgnG3V/dNBYm1ZCuo0lpW7jStNvNuaczUeNmgzK/zQhXoykuu2E5GU1MkU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXbAY4Rkqn/JYt+kPskO8w4bNEbhdzi98OJ8UIvgJxtFGyij2U
	36RSqXhnY9Bhjbmi4e14qbgnQp+fGY1a7ugwYdn8SJZV+zGwdTFw1zDIjCRHwWc=
X-Gm-Gg: ASbGncsHIdSpOqmwyqGKubShJcPR7s/xOzEmQDQoZC8t31qvMy8yyeUl11d2Hax/ulx
	cNt6nT4QrBEaLr/cd0VQ4SExpq9aQYzzllj77ORwTsTHu5AG9iS1x7YE2hms/YSRZtrqWSDkmX1
	BBNDNzWyIe7UbOT+4SLRS3+f7U/7XOZfhinZR3BcssglJei6rMqHep5RSQSlQjYVS1XAGtioRcA
	57ibt0SEuE98MImQ8SUsDzfLPLWBnrZpbYsuHZn0AQRjXxi9+g0qI0yPMQ45xbcMy9VQYIHy+ve
	ig2hAkry9OAYOyHKonqNLYylTGV054VvsO648jPYiPgwRzOv3OF1pg==
X-Google-Smtp-Source: AGHT+IGn0LSk8HdIMSVIgWA75foWE+TwNl3UlrFotjqft5M0lp3yVrvEm+t6kj+IPVcJKWN1kUU2DA==
X-Received: by 2002:a05:6214:2241:b0:6e8:fb7e:d33b with SMTP id 6a1803df08f44-6eed629b6bamr345313326d6.33.1743698862969;
        Thu, 03 Apr 2025 09:47:42 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c76ea59e42sm97209685a.77.2025.04.03.09.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:47:42 -0700 (PDT)
Date: Thu, 3 Apr 2025 12:47:41 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	Meta kernel team <kernel-team@meta.com>
Subject: Re: [PATCH] memcg: vmalloc: simplify MEMCG_VMALLOC updates
Message-ID: <20250403164741.GB368504@cmpxchg.org>
References: <20250403053326.26860-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403053326.26860-1-shakeel.butt@linux.dev>

On Wed, Apr 02, 2025 at 10:33:26PM -0700, Shakeel Butt wrote:
> The vmalloc region can either be charged to a single memcg or none. At
> the moment kernel traverses all the pages backing the vmalloc region to
> update the MEMCG_VMALLOC stat. However there is no need to look at all
> the pages as all those pages will be charged to a single memcg or none.
> Simplify the MEMCG_VMALLOC update by just looking at the first page of
> the vmalloc region.
> 
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>

It's definitely pointless to handle each page with the stat being
per-cgroup only. But I do wonder why it's not a regular vmstat item.

There is no real reason it *should* be a private memcg stat, is there?
