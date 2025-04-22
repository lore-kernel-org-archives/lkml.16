Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AC82153DA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317469; cv=none; b=cBrt6FT1K13XYy5V5qB8suuK1dE4fF3lZvUBN9A9XUBNs/UIJeYCZdbCD5RjV0SflkiL8TDxpFTvVBVNh3zn0LPrMj33/NwpvNXMAwz4aYUXbeZjjFkdHt+SGL9/oB0D0qVPxtfoVbyc/37dJMcXBkxufUGzGSRyACjoYonAmzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317469; c=relaxed/simple;
	bh=SgCvUZ2Dp0RNubBkgcpghs+gpJMLGKE0/0/7IcZzQyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YefIR3VgfhkCMR5jSsfjHwMPK364S6k1UfLrYBBLXJeaR6ZuQyVascNcV4ylx/CQqQ7yDSbcRF9PvKQcN2/3UTcKUJpDo5JEYsZIWNb+bXCWpYzteWaOMNioU9xPfRX5hReUC/AltNOrY0tBnxNKF7KVQPfNIaj4PlZaS98xtrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QpWEkbCG; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QpWEkbCG"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso3472642f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 03:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745317466; x=1745922266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rGpR7DHAu3crb15D4InspITnPezktxxxhM+Ewq44KWQ=;
        b=QpWEkbCGp9JY5duWuwOyD42AjKuQA6fT9QrM03bAUHnjjVoiYU4PYVG1GjMKBd2Exy
         pN99M/rhjZiVpTIhA7m6I8HlXU1J6fhOtPrNcU0VW0Jlqvjnic4+WE7IXsL8iiqgiL29
         X35JdXg0HxAd1gQ9vZlXHH1y6dvGQmcrXye8VtJowOIaj/MBEUMwi8yrmUhfhOM+fLM1
         1Og8a+ArJCxPmipkYE9GDAjUT3UkNMQKAuPRnc25wpF1nPWkLTUvIa4lwAOlytk9rl+B
         1fy9JqNj7XiYzwQCa+i2wMxEKZA66p3MjAxgA6C+UsrWkXmeuynXictud6uwrAfXaZo1
         oO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745317466; x=1745922266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGpR7DHAu3crb15D4InspITnPezktxxxhM+Ewq44KWQ=;
        b=PxKEqlJ+9HeWdhgPqiXj6+lpWIcjAmO5Z+W65k0JL3y5XD3yc/zSbD62qz5fBr70yn
         XYz8MrpdlonhixbPYQOtW4dH8SyFE/gbId3aLZIawNaQZFSuXwWfQmZ3ufySGVT2baz5
         wZRtAf5BkuyAGtkSpFop4BAk07gQwLSH+5ASvNHfGflhH3jFmAmfi9eyd3mx28lHEdLE
         poWQzB508BjR091jjV3gXk5rooewGZtb/5EnIRIZAciPf82HzAagmqGjGug6UYYkh1VT
         nH7lLZMoXQvfUkLlIjOF2UE+UYuu0n1qxGb3+dROOO2mdoENzAXEIkz4tSKUdd6xm8qt
         9j8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXg4HpgGbWTafLi8T2hq4AhgxmhYDjuyZzGW2YibGVaNP6+2+aoLmAmfVeoZ7j1pUfQhuXxyvjLY6HKQsM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaQ9qfRQFpKW3b/XHH2a4CYtWIVYTisds9kPv+0uK2RUwvwoAJ
	oRqjzI3zwMtUV4AVyv4pjCs8aeEC6UV9U6wFzLXEXclAHUuOwoQLGZAVkqm68G4=
X-Gm-Gg: ASbGncsQPfGAReAYEKwFKzb0XtcDYx3nldcISMD7sOkqELCvJ3/ndaGD+Mnyd3rc1vD
	o4rA0uIb5AxJ7VMIr7jI1xDscFQKG2lVsFynO2iSSRldEDb/aYZ8KMNQvw0asMTSbb8yBbR3+Xm
	ZVoXKNVc48iypVyF+x+2wTAuA/a6jKK5gccdBWW4LiXjlFgYFGcaHfKN0ZfP/4+HznNksUDDGdW
	o4tNr6r5x6rrwOgny2nc6JNLsxIoLoj5ZrW7F4Azd1k3W3svBhxyzS05J+pBU6BM1B18uPBJkYB
	5quoTM7E7nxNk0dBP5rWc7GKJvYl3mq3srUs0VzoKOdPxQ==
X-Google-Smtp-Source: AGHT+IHutLphGbGE1hCdZLvaGiMQTDK82f9s6pbuK+KpdDS9Fqw1DprMwHPrbtUhvJfTJXHudGQhPw==
X-Received: by 2002:a05:6000:40df:b0:391:ab2:9e80 with SMTP id ffacd0b85a97d-39efba51048mr10695810f8f.24.1745317465705;
        Tue, 22 Apr 2025 03:24:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa43330esm14497713f8f.21.2025.04.22.03.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:24:25 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:24:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Su Hui <suhui@nfschina.com>, davem@davemloft.net,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] crypto: using size_add() for kmalloc()
Message-ID: <2169828c-127c-4bf7-b953-2f1194b72830@stanley.mountain>
References: <20250421055104.663552-1-suhui@nfschina.com>
 <aAY0lyWzsRVDge_f@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAY0lyWzsRVDge_f@gondor.apana.org.au>

On Mon, Apr 21, 2025 at 08:05:43PM +0800, Herbert Xu wrote:
> On Mon, Apr 21, 2025 at 01:51:06PM +0800, Su Hui wrote:
> >
> > @@ -433,7 +434,7 @@ static inline struct aead_request *aead_request_alloc(struct crypto_aead *tfm,
> >  {
> >  	struct aead_request *req;
> >  
> > -	req = kmalloc(sizeof(*req) + crypto_aead_reqsize(tfm), gfp);
> > +	req = kmalloc(size_add(sizeof(*req), crypto_aead_reqsize(tfm)), gfp);
> 
> This is just wrong.  You should fail the allocation altogether
> rather than proceeding with a length that is insufficient.

When size_add() overflows then it returns SIZE_MAX.  None of the
allocation functions can allocate SIZE_MAX bytes so kmalloc() will
fail and that's already handled correctly.  Meanwhile if
"sizeof(*req) + crypto_aead_reqsize(tfm)" overflows then the
allocation will succeed and it results in memory corruption.

This is exactly what Kees did with the mass conversion to
struct_size().  I occasionally run across places where Kees's mass
conversion patches did fix real integer overflow bugs.

regards,
dan carpenter

