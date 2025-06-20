Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B1A1DED5C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 04:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750392945; cv=none; b=HdAaGE4M2ZV37giEHBDqF0iGD/SGVFQWfuZ/IuLwuXBpBnGxIR/tdT6esOYD51z834w74uEYIJt9VNjcCx9AujxYe7sjVFrjZ6Etz/ttKi0SiQxG8OYlHMGJa1eima5gTTlK+k+v0+y40Zn5DgHFIEMhTD8jlcfqLs7kDaDvVD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750392945; c=relaxed/simple;
	bh=YLWQMqNIvRlBfGk0BLWS3fV/fwt0ymSLhyYJlFptfh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JuNkz0vGbTCEJZeJFCFHxMaYjjcE/qW7r7B9y4z/GVyag5LT9HfnQR1rZPIf9p0ea+TOShzcqvyXka08aoHsu8MlAZ4iGkSbgXApzmD2S/8uph5YuT92yjSux748JItcYzx6zJxIq8oxlLo/jSIWGYdT4qqhM/l9reVT5Xlj8DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YEkFLov/; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YEkFLov/"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b2c2c762a89so1102612a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 21:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750392943; x=1750997743; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Cy3TvWpi+fL3vF5Ha79/V2lVstK62EgvNVGAMRApv8=;
        b=YEkFLov/WQIWuhLmZDWWJe2cWf4v8UBCgfy2YVFNsUYca32ARfcffuqURpNLlXa0P3
         a6yk3IgwFBh/SWOiuYN0sS2P6JX4EGS1MdNHw2yzkUv6MUT6nVGtUcSEXEsa8Y3hiWnB
         MT2uxk0evfU4HfPMKu0VFLvrMBUG/MrR+oeh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750392943; x=1750997743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Cy3TvWpi+fL3vF5Ha79/V2lVstK62EgvNVGAMRApv8=;
        b=LpCvjKJrER9zd8uxSiNPnXxscnK4hwp45VgrrkTMF57IMqn8uirOtloogBUcTXO+0f
         hD4Qe2SAxBfZmwlmf3ggzz5Qxt8M+7vpHARSnFT3fwlJxQgCrpNWEpvO1rRd8bwQjsJO
         aNs7XM+e8Iq90JNdR3SHwPbDNUXQPXk02tO6anR8v+SugKCVt6c6gvUvkcZha8WzUD1t
         8HHcb1Mnup8Xjsp7hcatNvQEy3Lw1DiJ23AuDPwLWrE+1iaMpQJHNNPGRJhL6CnYtLDo
         dsRT634dVv8mL/sLJN0i2oTDaiPrUHc/Uz3x6FFq3CDEE9El2T42cY8t7cR+0iFRaf7d
         pKwA==
X-Forwarded-Encrypted: i=1; AJvYcCXqmlf98fLTEeAT5kd0gVKuYqWc7xkFKGIkbGY445a8g6a2hAaXRWk7LE5/sApeiVAIB/NerrsZw5XlHFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YybXNqqkxodgfpBqncwtqTZ9S4wvlXzQTEFAgsVMdcgOMZUlNVr
	SupHxPQE0/OYWMCm42BhKUtz0cAQEE4oZbJDadvDOv0eS61BkvvX4Yj+BgW/V9g/5w==
X-Gm-Gg: ASbGncu/0JeyPszbp2W5zn8hscFRC+A3qWNXOneIHjGeWUBpd2OkYhFQRbe7uSD6XtM
	8bKUxok0/vhtBIxDPO+wsa6uZp0JV60YMbyzuc03syAfubaWyE4rsuwQc+z9sYrG1Gv7jvIeOW+
	e/VQDDTQBXaUaWhp6KPqfwo8xYv+zRc4VlCDKaA4J8BzE5j6EQ+9mFKpe8yqHpKPMHyVClUlIBb
	U6TlwozM5yJuDGYMiLdzNHTsMWTarkTm5EHuUXYifUEmplag8mceXWfGOkUSGz/hvEk6OQzxH9j
	J7zByqWAy9sBa9yDibhabSEE12wekPYhpNT9P0P3t/GVtGNwckRxi/gjDYrkRRo4hw==
X-Google-Smtp-Source: AGHT+IHyRQSDJnGbDBeHS4nxGGY7VJhOz+gP/6YwMppzmVpF//i5uNQcMgRPidqOfnDokaVjIXIERA==
X-Received: by 2002:a17:90b:51c6:b0:312:f88d:25f9 with SMTP id 98e67ed59e1d1-3159d628b88mr2709052a91.7.1750392943134;
        Thu, 19 Jun 2025 21:15:43 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:e574:cc97:5a5d:2a87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df812e1sm755960a91.16.2025.06.19.21.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 21:15:42 -0700 (PDT)
Date: Fri, 20 Jun 2025 13:15:38 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Richard Chang <richardycc@google.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Minchan Kim <minchan@kernel.org>, Jens Axboe <axboe@kernel.dk>, bgeffon@google.com, 
	liumartin@google.com, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
Subject: Re: [PATCH] zram: support asynchronous writeback
Message-ID: <x54netqswex6fpv46nlmeea3ebnm32xnwask4zxw7nmcn7tqdz@4mu4hwsa7hsb>
References: <20250618132622.3730219-1-richardycc@google.com>
 <n6sls56srw265fmyuebz6ciqyxqshxyqb53th23kr5d64rwmub@ibdehcnedro6>
 <CALC_0q8-98y0v_jV6QOFTKRAGhJ4nCXZ=q9wutLZPCE0KnKymw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALC_0q8-98y0v_jV6QOFTKRAGhJ4nCXZ=q9wutLZPCE0KnKymw@mail.gmail.com>

Hi,

On (25/06/20 12:09), Richard Chang wrote:
> Hi Sergey,
> The main idea is to replace submit_bio_wait() to submit_bio(), remove
> the one-by-one IO, and rely on the underlying backing device to handle
> the asynchronous IO requests.
> From my testing results on Android, the idle writeback speed increased 27%.
>
> idle writeback for 185072 4k-pages (~723 MiB)
> $ echo all > /sys/block/zram0/idle
> $ time echo idle > /sys/block/zram0/writeback
> 
> Async writeback:
> 0m02.49s real     0m00.00s user     0m01.19s system
> 0m02.32s real     0m00.00s user     0m00.89s system
> 0m02.35s real     0m00.00s user     0m00.93s system
> 0m02.29s real     0m00.00s user     0m00.88s system
> 
> Sync writeback:
> 0m03.09s real     0m00.00s user     0m01.07s system
> 0m03.18s real     0m00.00s user     0m01.12s system
> 0m03.47s real     0m00.00s user     0m01.16s system
> 0m03.36s real     0m00.00s user     0m01.27s system

Has this been tested on exactly same data sets? page-to-page comparable?
We decompress before writeback, so if the data had different compression
ratios, different number of incompressible objects, etc. then the results
are not directly comparable.
