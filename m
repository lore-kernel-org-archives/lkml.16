Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8265C18FDB9;
	Sat, 12 Apr 2025 10:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744454395; cv=none; b=ogfxCBOhBC5CQNe0QOQb0U7i4h1zQ6BDGXPZ0y5oLojHnG4dJ3XiiABTXRlJJO5WmJfcCe7C2VmvqyeRsyQ2PlBKhzaOmtKfEBMwCkkBazqMS6xDiu2/0lXH1FMHlH2aGkhnn7zPC8lnCxBNXim1I7R2k+0HdFu10k7lbU216+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744454395; c=relaxed/simple;
	bh=yAFzW0ymkaPRNBJhUxqHJQFObzo6YSO+XlIk9KglnZc=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:Mime-Version:
	 References:In-Reply-To; b=jxUGaV7aDWaC5CChSf14Z+FoE8gUdBA2Wy2rGnmwL0TF6MALKXlbtedvSXhK4elYMWz0cjCO2OL/zCv1w4Ij4d5qgEQ7nyzT6RqLIa7vGxCPoO/YHI2Gpo0mHgJtUZghc0M1fqNITZ6L8ozWjIVO/PHE8Ic89MNjPEAkmDAF+TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APCgY5Mx; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APCgY5Mx"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so3196714e87.1;
        Sat, 12 Apr 2025 03:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744454391; x=1745059191; darn=vger.kernel.org;
        h=in-reply-to:references:user-agent:content-transfer-encoding
         :mime-version:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yAFzW0ymkaPRNBJhUxqHJQFObzo6YSO+XlIk9KglnZc=;
        b=APCgY5MxsH275MGs4OQ/a3QBYkm5I4lNgk2Jw5r4W4TVusqtaAKyecaBRITSOoNOK+
         c9pkWqqxfysrph5vCQmYEKTA1O/biSQPPFVqspXvDAupgbD1jL7C86mPZbwfAMF9FRvj
         85xD5n/2dFeWHE953OgqhlcGw6Q5faMrXoeyYJ1A12CejDAymFye4MHkdCXSxyEI9BDP
         l+2v78lDTtGdMjGcv8wKvkwQ2NR4QxaDBU2OvkGbjto9J6+0EDNVRnXK4jrgOXq0fHJR
         ddbdir87Ph4s2+5zhpLKSW2xrD6rz1Byrg5IYfE9soV/wFklGKMZ9LCeH5K54LVXYTAl
         +K5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744454391; x=1745059191;
        h=in-reply-to:references:user-agent:content-transfer-encoding
         :mime-version:subject:cc:to:from:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yAFzW0ymkaPRNBJhUxqHJQFObzo6YSO+XlIk9KglnZc=;
        b=clXaxfqBk4s0R0ZCs9vPd0B1aDv6HgXN150r6dm4ABNy/yB0IF4RmZ/x9akQhu+f5s
         fTt/kY386Q+A6BWHQkTkEkpFA5yFbZGZsxVkA5m9Y9uE6EOMI/fD1Wl0Kx5Ojb7QtIXY
         MVmHdOKlbyNbMgtu5Y4/BURaKqt5RpOK15ks+5fXTD22no34gmYACflERrGb5dwYQA+w
         CZticjPx9ZChslMOtbjdSPg4z13XMZ1GGNDjB5fEiu1TGXLiWWqSH8Io5O1QhtlG42XS
         VRsq7EfxS9rsEfgWQbL+fugz6MbsY+n3xyB5wAkXhnaSoxvA/GVAAV+X3uhp6cH3y8dW
         kbaA==
X-Forwarded-Encrypted: i=1; AJvYcCUGSRbmgyMT07eog2k89l70hjkYTepHthVpfInBdOCtYcJWlfEu4J2X//TF5Cd+YKlsy756rTg11w==@vger.kernel.org, AJvYcCUfDwuIShidmxaFBYRY1bGUbPElW/IulDcfla6GY2ZhEpcP3Es2AJV38JupZRjRacvB/KI6GdbIaj+Cnaz2@vger.kernel.org
X-Gm-Message-State: AOJu0YxT++/M9Qgo9AQIHq3n/4DAZUpneyZ3rL7SWPNf2m2CqhATsIDP
	gyIPSL9adalmfh+RAPVYHLZ1CJmBIFryum51G3z5h7wh9vxg2G8q
