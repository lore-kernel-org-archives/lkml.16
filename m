Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFBC1F8BD6
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 18:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744482670; cv=none; b=AgbU9lJSlCaxhr3Ph00jOhs3AYqQh6+75xKnmqnxkI2V5DgZU0H+i2LjhkwJWVSLdAHYk3b1/gwi+dujAX/ONep8OH3achAxkWUWKEcyU6v0mBk3blSWzR1tOWB5o+Wc9TRvax6worGz00SKJzsBjgEE+ulO1Jdljlxz2WkQMvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744482670; c=relaxed/simple;
	bh=UXWTbPpVMi3wyEEzFn8t+68PK89c4a+mJ8HY7oopugg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xrq8Y7s9xH6ZsbloWNvYNg15rx0ZXhqO9ogKJuq/1w+P61miqwYGFqaEtq+xPwIgXWMsRa0z6h0lSfEg9RstMBRgO/T11FL0HaoDo/QnCfuQduOqagKmhbtcQ55wPLozikE+65g1Wp4IoBOopSI86PffYSvDa7Yyy5K+2kLU1pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VPnnyI7Z; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VPnnyI7Z"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so26007765e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 11:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744482666; x=1745087466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3CyrR9KNkaoIb+djhhX7+16j+DQ68McNR1nNH1QOCtU=;
        b=VPnnyI7Zyl95p1eP3iF0Rjo7IgOUK/ixCTmtTrln3TQLOQX+lTXVj6OWA5jY61Hgtx
         mVJ6YLixpcayFjWddRu9kNNyQkUiSac0r6nWck054BLWZusYkyuNBCTEgpDbVPlheIXT
         CYHvFjp9jQ7J4au5tDMVReIlQ3e0L8nk0DraehaQPa9RvpkMSLm0AP08PbmHcvDJKuxp
         XCFuHz1CIngXkL8XBIsGEHaaWfXKtk6/oEFnva5MlRCABxmu8SHTnKJZzV0W7du/HS9p
         DpmXm4TaUEfa538XDTn8aUNbLxn0VAGzco5iM+Hbs0Asmwkhd/i0P3guwKCLb8AlMK/J
         vDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744482666; x=1745087466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CyrR9KNkaoIb+djhhX7+16j+DQ68McNR1nNH1QOCtU=;
        b=Plfj+CgzOvQFRgmg341EbdPl4N6PqDuLzK7PIdX254sP+oy/J5hVMAnyQmKgY8LoWu
         5WHJ3GK9QTcrLkS8wYNGANHo97qQ45I7/mGbsz3N7ODYG4bwD1BgwWcWK2ZNDEJxrGtF
         POo+3CEIn14e9vRoWM7wzO46d38vvme6D23RD60MCVABCTO2hYw0Pgfx4OfBIERi27QJ
         w1Jpmc1XzxSaKO61Z6TA2tOgqTLJX7D1zl6AOyKmlmqRPDfRkHJLF829hu4FPO5/AOBa
         ZNA7FBkSIDLwACGyyrdqllJuVfPEOtOLuRBsIpw435Mj6m++G1vZXOv4f2iY98DDSsPP
         m9pA==
X-Forwarded-Encrypted: i=1; AJvYcCWerLqvhw/zq2IuHeXeIiAb+WvwDLlSEW5IJZr0dLWGx/HhJ74UOFw3P5IZZSK++yDGeod09EZ6wpVIfYo=@vger.kernel.org
X-Gm-Message-State: AOJu0YysbU1NbR2rodFednn4WsElpUYZQhpLlSzDDDgnkA9Al1iI7L/c
	mSjNT22MJuCzkIIV1mzFiFhZwrCQkPrxGpTygP+KMkqWdEeRfpLvxzvm3CTVOBI=
X-Gm-Gg: ASbGnct9vrf7hyMd/H/EWCjtJVtP0fymN+EhL7mIyZDVTYt+OPJPpXBUJAiQephlY+H
	pcQXEZRnheeqVZqgGNE+AUisoNkIfv5sC5g5Ai9qLYXoWmVovT3EW0l2IIspAepGMudUGDCn1nU
	yWGg65umdyROfvaA0918d9SLeqT/MotibkBfCIg5NPsVgvhOy/1Eta+lZcLCrxc+AqrdZje3l9x
	U4+hRnRrtNTMYyRQjWUN1LJ2+1352lMxxrmhE29J7mBwjGRfN5F7JKh0bxQo7vFisJdLf/lh4mK
	nBQ+XEAhX16YbzwRPEP7SMPf53tkILsOxiJFCYUZQg1toQ==
X-Google-Smtp-Source: AGHT+IHARGq36rcwuoUqKZ76aegRkcgHirTp4EATHkOfGBZZRYyZYhGL+bYneAm7wceJLq4bHfWKmA==
X-Received: by 2002:a05:600c:a53:b0:43d:fa58:81d4 with SMTP id 5b1f17b1804b1-43f3a9afbbdmr59892105e9.33.1744482666250;
        Sat, 12 Apr 2025 11:31:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae96407esm5776966f8f.17.2025.04.12.11.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 11:31:05 -0700 (PDT)
Date: Sat, 12 Apr 2025 21:30:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org,
	viresh.kumar@linaro.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: scmi: Fix possible null pointer dereference
Message-ID: <0081fcd8-da99-47b2-b136-3ea04232046a@stanley.mountain>
References: <20250412180831.3252963-1-chenyuan0y@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412180831.3252963-1-chenyuan0y@gmail.com>

On Sat, Apr 12, 2025 at 01:08:31PM -0500, Chenyuan Yang wrote:
> Check if policy is NULL before dereferencing it.
> 
> This is similar to the commit cf7de25878a1
> ("cppc_cpufreq: Fix possible null pointer dereference").
> 
> This is found by our static analysis tool KNighter.
> 
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> Fixes: 99d6bdf33877 ("cpufreq: add support for CPU DVFS based on SCMI message protocol")

Henry Martin already fixed this in commit 484d3f15cc6c ("cpufreq: scmi:
Fix null-ptr-deref in scmi_cpufreq_get_rate()").

regards,
dan carpenter

