Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7900320B80E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317079; cv=none; b=snvyWiZF4TvVLipz99I6B1KggekJF7elCF1RD/B39yJzpKrJOpg+lle5NvyfJ1y3mvSjDADEYDY2xYQOkz+RfPAHx7PTLAi5CuJMLugwIsW6mMIU/kAE5L37XhAXygeFDE6j8NDnhgiGlVSGEYLeizgApWMExom0Bajq/E5/wKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317079; c=relaxed/simple;
	bh=RgffgJUUxVeQDwmHjDJntCJjsu15wrEwIwy6V21yf9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f61dIHuunuWBWs1WdGVRvk4BEmTjamOhf1Vq3lyUrDtSt2s3ohlhsnek5MQEtiwCdoAqjjMjlkx4dMiG7BmpNSXwbsqyZWKZMzON3IRznLCQugigzX/+1nr6z5gQitSXTspEufpU7PgYSngDRJshAT9zvrBbw0jm/U8FdhR+9XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VR/rn87z; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VR/rn87z"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so43523115e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 03:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745317076; x=1745921876; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lz1K/C9/tfj1d+wAEb3dh4y94xlC+cBkVcwPFbmhyE8=;
        b=VR/rn87zYZo5IGLS1z5u+4HGwQCKGwVMBZyOreJMB8tkENTG5XpmZG51srd5UQxTPZ
         ibYgZ9ZgWt8jtkeDADVxaceAof2vrGPzXGVyQZrKchLe+eM30J8OIvtw+12qNP+++lVP
         +87UCWEqEgLPcvQSJruaVYt5E78DHGXeSxhQVRyajIK7LJ7ODr+BUCsYB6+w+E9fqAxA
         Rego665M6usZBl1QXFw6BWp4Dz5IVQ91+OdqsDIC4pm79nZixdOOKRJk+ryuBQdMVVE8
         BCX3XAo7/e65NpMPdgg5U7ljAo3VfoNR5roW/G2yMWidoWqrmRaBgbUkw8PSqvGY9aC0
         bFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745317076; x=1745921876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lz1K/C9/tfj1d+wAEb3dh4y94xlC+cBkVcwPFbmhyE8=;
        b=EJHeI3heYVnNM+sf2lpuFGbGw0SkCuRx/GJ3Aa/ko9juOlbMSJ+RAEnwjs27/emJxC
         jfnKCT/O/jVAWVQgy6DuDsUMQYmc9aAxvPX4Z4QXv65GuFwbTC9WbgYc1MwnJqt1WZkz
         UK/eQbItekpFiQIW0FbTU0B1ks3WgVqckAqPfeaig4cJdGLszBh3ZpimWr4O5M0g0Bwo
         AcLfEKvUCNx3iJnlE4utYQ9yXS1JjSh1XY0oZwDvKNRmWwOXFHeETKfWtL1Mfm0C/Mvy
         3hkfRCRskgTZOFPaConR5X2EhB82lNJelWvKiaAgYM0APQYd/j253h7rF1qWIxEV5zid
         A38Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwIdinl7WpqaehXP/ryWXEauqnnzbJR5depBrgGiCgluBu018jt8vFG0NKP33zkCFOI47S/lN1hrPlAI4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGOSZ4iKDWkeIkNth0zv8K2Qjxag9QCuepuJc4gbv16YM5dB3D
	iWT2XRRjmHodBCxUqtx2Dm/86+eu55MdltDeZaVI7XPXk9mM+Hth/R32/R7S9XQ=
X-Gm-Gg: ASbGnctsgjmIPXdc7/kisykhnruVQ+PGMoIF8LlBi4PNIf6bp6rVX8PWZgtkGT4rTCf
	T7z1NfdyliNOU0HHIErxVYeStQnzxWJHfIfYy9jxWXSoiHWjinhJX2KGXRzHPF65jKh48BnxxdL
	QINU0/Jpv7ZST846YcmojrnUk8CXYBKwvTKOEanJ9Xy4IUt9X9/H3d0y0jAeBCCUWl9EJm694fA
	EYFohLBBSw6sGD18JL4Y/rsifhfAq/ua5PG5wLQQDwUguVt0N9Xymc1i+RHG2cD0RU7DuOOQMrG
	VvxDp4gascEK3sbQsyUL2c99mWLtxRSFu6nwQQjrtPJxN65BDP2+E+9MHx/Fs0rqKe7y8R+SRw/
	PX1xdPfUO
X-Google-Smtp-Source: AGHT+IFBAlljs9+KM+mNfqqACpkyKOlirA1L5I4KDTzp2FQs6a9A+hezcRHzCm7KfDTFO0bJvS1w+w==
X-Received: by 2002:a5d:588a:0:b0:39c:30d8:32a4 with SMTP id ffacd0b85a97d-39ef9467254mr12012439f8f.26.1745317075690;
        Tue, 22 Apr 2025 03:17:55 -0700 (PDT)
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408c7cfcabsm9310395e9.0.2025.04.22.03.17.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 03:17:55 -0700 (PDT)
Message-ID: <0f8415f6-7e61-4036-95b8-31e702480c6f@linaro.org>
Date: Tue, 22 Apr 2025 12:17:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mips: ptrace: Improve code formatting and indentation
To: Thorsten Blum <thorsten.blum@linux.dev>, Oleg Nesterov <oleg@redhat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250419102744.136697-1-thorsten.blum@linux.dev>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250419102744.136697-1-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/4/25 12:27, Thorsten Blum wrote:
> Use tabs instead of spaces in regs_query_register_offset() and
> syscall_trace_leave(), and properly indent multiple getters.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>   arch/mips/kernel/ptrace.c | 34 ++++++++++++++++++----------------
>   1 file changed, 18 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

