Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEDF22B8B0;
	Mon,  7 Apr 2025 09:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744017225; cv=none; b=DGbY2eNmIdN3ZsPLhsc7JMm/jodU0UhCDwTqog81w2nIr1Vv9Ax5uTv50EBQ9eZGjtJAhtj0BzkwulCMuy3aToCF7nCYGSKcrtK5zsXWtt228KPbbh3qc8HY9EypheGS8Tr+YJ5nOMQsKfKWDsQVrw2HJv7OGwMKcP+w0H7864w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744017225; c=relaxed/simple;
	bh=oU2Moh3QffPmlHMSpG5pGGNUhLzA2yz3MKAJRal6uJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=da+F05YegfaJ2SkiCmfXi/qWF3MsUqKbBtTShLhFW+owW1cpNVlRrf5/S0U8wJrXMDjVJLS2fl/iI9PjChz52TADqh6ndIuDBBD+H3LYL/My38FSEBfmWbKIPNl3RsKdY2HAioIXMISHStdsIKR6kr0Ih46h7NnD/Pgx5aDpavI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUS4EoLY; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUS4EoLY"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so5280445a12.1;
        Mon, 07 Apr 2025 02:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744017222; x=1744622022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D0KYQ2tFa3w2DTAF5hUEDnA1JlQaAuS5xymaBqtHqi0=;
        b=dUS4EoLYiTAfThy97KXoLCZIOMQ84DBQyd5BfZDOEe/VJwauwlutxIlVzeImJjCnJe
         WGFglUgIzCkTK5SXv2GrSKolXEJDXLwxUjQlcnioA3XOFm+ixTPP03dKA1civ8ZffiDt
         8xg9Ei3VxREet2NwWpywW6AQLibyDQKu0CtkUQNklPptv7WTpa8o9sTTiDh4LR4+6VjC
         9M3pf5kSTOsNLu8hlaxnYMfnggenNsZBuuZOB8RBl774op4I3yPgWJTSorBwTtRZAEYl
         /k7S06b27EhG9Ecdso4ieceprExTItgHt5tRI1MMMWDi7yjHix5Oy7LR7cL3mcM+GkgI
         ODNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744017222; x=1744622022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D0KYQ2tFa3w2DTAF5hUEDnA1JlQaAuS5xymaBqtHqi0=;
        b=Hzfi7kFiNtDyIY9/kkM/fRaAGR/KNQqmRRSwLNa96Uao4G1zcwSCToNgr2ZRj+IdWf
         KW/itWcoGNg/dY1RoP0KfU8t1GXfOs3AowuJTd+CWS9Op8zfmaVTrXEuybNMk8wej+LL
         D4OfCf/vuwyr7g71o1XRKTcMm9vSXawqcSlbVxLQz2Pwe/JQ0ocuqCMXEZk5VeSkUkF+
         GyrfOJhUQzjnEvmdnsXbd4nbIMzhRqwIpGOT2HTEiC5ctzokfun7T+5EGcYqM/YmqEYG
         4OmXAqde8SDo6Cup2dR9H/mXS9RzEzt59wghWV9snsxiIr/zctsZgDEOlur4Hlg8/XxC
         7esA==
X-Forwarded-Encrypted: i=1; AJvYcCUM9aHa8huH8kKPThJ4kkQEQawMR7mFOjFqDIl/L8Qe68uTV2Oj0egjjWpCzhJuSFFFJTEn8v8RSPPbr/k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7J0H15UNA0hLSp48wIIoPM2blsXUJ53tU9c0e6iY6dMUo4f1H
	gD+7zodpbv9VCi4uhUjfvih41fDP1jmYqi3C837u8bqrAZKwratA
X-Gm-Gg: ASbGncutWK75kKdwAHdpZAyi6ju1boHv7U0xw83BAG1SCgiuqhcQqWuU4Me9wJkJu06
	2b9CaAZZ8akjUdAm21A9+sJLb/W4zeO8ozcKzDHHhMcmOPDTEIZqn4c5Ef1bKWsHm5a65ADPHIF
	/1PAMdzhn8BWMAus91qsLSpbZ0LtKC20jHqZY+pEX9SzrU1OAoTK6muAwTSVWyfwkANnr4z/4/C
	vHbscvXhPb1ogLA24OR4xjf36DeI7Gc2EAlH5qLtpeVVbJNatOlaU6stGaTUOnsc9NykhNjaWCS
	tE2TNG5kRAqXcIC+ouCtOIMVEkOmOEbBHAoarChL50ttJiAvIZq8HZ1hTIXpl2hu
X-Google-Smtp-Source: AGHT+IFLEKdWvnBmRUhayjVFBjdSoDku9nD5apBp0tQe4zi9UIOqkrzqina5ESL46GQbMQWmO6yF3Q==
X-Received: by 2002:a05:6402:51c7:b0:5e8:bf8b:4396 with SMTP id 4fb4d7f45d1cf-5f0b658917cmr10306073a12.13.1744017221603;
        Mon, 07 Apr 2025 02:13:41 -0700 (PDT)
Received: from [192.168.1.130] ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a405fsm6504365a12.75.2025.04.07.02.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 02:13:41 -0700 (PDT)
Message-ID: <3d2c74f0-72bc-425a-9333-86addfe85dd2@gmail.com>
Date: Mon, 7 Apr 2025 11:13:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add Ultratronik
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250326094429.2397365-1-goran.radni@gmail.com>
 <20250326094429.2397365-2-goran.radni@gmail.com>
Content-Language: en-US
From: Goran Radenovic <goran.radni@gmail.com>
In-Reply-To: <20250326094429.2397365-2-goran.radni@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

thank You very much for the feedback so far. Do You have any update for me?

Best regards
Goran

On 26.03.25 10:44, Goran Rađenović wrote:
> Ultratronik GmbH is a German electronics company:
> https://www.ultratronik-ems.de/
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
> ---
>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 5079ca6ce1d1..91285296dbd3 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1597,6 +1597,8 @@ patternProperties:
>       description: Universal Scientific Industrial Co., Ltd.
>     "^usr,.*":
>       description: U.S. Robotics Corporation
> +  "^ultratronik,.*":
> +    description: Ultratronik GmbH
>     "^utoo,.*":
>       description: Aigo Digital Technology Co., Ltd.
>     "^v3,.*":
