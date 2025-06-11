Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540D6C148
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749654044; cv=none; b=aZr+wqPrVoMzpLZbFljOh/vnLnW2ne1o3Tcp2YfVOgXMIetawtHMknEgHrJ9CXtN6yjtLCirwXfQBmkn+vJTl8X5gRgo9z0lGgnV00l0nP4s7aob91+M4bBazGRnJY7sHzaleuvS+o0lmATnYIQykHFNSyDXgwvOW09NdISuSo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749654044; c=relaxed/simple;
	bh=ya+nEh00fQFy2gMFSp7ZKYL/qH5nwJRnW3gq9p3hfHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gb3/2RcvxQkQNOzIwXAkhZ01efcHf9v+3dhTt4xDWRlnccFypGGNEZxNCbqZnkaQi7FtYxDkSRNLYfsp1PJAFZg2NtMGo1HgXOroTjdCh6mwIyGOGGPao3/Wc2SkMl8yqwR1NmN3U9szxPHfSzDlKpmpB3/hh4IIOxr8nI0azC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fi0LKFUK; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fi0LKFUK"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a54700a463so762463f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749654040; x=1750258840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=edmPMFPNCGBbcUfHWPuxKmJMbMtdOOjJESV7iS8XvxY=;
        b=Fi0LKFUKB5XBOgG/oHpVl+1vOwc3p6LT2ai8cghDi5BWvs4GzUOmOYz3o3j1jKEEo7
         myYI/pTYE/e6t+nWvcF+p4Yma7CouO4/yEe1Vel5OQgZXihIaYdjyJCvlcJL3Yuz5DSg
         djnc+7LLoDQQWIj8kuZmFq+IxH+/o7MGv5wTf4n69M6hRpiSv9qq3C2HsNw29369AJql
         X+6uUjGieK1I1mfv8JB8QW8HxlR7liXoB99DIi/0QsIiPrgoaiWWZa0t769qSyW65WMr
         wbz2hRKKxMC+pzAXV7OZASXlvTtLxFOWQ+ffGjjjPvGL93fLnDpl3ZenseKLGXw9Nour
         sG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749654040; x=1750258840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=edmPMFPNCGBbcUfHWPuxKmJMbMtdOOjJESV7iS8XvxY=;
        b=DbeklGSHKjRAOKG2SCX61t1BugDeOhgFiViLawVDlI+15IQtEe7wPcevgqStRYuzqH
         7mBpq3cYYnfHArWOuxdwcJq4u0/9KrR4p8OmWU115qCrbM7OzdollP3313ddZIc7UK5T
         HdZFDzFg88rlhA/ffPU3joXgPHb1uMj8ovPo0Sxluoqchf/AGleaPgzlwro7AivKdeH6
         CpybsMABSO3Fs2vG5KdsB47MiT6CJyRO8hdSXgdJOIiMlOEvBQA9Bwnjj58U09BjBiSl
         oY/DkUBzQzjkjZ13TDDtZuOVjszJou7ZFejcxBPsoL/EHieUCHzNkwGRroyL6I8lHNnS
         jOng==
X-Forwarded-Encrypted: i=1; AJvYcCVEvko4cVELYR08mbGjkaNjsCXrZgGeIAh5mGXHpt4X6ej0EfjF+Lp0vfD4d+QvsoUlK2EcwWaxTRbmFzk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr6yxnBMrYQnUGu3dGJLPaF9WsXJN+Eh7Xxr/QQ+u9YyIJYh7f
	93VU7JyTuulhFc/zP/s1lpx0qDNKrfsY7q6/3BtO8haTkgKNbSUgaqnMTKVS2D5SfGY=
X-Gm-Gg: ASbGnct6gD70VgqEHqllO6wOcgPbKiTacMyFBrSP57kt28REmZ/g8nspq58ch+CIUkh
	mDx0stZ/T3a1Lvre7IfhBi+ZqgQDml3rCxr3xFGLc+jecsgDpZN0zfm/XG/QD6hsIpjCM5H1k8F
	RLPAgSE5AuKTbtmn29rOxkZ79CKOPa96OjuLBK7K0fqqqvPoi+xykpwazzwRF+rj+wWnZ+41tYi
	0R7Xam/F1/MpfXOl1r0hcJ8I+U2P2veGU7mNVqjyxiqtUxXwQaMa0pwpGieW0ndgfxNX58dTOjt
	z4jWulm1nek24TF+EqhLK5PQ5m4n7SsJZkzYbxqrjSe60Z7+Oce4Jnl5FiF3YJjnvFA=
X-Google-Smtp-Source: AGHT+IEzzhcppUbW1+BdtVXwBwJBi0yjHM3LGcXgg4DBHtCKKJdkIrDeqab0FDLQ5lwfVDcVY6scNA==
X-Received: by 2002:a05:6000:18ac:b0:3a4:f70e:bc25 with SMTP id ffacd0b85a97d-3a55825d69dmr3535626f8f.27.1749654040196;
        Wed, 11 Jun 2025 08:00:40 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532464e3csm15804587f8f.99.2025.06.11.08.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 08:00:39 -0700 (PDT)
Message-ID: <472a47da-e442-4335-92f3-9a0263107fc8@linaro.org>
Date: Wed, 11 Jun 2025 16:00:39 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] spi: spi-fsl-dspi: Report FIFO overflows as errors
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
 <20250609-james-nxp-spi-dma-v1-4-2b831e714be2@linaro.org>
 <20250610215233.35ikv4sslkyukgwr@skbuf>
 <d95fbd83-995e-48ca-bf23-147caa80b9e1@linaro.org>
 <20250611145634.ncbzl6wwwxlidjl7@skbuf>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250611145634.ncbzl6wwwxlidjl7@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/06/2025 3:56 pm, Vladimir Oltean wrote:
> On Wed, Jun 11, 2025 at 03:40:40PM +0100, James Clark wrote:
>>> Also, could there be individual error messages for TFUF and for RFOF?
>>> If you are concerned about the penalty for the error-free case, make the
>>> check two-level. First for all errors, then for individual errors.
>>>
>>
>> If I was going to split them I would probably let the compiler optimize it
>> whichever way was best. The real reason for combining them is because
>> usually you get them both together. As long as the message and fifos are
>> configured correctly you'd always get TFUF and RFOF at the same time and I
>> wanted to avoid printing twice for one event.
> 
> In that case, why not:
> 	if (spi_sr & (SPI_SR_TFUF | SPI_SR_RFOF)) {
> 		dev_err_ratelimited(dev, "FIFO errors:%s%s\n",
> 				    spi_sr & SPI_SR_TFUF ? " TX underflow," : "",
> 				    spi_sr & SPI_SR_RFOF ? " RX overflow," : "");
> 		}
> 	}

Yep that looks good, will do that

