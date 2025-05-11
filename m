Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4262E2F3E;
	Sun, 11 May 2025 05:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746940203; cv=none; b=HRMQ4dksA7oYk9dhMoAYkLBoqlSuiDHsjDZsyEj6Ieol5VC+LrDsO1JsErdh1m0153zYFuUWeoRX72BJz4SV5dMzluDuijfEgXFZmqna0FGxHGYMOFI7MlIfUrWJqxMXxhTr20vMZnB0dfcRp0kUevdv0iUzB3tlRGI8yInRzE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746940203; c=relaxed/simple;
	bh=7gn5B164aaUyVv9vQQibdqZoLupxqFDEsStDg4ux3xw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dIcDCzwWt4oBhElYoiqgGGOLeHuVLLQLknC3z9LbmbqK9AbSpfhricTxpyhg7ZvjkOFQhCHwgYrYwyyoGCF0zEeqSc9/V+Ta9LYeqjpp813bLxpwbwW1D4zou+2P6xIH3FWNRekD6tn2gLt9K7I6n7FhlYl3jDonap2mt9Fbu7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOooRwMr; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOooRwMr"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30572effb26so3149079a91.0;
        Sat, 10 May 2025 22:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746940200; x=1747545000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3aTqzHSoz66LlbF3IBknlQpFjT/GlirHvtZMYx3NltU=;
        b=hOooRwMrUpeJFNOQZ1dXFrwv8GYEj9WzxyaoUVV5pMr2vRG2DjOJQeXxUbXI2yNQyv
         uvyrFDOH+sgnhQtM0mtdxkmoZD46Ww40HxtwO5N9EDK2Bimnn4X50lpWJ1JPdWXqyhrz
         PglTZsAcUPyNOc22upVR1sxJZC5lhOTJC40idI2efV8Q5K0Yw9DEaODUdQ9x1GxkZAi3
         XRrGoWoWbwAaoybwdtWEa83leEDWczSqSuMXnPF8Oa7JLVyPIBgA0NhmQ2tz+GvJM5wN
         OWjTTohFJfGOUN6u/Mq7RjcQGRzGE5RvoH4gZ8Pw8nmUxVIwCUZukmGpcbK6QUtlvSpo
         D3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746940200; x=1747545000;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3aTqzHSoz66LlbF3IBknlQpFjT/GlirHvtZMYx3NltU=;
        b=JeuP0AuN7z6bv7mztEznJU9SloJZ8NtVIlXfyJHEn2fdgNJjmMlRgq6QIhHupC5uju
         vJ9Z5zpux43BtYyxzIRAdBYJ4ooRDLQsxa7M39DXvjkwTVMus7X2agIpmXkI463nl5Q6
         xwxXR9EDWQako6sAhzem7VqDAvuMvoXtnwyosrEg5d6wEqyogHGv4c2/kOZzukgfoKty
         bztK0L6QE0uxcidZNSFeqw1pl48JveoznNgd9+Ei+bggj7hccivoPxLnVhradz0Glacw
         hu8mgf1pVyonZZzc18kKxG/S0+BhZxyRDoJbcG8IIqqncDBUslECu/1DMvJo0JMmlRXH
         0PUA==
X-Forwarded-Encrypted: i=1; AJvYcCUcZCUAutHZ89zvvfxTgyt7VOzemlwtZMfjoR1gBxAesiEBW5UiD5OOi0YYtwMZoWsJiSo/sdb52O+0Ibc=@vger.kernel.org, AJvYcCUiZ9ju5xfLk//O0oWQhJ/em6rYxQFJNAf3PuKhccYpVEmmQuucNxPBj8fAZhKEeg5JuZ0F4uUrNQGj@vger.kernel.org, AJvYcCVQRRVnMZ76Zc7UYJOvKvi1f4iDI38kMBFJtRUebW6cSxaZFcnm1Os4VjTc6dhsoUewJeZ1KRrj9FBJkFZY@vger.kernel.org, AJvYcCVShVvoQdzCcbCso/FxMRhMrhzRBcgiuA77yWtLRtZvCTwNjEMjsqulLpTbD+aYrWOeH2qony828i2+@vger.kernel.org
X-Gm-Message-State: AOJu0YxLnW5R/tvVflCuW4Z9nvFE8663Rq14kQJfUcgDlyirmU1VtbzO
	uaq/jPKQse0cfCejptCgWcspTOQQEcX4k5ZIV1bqbtpHHE3fZK9o
X-Gm-Gg: ASbGncuIcpedxLqlPftRuSk7yD/ZyLAY8h/LcYG1fABHI1Xm0J/ohnhU7t3Pcvwb9Y8
	aacY4SvjGipK5l/oed9UWyNesNWLBKp07J+zd3zJKwIAb4PX4DnJVsjKcGXCSRmGAZfy10ezzvh
	i5SxIuj0kvoMiE+XbNn5fl+sFBFdasWJ6JnZLojkl6Jw8l4zj+DyrOaq0mkSn7xNPNQ5fwzOgtT
	auzhR4DwhGXxnqMB3Wk005sG+3qgrm+8IiE/maRPPw4XXh7tDTbHI1/zfGF91OqEG+QGCq73YHw
	zIt49ESIZh5K9yxDEGEj6z5XU6QIZAf6aLG4vc40FV+gtRELm/x533aWVaGs/1fng4rJe6z+RdP
	gbWbD3CQPl2qCdx9AK44y7Kac
X-Google-Smtp-Source: AGHT+IFc9LCqMi9ZDb9Ge8jM/AUoYlaAUbifBpt22U+zx5pUBuuYNEmCd9BPXmmAZrbZ2X2eQyoK7g==
X-Received: by 2002:a17:903:32d2:b0:224:de2:7fd0 with SMTP id d9443c01a7336-22fc8c7bce2mr135948855ad.25.1746940200395;
        Sat, 10 May 2025 22:10:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc764a536sm41076415ad.66.2025.05.10.22.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 May 2025 22:09:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <628c7a6e-d9fd-44c6-ab2d-977074332f65@roeck-us.net>
Date: Sat, 10 May 2025 22:09:57 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] hwmon: pmbus: mpq8785: Add support for MPM3695
 family
To: Pawel Dembicki <paweldembicki@gmail.com>, linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Noah Wang <noahwang.wang@outlook.com>,
 Naresh Solanki <naresh.solanki@9elements.com>,
 Michal Simek <michal.simek@amd.com>, Fabio Estevam <festevam@gmail.com>,
 Grant Peltier <grantpeltier93@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Shen Lichuan <shenlichuan@vivo.com>, Peter Zijlstra <peterz@infradead.org>,
 Greg KH <gregkh@linuxfoundation.org>, Charles Hsu <ythsu0511@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250511035701.2607947-1-paweldembicki@gmail.com>
 <20250511035701.2607947-6-paweldembicki@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250511035701.2607947-6-paweldembicki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/10/25 20:55, Pawel Dembicki wrote:
> Add support for the Monolithic Power Systems MPM3695 family.
> It contains four devices with suffixes: -10, -20, -25 and -100.
> The device is PMBus compliant and shares characteristics with the
> MPM82504.
> 
> MPM3695-25 has different VOLTAGE_SCALE_LOOP register size [11:0]
> and it needs to be separated because it will be configured in the next
> commit.
> 

Leftover from previous version. No need to resend just for this, I can drop
it when applying. Only resend if the devicetree patches need further changes.

Thanks,
Guenter

