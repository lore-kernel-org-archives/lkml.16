Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9763F297B86
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297767; cv=none; b=mbnUgR/tR9xFRL6vNSFh261GU0KH7ZavF6GgvyNgTbLuni68h7OmNqdWE/kdFz5CxamipVeOI34nMvZUN7lC1cQKSriYQzkjqQrj0BDY5NNdokrVivG/RnfNfa4McRVEIewES/ifNdp4g0NWwI4kBINc8NUJSI52FsEfkY7fe+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297767; c=relaxed/simple;
	bh=UeYArS1ijkGtKL5wk6wSZ8WWkjH3gkjimR8WfZx4mgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DgJFxS2KclSfcDeAEY07PMtXTxzGpV9I9mJWW3a7r3s/vBu+XM+UedFYiGx6Kwirqjo327SQdufdc/eN6Ywy7+uNSvMasPFSkpCXc2kQoPl9VPxIK1ruda2di3evF1jyehSS8hihy+3pcHqlk2wUyydLRG9h3ORLrg3coM9PtRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E39/xhv8; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E39/xhv8"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-441ab63a415so6705955e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747297764; x=1747902564; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QvvTZD6xjMgYWwxEjzxwhxIFlt+w29WI3exoLPokiug=;
        b=E39/xhv81/pjrXzQ6BL9YPWWqwdvso+mqp4f6aZnscbcRdf5PI21A5NgYcOPaYDXDF
         zvsTPJjEXwhKFSMLPuDiOToGT1ES6bCLppInBL3d8oPGJHsbqFFIIuhDE/vz9qzRq9xd
         PN3VjM6cE7CAppW5huEcc43tHSNStCFFJArC5PvpvREPWMHLbU5p1IRFzLs0woHVqsxi
         ru0Jv0bjd/PYj/VzIH/iAQSYUI8dKQahhpslHr5+3XvfVSFf0RFEbF5YB8nUrmAfx7JR
         qDUh1SfFGUmn7El6SVHeS1SjK3Ak49Rttw0EgqJuiQCZ0Yxtmog+C2mRyks1Ayyh3rAE
         YV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297764; x=1747902564;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QvvTZD6xjMgYWwxEjzxwhxIFlt+w29WI3exoLPokiug=;
        b=N5g+Y5kXKZoglN6YWgH0Xnwk4VWKCf65fOPUessKPvB5dX+vDdoiGFOnFyBF4ZYmGx
         E0s0Ka0bgWVyn3N/jM/oa3KOxY1v3kjM1TmyMUhkAdnEYrzzkvsZSIIAnpS5MUwcph0U
         0yBZTdvqgz+3lzhjz0qtUpGtcurDCzfOGHQEeUr46bMlIb6Hn2sIUIb78h9nSyPWB6J+
         M8Roa+3DhxjCuQ75TWlcYwC7rFfOXKp07TncDEdCr+B6P6NHMf7U83tQtNtFjSAJjIO2
         2tFnOQcvwoZwhUGtplF9kj/mlDFP1SmQBzBn3ocRRspnGYAg8+0YpgcMIchmmvZv5UN5
         Li2g==
X-Forwarded-Encrypted: i=1; AJvYcCXkA94WBs+lWrwSv3XVBeU7ceeH6n5pg55TPqlosdzup1p8Tq/IM50AxPy2qP/hN4y/vR0T40oZFJG3kXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDizzD1+gbBAUbeucj4sxtcInCgvC1SLks0mi9jeL6QWeNGIF4
	sWStXbhyay/utxlS0D4Wcl/QaHqGaGFpOhvdGW0DgMlXTbLa0EqQnNWUj39bYtg=
X-Gm-Gg: ASbGncs0MvIVqBqm+UyCYnJRqBsDQcJVL8U3e0qoaHEWduYLGHKHX2pFdjeMuxDxGe4
	SvBZhpjQb2+sPKdwd+aOi2NxI4sOwfdz3wL7YbAET6XkXEPLCeZ29shpOwKUv/nRGQY2puTkRsr
	XoLuYlI3WHSjW86SHv5oiZ3arcateYBAKs/7acFAoTYZ0KFSnGZ1p9IWVSHTU0Lkk5COes1iloL
	6/jlGo+cLOKqYE+ikfFCzogtVwcJKl/NfiVEJ46oQm+wkMhUbhZldLi1IlOdwF/sckU9532ao1v
	dDGEJ4Ek7F4hOfSgGvmqPzAug0PVy14TS9QARaKu0BykDpK8zXo3CnF76aIISuzlA04pAA527R5
	EZu7feRQtxdR9e8Sjj7la89Zb
X-Google-Smtp-Source: AGHT+IF10sihNIz4wz256XDOxcdd7U8icJxjPxfUVyNfZMzpJJdb6YNmdRmD2foR3y02vdzRglMqQQ==
X-Received: by 2002:a05:600c:1d9a:b0:442:e9eb:cba2 with SMTP id 5b1f17b1804b1-442f1dd6452mr64202305e9.0.1747297763879;
        Thu, 15 May 2025 01:29:23 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39ef8f7sm57962225e9.39.2025.05.15.01.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:29:23 -0700 (PDT)
Date: Thu, 15 May 2025 10:29:21 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: Convert st,spear-timer to DT schema
Message-ID: <aCWl4SfFb4Px9Yd2@mai.linaro.org>
References: <20250506022326.2589389-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506022326.2589389-1-robh@kernel.org>

On Mon, May 05, 2025 at 09:23:25PM -0500, Rob Herring wrote:
> Convert the ST SPEAr Timer binding to DT schema format. It's a
> straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
