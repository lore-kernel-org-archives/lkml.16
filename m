Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA1B253348;
	Thu,  3 Apr 2025 19:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743709822; cv=none; b=aZ8Q+ZeuDmzXhJUCFDdA2jP5gt+k4/s20cv2CBveFvGU1T/GJnEsU0ATWWowIA56S1FbZG81wxjzYtmBKTarf+q+YB5x8heY4+xfslksDnFEJ8k4H/byAt9ictdqDCC9WGmXi+wePjQKXKe/1t6BXu3EIbgQGXBNiN0Gius1lAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743709822; c=relaxed/simple;
	bh=sDhnJrOGyLnuo7pL9+BliU/HmsIdSk89KdW0N95fEoU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=oK/vEn3z5yQHohq3Yg3mqAi3JJPbDkAnXeTkYihhwAVy4jRZsfPd4NJgEW7o4ViDAp75VwugxsWHJwicODD5+3OMjMbwUHYY2E6saZ3WOFWcFzMwPd9NVbvnTbPclM3HCWGV7Csfw0AIPXa/F5dkbD2m+sTaB4gg+eKtS8fYAkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3Ywh70F; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3Ywh70F"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30bf8632052so11103781fa.0;
        Thu, 03 Apr 2025 12:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743709819; x=1744314619; darn=vger.kernel.org;
        h=in-reply-to:references:user-agent:to:from:subject:cc:message-id
         :date:content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tiT2BZFLvjpYhgjv3NWjjKZqqKvHJampIoV0mL2vGD4=;
        b=B3Ywh70FSO5dHkz4E78ZOhw0k/Goi06fE+WOOxNU3UaXiwTBJ4b3sh0jRqI5jHNXU4
         qwqLMUH9fGss9DWLeS2sGt8FHb8/NvIQ2dnG95upwPeMaeMSYy2WO8aXOBF//YcEBVrx
         tiacr0EvkvrxVXeakwDhW+TEYzHtTF7dFrYm17BFidd5c6R8fT3ju3peO1i87l+SvxYv
         EIoqHh4bqmcY9kf4f4e+LznUKAa0g4Amhwt6U1BJ8BAvBg9J+jrHgh1cnbR//g4rXjuS
         b1HX2OD2kGZ6vXpHD5v7FCyv6+aH7SZASUEPRTWu0K/AJqclResiI6hSDtLFmiQKkdyP
         KIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743709819; x=1744314619;
        h=in-reply-to:references:user-agent:to:from:subject:cc:message-id
         :date:content-transfer-encoding:mime-version:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tiT2BZFLvjpYhgjv3NWjjKZqqKvHJampIoV0mL2vGD4=;
        b=jRsZ4Siiw//Y/+Y6rGUXjdK6AFgD6zpVwq5ODH1u224W4akAi47oIrJxlA7hfZ60TH
         wpuHCcGowSRsKWJYiMRh5p05Bxi6RyGHm++yzwE6Eh/FZOJ7tIq7DQEW0OpbEdL3VNnt
         OR0/yLk9JZ5aB12O5I9V2cErzJOVNnwd33flptDo3kBTZKT3x4wohm3mYhMV+S3JTMf5
         LFOK6NHt2M+ghD1ku0dvSQLOf2M8nRcBdtKv2k7lNx/a3W9u2I7qu20xjSmUOIiCh3AL
         pNsKktn682lQkyHvGdUoedvSDkrn/vl5gDz/XQ/0QedSvxT4IpCFb2Ih/IUukUMhwNWr
         mpdg==
X-Forwarded-Encrypted: i=1; AJvYcCVHuWvTtmjJI439Uasqax61rXFK5nwh+jfPuTgi/TFFCbmxZsi5R0tVPp+tZ7w+kQbgyZ8i7b7dvzwP2QA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJhOrmtd83AR/CDVN2SKtm20iK1s0ztmYsX9g2Ow9Fn5dtRhaE
	Ue0ElE8EyypWL1cZ/RwX7GBhGLRVNdajqB2nSgA4LSjLs7rqHDrS
X-Gm-Gg: ASbGncuW8S062Drho0gCIugjE5edBKKja+bMWL7PLSMJ5mh91tiEOOO9QH1bkW6JvNy
	hxO04L5xOLUgg4+cEOjOITL6LKv1b808m+1Ls28ShPUAVFHT3wYHA9+duCzvF1lXt5m6MjhiA7j
	fqVuFmgDDY2iWHobm/h2EN4CFgSDnTgbQLD4YbZD50f003VbY38KWXQQum/WGyk19kfqDAz5IvT
	dOVMmKN5CNRc6KRuvmdugwRpCgvdZcJy9YU5xcr0ocd3zD3ah8oDA75KIbb9ICHu3dkfMVfTsVl
	BvILhsVLM2n9Ec/hH1H7yIuk7KQktk9LcbROCAo=
