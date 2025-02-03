Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5CB43172
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 03:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738554591; cv=none; b=StUxu2uP8vs4FqDTJny1eiDF8QY9ZXTZMlQdVk4qQ2nwVqPoCt8Hsa9XBdyYeEmptdyWbsWTulKZJpJvqystVf7GfhwenjJivwaugS5EogpHJlGk1W9NImviDsjCwW7qSeFAEVkhc8Goh8kREN/s1kdCIAl05CuWgAIBcfEp1CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738554591; c=relaxed/simple;
	bh=z6e88tQkW47e42iVcdTr6rX1sSGv5Vv8+FPAxHMIMYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APhfSZ8VDP0MqxBo775fY1SzOa7wehUmL2Kx1xFmCsJAblJl9hmGWtxWr2Q5LGGuk1Z1CpdSytc1aXIIWSVhE1zcBWlcmTds+sfMzJXHw5BSVpdpdQ7l7LMZMf+mfcDycihYXT/nKqo7Ap8xlgPLk4bsgPf0Ah+tL2lF0FgKy9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nvfwBW7Q; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nvfwBW7Q"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ef70c7efa5so5129851a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 19:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738554589; x=1739159389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/lQ2Z8Dpj7uKLQom+qHTSsO8xHrv+IjBy1dtKyJZ5zY=;
        b=nvfwBW7QwDqK2Fz1U/mHUbTm3tuPBRhIJpE30y2oiLJg58Sv4g4uySEfVwrhFHuKZf
         GxWbjeUhs5dSw6DHLmoNqwVYA5VcTLSCXIgZKEBK3gSTZkQYbSlZNgzjdnsyQt85soXg
         beWMsL15vKLf+gXCEFKik7KhpKbSvXEBM0nms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738554589; x=1739159389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lQ2Z8Dpj7uKLQom+qHTSsO8xHrv+IjBy1dtKyJZ5zY=;
        b=VCZfkk0FCbkRKCd9z1456CJUQvkAcAn7ErX9ik/yOu6Wwum+zO75xt/kwvSo0GGPMH
         A7uIuB982q8kfW6lcgpJSuO6m0lR7F7cM2cvsRKECtre2kodlhZArqiTDH12vWFWyE3q
         JSzuSnQF60NK/S7OPXpKBfcIp5K4RyV01r+qAcqHXtqutWjYo9HhK920WtH5vu6Qs1vV
         CcmMnTL5rgkRrRRxtdPmkGTm2eJB+kyLHuA6EadNENj7HFP2QRhTfhaKzUETyfBumsPL
         55LDm0hHMsisVBqvZW4W3xa8Qd2CDAZ7CylTK3EKujjqiKWmG8aTWihxQ/yij1ZbN82z
         4AFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMicgDtk+wbKcILjB7Fvnf8/d0/OCR79ayHZhzjXvywIfTyLclRubzoAVyZOXZIFiW2UjcGcLgFsbjEUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXOo6415PUPfDr3EMqpbu5QQe3E8ppEhCEC6z1m+8C0xj7yXqO
	S0vPV3xmR3202lPjOw8RhqIb6rP6FlcHiFDOXLBOEpVDFG2mYVJ9PyfquZza5g==
X-Gm-Gg: ASbGncvf+AmrLKezsvpVMC9D0x+kIT1pa6Q/tPXF1ocjJt0C9JLrgEELwGTYRoIMH7j
	uQZfRzA8izE7El3war2BRF+O7K5B+w5sJV+MS0UQJ9DIxjr11HLASCpK703Er6YGmt6saq6uwlv
	MUP87FLEiBcqytBPxcT18ilSS0B2GK3jeyzu670f98A6RHvmegv2hawIXAA57hVnpOGyTABY21R
	2Tu8L5tqPl+I34vZkef+GGjxmsaMf7oLamj6hjulWWoPgGRksZXKq6WVxNSW3ywTYjtC2lG/KYS
	XBlgW1eJgyeSRSC+
X-Google-Smtp-Source: AGHT+IH9R5w/mBIKAQhPXyg/WVREUR/j8hfEG9f/yQjcZapINnYhqZ9Qu7LmxQntVPblYbIfaD374w==
X-Received: by 2002:a17:90b:5387:b0:2ee:5111:a54b with SMTP id 98e67ed59e1d1-2f83ac8ad6emr28029765a91.31.1738554589043;
        Sun, 02 Feb 2025 19:49:49 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:f3c0:b0:250f:9437])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bf95b44sm10210749a91.37.2025.02.02.19.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 19:49:48 -0800 (PST)
Date: Mon, 3 Feb 2025 12:49:42 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Kairui Song <ryncsn@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 02/17] zram: do not use per-CPU compression streams
Message-ID: <ryc3rgu567q44d3ck4un5itf77i2os4rqx3ruohivaqscn3rrt@ms5xoipyi72q>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-3-senozhatsky@chromium.org>
 <CAMgjq7BFUrUY5Xq5Eks4ibqbWgJcca1vqB4kq=otQVyG=23FRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMgjq7BFUrUY5Xq5Eks4ibqbWgJcca1vqB4kq=otQVyG=23FRw@mail.gmail.com>

On (25/02/01 17:21), Kairui Song wrote:
> This seems will cause a huge regression of performance on multi core
> systems, this is especially significant as the number of concurrent
> tasks increases:
> 
> Test build linux kernel using ZRAM as SWAP (1G memcg):
> 
> Before:
> + /usr/bin/time make -s -j48
> 2495.77user 2604.77system 2:12.95elapsed 3836%CPU (0avgtext+0avgdata
> 863304maxresident)k
> 
> After:
> + /usr/bin/time make -s -j48
> 2403.60user 6676.09system 3:38.22elapsed 4160%CPU (0avgtext+0avgdata
> 863276maxresident)k

How many CPUs do you have?  I assume, preemption gets into way which is
sort of expected, to be honest...  Using per-CPU compression streams
disables preemption and uses CPU exclusively at a price of other tasks
not being able to run.  I do tend to think that I made a mistake by
switching zram to per-CPU compression streams.

What preemption model do you use and to what extent do you overload
your system?

My tests don't show anything unusual (but I don't overload the system)

CONFIG_PREEMPT

before
1371.96user 156.21system 1:30.91elapsed 1680%CPU (0avgtext+0avgdata 825636maxresident)k
32688inputs+1768416outputs (259major+51539861minor)pagefaults 0swaps

after
1372.05user 155.79system 1:30.82elapsed 1682%CPU (0avgtext+0avgdata 825684maxresident)k
32680inputs+1768416outputs (273major+51541815minor)pagefaults 0swaps

(I use zram as a block device with ext4 on it.)

> `perf lock contention -ab sleep 3` also indicates the big spin lock in
> zcomp_stream_get/put is having significant contention:

Hmm it's just

	spin_lock()
	list first entry
	spin_unlock()

Shouldn't be "a big spin lock", that's very odd.  I'm not familiar with
perf lock contention, let me take a look.
