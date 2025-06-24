Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014B12BEC24
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771475; cv=none; b=U7mH3FPM7ury498ycoL1KL33v7jY4qlR7KI6fAFTJeUvIMITUUfBab9+evfM80sLBnBnAnOYRckg/EALUvvhrPSUyag8t2+/KPZA8xjUl7cQUFei5OK/FpneaO+AzSKFkWtnn8W1h7fp3lSULbx+P4k37AKkTVo7b3kwxlpxROk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771475; c=relaxed/simple;
	bh=ayCU+nkPRr6n8YMzwOwtPyFONRi8G8Mx6ULPM9Iu10o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lqt8FRe5VTDG4TFrUMfiSalbN2UyRoZNPJX/nnJkfWkyg/M9opTL/hIBfT+PpCqvZUEE7H3HjAZj8/nZlBpLI5dzDIS7r+Pv616lMA11QYKrtUj11z7ffTWpb3JvKA4YHekL5ReShyXSBj5xpXnIbgKbPUDrSsX8QcSkCA/ZbHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=elPmPNa8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="elPmPNa8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750771473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aK5RkAHQrhrmbMgDmli1jYjYYGO7nTlMC7kAqH+maLI=;
	b=elPmPNa8qUY/rQWff6eQw9fVoW1T+iLrXbmOTFvu3Rt86pAylfJf/sYfMvG00ydpMJZsj+
	4eoMKtOF5QUQsMGiZJltqTKF4SN/FTashuBiLgrjFyqh/P/W6CUoD7ob1PRUzl2V+agnJC
	WApxmqKWOUFg9B7b+LYenbIPE2OHIJY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-2yqCEnPfMeKbcKoSuPuUEQ-1; Tue, 24 Jun 2025 09:24:31 -0400
X-MC-Unique: 2yqCEnPfMeKbcKoSuPuUEQ-1
X-Mimecast-MFC-AGG-ID: 2yqCEnPfMeKbcKoSuPuUEQ_1750771471
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a52bfda108so233307f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771470; x=1751376270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aK5RkAHQrhrmbMgDmli1jYjYYGO7nTlMC7kAqH+maLI=;
        b=ZWXBLFnRH/nCgc4G3F2PYI5eOCBW7QBNk5uZAsYKlvdEmrKWvtDkVjKjxc+XsyHsKV
         +jOBPDsIwpv1B0cmfd6w0HLeESC+s2dV5KSUonJsVNrl1ia5GTwTomWdpP2gm6InrBsV
         0PxiMUXdy2VF8vMu7Vh4/NtonRR0iRCiXrga8ZqywhdXIWT2twLUwjYSrMMn4/3svfW+
         TMlaeg7huF90/g5Sp2txlMpvIahMK1CfU0J8kD6HkPysgj1ee/JrosaLu73Mwc49GYNR
         RDm53zyV+C3ICOvvH0Ezd3JGW7C3NWbc1E+p0vlCdCFO78piWKvT9gfkUTiiBEStK+o8
         dXVw==
X-Forwarded-Encrypted: i=1; AJvYcCWexPtw18bM5UarqxEUG36DZHwFp++c4OnJjul+e//URZFZcfi1mW+ABUeSzEt5XToPjkJqtdWQy4f7NAc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg7/mHvgw8WvVTlaEg8qc5QV2BhuD2fjk2zf/KqDPDRVlrAx5J
	U8vrWjHoESzuo7fU74Kk7u/zpaa+8lUgU0+nrYCzDzc0zPscQ9Qqv51a0ZO2tuqbqMqRC+i55FM
	mmNLeZn1vIJ2Q+SUtSukcjofdHuo8r2M6Hwmdg1T2x3jBiePsnhLbKjXfXe4x0DUBJQ==
X-Gm-Gg: ASbGncs4DKdbbst0mggSJ7wVXqDpVpP5CNuBFno+rXroj4Gxwrja0tW6ggKWA4iUhr0
	IIsABJuaaCETOmAtwDShv34vJSBpi7V7ccYaqeBk55ejD8fOHBvDGH1qXvccNfMxSKX0Rc8GAuS
	bEFKNTiAEih6qyLK7etTjhV2mm/IP5mUZqohhT6E3W0urk9LyBtUAQaVbfIG77lYEPAwaBBGErW
	G9OuyAFIp1ShsV0sofBsyzihRyjE3fCHIMHyMa5zQrMm4kCnYTo/Q1dfLO16gfPluq/FSDV/IcQ
	hnXkSAelP6/VYEZjj9xfBqfbkHuLAQ==
X-Received: by 2002:a05:6000:2c0f:b0:3a4:d0dc:184d with SMTP id ffacd0b85a97d-3a6d12da029mr13966783f8f.27.1750771470462;
        Tue, 24 Jun 2025 06:24:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiFZlAyuiksuIl1Yo2GNzHDQQeq8cn/28qYo/og94VXjH6d5Y5X9A9bCgyxSiJRdNpJZsF4Q==
X-Received: by 2002:a05:6000:2c0f:b0:3a4:d0dc:184d with SMTP id ffacd0b85a97d-3a6d12da029mr13966735f8f.27.1750771469988;
        Tue, 24 Jun 2025 06:24:29 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2445:d510::f39? ([2a0d:3344:2445:d510::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f2274sm1927739f8f.48.2025.06.24.06.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:24:29 -0700 (PDT)
Message-ID: <b31793de-e34f-438c-aa37-d68f3cb42b80@redhat.com>
Date: Tue, 24 Jun 2025 15:24:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v13 04/11] net: mtip: The L2 switch driver for imx287
To: Lukasz Majewski <lukma@denx.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>
References: <20250622093756.2895000-1-lukma@denx.de>
 <20250622093756.2895000-5-lukma@denx.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250622093756.2895000-5-lukma@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/22/25 11:37 AM, Lukasz Majewski wrote:
> +static void mtip_aging_timer(struct timer_list *t)
> +{
> +	struct switch_enet_private *fep = timer_container_of(fep, t,
> +							     timer_aging);
> +
> +	fep->curr_time = mtip_timeincrement(fep->curr_time);
> +
> +	mod_timer(&fep->timer_aging,
> +		  jiffies + msecs_to_jiffies(LEARNING_AGING_INTERVAL));
> +}

It's unclear to me why you decided to maintain this function and timer
while you could/should have used a macro around jiffies instead.

[...]
> +static int mtip_sw_learning(void *arg)
> +{
> +	struct switch_enet_private *fep = arg;
> +
> +	while (!kthread_should_stop()) {
> +		set_current_state(TASK_INTERRUPTIBLE);
> +		/* check learning record valid */
> +		mtip_atable_dynamicms_learn_migration(fep, fep->curr_time,
> +						      NULL, NULL);
> +		schedule_timeout(HZ / 100);
> +	}
> +
> +	return 0;
> +}

Why are you using a full blown kernel thread here? Here a timer could
possibly make more sense. Why are checking the table every 10ms, while
the learning intervall is 100ms? I guess you could/should align the
frequency here with such interval.

Side note: I think you should move the buffer management to a later
patch: this one is still IMHO too big.

/P

