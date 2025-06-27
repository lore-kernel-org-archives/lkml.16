Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784D12E8E14
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039053; cv=none; b=VGBeOBGlr3zSfLjn688hbeyKVeah6t3jhAjt/jRnqDfyDC34A/OViZoa+56wZEEDw0xHb75a7w0LhDtBuVz0wOOp6ofaVvwBq5+v6sCItfqOAeZzO5w1YG9mECN3xhbM3hZMJgNq5uSSR8ngGqzgMTIfmc/bkRvUlWxcisK7ZWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039053; c=relaxed/simple;
	bh=LcnRDVEnZy6QHKQQxsP/nvCacp9OQV2gpAzUNBJMFr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g/qJxd8NJCbL5Lg24B+4sGo2Dc+0lGpLmVDa51SIXXlPZGBPrE2PBsMozv8rV0QLVLkCqH7FRuOVj4FTpWudIb12hxsQEbpscswarDF1UeGOsDUG3SNBqPpZrZLe4oz+Yz86gsjFf+9KjxYQO8XTOzrPJpXhL1/iYJMnJff6cI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qji/ETkQ; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qji/ETkQ"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2ea35edc691so591438fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751039049; x=1751643849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vNskI9ihVQwbRR9S2z7pyG2KNmQ2CECCpU1on9KtPmA=;
        b=Qji/ETkQ2YdAM0G4AO3zcmLVlrtaIO7YQgnMz85O8GpXE5FNI0dI1a293Anac4TVoM
         czOYuk6aPm+Yb5sL7vu6ZrtthUfh3Wufwd1HXUmc4QDDLSQURSwTX6DAZUDpPa6x9MZI
         a6JIsi1ATzCAZnJVgf5B9/76M1QKzHGSvjI7u5c06SKvgHayToXyINg+f9jTVIicVtfG
         llOBBxDwoQSiQtVyBe4rwPx1o13WofG7o5XAvxI0SoCjw9JDcmon4xz/GnvgyAhyrN9g
         XWva984D/xI6blHHHg4S02CyYmiHVo2ozoC809CBUFlyTPV4dOeyajA6WIJxDBPRce4v
         SOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039049; x=1751643849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNskI9ihVQwbRR9S2z7pyG2KNmQ2CECCpU1on9KtPmA=;
        b=YZZuXMVXN+K1R1gm8jAyRSjJ6H0x92fmhJaw3hTCF2YrorRVNMcmsKd13Lt8TGjPM/
         BvXrztLjYYDCydRlyxjJ6T0Drg3xa2r0OmEonDGWIJhxkLmsY92rNfdAAmLLCeVkRp52
         MBKQiGrLnxFxmrxK+BRHmvbPcyqbUL0f2gCWyoEwHW7g7K/UGzjhADaZa161kDqyznAp
         d7XofbzVm7i3YOX8p6VGiPJo0TSWg7nwbryL0rbat3vRH+OzY+kP+5NLSm3krbyFhdq8
         uUZj2LUrSFUlcWEYUOQ4ZHSotEyPUeDociMoPG1P/279ZYJDGXnogFL3r51SikWy91g8
         AH3A==
X-Forwarded-Encrypted: i=1; AJvYcCWmsmN1N7KyeHYneTw/ISXw/geCSLJ9MDsSQQmrTnFJPVCLwEuqoR5/I324V+sM9+IdYC9p35QC4vlN27A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Jap3IbsWsS1ADrxV9YINuGrbbwT2H0IfXnmsebv0NOG77c/g
	CkLtNAE7q+xdGHufNJn2OPoEhM1uWigeckI2eTIqR1h1vTf6P4PmtRclrahkOfzcIf4=
X-Gm-Gg: ASbGncuG28nFsnKRTaGMbRvQOC/k4iqntzfnIi5C8xZN3Mg1Ue8qmLhpJx7J/O1RHsc
	WPQq2IM7OEQz0piUKRGjEIZwiAO1+/AU4CLNaPJGsWF4cxT31UdR4RX7WtC/Sotxb+i88L6hE01
	jsu9JFE+Uv5lXyNAUZFApoyy57q3y7x1BNM3NoLww8SbHAMPKQNr9NUoIBwhbjZYHQwoVUZ0Vpb
	Yah27i02MGG7r/zy6of1zQxy8/fNyYenm/HpTPNQ6fb+qebfdlosNfSyAX5XSP+UABuwRjZm2N9
	pwaqiVGKp+Z+sp99BsT7BzUuPEAuSq0qvSIO2dJGSm2DFI1KXZ1RtDswjRTn4iSN32478Q==
X-Google-Smtp-Source: AGHT+IHhU09H+nMf0lfOpqCHxF+Y0NTLulCnQbm0DdYiPRfdIF593CXffYxkSUXy1F9j48/+OHfs/A==
X-Received: by 2002:a05:6870:a10b:b0:29e:5897:e9d1 with SMTP id 586e51a60fabf-2efed7a51d7mr2326653fac.39.1751039049549;
        Fri, 27 Jun 2025 08:44:09 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f3a4:7b11:3bf4:5d7b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd4f0f7d4sm911929fac.18.2025.06.27.08.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:44:09 -0700 (PDT)
Date: Fri, 27 Jun 2025 18:44:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	skhan@linuxfoundation.com, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v5] staging: media: atomisp: remove debug sysfs
 attributes active_bo and free_bo
Message-ID: <e7dfe490-abfc-49da-8beb-50ce02678c86@suswa.mountain>
References: <20250627100604.29061-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627100604.29061-1-abdelrahmanfekry375@gmail.com>

On Fri, Jun 27, 2025 at 01:06:04PM +0300, Abdelrahman Fekry wrote:
> The sysfs attributes active_bo and free_bo expose internal buffer
> state used only for debugging purposes. These are not part of
> any standard kernel ABI, and need to be removed before this
> driver may be moved out of drivers/staging.
> 
> - Remove active_bo and free_bo attributes
> - Remove group registration calls form hmm_init() and hmm_cleanup()
> 
> Suggested-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


