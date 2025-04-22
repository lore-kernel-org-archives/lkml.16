Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA19E190472
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745311996; cv=none; b=Rx6ONz7Q3kE71KwStwmkqrr95k8CbpBvbhox54xIDhukGLXrOlT3dt8hPZx8pi+pySYzOF0299Dnllry+mrZa0KqwNRsrbmqWx1cRxmKasu2junAFrVD3tYnrtV89gOu6ioR2o+bgxq03w72PzbG7NRXxHedFMobrN0xSKWorn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745311996; c=relaxed/simple;
	bh=zqMm+4LlaDew/KOtPb4bT84y9g6n6l7Zkb7k02+bQw0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEgAhzgyNsz+djzHTy0HdLOG1glck6/YxLkv2hphvr1h5rZ0pOgNe8vC3FVBtUUcy/5ZJltm/HyIlbzwQ7MN3w89Dp38Jqjq1eChifxgzF18+wZZX4wKiKeMoKNm9WGKiSL44GOSO8zG64e+cMrGKVL9bMhZfG0evqING2S+e6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkmyb+vH; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkmyb+vH"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54c090fc7adso5234458e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 01:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745311993; x=1745916793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B107IeEBYcdTeNa+0WuZ0QSN98QiHvhvMbSv+mGPRVo=;
        b=gkmyb+vHLUT76ByPpuRqyqgJtfXgEXwK3apoSO5yleVLb3uKGpQ5voU3dQtQOCMk+V
         JWJgqMlQxmPHQ7k8C1quY0eSiooaHVddFmFqCfS2fLgpbpg/+C+xV5vGaZf7XFlrA4l6
         LXqzEk8bP5dJQnAI7N4JBSqjbeFu7tDZ88os/j55z2txDEp0VtjZAMJ1HKU56akSaqAu
         6vWgG34RJ+2Tik3ntJ/A5PXXHQljFL5iVRCMu+zdKG52lcSDqCMQ2DPNtvX9l9BTNjWa
         XFMXORj3alKZ4aoxk7IND/jWExcqGSDmr/6BDqDxQHPhuFirGCjJOhqvF4LjGE0u5MeH
         WHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745311993; x=1745916793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B107IeEBYcdTeNa+0WuZ0QSN98QiHvhvMbSv+mGPRVo=;
        b=n7HPQYmuuyhr2bgSET3H0eT0z9FDZoaphZQnJB7LVw7Cs0vGZ5dXzkBSq7hUrP5ea6
         8rt/LXPkCGXHo7D/v6CbtMeIdbUcgFu+CI289+gLtyCwFshU9w1SfhOH+g0MR8BBFn14
         gZxO8dgk0noU6L7dhotUDC/L5FWZb+OeDSlPZc9FRKUPOz6IWNiBqbK3XpWvlMA0oj3S
         nRazRn2Ofk5ShrcToxULCeAQklL7BJxP0qEileutkWAPXvMYPy3PjhOjMt0As7r80aLH
         aCLRzj8WnTsMkBywIM4LW8EXy4hSyxYMADIjBCQEc0PqWTyLHfpFyelX1kW4Nl6P+CMM
         5CWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXt4/lxNi0v9JSGmb2gGgtpuOjpylfS8rRy+/SyaI4ZPPffSByxkpfoMsRh4PTPCgS03GlTvAOhW9r4/XQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM3KDA3T0BChptMs0SSFHhj9Beg2L/feiFthPp6gzKofpqfzTI
	KBuueQgZ0OPew6rmA2koDfjpBjoSUWrozAoRP/h4QcOxhX5lMzfq
X-Gm-Gg: ASbGnct/+w9pZ1dwno7wOM0tDBSc8R+K+X1mKhDn4PheuBftGblvWU/44gQdGbXeO53
	Uhu7cAiZjMqStMwd1UIvozGTRraOrmNskG0knDa/KrEE8o3VwODuLRlAH6OD/It4ZRY8wQIAyUb
	eiTG4ev8Jw58/7w4QGDMHbsm3BqrVFyoAsyaM1Hn0o7ex8dLHyCb0ngXDBE+JZxprTLywFEJX7h
	mpeDifuUGbi2icVfrtF8HQ5khcHOSKLWGvph+3Z6so/CMBWjg7KNbHEFgRLMgRBlNuJu05BxeK4
	zSr9/MQVYne3vPb2SukSYpfJwL9q5SZpI4BLOBYDKCSl7Ls=
X-Google-Smtp-Source: AGHT+IHAzgi8kGpVE7gevRvjayWFRsuXzx8hOLHXEi1ai4Wwn6M2n3mAJLfRBCBCN3H/dFgyt5Lr2Q==
X-Received: by 2002:a05:6512:39c5:b0:54a:cbfb:b647 with SMTP id 2adb3069b0e04-54d6e6589fdmr3933538e87.37.1745311992492;
        Tue, 22 Apr 2025 01:53:12 -0700 (PDT)
Received: from pc638.lan ([2001:9b1:d5a0:a500:2d8:61ff:fec9:d743])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090826cf5sm15574721fa.87.2025.04.22.01.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:53:11 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc638.lan>
Date: Tue, 22 Apr 2025 10:53:10 +0200
To: Baoquan He <bhe@redhat.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, urezki@gmail.com,
	shivankg@amd.com, vishal.moola@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] mm/vmalloc.c: code cleanup and improvements
Message-ID: <aAdY9o8TeNi8G8bN@pc638.lan>
References: <20250418223653.243436-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418223653.243436-1-bhe@redhat.com>

On Sat, Apr 19, 2025 at 06:36:48AM +0800, Baoquan He wrote:
> These were made from code inspection in mm/vmalloc.c.
> 
> v1->v2:
> =======
> - In patch 3:
>   - made change to improve code according to Uladzislau's suggestion;
>   - use WRITE_ONCE() to assign the value to vn->pool[i].len finally,
>     according to Shivank's suggestion.
> In patch 5:
>   - add back the WARN_ON_ONCE() on returned value from va_clip()
>     invocation, and also add back the code comment. These are pointed
>     out by Uladzislau. 
> 
> - Add reviewers' tag from Uladzislau, Shivank and Vishal. And I only add
>   Shivank's tag in patch 1, 2, 4 according to his comment because patch 3
>   and 5 are changed in v2.
> 
> Baoquan He (5):
>   mm/vmalloc.c: change purge_ndoes as local static variable
>   mm/vmalloc.c: find the vmap of vmap_nodes in reverse order
>   mm/vmalloc.c: optimize code in decay_va_pool_node() a little bit
>   mm/vmalloc: optimize function vm_unmap_aliases()
>   mm/vmalloc.c: return explicit error value in alloc_vmap_area()
> 
>  mm/vmalloc.c | 61 ++++++++++++++++++++++++----------------------------
>  1 file changed, 28 insertions(+), 33 deletions(-)
> 
> -- 
> 2.41.0
> 
LGTM for whole series:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
