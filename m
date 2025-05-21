Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF3D18C031
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747840405; cv=none; b=Q3rk8VxRFd3vvOKcfW05tfoR1Z5wAynUZf4TMuNAoT2WQe/pfruwpPZ5riY8e/acFoOXp0gSQO2ONTO1yyTvboPSujHhddBwZBJDs+Nuu9XGk0xJNjfbxAzVAn5JySChH39CD9DlsP93D2og+uTa35YgBYT/AQNwuNqlc2nobMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747840405; c=relaxed/simple;
	bh=HKFYjLGl0AhvI2j7N294f4zxjG+RRDnfHcqEyiXGD/E=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=NE0zmD35VzzLfJMCQza0SlLg1MihpUIZgsmJfpNtsmBsFhMHWOzJBi3mG72uOYB7Q/8MwXCnDivNYIW/c6vCOY9y1jzQxmlpX/PVHIJALdEFTTk3tNLy0Oam3s73Ws3yRkGwjChRSt+SYQ/i25wWtQZylzvuz/Z9H4pRMbPbH0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=c1LPe7Rn; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="c1LPe7Rn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1747840386; x=1748445186; i=markus.elfring@web.de;
	bh=C5LycQNaw8orMGc+wS8N/VpLe9ZnVwajk9V2DYFxJTI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=c1LPe7RnyQLJqezgNZnJiRglo5erfqB69CRQJK9VjX/yW+pe/8almLwmvudRiwsT
	 vXPO2DsGB2sLs07B8ZkTZwTEu0fWTMW9Me5i831gjipe/EY77BeeNzHnP0XsOb9YC
	 52CCaz7tJS0ppXrVlyrPRZhGGpV22aXP8ovHNP6aWVx0pdshjgu5QtIUBWxXfj00C
	 D7zMLbXhPQXsYcmyo4+iA4eeKxPxeoGHo+r0XNEf8+LhbV4M/bxAws1zKT44S5rLP
	 fcanhbLxX1IXWCN3oWzHqPx1ry5GK+pZI1y5suYsfKi6NkdCaXU2d4AXDpkFEs2Tc
	 Bw7U/j7AiizirOU9vA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.179]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MQxo5-1ucsWE39cN-00KZz5; Wed, 21
 May 2025 17:13:05 +0200
Message-ID: <94b0548b-e48a-4bff-8611-116ed89baec3@web.de>
Date: Wed, 21 May 2025 17:13:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Anusha Srivatsa <asrivats@redhat.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, =?UTF-8?Q?Guido_G=C3=BCnther?=
 <agx@sigxcpu.org>, Icenowy Zheng <icenowy@aosc.io>,
 Jagan Teki <jagan@amarulasolutions.com>, Jagan Teki <jagan@edgeble.ai>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Jianhua Lu <lujianhua000@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Michael Walle <mwalle@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>,
 Simona Vetter <simona@ffwll.ch>, Stefan Mavrodiev <stefan@olimex.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel@puri.sm
References: <20250520-drivers-mass-convert-part2-v3-0-f7ae7b723c68@redhat.com>
Subject: Re: [PATCH v3 00/30] drm/panel: Use refcounted allocation in place of
 devm_kzalloc() - Part2
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250520-drivers-mass-convert-part2-v3-0-f7ae7b723c68@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pIYsPsnqjhlvG+MZMM0Mt09AD7/edQVHm6fNlQ92k7YSphn40AE
 i7RgsJ6NvjGconXxuFxsFv4cFK24I3XoN9L/gpGWxB7xusG8UyvRfsWi2tr0jCU1OUGKi5C
 JA4M6/RvXaVkpcFc88WiEKre6WqRMbZCSVcR3TLxscVWmTpZ8Ees2yTWsjdoA7mG+Vkwoea
 JiF3vxSLKyt1FJHiCDZNA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RAkLpYKdmJM=;3XEurzZ/SYRjO+/iujLrzDvfr1S
 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
 taM0=

=E2=80=A6
> There are a lot of occurences of the panel allocation across the
> subsystem. Much thanks to Maxime for the semanic patch which actually
> gives a list of panels allocated unsafely.

I imagine that the shown SmPL code can be improved another bit
(like the following).


@find_add@
identifier add_f, b, c;
type T;
@@
 add_f(...)
 {
 ... when any
 T *c;
 ... when any
 drm_panel_add(&c->b);
 ... when any
 }

@find_allocation@
identifier alloc_f, cal;
position p;
type find_add.T;
@@
 alloc_f(...)
 {
 ... when any
 T *cal;
 ... when any
 cal =3D
(      kzalloc
|      devm_kzalloc
)(...)@p;
 ... when any
 }

@script:python@
add_f << find_add.add_f;
alloc_f << find_allocation.alloc_f;
alloc_p << find_allocation.p;
@@
coccilib.report.print_report(alloc_p[0],
                             "ERROR: Panel driver is unsafely allocated in=
 %s and added in %s"
                             % (alloc_f, add_f))


Regards,
Markus
