Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FF223B61C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 19:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750188837; cv=none; b=XQKsC4gTXjc6vDjaW3xrcDY9JdHPtuCIw6C360f7tucKJQYsgQSfvq92sLCeU9QbidLw1yClTtnMblE64Pl95t03eM9GqNCpf3CHdUEkfa327vGLpMI9huB5UNSeUNETOvYdjJA0x8I1g67HpbTDUHXr1YDN4/5XuJrcOT5urmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750188837; c=relaxed/simple;
	bh=k/TpLa/PtWMfFkZ4PpMbzwrabb0DP58l+kNvcugkCXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qj3Uc9ZnKR57pbEzvsSGXXEb7Sj23695RzJOs8Ub+eK1Qz7g8zqGxrY2BntxBD6rE/MH5eiv+jUaZN8GLOw+LKifHQmS0KMybtnDITjl/wrzOiSt7i66VAtyXCGCLPlSeAzmlnUXby9cXsW7hMaZce1y1GT7RoyIGwJiyLNLmI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=savLHHtk; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="savLHHtk"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a54700a463so4935f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1750188833; x=1750793633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9AFIG2TIq+3H8Om9x4puK4H6GBxJfrgH+yDtc9rGns=;
        b=savLHHtkigRbwEN8fhi74siBsUCc+NdjO2fW09sXrReDg/AVqKUvVC/SOJeM2QCqjj
         HEiK8N8OVoaPKnYMb6tiz37a0lmQBfVgXBSTLFhqI1WKko/32WNYGy9Iom0lTSIWKaa8
         YwZq3WDXWIbmnrHfQEijcdZ1pailuJNzHv3upGZ0yD/Giuo/OennSjsTBGz3ALZWt/sp
         DmuclvbbpFJ46Lb+QzJW22013+rxP/sPT8NFEuino0+VP4KswBTO8lQznQZc1j+BK91Y
         FkQi0DNAz43EnDBBe1Rf0zF9a9c8wGlio9SChnfutmruV0UPwbX3f9eY00/qUcYwgF+3
         zkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750188833; x=1750793633;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m9AFIG2TIq+3H8Om9x4puK4H6GBxJfrgH+yDtc9rGns=;
        b=q2sHGLnrYt1pZJ00astnC0wSEb/+vNDJzPix9qPm0EY20E5NXNKgJ7vgGxA9YM8jII
         o/H2OHY8qfw1amYoNLmLFZKx4SdqwcuVnLCS48LdeyHzEzWpaOmC81OtAzLMTEMvCrsW
         XOXXQws8Qsca8bdVwbTQqH3Epn7CoUvxGMQeuFEgza8tmFmC1Ht51lStvdX2GSBiElWe
         6PKuvDHVFG05H5E/obZOVN/wT16uSNfK3sHTH17tcWV6e4N//h8yax++K8Cb6HSuzwUm
         /7yWMviRwWsQ6CewNZhVIAt7Hq2jKbdLZtfK35cqAStKxGJd0lyeWmnc+pukti37ao0F
         TnLw==
X-Forwarded-Encrypted: i=1; AJvYcCUw3cCa2LvDvDCDdFabLyiY0ViHt1LO4wwa0lsHpLgVjH4IdLVnJG+d7AVFyDJ6sYIBU1n7l7yFJphCgqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJQm1lhAhqBzMBAGzVlLh8yEAi0CmPI4sS0QF/MwsrTE5HcPhZ
	HOUOAB/MepcX9HBb2G++cUl4yMN8fyo/nU6q/oAYotwcYIBpvWtwfyHvWzALQwxstqY=
X-Gm-Gg: ASbGncumiLsnNarGK14EJ3mMGA8k0OT+ZWPoK7E8LGyOP5Zm0VFxdxgY42tMmJUGBUY
	nAFcQdRgTVf43JnftbrX820aS98rRe19DWEyMzHkhaJvkSz7JjIaLZjK/mfM0ne3eYkTjzIfP54
	tF7kRnj0yfwsl/YcbcKNxrtKmk19pqcbaKpojiXnbBZDvo8SWwkzxD8Jsjp42hdl9aeLVJezNwY
	D2LZS3V4BO1FyEOXNn2he03tFkRAIcvoED1r9SpaNhPUOBU2Z6aPHcmcS6iplAdBrCejSl5PwG7
	KM3Cl1GImL0V1HC8qoUvnj2lwa+S4OTq3vZz34a9Qx4AK41c5CdMfHXa4uaFcY6HuiOE6aBz1OX
	A9g==
X-Google-Smtp-Source: AGHT+IFdeD1FalHjh/M0Id4CVVT8Uo1X9UM+/h0kDU2haqdwcsz+E9jE8GI2CMfLB+2+NJ4yrS8evQ==
X-Received: by 2002:a05:6000:2f86:b0:3a3:7117:1bba with SMTP id ffacd0b85a97d-3a572e85245mr12261631f8f.24.1750188832660;
        Tue, 17 Jun 2025 12:33:52 -0700 (PDT)
Received: from MacBook-Air.local ([5.100.243.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b089b5sm14613782f8f.48.2025.06.17.12.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 12:33:52 -0700 (PDT)
Date: Tue, 17 Jun 2025 22:33:48 +0300
From: Joe Damato <joe@dama.to>
To: Breno Leitao <leitao@debian.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	David Wei <dw@davidwei.uk>, Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	gustavold@gmail.com
Subject: Re: [PATCH net-next v3 3/4] net: add dev_dstats_rx_dropped_add()
 helper
Message-ID: <aFHDHOAAqym2DKIq@MacBook-Air.local>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Breno Leitao <leitao@debian.org>, Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	David Wei <dw@davidwei.uk>, Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	gustavold@gmail.com
References: <20250617-netdevsim_stat-v3-0-afe4bdcbf237@debian.org>
 <20250617-netdevsim_stat-v3-3-afe4bdcbf237@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617-netdevsim_stat-v3-3-afe4bdcbf237@debian.org>

On Tue, Jun 17, 2025 at 01:18:59AM -0700, Breno Leitao wrote:
> Introduce the dev_dstats_rx_dropped_add() helper to allow incrementing
> the rx_drops per-CPU statistic by an arbitrary value, rather than just
> one. This is useful for drivers or code paths that need to account for
> multiple dropped packets at once, such as when dropping entire queues.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  include/linux/netdevice.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>

Reviewed-by: Joe Damato <joe@dama.to>
