Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA20213E77;
	Tue, 20 May 2025 04:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747717004; cv=none; b=tLaWCdg4pOGTCZhOo/s6bY9u5ndxXco3wG2BwaczYlxYxDff6N4nU841tdh/0zo6GZ6LV/akxgu6inKBCZ/840pmlON89agsUIE5bdMuJGK1y8unl3pKPYIXNIAvg2IWc5zom6BseOc3k97yB0tyZIFyupfHA40q7/ciEBMqFQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747717004; c=relaxed/simple;
	bh=3Xc0C1/MjHRmlEpsp4Yj9FmwRG53JSwRm8BA6yoW9K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6VWe7hND8Mygh29N1kBftK3kgWfZhPIOgo0ey3xq0IizsyTfdkGGV8RSaqUhNweHsq9hqQN2ZnEVfROHEAyOxpe/vtucRCgPyfPkxwJRMg88mkI4cP/yz1vVtg/wUDfloU+sMgX6i4SK/ZsNDzAa4InC1TGwMyKOhPJeEhnkBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6IgdWdA; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6IgdWdA"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-231f325366eso33208085ad.1;
        Mon, 19 May 2025 21:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747717002; x=1748321802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3KhnddQ+QhiIufxyI7j9wOBhDynzKukSpiqhLIt+sok=;
        b=i6IgdWdAnC/Pybf5t20beRG4rixShDm17qpR3n3ezjzIwD5TcIhT4rbMb/1004KZC1
         HiQDbb0re31/RNbIc2C3qZ8VhQ9raPUNQrsjh2xn6TNbiZ05d8KpJx8uOt5buSW5tUHT
         nz1VgRrRxr5kdfwvyIVyxVh4KLE12fMAxaPQ8hzDZ2imExARu4EOU0hEFkoJYCPPeNma
         z8kUe935LWQC030X37XTJQjfcUsemEbi7p/O+tTJNkizaZW0+od92HHMYXrvZk9WnDTP
         t/p+omSLajSpOpsRX4eLVofMkxEOWEiPL52Ak2uojS0nuAkOOjkXy5fARE7+pbdiPvRw
         g7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747717002; x=1748321802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KhnddQ+QhiIufxyI7j9wOBhDynzKukSpiqhLIt+sok=;
        b=XIeAQsnzd/ZCMo11GekjLz4gvbe1y+kAWBh/aXmLPWSy8yN58XcPhKhtEjDqm0kXfH
         rsjrHJaNwcj0TnCYfUuWuGdXV/QSYsQL8emq8xpzOAdcg94LDvCbGI3YXtP6Y+S2zep2
         3J/6G2DkBGbPcQvCVaKO+NO47KfLn7wfCkr8PfXcRyAFFlBa8khSLkEXpFHzH+mxihzx
         Id9luqo6UW3UXre+yEt6wryVFqHeTVb3gPGZfQ9Y3vJ2ieGslfqMiAofICiUJ4Uy+FFP
         ltyWzys/qFKLIJqDz/8Y51xiRITR97N/4GJ9Ss3AG7/SVihfSg5s9OVLBgvwhAZsP9qU
         98BQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/ZCiPyqWy6gm/6TAPDj4bwXCalTthuXFpT27D5YVAa5v3pGTxAbjBQ5XYfFp06p3s79g2BEQqH+/2KcKI@vger.kernel.org, AJvYcCUb+bG6bpBFKcQLNAjhiFP3yGNu56Sxb8fVXhvFpbO7gmYB+Y7V9gdAAUMfYWH5G7IrteByumNtETg7Dg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwt/5w7IntTZBHamDMMSKytRfEEuoRcouWEYo8KP1wT6jD5BFJ
	ogrwiIvTNwmGcDg2HqOuQdSSeLvrj2hM/A43WlJGgpjM3v+HPIUHBlWfBkoRlpJ6
X-Gm-Gg: ASbGncu7b5Tb1/eFt2yfwDSjHYOko95vpsyvJrE3YpaIZwX57RhBgTPOMDIwEJyTiGj
	1OA2ZAVzo3VMOKKECXoOXHdDxncm8ng5MQoETFUpc1zBp/ZXY/vif124ZSzvuxlhs5QAucSh1yf
	6QFBW2yfmni8sqwsyDsPbZh0F+uZOZIGT/CrXLOVQn04Dp6tpBC27ZT/+/Ob1y4Z3rzHX9UBS6f
	bQPuughYSwdeee9m8+DSF22dUrf4qbCtw8d11o86cq5W7tQqpYw0N9UgZuFcEhxi/lx3oQim3JN
	ZQqaFiX0DMqTKI86Xe9//MlIqvASsPpzeHNjs6KSB9O8/l+tx0x4g0hX0lcMSaEAqySyxS046S0
	=
X-Google-Smtp-Source: AGHT+IE1HvZMXTpLIKXrgs5vgk2lC8Gd0BVJQ3GbmMb7vDXCEy8E09Qlccu8jOdcLbqOczxFK8Fo+Q==
X-Received: by 2002:a17:90b:538c:b0:306:b65e:13a8 with SMTP id 98e67ed59e1d1-30e7d522134mr25469442a91.8.1747716991893;
        Mon, 19 May 2025 21:56:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365134c2sm748415a91.43.2025.05.19.21.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 21:56:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 May 2025 21:56:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
Cc: patrick@stwcx.xyz,
	Carsten =?iso-8859-1?Q?Spie=DF?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] hwmon: (isl28022) Fix current reading calculation
Message-ID: <2b5e38cd-ea1e-4ec3-b8ca-4b7ab9db7b85@roeck-us.net>
References: <20250519084055.3787-1-yikai.tsai.wiwynn@gmail.com>
 <20250519084055.3787-2-yikai.tsai.wiwynn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519084055.3787-2-yikai.tsai.wiwynn@gmail.com>

On Mon, May 19, 2025 at 04:40:51PM +0800, Yikai Tsai wrote:
> According to the ISL28022 datasheet, bit15 of the current register is
> representing -32768. Fix the calculation to properly handle this bit,
> ensuring correct measurements for negative values.
> 
> Signed-off-by: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>

Applied.

Guenter
