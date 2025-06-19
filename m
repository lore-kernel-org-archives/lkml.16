Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6895C1B6CFE
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750310991; cv=none; b=hl6lpnZVb0B6YCTIhCvhN5GBdrKbzLxqZ47AM3uQAc+p2uW4Xpgj979rjXH3N8iHm5x2X403+QGaxW9n/nBzPQeSXBVdS+qZRAjG8l4HHT5NTK/I+GUtCIXZ8wnJ6sPjal3SzqmcXAPFZfM83JEmVGcNnZXsjBWCTvjOWMWflI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750310991; c=relaxed/simple;
	bh=Q6mJE1FrwhVKG1y6OW4fACJwCs7O6gqcR0V159taI0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hS+vB4fK/ZHkeWyDS7LUk9TOeKggyAX3RVk5jzl4beh0bNsuLvXZY2Q0RQN98s+fIujBZeP2orrvmTy2p0lePHsSLBFIppiTi1oMvlBKxlpD7tle1cUqdEAQn8MUPyDIhqhFMToYWyA0BcZdrsgTmddXU38aTMnCSFEm7MPOMgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wuj+uGMH; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wuj+uGMH"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7426c44e014so303439b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 22:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750310989; x=1750915789; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DQS9Lxe6KMVKWq6jlz9fspv/s4lvVJZPXjqcxfFFWDc=;
        b=Wuj+uGMHuo5xB0CIZ/O8Pqo35utQzdZvIxdhAx2yn6aTlk6BSDML4N9iM8A3YFcwqL
         HaHjYvxEX49/jGkqccn0CZ/+KclNCZA2aTmR2BhPrjNtBMbRCSkrpgNpXubqDo5LQvne
         nRi2QHoRhMsWmLx59hgDlvFnlElst5D9b2NaVW0/0bYgOp6El2t+FTTZX2TgbVpELhgE
         YsHBfempwTg2YmMue0ekkbiJAob4NklOlR615rMGN3lPpYwG2DHTcveRjLcVFs3piRHT
         FzSfumVg4RQ07Dxkpnau3rbCXO578eTPxT1sYSlPUASNYmc7YlJY6wBjOtTnFXygA1fo
         V4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750310989; x=1750915789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQS9Lxe6KMVKWq6jlz9fspv/s4lvVJZPXjqcxfFFWDc=;
        b=qP6U9N+idaS/sNpNgh+MfoXjnAysrVHy2qcslJv9stMmJKO+EhlsM0oeCgXBbX6CZE
         AY25AEGw0oSzP3vvUfo3E0pSD+zbj8eibWaigs8PFpilTCPyo87fywqkKmrufHv1N+6e
         SDB11MbCYzh1oVdxgWSTqdGs8FiwzRuEiaLoRyT27Nz/nI8dKt4CblT2yRqvK4qeShcr
         Scl+qZxY1t3Z5OWiIvmPPj02aZQ3XIsHqqO5ndpyaSH8KQsr1d+pG9Ovzz+Sdf1vrKGr
         M6DkbfZesbUPWnMUFnzEXd0nuO1zgcQiTPS8e3Pell+rIKKSmjzUQ7eMqM5fW1tNW/a6
         7G9w==
X-Forwarded-Encrypted: i=1; AJvYcCWNQmMsstZy6b9Xg6qDs6UZBrkJnb3jMguPyIpF8KLgXdxE0T7WYVA60ndzAXI+HVbcIxSKTqAsV5bwLzE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU4pQqpx8hEjuuw3sPud/aarRKHfPNqRICaL6BRSrS7jF/1G5G
	TaGeNQDi2WyySplw4w2sHfDeNclHbVjMb9bRwYT53L049waiydY4wQ2TcrxrEhYSu7g=
X-Gm-Gg: ASbGncuV6ca8xQygo1V8nzARpAM1tiGLTi82JJBl//JTgheSBrkEw/StxDDW1Mb4o+e
	fiJA3ypXJi7i6i6wd78DEbA7DLHq+WkqnQSOeUDyotes43fYqUGt/XhN30cxzKclrRNpuuVOb+O
	m7oTWlb6uj8tuT4HiTXGr/uHYgHyDiIxutZwpebwCUVl2uIBMDwYoVycZMYpO7Q1P5RNnrQFC1Y
	afnBZILkrW9Dhi5nO/Wi2N8amkl1+AjWjLvDiS3DYulEX3KOxN32GEG9mU1EhxK9FGo/3h3zLSg
	FRCLiQIkpHW9B6Vk5Bjr1ufIufey/mYmgck3ThnBvIhovg2unl9X/KNBdvMrG2Y=
X-Google-Smtp-Source: AGHT+IHs0qkQQ9P1OW9zuYuVIZrbXgPrpgwTWEkKN73iA54Gmmj/4HG7CqyvkiEQR/yv4yS/zeyBYw==
X-Received: by 2002:a05:6a20:4391:b0:21f:5532:1e49 with SMTP id adf61e73a8af0-21fbd5825eamr34809155637.35.1750310988725;
        Wed, 18 Jun 2025 22:29:48 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748e0fb4574sm3604428b3a.114.2025.06.18.22.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 22:29:48 -0700 (PDT)
Date: Thu, 19 Jun 2025 10:59:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in CPU HOTPLUG
Message-ID: <20250619052946.nx4mzst3rxyfxhod@vireshk-i7>
References: <20250616140108.39335-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616140108.39335-1-lukas.bulwahn@redhat.com>

On 16-06-25, 16:01, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit c7f005f70d22 ("rust: cpu: Add CpuId::current() to retrieve current
> CPU ID") adds the file rust/helpers/cpu.c, and intends to add a file entry
> for that file in the MAINTAINERS section CPU HOTPLUG. However, the added
> file entry is rust/helper/cpu.c; note the subtle difference between the two
> file names. Hence, ./scripts/get_maintainer.pl --self-test=patterns
> complains about a broken reference.
> 
> Adjust the file entry to the intended file.
> 
> Fixes: c7f005f70d22 ("rust: cpu: Add CpuId::current() to retrieve current CPU ID")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh
