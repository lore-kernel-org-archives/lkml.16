Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF00B211466
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 22:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743460335; cv=none; b=Y9GDKroQkU2eDAxKnnkwTUx5dO/OholeOZ1I2g98kz6Bbcqitpv/3HrCj81Sgyp5TCqudTZwkIK9/90B1Ja1SNxU/QkgLx11vkBI+LIpsBrYECSMcrJNRaf3f14CrRtJyraPu/7cW+iY8YruRjL1/CJJZDcaRtZqcDPwTbtOKAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743460335; c=relaxed/simple;
	bh=duYComVcSrZm1zivb0WaYUxmTcBo+rXMqqI6zBYJuSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RrLsz6AWRrm9DHPdlE5kvdP8jZU9Fu0sj7rmaqSXSQ3AX0irQDN3FZXt5cFGsBCw3p4KVteDnkl4ouJ7dyfAvOn5YteNocyVWJbADnt3c5Kkl1VHriiXFRIKHuol+sMcabVfDLwvseDHxhHeJwAqHqmOsi90SU5+zgcf5CViR6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=M7b6tEPX; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="M7b6tEPX"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2295d78b45cso2052075ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1743460333; x=1744065133; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42+7vZzvv2CakOTy9WwTzv8BPs/2UH1AMqRL6fkeS9E=;
        b=M7b6tEPXIsr38AcJXY3EZWX6gL1xHlmkAJK1MJTejdlfRGgaC+iybsV8KLQRfP5W1r
         qj/zpkbjHqhs/NpjMfUuWZ2LCIHm6NPkga8jFbjn1w5lHrVODzPn/bmTiQB67N4jLmQA
         XXc/YGSDjoV1oi3KMQisSkibJcdKyKqhdY/Kk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743460333; x=1744065133;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=42+7vZzvv2CakOTy9WwTzv8BPs/2UH1AMqRL6fkeS9E=;
        b=kn2lGplJna6OokB8o//lKNRWDLaYmOIq8wtQELUl9nULz90kYUIATd5cW9mI8DFui6
         73PvPNEtpN5439UXJGvE7QezCl5f0VEplwdZD5P5cFehh/nF0ZDaWu/41pA6qENeqI0Z
         wuJN4D8KPGFVky9hXAzzmBCy+zLmC/L5gbv44AkUI6Ts+2iAy/tj7r8hyWJZ/xtkv/z3
         O4HzF26s+wMonw5tkDSFwZBFqXdNgGf4d0TcfdNjoB5ZSLsDNyLffMzQUVk6R5kjdGi2
         y/qnlw33h68p3c2fAdtD1ZIgjDUQeF3Jgs5Xv7wpZ3jTs/v3xSm9C54+b+bhRtO4870k
         APOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9gkPyyP3fYB6e7GI0WHrQHhb6shOuFrqSeZx8fg4TkAYLlukJ63JJ7pMWktvjc7/iLcw5xU0m24HyZYI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+UYmKBqF3JNd9na6TIVLKlOuvBEA+Sxz6aaSCKIfL7r1qUrQP
	n283UiJqoT9iD8TstDk3nKjJ0fbSrF4/FhgnnaQ7+6iDHpmo+tCibVJVgGZkUNM=
X-Gm-Gg: ASbGncuStmNt13e1Lve9BvaYCcBkrHjn+eT5PA2LkUebpRm9FersKeeOgzWhAZyO+ia
	rHvjFaxVrltinX61+vCmPVDCnw+lynTb4iMe36L/Q8PKLGt1OFInOc9OlOoXMExfB4phdOYLSqw
	EZr00dP2hLVtcVByMJTfhnjkZjPFZMURgCs5INS1Z78Hscc7tx6fXasaeVu0cleBYRTwx6lfhsa
	dPcRlgcWexJjNmtHYouaMeUFwbRtzj3btbed3s9Wpu2DXc4OoDhPWXI6Uy43QSwI6r+K/YcPZrZ
	P3G6icrunzTrNSkAIF6D5abo9YxbH6oo8JthSpFPB29lsLA95TUKQ1Ui28Za7jlKlMcsJcEqX0z
	Xrw4+M/EU5tz93eVv
X-Google-Smtp-Source: AGHT+IGNbfbH3q4AAENJHHgORst/ra/i/SeRQsORO8675vroqpkxmTpWUqZCdVNz26ksHRE6FCMRSw==
X-Received: by 2002:a05:6a00:170c:b0:730:8a0a:9f09 with SMTP id d2e1a72fcca58-7398041c86amr15268867b3a.18.1743460333136;
        Mon, 31 Mar 2025 15:32:13 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739710dccbdsm7765619b3a.179.2025.03.31.15.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 15:32:12 -0700 (PDT)
Date: Mon, 31 Mar 2025 15:32:09 -0700
From: Joe Damato <jdamato@fastly.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, David Wei <dw@davidwei.uk>,
	Eric Dumazet <edumazet@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [RFC net 0/1] Fix netdevim to correctly mark NAPI IDs
Message-ID: <Z-sX6cNBb-mFMhBx@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, David Wei <dw@davidwei.uk>,
	Eric Dumazet <edumazet@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
References: <20250329000030.39543-1-jdamato@fastly.com>
 <20250331133615.32bd59b8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331133615.32bd59b8@kernel.org>

On Mon, Mar 31, 2025 at 01:36:15PM -0700, Jakub Kicinski wrote:
> On Sat, 29 Mar 2025 00:00:28 +0000 Joe Damato wrote:
> > If this net-next material: I'll wait until it reopens and send this
> > patch + an update to busy_poller.c as described above.
> 
> Let's stick to net-next. 

Sure, sounds good. I'll drop the fixes tag when I resend when
net-next is open, of course.

> Would it be possible / make sense to convert the test to Python
> and move it to drivers/net ?

Hmm. We could; I think originally the busy_poller.c test was added
because it was requested by Paolo for IRQ suspension and netdevsim
was the only option that I could find that supported NAPI IDs at the
time.

busy_poller.c itself seems more like a selftests/net thing since
it's testing some functionality of the core networking code.

Maybe mixing the napi_id != 0 test into busy_poller.c is the wrong
way to go at a higher level. Maybe there should be a test for
netdevsim itself that checks napi_id != 0 and that test would make
more sense under drivers/net vs mixing a check into busy_poller.c?
