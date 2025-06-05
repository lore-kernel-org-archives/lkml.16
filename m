Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625C828E17
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 21:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749160539; cv=none; b=c97I3F6qNYG6gof0H2KooqXptFnemIC/A+BlpKdhi7uYKrf8WP40KqxIcYzVCwTrmPS0IXzeLCgytrSOfAhPBYoP2vrYk/aZDlBcvy8rzP/dwkNpYrskQkPwkN1QGr8qrikqiApGfPxMcqZO+xtNTc7kcu/0ejCEEcTTtZRN8kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749160539; c=relaxed/simple;
	bh=lv2t+uE84kmEx74907j4rFCvGFtRtPS+kipfsQsVKas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eFX+pw3CjiPh/3zhX1e5Ojv/TOxlHlf6F9Hbu/++m+DRukPviH2FZ9iWrTCMbX5iAScfctGJq8UWkxegGdZH7X1qtIROwJa180++X10mv2NuzfyFDF6/nWuW/533XujEPC0iCUIwuqXt0SgYDBaQwlPQW1xn6TbfAKG5a6FoGCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=ntVGxYll; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="ntVGxYll"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3dc83a8a4afso9531945ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 14:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1749160536; x=1749765336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1tPrRQ909k3LoqX5HXL+H8AJdVmtNVHZDBG5f3YzT+0=;
        b=ntVGxYllAWcWNoOhObCYcdiF6p8BE6bVq8cSMB9+5ZKymmBBTtMKHViIUcZDEr7Yj9
         tv2bjALdwYiOe529kCGbHGP6pqG57O1yLYRw2vm7O92vGdiodwRof5PlLLhH42HGcDYP
         rUbKOW/NWAx2UvK/pC3eKVYe7/cnmsPaugjAJFkVjbMPzAd4ih9zywSt/P72ibjExdA7
         7SjoBmkXQyz13FlvycTcyTuw3Np3GLwOxRTNkEJYwgg+fFip5j0FWyoCODA8/s3HPI1c
         ev2gcD4Y7LpS0quf+y4f/gtAFBWpYw3omnWh6357MFx+RA+INcwuX6XVXr3edBAJ88MH
         bwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749160536; x=1749765336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1tPrRQ909k3LoqX5HXL+H8AJdVmtNVHZDBG5f3YzT+0=;
        b=NJ0+FdpNjwjervowZ4l8NUVnNtHcXheVNwQ3FdqRfk/n3Ru9yWAIIPPzBqGkxqL9wV
         XPA56z8lXYIOWwHDe5a1ykGRLxJiUiB3Q+Ohc/bNQFpH1Y0Rr1FN26xk5Xwfi+c+FChq
         bEG/2ldSqRqz1EdBf8ZFVENRXIO6DtAW/cFDpy9rbvErUuTN55ucsIFh5DrAvi9JO6MQ
         14RIySimTp0l9LUGecXDu5BGKUxEQlT+k1EOnwH/kcBUAVyWAwPNkAEaj9XWKStuVOsn
         uJIZKQFqC2gVRXwd8bpOvEbfSL9SUyt/f8UYTVftEamTmLXKc4KwBzGNplUl1jJUajbH
         BjRA==
X-Forwarded-Encrypted: i=1; AJvYcCXVjOkaM6arOBdF+ICEC2ac6YGeDj1cmUAwnFJRTv8qqLbKHQ0wp9s5Q4Fyk1cZom+MPub291Lb/1qWeX4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0ytzyYpJ+298M3Xjmk7VPN651iPuZD5iFX5mb7W/G082QQ2hB
	/ur+hGRsgM+1wFnwSnYYU4qK9gEVaCPiSNjlzsVGbTuYuhQJ5Zo2SXnEikgemJtqeCU=
X-Gm-Gg: ASbGncv8e+nmhMuB1uazZ0eDZt9q2ssj6c4Co3nIvyhgB4B6oqy5rTmifkdY2/wQUvb
	IJLN7sj1QKq+Y3FtSOG9J5DyC0lIKz/YUP0r/Izup1VQ5ogEauoRXtxrd/UNP0RLcufVnIJI3kd
	LYf9+v4ijeYXybuIN8qXcGDlSuXlecFoC+dQMy80JrfxrOEMrcurYcGQ2DuGvWkq1Q1h/4la5z/
	+NYlNbWpvSfn8/F54/Qrq2gyyTwJBHS11N3WKEkxrhE8/8b9U1Tina+fJMC3muAwSCctdyz1aUV
	ylSoJzQa8vkOs4J6VsakoRNxu4CY2kzz2hgxppM0Lp2ia7njnjQxs9AGX/3JSwO/Mr4yCQ==
X-Google-Smtp-Source: AGHT+IED071g9IJXlFKyxypxNqRdATo8W0vGPD4rOVyraGxCMIc9j0kcJ2eTDLX+1hrfrxWCw8j9bQ==
X-Received: by 2002:a05:6e02:2593:b0:3dc:7b3d:6a45 with SMTP id e9e14a558f8ab-3ddce521bdfmr11754995ab.0.1749160536364;
        Thu, 05 Jun 2025 14:55:36 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ddcf244ba5sm539375ab.38.2025.06.05.14.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 14:55:35 -0700 (PDT)
Message-ID: <ddea36e4-4e89-459d-aa60-3d3c05a9b688@kernel.dk>
Date: Thu, 5 Jun 2025 15:55:35 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250606075230.6a13c53d@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250606075230.6a13c53d@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/5/25 3:52 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   10f4a7cd724e ("nvme: fix command limits status code")
> 
> is missing a Signed-off-by from its author.

Sigh... That came from Christoph's pull today. Keith, can you just
verbally sign off in here for that patch, at least then there's some
sort of trail publicly available.

-- 
Jens Axboe
