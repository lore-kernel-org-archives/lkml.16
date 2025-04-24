Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4AC28A1E1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745535997; cv=none; b=ifftDa1+IpP+JgG0xRJJ6SaTNOCR7yeplFs88p/PUsmqYAGkUZ0n39RP4KwfJGA/1Ri8MJwB2cV8AROTiefF1TTP2W5c6b1Y3JdNS7DVbVNsY/8mJ7fbtbWjLhKubqsXn0VPz+MLLnmif4rfP/tnVnuDoDnDR/v0ds6se8APJyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745535997; c=relaxed/simple;
	bh=zVdVMpwdwku6hQf89JnqL0nu0gswHMXefZ0dFzVmLJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=doj1JdMSvCGbbma+no8N5f6VYVNj4iciB4k/infVoSM7LYwSjwSQeg/cCK0u0D6HzXgW+jx4YmfS0LHd0Rh9d4a8R6RusMlKV4JFtkLk5RemxPmtkkBsOpg7UoZ0mLlNt4a5IvE7kIczg+o6QDykj4LCrvcLsJtEJB0223lJwfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=ITkTACpp; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="ITkTACpp"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af548cb1f83so1591194a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1745535995; x=1746140795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+MTgwFQ11NGU16038peeNMEsxZdt3HC2woATvDfNrx0=;
        b=ITkTACppkwOZ8JjCwlwpPJ4LuLo5NlRjS/lUzjSdWXplhQ2wkkpazZKS1r8nsBcoJt
         uRNZO+nZaTgMiP2JwAxwZR6G7nYNHUvRsICyYDk4pOqIS3AUHN7THn94C8zryzGmRRzn
         ZTNuUr+1LnaSmUkPwT1NkJQkEhrFrogKGZBDbcTZYfzFr7aWD4ZoS0dqW7RyBsd+7hvL
         b1bh8l/USiTanCLve0XQ9JjEfV1YMrcPBnfi0YCGQGoTwl/BQpvQQITE7uHqO5tWM5Oq
         6193Hlzyg788AiG5/uErMp7vDX8ynap0ELzPkDCZU/dKpbPXzu+af6Xop74sHPiyF0Rs
         AN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745535995; x=1746140795;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+MTgwFQ11NGU16038peeNMEsxZdt3HC2woATvDfNrx0=;
        b=YUqWwNL8fNAZ4viEZXLbLvNJhku0G/oNf+y11ZprNvNLmX3dMA2kjNqaNyDYcm3Iz2
         w8XHb+HlbidfxNWm9i3b0+1cJK9+h+gYGBm4UpWxQyGt+NJjJL2dFnpP0lECEy/Dpy6/
         9Fg1GKuEylDNDtPHw2Mt1HcnuQK8TRS3lWge1S2ZomUHWS2oMh7CYb9e+wJkWL4YWKQO
         xEuiSIm7IqzBBI0UZJvq7ZFyx/+UymZlMJlVMXsCDaYpU8gBhB7+/NK55u9iYV2gVTVP
         o/CwgT/8HRul4YdlaiJkH171cOAh5/lThHbqs5lyt3PK6l5L3O4L/Y+iAmYCgUbnuoeg
         eoew==
X-Forwarded-Encrypted: i=1; AJvYcCX+0RmdzVMcQofPewodg8skZNsuZMe9KgYR0BE/K4QLyk1G+Nuw3Wuo40yLkTmCjmmpXq9MVlGLqnVQoSM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3n+5vrzXU+DFM1psMqFDg/Is/EvKIxWzWHFIj6si+IvfoA4DA
	9fx4souE1uojGK1++si4IgxwND5fz5Re8slXWRfmrbhyO0Q/UwooevZmtBb0KU8=
X-Gm-Gg: ASbGncu6Q7OKZCXPNzTN4nMrjtavhg5aKkr95xPK/M24VirAib26JN7kyygwfgY01qc
	EWhKxvDkHmSe31GBlOuJTSpxqBV+NpwoVAEDa7sZb+HSzWCpR4oj8eQcE4BKr5WAFsLpHMws4rk
	QhtX+7s1zvGqm3DNKa0VolQvV7ijGX4NkGkqpNuJnSLjV0sr3ltuLVqRcfLXoXoSCxGl9ZOGNS0
	VPty9aWcMIPH0V5EiuVHFRVje2Qak35jPPQawIW+ADVIyirvKe2Mpys4k/zh7CmHvngonKrCas7
	r4zEwmTD/gv7UYS4yG1PMuo9EoPWrMXU/Q86y8Qk0LX4e4o=
X-Google-Smtp-Source: AGHT+IG7bUAE/0tRWQcE15bPOILscwgPxL9KoMihzaNxE5X6mQyp8Gp00b+X+517kcg7/0UnQqovkA==
X-Received: by 2002:a17:90b:5344:b0:305:2d68:8d57 with SMTP id 98e67ed59e1d1-309f7da690amr472342a91.5.1745535995137;
        Thu, 24 Apr 2025 16:06:35 -0700 (PDT)
Received: from [192.168.1.12] ([97.126.136.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221bf9sm19273655ad.258.2025.04.24.16.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 16:06:34 -0700 (PDT)
Message-ID: <5e6eadb6-17e8-4ff4-bdd3-4ef13ba845a1@davidwei.uk>
Date: Thu, 24 Apr 2025 16:06:34 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] selftests: iou-zcrx: Get the page size at runtime
Content-Language: en-GB
To: Haiyue Wang <haiyuewa@163.com>, io-uring@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <shuah@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250419141044.10304-1-haiyuewa@163.com>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20250419141044.10304-1-haiyuewa@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-04-19 07:10, Haiyue Wang wrote:
> Use the API `sysconf()` to query page size at runtime, instead of using
> hard code number 4096.
> 
> And use `posix_memalign` to allocate the page size aligned momory.
> 
> Signed-off-by: Haiyue Wang <haiyuewa@163.com>
> ---
>  .../selftests/drivers/net/hw/iou-zcrx.c       | 23 ++++++++++++-------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 

Reviewed-by: David Wei <dw@davidwei.uk>
