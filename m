Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2D61A5B8E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 14:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738852814; cv=none; b=mkHW40PTdVGai7KoZz6TitGqRtNy3INZvFt97y0t4+0QSdV0FXZ3oDmgaqfN1Qhp86ikeaVd/sqHu/YPImIilla2dSKB56h7njpKh76i0Mqy/b8rtz23NF9/c6e3ZBR1joTO9wdjUxPtD3bPCnoONWMNR/soW01XxjGPoIO0hQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738852814; c=relaxed/simple;
	bh=JpAxptbFMmyvPyTMd0gAMzXIKL0NcJG3/A4LZYoGB/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qCob6v8m4Q6wE6h8MUpwtzQ9dPlymJvEsfkwBpr7jYlLq9V+ktZs79rxpNH2dWu2hbw1SglRoISI2Flcqp/83p5ae45KHRKFrjrZUtmga+YVk2RhAKrRl+hPRFxWJ7pS3jl0GJ7MlmIsrV4tMS11/GkSntDtWTdcM6YvywAAm/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=sCrBn029; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="sCrBn029"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab70043cd05so199575666b.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 06:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738852811; x=1739457611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HaF9oK+ht+6PJAmQa8x2eJ5jIN8d/CbjvcAD/HIVPi4=;
        b=sCrBn029BhjtsO/DxGgNgmMUmPc7iFLB2gBSREVV8cGvrOeDOqYoTHAAP6rIoAcUu5
         SpYfBVtWDHs7NSfEKod6rDPXt8fR7ya4Q2XeokVLsNs11AXbgOnH29Nvz1E4mHpdRxau
         tn0E+9DQrTqu1q/WGmJBh0znqUcWkGQW/bOM+VTaVCuLKSzH0bjR7TS5lTVk0c9gJjyB
         rOCCcLJzTFkfA1KoW4x0QxiK7IDCNSAj+iLtOKJY6Odu43VC1UpnnrEbj97OPKQwvZk9
         Ek4dy1bIbJ/bNhts//XYyEkG7tTrbXP20fhvYkC2CdDJt+B0WAZQrLbJh1tGJmSVWnua
         g26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738852811; x=1739457611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HaF9oK+ht+6PJAmQa8x2eJ5jIN8d/CbjvcAD/HIVPi4=;
        b=jaK5na0z7UxhGANIGenXt+u0XGcjrJUb0rkwwwotxmqst9emGrxqy++B4XcSjfB1EA
         q/fZlCW38teKDfu7JzLUDb8fpYMkzpDiYv/7NxvU4bEqUKnx1uFhUDEbZjg3TjXwVBf3
         LAX1VY86RKkrDUoDEfqZOGVwnRLj05Bt4xuOsQYF/FK/Nbkfs3I16pNVsNae7xm15tHv
         5l1CJEfm0kfxBmwEt5mPlhgC2H1ltRUGV6NLm/N36tVzXU5KUIrFz3BzJWvLopECx6Ev
         3kP8zEZRvEHQbtQgPHZFB2sge7Bcl/8Yvlv5xIli9Dv0CQOR5ISkGHe4O6IidrN6QA9A
         KGUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVHskUzs5wA6+epJknudkBNBWuONdaONGZUI+1SepbjbWmYxKitk2Nm/479/dizo/an5MZE9fFKs+RQSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YziK6VUqIHaR7HGp+0P2VxcHoVG9BW2Oj847jshHzND8dSz1GV4
	uu3la0X+62AGBss81Nu0GYDkmbPd61efUcKoQgCbJK3cNaOCoUmFUa3Zkysw5yE=
X-Gm-Gg: ASbGncvgmmAvX/9A1HHFNadExf1WAr1Kxgx8U7HU7Qn+Bl2ydZLmtPkOi0r53ar//ge
	LR7/KWKkgnKKaUtf/kKTN8c3HsbrTEe1ks0ZggVY7dzZQh1GQ9j/y4Iyd0TZYRb5CcDfFCnPvYH
	3wQO9RJJ0CXn3uoAxxTrM3hMGh0Y5OoNWrT4zwGitaAtFP4Y0DitceS4lDBTZ1r2vYOdnAdJGfo
	8s6qMtpwQ2+lTzz48Zifjbeyzk16N7o6UIAgr83A1jFsqdONbgtMHlH4VfBtNcnwwudednLC4FX
	KIredzfFtA/zuD8LoikT32CONpcdOwbLrnLnrUcXM29eDkI=
X-Google-Smtp-Source: AGHT+IHgsuIEgT7GkKcahm86w7XZdDg7vZ/AvkvTuqQKdmdxISVptZgStfdEuYmSzkdA2CsT8SZ/Jw==
X-Received: by 2002:a17:907:7d90:b0:aaf:74d6:6467 with SMTP id a640c23a62f3a-ab75e347a2dmr784608966b.42.1738852811550;
        Thu, 06 Feb 2025 06:40:11 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7826ed43esm24954566b.58.2025.02.06.06.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:40:11 -0800 (PST)
Message-ID: <6cd38146-aec2-40ac-9372-13064dd99363@blackwall.org>
Date: Thu, 6 Feb 2025 16:40:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 09/14] netfilter: nft_flow_offload: Add
 NFPROTO_BRIDGE to validate
To: Eric Woudstra <ericwouds@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Jiri Pirko <jiri@resnulli.us>,
 Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Joe Damato <jdamato@fastly.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 bridge@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250204194921.46692-1-ericwouds@gmail.com>
 <20250204194921.46692-10-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-10-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/4/25 21:49, Eric Woudstra wrote:
> Need to add NFPROTO_BRIDGE to nft_flow_offload_validate() to support
> the bridge-fastpath.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/netfilter/nft_flow_offload.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

