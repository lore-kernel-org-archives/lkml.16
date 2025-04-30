Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD09420E718
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999959; cv=none; b=DRHm9UnRjjmtQM+EtJ8KaRbh2aRVJnuUxPJPXL4WpK2pp+2EGvZjTSb3dmFJ7YT/fLdrzy822krGmJC1FdgcqWE7MZIHnu6Bnn1E9n70QtqrU+D7SEeOPBuRYtr/2feVw2AemEOIge5S6y0Yl3m+iarTqpnrCK52nphrvLXQ8CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999959; c=relaxed/simple;
	bh=DquqmNQHF/m4HxpbBFGGEP0CL6fNCvqmk6w0i06OtMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SwlS21FOaJzT/7AllU7LGMCNgkc0Nbfy5nQOCbvzWeasDlkEJu15/NG/IEh9dMU3j09yz+OQ4BXeaddro7jOGsHzFNmPZlpB09bNJy0Y+VfaeUHHx1ohTLYzS/phznxNVW7B6oDxDVuFrpjnRmpP93j+LCDCWN6a+BIbfVctLrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cJAVpRHD; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cJAVpRHD"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39ee5a5bb66so4552567f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 00:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745999955; x=1746604755; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8yhws0Q5ikh04CNsW2reZQlwgg0sFJvUUD9TkSfglwk=;
        b=cJAVpRHDu0gFavbqDRrYG6OQn0HYb+FUfldGKQCYMrFSxRPo9hsJmxQ7m54ycBnpEk
         9FtH/vBPIUwqpRYxc1lpDOrsTkAFYxAS380I57PZ4SmLTYm7zzeIXjtUBsGoZKPl7VHh
         Eo4yNm1wf6R7Qv0B+TNkqqf5MvjzL6Ghza5Priyg69gzAZsaYaRKvDd23AfXQg+Olh0r
         4Z+AHYf49BrjLYKBL82Co8Y0N6yHzD7lrUPLuRJPQoWnNOadQDZ7DH8rUvAD7aNmAFnM
         M5IibDQbUrllYZEhni88smZysmFVGN7TT9aBpNLZjm+KtuVyl4dbnTBOMIE5ykh6/l6W
         bc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745999955; x=1746604755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yhws0Q5ikh04CNsW2reZQlwgg0sFJvUUD9TkSfglwk=;
        b=TpMvCCtJ8nXK48TGm9xrYWBV7lWQ6tjTcKS6ydcuJbj8SKRRmDDLL07BeqaeSy9EY4
         kSnSkE9UDrX7qG2xeIaZOC9nAO+mRGQVDLpcL8NjA84F3yzOGJhtsKjKFO5Ri3JCRvhe
         WpgTHcO7jFBypNXzqfpgoHmVGnjDHAX7hyNj1L2sifyqyybpiEz+fCwxml7EZGXBQcqA
         y72srWd/6gLc0O+MJldamoz4SKBLfpHiMXxM79anXPyXIr6sLbUDtgfcrtqU+zFGtIg/
         nBzOlWMirSPRduMJ1FkIl5ERAdw8FrZLWpaI+j2WKvV6+R8NZnbPeEmoEZgOtTo6NMnH
         xUeA==
X-Forwarded-Encrypted: i=1; AJvYcCUAD7VIDrK+qqt0cMWbpy9uKJ8WJRxVVK/HEwYONjfWKn0jXNpfoCt2pvTwVvffBdXFbawDLS0wWr68N2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLUvZG6d12H4pc5OJE8EhSEFymFOhhomWU3GmaWp+OPUnsa7xw
	m6FQyn4zXDqE8D8/uT5PCOAwDitKbN3OF/757epyegvsZInEBmj+wEiaXP2Qfwc=
X-Gm-Gg: ASbGncv2552Z2p5VieQwNqpm1wMp/aBkHXbXqKdzhMCwE4EUfufO6rQ4Ivobd1/u0hs
	ANib2hfgMMtuNtnFaFewZOGxMcKHcwHp+JZJykdrjXXyQ1YNq6oVl5vnpFw6DJTGTrltiR0YogA
	Gs+y8xm0pMqbMAeHSgcO+xBJll7otXtxC7KxG2/Y9lffOT/FiC5ga9WfLpR+hxkhU0iIhVOSNMT
	Lfc6VALIZ/EKbhRch09fX2YV6xuZIUjVJjS8yQrZCh+/dIBd5U2+dZeRxBJ0wpKj2pNmj4O/Z4V
	7rYZLeR/gXfsT/Bzj9Z9NeNN3lpgzCp+GMQxFVsytBxXZg==
X-Google-Smtp-Source: AGHT+IGWwUXDagNfvdIwDMwiMvzIUkzM92P8IN4dxhpdZm8gc9KQcT5g6by4Y8L4epCfcq+h79CqWw==
X-Received: by 2002:a5d:5c84:0:b0:3a0:8ac0:bbbb with SMTP id ffacd0b85a97d-3a08f7b78c9mr1757255f8f.46.1745999955164;
        Wed, 30 Apr 2025 00:59:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073e5da02sm16350707f8f.93.2025.04.30.00.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:59:14 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:59:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhongkun He <hezhongkun.hzk@bytedance.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, mhocko@suse.com,
	yosry.ahmed@linux.dev, muchun.song@linux.dev, yuzhao@google.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 2/3] mm: add max swappiness arg to lru_gen for
 anonymous memory only
Message-ID: <aBHYT27M1tRxNLRj@stanley.mountain>
References: <cover.1744169302.git.hezhongkun.hzk@bytedance.com>
 <b3af3747daefa00177b48f4666780da58177f7c0.1744169302.git.hezhongkun.hzk@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3af3747daefa00177b48f4666780da58177f7c0.1744169302.git.hezhongkun.hzk@bytedance.com>

On Wed, Apr 09, 2025 at 03:06:19PM +0800, Zhongkun He wrote:
> +		/* set by userspace for anonymous memory only */
> +		if (!strncmp("max", swap_string, sizeof("max"))) {

This pattern of strncmp("foo", str, sizeof("foo")) is exactly the same
as strcmp().  It doesn't provide any additional security.  The strncmp()
function is meant for matching string prefixes and it's a relatively
common bug to do this:

intended: if (strcmp(string, "prefix", sizeof("prefix") - 1) == 0) {
  actual: if (strcmp(string, "prefix", sizeof("prefix")) == 0) {

I have a static checker warning for these:
https://lore.kernel.org/all/30210ed77b40b4b6629de659cb56b9ec7832c447.1744452787.git.dan.carpenter@linaro.org/

If people deliberately misuse the function then it makes it trickier
to tell accidental mistakes from deliberate mistakes.

regards,
dan carpenter

