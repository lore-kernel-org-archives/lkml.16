Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0041C2918F3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 19:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745523728; cv=none; b=Dvx7lyOfCdGloJG8BZ47pbXDT5oeixfZTd1f1rYrv/DZqPqw1J+IksSAwJR5Zx2mX2SC3Asjvvk8ZBC5b1W3yCddrQYtzsMje/yNnENSDu9mHtZ4nUfyoqLXlR3euklcNY6wbqo6CDGvahXlj9BA+Jr6gD5ZpyfdaoOyKt3iUXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745523728; c=relaxed/simple;
	bh=wCUxcytjyKJE4gd1msmOpdESE4Het2gH0KM9/BiYUK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQ/tJAAW1PvdCDdiDExXWaEYWdEIwIyl8qwmu6PnU/zIKsOjv6s+/Ag2DVA/mgnCXS0fnOipheKStPSG8oJpFSQep3EJHjM8b++LrbLwNro0OgAFDGy25HnJYi/1wJMi6JeEJgIUjTr5g0F8Fhj7GAVG364nQylHG/7xhUtr/xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=p/h7ecfA; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="p/h7ecfA"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47ae894e9b7so29637171cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1745523724; x=1746128524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wCUxcytjyKJE4gd1msmOpdESE4Het2gH0KM9/BiYUK0=;
        b=p/h7ecfA7tPUPCfXtaOmJBSJqEKIzeYWG4zWChNEbFCdRnsfM2bSxKJBWV2O4FNkQ1
         llG1K2juc2sKjcZS6Pq02BzwFK3/o8Tk6pBEkEl/xL1vee1thzCOUyPlp+e9QbfNJXRb
         8WQILblrWVXo4o+WY0njVxAAp3L7naAUOhGHTFwqueIscme3xCcIk0WwSmT0bfnmDlgq
         xp5INLioiZCFUhwHF+fLEuAOlow2P5HF105wQe4f0Gv9C4EEzv7gilQ9tI3/vadVT9DY
         YwebGRRAyAxjBnB1tWPeWvO5T/HvbXOAQHKaIfICpRQgq8tB8Sbd3rspNEem3WGmcQ5W
         V+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745523724; x=1746128524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCUxcytjyKJE4gd1msmOpdESE4Het2gH0KM9/BiYUK0=;
        b=tHWVMPjyXVK4ylqeDWRnejRTqEf5rQ/XjVkCvxUhG7B8tshVCexmJ3w19L1SwmAWmN
         p1v33t6bc1DQGQDUW5iEJjFBroqIAu9/MEJ1tOQ4ltdeJySL+MyQdNrGqC5RsCBSvuYO
         R2NaZN3ynTvQpYX9TjG920y7d71pUm1frDBhR4ambJywOoDf2BhBdyNhu5OSpMgJ1H2N
         5ErHLlUCDwvM9qR+7ORa3uwAu709u8YhlEWD4/9MIvi3LfD6oFB5ekA3KfHwzvMaTtKf
         MawIvCJP4t69hsCxEJs9BlglFKBxov0D9GOJwXj7BTkhHMyltxTTRMBRG5GrwuoENSid
         OX4A==
X-Forwarded-Encrypted: i=1; AJvYcCUkH7ybweVhNcKtH4t3fZr2n8HCp9nL3jgp+FSp1b7CaFW+GrqUXX0DKdRWiFwgHfQf48EmmOCzH5Ex3s0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWAp0YswEdRIA8qt90sfdJ04LBafs3xtNY5QzzDFrZFpDYXoPx
	ghZYKufYNYK8cSCG1fOd/INqjzELxc2yFiaEmZty5ksTurDtesftUd62KjWKrVI=
X-Gm-Gg: ASbGncs/Bwow684H177F6NsQu3m4mWQGTgNg8Tar39aKv3McmS7YYDMIH9iNzNvj9C+
	vGfjPJYF4BZ0Rk4D7f5Y4chIEvQGq6RgkVn6VU2QpIvhVtaLoMRrY/0QTJyFHaS/cJn/Q3KCK6T
	1MeyEYA6aTmAgw6+m/BVtdKjbyWua5ZTq817yenRdxlJwaJj+byAVX9IYK+lm8zheY2xWW1KT0Q
	AoLNsCFdWWlq6Zwu0UU+qq/CO7eewjSdqR+vlWvqMozN1o/erlAgthkD4sAU9dPjQQFVYKgAwRw
	0H9NvmCm17sGvdgMT2eG+PRJkaDuI/ptMOgRza0=
X-Google-Smtp-Source: AGHT+IFi3LJ4VEyIjGCqlEGjXcUudv1nghFRLmeUHJ8Ay36G9QFfg+zYzmtYqpRdiF1QEtXyMtZkLw==
X-Received: by 2002:ac8:59ca:0:b0:476:ad9d:d4f0 with SMTP id d75a77b69052e-47fbbc3f6a6mr12687681cf.48.1745523724698;
        Thu, 24 Apr 2025 12:42:04 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47e9eaf213dsm15603571cf.12.2025.04.24.12.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 12:42:04 -0700 (PDT)
Date: Thu, 24 Apr 2025 15:42:00 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Wenchao Hao <haowenchao22@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/compaction: do not break pages whose order is larger
 than target order
Message-ID: <20250424194200.GD840@cmpxchg.org>
References: <20250424153815.4003-1-haowenchao22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424153815.4003-1-haowenchao22@gmail.com>

On Thu, Apr 24, 2025 at 11:38:15PM +0800, Wenchao Hao wrote:
> When scanning free pages for memory compaction, if the compaction target
> order is explicitly specified, do not split pages in buddy whose order
> are larger than compaction target order.

Have you observed this to be an issue in practice?

compact_finished() would have bailed if such a page had existed.

compaction_capture() would steal such a page upon production.

It could help with blocks freed by chance from somewhere else, where
you'd preserve it to grab it later from the allocation retry. But if
that's the target, it might be better to indeed isolate the page, and
then capture it inside compaction_alloc()?
