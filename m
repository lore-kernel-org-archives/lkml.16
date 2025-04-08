Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E13215798
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 02:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744080297; cv=none; b=KiMw02mEhBOEySD/BacXz40CQFjbOALNOAKAZrMWKP5pWKuwrDIlLwfo5wqGHXH5F3n9/1qbU54I5Ka2gssz7CZQ8YqGaoCCiu5Yk4NJP4CupXevRoHJxaCev6ieNNAFZ8PLEYBgwX842zWGan1vu2w3ZLBgA0hS/FNdmjxs8pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744080297; c=relaxed/simple;
	bh=iWxvemNBYjvEqfzf1xQ8uYXWUJ1YhCHZoVYw97TFXvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SsOPFIJf/xtmvKCwskXP0Aa7MgurqB6o7x8uHMHrIrNlQi/wihx84NjkgFuZhDBK2Zt6pLLVJJytk5uEzp199e2j+bF8DDcXIIxzDg2rq2NVaR8W2bqiHBT+gyFpIiFa1dL8wwjiaeqpLdqw8S8mxHGb/7vzxuSOvyp+1e5kp+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=J0Y8qw5p; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="J0Y8qw5p"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-739525d4e12so4460054b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 19:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1744080295; x=1744685095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHYsYt6MomkIl7F9y0PfeyDugJcu7HVSAIBbjfocuDM=;
        b=J0Y8qw5pQUHpqCHdVNJZ+hmwWThpiwUI7KJBfq7ZVm5uUiDLiAZOTrL2y5WQ4C+Aah
         jFUC03UWmkmvsgePyahZzZwr6RRmGH3RHEeNWrtC+SWT0IFH0zseNzNXulpOQ5KO4n9B
         aUetEwx0kkwhepFAVY7Gb1/3XytAWmt4fELKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744080295; x=1744685095;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tHYsYt6MomkIl7F9y0PfeyDugJcu7HVSAIBbjfocuDM=;
        b=k31qgsPcc/mF3iN2LY/isxjpBlrX1zIPixCXe9J3SQaQgONg/wJkIqv0I/57DfAAuL
         EBSo34WsNNOOuOYuP6Z2GLTt7CuZN9Gvms1IVnNSwFL5GeXNK25dm7u3E3Hte6TkUbI3
         f+VM606vrq86YSE83Gx4z/VcNGAYrU+XUiIIWh9rmt0RdnP3Ce3jSRMozVPdBqNzKUQg
         DQTUkVew/lPmyTSloqaKJNjgfOTW1xztvVzYGly9nK+c0udBe2E0RkwUPUqDLg1+utW1
         Xy7ZvGq9FqqQIWiE2kWNW+U8JtstjHUNpjpKibClDuTXQsRUXyR3/8+OGGsYtod0bPnY
         P3kg==
X-Forwarded-Encrypted: i=1; AJvYcCX9/DnVgrO//Iun6zKXrojQzyJKHltVZndyFzDaAaXLgemSTNpc2BJQkVyXAZ0xCkCsU+QfZxHm9yBvtks=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeZ+/hqb0q6W4kR9Ad/0fW44IS+pCi43DP5yL3nlNR+EWSlQbj
	0LBQ+kJPafQG1pZvEYr73jklFHpS6HjNZoZdaBfi0iGPVEeipWyobOvVMBvdCqU=
X-Gm-Gg: ASbGnctQ2iEuGacxAsbh08HnWSFtYki2C27Dr31TF1ftv4zxlOzepOMw8mWBXgyjX0R
	5MbZty/jRwryaoP+EC1us+zzPnhyKuMFqI3Y8eWtG5BPZZLic623wm7FYOp0BVjt3LG6g0EF+jm
	rLff6B4+poTMPH6X5NIN0wz9VnfHJ3BwpLvF8DPRtN/Nb0du8e8x61ORz3k71OzutpuTkPH9KNe
	mYxH4gYYPFfbu41ngfjpuPitgUv2AxylAcE4MkBRcD5MykVoAoeR4ChFAkPbuXKWVwxRUIu7PCV
	qVoW3WSd0m2IQOT7OxxixJu66B1mLoXys02pSZ7xSe7ELKLTk92gFPI88/fYxz3zApudIY++Ikv
	kadGvDnwod7Q=
X-Google-Smtp-Source: AGHT+IF8c8tbfJL7Tc+eVNs822MO2Rrs+FLwJdu7yuVU6P6f4x0rmn31/NkizNyw4Y9jdApe51pJGw==
X-Received: by 2002:a05:6a21:6d91:b0:1f8:e0f5:846d with SMTP id adf61e73a8af0-2010472df12mr25513369637.34.1744080295388;
        Mon, 07 Apr 2025 19:44:55 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc31d4d1sm8075554a12.21.2025.04.07.19.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 19:44:54 -0700 (PDT)
Date: Mon, 7 Apr 2025 19:44:52 -0700
From: Joe Damato <jdamato@fastly.com>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: jiawenwu@trustnetic.com, mengyuanlou@net-swift.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	duanqiangwen@net-swift.com, dlemoal@kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: libwx: handle page_pool_dev_alloc_pages error
Message-ID: <Z_SNpFmFXJwjWATx@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Chenyuan Yang <chenyuan0y@gmail.com>, jiawenwu@trustnetic.com,
	mengyuanlou@net-swift.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, duanqiangwen@net-swift.com,
	dlemoal@kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20250407184952.2111299-1-chenyuan0y@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407184952.2111299-1-chenyuan0y@gmail.com>

On Mon, Apr 07, 2025 at 01:49:52PM -0500, Chenyuan Yang wrote:
> page_pool_dev_alloc_pages could return NULL. There was a WARN_ON(!page)
> but it would still proceed to use the NULL pointer and then crash.
> 
> This is similar to commit 001ba0902046
> ("net: fec: handle page_pool_dev_alloc_pages error").
> 
> This is found by our static analysis tool KNighter.
> 
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> Fixes: 3c47e8ae113a ("net: libwx: Support to receive packets in NAPI")
> ---
>  drivers/net/ethernet/wangxun/libwx/wx_lib.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Joe Damato <jdamato@fastly.com>
