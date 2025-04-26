Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322D1A55
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 00:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745625850; cv=none; b=m35cUzGzUNYux1rol53T4Ba+sc3q7p8M2UaH66xqnsmvQ6uhFK9IRnmvRGskkG06RjEnaqXLPXcHgl6XTSS/50m75k8SOfXk6snl9h5lJWUOh5OPJJmTT/0w12KpBp7OjcmQLKQeZBf3dV7Bzw6sUiibjcLB5hhc68XQpZBA4C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745625850; c=relaxed/simple;
	bh=MbjGITwUvtsTWjuSKgwhf+PF0YnV5wSJ6uOrmSM77cQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SKPQPpkKAUUFQgYFH37p/4s92ypgIacphPOZDcIDm5Z/gNqJz7i4H9SjUEtUYVr4ID4tBQlRn+MJhMz6flskpeFkBXsM4ekbPaqjG33hStdiJ5lOYZDdaJdgwl9gutaL6qDxgWk3e81n16Ss0EHFOeS/mVqZ7XijVoslhDM5rH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=3H2Cl73L; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="3H2Cl73L"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c560c55bc1so340977885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1745625845; x=1746230645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2H1oHjaYjf3btHBmR82KW7qaxLzIr6eWZYLDaZIXmcA=;
        b=3H2Cl73LULPRzCtAtynAIHw2koPnYbfFeWvphSoB6k56/I58ASwW2tZvn4KquXbVB/
         S4klv3BJs4xbdqkAQNdZTqE8mSZogX09xr/z0NheIQqGYElUz8ynKnRWk9UdVZx19dAH
         KdnN0XycDClLIObVY5ZSgLjgAHOMoo67pILiHQzaaoSCfF3lHtBvIG8LBSD7A5kXgZ1i
         QagracVFAxQN4pXxVTMi9E3+Sk3eNp38fX04ixON48V7mDgY8j32/qmtzT4VxNn6wIdR
         VhfOjvuJuoMDKHlQk4/eRJ7wJVYjYYBPRjeaHwWB721h8D4p01tDIbw8nG6LEjjCfuyX
         +oDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745625845; x=1746230645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2H1oHjaYjf3btHBmR82KW7qaxLzIr6eWZYLDaZIXmcA=;
        b=FQP6+Whj4jHxT2zSsGcwM9eLWej4l+AkWe7iB33RonLgl481NQFrHOBcfIxYtoDu9K
         K2vay7dzdphMz6G8CyYuLesoAp9xI+G0WB6BJpx/RiSEQsIkiWG8/0by6s3nPGjZn2lP
         Gtg8cbZ8yp1dZYHcVe55Xw5hk1myzJgCpvmXPAlQJaKDEOPazFtlTlLPJC25+IvAr25F
         t5YBp/z5ozRDARht0cGp+Mh1gQ6aYc++mkaEUqD0svyv+6zi9C9b8Wwy2ejwsfSeSkBB
         YsxLbhVdAw14Vy7Qt/YBY+Y+paNxEGZaAvPFhwNhBamQYoGUQ51qzrNQ6VxwAkPSnEv/
         ULHA==
X-Forwarded-Encrypted: i=1; AJvYcCUDABdOsYzQuopUkgOY1ebjPiOSKWL2W26NemCE0CiQeE0/lgCGch8kRkBzPFVegCkm4IvWc0B9QhFO2nw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW2sWMJ9HuoT9tQZO5XuWWNtLTAO7OyExPXQ/ek/p0hLB497oD
	mtu3ABYRqQHKPUmDYxfEloWMc/NUA9A5ik7NKrlUEHDFGOL7DMGDjPez2HhhroE=
X-Gm-Gg: ASbGnctsDp+DpopugVL1F6iPw7YlhR13pA4Uml7hxVuA2U0d4GRQpXO15H2fzYxNgcC
	cwFr6CTgFeefJ41dnGF3PPfQvtoEJGQ1lv4DcppqdXGQ5Y5EaZpak8yyzKuX7uGYX3VOjTXywJ3
	S+80WwkmQCmJe2idvXUT9iqaLJr7vamVk4HUoDRukbo3V60Elb+Pjg98Lr3GMOC9Hmc0DAi2NHN
	jBN6tWv50DpHmHa5hb64NaLzZz9c92SKfBc4Z1f91EYgTSewwTKObOrt7y2Xm2O1dVXpfDo1hwV
	KvSPrQt+lx2FPwWuQx+ASkpE+hTa1yIMMTBZ77tOUi0M8IZpzzV4z732ih3UxEnuPOIgreWi5UW
	28JkUhw==
X-Google-Smtp-Source: AGHT+IGS0yFE108vCgvzYUlSwZkDLhPa5LlGuOaJreW/ipzxWx8E59zBMc1i+DzyansBvoUWNu8AEw==
X-Received: by 2002:a05:620a:414d:b0:7c9:1335:633e with SMTP id af79cd13be357-7c961975b8fmr676998685a.1.1745625844735;
        Fri, 25 Apr 2025 17:04:04 -0700 (PDT)
Received: from [192.168.0.188] (syn-174-103-227-163.res.spectrum.com. [174.103.227.163])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958c91abbsm283338185a.15.2025.04.25.17.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 17:04:03 -0700 (PDT)
Message-ID: <7ad12473-6eb4-4cd4-a3de-be5255d84a44@kernel.dk>
Date: Fri, 25 Apr 2025 18:04:02 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iov_iter: Use iov_offset for length calculation in
 iov_iter_aligned_bvec
To: Nitesh Shetty <nj.shetty@samsung.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: gost.dev@samsung.com, nitheshshetty@gmail.com,
 linux-kernel@vger.kernel.org
References: <CGME20250415182307epcas5p4853044d013dbc943a8e54dca0f2a39c2@epcas5p4.samsung.com>
 <20250415181419.16305-1-nj.shetty@samsung.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250415181419.16305-1-nj.shetty@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/15/25 12:14 PM, Nitesh Shetty wrote:
> If iov_offset is non-zero, then we need to consider iov_offset in length
> calculation, otherwise we might pass smaller IOs such as 512 bytes
> with 256 bytes offset.

As Andrew points out, would be nicer with a (much) better commit
message. Your current reply has a lot of the stuff that should go in
there, including a Fixes tag. With that done:

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

