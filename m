Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52165126BF1
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 23:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746143010; cv=none; b=tjn591esxLALJW3VtmI+t/qOAICqU0/HYXND7J4dbnT1fY2qNe6FQLX4VzHx0jUjzedhzXtg3DaEhgVxt9qK6m3lGEUmkTeI8MV9qWbBeWCluvAU8kaabwCOZ0fam6wVSXDrmYkojj8FcFYgaI7+BeL5qTxMY5yWjqTK0Nk7Xs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746143010; c=relaxed/simple;
	bh=LJeygKu5mHmOAOI3gZeCfs0LPY3zr83xk0QBYX1alwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAJSLx1/DLeNiKRYvz8x1o8K/O4KD0MuhDZSNBpCm2SRjsJdXluRJ1jPJbx06k/nDcgAbF9AwBiw+J9itVyr7eezhVtCEX+ETxQ6beGFNoi7fLnZyRyQjpLrsfMI0VFKUZxPEmFEVX06pmSbOxTcLXTV7XZ6fiJQDQzpUpsC9Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZeZQc/XF; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZeZQc/XF"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-224341bbc1dso19559095ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 16:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746143008; x=1746747808; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K5FrPv63jwWfhhvTHhfDuGFNw9Ttdhrto3UgvIsqqoY=;
        b=ZeZQc/XFKp90iWnTRaBtu68UzDM9wciN6bf3HG9XZLzHdavKnjDNHHEeYliJDbm95D
         MWiedHPs48A19aw04EimOFcSTrONRnCw7D4UBOD3ddgedFoRfS5Wz9eetc6CvuzdhOt6
         BB3zw0L23T+q/A/A3PUuUPwAWm64lTUvfRh4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746143008; x=1746747808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5FrPv63jwWfhhvTHhfDuGFNw9Ttdhrto3UgvIsqqoY=;
        b=ouIKl9WkHlMyXVB6O8i6WoaP7C6tugKf5xwJw/+BSeobJRFsXOdh6Vvig2rJohMkkm
         pv0RCndSLmU5VCYqT5SUKvjPCCGt1uiL1AW4lTp4MIydY104y6A2rQ1ezFrsBkQh2Rq7
         LpRj/jwoUIm43Xo5G8J382jZrAszMmvC1o/ZtgKyzuij8xsx0PnNjcAAHoo0fme1oYza
         Or7zdH/BGadJdmRXMLwumOXLKZB1h3RiTWOaAnHZrIo5TmPG8lRUBeMRF8/9ENxtXbd4
         ZhfN/M4cuiq56aolgVaFts4erbbsSubpE1m5iZjW4bsb48+rz37spCQFDJnF9ManDpFf
         gjlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbEgjqsQbVVHfGA8p7hVf8VkXid/pVb23MzWXs5OiG3TG+601YVp/m4as1ZOZvbRXRRrOeKWzVoHImTOU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9sZVWimv0xG0jC//dnzdW1B5mKJ6ubbY0XB7374Cb7CoEaks1
	N2otHxB9nsNVP/FxpfFgZdvbt1eztsVi350gPib4YGo/MfZhDesJABYfWZ7SHcZCs1SRkVY20iN
	deA==
X-Gm-Gg: ASbGncsoUofAHsja6dbzpqaU4aI8jADOdjxm1mKsQ+aPnTGfgpKAD0IjvEkl3rOKOBj
	yw1Kp9tBPybNXxlR/ZY3kfUr54R7WIT9ObTOcFOTKVQDRcalCD5yJ1Ect9TmU2AT5hO0m6M234t
	K/j3UBhc/6I5yPmwQJi95npUZDLGMH2MJg7fUn2yZgPA4nXCL5KRvVAmDJPz6QEVbp7ImW1Rszw
	SQ2ds5wPesFhT9RD7y2yV3u6tfTQvoHAGhvPHsh0n4OSi5X4GVleA/W0LiL3gTF7NBWh3BGvQpN
	abdzpFlOI/82aJ2o5Tzq7T4YpatOOuqrZa59EmLd8SIU
X-Google-Smtp-Source: AGHT+IFQ+eFJISk1X+wHgQcGsTaOq4jBwZEpP6zyVc7S8BKjYFMNDUlhhgOV35hdjqLKAaxJEnRlrQ==
X-Received: by 2002:a17:90b:57e8:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-30a4e596186mr1352147a91.10.1746143008503;
        Thu, 01 May 2025 16:43:28 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:7255:67a0:34ee:5b40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3482a35csm4245166a91.44.2025.05.01.16.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 16:43:27 -0700 (PDT)
Date: Fri, 2 May 2025 08:43:22 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: Yosry Ahmed <yosry.ahmed@linux.dev>, linux-mm@kvack.org, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Igor Belousov <igor.b@beldev.am>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v4] mm: add zblock allocator
Message-ID: <uducoj43wg46d756fxbgdwsnql4kff5if6psuly75qfimk44yg@vbu3cf2ealjn>
References: <20250412154207.2152667-1-vitaly.wool@konsulko.se>
 <aAdzjdv674Jn6G63@Asmaa.>
 <e764d05a-6a83-4563-9f28-3f1a3e28727b@konsulko.se>
 <aBIXJrbxCmYSoCuz@Asmaa.>
 <c612aff8-1b07-43aa-b909-f555da511da2@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c612aff8-1b07-43aa-b909-f555da511da2@konsulko.se>

On (25/05/01 14:41), Vitaly Wool wrote:
[..]
> Bottom line, ending up with a lot of blocks each containing a single object
> is not a real life scenario.

Why not?  What if the data patterns do not favor compressible objects?
E.g. what if the distribution of compressed objects looks like this (a real
zsmalloc stats):

size-class   objs-allocated
---------------------------
...
1904         3315
1920         3468
1936         3515
2048         25816
2144         22363
2160         3230
2176         3075
2192         2990
2224         5665
2272         8118
2304         5040
2336         4529
2384         6132
2400         1768
2448         4825
2512         5135
2560         2944
2592         1562
2624         1512
2720         3813
2832         3315
2864         820
...

Notice tenth of thousands of 2048-2144 bytes objects.  zsmalloc size
classes are fundamentally independent of each other and, hence, of
the compressed objects distribution: the lack of objects, or even
"the absence of" for that matter, in size-class 256 does not change
a thing for size-class 2048.  This is a very important property.
