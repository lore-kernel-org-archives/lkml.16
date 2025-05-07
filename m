Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ABB1E25E3
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 05:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596425; cv=none; b=ikT0K4qOjvLeGB5enfOw8t6wAyj55kQPCjvCvXD5RoXMJtRQHEnDChqQlI52SstTVp42J/mzUL/3yKNiNb6KbJov+qIJ4icCI+xlryYQkHabrVHQNW31TCar79lWeVlMaPeZx+qN/aOggDaSwU4Ac9KYp1JhX2SS4OoGfrQd9PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596425; c=relaxed/simple;
	bh=x3IqRI7+6yI79hXX7qqhAUMFTsRrFTkDJXXi7bNOyZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHZ8ZvuMxqap76rHQLd/br4PXjq/70ihT8kt8zS9WF5eJ4V5j0AFuMQGLRZk3tYhEwJ/fbBmLg9ZuECsXAajIuGAzYHSntl1rAE5bVJQSRxthRK4RrvT9SBQ1IL2983jV335GN6CiIUwA5w5tQ36Qve1EdeGDXTK2ZeDwzrf8Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=arN62r5g; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="arN62r5g"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-30ab344a1d8so272987a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 22:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746596423; x=1747201223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=outIt2Tzb0nU9gZ1BTuUgZWqA3ZwKfB1X1BxnDdScyQ=;
        b=arN62r5gJKX8AcntZ6H2WL6LJ6wopt/fDDVMuf43byRJI1UcTrPPBW5aelVGnjIccI
         ulP/6SHciVQ6pIY8zr9L9yAanXQKWPESwrc0ZeKFuZAGnInONxA7Y3XQMLw+phUvQA5U
         HuelkMjzmq0nUwdAVKtVWkDSLdcQMpqrrYimI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746596423; x=1747201223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=outIt2Tzb0nU9gZ1BTuUgZWqA3ZwKfB1X1BxnDdScyQ=;
        b=HWDEq1IakoHCDk9H99MxyeLg5BLvo9gPSc6b2eMAiAETt69S2gK+2qPT+t8ERwbQ0d
         uYR0Oxu4iM9sIXybQ6TzRw06NSXP+TgeSxNxBmIKRHUv55oda58KIy6KvjzjntwbxW9i
         O82QrgQsG+9CU+CV2Ze+c541UrfljhplTeaNeVUcqunlDGcXro8UecDWvRQHWqHzLYmg
         tJ0JdtAFjCtKLrYZezcf1EuFJbUBLx9SBOhCuwUEEA/GNwlQq2lNNleyDkyLUXtCmIOT
         85mxd9S0N6L8zzPE7gtFjNRg433yEySAc0YaMJCZA60a6Ei4ULYTM1go2yqHPEjtmIbC
         DvyA==
X-Forwarded-Encrypted: i=1; AJvYcCU5qL3zp/iKn5/g110q2TYg6BWaHZq5h0dFqRKogBLNK8PUjXFNaiTd9+nL4Z4sMRLhgjrVUbrErWifVBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzThlNnDeG+0Dh40dZutpnpzPac2umNC4kMXlibLzXo1H1oP/qy
	KqYKgPd0Epma/0aseCg8wFpwM/YAmPGx/LXAsdc0WqqE0RwMGCdO6ca2Xruxfw==
X-Gm-Gg: ASbGncvV6nURlzVADb4BAWrm6joIwaBGNP3ZGMlKD4gkpXeW2FGEpz5df4Iy0O3rJF5
	hpFx2leH71SQ9UEQL4CxkhiMLLUtVw7E/CNw9p9sygIBvS5JI9Yq9im1fbFSrP9kVlIN0rx1sWO
	N6ym6ED+TzdH9jinJla0d/xZMpbVmXZnWmGxBR0Gp0KhxnWM6NlZibIIPZ7d2rrDxlJbuIZjVrH
	OFl+ocYUB47m6baXHh1nMkVqnh9+q07fB5LJNKq0YAiqZiHmm6neRVAjdFXf60iP/65rt/dI1K9
	ai2ZMgEbB7EHDTE2uT9bxRN+m1Xxe+r6PyMBq15xT/2M
X-Google-Smtp-Source: AGHT+IHDckEhV3VdKPDU2NI16nX908GbEl4+N4IQWfDv6w/TD99gxmV6rqQ8kPZ25udKGxGZw/Yeeg==
X-Received: by 2002:a17:90b:3882:b0:2ee:7c65:ae8e with SMTP id 98e67ed59e1d1-30aac185045mr3372912a91.11.1746596423308;
        Tue, 06 May 2025 22:40:23 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:284f:37bc:f484:cbc6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30aaead24bdsm1014185a91.32.2025.05.06.22.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 22:40:22 -0700 (PDT)
Date: Wed, 7 May 2025 14:40:17 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Vitaly Wool <vitaly.wool@konsulko.se>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, Igor Belousov <igor.b@beldev.am>, 
	stable@vger.kernel.org
Subject: Re: [PATCH] zsmalloc: don't underflow size calculation in
 zs_obj_write()
Message-ID: <o5xq2ojelmu5tuhiea56xctpnm7thfpkzxd56acxewbws4hwac@zgixe7zk27de>
References: <20250504110650.2783619-1-senozhatsky@chromium.org>
 <20250506135650.GA276050@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506135650.GA276050@cmpxchg.org>

On (25/05/06 09:56), Johannes Weiner wrote:
> Could you please include user-visible effects and circumstances that
> Igor reported? Crash, backtrace etc, 16k pages etc. in the changelog?
> 
> This type of information helps tremendously with backports, or finding
> this patch when encountering the issue in the wild.

Fair enough.   I'll send a v2 with updated commit message.
