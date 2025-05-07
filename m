Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4961C84BF
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 05:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746597450; cv=none; b=Y8H7IpnH0waV3tMTrB1s7UpPt3RSjgwxLgG9Pe+s23ixNG9Vt4QhEPOcdnCnQk0VTk7R2d2BUP90aKO98KU0awv51Hd/2zOvL2/FDJFHRQXZX7hJ3703AGQ8GZxDh7ZJ8+QJP0JdEAcXqcjoR/cM3rpZ7pIKHGR1ZiEb7lSDdmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746597450; c=relaxed/simple;
	bh=s5wPXswhIRuKWtQNDAgsunt6KX92CkkWfbmhKqRjAuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vCu6HlrB5sFezTahjvhZbvDYKZ98gVupqyGgNVCwVdk879sSvgIDb500rWl/YXQqyLDUuj6DdXfk5Uj9hLMTJqzrrmFRPyORQZZohGwJKrUvDzzRqU+Cdr+oXVGA9s/ICFuf/Xx4CjcLgN/7isVLf1VaAEEnsr8PGreTnV6m7Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m5KiKtsi; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m5KiKtsi"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736b350a22cso5415205b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 22:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746597449; x=1747202249; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HMQjJvAbkpygG3sDtRyYI9BYDdFE39y1M3B6zb67R7Y=;
        b=m5KiKtsiuWUHQnejxPAkFpIT+toRW2k4PLS4yM0w86H+rixLCLyVH3I+uLBwuBKCFX
         tm3+CJ83oW6Eq/7O45dagE1wOznzPy4n54hzGS7iTGLh1fCGE0p5Rbsd656SodhPV37e
         Lm5PNTsfWcIC6HaOtEp+XgdRwfW3gEH3wreGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746597449; x=1747202249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMQjJvAbkpygG3sDtRyYI9BYDdFE39y1M3B6zb67R7Y=;
        b=XliXoKq2Ptrs8YSp9MoNjV6l6o+HN2dTTGDdNDrKEwpD8FcvcE6lPTMXYCo6ijnwuH
         LggVYdEuZX/5DizWz+tue4AaEqELeKzf/ZCxweB46mJCAzS8dfKUOZ5eLfLOArpGFofq
         0DQ84xSLWTYkpg4lOJmxllb8/BHtgS1XK25L9eCWbbgsvrEJkLS3IeeSTXNqOburBFVI
         8zEWwwqLzrX732TO9mf9dh6NwSWRWB8lgvtqieXv+pDLTlE+FDf+qzphSetOacVabFSo
         h04+U3QtpxqreqwHSq9WhFQmFaEA3PmRFvzFtpEsOIweyGEZWtP16ab6wp3m7+RGJhcM
         SR4A==
X-Forwarded-Encrypted: i=1; AJvYcCUS9mZ6TspetX2iKiXWXGA+bBoCzm29JziUG0mdea8RhO/e1y2n3EH07GigUAtEvJ4308SjuRb/wSfxGNg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHm00W5m6NuY8+DFZ5Tw+LW8zNLCs0y4pJKhot+nAifHKSj71U
	Z3OJ+4IsMI2TKRbMnnHbsl2dqjZSu/IjSr/sxnmRL5k8SSZnccRADJifUIczxA==
X-Gm-Gg: ASbGnctoUCx/gHW5u+z8Y3RFJoFHTbe2gCC45GTrgkEKEm4xsU1wTnohBIahIKod4AS
	Y4LLsIhVySKM/ygHQd2dcW0i1cZp0jEhIdRqNmeyUKLUD5pdy54n8MAXxdj8z8RhKgj5JVHbdRl
	AkILQSj167R/yjosI1FeKoLkW1CQzYFz9nUIks8GxM60ABAQLp3CKA35ZmIwMfkINtx6Qn+RT7K
	Q14s2dOgtzr+nIz4V2WGLTiSQqw2U40+PBcv1/ecpGzU58vtd8iKQt0OztsQDa+bQMIt+PlC7jH
	kU1QivuS/SG8sZw9EDx4Ioz4E1ATCH4Vw73irYWatjWiVQ8vqtkVfUw=
X-Google-Smtp-Source: AGHT+IFSCaqNfLICIu3cT8tOenSbrmtR+1O/oHdetTBpN9rvmn5DpzhGNIuR1+JHJiX03jpPmD34mQ==
X-Received: by 2002:a05:6a20:c890:b0:1f5:8a03:ea22 with SMTP id adf61e73a8af0-2148d01173bmr2802774637.33.1746597448805;
        Tue, 06 May 2025 22:57:28 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:284f:37bc:f484:cbc6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7adc9sm10246563b3a.30.2025.05.06.22.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 22:57:28 -0700 (PDT)
Date: Wed, 7 May 2025 14:57:23 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Igor Belousov <igor.b@beldev.am>, Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] mm/zblock: use vmalloc for page allocations
Message-ID: <m2dmxnhtvxano6lye7lr3saiobn4ygpln55xntlstfo4zwws5g@qpq7aagx3xwq>
References: <20250502080156.1672957-1-vitaly.wool@konsulko.se>
 <aBoK7f7rtfbPFGap@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBoK7f7rtfbPFGap@google.com>

On (25/05/06 13:13), Yosry Ahmed wrote:
> If we can use vmalloc for zblock, then we can probably also use vmalloc
> in zsmalloc and get rid of the chaining logic completely. This would
> make zsmalloc simpler and closer to zblock in that regard.
> 
> Sergey, WDYT?

This sounds interesting.  We might get rid of lots of memcpy()
in object read/write paths, and so on.  I don't know if 0-order
chaining was the only option for zsmalloc, or just happened to
be the first one.
