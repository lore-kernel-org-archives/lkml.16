Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1271535942
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 12:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743683794; cv=none; b=kYSvO9Z8mTJb+yDtTeQYw95/pJepRVED90VxQI+QScIkz0NOukqHyFNWc1/jzpEk0EOsAXmujbsFnZxygBv/6MND70VbyGGqovYO+aup3bPbAFPI1keUXrh1jaWnW2dTZkFlrwAr+uCxEiNrr+9y1DZvfGVBw2Ij1FHzblxVXIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743683794; c=relaxed/simple;
	bh=EC+jRXJYLFQfR1XxsI3t01FqkNMfotqtYy85kAcqX9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UeAI0mbp5qLFc98g5w0oXQkWFyjyRdtkrEe/lYIpoDshV69PDJvAQ2bIXPSt1Y/37MnCFy5JrqZFt91H8gBUeT5Imn/7D2/sai5YHpm71HEwkhvKv4ihjDUKGZnMLdx60vwKyaccfWAev8Bs4ljvcW/o1YZ9zDk8wrnKeWpE0VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zU5uvTML; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zU5uvTML"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so8052125e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 05:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743683791; x=1744288591; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C+kjsh0yi0FCSevxaKtD2+LbGqyeUYLAkNUlbwLow8o=;
        b=zU5uvTMLBrKxLHI21JB8z+lFe16YB4/84QOEGh1jo+MDV5tqntQQ5Sdk1Svxq310w4
         6TVDh/aXZ583ziNfklSP6Noj8SypGxgpA6zvog7npxpBVt+ezaVxfHUjmk5y7hfQsptI
         tJt6mwqQkzIQg7ecK2qtZjNYh2UtB9PDXJONVHaUcGJWf7qR8L0NtKcoAKUHKagCwojT
         th5P3bYcgssta8epMAQiFepUDctEhbDVI6IxhM3ORL3Qjp5srurZLbWLy7c7FRsCJnIZ
         4D1Bc5zBiLpz5pb5FxyiX6uBOiLA/s8vRT5XzwpOOsElAJb4O25b5tFHVNrMeaZmZb4o
         Seqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743683791; x=1744288591;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C+kjsh0yi0FCSevxaKtD2+LbGqyeUYLAkNUlbwLow8o=;
        b=N1/YV157nWCTgmR9j5PB0qUbdM7sPPffMFTVddnhQfvscSoydVXr9LONwRg2afA1yZ
         ie2hA1xyb6ySDQwUrqlSeIGsnG5/Ft1Ayw28L/KB+SekBMG7U3Xm43aynPh22yJL3Z9+
         jxJhAsL7UrrT0zhmD6BBfw+zkE0780pyX2LLafKYYT3Pfk3p0MlqCOvYywweXDSF8W9p
         jFEB5R+GX1hWV66vzcd92ePb/i+G5pZKGPfH0zzjg2/ohskaUzVFGKJjp5dQdm4euCE9
         M1R/0fbcwAB23+fA4pkj9+Xe7d1afHceDibBJDrntaMczTR4rltHB9fSjD7/AXEdTlpq
         RtcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzO/VyynyFdUBEcnmGIhtAspHCL6TSFGBuggrpJr5r8n+r33ocg66nn8Gew3nuamSWmIMIzNbjJMMgIhI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ADqldHpNU8G+boVT640jPlbOPA5kMrn7qyugcKUlb4XvVo2D
	/QR+VWnCZo2as6yfeh3DybGdlbX6sJTTO+WXfFM00TLwomWfm+BU/dQZBPmJrI0=
X-Gm-Gg: ASbGnctuvEbHaRhIgylY10cKJcYTJg4usvepamZG4Tz5fy/l7EbdAhZDSPJqYcbUuhs
	SNovy2nRbBvOHbdf9Whu2B2yisq2CMjGMtnOlzQ9RlWxXCUHVAYxi19lyJVAT8d4ukOTxJLKShA
	oQEWFvZaAZTYs9yU+6mLxLmUZRD/oJBVLNFKYwHfJ85PMIVKD7GRU7hOwdT5C7vrV645HINYRo7
	7nmqiXFytbRO4oigjwMZFrC8MgxIxKZCUHqOPKek1K7OF2JAI4aoZKjJcyAmNE3QKBecxz629IA
	nNpohumAnEjQu/du54swqzuY/I782tw+DVvjKpHQkQ/+8mwxOA==
X-Google-Smtp-Source: AGHT+IEm78dzW009E77mGS/XMpvwRtJc+F+zhJbHZ/MmX0Htx6azwvDUIts46v7UeKdoeXtVIBNeSA==
X-Received: by 2002:a05:600c:6dca:b0:43d:fa59:a685 with SMTP id 5b1f17b1804b1-43dfa59a802mr128749085e9.33.1743683791239;
        Thu, 03 Apr 2025 05:36:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec34af0e6sm17579015e9.16.2025.04.03.05.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:36:30 -0700 (PDT)
Date: Thu, 3 Apr 2025 15:36:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Gabriel Shahrouzi <gshahrouzi@gmail.com>, linux-media@vger.kernel.org,
	andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: Fix indentation to use tabs instead
 of spaces
Message-ID: <Z-6Ay7T3n1vXfAO9@stanley.mountain>
References: <20250402135001.12475-1-gshahrouzi@gmail.com>
 <CAHp75Vc1nB8cDN=OcCJgeti3YNr0Dd4yeKgeSBvR95piLao1rg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vc1nB8cDN=OcCJgeti3YNr0Dd4yeKgeSBvR95piLao1rg@mail.gmail.com>

On Wed, Apr 02, 2025 at 05:36:31PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 2, 2025 at 4:50 PM Gabriel Shahrouzi <gshahrouzi@gmail.com> wrote:
> >
> > Replace spaces with tab to comply with kernel coding style.
> 
> Still 'tab'. please, capitalize it to be 'TAB'.
> 
> But wait a bit, the driver maintainer might do that for you whilst applying.

It's not an acronym so it shouldn't be capitalized.  It should be either
"a tab" or "tabs".

regards,
dan carpenter

