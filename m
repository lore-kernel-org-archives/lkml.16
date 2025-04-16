Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D754D347B4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744790722; cv=none; b=jEDzoJVAp+MxNIfwM4Eqzx97fi1GecgJ0vssf2QvZ7Hnc7oaoK8UPqUIEZxRYXyfObA+u+EFsd7sy9sITut6Y1fHZuslumvrXUbiwDoi1yXvt2Sqer+tgWNwlJT8pKrXf0iEjDNmzA6HKYCSxQhGNCRErYeeMGyfgsK1E2p8ops=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744790722; c=relaxed/simple;
	bh=WsWHta+JMAg/6F0TNR0UBnNl/C11bjBp6muXAtHOYx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVANOuKbbP7649s+B9VhZ2BlhE25uM+5XACZIIXkM5/fbdD8MRqDHjyBIRI7wdHGZpQez3mqXqy8QfileZuYf0ZWKKLqig6uXV8Bsj3mSla8pfAz+e27zBdSIZc+FTpehh8Ix3Aeg8ol3D/iFA7yxfcdcdB4EAZw8AtIE7eSjgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XSRdqTw+; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XSRdqTw+"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736e52948ebso7303295b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744790720; x=1745395520; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=inoGsYpigja5jTUghwsLjcEVgXmFJ+nXb0AjbaYD9QM=;
        b=XSRdqTw+n1Mam73vjtRm0CtBFwy/BcuWZNAE2njoNHVVtskrjTWhMxgff99BZ2tIBk
         ywy2+kw5Acv0GGgr36N4tkDxofw8eXi1sqdfQHPUKpxYmsPJpjdFXM51HgqixPRLkoi4
         Oo0T7EE+Q0VfduFebDN6ALc3K+qubXKgi+wb5nWaENZYDm9YPwlsmk4tDGMW/LeGarUX
         zCIwowcNGf2FZqSALUtoquLizeLrSTNQRyxglR207eiELjH5CBNu9zWD5eW/PFhNISW0
         pwsAS8c9SZLuSjmkAZB3OhNudsXArzbGdQSwmjeZu0VsF0h4aEbRZDy5rl8xPeBVbQ+J
         H/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744790720; x=1745395520;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=inoGsYpigja5jTUghwsLjcEVgXmFJ+nXb0AjbaYD9QM=;
        b=s3eUpWuAS0EjOn+P/dQUAWXUkfeMl05GzEy5Y+/2pJuzcCUGStY5P5fQbtW/6U9e0X
         xfhs9jSYatsMl8yfMH8oL/s28uFpI0QWmA7uv9tSBGMuf468SQs6vJ/L1e8e//Vsq0Xb
         PDX/PAI/MCXReg0g02jbsDhLsRWF9Qth7AXqVL6NszcI2ZmGXYTbCyxPvxYttb5BcKEG
         8c3NjI6ZJGuZOEoaSL//+Jj9GS1i35LUCr+I5pDlROZczBNB0aoOMuOn5gsF238vXSZZ
         oe5v8DKLyKwvNHomQ3Y7dEWbrqlrFMnoXAZTJZ5AQk9WSG2ByFgsSjskTjtPfS+a1svb
         hhVg==
X-Forwarded-Encrypted: i=1; AJvYcCXtleMmKRqqkJDXu1nd46rpjlFbvVyf9aicuIF4NUCfSSnHW1WJeRWIE+p7937+zztBKcyjDXZERdqap4U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9N7agTTOdAR3v2D1KehSm65pXR7Mn81NkVGJyBHib4nE9lNDC
	lGnCsvRy7V1OgF4hvmAnAgrPdHljzcVKlzStSG5Tc9H2LvMhqDlECS5uU7JKdh0=
X-Gm-Gg: ASbGncsdBroQ4Ktk+4g2LqFNAmq6EbqQZDgtjdQtD4nnQrAN6Ni+owmRSjhhw2sCvjh
	0zTJ3yDBmZd9YhLHHG6HrcANqFbfGiUgTwGfY4dMdd2u1xoIH8E5Bhrgv2fcrg1Af/5TpSnWRIo
	Y5hWKN3Aj5XPby6IDOjxtbxTu6meLqPcU+C69c2AYoPobgw7sQr2qkIZGI0OiYUNHBNesGf+K+j
	F0sFIUzYjI6tgmvbEAm6I8qiqW2Mgu/qT891CmTHUu/6P+yChDasZ1IhOhne5Lx2ntd4wf+/Gx6
	4ocIAOxJ+8IZbsrpyz+JPScR6eHb6rzBMsk8+mukipe2J3CARhnb
X-Google-Smtp-Source: AGHT+IHE9GKOiXUJRd9ZbjDhVSEPnNsM58LQq5KKO/sJrxGQ10BPtZiiagmUa7v9I1/Pe/Ala+WMrA==
X-Received: by 2002:aa7:888d:0:b0:736:baa0:2acd with SMTP id d2e1a72fcca58-73c267f1bebmr1314183b3a.20.1744790720067;
        Wed, 16 Apr 2025 01:05:20 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230dd17sm9721455b3a.129.2025.04.16.01.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:05:19 -0700 (PDT)
Date: Wed, 16 Apr 2025 13:35:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Chun-Jen Tseng =?utf-8?B?KOabvuS/iuS7gSk=?= <Chun-Jen.Tseng@mediatek.com>
Cc: "cw00.choi@samsung.com" <cw00.choi@samsung.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v3 1/3] cpufreq: mediatek: using global lock avoid race
 condition
Message-ID: <20250416080517.feansrkpycsynk6t@vireshk-i7>
References: <20250214074353.1169864-1-chun-jen.tseng@mediatek.com>
 <20250214074353.1169864-2-chun-jen.tseng@mediatek.com>
 <20250219054209.erwfp7sgzchaiuds@vireshk-i7>
 <e8337c5eee0cadb797bacf26b00f1ca303c5147f.camel@mediatek.com>
 <20250321045624.mwm2mnkqeow5uids@vireshk-i7>
 <2a73b5ca35692c8ffa68c9ff0df73e24a592967d.camel@mediatek.com>
 <20250321060148.adhxjexpnm4dkpnt@vireshk-i7>
 <e1c2c12bace22d1803d16ecbfb32129518d87157.camel@mediatek.com>
 <20250324054333.sgwwksawnybx3lp4@vireshk-i7>
 <06356a55cdb3c34dfc716349d1967f95655b0ab2.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06356a55cdb3c34dfc716349d1967f95655b0ab2.camel@mediatek.com>

On 14-04-25, 08:42, Chun-Jen Tseng (曾俊仁) wrote:
> Hi Viresh,
> 
> The CCI level choose by Max_Level(LCPU & BCPU frequency) in devfreq
> driver.
> without global lock, It may choose wrong CCI level and cause system
> stall.
> 
> I hope this flow is serial setting like, BCPU / LCPU set frequency ->
> set CCI level -> BCPU / LCPU set frequency -> set CCI level -> ......
> 
> without global lock, it could be LCPU / BCPU set frequency -> set CCI
> level(during this time, it may change BCPU / LCPU frequency and cause
> system stall.
> 
> I also can only do global lock on ccifreq_support SoC.

As explained earlier, I don't think there is a race here. May be I am
wrong. And so I need a clear code path example from you, which proves
that there is a race here.

-- 
viresh
