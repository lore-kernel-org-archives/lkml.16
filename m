Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496EA2BB13;
	Fri,  7 Feb 2025 02:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738896778; cv=none; b=IIu1OpEQL7quH+SjNz+0BWu4td0znJvb+pA7hZzuXEXXubQ8MfDapDSAmWJnZyC+rJ6a4/ppdcFX8YsewQ8/7N8QXqGoeZNmLlMVYMZqhLd/HJKKKHMz/k3uksMg2c3pvI0WbIobm69Hv8pJ2wIZENz/nNHgN4LH70SshvUPrwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738896778; c=relaxed/simple;
	bh=RHsj9IuSBInu42K9Wbd9TL7LCllhWd/ykBxgJrXb47A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qwl4m8/17kknGFp8nTBTWs9WrnvbMdhYAqlw+5jbvCzy88i8Y2OnPeT7zEFW5mSh/HqvWJesCdL9Vp+tiWFXU6E44ueEDPXVExa7z2zIJts56bNAS5DW8kzp/pWwGnp0Mx9vxbyVshqAvBQnmkngTTqCdmmB/3Z2e7aV40e+tGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFbQJ6uY; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFbQJ6uY"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fa1a3c88c5so1336365a91.3;
        Thu, 06 Feb 2025 18:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738896775; x=1739501575; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yDtyWbBi3ccKUXxuThUuEN63OaOAoA4ZDlBDFK9TCsU=;
        b=lFbQJ6uYmUqsYPY4EVu/TD1UOFMWS5fK0jJHzOu+AzjFnXC+WVvzMKWZea4s7tq0xt
         7WHj4jrBGqrdZkfyMpm4Z+f/HPcW+K1Ow7CQNRcRlvFPMKenoiGa8fm00Iwt0GS3OBkT
         HQToFAGaTgwI8mqPaoBzus0535skCgBWpwEmpqT8dKC0ETZTCap0Sml0aGseEuftMT5v
         JhANNG+gTl2nDbxUHhNlcug4xtI0wfxDCw532Cx+TpmZx3A6p4sTB57dIeSw43UC/K6K
         ncdrpvprQQ7o7jhjkqtmtsay6kWTp3fqohE6HwOTCHZwUdJu6z61C5fANPHfEO7c8iRK
         g+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738896775; x=1739501575;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yDtyWbBi3ccKUXxuThUuEN63OaOAoA4ZDlBDFK9TCsU=;
        b=cOc9jv+QjYYsrAhR9v7vlOopYvQVufvvR7F3CrSqXE2ZdVpTGYwaKYLIaK7mQWZhq9
         gqypR8GsdfrCa2Tl2LMA0+39XC/ITWUPDC9SX3hxcKU61azRAOWRux6xjfmgJuYoJ2f2
         6mBEPXQfYX/AWL037pHGCBTHTXmActw+GDBRtIlM87z7OnqPfVC01DynjBfF8aoBhKPF
         JR6+J8NnfACh+SklwEFe2NnvUBvfqDES0uDbq/tuCm6OnMMsYZuuPMocAN3X1lA0N+1p
         J57NY5W3nW+1oUNF07dSFwCt3SXtO81+0ESTvyNWVKkmsZTPp3W/mmGbs+/vD0FoP58m
         36Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUhYMk0qpIFFaUPFn6w4t7f+0lfTm3Fu7vSVPbgjgOwZyzFKyPUuO5MRGD3AVH9yDjkwjlCqLlPrlqd20J+@vger.kernel.org, AJvYcCVXnASRpt045Hy1KEBxHx8vqJ8xY4ZqhN8PniGUgn0s1UEW9v8pa722DGjQZzt5KhbcwYtDjijBwwszvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh4xqPEhZWq7WruEsWNhIAsg7amcl2Wh8i8kQsls5MUxUOWky/
	kHG1o9iQcotH+Uv7B+dGWcL7sv6rTwWZ4jRdjLEsSeZsTFDTAUTB2QrLhQ==
X-Gm-Gg: ASbGncu6GBmzqVsj/ThIot2dvJh14CwI/MLH6hupa3hKhwxKSDmGXsQIeKOCL1KSNL3
	sTmT91nygvBVqyYieK8D56M/3CHR992KkKU4rsbSmR/f5ZK4nABnXm/KQPP1FURJbe57RmzCfPB
	P8KPiQTEHVmgfyjncqRemwohv+ffvFrrRUBqrYGTU8O2uhlfYo2vEKnltMFu8lQSnqjt4VYsMeM
	GBIOUBLljhrSujZVJO7+0mJJnBtTzCkYlbriMofRcFDjVHHqtStpq+GTReBnAycY7iWwcJpaHV/
	h0rcIuvg+bsckZeolG3B65Bagmm8
X-Google-Smtp-Source: AGHT+IF69KGlQPr1T047H9dm1pe4j2TtH4xGjiMLs9Z/+Zy2MRwtlhZ7ok1mDMnnHUa/N7sZGibP2A==
X-Received: by 2002:a05:6a00:cc1:b0:728:cd4f:d5d7 with SMTP id d2e1a72fcca58-7305d2a775emr2860968b3a.0.1738896775540;
        Thu, 06 Feb 2025 18:52:55 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048e1e804sm1965489b3a.156.2025.02.06.18.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:52:54 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 6 Feb 2025 18:52:54 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: =?utf-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?= <a.vatoropin@crpt.ru>
Cc: Jean Delvare <jdelvare@suse.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
Subject: Re: [PATCH v2] hwmon: (xgene-hwmon) use appropriate type for the
 latency value
Message-ID: <aedbefb8-7979-4482-a2af-e12eda4a4b6f@roeck-us.net>
References: <20250204095400.95013-1-a.vatoropin@crpt.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250204095400.95013-1-a.vatoropin@crpt.ru>

On Tue, Feb 04, 2025 at 09:54:08AM +0000, Ваторопин Андрей wrote:
> From: Andrey Vatoropin <a.vatoropin@crpt.ru>
> 
> The expression PCC_NUM_RETRIES * pcc_chan->latency is currently being
> evaluated using 32-bit arithmetic.
> 
> Since a value of type 'u64' is used to store the eventual result,
> and this result is later sent to the function usecs_to_jiffies with 
> input parameter unsigned int, the current data type is too wide to 
> store the value of ctx->usecs_lat.
> 
> Change the data type of "usecs_lat" to a more suitable (narrower) type.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Andrey Vatoropin <a.vatoropin@crpt.ru>

Applied.

Thanks,
Guenter
