Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D86213E65;
	Tue,  4 Feb 2025 13:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738675582; cv=none; b=PkJT9eFn4Za80C5I4Ux5lqXnTZIzg/+H8WD7oeKN81FxQPid4Y5d5syVyo2xJw+Nk6YvCQnzq+HfA8pC2Xu38PVHIp6K1+pcKISnEwZdPXRYAIIxsiaG8TE16manCg7nQHUSrrvRTuHxmxjlA+crxciVkOScxOP7YVflx4SBhgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738675582; c=relaxed/simple;
	bh=D1W0lSW3hhznEl89GtNTmJa3DXeoKQUNCxnqOJtkDsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cfrqQQDJ262etJVYD5fNfp+CkwKc4zdTbpxW42kj6NdWuSR9auVFfm2NGvjPW3iemmrKxABhZdk964GmDc2w+j5c5U6CUafHrhxPsngJnpEyL3OBvHlUSnu7mMaoa2JeRqSKm9Jfb4dZLKfaoXFhM9GtG9Zk+TM1rn8dEZjP8Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSGM2nJP; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSGM2nJP"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-219f8263ae0so103259295ad.0;
        Tue, 04 Feb 2025 05:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738675580; x=1739280380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MSyTlNCiPQbh+bsbPywvd7QCckbJTtwgD1uOlxbsISQ=;
        b=hSGM2nJPmbpUsXkY5IJkZzQyfQOzkym/x5vX94mXQPPi2y/wjrsvVNazd35iZUb9kg
         drjQJk8KuZClDABdQ4Rf8lDR42tT23j4xqoHgQE2oC196oUg2TD5drPp7Uv08pVOPSfm
         lNqtxZAzXSUO3CLgFVsZQsPr8mIZu43ph8vMctu5Eopy+HtWJURFm0ZI3Q3JMGkOVLdS
         Yxf/0S8nSrZ4gtWRHUWbnXhuPqyy+haI/6w3NvzyO5AGLbAyh4/GBMAr1Mag50aCMJmx
         a+9PUwh0NVdTdsF8m8hCqIZ9tzoShY3dR7WEbrIBKoFIjbaDLuConslIJpPmRmhqi8j5
         MXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738675580; x=1739280380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MSyTlNCiPQbh+bsbPywvd7QCckbJTtwgD1uOlxbsISQ=;
        b=uwxUlehs9iY04flUC1Qz6vdT/ul8TnhifLM2WGsn4R8Bja1Os/qE4LBmTvpXWIOzx4
         fXHAPV+WvOQJFQohG36SSvqJYkf3ZV/lddPdzhcIfLbA7eR/5qWzxC/hKDLKsXV1cP4O
         3tAfSXoPXO2XDtm9Sz68IXiL9ujhtXsdcqVUShex5Yem18HwZzqtyJkUbgE2sewruTuf
         HKsLgmTjWEP/u6ifuMX0BcrlXxVGeG/AeehOjBTi70LaI386JIWrDx6Tl+OZaMy6Waej
         tUEi7kdZrNNqMZcDXcCHa+8zQwCq8gR3QpWXwS/uOKxlyQ5USsT5JJZuNJ5+v2OyEZ2D
         YK/w==
X-Forwarded-Encrypted: i=1; AJvYcCWGfGCx5TQNeKBE2+NhJgRsJVUQpswk6jicJ+xbAmFKN1DEfj+ASrgCr3sa6KlS56zswrF7nkhsz/OmR73D@vger.kernel.org, AJvYcCWTyo48r+SacFwv6/5clFWn8P8A80KR945oWR155SV1y9JtHAL81LzPzDnz9lND4EsGDmnyt9G9xqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU+TUAoz5ufZabrcwkgY3JqyQhQTEr7/S6ObmCQduCdY+xtFCK
	LLAZPF2nAkbT5TzJ438jKLuCjdZqLgj5Xj/RnkPACc6FCrFyBs7C
X-Gm-Gg: ASbGnctr2Z9Q5/9grUpnCJKKq0YbZuPK84/37LDw1iePPXx+eT3+wMDeoPqiGiEKNMa
	U98pUPoB17DdyoEVBRxoShEu7XyhNEKC9RXPv/1MvIAkK5sW+L8WkBPB+hS+nZXHygSsguabRVn
	VtNAD/2O4gvgBcI3YaBHeRCocXSvvNlvNO1SI3gwiE3ECqp9ViF7s/7xfSXg/d2aVn8XMUsp3QG
	eKgg3Ls6ehXtp5kIIxZp9i6+zVb6H6sp/bU2y6Zj+iSntwmHVZcScfKRQKceO6Gbixyb3KLn0sh
	A5p7Hg7EEN3ZRhndsdoCgLbRzCxowQF2U2Nv06+ZQ0c3jODQ1xoUwzTOIzR6Vw==
X-Google-Smtp-Source: AGHT+IFHEFE2r/dCdycRGjz42sPrvgEfxh6qVWzazr2Uqj2El6VyShPNSy9RSy0+dCTl2r2K4mg5cA==
X-Received: by 2002:a05:6a00:1411:b0:725:9f02:489a with SMTP id d2e1a72fcca58-72fd0c5ee8cmr36415854b3a.17.1738675580047;
        Tue, 04 Feb 2025 05:26:20 -0800 (PST)
Received: from ?IPV6:2409:40c0:1019:6a4a:7b6:abc:27dd:e5f? ([2409:40c0:1019:6a4a:7b6:abc:27dd:e5f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631bf13sm10446186b3a.32.2025.02.04.05.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 05:26:19 -0800 (PST)
Message-ID: <719aa4cf-15d2-4e4b-8f40-cb6f5958120e@gmail.com>
Date: Tue, 4 Feb 2025 18:56:14 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Move "debugging" section to the top in index.rst
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250203195323.13012-1-purvayeshi550@gmail.com>
Content-Language: en-US
From: Purva Yeshi <purvayeshi550@gmail.com>
In-Reply-To: <20250203195323.13012-1-purvayeshi550@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/02/25 01:23, Purva Yeshi wrote:
> Move the "debugging" entry to the top in Documentation/trace/index.rst.
> Turn index.rst into a good starting point for people wanting to learn
> about tracing. Make it the first document users see, as it serves as a
> tracing tutorial
> 
> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
> ---
>   Documentation/trace/index.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/trace/index.rst b/Documentation/trace/index.rst
> index 2c991dc96ace..f3d235c8438b 100644
> --- a/Documentation/trace/index.rst
> +++ b/Documentation/trace/index.rst
> @@ -5,6 +5,7 @@ Linux Tracing Technologies
>   .. toctree::
>      :maxdepth: 2
>   
> +   debugging
>      ftrace-design
>      tracepoint-analysis
>      ftrace
> @@ -24,7 +25,6 @@ Linux Tracing Technologies
>      histogram
>      histogram-design
>      boottime-trace
> -   debugging
>      hwlat_detector
>      osnoise-tracer
>      timerlat-tracer

Apologies for not including all the relevant recipients in this patch 
submission. I forgot to run the get_maintainer.pl script, but now I am 
sending the patch again to the correct recipients.

Best Regards,
Purva Yeshi
