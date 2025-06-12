Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26286250BEC
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735084; cv=none; b=SQAvSsMgBMcMAlQDwXo/wkH2LTr/Z5wXIp382M5JUFJQfCEbHsU2G+Pdddx+w8isvp0mRhRwFExrOXy3IuTWTkyRjYRrfCbDizyK40+Uu6mJWXKxSIeToMSLYB7iKun7JR0n4L6uagzpnIoDW0SAl0xcsJh0ExGM1hGqbQybHBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735084; c=relaxed/simple;
	bh=Sa3FfmyKDCefdw/wrrcSViRREiOcyF/hD2ktzHVhuic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=paMh8nV0ZmKmdpb+YmKFPUuhCH+1qqa1jSpDbq4SAqsuaRsm84OIayfWsPSH9AJ4eN7YrjO2gu2U//xqYQ3LQ4xq+XhQfQJMju2ZFSzvV+fpW7cYWTsRatZSYzvRPj0dOA3NlWXXa4G39JCjQWc0Xce78hK7R9NsLFzHxjBqsRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=hPO6p1Jn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="hPO6p1Jn"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d6ade159so8186145e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1749735080; x=1750339880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/lv9BUbkH3J6UtkmDC2NeXR0wU5Tdpo+Wob7H38rwk=;
        b=hPO6p1JnECrOxly87eBXL0t2vTXaZ/Gw4Qac89lQ8FVIZUxA59rDWxlgPxlXTnbTlh
         p5jwxay2cYBVLYvO7MQlygaUWJB8weKFHwazZej2RTPQ4yYNhrdGRc7LJse2YOQCdpNL
         RkNW0goS780V+MUZInqiR8fZt61KvMS/ivdhIYR4o7jP0Ybfa20hDq5t6m7A+rp6ev8i
         p1fUomoBEX/nsd67g+Z0BxPPrF5lFCFtqCFu/U8psSFYbD3aFW8Fyrq0yLKxb4SvU/Bt
         M4va1h2JAjWx8q6jVgBCew+dbYVK0hx9ZZWlk4cDl8U2Y/DaOqrXIta4uurKjKGqThGa
         tAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749735080; x=1750339880;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l/lv9BUbkH3J6UtkmDC2NeXR0wU5Tdpo+Wob7H38rwk=;
        b=p1gze2dcG2h4BkpvSn9MiPMr8WuCQhTKktMPMVqxca4UKG5HQ5dHJFQpEDn+5pTd27
         JKd4loNuPl4hrYwO98wb2j9F66srAQVsyX3kjzhToPXcEic0fUhYMj5snC+SW4PtkR+E
         8fCbbRSWXadwkBzNmkV9eU5uoCBj2hF50H77H0NCz+PEe0yjFkUIuvIqakCNR5YS3tFV
         dYZGwoSIq3a1FvPD8MPvzYzgz91Gzn8VbcDb4QVe51XdI7GKX3mBVORECUhL9nTM9I9U
         Dp+cNrn/1hQiRynQ/Pw8Wf/HqV0U7v8pC/MjKj9/wGecBAECaEO0uuQg6Oi1+6WZJNWr
         Ynsw==
X-Forwarded-Encrypted: i=1; AJvYcCW5JSqoHwq2q3JgUXzrigky2LQ/PyhibAqnCgKOaWULP7mUEcT9uHc2z4LliDbzHCYQ1g6YLYHnZI8z+xM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS6SsME/Scu74NUAglRhwnpfYVK2DVdHEa5/gfSG3I39ile5Yf
	RAChLeVEP6Lr971wLWg0VWGPszK081n/FaxygnA3m1dXKbIjWMm8/PJBR7BNHIMBwE0=
X-Gm-Gg: ASbGncvgO5rBwhcM9YBGTl37mS0HRD4FV9v7CriJA/UVtad89rUQkvKvWRDmFQbphgx
	1TWTuwHRX6owg6/+QXahWrsIwfahKvPqHdctSjovenAEFax/NHQCpt47sXOcgXIjO+g+v9OCMXy
	ywczruGxppJQTUZboMKYL9wEbwkUPxDvofrl9wNhpZ8BeMvRWT80PMHsyirdk2hXvcU5v+sFmQ+
	tj1R/y+nFKiSwshEmGFxrAPAEuc31O/s3G7vh2UdIT63ljioM4UcTa1q4y12TWBy8DWfpsbLaZq
	nYkAQnn88Y/w4XfBNGFWLd/7EO5ovtb8/1pFl3Z6EKxYpQEjyrTdix3jduATVLeqLrQ=
X-Google-Smtp-Source: AGHT+IGLPYGJwuDsstUQ/cRzlY6KTrrss8ksjQeA6mAs9fAoclJ4T88v0q/9WTTlQxerw8xkgkktyA==
X-Received: by 2002:a05:600c:6297:b0:452:fdfa:3b3b with SMTP id 5b1f17b1804b1-4532d292ec9mr32104055e9.5.1749735080089;
        Thu, 12 Jun 2025 06:31:20 -0700 (PDT)
Received: from MacBook-Air.local ([5.100.243.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e268de2sm20954975e9.40.2025.06.12.06.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:31:19 -0700 (PDT)
Date: Thu, 12 Jun 2025 16:31:12 +0300
From: Joe Damato <joe@dama.to>
To: Shannon Nelson <shannon.nelson@amd.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, brett.creeley@amd.com
Subject: Re: [PATCH net-next 1/3] ionic: print firmware heartbeat as unsigned
Message-ID: <aErWoFty-VDoZ97B@MacBook-Air.local>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Shannon Nelson <shannon.nelson@amd.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, brett.creeley@amd.com
References: <20250609214644.64851-1-shannon.nelson@amd.com>
 <20250609214644.64851-2-shannon.nelson@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609214644.64851-2-shannon.nelson@amd.com>

On Mon, Jun 09, 2025 at 02:46:42PM -0700, Shannon Nelson wrote:
> The firmware heartbeat value is an unsigned number, and seeing
> a negative number when it gets big is a little disconcerting.
> Example:
>     ionic 0000:24:00.0: FW heartbeat stalled at -1342169688
> 
> Print using the unsigned flag.
> 
> Signed-off-by: Shannon Nelson <shannon.nelson@amd.com>
> ---
>  drivers/net/ethernet/pensando/ionic/ionic_dev.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
