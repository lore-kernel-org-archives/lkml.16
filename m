Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7634C79;
	Tue, 10 Jun 2025 03:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749527244; cv=none; b=D1lIszpOY2mlL7KolavC9gSelF6AfE7QISl2oIN5T1ppgtsO3q874DebICNPE3wWxJe/prwumKM6nEuD40qZGQKMV9uNoLIv8O+O8F3nnYRgpb9FAaZKem9HbNbFaG45EqSYD4SQEo7cFB0ecHXCxdbK+WjwZ+OS1utLPW/vA3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749527244; c=relaxed/simple;
	bh=pMkBGxYpFaHIEwycJ9b/MJ07k3/wrKnc9cEFEsenxrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJqK1mGObQu5IRbyKUsXdAvBshS4S0P5Qu7vUpyS6ZbCvk386KXwBwnWQnGcoRWnlPks8OAT0Ndxb62djqjeTttfakAplJyH+zBtjZbVKtOeXjlB0Jv0g+2WLZVLj12xbqfiZqNAUKsIAitwCyV6gQvWJqXAAEIPTv6Qlepn5f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqsHuaYN; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqsHuaYN"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fac1c60e19so67701816d6.1;
        Mon, 09 Jun 2025 20:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749527242; x=1750132042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zDCiCjFRxyiCWt4jIH5Z3HVu6j2gY+Qm8orsgIXQqP0=;
        b=VqsHuaYN0giHeDnD+EsMQTp6N2HGP9vTwHO8ci1iCqKXIAg6l88xW8sTW8h10+6mRY
         J2g1Ca9+KrW66VY6eIXDrp24ivyBCbZgiSUUbiKICh7xCM/X2ZdaqU9slSAqZUxSprpD
         Z12mJkxjcuFzVbLzjLB6p1VkRNw5U/Dzct5qjW2zoBk+qqsRU4wf0ocHO8buFh7Cw5yY
         TH3Ztzk2uHpgc0A8wWwq9KVlcYjsxC39nCCHQhTrujKw1Tv5NjZZ1K1G5c49Twye9agO
         3c+brcDyeij9D09e+0b9+T0O0UZBqw71A6ol0WyP4N3pt27s7HXhhnIlMvfSVHLMnTZ6
         VWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749527242; x=1750132042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDCiCjFRxyiCWt4jIH5Z3HVu6j2gY+Qm8orsgIXQqP0=;
        b=ixhfOMn9Kt3s+mT2THgAQN4DOTmTIQTZN9oWgy5aNkafvMHxJomNtFgrYoKUDhroCh
         Q+183HFQBOEeDDWCiTAcuFZZcg7OFkhxbGwQl+USToAr+v9446NNy/PeioVBJljkC0zb
         9VH/gect46i2MSpWf4tME/4iQSexQR3l/nCTJXUY0P40LnJoRlccfEXdu28sxszFhe6e
         tTsPeJesrlS0hkGQF3/x4HOTOvgR2++Gk3g3AmfGHYPWN9soPcbeAbnp3qKqDeX93lzK
         YozEJeSFqqpn5hu+vKH+DT8ff4XGZZxx91CpOo1cM3fiXAElnFE+OtZ0AA0havLguqAq
         KpKw==
X-Forwarded-Encrypted: i=1; AJvYcCWfKgLeElF8b9H3A2m8q7zJ/G1mFSML9sx939Y13rCMMRDS2c9BWuRpnAiFQUd8k7bIJx7uQ/5X7YDTEwKJ@vger.kernel.org, AJvYcCXsonm1yNBM7dAqkq/Kgr1En4QBeMa6J9IKKCsQr9xvC6pqA7OhgYrRJkqaLaDPmg3DXhpKnvlXgQX4@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk2VpBPK3JCSIl+E576/vVdiG0+PwlhwZUMrhuHDE9z9s9+nT5
	u7dfMqLxHYylqe+n5CJS1HIqGNeb7cq0G3kydq+4I/BMLAdWBX5iQ8Xd
X-Gm-Gg: ASbGncvSj1pa9QXN9xBY1mR0/3X8RtfBer/je+IMdKd0sb1CgP6ERkdBszsxuEguf3c
	tJtV/UapQjjwrpQJoWo0ID3vHdG92Q5gh2U5BWKEKmnPJr0qYeJsEzv+qrlVE1jR/Kx5GeWTgk8
	UBhr/HLwdqCkaYXOvlXUan4BzMlHLvGFEOUo1h0EGHadEs++YRJJjCVOhcJX+VDDe0CSOnyeovY
	dvqFrCSpbSAi286A/X6OjVSveITeEoFzz1QZKKbYOq4framJdRCyUYmBOhYL3kAswDg7wZpw/nj
	moONj2AvFRJQupxyaIp33x9JnxdEGx+nCS9rAw==
X-Google-Smtp-Source: AGHT+IFExzcjd3nECuvCDrhqt2cMUduWzh5W32C4n8+lgZH4pHu74tz/o2U2TyL8FHM90amPFhcd1A==
X-Received: by 2002:ad4:5ae2:0:b0:6fa:b467:aa67 with SMTP id 6a1803df08f44-6fb239acc8fmr32720396d6.20.1749527241748;
        Mon, 09 Jun 2025 20:47:21 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b354aasm60401156d6.108.2025.06.09.20.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 20:47:21 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:46:14 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Yixun Lan <dlan@gentoo.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Ze Huang <huangze@whut.edu.cn>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 0/4] riscv: sophgo: cv18xx: Add reset generator support
Message-ID: <p3fgduezi466wxyc7d6z6msmlyzwrriuwfha5xny5bd4qwzbah@zsgdahiylooy>
References: <20250608232214.771855-1-inochiama@gmail.com>
 <MA0P287MB2262D3E1D44D6B4C5E9A06C1FE6AA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MA0P287MB2262D3E1D44D6B4C5E9A06C1FE6AA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>

On Tue, Jun 10, 2025 at 11:27:01AM +0800, Chen Wang wrote:
> hi, Inochi,
> 
> Judging from the title of the email, your patch should be for supporting all
> cv18xx series socs, including cv1800b/SG2002 (formerly CV181xC)/SG2000
> (formerly CV181xH), right?

Yes, you are right.

> I see Alex is submiting a PR to support reset for SG2000 [1], so suggest you
> discuss with Alex and merge your work with his to avoid forking.
> 
> Link: https://lore.kernel.org/lkml/20250609230417.620089-1-alexander.sverdlin@gmail.com/
> [1]
> 
> Alex Sverdlin, I see you are also in the to-list, what's your point?
> 
> Thanks,
> 
> Chen
> 
> On 2025/6/9 7:22, Inochi Amaoto wrote:
> > Like SG2042, CV1800 Series SoCs also have simple bit reset generator.
> > Add necessary code and bindings for it.
> > 
> > Changes from v1:
> > 1. rebase to v6.16-rc1
> > 2. patch 1: apply Rob's tag
> > 2. patch 4: fix wrong reset ID
> 
> two 2's, makes me confused :)
> 

Oh, a small mistake....

Regards,
Inochi
