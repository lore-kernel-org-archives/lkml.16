Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4509228C5B4
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751295184; cv=none; b=ENq7z2KS9irWwvInNzE2KKM6dF6UWPoRZHjh4tS6vSJi8jyCaZwbKT8WYOC5HiK6aE8QDVJQFnmf2YQtMsXvn3DApEpXPSKO25BKg1Dx1U8/i5TCU3nQ/OK3RhxTw9FxaPER4vkdOcnUrp+flRusgYwp6J5PN6LqVkqoCaGb5K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751295184; c=relaxed/simple;
	bh=EKbypWq1FlONhmPWIS5B8mEdbfenWC/UIXb4JIHYn3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ljC62v+R7YxXuHdo1qUGNkQHEZqFq9XrStw035oCCRP5LuIasW2rNCH3U2oy5qvJMSd8pE6J50diHiE6cATp3lSkSW5w7h9zgOIkgdPEh+KR/PWVAUy7BtdF+toWz3YC8iB9SisQKmWMebsTFFqqXOh/3uBvxIquUYbYlx9qfuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=GgYPgXu6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="GgYPgXu6"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4533fbbd21bso1950965e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1751295182; x=1751899982; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DehbCpLPPr5Vcumpumwy3dIrriLwUg9jpAUh57SLAgA=;
        b=GgYPgXu6GKp3JrqrkWfWtJObK7Zb3UNdmw25rrdj4U0AfWJKiAqMaNjhMAHmmQKMFe
         Nhfz8cN55i6/6AV241/X8TOCCsL94ifivSueywgpurE2MDGCKijEPOw9LOys0RNFJfn/
         5RkIgwwNfNSQP0wvN4Brqb/h1gTYUuYJVWBcqvQ3oGKlRUtHE2lepBGN1Q+aX72MmJqh
         ayUb8KvtdrGcAEUQeIYnSotiUYDpm5+TpsxqBMV+hxnEJiS/EjJhossRVQSJIldTf339
         8EolnaQ/8ZHDbhy2cu+a6p6MTwlqxStG+kKUwMENlyPVrxONrrjJbVCG2pN9IH4rzpY5
         5bEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751295182; x=1751899982;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DehbCpLPPr5Vcumpumwy3dIrriLwUg9jpAUh57SLAgA=;
        b=AWs9WzUTH0X2INUJES63QjwPlqL1/zYx3u0gl6aQnefxxk5p/xs8Jr3X5tTCGYea9Z
         f65dsQRZHm6NM4JzK+1x5Ssl8UGpXpsxCotxVidYkYqpHVVGYLAAcZ4U1U3XAlglBhYh
         qS1L+PNgkdiRTWJsCAvuRYVqsEH3/f9J1JgDNaYugY4cHVopUHdLYhriRb+OZEpEBdf4
         hEVzeUxpo+zloB1/9rQvrw3tJhVkCcgPXYNY4H2n8JJQDV/XCCsTRsEiIDkPNBOBixgp
         /bIaqCUHvxf0C2Ekc+Tm5boO6IIhZqzYBHPbVwz82P2wxu/lZFr6cGsP0nTrGtP8DCLX
         JvUw==
X-Forwarded-Encrypted: i=1; AJvYcCU3lHkrBORd+KftJ/lEkESvC10MoGB9RIrVZJCBTqhMO9T5HKwRAsmQ+rmp0tKU0+yeL5n4kuSW6CDoPNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSCtM1aBRKz0rRkLubFlcbX93iB2LA0J/PIqqDv5zMEeNmTgPn
	8rM/i0WMWtUiHKkQoS2anojQdP9K7mdUo67xA6sSDNXkItcI82K0eWuGdgeufn0DZXY=
X-Gm-Gg: ASbGncsag7WmfeMfgMmVHWn30vS4qTsvIKFRyovNr1WNFyL0vdNANoz7m21aAbIip8I
	LwgAEDtRCEUJFXcHMQuvShHswyLCFGPox8ogiF/ITVtfX/fp5zGWTh8KrLVAdDP3og5ce61wRz5
	MZ1XET0S96Cq4WQoxAcbrHsV2sgGewxs0pnApbRY6Kld2p63FAqnaF90YwhieSbIfVXR60fBx+S
	g7eG9K/f211aVZBsTU1tYlogtmVX9v+9Do8mOO7dulakPGXgqsiqUEJa3gOWH8nfIO8HZYgKVhx
	he+RVlMygB/3N53hAAu1BpjKeXAPWhW/eb/5TdC9R387ZRsDtJvKCVNs/K8XK7MOM1JYQEvnx4t
	TM93Ny/XYZYRdIMsiKjq1xnBG+ye6mcsSj5AnU2ohfLliLXw=
X-Google-Smtp-Source: AGHT+IHObVBNzcK8FpD8U2h2CjhRiaENGj7cVHQZqmRm89+X/AW/+VEluKUeztSst+wELveye9ytNA==
X-Received: by 2002:a05:600c:c0c3:20b0:453:bf1:8895 with SMTP id 5b1f17b1804b1-453955642e3mr18964535e9.5.1751295181618;
        Mon, 30 Jun 2025 07:53:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:b41:c160:cc64:16a4:75d:d7e2? ([2a01:e0a:b41:c160:cc64:16a4:75d:d7e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45396f24796sm76136635e9.1.2025.06.30.07.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 07:53:00 -0700 (PDT)
Message-ID: <99780599-91e8-4fc7-98be-1afa849e7db2@6wind.com>
Date: Mon, 30 Jun 2025 16:53:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH] ipv6: add `do_forwarding` sysctl to enable per-interface
 forwarding
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, David Ahern <dsahern@kernel.org>,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250625142607.828873-1-g.goller@proxmox.com>
 <f674f8ac-8c4a-4c1c-9704-31a3116b56d6@6wind.com>
 <hx3lbafvwebj7u7eqh4zz72gu6r7y6dn2il7vepylecvvrkeeh@hybyi2oizwuj>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <hx3lbafvwebj7u7eqh4zz72gu6r7y6dn2il7vepylecvvrkeeh@hybyi2oizwuj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 27/06/2025 à 16:47, Gabriel Goller a écrit :
[snip]
> 
> Sent a new patch just now, thanks for reviewing!
> 
FWIW, I didn't see any new patch from you.


Regards,
Nicolas
