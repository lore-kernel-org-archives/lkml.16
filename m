Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8E42DCBE6
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 07:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748503911; cv=none; b=JtuZUIvzE/r35eGC05stjhLyjmH2uSa5mU5lAC3T7z/sZcnhXqzMKL4oNnmeG5Kg0j0gkw6yezGs3In6JQR8WXgRzRjyU4j95WXniGPOSAQ/tXwSg/4TVsbxbADAXWhPUPu99gPNLNDHoMqsGIGgP6/Vup6qoYYawIvTvpAhjTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748503911; c=relaxed/simple;
	bh=BFxCceWMxY0SEICuf5EA0saOeCuLQXtonksnjpgX6+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G10Brbh7U46aNSRno10kjOXB+h14PQ1OK3kJAAg+b1H+vSC887QFsV3zgVb/CKy03Xtm8Rt3cGF7zmCkZ7jBdUHRe8I7XHxVuneSRNot1VrNA/gjwTEzGgkoyKkNxwkq6XYkUvmoC7Ku2VpdnhPD7OpPhMEwLjpPML18pzSQXCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EOvxWJ3u; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EOvxWJ3u"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-74068f95d9fso421229b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 00:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748503909; x=1749108709; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=62y5vxiX9AVUW2V52SBBgeurxZxG3fCF/i4ngW1ZYV8=;
        b=EOvxWJ3uv88bCaXYGGZPhPYuQwLLhLvKeE6cqUFRXFv15QSpySVW+Q5b5eiGHQ29J/
         +cs7IZ6cjNm6tgP/LXSHVBXxLblIaGGqNdz0ZcnvDDRQp8bOb0IoNEe1sNzt8QP1LkMR
         N0OEu02LyIzKOrXIQh8PiIl/zj/01Y1oAogaJISLeGxEZi5aVqoSaXtT3Z2gsGu53QBv
         MMNqXj0rD+y+ONgBzTkjI5H0CBNbI60efU2TyoF9wtrS6rLencx5BtowDHxEEeDBuSux
         CUirAhNdr4L57VtRMuFKcY+gHVjVmqTwnFT1Ampj5qJ8DQUsZclbleDcVL0SYkRUTU0V
         nkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748503909; x=1749108709;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=62y5vxiX9AVUW2V52SBBgeurxZxG3fCF/i4ngW1ZYV8=;
        b=RYw8DNNiBQEFY6fBYEHGaIHfZ0bdI6CooA+Ik4EQNsOsYXV8HiWISSwK8Ac6umbi/0
         wLPg5yLbxn3d1qaciYJ1ESeH9Cbw6CgLqPjumxF4OO6cbvL2Jc58Om9JmnGW5glw9Gar
         Nm3KH6oxELRd7NijfEr+FeOZd/nsZBLD1wFz9UPLXnILrpUCwH9LWy8kBHc+jbEY4d6L
         r6dWl0SxUqX40kFlO2gt2jjfR4MWL/5WjimdWZEYi/SZIkEaM2T8N+Fls67CgoOsKtDJ
         CgRSQAI9IfkaBPQiZIMO52disD1aBDE623UlHcduem/9GJwCXfCeQ+yeMgfmz0SGMqCU
         7+VA==
X-Forwarded-Encrypted: i=1; AJvYcCW0CdR4hUgeWGUqMiu7Gkt7pBB5HhQFnCbaBeVeBdSVxXzXQI4S7GjnB7ZNaj2zUN4rhbsgEzB+aMcKXc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM1McpIT7yWRJF9I25riOZyOjXofltNnxxoCxnv5Eg1CNQRGm1
	mrdVL2M82o04CfXl+u1GjnnU41jnGzGlpqeBp/8zxvgIceZ/3j20rnW535ifgrzRftQ=
X-Gm-Gg: ASbGncsbcgy5a5hbD7e20n2Wnqj+uQMUfRKs9fmVXerY9Ra6iKD1Drr7uUdpYtM0S7G
	7N+D4MhJYJFDsX9ExchSwdJQ7AAFoh22ivfMe24qQ6DY4Mk1IIvuzNblE+/AxanM738ssLXFaTG
	rOoonPd1XHZy6smv6GcBuJUknvoSqJtaVIEMWhGOeJGfDX7HHwur6ox++oTDoq/wQSgamOdgcpS
	noj9mIHOUqv1Ae8AzTvB6ZlMgaEHLHerT6wXHWRQgeJrBmEy/lddEJtoDhl3xgwG6QFzZoAcvMF
	mjQ+dio0MEPOujm086f6VhFtoYsEjqjKI+NSNFODM/CxGgWaqkvxANhpshuxJoE=
X-Google-Smtp-Source: AGHT+IFdl3yeDqGbsySeFH3EsP9AcF6U1idqzjnmwCHgn9ExUS6KfoHWBKHAHvMS270b21x4Yy7Hwg==
X-Received: by 2002:a05:6a21:3409:b0:1f5:8e94:2e83 with SMTP id adf61e73a8af0-2188c1eddbfmr31156339637.8.1748503908727;
        Thu, 29 May 2025 00:31:48 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2d99ec762dsm2149640a12.52.2025.05.29.00.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 00:31:48 -0700 (PDT)
Date: Thu, 29 May 2025 13:01:45 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] virtio-mmio: Remove virtqueue list from mmio device
Message-ID: <20250529073145.ss5ejipnlbl6v5fj@vireshk-i7>
References: <3e56c6f74002987e22f364d883cbad177cd9ad9c.1747827066.git.viresh.kumar@linaro.org>
 <CACGkMEsfgGU99_NC3NTYgyH89=6eADKPFiChVW0kZkfF1Js7NA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACGkMEsfgGU99_NC3NTYgyH89=6eADKPFiChVW0kZkfF1Js7NA@mail.gmail.com>

On 29-05-25, 14:05, Jason Wang wrote:
> On Wed, May 21, 2025 at 7:34 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > The MMIO transport implementation creates a list of virtqueues for a
> > virtio device, while the same is already available in the struct
> > virtio_device.
> >
> > Don't create a duplicate list, and use the other one instead.
> >
> > While at it, fix the virtio_device_for_each_vq() macro to accept an
> > argument like "&vm_dev->vdev" (which currently fails to build).
> >
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> 
> Acked-by: Jason Wang <jasowang@redhat.com>
> 
> Btw, virtio-vdpa may need the same optimization.

Sent a patch for that now.

https://lore.kernel.org/all/7808f2f7e484987b95f172fffb6c71a5da20ed1e.1748503784.git.viresh.kumar@linaro.org/

-- 
viresh
