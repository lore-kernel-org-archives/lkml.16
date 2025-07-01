Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642A326C38E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751361056; cv=none; b=Lju6Wv/cI83kAN7WQPE29jDlsrAOS8nE1Jr4s1Lt9mxrTFK4HEK1WULFCwM3UkyuTw/W4DwD1aiZcVdRUXckm5srXY7HTPnrJ3w12t81GIwS4n+MwwQB/fOUxNXhQPfbAzT2FonU7uvjaVhku/0YO9oijU2v4VdYOR3wsglh10w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751361056; c=relaxed/simple;
	bh=FzQqF0J/ul9TxEtjjmA9x9umVEbue93hGArsOir7XgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jy88pDkLZ6uqaNH3WMoDNCfkamh/jgIyF3KxfHN6UBQQxGMuKDBIXfvh+3QWBMUjMJbUp5+9AqvI0+jekTtiA+P9wz5Jak72VATgnIZwuBwYVsMGlph1citl1VVBc3ufuPRLuouA1GalVVarUfw5ZBWaE0x2oI7oW20SDrklhws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=SfzQPwVK; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="SfzQPwVK"
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7FF803F69A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751361049;
	bh=FzQqF0J/ul9TxEtjjmA9x9umVEbue93hGArsOir7XgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=SfzQPwVKrzA0fGGuU0vF41rpIyHEFiFpRLjnLu0O/D8ZGXZasMREbc8QFxIwMa1JJ
	 UnMF5RRonKu9kXdZHhrKs5X0byQKKcQS9gBcx+C/CU5GiCInkJ121OghZRPE1llUi0
	 QPzXZUDy5haEJ37hn6rrSHNREDSDvFMi4mqGunTTd0H4x9qEZFaB++1do19wRE3+Ty
	 hv7tFDGlCTGGUFubEqEvbGJdT2Gc8JChBCDCO4Ag+SGWsOrlZa50F4yN9UZt0jigW0
	 5emRNfavon68BEXIr8jOqOgT7PtS4Zuva0KecESy4qEl0eq6AqlKgS0oikgDZzx0z3
	 6h9b4tVGwstAA==
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ade5013dfe7so496931466b.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 02:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751361049; x=1751965849;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzQqF0J/ul9TxEtjjmA9x9umVEbue93hGArsOir7XgI=;
        b=Ns8ZoyXg/Q3F9J+s/bOGiJvsTNK8AABE5U/T5sW2EhfJEfuR6ic0QcLEnBGojdfIAh
         ZowgSKhoC1cJFvr+Dl3KwSOPZFeMjkXQpzOc+JfWqzchOImB7Lakc00dH8bq31pMwU0q
         IDbFvkGUVJ2hrPFeBdew+5DxWSTmTYjP84AHn8A3gHI/+dbrFttSsvmzTBcFh8j59zzr
         K6XuoCw8UntB2mGOZZPKPr9dXTXhHHOqv4L23QwYo9gQY/N+O2ZG2dN4wJCN64VMJ3ht
         IJZvIIkBa1Ha1IO2nUOUA14MwGBINcVbSyaCIuLVjrhpQTbeG9/niPuY6Rm8Cx4BK67y
         091w==
X-Forwarded-Encrypted: i=1; AJvYcCX2j3oz2xSOEzUI9phGqmYmJaBZB6kK3Egy94+TRAJI+KRUlVYwaznVSZ0WZpP+MU+xpd1mBOlN8x7xiyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUEExzhVsoEKyMdmOeM0qN6Fy2IqeHqH9ayC6kOy5RsVRGcobd
	PRvdqMy5KBgwm0BxdiiD/iCea+HCxv9M4pLQ704hmJVXmKrWO2Z669ZtwzQ1Ro42U4+RRvj8b8f
	RamrokGyUQLB6YJtx+qO2ws63lAI/6hlbnqhtROBU9/X4RnvcCQHMVQboU/4sWRO81KHqwFBwUi
	/tC2JOOA==
X-Gm-Gg: ASbGncugNzFh1Di4vZdJfFceF6gwcpBjboi54NBZ+onjzqtKdD9CDvN+j8NYwhRPG1t
	0t9Zuwi3VEFEtgO3TmRJda2JWMcg9zVUq8sBwN71zUmRr63bHtpQIFH0UjkX9SgSTurBBslfEo+
	nqS5InjI6FVS44t1Bl2niu5CFZCwPsm6OGDw8m7eE8i3dZvXng8tmBl4yAHxlRq0sz/0HTU6Sue
	vCfRTqsxnbq/182mQGvIw8FDmNeacEYBiXJblqfPPZ5mZhImNx8iHRreJj+h6Yl1kttW/Fm9tAN
	aggiTl886MTl7OJWMzkgB+iMsxTOXkRrLDa89NW7GZBMAABTQN/n1S3hMWdidf1ZHoWoLMChwFC
	F0w==
X-Received: by 2002:a05:6000:65a:b0:3a5:8d9d:27fa with SMTP id ffacd0b85a97d-3a8fdb2ae51mr14169007f8f.3.1751361038383;
        Tue, 01 Jul 2025 02:10:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9Wa9pcB2UUm59Z4GOCv082ua6JPrrZMxVXb+S8tPsIyn/l8uZo0KZb8KgbdGHQMaVoSmCBg==
X-Received: by 2002:a05:6000:65a:b0:3a5:8d9d:27fa with SMTP id ffacd0b85a97d-3a8fdb2ae51mr14168505f8f.3.1751361037764;
        Tue, 01 Jul 2025 02:10:37 -0700 (PDT)
Received: from ?IPV6:2001:861:3280:410:2ef0:5dff:fe60:6274? ([2001:861:3280:410:2ef0:5dff:fe60:6274])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7481sm12850160f8f.14.2025.07.01.02.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 02:10:37 -0700 (PDT)
Message-ID: <36d50ab2-ef5a-4440-b6c5-ec324afa9260@canonical.com>
Date: Tue, 1 Jul 2025 11:10:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] AppArmor: add support for lsm_config_self_policy
 and lsm_config_system_policy
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 linux-security-module@vger.kernel.org
Cc: john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com, mic@digikod.net, kees@kernel.org,
 stephen.smalley.work@gmail.com, casey@schaufler-ca.com,
 takedakn@nttdata.co.jp, song@kernel.org, rdunlap@infradead.org,
 linux-api@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org
References: <20250624143211.436045-1-maxime.belair@canonical.com>
 <20250624143211.436045-4-maxime.belair@canonical.com>
 <5313b937-304a-4f2a-8563-3ad1ea194cb9@I-love.SAKURA.ne.jp>
Content-Language: en-US
From: =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>
Autocrypt: addr=maxime.belair@canonical.com; keydata=
 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
 yriCIKEAbLqHTyj+RhbroZmv5q3X7iVq
In-Reply-To: <5313b937-304a-4f2a-8563-3ad1ea194cb9@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/25/25 03:21, Tetsuo Handa wrote:
> Huge memory leak.
> Here too. :-)
Nice catch, this is fixed in the next iteration.
