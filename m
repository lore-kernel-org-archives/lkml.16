Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9F721A458
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751008479; cv=none; b=HvBljSbKzlot77iYj3wa5JPXbaAdC1qLFdaXf04gqqQ1ugvYIOYKIRKxr85SJYAQhgFQvpAbDlJudeALjO09pZExYZLX1CHw2DJhrha+6MiPJajTxWcfq7tFTiOjJQGmUSd74Pw156W8HETUJWwGZhrujw4lAw8c5iIegocIrAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751008479; c=relaxed/simple;
	bh=wx0LqKlXVv8c72e871dc4Fp+9Lt/Vb3P1h0YRmNbohI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwrN+B66p/iun7MpT7Lhgcq2AUDapot3GBVSHCBQ0M6jvy7JjIpvfGSXeekQkuE0AhekEEajYlOKkkhZlse2HdkLHuzRXnJCy7c9q89opb0ZRxUa3SFJ2ZX3bLmYDjFnklOjRU0w8L/16hsd5d9xR4MvJs3+Up4rzzyM4NVZaoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NYM52+wS; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NYM52+wS"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so1723120a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 00:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751008475; x=1751613275; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AQQGZP8E3Mk3yAfl5AsQy1iQwJzm3BFEFB1Lc1DUr9w=;
        b=NYM52+wSWuUIInGYzhFsHmjTbwqNkiUcRyYdt/a12FDjPzHT4cvki6J3Ef9pgROLSm
         3DwOXTT3f0VcSGhpAf3N8u+nL+FBCPuck/SQKrmG0rpShEEni0Q2s9edLCiptc7DZTmu
         YDxNApJXC2jyj3sW3K1Yi61FRu2w3eVCIhT3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751008475; x=1751613275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQQGZP8E3Mk3yAfl5AsQy1iQwJzm3BFEFB1Lc1DUr9w=;
        b=dCjg7aHbY9MfYoCJ7+6Lba87p+BaNmYglalcAKRfHkD3G3qRZp/9kT8IwtPndCXXa8
         +tnlsLPM7kJfOcr91SD4ePh6EC+Y+Jmg+ZqajSQ4qHUm/Dcjlmn47MUPI2gBh5ekKDX+
         fj/l4W5/D+zfqLHLoEWKrhhyJBQKReUzeo816NQD0/zeeJAcyi5isHHvC0MPEwaYYov9
         ZRYQf7xQekI1Bbnve8W92oJXOcV3N2YwMozczDT/ZWvNx9GaY4kkRZhNYdzjNnjYgycX
         cMrqWsAIV3De8eQaszVj8b1sMeE4tV3CEDxGmMSdKJCtMdGFAq8BdMraH43i+NNglGBd
         TbNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNfCFS0Qv8V+MEReBk5cw2Ln7xWPTS8bgPOJnX0lxZaerSxDY07KOkFzZkMB19Lk2qKnjknuzxiXej8OA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT8CdTxlbcST3pnIpPaPsWlVwfMiW+33p/b+eSkTr4Pz4+IP0F
	xsqp0Pz2XXh7AWORM9UPDAQenK61l0Bkyj78mZeCNilFnuck6sVPwHyhSVIYEl8xsw==
X-Gm-Gg: ASbGnctwwSwmlO2P0d5/M6Dc+2KYnggCPG/UOMusrPFPsSKEteVtGTzq3wdrcodRiwm
	10g5ut6ocz0ZfCkvu0iHTny07wy8zJtXjopQh6P39FzlHJoLDamaMYfEO2Tg4Fc0ZxzspTfJuKF
	a+cyGdFdFvXy8UAzrzWKJdN/jzkCewAkaWhXt30vCvJ4JlMZ7iAyzWb6EKi1RZWtn6vtQZ5Ffmj
	uY5sOgoT77m+2MsYOarhA4+yRhxuWNyhqkc8JPi1pWLb8DX915Z9HfI5ao5suyHrOtC2XDMsZiV
	PRv9wBfBfp3Yo78P8XKz6aS0qyGfPv0nE0SCAwYcw7CyDGn35HC/P1gtEUK3ANtmjmqotZGJTtP
	C
X-Google-Smtp-Source: AGHT+IFEeMckAwHl2Wie4Br0EJx5o3lYirvV/GsaZHYr3pkQ1uZ7EgbwhvZytiHcoLlJBTmyb7T0Sg==
X-Received: by 2002:a17:90b:1844:b0:311:c1ec:7d0a with SMTP id 98e67ed59e1d1-318c92ee554mr2959524a91.25.1751008475565;
        Fri, 27 Jun 2025 00:14:35 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:de1c:e88f:de93:cd95])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f539e69fsm6373395a91.11.2025.06.27.00.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 00:14:34 -0700 (PDT)
Date: Fri, 27 Jun 2025 16:14:29 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jens Axboe <axboe@kernel.dk>, Rahul Kumar <rk0006818@gmail.com>
Cc: minchan@kernel.org, senozhatsky@chromium.org, axboe@kernel.dk, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH] block: zram: replace scnprintf() with sysfs_emit() in
 *_show() functions
Message-ID: <2tckds345fhwxxxfjxsvbvktz7tdnd5mt7yvksoel7hpq4qewd@3uubp65rld3d>
References: <20250627035256.1120740-1-rk0006818@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627035256.1120740-1-rk0006818@gmail.com>

On (25/06/27 09:22), Rahul Kumar wrote:
[..]
>  static void reset_bdev(struct zram *zram)
> @@ -1292,7 +1292,7 @@ static ssize_t recomp_algorithm_show(struct device *dev,
>  		if (!zram->comp_algs[prio])
>  			continue;
>  
> -		sz += scnprintf(buf + sz, PAGE_SIZE - sz - 2, "#%d: ", prio);
> +		sz += sysfs_emit_at(buf, sz, "#%d: ", prio);
>  		sz += __comp_algorithm_show(zram, prio, buf + sz);

Actually, there is a tiny bug in zcomp.  It's unrelated to this
patch, but I'll send a fix as followup, to avoid any conflicts.
