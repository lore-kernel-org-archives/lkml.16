Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACACC226D0B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343578; cv=none; b=OWgPw+2kUistwk0Z7lxNa66MeYPg7rOwofrv1CNQw5tA2z8B/qW50Gy/ZZcSNbs4cFGWUqWT9u2Xl4h/2jEarkPrMhMvlYmfvD7ZifeAoIOjF/KnagATZNo49PusgJmDfpudgB4AVg1Z06VnKp478cGleuZ+7y+ZsIoKfjGVV2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343578; c=relaxed/simple;
	bh=nmwWIDW+odOafOSbSvyT3m43z/PXmHJf54qTm5PFBpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R149W9d8bnr/6TmwDmC7HFcdk+03cpUq1IjgBk2sW/730yaftrzlb//WFo5djahOEgSj4gSZAn11jZujISxOOfGzVKPrh6mk1SuRMhLNFjAYjh3lBt92703VYCzV+lxdj7/LI30qwQZAdU6QaJy80AIpIcHqcd4ixzmiO0SqkiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zwoy2pYl; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zwoy2pYl"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-60d63174f05so194509eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750343576; x=1750948376; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=se2zPaRHsPHVWSLq2M50PUR0Qrr63lHfyYD9MBXQ1JU=;
        b=Zwoy2pYlWFW1I+yo3I/Hv7uolO/lCEhd8dWMiun+yIBwMkDIkwqGgH0+6GWUmTlPNY
         /hfGLemwMZ9DTFgsYjtXtLPlpNQMCC5tpSgpjiEeQ+FNM/87wdv/czr2NKrDA+WcP4PE
         +xPIdeF3TuvDjAx0Qsq9dQSLTjQ9x2qDA53alBkgcmpgWc5f9stC2rbqcxrZQY2uGzMr
         LpuXqr/73YtcVAqndwA6DRK3lDeHoshIl4YZmppxTLc9K+Xwn/L0ZyO3+G6DV6rZFzgU
         mbAk/TsugUmMesYkfL4pdp/sRPgLy+78JRqcMKlC/pkAuTMtFECKeV+wNxUuRXAMcGo8
         8UUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750343576; x=1750948376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=se2zPaRHsPHVWSLq2M50PUR0Qrr63lHfyYD9MBXQ1JU=;
        b=Op6fgrOLJA1kFFfbihlbsJG2+M8MNnTbRMCVMv9AG892oppGLu5qox9sIXVB24+XW6
         mikeE7EOutc1Alec6k3MpazlEMzaMaU25hTGOmp6rXmAz5kD+xhERf9tQITWTRmdawU0
         BFkw3RsGTZ1A+ojcGE8EDvMp2ECNqBeJG/u3Y1v6KfHb7/1S9yjw8ivPtKWHkqYc2/ip
         ojtqXmGX9k8Nyegcyi38HGlrFd7Eq/0jHblnTJNpWUbf2KR70tZBeQUTz7qM+Z3IEQG4
         GIBGCuPnQLOmy7YaxW4f4zOT8D4+GBkKLtuESU+j8GoZLNlliy5qJWprisBjZtWAGK1u
         rYYg==
X-Gm-Message-State: AOJu0YwF4Uh0twMfyB4zleWNhHIaeClOw8ysqgLQEGBNzyI3aWr6HCFn
	cYOp9Zv16Y58pg/xWfuzswHvIch7S9YOg2yKa6/RKpoukSOpYxucNfOe2Cz8BwTVrwk=
X-Gm-Gg: ASbGncsiobDhWqXYdSaiR5Dgk0DT6y0lnXeZrdn195RCkrJsxMi0opydxLOYfHiK17A
	HLD80IoFVVxy45/9umpGSlUp5LAH8OGG7YJV85uOzn3M0FEZS4wHXHtTXDPuMqTl/2gwF2GCFZs
	YdG4baFtLzbobG3PfFfhprSbKab5sMxV3XvS0XdmcAuw8FN7SH2xRlr8tI186AOrGp44vF+Jop8
	Mg0t04eQUqAAf+J511FS2oYO1WB1RYYGypsFt9BmwrtoUccRXbs2gfiexoROyBif4CQwz5IIhSY
	RfakQUNQNXrLACQB2eXAec6KW9FMmv/tl4pJkj4px7V69Jq0dktfovzeGshDe15d5RhTGA==
X-Google-Smtp-Source: AGHT+IGaZ2fGL+aupK3bJuZPDe415AnPYcuPEQInGDzraWvR8NsbfbrInyqqD6LAZae1EYAXTK0/5g==
X-Received: by 2002:a05:6870:468b:b0:2c2:5c26:2d8e with SMTP id 586e51a60fabf-2eaf06ae000mr13281654fac.16.1750343575695;
        Thu, 19 Jun 2025 07:32:55 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:67e2:ece8:b2f5:738f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eba6251d4csm354326fac.44.2025.06.19.07.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:32:55 -0700 (PDT)
Date: Thu, 19 Jun 2025 17:32:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philip Radford <philip.radford@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	cristian.marussi@arm.com, luke.parkin@arm.com
Subject: Re: [PATCH 1/4] firmware: arm_scmi: Add debug decrement counter
Message-ID: <b44393b8-369b-4500-abf3-13e98624e233@suswa.mountain>
References: <20250619122004.3705976-1-philip.radford@arm.com>
 <20250619122004.3705976-2-philip.radford@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619122004.3705976-2-philip.radford@arm.com>

On Thu, Jun 19, 2025 at 12:20:01PM +0000, Philip Radford wrote:
> Create scmi_dec_count function to decrease any of the Arm SCMI
> debug counters
> 

Please mention that "There is already a scmi_inc_count() function but no
decrement function."  Otherwise everyone will have to look it up to
verify that it exists.  Please put a period on the end of your sentences.

regards,
dan carpenter

