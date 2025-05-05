Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB277264A89
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 17:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746464869; cv=none; b=uBSR0bLbaR1e4Vk2SELJszWgV/aDgT/2KG/2daqeCPOAADb+6ytn+RxJfsVOhQFnjPtTLItO0kFC2kEXbc6Jx+v2De4i1ZT4LyPmz+eEAhDch419cM1UiER8ArpFC6xcAc6P/iaTF7NWI8Idzi1rNQ8yv6JSK7ekZSJ/lAL3PPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746464869; c=relaxed/simple;
	bh=ZAD4wjkWHarrWkQ/02TDy4irpihpBu/kp/+Zh5KWEJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7HVOPsktJXvmC5J8OwIUS4xgK7nyR+qSE8O6+Nn/bTi/qM//jFDmmbp5//tjmU+KVJzQBhtB93vUc81Z67KxPAMHsxJbYVuAnPLIGjtN+Rtr4tAuueVpi7XCa5LsOUQginMoXxbalWSIdgt8tBEEN+PiQDr8POhXw/1uzuuX3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=JCp9emCL; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="JCp9emCL"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4772f48f516so64318641cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 10:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1746464865; x=1747069665; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O9SZ6hDle3mFYLwdSqev9ZHk8hZbU5Mq9wO4mHZ7LZg=;
        b=JCp9emCL16tLnB5asG4eacVI+u2G4YXpraPVXG9F0/8mSP7x6kWDAAzvuCraK4vdKo
         UZBHEqe2aP3ZQw9Q26hQTYKlwplz13DTU+K7Nh+FpNrSRbpAIYMqofCYTnUw6X+bSWIs
         3vFoC0AEtwhaDAHtRiXEa9m1epbbiPkjx7yVmK0pIEsbwc3EXZbkmoFBbj8eZePehHRx
         9eoKy4ZymMY/R9LuH7Nk3u3KE9atZ0yw4Q3Q+Nv+/fX+yedWhZqp43zRfCwny6kmoPKb
         AW7y/SiWnVYLi98pvtY+5tQ1K5Be9IDrDNgJMydsxBJ9/EgT/hfX5PX430495sXoyQzw
         X4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746464865; x=1747069665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9SZ6hDle3mFYLwdSqev9ZHk8hZbU5Mq9wO4mHZ7LZg=;
        b=hU/aAQithow45Dqui55h6DNoWSHqRuFWrq6duj+D6i7caYs1rky4uPtYx8k5if5QhM
         oWUjBYVNbvsyHrwVj+U+61NyWuHPiPM+6XSwRv6nhnAkIQY7hDO1QMgpFzhVqM4ebJB2
         5KD1G4qivJCBgK5JbTxeg2xep4+OHMADfGneehhctJenRhgqNWjWuxB8kWC0ERMAnyu1
         zDXxxWhDAQHe1ACEcAe5c4zpsBHSe9iyx9lzRQZc5uyIrliOyg2xPg9QMEqy1ofUpeul
         RLaAUm6uj4B9GBQ3zaGrdr8dmFtmyh46Zp+MwVuBn9jxgiHwbqCDP8+0pSh6r/Ohfg8U
         rO8A==
X-Forwarded-Encrypted: i=1; AJvYcCXKvPT/aquLAgqbttw1pfAbQa7Gcu9kzXi4FfCrtdtH8t0ZT/FDsEOk32e8chBIL+yWoCPzxfNpGJYfipI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1CdX/Ia/ZdHT2DjbgYtK3X2RzGtkiTjDw5O/r5QGaDAWKkGE4
	bKcabm7yWf/eh+XdQRRTtsOIVB8XJOG9g4pkGIys7/0HUS9deklW8P+wdSNQ/JI=
X-Gm-Gg: ASbGncvO97qojPPbgq6Y6pd/QX46oj+u3fUCIaFe67XL6y1ooMcuvfdJlxVakZos/x+
	IsALo1ZFnQxdi7v0zd6VhnrA9mrU5//cVbO8AivHfTqQragPbn3hMSWLAEgvdYaU2y1ZtLCWg5O
	g90g4TcZopi2B/rP/EuzLHZy527hXG10wn3QXJfoi5LunRHBQ/7jN7yUs0sYLMvb770Qg3qJEo8
	kSI0vmE5EID4kvwWe7AOQyaxeoyc/oC3B9+EF6Be8PA88q+R3+eUDz+5VSg4wC7MttWvGYDD3W0
	jN4MItZfYVCgQ20SZMzPLjgVCTaAkGJPBJHtz7AwphfEwO2kZZbiyzNK+pUsVOgJKWQahsCxUpL
	qL0HP6WPDMu1nJi7FKYpB
X-Google-Smtp-Source: AGHT+IFVEarldhbR4I+f9BMRzsRJwuDgMxfpCmFIHaeu17RGFuLoNo98m5TIGfII++0tO+OLdzUI2Q==
X-Received: by 2002:ac8:5fce:0:b0:476:fd4a:e885 with SMTP id d75a77b69052e-490e27ac1c5mr3375391cf.20.1746464865541;
        Mon, 05 May 2025 10:07:45 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48b960cf0b3sm59914081cf.2.2025.05.05.10.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 10:07:45 -0700 (PDT)
Date: Mon, 5 May 2025 13:07:43 -0400
From: Gregory Price <gourry@gourry.net>
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Rakie Kim <rakie.kim@sk.com>
Subject: Re: [PATCH v3 0/3] Implement numa node notifier
Message-ID: <aBjwXwIZa0LKBDuo@gourry-fedora-PF4VCD3F>
References: <20250502083624.49849-1-osalvador@suse.de>
 <20250503200334.3f912eeb7ca484bca4eec7fd@linux-foundation.org>
 <aBb-yDDJLObXF8P5@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBb-yDDJLObXF8P5@localhost.localdomain>

On Sun, May 04, 2025 at 07:44:40AM +0200, Oscar Salvador wrote:
> > Further down-thread, Gregory tells us that Dan's patch "seems to fix
> > the underlying problem", but nobody (including Dan) told us about any
> > "problem" at all.
> 
> That is related to auto-weight mempolicy patches, not to this one.
> I _think_ Gregory means that I take it in as part of the series.
> 

Yes, sorry for the imprecise language.  The two patches address similar
issues, but one without the other leaves us in an odd state.

1) Returning an error without this patch is an un-desired behavior
   because the current behavior can produce duplicate online
   notifications - which is expected but odd.  So instead of returning
   an error, we should just continue with the callback stack.

2) This patch makes it so that there won't be duplicates - and so
   returning an error if probably appropriate, as something is actually
   wrong if that happens.

So it makes sense to pull these changes together.

Thanks,
~Gregory
