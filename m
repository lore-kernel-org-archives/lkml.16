Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597F0224B12
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749610456; cv=none; b=Om5Qf7lWqgEdFN49k/23xQXB3grZDVfVAc3hfDqNqe6LIX70WcV9QibnfdnVkf7cIfqVuQzVfvxV5aHkSa9Ppg1/xon0PToyOiFiunTqfPwbBg+tmEuVUqTRnhsF/to9lWUhpHypR2CkFI1xFVDqWrtG1QpnyKV3+uNCIT86PrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749610456; c=relaxed/simple;
	bh=7bBcAXqk1I+VVeiV6ukcbZVZQFE9LOKNJQfhAeMaYmk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oh+oaRZlIX/x9Snm8NsjWe7FrkkjF2hbznblG4e8+jlee6BVlHTONhSpQZAPO+PE4xBLFdc4UkZp1442o/I0LIu1wfpCR0/sDPfLbncxsYIwYz35b9uGaOlRLKhFZ7nP4QS9GXKW2yHd4E/JPUQLmLaLhIBSs3FvAG9eVlXkLo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=g4owkazX; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="g4owkazX"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-747c2cc3419so4388052b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 19:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1749610452; x=1750215252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvhdbwC7GlQ7Ymy4NECGTOK/NLj/pIniYUG89S8ijWs=;
        b=g4owkazXSUeJZyBBAxichhbwj3z9vF8oiOVDpXLPhX3PNS4RNEVK+wRUmXwiLrrDox
         MyVaT+k97E2p2V4fWgBDuhG7hFBRnrNg6DvMWCY4zo+SK/IRXgIZAefV9s8/nSi9Efoi
         Lpqpm7F5SEoMdRGIEPvBD0f99BLO8vhubQvKimo/1W2aUFgJartByw9o/wZbaw1PQw7Q
         UX14w5Z7OaQXLuhkZ3+ZWFdXlGkK8XOQmavOXKO0nsfDjfGWP7GN1SVH5D0oBYmP+zbO
         9Jgmu7S2Ixj0tPxJUMg+ET0co6mD3Vax4gDbP77s3tMUHVipAuUYYjQbAvyGuAAtfdcq
         GRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749610452; x=1750215252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvhdbwC7GlQ7Ymy4NECGTOK/NLj/pIniYUG89S8ijWs=;
        b=ADepLDbRlq1AX0AP7o7/R30c0XmyrsHv9BGN1HfaRj1cY2Z1m6VBWvoj+n7DU8OjJD
         Ny4fYD+kdMmVxJpca3Ylp8ZpoSWX0KmI7bFjMNPqRkgssfPlxDmtFsnZUBk1HGoQJ8gn
         VAuN/Adyi78OVS7MdrkEGCGdvD0P7GC1x0ZccKBDBk3rVBAyhVgE+M+ikoS49ZMui4ak
         FeJIq84EfmxmSJNA6zUFLh9rdguUW5fwKlPy4h4IdmZ+9F6IPNw66HzPXBprySwY6Ife
         K4rn8vsPzDfiPDaOsdDvAv8BRwSDXNzGLYfwZby8ZH6EBFdU70bU3qYVkyjb6yrGDQig
         1cfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKREV06dRfCkeJ88DYUmCVSb7rEwbSZWnoZ2Kwxqh3DZ1ZeuWjXmxAEsB2gC5OnWKbKq84S5XLlrimKeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYOLHWAOJ8aq/eS89vP+dPL0QQKwwgIvtjp7esFJ9YVkR/pPBf
	iasi+W8uLUDqr7RC8bn18lVsuRfcdvbGLNIT5FB/5fiBjlCvtnM0/1HmKIUGqwY5rXwbjFx/+uv
	4ZjDA
X-Gm-Gg: ASbGnctVt1JWvEWL3H4MGP7Z/Y7HRXIDrpYTyV9NwOcO/YsCD6weGgyMzQsBna8WceG
	e7Ql9tct77Aw6ggAKUK5YiIINT3MCscczq8OJXV0A8Neq4A1FUUlqkoI5YfoYyeia36RX2hJsxi
	NTBVde/wfv/HCp8/UovbYvbUaGb+YUJuEqY/I1GJJQdH9KJjqhyLptKEbtgdS1WxKV0KVuMNbS8
	RyXk7qsYC+Dzg+3HqWHVLEfMyzStKLiiLz3UjViPrNn7d/vGw4XNdPnlszF6AELVzubAdaxi67J
	4jVEI+5A/nav6FhN4izLWW1eWJbsBdaogVCDsi5FMjiL36xTq4fSd1y7y15Hfeq4vavvLkHCtfV
	0rQQ87A/8EZc25MKx1dI3vP7fRdcZKiwzvmlkQCYQnT45vYyrcBo=
