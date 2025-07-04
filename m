Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D615B2BEFFC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 09:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619920; cv=none; b=H6nsS7lmLLOARCoGqHva4inS33QE1DCYiXJTcbzT+M+tIhb7/29XFqm88ZW7nqW9K5eymk95/npNH7cN4YJphndPRnYDBla6/+E7eEYfL1RECZrJcCJlG+rJliy80DXPSx8KjXR0w898vBjiEBGhHbkU6gv7W7H/B2raTBSJy2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619920; c=relaxed/simple;
	bh=lRw7yJVneIfUXB5qnJ6oSwcGV4RKbOy3n7DSX0pBpsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VtyLJI8MXmt/3NVP93OeYsgVAWjA5rJIjQ17NkI2XRfdSZrpt5OT2mOp7kCKZFlj669D2wLjNYZmikEqmQrjE/PeKCGaJw01yfXaDiup/JUuYt8e6MUv854yZIX3BvwSVL3iziojN9l3+zrO2XsDNmkQj7QFf3mpk8L+LuRzJ14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=H3U2ymWm; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="H3U2ymWm"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ade5a0442dfso107212866b.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 02:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1751619915; x=1752224715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5lvqW25n8VSdsxeIbb6N6y1V/bckNRxGH4LVpn13n8M=;
        b=H3U2ymWmKJvzY6LVPa7qpM4oO2dpgixhT8WECCxKAxFXOafT6qAvJGd4nfO8CjUfxK
         aqXGukWxDg/2q/LUqBk7Btvs2Ml1HFqRo3+Kfo+p98HdrMzzvxAe1cy8/JZiSz0fnxuW
         X5eTKMlP4Pfk6I8mkB47Ya9AUeTLbl6fmcaiKF/6Pk2UzdwU8TcyPWlmEpzkSaWa5Vie
         BJHeDbf/9wk94WUn05wJ9zJOtbCOJ+NFQIlMQXATdR57st5dhs5l05A3zXn3jpj4DC5L
         yqMxKLiwbH/2IWxa5oQSjBWSQsr2tx76v9qzFAgWb0oQRRHCus7RJvyNFye2zFZYDeFQ
         iUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751619915; x=1752224715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5lvqW25n8VSdsxeIbb6N6y1V/bckNRxGH4LVpn13n8M=;
        b=aEONVGW1bJbX70WtB8V06nMY0V68FE1aKBm21eA8ghWhBlzlmEFlueMdHZHz+0iCpk
         Hi1Ilb9MLFfJbPNoAen0JUvQAGWwlEhVsFBe4F3SONym+LdLm5s3Z+vq9l5yJ5GsWaS3
         nLWVS2JuPMLXAEl2zddbxjnYVd8ZZpfxRAil73BhMndzcD5yt/wEClLPsspoxTmEXlwG
         0Y+ls+FTEHNGdEhSWFflxG0zgG94Zp8F+yM9R5Si3inJxfsUgTSWg1B9rX400joL4hcM
         0Hsn7UxMX4GyNG7qheRVzbfYGaVUO7bKZp2wdPD6skz4V95Ru9j9Ttm1CEw60Nv1XE8z
         uU4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUv4CWnhwjHN9iW61XwWmkFdGqDjoNTLw7rVWzU89M7YlWWj9WCAW68P5NxjksNyczjssfmScT1nhnHaMw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0T5FSMdb1m291WjuG8I+SCQr0VhXgd2wzISQY7rCNmYLGkvKR
	rihNq8F7F77sQc4yeLH4Bqj9BPYdqXp9eWrhzUjXFcU/9Hk1faomSfVOquky0bp7+40=
X-Gm-Gg: ASbGncs1RVG99HiIea0x8wdfwQq373yDFy/SZrvF5qokqDW6Oo+phonBf9tuet20eRn
	GOM3THERSesh2Lhb0rFnXJU6qGw3I/Kh2hE2g1oyIdGrGKBSluxOag+rzmSNBKRRW7gQV53ZUUw
	8L4neKdqNWXt1CpGsept2WFZI1OJQQ91qchkPbpqgjJ8H6kOYyY5r6BHIs0qco5Q4h9Ju9Z7wgE
	lnhVh+MTyZ4guw9xWPYTSM+XdsgD1AstycY2kP2hgdLbn4aFF3vj57K4tBSRFWaOgKidHRY7jVP
	P/IVEG2cdJqxF8ehzdkUEGTdbDfUCYdShZ8tZx+nMvoS5QzMC+Zri5/Aez8NZW72y+BvTf4NTjw
	kuXvjNqDE3tzk
X-Google-Smtp-Source: AGHT+IEZO1zxjcWXhdMMtE+CxCjQoXtX/7S5BwYI92EZAOfHlQnV8tIpwdxwwtnNSgAwSoG0neHl+w==
X-Received: by 2002:a17:906:c102:b0:ad4:8ec1:8fcf with SMTP id a640c23a62f3a-ae3fbd6c7d4mr177062566b.46.1751619915226;
        Fri, 04 Jul 2025 02:05:15 -0700 (PDT)
Received: from ?IPV6:2a02:810a:b98:a000::f225? ([2a02:810a:b98:a000::f225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d91cdsm137351766b.22.2025.07.04.02.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 02:05:14 -0700 (PDT)
Message-ID: <79a57427-fd4a-4b9a-a081-cf09b649a20e@cogentembedded.com>
Date: Fri, 4 Jul 2025 11:05:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] net: renesas: rswitch: R-Car S4 add HW offloading for
 layer 2 switching
To: Andrew Lunn <andrew@lunn.ch>, Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>
 <4310ae08-983a-49bb-b9fe-4292ca1c6ace@lunn.ch>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <4310ae08-983a-49bb-b9fe-4292ca1c6ace@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Looking at the code, it is not clear to me what would happen with:
> 
> ip link add name br0 type bridge
> ip link set dev tsn0 master br0
> ip link set dev br0 up
> ip link set dev tsn0 up
> ip link add name br1 type bridge
> ip link set dev tsn1 master br1
> ip link set dev br1 up
> ip link set dev tsn1 up

Per design, it shall enable hardware forwarding when two ports are in the same brdev.
