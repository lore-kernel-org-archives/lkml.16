Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35424297A44
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297720; cv=none; b=JHSaeTPwtJVjsEOSfefuaIgvPRMfusPcYkMuiYDeSJlORV6Z5r4ifdvFW2xUtvrCbEp+9WS9iiBsoZZHH8S4pSjDohpdDyJM3g0LdQJxh4hiox43zuN2XhDU3tAUdWWsyPUVe31hzp3UVdvCJD5TGN3+tw5kgJMpkTxczog+/gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297720; c=relaxed/simple;
	bh=cT4iuFjjNAzHKRST/qVKulD/JL0MVOawqN3JUX+mvNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bSi380U6+ZK4xlnJAQL7Eb4rb6Tf278+h5cljDPQuHm8rERuVTXkc/rzrHPzslq+sMN9M4MQwPY+MldTYdTKrpB9al4NATI13f5/Qsgd6I8+A/CZ3VwFMbsEHxLEZ4CR+ThIa6TndmLPZvREyqJOtnrbnL/nSIoXvBUYWiYz/Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xUzfN+S0; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xUzfN+S0"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso6540325e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747297716; x=1747902516; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GG+n1BzxgNDC3GGn5Qn+IFR0CZW/PNnMV6w/wZx1HlM=;
        b=xUzfN+S09JuCw2SLBls7E5T2m4swi/ap/MNMhs39Cy15dfRiQot3jX7BcDJtz5/Foa
         PF5M0W3Hnmljqg8ckHteasgJPfrWTDh4XBzpjyNMyvQ15Pq5QQl90xybThyuBW1v43JB
         PM24djQEfhl9fStZIRiaatmOHC90ZX7UlGXY0zg4qEKgwbFw2b2u55JbmpOAfbyvjbrS
         n8kzbXMiMByoZntabIJH442OvZBDdwKRvsxT6QhwtMN7KVAhMY394zoE3goYb+MXlVAJ
         9PU+0uXZoxzncAyuu2zk/u9SE2e4KvF6RtOy0Vr1fOZAh5r5TeEF4mL8agZdK26Q/OVO
         nniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297716; x=1747902516;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GG+n1BzxgNDC3GGn5Qn+IFR0CZW/PNnMV6w/wZx1HlM=;
        b=VBfuTLlsJnt7cM8lA4Kj6iz6shRPby9B45ngdrKk714Fwq6taNVDoN5DFXnEossH2T
         9yvmpLDNVbHSfLqm4TbMwDVQN+TioTUigPIiQu3sbKOvz8LyZZYvU6bh1jiYY7ooOGOW
         TB3iDU+RrB7btPL9aO/IYfL+8NWww3nK684YFEvAvmGge2HUQqlAtpPgQ+4DuhluQ9xW
         bayEVx2FacYWGwoAMGG9L5RueUHc6aJkPXAKN0VvIynut94mHL/48xIMAp3HoIwl0HBb
         klI5HJI6iwTaVZbTqqQpof07XLtkgBq/4kCdnvDTceHT1zXOcWm4rmrKOfRRGQR25ajR
         MnkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNFIGa1afhVv6xvVcHivpWBtHGchjemmP4Tz1yBHb9W+XEELuwdnugEwe9WIV9rvdAWEn838jiNXQ2Av4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc5zflf34pu5HcXY563wivsPpFX7fUnQDKIKiWRz4FMml1hfTn
	/QWoFp0aPGicUBi/7DFqxfAyd7px8Ajw/Z4lq/23gy3qdpAZRa4jxwtLV8kvgfY=
X-Gm-Gg: ASbGncsQGZLj1PEmMKV+ai9Wn9gj/VvforjuTzv73PrXcAL3O/aPeOFGPe65+1ZfnzQ
	s/7SsC0zGSVr/i1Yg1P9HvkluqmItp5IfkoB6x0bI3CzSCZV++BCs7xyLsG/Z9HFtGH0j8CDgjZ
	P8iPQ7oVz9ZgZVcN4Yk/n2LGzqNmKhUcoOxlqg9zUzrxrvA93oGF8M5eYsBbGGtFRGYLabIvw/s
	B8S2S52nEiH68YZDgAUS4WKaBj+5zvYD6v39+S3a1B5jQ1Gn4ShC0Z8+DMk4wZAQNqnczayDhS1
	RHxtz6v6gldV0TJfgNcxMdo3QwVxfGYYEv8/xum3snp7MlkhXeN+ICT9rpdonxsRcJazgXHuDvS
	HjrTOSmygHRLyGI+w1cRL1+4X
X-Google-Smtp-Source: AGHT+IEvgvNGsZd5pkJVuylqyGXRmkrORtMz2ILY3XBQ64vQ9UgNy/cWt8/sXaycGYgGtgM7ecdc3Q==
X-Received: by 2002:a5d:64c6:0:b0:3a0:b84c:52b4 with SMTP id ffacd0b85a97d-3a349695581mr5840356f8f.10.1747297716435;
        Thu, 15 May 2025 01:28:36 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2a79sm21698415f8f.48.2025.05.15.01.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:28:35 -0700 (PDT)
Date: Thu, 15 May 2025 10:28:33 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: timer: Convert socionext,milbeaut-timer to
 DT schema
Message-ID: <aCWlsfFFvcj10XPj@mai.linaro.org>
References: <20250506022322.2589193-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506022322.2589193-1-robh@kernel.org>

On Mon, May 05, 2025 at 09:23:20PM -0500, Rob Herring wrote:
> Convert the Socionext Milbeaut Timer binding to DT schema format.
> It's a straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
