Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C36DAD24;
	Fri,  2 May 2025 03:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746155156; cv=none; b=uubrXUbualwVXOUuRj5H25fS3qsFYVaEyzSoP3AYUmDSGkGRW3EQRS+ZP7kq15Wxo6OdLoBuQIfvE/XXKIDyMN0D272Czx6/fOS7tOYeVgQH1cc8hvNMAXoSGbVIpgvsYDhWevoAqa+r65ZuH1r3869xR9z0AqjWzV7I0GCdhu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746155156; c=relaxed/simple;
	bh=zhH5nPzXjUrf86OZRDGOaypDOh4KCN9NgBUuPBocrMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZSW4nCfGAZ1ii+GiRIy8tooOUKFWJwGxwQ2mkZRdybqAj+6qB3XjHHjMSylX6od/YSM81XW8qAo8OwmK1F6M3u4Evrm7em9UnSeVsHc3V4SUgOJXWemeVz4B3UYVy+6WkvyJbzP6HKta+CNKu3WOGOnJRob9whj/skJ+KeID34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kz1fIt3g; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kz1fIt3g"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-739525d4e12so1641448b3a.3;
        Thu, 01 May 2025 20:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746155153; x=1746759953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cjEvTtd3DL83zochWEbs5TPZmSe5eXjr1UdsDKOj/oo=;
        b=kz1fIt3gweEwpoBEOGvtOtljL0YpNstwIU+4QA90DiC45bU+lUfvbYSYxART2M0NuQ
         VKnMaYd8adKL5OL0XMQZGz3thwZ6gBYE4StEl2ceNG2z8v9ZesxsqZEX9QMYrE3qhecl
         r5q27mWtcmwMbWxlzEVSnUECqtlAHkgig+9XpV9H14xkNiMi7yvHJG+YF6UdjjlOOyti
         bp3MoksLOKBSK9zNJoJtHJ14Dg+DEBpIEN/Dzl1bG6Wlqh1P5rmi0cwjgtZUMIfQBt44
         Dgy3lA3XAf9CjK6wlnw/2tuJZ0t3T5Nd4HHucRvVQmM8OxCQGQvG+xReWiPc+Pt1JjT0
         e4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746155153; x=1746759953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjEvTtd3DL83zochWEbs5TPZmSe5eXjr1UdsDKOj/oo=;
        b=cxiMlUKBMGBPJIQN0J+3GM3MpzlvY84pQgrsfALUMMxae5MM3noZaLd338bTfPTNfY
         Ua1Bhk2ktWJVReuK7KB72mfge3YVmP3xT1Vhwcnx3ypChaknAlm2JkmDNc7co4qlqXEw
         DbVLerO0rm9U8p2D3sfvceK138vW/7nB5lTt8lE2U20pY0a6Wcbk6Gu2cutxlRCd9I5E
         BL1NANjvacmoDfv0B6ey2O0mQvvxUZiC1r9HB2o8nEoSzk53hW4Lfz0eJaYw9yv9XY7/
         zK/q7lGGNWZieGXpaHRTDqq6/7n6psqAOCIfdIVgcmUQpWvZamgix/hjlWjVa893ct1e
         S8Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWge1756BjFmOUPUTvyEVe1wVaRLLj0Mvk+n7eVsACAdreUOxw0O3qhibUAFq6zudffeSvn1goHdxM=@vger.kernel.org, AJvYcCXIN4YQsQ8XBKXtfBYhnnJqSdZksrkleFwDz3Ladayn4Z1h3muAjKIjE4hGL28EsC17ugf705E+chf0aqUg@vger.kernel.org, AJvYcCXuGTOdX2Oun84uQotJvB2tWoakKKjydIJnxPc3VhmhyXwX1bBt6UIGeBifi4Aau1pFQfPIHFWK0qwFDZM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi0/ktyqK6LQBimOORiiQdqFqtxKrZSy9LT1Up5ZrFU3NEa1Fq
	VRNBUgSrsXncUI2dFOdQm8ShQ7YITlveOZJR8179dj47kxCgsf96
X-Gm-Gg: ASbGncvjp/uUkbtQi1cvYVU06rqMB10zDLymmJ0TwVNK1uMLQ+UPBLOgDImRNAoJH1i
	WZqav7k6svbi8hmCa/h8y6/uYK19NSsl2v/8f9L0EgOdyIbnJrycG4Umaa+CoJn91YO7plcDYkY
	qSNlyOX1tVU57ogbUHKHiRAqwrI2R3tQLH/Mp4waKEG74ouL39XIvy5P0w7mXWqa7SiDiMgyf/V
	QloV6t/NqzWDmqr0a8JdKBXe9Aal+UexUfgYxrnptBVQB2hWPERQbynRBUKdcjgls9vOTHRB3Cw
	/gkbBzc5mjWIKsY8Kl1Fcnefq9FypqVh7EuvXq40nM4Meo0l6wsERw==
X-Google-Smtp-Source: AGHT+IFom2u9bm673qmcJlUaSaX2YVjKDm+IPDpJH078qAd+t4zHkeD4v5Iu5euSv0sVNSZdjhELjg==
X-Received: by 2002:a05:6a20:2d13:b0:203:c461:dd36 with SMTP id adf61e73a8af0-20cde371f2emr1873425637.6.1746155153261;
        Thu, 01 May 2025 20:05:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059098918sm444703b3a.157.2025.05.01.20.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 20:05:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 1 May 2025 20:05:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Daniel Grainger <dagr@live.ca>, Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG MAXIMUS Z90 Formula.
Message-ID: <fdc74d86-4474-4944-975c-a5286fe77b22@roeck-us.net>
References: <20250501132009.726742-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501132009.726742-1-eugene.shalygin@gmail.com>

On Thu, May 01, 2025 at 03:19:53PM +0200, Eugene Shalygin wrote:
> From: Daniel Grainger <dagr@live.ca>
> 
> Board and chipset information is from LibreHardwareMonitor [1].
> 
> [1] https://github.com/LibreHardwareMonitor/LibreHardwareMonitor
> 
> Signed-off-by: Daniel Grainger <dagr@live.ca>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Guenter
