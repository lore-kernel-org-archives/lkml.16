Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0235132122
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747318116; cv=none; b=g9flfma1yCkcTX+Qpe18bGEC9WilRPQHqjNwr2U8i0yufH0bQTa61aPyx1tF0Gxyb5QL76shE8ACktsGSTk3fKdeZ+Cih6Z1m7yq2w5mgu5Jfe4g5swbypkdIFEjMqOb5dD8O+DY6703KmfLr9O2FqHTjQXY8kXKUGUR0tanXxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747318116; c=relaxed/simple;
	bh=3yt0AEfR3Uf1JiVZUnD+b/p2Vyl/QTFKFcIzAJry8J4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TEa7sd5RVVTciJu2B1GxmR+Pp3MOrvzQ8CT+MqXqqa3UP/2A4F9n5OmERnHWM5UXILr4JopdL0Q7GNwKCpFJQzswl4lrdqAooxote/ykBFOu3rPfd9F5BJD9/DWb2DmVASPu4O9+qNPQQD0mHmUMnb87f32tSQwtNUZXCKCT8NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XwhjPNGq; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XwhjPNGq"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3fa6c54cdb2so1030027b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747318114; x=1747922914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3yt0AEfR3Uf1JiVZUnD+b/p2Vyl/QTFKFcIzAJry8J4=;
        b=XwhjPNGqjAFNkLvAVhNDaZ32fKZa5HZcHIhKE0cmrBAfPA4pRK5tjvIrEtMvNvUEDo
         P6AQ3+vr3ByClZXmjvqPReWmROr42jtsvG9KMH8YB6XuSGpFPafBw4RUeoOeCloDhQuM
         yCGx36VpLLLxvPhjolCJ5szC+psLzqwtxKqcp/qFrVFd+PLfOcA4kd7j5b/Q6hc07omJ
         UhhtemCeatw/xa9S780VcqwyP450T0Z6dhDtmlbkxhzUnq1UWdCHjYQPV3/5PyVsU0Zq
         Xxt5ZUOZ8hx1sNNPTLTU83dcPXbPbElaTyjSIsIPY2y6AKEG7Wp+e6G4KRmsdLzEuYxQ
         3m3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747318114; x=1747922914;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3yt0AEfR3Uf1JiVZUnD+b/p2Vyl/QTFKFcIzAJry8J4=;
        b=bpNWc3W2PFgvJwLpU9iLoK1uUyp+Gz9ERAG16Am7W1F1A3d1LLTIGPwsfIvWCWi6N+
         vwz3+XheYEMbBuCW2nb9m1LLZppe+1mlc3lxLr11qBkwQ0OXn3QtInYa89lfHBFgb91r
         y0Uti9sapxAY3PMaqHb7yGSZ6Cp/9oOjf1d4j3oGa5a8Gf3yFxxBb4V5yAA16dBkPLx5
         pAFhm4WG0CGzCbEWjYTGwW+tG2BqWHExIipuleLrDJwVAvAbXOppX96c/MktQZ0IsRUA
         4aTA1T+ND38IA+nwDYP/Z5mkFkAuYJV6YbtLARTTOamMN/IxjUu32xr0oRAGP6Tjk6Lb
         xNVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiB+etXKoH3gkvJDcL266Ri+dnvzVmitKkTxQDEcOrV+Khelq+XmxpAE6A5XId5lSfMVBFa4OPqzS0qfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmYQJ1S8srW7itxe36I6QTrfr1uJyHcZmD9e/z+tbaMIIv4fHi
	jmMiYjFP+KFw4rOpO0NzXtVYDlyFujTVPPwEw4CP3IvgrC7GjcOREAg4Rh/wU3k=
X-Gm-Gg: ASbGncvPUyXV/YKKGkYYkg1elBXddrpGHuf+fjzVBkq8SadqtSaa292K5CpmFeHDJd+
	p7g8yyuwn9LoLfqMYd80MjH68HUSIf7zs4dwBlrgPnom0spnn0/iLsqtnbB9D/604vGYYEiUCBD
	mpV2ia33keLV6akcOQpSBFEgzGNy/Xw6GkPa0fs6+nGmeQDg/ft1FbJa5VCXVx/548wYAVlMf5Q
	copb8m3yr+9vk9xFnTBb56i+/UBc8XFhIifgt3gp3ipBedH3UsgeC2m8EGiiv3f6o2Mhytavl6V
	cHxzJz+GgkmvKqr7FweTcBRiVKjyhZ1pipzq1h5N4X0HZLJmPice+ncDMcMalmfyevw6h5090yw
	ypqwmWXaIhUw6YtxzjMKWt9LZ1xbm
X-Google-Smtp-Source: AGHT+IF1SnasEdi+GHKBuWfCCIvdgPbVOl4Tdp2E6fwBRj4WEq5pc2cMWGXwhD9B1vkH0OWObnpWCA==
X-Received: by 2002:a05:6808:3198:b0:403:3c87:aa4c with SMTP id 5614622812f47-404c1e6be57mr4631280b6e.0.1747318113918;
        Thu, 15 May 2025 07:08:33 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:bb18:367a:73d3:5230? ([2600:8803:e7e4:1d00:bb18:367a:73d3:5230])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-403802d3100sm2711352b6e.14.2025.05.15.07.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 07:08:32 -0700 (PDT)
Message-ID: <59220742-18b1-4704-bb5c-8b79f0099139@baylibre.com>
Date: Thu, 15 May 2025 09:08:30 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings:iio:gyroscope:invensense,itg3200: add binding
From: David Lechner <dlechner@baylibre.com>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nuno.sa@analog.com, andy@kernel.org
Cc: ~lkcamp/patches@lists.sr.ht, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250515002817.81863-1-rodrigo.gobbi.7@gmail.com>
 <81b2a499-1927-4fb3-b581-a533c64507a6@baylibre.com>
Content-Language: en-US
In-Reply-To: <81b2a499-1927-4fb3-b581-a533c64507a6@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/15/25 9:04 AM, David Lechner wrote:
> On 5/14/25 7:21 PM, Rodrigo Gobbi wrote:
>> There is no txt file for it, add yaml for invensense,itg3200 gyroscope.
>>
>> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
>> ---
>> Added @Jonathan as the maintainer here due a suggestion in a
>> different thread for a different binding file.
>> Created this yaml using the driver probe and comparing with other gyro bindings.
>> Tks and regards.
>> ---

Also just noticed that the IIO mailing list and Jonathan are missing
from the CC. Need to add those to have a chance of this getting picked
up.
