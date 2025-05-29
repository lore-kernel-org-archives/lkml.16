Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E442459DD
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 05:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748495813; cv=none; b=RQxrE59rBPdZ6DR6HVIfmsYZBMa2DQ1Mhl2SQoIjhNxfpqmzNPulAXLzmxJ9GIqVcsxXa2Y1YH0iTlJHonjZJpSZfurXS0h+XeTmaLtQwYE1vKtbqcV7h3nrMEl7a7v08Vh0BXMlL6rTgk3BxPmbDb0g8LRleTc5uqBgGQ/AHJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748495813; c=relaxed/simple;
	bh=TV45GHhtGOnRyTBAfSGdXdDInmU9h/yXgKV5kru+fSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IefP8J/Z2KhO2qbHg8YwJq2YRcujOD6j7tj/8KhL2S/SeD+bD3v/KBZsEnFb/aewgZiPKIahdZXW6MYXwlu8xXOCkS/Ggg60fcB8IqRGoY8xqqa5GMEx+y/mAL8p8PcNcAdwQjG6ATmqgyixdjkxDRCWsChPrB4U38ScFp8668s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kGkLYK9Y; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kGkLYK9Y"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22e09f57ed4so15021155ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 22:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748495811; x=1749100611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fwAROE/Iu0xe9jaIyFDWRqVVq6KxWwVTJxazuJbd0tw=;
        b=kGkLYK9YcyVhhCcMk9T7wenLoNAyQ+V9+ehAoh4jfgX7jfAvXKlRFZrVuNoFutKVRk
         z44IrO1CA7jWMMYbd/3zgQ8IpAUioE9QFWVay8/v3IIq9YV4414mg+1+JfNsDiQ5H9Qi
         ExKdVVMxquBayhlGB5clxCX0BfrYORkme2HCSQukPyXzwK5Y7QleycliDAuulG57M0Qk
         aRr7Yhu4iix3Z16yFOMX7HRwt6D3oyyCJpLfVC/xt/n25NDxSv9QwTiru+8PePj4dZn1
         emxLm5Ox2l3kSfP3GWC/x8XSW9UOYDX/XCdY591AHiZDKilzwnuBlEj032qMXGq/C2w9
         uaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748495811; x=1749100611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwAROE/Iu0xe9jaIyFDWRqVVq6KxWwVTJxazuJbd0tw=;
        b=c9J3On6PvcHXwD1CN580J2i+waKqRQcoytSmk3Nxt3SkpKhM1rH6KXlodBNmFdPThw
         4Thk6J+eb4ynvwgoJXqadVdp1x+sNw0CcawgaQsEiwyIC9grOOveI6DLlwLxaTpVDHHn
         /44q+3UOdKyVEfTR0ljIgnxKDKb6EdQfQd41hQGXtWZdqQLHDkcz8fSZyAgrg7sHBU5q
         gg7Yy44ekslaCVKbaseUOLOSx7CcRfo/D0yga/sys9L2a0vMaZjmUltqsqwz3Mqrg9Fi
         JcIs674NdGLxISHswRwZcE1kwrAQSpzrqNBdni443yTp359zqw665wfBEs2DjmdnVlfQ
         ZObA==
X-Forwarded-Encrypted: i=1; AJvYcCWrIOuDmeI4c+yyRntnOraX4bPGI+25385wjeNXivO7BQug3A1Sb3HPhh1WB/2BrggidEnu6bIN4Wi/rwU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+AEHNtIS1oU3+PBxEInxNu/+5iPM4b12ghf5eltZp65hzqM5z
	XP+61XuAC7Kc90VbpCea9QwRyYCFNJGko37pXAUDyCSFc5B1LIXG6SWkK9mZ2Pq3XjY=
X-Gm-Gg: ASbGnct2xPiHwMChESGiGlpKThHewibDxDEv6iZLZrpg4ndquVJocXx8XN+AhxBAoyE
	BQ0hg3V7Oya5RkH1MM/Ml6V/FrH8x2CKwyaxgOsWxJCqo8nfNg2JVP1IAzgaJzgtt9KSw1nLMMW
	G4afubN0mP5xL9GZ5VbzC7CPRG2g2wMYEmToTwqkLQrAaSWyaqWGmdOgWEhgzwzYf/6ZzrX1HNN
	juHtASQfswU847Axl7DmT+655jxW3376pgUdLV0qQIAHy69OBhJBoyGSm0lw248NsYRtzInloky
	MQ7jlk8fc8kVDyN35xCwVX/PHZY89ENp402JvzB+HmYlvtc++BuD
X-Google-Smtp-Source: AGHT+IFCUOB6AzVLuihAxx+qpBUabNryOsY6YuDFDgZ+ERpJUDUNP/BhRLmVicYoSS77fIKt7beIXQ==
X-Received: by 2002:a17:902:f546:b0:234:a05f:46df with SMTP id d9443c01a7336-234f67a7a6emr28192605ad.7.1748495811169;
        Wed, 28 May 2025 22:16:51 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd362fsm4570345ad.116.2025.05.28.22.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 22:16:50 -0700 (PDT)
Date: Thu, 29 May 2025 10:46:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 1/2] cpufreq: tegra124: Remove use of disable_cpufreq
Message-ID: <20250529051648.axvnwxvqf5zgroy5@vireshk-i7>
References: <20250508-tegra124-cpufreq-v4-0-d142bcbd0234@gmail.com>
 <20250508-tegra124-cpufreq-v4-1-d142bcbd0234@gmail.com>
 <040b0d8b-e862-48dd-9b77-9266a5194f99@nvidia.com>
 <20250519101725.k644wzizjwygtwa7@vireshk-i7>
 <49e7d006-e9cb-49da-a4cb-b73a08f6b792@nvidia.com>
 <20250520100218.te5i5ltrx43zjsq6@vireshk-i7>
 <CALHNRZ_NtdiOek_bEABYpkW+p=c2RgCC4o9EXmqmAkdv3o9i6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALHNRZ_NtdiOek_bEABYpkW+p=c2RgCC4o9EXmqmAkdv3o9i6A@mail.gmail.com>

On 28-05-25, 12:29, Aaron Kling wrote:
> Is there any consensus on the best way to handle this? I'd like to
> keep the series moving.

I was waiting for Jon to provide further feedback here.

-- 
viresh
