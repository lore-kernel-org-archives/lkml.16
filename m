Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B4B4C98
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 12:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748090848; cv=none; b=FMXCboYPNkC8BDW/dpk9amv7bvNw5KANKPcrJFc5vi7ykAmNrMI81kkXfG4bQmcL15EW2j+3danzHc+lVUfjHNE5Cxc/DZf3ULXcjh9MUc4cNy3AHz1n3ulH/dXH9eYOsAZ1mTJA4PDQOPp7WbFNhEegKngH5GgW6jr5xgQes88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748090848; c=relaxed/simple;
	bh=ijUDYdDsiCYuyjQz6cOVB4vV8ZrUp3UUkJZE5ynxgOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eyA9/HYWrsQ6Q5Lzd4dwR8bBQxJN3iXbzokO4pWqrnaCmBEAhc3Sy/druZC1XE3Fr5s9ZyFPKocIqFTr9zmT8Srhvnk+6CE7CBEXWSSwxuGNaqYQSVe0WSvRWoGrWghP4lj73aHOI/c3KnNnUyZAFgVPLmI3sBBpN7tHYSrFqTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=S3pHJknQ; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="S3pHJknQ"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6fa9dced621so6434276d6.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 05:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1748090845; x=1748695645; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ijUDYdDsiCYuyjQz6cOVB4vV8ZrUp3UUkJZE5ynxgOI=;
        b=S3pHJknQSNCmFW7vs7IJCObFyQPbkIwXv++3i1SngnXLH2vlETMsLZbIH++/7Dz+oN
         tx6kA5fjBMV1iLKHBx0+gk2SiHSLiESjqsLAq+lYDn4BGrTknHMjdXv9O1/unufAwptr
         zm4LuzMugCZZZUsjR+3n2FN66ZvwhXq8Eu76D+VJja2cH30U4K9ZYmalayu+NgVwYCmt
         cuZESKojrQiji0R5Bknrf6K/JI56jiNSgjTbTwX0/GzbkoOlARFezd/IFH0OEnsUneCB
         B++0zFBSxkYicRc0gdJWYK4ih4wmMEqsEOavOJEy6KRJ0nXChs94YQ+rxRQ7t3cdWgaf
         grzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748090845; x=1748695645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ijUDYdDsiCYuyjQz6cOVB4vV8ZrUp3UUkJZE5ynxgOI=;
        b=fg+1N/lGECGCH6Wr6eVFF2Mca4ZYrNLDNiEg0lkUHxktKZtzaJlaeD82/ijsX5NZMu
         o6JLr7CKJzE3RiyHye26bOZFFEE/1tN/oI7kvalar9uTAXwA/FK3FiT4mXlxOsX7WbEv
         bxMiy5ElC7ScIWU0UtyvmBJ///bcwbc/slWWVHaQ1uzJBW0XlK81v5MYrmVbJMuLqxHQ
         IWA0mQkUnyJFmFRVIxBS8IrqD3azgTB2l2rENxAwJ0R2yu6oT7U3UHDWnuQ/q3r6JFE4
         kbjLy5bLZXxADt5SN46oNCTByUaKWZ7PApTFPtttbJSHuXQmleMUE45kcKOfZktRD7Bj
         7mzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnV5uu6DTApylfxvwF9tJbKrJY7rgb2IRdJjOkdnuZyEGLoZo32pr8u6vKRZVk2KhoiUJZGaeqepDNDEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVxrR0HrWxLcJYTme4U1Xlognvxffm24KLOQzKusE6V5PfJ3oC
	DBw+uSb6kQaPtF+MY658GGKpRwKyU21EXG9t5AKaEdkE5mjVHafsFOZisBiGgvYawA8nJ1UPaSU
	7WRDk6Gp1pFQl1JUU06wGEFDXMNQbCFWwdgjNcnQ3ow==
X-Gm-Gg: ASbGncuZQCBrOLEgvbTivJdvw3x7cd+6alFQJJFsZPcF/9sTQP1zIgRNqC1XGgA0iZF
	88E+RVnoeYBbRsuDf2XmBECIvJAUEL2cFc0u/Ys3ws55bjxuFshAkdSgUIWSO9mbg/p9eXkdjYw
	e4XQV7d5tmLBZyKPukblHyG3VSva7vhhQ=
X-Google-Smtp-Source: AGHT+IGJrpaXggbO0XyLY6WU6SWTgZC9F8s7Hf3WwPDR/lbtMX7FQqhOd0dkVj8JEzPGo+APzIftTHlFkeC/LSVLiBg=
X-Received: by 2002:a05:622a:53cb:b0:494:9e0e:2129 with SMTP id
 d75a77b69052e-49f3505f1femr51220641cf.22.1748090844750; Sat, 24 May 2025
 05:47:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522085149.3361598-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20250522085149.3361598-1-jason-jh.lin@mediatek.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 24 May 2025 13:47:13 +0100
X-Gm-Features: AX0GCFvBeLD8sRxyqEm85OLAoQZjo4C2fe9icGhm_Cxkm7__yWuuXUFz1KdCsJ8
Message-ID: <CAPj87rNV_48pQF+gv3HEx+-n1WvKOoX2u_HRW5w8DrgEAigk9w@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Add wait_event_timeout when disabling plane
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, 
	Paul-PL Chen <paul-pl.chen@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>, 
	Zhenxing Qin <zhenxing.qin@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>, 
	Xavier Chang <xavier.chang@mediatek.com>, Fei Shao <fshao@chromium.org>, 
	Chen-yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"

Hi Jason,

On Thu, 22 May 2025 at 09:52, Jason-JH Lin <jason-jh.lin@mediatek.com> wrote:
> Our hardware registers are set through GCE, not by the CPU.
> DRM might assume the hardware is disabled immediately after calling
> atomic_disable() of drm_plane, but it is only truly disabled after the
> GCE IRQ is triggered.
>
> Additionally, the cursor plane in DRM uses async_commit, so DRM will
> not wait for vblank and will free the buffer immediately after calling
> atomic_disable().
>
> To prevent the framebuffer from being freed before the layer disable
> settings are configured into the hardware, which can cause an IOMMU
> fault error, a wait_event_timeout has been added to wait for the
> ddp_cmdq_cb() callback,indicating that the GCE IRQ has been triggered.

Waiting up to 500ms for each plane to be disabled is ... not ideal.
Especially as multiple planes can be disabled at once. This may happen
dynamically during runtime, e.g. when a video is playing and a user
moves their cursor over the plane to make the UI controls visible.

I think this should be handled through the atomic_commit() handler,
with asynchronous tracking of the state, instead of the hard block
here.

Cheers,
Daniel
