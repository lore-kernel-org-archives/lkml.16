Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777722853FA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745331308; cv=none; b=acUloo5joNgtktRQE6C0gRcJpCKKrDpcoYC8WpO+j8dONATgLlRHjncYBf/bNQC3WO7l00CX49t3cjOA5Cis5Ap67R6Q1WDxkN8GA9QrkQ1D/v3lyQtIAOqXP1Qx5H1uNMwW+D9IaFZZ+6MnYhfOpdFbxnoWziS3Hw7X7Cf3i3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745331308; c=relaxed/simple;
	bh=ht/b8hOowhBPrZFB3PRaz3GwnJG9WOhGtjQrBFTFXYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2bJvLf70YEyAchDxhw/P1VYPrRl7iJN/bg86X02Q1qew0hA98SmqH14ttEqfGpJJoo1djK/4/ZjOO8kO/ok/NWxFQFI9QOZZZmrkovUWNdyK9vjnOt1q4c576wDjf728SzpnfhqUtNOuz4v/BSTyFkiqobyl4xuVLcNNE4xjIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m1Y+XNDe; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m1Y+XNDe"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso866838766b.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745331305; x=1745936105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VAPsYi7X25L/caX0EHEb02SNjtKsf53q45QaVhQBarc=;
        b=m1Y+XNDe8DEWAKdnmGGi5vdj/XWB24Q9VWs3dHEEMRFgWk673wuNmOpidl2zs+5753
         fYJAFFCocV0N2zoYS6NuaEw4gme1s2oFvtlKaMoeJ/2IM2O7Sp8dn0X1lrjdep2VgOiT
         1xG1bhk1ZPV5eGIBo8rL79O/qcjL+tUhnuqGrHiutUK+xpVEUIMlQfRqZKCNAx4XUpSM
         P31qxspVDp0qq7/AMfL/yN/9e/WOcz44li93JnhGmv2K+k8xbxcd0U8uOQWOgxlZlcie
         r57f6lqdhqvyV+mSOaTGfnPtBrT4BlZj9n1fru9sCxIz4ww9F3DuuB0HZ4fgI9TvWPCE
         eBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745331305; x=1745936105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAPsYi7X25L/caX0EHEb02SNjtKsf53q45QaVhQBarc=;
        b=tV75+njQBv6bmGlrcswOVuuLNlFwpoZwt1wbfQzoRSFVcaldpW7+VO++TovSy6duPu
         7fC4BSZRa7RzSLe1Gpvg366Gq7iZx1zcM2rQ209rYbqi92IMCXQAu7YvvMopWZCIGNxu
         4DtqrV613GzR4YqbX1t3XDbW425Pi8KR1f1xOuJhKST39cTqUqpYbathVNZWbPAa/emL
         Jyeh/ZNqnE5oP+NwRTRb20Gxu5MJB+wlBU7ezHA7Ay1l9XdM2F7J5BjDwMT46zhuWM+b
         yuQx10CAzboxa+eK+uyZPtdLbaDlY3yryJ6Zvjv/fSY4YpjV7+TDdKtE3l5LSDCUAk9s
         kWUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj/2q3qNTMWDqnwg9gFVwD+B+GSnu1jYN/38M65w8Hc7zc/JosO0PY0csW5RNZ7szW0zggiDZVxobYFgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd2ssJSFMkcPTCz2bpGeXnh8xtm+N/HhXxYbHkhsJud1sXjyoR
	4n4zzzvLzEScrwC1rILUThp81QjWved8BuDe1Ue5lZ7PPsEwBeNNcN4AI3euOUk=
X-Gm-Gg: ASbGncsWLfZXfQfO4BQMyg6jIWo7F1UK6h9FQb3nqQuY7pC2EOvS60bTDeYGJdFcbw5
	oCKYpSzaOIHs7sUDrdKgPsHARNSnA9UnDjZKEmzOChlFqKRktsL0wJGXjlvP2hgB12nFFJT7wo9
	oOxSiMHz7D3qZBoN3cTRyZVqfmIvBC+1Bl8DW+sczZwPITMiIbH2N4Ndp6cMXpO9ccKK/AuM/hq
	F6sITC/l6374pXxHaUJUIMuCkRV+Fo8aiSxHVcRKZSt7RntF4mo9J0Eema5FoLsmGohSQ+KL5/C
	RiDyoEl5/lF26S15I4Shv+alWk8279wXHrQWPQ==
X-Google-Smtp-Source: AGHT+IFeSK5uLgbn1NZKQrylDdRtKmBHDZDXywYGuDfa4NwCwFDz1VJZvajnIXoXSg2frAfCpTf5uw==
X-Received: by 2002:a17:907:3d8f:b0:acb:66ea:5786 with SMTP id a640c23a62f3a-acb74b88937mr1434632166b.31.1745331304772;
        Tue, 22 Apr 2025 07:15:04 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef468dfsm658630766b.133.2025.04.22.07.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:15:04 -0700 (PDT)
Date: Tue, 22 Apr 2025 17:15:02 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/11] driver core: Add dev_set_drv_sync_state()
Message-ID: <aAekZizB9lR8E4Rw@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
 <20250417142513.312939-10-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417142513.312939-10-ulf.hansson@linaro.org>

On 25-04-17 16:25:07, Ulf Hansson wrote:
> From: Saravana Kannan <saravanak@google.com>
> 
> This can be used by frameworks to set the sync_state() helper functions
> for drivers that don't already have them set.
> 
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