X-Gm-Gg: ASbGncuJfCpllEHHuuU9y3jjlTMnUGh6Jzf6tTG7u17rSZoCzOY6+uR1GYBFjHLil8y
	qlALsSYsCLb5B20zVenPkIdgIyk0/EsEh1HdDZwu+mLZWygjsrNf6RyHv47GvHX+OCsrhwDtrYS
	xKu6vDgHNm3Q6lupEvOpciQJK9L02tdX3eszml0KIhZ2Dzwz9HlRWbZqJgCnwisbx8S+nfFT2Eg
	dJ3R+D11Lex8YGRwIYV6130vQCJueucUgUUVTBaW2UzcF3dhonTgh06ClC/Z1Z8Rhpo1USEbRKA
	btNbq3ZBSIjey6zEJp2NSYk+IlJP4kTw95c=
X-Google-Smtp-Source: AGHT+IFYfq5iTVEjCE3996E/WIGRHlIRpig53diaZf8XS7XcDoOf7GYaOf5VLRd+nDqBV62DgJ8OOg==
X-Received: by 2002:a05:6512:308d:b0:54b:e70:3647 with SMTP id 2adb3069b0e04-54d45289b2amr1794412e87.7.1744454391263;
        Sat, 12 Apr 2025 03:39:51 -0700 (PDT)
Received: from localhost ([5.18.181.127])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d503d08sm607672e87.135.2025.04.12.03.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Apr 2025 03:39:50 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Apr 2025 13:39:45 +0300
Message-Id: <D94LGXDHGVBD.1GB1GHOWORHMU@gmail.com>
From: "Matthew Bystrin" <dev.mbstr@gmail.com>
To: "Sudeep Holla" <sudeep.holla@arm.com>
Cc: "Cristian Marussi" <cristian.marussi@arm.com>,
 <arm-scmi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Peng Fan" <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: add timeout in
 do_xfer_with_response()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
User-Agent: aerc/0.18.2
References: <20250402104254.149998-1-dev.mbstr@gmail.com>
 <20250402-hidden-unyielding-carp-7ee32d@sudeepholla> <Z-1gY8mQLznSg5Na@pluto>
 <D8X9JJGPGDNL.1OTKIJODRFKNN@gmail.com>
 <20250409-fierce-astonishing-bug-dd2adb@sudeepholla>
In-Reply-To: <20250409-fierce-astonishing-bug-dd2adb@sudeepholla>

Sudeep,

Thanks for taking your time.

Sudeep Holla, Apr 09, 2025 at 14:12:
> The start update should retain as soon as Platform uC acks the request.
> And 2 notifications can be sent out for update procedure started and
> completed. I don't see any issue there. What is the semantics you are
> talking about ?

I'm going to refer to section 4.1.1 from the spec, where stated following a=
bout
delayed responses,

"Messages sent to indicate completion of the work that is associated with a=
n
asynchronous command"=20

Compared to notifications,

"These messages provide notifications of events taking place in the platfor=
m.
Events might include changes in power state, performance state, or other
platform status"

So before I implemented mentioned driver I had red this two and had chosen
delayed responses, because it had seemed more appropriate. Details below.

> Even delayed response as some timeout so I would rather prefer to use
> notifications

Hmm, I see.

> in your usecase as it is completely async.

Just to emphasize, according to the spec I don't think that delayed respons=
es
and events have different degree of asynchrony. The difference is in the
initiator of 'messaging'. Events are sent by platform to indicate its' stat=
e and
delayed responses are sent to indicate status of previously requested opera=
tion.

I used the latter, because firmware update can't happen spontaneously. That=
 what
I meant when used term 'semantics'.

> Yes neither per-transport nor per-protocol timeout will suffice in your c=
ase.
> This 10s timeout is specific to the update operation and hence use
> notification. All other solution is just workarounds not generic solution=
.
>
> --=20
> Regards,
> Sudeep

I see your point of view. However, taking into account given arguments, did=
 I
convince you that delayed responses handling should be implemented in sligh=
tly
different way?

--=20
Best regards,
Matthew