X-Google-Smtp-Source: AGHT+IGrorQ5FuPYZrThDMKqggO+30FvVsrfYRiJVo3DlRU9IYpzcb8iazeM0Ji9ePXvEuZWbPYtLw==
X-Received: by 2002:a05:651c:3232:b0:30b:ee67:2ba5 with SMTP id 38308e7fff4ca-30f0a11e9f1mr2353721fa.13.1743709818547;
        Thu, 03 Apr 2025 12:50:18 -0700 (PDT)
Received: from localhost ([89.250.166.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0314b94fsm3141731fa.60.2025.04.03.12.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 12:50:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Apr 2025 22:50:17 +0300
Message-Id: <D8X9JJGPGDNL.1OTKIJODRFKNN@gmail.com>
Cc: <arm-scmi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Peng Fan" <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: add timeout in
 do_xfer_with_response()
From: "Matthew Bystrin" <dev.mbstr@gmail.com>
To: "Cristian Marussi" <cristian.marussi@arm.com>, "Sudeep Holla"
 <sudeep.holla@arm.com>
User-Agent: aerc/0.18.2
References: <20250402104254.149998-1-dev.mbstr@gmail.com>
 <20250402-hidden-unyielding-carp-7ee32d@sudeepholla>
 <Z-1gY8mQLznSg5Na@pluto>
In-Reply-To: <Z-1gY8mQLznSg5Na@pluto>

Hi Sudeep, Cristian,

Thanks for having a look on the patch.

Cristian Marussi, Apr 02, 2025 at 19:05:
> > Please post this patch along with the vendor specific protocols mention=
ed
> > above and with the reasoning as why 2s is not sufficient.
>
> Ack on this, it would be good to understand why a huge 2 secs is not
> enough...and also...

I've been working on firmware update using SCMI vendor/platform-specific
extension on FPGA prototype, so not posted it initially. I'm open to share =
the
details if needed, but need some extra time for preparations. For now I'm
posting a brief description of the extension. It has 2 commands:

- Obtain firmware version number.
- Update firmware. Firmware image is placed into shared physically contiguo=
us
  memory, Agent sends to platform micro controller (PuC) physical address a=
nd
  size of the update image to start update procedure. After update is compl=
eted
  (successfully or not) PuC sends delayed response.

	Agent ----     start update         ---> Platform uC
	Agent <--- update procedure started ---- Platform uC
	...
	Agent <--- (async) update completed ---- Platform uC

I've faced timeout problem with the async completion response. And update c=
an't
be done faster than 10s due to SPI flash write speed limit.

Why not to use notifications?

First of all, semantics. IIUC notifications can be sent by PuC in any time.=
 This
is not suitable for updates, because procedure is initiated by an agent, no=
t by
a platform.

Secondly, code implementing  notification waiting duplicates delayed respon=
se
code. I had implemented it as a proof-of-concept before I prepared this pat=
ch.

> > Also instead of churning up existing users/usage, we can explore to had
> > one with this timeout as alternative if you present and convince the
> > validity of your use-case and the associated timing requirement.
> >=20
>
> ...with the proposed patch (and any kind of alternative API proposed
> by Sudeep) the delayed response timeout becomes a parameter of the method
> do_xfer_with_response() and so, as a consequence, this timoeut becomes
> effectively configurable per-transaction, while usually a timeout is
> commonly configurable per-channel,

Totally agree, usually it is. And that's why I didn't change do_xfer() call=
.
Here is the thing I want to pay attention to.

Let's focus on delayed responses. I think delayed response timeout should n=
ot be
defined by transport but rather should be defined by _function_ PuC providi=
ng.
And of course platform and transport could influence on the timeout value.

> so valid as a whole for any protocol
> on that channel across the whole platform, AND optionally describable as
> different from the default standard value via DT props (like max-rx-timeo=
ut).
>
> Is this what we want ? (a per-transaction configurable timeout ?)
>
> If not, it could be an option to make instead this a per-channel optional
> new DT described property so that you can configure globally a different
> delayed timeout.

Taking into account my previous comment, I don't think that having a per-ch=
annel
timeout for delayed response would solve the problem in the right way. What
about having a per-protocol timeout at least?

> If yes, how this new parameter is meant to be used/configured/chosen ?
> on a per-protocol/command basis, unrelated to the specific platform we ru=
n on ?

As delayed timeout is IMO should be defined by PuC services (in other words=
 by
command), new parameter can be set directly in the driver. If we talking ab=
out
per-protocol solution, using DT is also a good approach.

> Thanks,
> Cristian

Sudeep, hope I also answered your comments from the last email as well.

Thanks,
Matthew
