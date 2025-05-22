Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C3C27A457
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 22:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747953196; cv=none; b=O+ntA1b0rlIs27V2aiYczwaZCgPsYptksMVBwY3UMS8w3ttU3Qmsioz95I8bY8trg3YVIkIlc6BViU8qBxg5YJbZ1lFGplh2Ek3RPEMqydoBJHhS28U1q4xXE8tKlYvuhSSIMDnsKu9QAfYbgMg40rC0rppUm3BkkSEIk/Ppyts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747953196; c=relaxed/simple;
	bh=QSwh9e7eyWFctLzZF+Bc13eVUv8DWHOVQbdS0U2r/GY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uPmJvzrbIwUMLANsHH+X1VPRs0Ux95Lo25MWA/loYYgy7Jw1pyo4MmovylBKUZJr0XKUHcyug27aRbkbYR2YOz8zWTR68WoNRazBqE+uaXlJhpmqpfNvc+JZ3IIsbyJ9v35PeDANOJLObEfUF5KnbOxi9qpJwvJbKaVmuocqJmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=UiRtJXNc; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="UiRtJXNc"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-742c3d06de3so6475534b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1747953193; x=1748557993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lIPDnA54KHM+aahxuVehx28jJr1eOYyr6Lt8SFqaFv4=;
        b=UiRtJXNc6h8Y/AgORrb7rtqvClgTNNJVTeYyKOYvC8WbJUxz+SiZi2Gilt3w2ZQnAF
         6G5baRUBQ5LadKo9ERHfMSCQ2UC8ApOBeoXhMcixFParis5OVJdWjO6X/4le66E5O/fE
         WFStNWcuLGJHKaqMXwl6DfXhPjDu/EULZlQ62iy0KXqkUa6ytAr3EHI0RbyHdigJ5KFd
         QFFnrzbPctGzgSCVoEmKAF7rrpPWJfaaXNIkDUHEM3irJdA+JWmH5Kkxm5jHsZ3xJpI/
         NaZatw2ySZMeL3MSOZGABhDdaKbE0Btm1aaG7BfHaI79kvpg+ZhJeoQQU3q4NPTYhaXN
         quOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747953193; x=1748557993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIPDnA54KHM+aahxuVehx28jJr1eOYyr6Lt8SFqaFv4=;
        b=vvHoO0feQGErz5jnOVFz6FqMGyM8VgF3E5nNz+1wrtGuOrvo2aCM/mPkHLHWHHi7Jt
         EJ6zu+pTkrB2uJ/wvfLiJ/+/egvVqw/2cOA9j5vMqRiGMPz4jv/30hO/Ps0Ey0he8W4V
         bFota9UiMcIaEiCwZbZcgYFeIe2NQsmIQqFcXGMAEH+D6sln+vsadLKZhFYMcszxoMmh
         To5DiEaBTJmzUfPJohgOIF6peEV2eZ+1lM1t6w9imm4QVLe0hRGz7XKpdeax8lt6Ef/e
         2DU2nvDmp9bkRZGFaQA+KYtOHuNb6Xi3MAuUpjj9y/BtlxIfyrH5EkGcD/FX+SgN60DZ
         0UlA==
X-Forwarded-Encrypted: i=1; AJvYcCVioEhcLKoh6KITfqE4FTjsfPbmZa7fR0dAtM2/hAsLhb8fBKYmCH++g9HF+G1ROJ/BN4/P/yCjsMNx+vw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcfqDQWp/ZRpJYggQ1AWjmPG1+aPkfg+04fMmwqtNCHpPOkhe7
	HYeLUcNQz7+loyedhcXG/EumAz7E8C3V4JFPoFRmp9tx/UqGPK4ZaFUbqQGhU9UVIoU=
X-Gm-Gg: ASbGncvRYZnTapgWTEycw+oVj8YoN1P8Wei+dXoymDCiUYeD/gFrqCHqwjGKmTzJEHz
	SN39zWo8/xloXLu/ak25AsIrsldBRFT8dnaY3f8SlYRekU009+bQqc4w802ipEOjIerSS4qQTcD
	BlxdG33Y+qeGxrZ/tVXrKNa+/8jhHQ9eXiw0aZC/xaF/EFXQopgzwOeMVNZIMxQ6ulRyOdj/LTS
	sa7SIFRcSbhr8grjPRosOM2q2I+7mAJPDDDfphFBFaFJqwGZMI83GXNxAb4DC5azQ/9b9BMeSXw
	Mqp+gJe/hiKk69GsZnRk3t9s6who1jH6sczy7AH+fWuZ3KS9+SuHSNiGnikzD1o=
X-Google-Smtp-Source: AGHT+IEXf8P4jUBPRl9v3R75tHy0ox53KdngEfSQ/zTdV0vLhoyMGDNzZ3PqCSjMLrrOP4fvai8dMg==
X-Received: by 2002:a05:6a00:3492:b0:742:9bd3:cd1f with SMTP id d2e1a72fcca58-742acd728eamr34873087b3a.23.1747953192946;
        Thu, 22 May 2025 15:33:12 -0700 (PDT)
Received: from x1 (97-120-251-212.ptld.qwest.net. [97.120.251.212])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970c6b1sm12137965b3a.59.2025.05.22.15.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 15:33:12 -0700 (PDT)
Date: Thu, 22 May 2025 15:33:11 -0700
From: Drew Fustini <drew@pdp7.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [GIT PULL] clk: thead: Updates for v6.16
Message-ID: <aC+mJ560HbscG38R@x1>
References: <aBus+Yc7kf/H2HE5@x1>
 <018214f410632eb3dc6c6bd6ab58cba1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <018214f410632eb3dc6c6bd6ab58cba1@kernel.org>

On Thu, May 22, 2025 at 03:24:02PM -0700, Stephen Boyd wrote:
> Quoting Drew Fustini (2025-05-07 11:56:57)
> > The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> > 
> >   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   git@github.com:pdp7/linux.git tags/thead-clk-for-v6.16
> 
> I changed this to https://github.com/pdp7/linux.git but please fix it
> next time.

Sorry about that. I'll use https in the future.

Thanks,
Drew
