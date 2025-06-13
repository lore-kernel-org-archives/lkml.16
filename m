Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1449D1A4F12
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749791623; cv=none; b=dRquBrDJBmpQYaoyPM/B/eml1Doai4BzSOXZv2oGBbwuYtumacC3ca9/yeeSZ9MsbBSt+re3MsPp9Wph4vWKiKVf07rO+HJIkQJG488iGJZ4EbFYbMeZZVWOgwFruSRdrJzkaC/i48OhpkfFph4XjyLjtcnILzaq+4yWwu5K23A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749791623; c=relaxed/simple;
	bh=G08/pOykYg7g+o5uKwDII0lrW6v1oU2ghmCj1yDk/Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4YtafHfzVGYSnANAehL3olmLKiNKrwgIDWjqaHU7Addvg1fnL52+OJkzukRQ1buFFxrG65oGpde4ZQ8thsK5/GSnRM9mM6CAnSNUQ1JwsoIC+z5grL8uBXTo37QMB/ZXJ1bfI6agx087bny6hsqVE1uvg67Q47zDBETpSd4lQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5lytjht; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5lytjht"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2352e3db62cso15604965ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 22:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749791621; x=1750396421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S7J7ogaBI7CcQcq/qXPbtxb7m8fBt7tl+AACNdp4HFs=;
        b=b5lytjht0gSpNhlBIUdX4f28iPhTCzOntTB46yEAmGNBK6aL4qyAsVZTdq9GADzvVt
         0LbVm1RrRjMhlfoEo1FcWpn2YWWydO9zElKx5u8fB7wRUgdt/sfnwR0FYBqU7aD9d80R
         RxKZ7fUC/aFhjYid9ZPvt6Ftsi+MEQaH1xwtFmGzGdkhba2DvYGYUE0QgYVonWRApfVA
         daFLtd6Rue+2IGY7NeOJ2/1B7pA/eXbqw7FABHwelYlRuyqIZevBGuWyWevXH1UuvQkR
         4t4WTl092EFFRqVacGaOrp8c3akpukvZssKI5zVWuQIHap73PCPUpEoUlWwNs//0otXs
         STTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749791621; x=1750396421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7J7ogaBI7CcQcq/qXPbtxb7m8fBt7tl+AACNdp4HFs=;
        b=dYhR9/AapHI81VzIqj3SvGqq344mHBgitPxBAI4m0hIKRnsJ0mQAaZYpTPtvkujL8n
         jiKFsLqMbcd+srUhZk+4yQ7IbVZcTTUiO9FovU2jC0k3+BVw2wFf87wguTthKiSEqlwY
         UQh40smjc1ZI1EjzkfOl1P4l/pEvHP+8hnvjvXq9ayijh8O+7l5vq9RuAdHz0a4PXJX6
         UOeY1S1uXRS409hwdtwtgKUPfOAEKdmr9e3Z3Hkhfzn6k6cgb1NBsbQuNxyPOV9N+gxU
         E5KP3/SXUI82OqEpFPJU+8FQ55GRS5+tnZ5l7dDPWJaDryKINVJlMir8MsGL8kDGxk+i
         +SYw==
X-Forwarded-Encrypted: i=1; AJvYcCX6ZJBYQmEe6jIE3HCJCy1WlLj3fykB6+wDgvPXGIcqLzDojguICwoAE+NL9HsEMhr83Q2P3EBk/neNsMU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym0dMq5WPlqtuTxOMD5rv/IjpKVUzuGwGftNiUmv7XFS7E4oDP
	ODGx5pLqqPia3wj+Q655nosCPhNDK9KnBoXoL5y5s3vsYedPvCpk75Oh
X-Gm-Gg: ASbGncs3gvndAco+cjlEhdZFEpxq4er6xk6bF+smEVRwgPNvDuthYggktDpq/tAYhv6
	zQcwfI6dDDouyuEhSFpjQU46FDAPZlRIoeF8yizQdJKN3xLsBCR5Mkr9MoJ9rmwuUW16d2xd5Lm
	x1yUgqRJPYewsul3+xZQZYZJa3MRNO4bD2VNDmqAR2CaQjRhc8p2xK6eqZN0j2QEOEiM9dU9btr
	CkdK2/JbKMU8x/UQQo6JwqUwEjYJN02sPPWKQjrMWrpX1zcgi0Qlx+kP9gHyRc/u2W8bbWtTDjz
	ni2a9c4lT8uPwvWglW8XbhijtQACcVHzgyNyviONBa8j2cJtd7GEiChmzvNHTA==
X-Google-Smtp-Source: AGHT+IEaUFlrRu0V3wU6FVfbzQxdLX/0v+xsOpRp/MD80VV8ZklYnFrbWKdpIt54AKbXffMKADjvbw==
X-Received: by 2002:a17:902:db0d:b0:234:11f9:a72b with SMTP id d9443c01a7336-2365de400efmr22727345ad.50.1749791621346;
        Thu, 12 Jun 2025 22:13:41 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19b8139sm2490755a91.1.2025.06.12.22.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:13:40 -0700 (PDT)
Date: Fri, 13 Jun 2025 01:13:38 -0400
From: Yury Norov <yury.norov@gmail.com>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: John Stultz <jstultz@google.com>, tglx@linutronix.de, sboyd@kernel.org,
	linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] clocksource: Utilize cpumask_next_wrap() to shrink code
 size
Message-ID: <aEuzgmClrimyc0RY@yury>
References: <20250611104506.2270561-1-richard120310@gmail.com>
 <CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com>
 <aEnTSuVy2Aq8jRk8@yury>
 <aEqFoNGGu3eOKBEL@vaxr-BM6660-BM6360>
 <aErzPhCYGLqOdlTe@yury>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aErzPhCYGLqOdlTe@yury>

> > > > I think Yury submitted the same change here recently:
> > > >   https://lore.kernel.org/lkml/20250607141106.563924-3-yury.norov@gmail.com/
> > > > 
> > > > Though, I think he has another iteration needed as Thomas had feedback
> > > > on the subject line.
> > > > 
> > > > The bloat-o-meter data is a nice inclusion here!
> > > > 
> > > > Yury: Would you be open to adapting I Hsin Cheng's commit message into
> > > > yours and adding them as co-author via the Co-developed-by: tag?
> > > > (Assuming I Hsin Cheng agrees - See
> > > > Documentation/process/submitting-patches.rst for how to do this
> > > > properly).
> > > 
> > > Yeah, bloat-o-meter report is good enough to add co-developed-by tag.
> > > I Hsin, do you agree?
> > 
> > Sure thing, so do I need to apply the tag myself or we'll follow Yury's
> > patch work?
> 
> I'll send v2 and include your results.

John, FYI.

I Hsing submitted another patch that duplicates this series. You're in
CC, but just in case:

https://lore.kernel.org/all/20250613033447.3531709-1-richard120310@gmail.com/

I think it's pretty disgusting. I will not make him co-author, and
will not give any credit for this work.

Thanks,
Yury
