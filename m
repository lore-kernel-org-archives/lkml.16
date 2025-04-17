Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5902D2550C4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 17:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744909587; cv=none; b=ddMGEQ738CoHG6BkTZYgzFXvYz78MtWIRZ3TaiApIZ/ghMsjNAd7TWZEfJR4zF2eln99MunqJRi92GB//0+qrrTBd0LGBItUWtJcYJOxUcUE+0kSSxUxSLMRH0RNTE3jbwKwXzZ+jc5yCXQt2ssIwSy6I1vkR9idyi5FLwPNcJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744909587; c=relaxed/simple;
	bh=/rayCc9ocJT3K1N38tkBInMy2zbXnfq0bzNX+4YFKNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DtVMqY+R7cJtfxkSUPOOzsQgoktnNmuxUEk/0MdwETSNX34gGx1BMZ/EH2cmtPC9SGgzp17rTA0kPkfufitITH2afu+5Iy3xRvfZQ0cR+4dsCAOtclUio6DKmMLIx69WSAudAyoHDp9ybn20fnlCa7qj1NkMBnhMxXl7+A1wICc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=qZO7cEJ6; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="qZO7cEJ6"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736aa9d0f2aso1292496b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 10:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1744909585; x=1745514385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4xXe/XCInddH4WV/KVFfoKsdbwZ1rzQJBQUNYtkK2yw=;
        b=qZO7cEJ61kijisuzXtc7rEeQIPG/iMvwgr3lCSu75ur8oYjseyjrCQHWJz/tzP+V2y
         6Ro0qfd2V2tKD+oaGnj2Mfi0dhJF2Uac0JXx/+yyetjj2rU0T46Yh2EtJ7sNxvcrSsuY
         F6bsto+GohhwqfQoxu2bgUz/ddQcaBsrkRpz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744909585; x=1745514385;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4xXe/XCInddH4WV/KVFfoKsdbwZ1rzQJBQUNYtkK2yw=;
        b=Aq1ZphkqZ0vjfVrKnYuXFMLgO9aR0GhT5RnrYFpuaJFBZV6WLMw/tQNmNn8Qc9AhN7
         s1W1sOW8Cqs3/5H+b1mZZpAWIQsulL6MhCsEhqANKWQShMFvY4tlo3QgLXgwFNWwkIp/
         FWzfVbqdp6uzWX3Sn4fRnD9ElGg6Md+EXPdF85kOxewgJ4q76P7cxpOOi28Wxbrd5T5w
         7jEI9QNw1l5colryBY2ZRqwbFQY9Lsi3FFAK4RZqg/Zw5xcSXV6hEhUwx98FvePYU3b7
         ZhjTZsyu8UzF34rO85H/P0zqI3MZxF2CzKtx4LIX/ikrQivt9V1Pd8lupQlk6yNryIum
         xXhA==
X-Forwarded-Encrypted: i=1; AJvYcCXhRy567XrR51lGH9wOi7WQUz7SzPTNpo/WJYWyU5K1HC8RrJx+2NfbPMkIhw0s8/Z8oQRb8z820HzSl/o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Q0cEBLYK9I72NVxULaPUNlisN/p0U1/cyEBC3kvmYU4L5nae
	WIzji+RAnja3afiscObp25NxAXy8+9vjWnF15f6krt9CMovOuX+/Mkz5qqmWlcU=
X-Gm-Gg: ASbGnctHIbukPMwM1J+JeABKR6Ifys9cXGNNYHWpDMG3Rmh4Mr3JvqDmcifvNhvfuH/
	hhgaw8CU91STbooT3P6S7AAcvGQSgWjWOHKmICVLyfUObfFWw9lROY8qBrJOgr6yUKpEr2/bZ6P
	Qb4aFU1CkFY4FfFOEA8kki4RN4xjAtP8UmAntzyzygAq1rLeM9hmMP4Ee3Mld1rc6BVE2XR4ArT
	z59KsHeCTeNtOlZznPvUSbZtO48lNi9vSjf+ORkMPOEGRTuxV4vhlHZjz0lBaUc18ZFAYwD6P7x
	sDKQHkU3H2eJvG1D8QcZNL58+WosIF39/iVSblYpp8AxjNIA8hsydKPPhE2dNpHJx8Z90uy6ckZ
	90qjPwm1jA9nSlb5Hz78sI/M=
X-Google-Smtp-Source: AGHT+IE7lJplDSFz7ARLg9Ar2ZAXnjAKyTmuyKanO9eaaZPdP2fa0Yk5XsKE81dhgmyhqhOavS+vQQ==
X-Received: by 2002:a05:6a00:710d:b0:73c:3116:cf10 with SMTP id d2e1a72fcca58-73c3116d5f5mr4731684b3a.23.1744909585513;
        Thu, 17 Apr 2025 10:06:25 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8bf5b9sm93861b3a.19.2025.04.17.10.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 10:06:25 -0700 (PDT)
Date: Thu, 17 Apr 2025 10:06:22 -0700
From: Joe Damato <jdamato@fastly.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	"open list:XDP (eXpress Data Path):Keyword:(?:b|_)xdp(?:b|_)" <bpf@vger.kernel.org>
Subject: Re: [PATCH net-next v2 4/4] selftests: drv-net: Test that NAPI ID is
 non-zero
Message-ID: <aAE1DkYpvb1yUp5_@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	"open list:XDP (eXpress Data Path):Keyword:(?:b|_)xdp(?:b|_)" <bpf@vger.kernel.org>
References: <20250417013301.39228-1-jdamato@fastly.com>
 <20250417013301.39228-5-jdamato@fastly.com>
 <20250417064615.10aba96b@kernel.org>
 <aAEvq_oLLzboJeIB@LQ3V64L9R2>
 <20250417095310.1adbcbc8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417095310.1adbcbc8@kernel.org>

On Thu, Apr 17, 2025 at 09:53:10AM -0700, Jakub Kicinski wrote:
> On Thu, 17 Apr 2025 09:43:23 -0700 Joe Damato wrote:
> > I think the main outstanding thing is Paolo's feedback which maybe
> > (?) is due to a Python version difference? If you have any guidance
> > on how to proceed on that, I'd appreciate it [1].
> 
> yes, it's a Python version, I made the same mistake in the past.
> Older Pythons terminate an fstring too early.
> Just switch from ' to " inside the fstring, like you would in bash
> if you wanted to quote a quote character. The two are functionally
> equivalent.

OK thanks for the details. Sorry that I am learning Python via
netdev ;)

I did this so it matches the style of the other fstring a few lines
below:

-    listen_cmd = f'{bin_remote} {cfg.addr_v['4']} {port}'
+    listen_cmd = f"{bin_remote} {cfg.addr_v['4']} {port}"

Test works and passes for me on my system, so I'll send the v3
tonight when I've hit 24 hrs.

Thanks!
