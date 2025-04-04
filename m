Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16452847B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 11:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767241; cv=none; b=ntg1Bkow/oz+PRiLWz9l+Ab8N1Rl5mKQnzlRLc8+8HdeVO1owQLJIN9T42FqepJoSxCSNnJZfSdyb+L5eMhmvqE0ZZ0UlM6l/m9FtPqonFm6IPlrDOiRVcjMYUlMmfr4clkMOMIfDmVQ11TOoayrV2fRtMlIK1NIzQ62nN6aCC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767241; c=relaxed/simple;
	bh=wPPcnnB5KcUF6Z/rHkaL7q8cRxlq5b4nBxTxZ96MBdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGLo2k4e7l/r2Py6hxnHvAZuOfckn9wkfiEGEjctRaeE+zAWYRpZwFKk8h/Vp174b3ANM8sTEUOZz25f31aUWsPTMkcMF2vOGi3egxYVvpavQksArgYXvOHAU0l98rl80napA8kJBQajRSUczKQeoEtWJ0YbQXzd2PMkFlo94l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PUXNu3rZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PUXNu3rZ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso12506515e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 04:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767238; x=1744372038; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=foHY1R4cfF4wZYmB2kM8uswb/b+LSqz8E6rYMWvAhS4=;
        b=PUXNu3rZCeSM2Qfh9uhWHXShtbzvBFfTuusm4G9d1+VfwKmw6jZVziHlMxFMBcbKNp
         BlvSjytsIPaW20nPIipJN+WjEFgchWss04fzSCN93mUOLowkX8w4GsHexTzug+8Yanyc
         oHW9cHbKPlcJc6XNxdYEUatlt/ILzrA6M7uyyDGj8IVSsNNoQF7Iy7G6raP78WvAF3nn
         K9S004NJKHKbA42NQHrP132DO4fWFDAV5cgErFeUk3DtGRsSpN6y4ncugcjzGK2Ayo95
         ObC0LnBvIPeLhx3yHTjVBLzF/Ndf6q8s9EBbx9ZuqgFdBKK8C/dJtgQl7nCu7JL5K0Ct
         BxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767238; x=1744372038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foHY1R4cfF4wZYmB2kM8uswb/b+LSqz8E6rYMWvAhS4=;
        b=ippqU1ApempY1MqHyPXCyLuo51tHgL/mKfZfOCkaV8V9Y4Co8r08ktLtJfbv8tT27E
         L6qoOaEglVzmpCySlB4awpNhVy88rlfUZRNT33RmaRgu8S2juASQ07lb+7VZThF3ZK5Q
         fECZOsmPlCjlL+ZNQ1PVR1pLdnNkH7iGd3RuxYfR+iiETsPE9W5CMwu61th7ndxZA5Zz
         r0fcDQW4gDl18U/ohOLi9L/EhO2+r84bXCsrY1CvE7+9b1/Vh8yW39t3mhT8r0zL6j3l
         ZA2xteBrdB/Zo5zwleqPn8i5Y7afc/GaSoMA6jnriNV4Xqb0M/nvylWuUrZEaGonKe7z
         Jobg==
X-Forwarded-Encrypted: i=1; AJvYcCU53leD05qknrGk6vjzH8ePo4c5MyfxHg+kxJfDEGkMUAaxwopcF8+Hz2TLix7quztLVMvfgqPrFwONC5c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0cDpzL1bElex9UXGA+l1duNqbh3KKAVr+CIVuOqygQwRYUVh1
	36UYsKTYxvOBkrMss3JHr1Ba1W2nW3C4ANT6jKTxeIqUJ9tFr4j9QBRn2UTIvjw=
X-Gm-Gg: ASbGnctzHSeQ0N0z2/6i4+unoyYIdGQXqv7yQHZCKweb/CZNo3MbmGlr4XfoYU71+dn
	svl++XZKLPsZPk6/JzsA8AFGgxMAcNgAKm0g+Fvcdd0X8jU8D4o0FPHJwEHwn+rgYsPgpe60UDt
	WRjvV2E/Rk5HczUtf/4O0b7aWaP0DyduiASKDPe3ojxafdujDsjYkCKHEaNeMhL8JK/BKr2bKS8
	e41TsTMtyaozQT509dgM1TTnozjDAHpU3HWaXMg+KGYzO3dR9ZX71XK1faxCBwVIZB3Ute9xff2
	mDu8gAexSoM8U7EyoOR5KbfPOtHDng6Xl7gWyPzEooYrKJKuNQ==
X-Google-Smtp-Source: AGHT+IEn+z7u+lSPJLWOtn7Q6pSS9JHe2rPVPZmR3y2zmH/SRyuuPhwWUCfFa1TU/icWhcfsVbxRLA==
X-Received: by 2002:a05:600c:3109:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-43ecf57edb7mr31256785e9.0.1743767238380;
        Fri, 04 Apr 2025 04:47:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec1660bcesm46939825e9.10.2025.04.04.04.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:47:17 -0700 (PDT)
Date: Fri, 4 Apr 2025 14:47:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	outreachy@lists.linux.dev, julia.lawall@inria.fr,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, andy@kernel.org
Subject: Re: [v3 1/1] staging: rtl8723bs: Prevent duplicate NULL tests on a
 value
Message-ID: <2aa7d5da-c53c-4bab-8fbf-2caebddc9b7a@stanley.mountain>
References: <cover.1743723590.git.abrahamadekunle50@gmail.com>
 <6fe7cb92811d07865830974cb366d99981ab1755.1743723591.git.abrahamadekunle50@gmail.com>
 <CAHp75Vem1E9wmmfXWsbawj2f+F=UkfzML7HyAnhTdsUqvjW91g@mail.gmail.com>
 <33a8d769-33b9-43df-9914-99175605b026@stanley.mountain>
 <CAHp75VfDOaK0EXNc79cM1mNWapm7fhshU550q1mAKQdtRbUNwg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VfDOaK0EXNc79cM1mNWapm7fhshU550q1mAKQdtRbUNwg@mail.gmail.com>

On Fri, Apr 04, 2025 at 01:53:16PM +0300, Andy Shevchenko wrote:
> > Also if the change accidentally introduces a bug, I want it to be a
> > one liner change and not something hidden inside a giant reformat.
> 
> The noisy {] have no point to be left. Now I'm curious, what do you
> propose here?

The patch *must* remove the { and }.  We wouldn't have accepted the v1
patch.

regards,
dan carpenter