X-Google-Smtp-Source: AGHT+IF4IWia7+/Zoelt0V51ImshqdDW3EVlJTV2jNW4PDasl3zUBre7T3PUTAvE/YeMgwgx32XjXQ==
X-Received: by 2002:a05:6a00:23c4:b0:740:4fd8:a2bc with SMTP id d2e1a72fcca58-7486fadb011mr1326340b3a.5.1749610452445;
        Tue, 10 Jun 2025 19:54:12 -0700 (PDT)
Received: from localhost.localdomain (60-248-18-139.hinet-ip.hinet.net. [60.248.18.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c8a6bsm8376291b3a.142.2025.06.10.19.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 19:54:11 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: robh@kernel.org
Cc: chiang.brian@inventec.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 1/2] dt-bindings: trivial: Add tps53685 support
Date: Wed, 11 Jun 2025 10:44:17 +0800
Message-Id: <20250611024417.143891-1-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250610182529.GA2478194-robh@kernel.org>
References: <20250610182529.GA2478194-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On Tue, Jun 10, 2025 at 13:25:29 -0500, Rob Herring wrote:
>  
> On Tue, Jun 10, 2025 at 12:41:15PM +0200, Krzysztof Kozlowski wrote:
> > On 10/06/2025 12:25, Chiang Brian wrote:
> > > Add device type support for tps53685
> > > 
> > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
> > > ---
> > > v8 -> v9:
> > > - No code changed, correct the order of Acked-by tag
> > > - Link to v8: https://lore.kernel.org/all/20250602042454.184643-2-chiang.brian@inventec.com/
> > Stop sending this to me 6 or more times. Every version you send multiple
> > times, that's way too much.
> 
> I only have v1, 2, 3, 8 and 9...

Thank you for clarifying. You're correct - there have only been 5 
dt-bindings patch versions total.

The version numbering jumped because I initially submitted only hwmon 
patches (v1-v4) and was later advised to include dt-bindings patches. 
Starting from v5, I included both patches but didn't align the version 
numbers until v8.

I understand this may have caused some confusion with the numbering 
sequence, and I'll ensure better coordination of patch series from the 
beginning in future submissions.

The following patch history may clarify more clearly.

v9 patch series:
- v9 dt-bindings: https://lore.kernel.org/all/20250610102556.236300-2-chiang.brian@inventec.com/
- v9 hwmon: https://lore.kernel.org/all/20250610102556.236300-3-chiang.brian@inventec.com/

v8 patch series:
- v8 dt-bindings: https://lore.kernel.org/all/20250602042454.184643-2-chiang.brian@inventec.com/
- v8 hwmon: https://lore.kernel.org/all/20250602042454.184643-3-chiang.brian@inventec.com/

v7 patch series:
- v3 dt-bindings: https://lore.kernel.org/all/20250515081449.1433772-2-chiang.brian@inventec.com/
  (Next version number has been modified to v8 to align to the patch series)
- v7 hwmon: https://lore.kernel.org/all/20250515081449.1433772-3-chiang.brian@inventec.com/

v6 patch series:
- v2 dt-bindings: https://lore.kernel.org/all/20250424132538.2004510-3-chiang.brian@inventec.corp-partner.google.com/
- v6 hwmon: https://lore.kernel.org/all/20250424132538.2004510-2-chiang.brian@inventec.corp-partner.google.com/

v5 patch series:
- v1 dt-bindings: https://lore.kernel.org/all/20250314032802.3187097-1-chiang.brian@inventec.com/
  (Start to upload dt-bindings patch after being pointed out)
- v5 hwmon: https://lore.kernel.org/all/20250314033040.3190642-1-chiang.brian@inventec.com/

v4 patch series:
- No dt-bindings
- v4 hwmon: https://lore.kernel.org/all/CAJCfHmW61d2jd_tYpNEqBG_Z58bEnVKAmsvhrEP1zXQoXqrUVw@mail.gmail.com/

v3 patch series:
- No dt-bindings
- v3 hwmon: https://lore.kernel.org/all/CAJCfHmVyaDPh0_ThPjhBP0zMO1oE1AR=4=Zsa0cMPXU3J4v6dw@mail.gmail.com/

v2 patch series:
- No dt-bindings
- v2 hwmon: https://lore.kernel.org/all/CAJCfHmUteFM+nUZWBWvmwFjALg1QUL5r+=syU1HmYTL1ewQWqA@mail.gmail.com/

v1 patch series:
- No dt-bindings
- v1 hwmon: https://lore.kernel.org/all/CAJCfHmVy3O4-nz2_PKF7TcXYr+HqTte1-bdUWLBmV7JOS7He1g@mail.gmail.com/

Best Regards,
Brian Chiang
