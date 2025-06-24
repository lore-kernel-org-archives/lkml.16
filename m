Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FC223E359
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750747091; cv=none; b=gYlja5/IkG13AY3TjQr/90+PyE8PPV6KxYDJ8Zu1G5y5mfA/O0SyhtnZIQdhEZ233PJoddKr2xBpyWo9WfJ9/W21BLa8dqUQb9hZYstr+2bAjudy913SK/cMY5Z9CEH4QIit2/SKghS1EE9nIHvWkxGBP+6z0jB57CZOXlwyypE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750747091; c=relaxed/simple;
	bh=UqT1UTBAsYvRB01kXkmbX0p3Nu6z/Y55LPEAo9YxJwY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hMT/x1ATP/A3thuz8GgMcndyy6R57Koy5EO8Qg0Frc87/Qo0fi3aCl0BeUBDqf9mNKz03njTPk3q45uZdqpe2ZezKFd0sr1mgLpmJNDhGm+VVHbXXOjw6Cp0wzLkm/YKi2qxcJDg2a3Y5H7TTA+9Zb7n2+OLHROubFxHuWR4aLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kFdQFOoC; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kFdQFOoC"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-453749aef9eso151345e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 23:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750747087; x=1751351887; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UqT1UTBAsYvRB01kXkmbX0p3Nu6z/Y55LPEAo9YxJwY=;
        b=kFdQFOoCEmr6IoMLPSVaYaMOGHHJh2fTIulYqQeMDujwwMIMtgcfzkDkKpKv6JWGAj
         guO0fasKgsx4sWjD+Q0ip96pr+dz8AnjQQUa2CzVixvvfwxvX6/E48RedAgFZi+DZgDu
         CXRc5Z8HsXPXifObXJZqrxMXZSoGlFYR2eO6VxW4tZoAp8tKZl4RfuTSHrADqn6Dt3vq
         wDVecDmWeXAKwSeAmp13CGnlOP/LBT5/hMx2PX8/snA4wIUWw79vHGD4cQNV86edQeEZ
         Z35GrDayuTX5rliE5f3IW7KQPySGWg5I7n6Nd8Y9moMrY8OtoZjJU8JXLOxinKJovBBW
         WbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750747087; x=1751351887;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UqT1UTBAsYvRB01kXkmbX0p3Nu6z/Y55LPEAo9YxJwY=;
        b=gSvgj0EDZnc1+C39pQI8gG4bsfCgF+gnKsEBqkFE5WLWZAVnUpU7whVt/d94wT5RB5
         bSRKDo6Q7wLqBUoL//Paoh7K/lTgpJDCn64V6hOVmWfJhUP9Tj6AjBRSw1YX8fEFfUG6
         Xi4dhlY74sJgtVphx1tLRe1X4HpZ7kOe5Q6ubZE6bWDAi3qBMu7NWgr7lII7EM263pO9
         aAJSZgCQjWHsBXbRd26ozS2iCcoguS/KD1BKCZ1E+SvNLr8Djh5q2WIasIvrRB/mVNvn
         B9QaUBohcbwfQS5ReKne3ZFceAui5Bec7Li9ooWTPlguKiloB7N9Ovyul6gVfMEXMApA
         zdsw==
X-Forwarded-Encrypted: i=1; AJvYcCWnSuUMFh9ZlRKFyzSweLXYL9syyfugBLVp32jtS0ITXaxDQblVbZGGwtK4tmjldHdZrdf/F21ILV18CTg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNjuTWVZo1FybY61gZn99nm8CmB37KedVf7R4BxpiifIApmWRq
	0r1z+vVaNFUJDwyhZk0Q7GSTWeHXuVU9p1T0Trsmn4Qhlpiij/mXTZsgYsS4mIq+N38=
X-Gm-Gg: ASbGncsqBhxCAT0X7qiZc3ghKIhUnlppphU3ZmtvnS12A6eDUQVWN1/PKRTqJAwf4Pj
	bhGxsHJSGb1HWRYrUKJsnSA9/foToZr75EGvymantNosKgyDU9r6QaOQt8Hu9orSIumdnuC4Lwt
	IMolr/54CY1NUoa8v4rFjd1gPctHUzhdxBahAMjFxgT1xHscMvvBwB0m490wJivanzn7Be3+1Mv
	pvu7Uf0okiiTnNEQjWljMM+DzR3ZlY+6BqIE8/Orbf5wdEJU0YsQaPnsVowd3VofDPCojZVxhuX
	aHMWmbYAV2p9cM/h7SVbRz21BIyfzfREqgPVxjaL5YmwxCiskLc4byDw1SHMB41EDr2YqwoxWf3
	lTw==
X-Google-Smtp-Source: AGHT+IGOPbecHGYgB2YysSR5anppdA2xKx7TGTKt6AUrQoPCRTvADAlN3zQqydUylWoqDxWazLJxPA==
X-Received: by 2002:a05:600c:1d02:b0:445:49e:796b with SMTP id 5b1f17b1804b1-453658bac72mr136170125e9.17.1750747087505;
        Mon, 23 Jun 2025 23:38:07 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453647f29bdsm131378405e9.18.2025.06.23.23.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:38:06 -0700 (PDT)
Message-ID: <9237a946ada82934ef4c0b5a84162a400fb5a88b.camel@linaro.org>
Subject: Re: [PATCH v4 00/32] Samsung S2MPG10 PMIC MFD-based drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Chanwoo Choi	 <cw00.choi@samsung.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Russell King	
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon	 <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Tudor
 Ambarus	 <tudor.ambarus@linaro.org>, Will McVicker
 <willmcvicker@google.com>, 	kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-rtc@vger.kernel.org, Lee Jones
 <lee@kernel.org>
Date: Tue, 24 Jun 2025 07:38:05 +0100
In-Reply-To: <202506232219552539103b@mail.local>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
	 <20250415160212.GA372032@google.com> <2025041715425693974c6d@mail.local>
	 <24314441936d97a1892474eacdbbd690612de265.camel@linaro.org>
	 <905e6cab9932c814a578826329f5e3f944418ef9.camel@linaro.org>
	 <b193e94f042cf6134d2bed92152c23ee5bba6a26.camel@linaro.org>
	 <202506232219552539103b@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-06-24 at 00:19 +0200, Alexandre Belloni wrote:
> On 16/06/2025 12:33:21+0100, Andr=C3=A9 Draszik wrote:
> > Hi Alexandre,
> >=20
> > On Mon, 2025-05-19 at 15:41 +0100, Andr=C3=A9 Draszik wrote:
> > >=20
> > > Lee has kindly merged all the core driver patches.
> > >=20
> > > Any chance the rtc changes will make it into the same kernel release?
> >=20
> > Friendly ping.
>=20
> I've applied the patches, I'll try to send them to Linus but there are no
> guarantee they will make it for this release.

Thank you Alexandre!

A.

