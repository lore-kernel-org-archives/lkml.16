Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FC01EEA48;
	Tue, 11 Feb 2025 08:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739262991; cv=none; b=eRTcl2mzDtF/GHbC3ynJdVOkD3B+Zh3yOmYB5Ef+2y3ZjPz+ITQx0e1lkNH5NEJkLoVnuquEMj3ie0GQXrBKSEe7gyR2IfXCXeHIA9z+Sm6wPb2n1McyRTMFqV9OQPU4buhbIgN378e82rUzKsJARavTxXgZ/Uo64tBoF9J7mOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739262991; c=relaxed/simple;
	bh=TVOkWw3a4Ir5sI3fQeTChgbjdNts6LHgCRgp+mbOe+8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=WoG7whe/IQ5uqYfBLx27Y/HI+3RYukFsCgE9elDho2C1y6syMO1oD3mVGFigSECaNkrsYlo6ULNyVU4wzjHM26uXgI5s5/FYVu9bpoeMW3gCenBT+Or4UJRyJfI816/AESeYqmtHgBXaC32EnBteMycO76TXxAUAqAaTJX/qLdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVtVRIwg; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVtVRIwg"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e46ebe19368so4158484276.0;
        Tue, 11 Feb 2025 00:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739262989; x=1739867789; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXcYLUGOKRVMN9MMw0xqmJHluHg5S715YAYzCXnZiko=;
        b=eVtVRIwgNudwVEaiYK9myNutrEcVZcRcWkj80OHNAmyqlagiDLDdBygtVXJPMOHOYs
         dsL4bJYqKitxhDbYvBwYonyIiD7yReXX47coUWQVEfx2DiIikU9OxbvnM+lyJ0XVHXQf
         7krR7J38ZUdN4SDQlVT+m7xxdJjgjnJWcATWMc3geY3SDqOkWsU26DktsV8sAK6csJ1R
         04TqmePBt1PgqOrcY6wMC9XVj6eSTD9PStORWOhLJ1Z6sfybRGOW727O8sdz5nntcXCb
         RLSKDARUwNZ8udwTAgP1hzslMFS1PdvVossdMy5AQkqYChop10NQpYtSvs7gVeU3l4ii
         JeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739262989; x=1739867789;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LXcYLUGOKRVMN9MMw0xqmJHluHg5S715YAYzCXnZiko=;
        b=Mbi/DxrLbH7SQqKBoJCA1ZtLfZbGZa6AZ/soi83JkexkCaPF6rOvYkH/atA7VMGyTT
         RtSPe+tRVN9CAG6vk75HmHYze7zrDr09TfqEt8vlVaD3JCz7NOX3AHEfct7BY32AOei/
         SYMwRYSq6b21aOMf7Vyr09B7nid0Z7p9M2UD/aaRuMrldhqsfqsDfKoyd/VsUBqya+hv
         EsT8m1B7A0WEt6Dmgj37/jflkj8Y5I4wOGpc/MySbcRByAjZ9+xoK8bdGtIxMUJDmXlb
         K9+M8AHy3zzA5+9iaveSNOaEZ9Ymn5D/idMn1jBRBO7IZzmB3XjeUtfH8pJkUJfJJwFQ
         jdLQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+1dnlttlRaLxyw/H4rAeoBRssPjPoqjCM3eeilyf/Mv+gZj2nuqtmOECy8jfnXa1m7KdCUOXd8a4=@vger.kernel.org, AJvYcCXk3cOXZQODSx0k3aBGveR+0W5tt31a8p5ykkOwEzhKJgScRsZTwj/vpvF3k5Dq1p0u9K8xxLe/evRhhb0mM6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX20xnFFP66a3yyCTMjcItc/AsCUTG8C9zki90DYV/9MYZaSnf
	1eEJTTQzx6qyWf7A6/9scpcm24IHcUHFS+5KwUKVkXjZ9sdpbhRq
X-Gm-Gg: ASbGncsZFwkUt3ADXmlTcfHciybd8Hy+E60O8kYQgzt864V4BNNZ5x0q15abwZWHPFx
	optZog1af24hBerqLXwrtdlX4izVgb2SkbhKtwWu48+VS1HGVU0wGMhLJ6/RUIuZ7ft5tq9L4jZ
	l6bYc8ty55+TM3pgsx5TFhY7AsOnEcNnXhth56NbLSGgTmeqon9PTnoC+aQMK0Jk5XEorT6kvmG
	Zw0obszAwGinrBicDLN0o8OTzxyGAZeU9b70gWgzVDJ+Pbh6RqJw1hxzo+OqBzowgiLnMkf+6T8
	Eu+6d5Q=
X-Google-Smtp-Source: AGHT+IGthT1Tu0jzM0y1IzUJSCldOW+tdECxcTXX564XGEwaYwXmM65noo1ZgKb6OhFlObAPEtXZwA==
X-Received: by 2002:a05:690c:4986:b0:6ef:641a:2a7b with SMTP id 00721157ae682-6f9b280ccc0mr166593387b3.2.1739262988743;
        Tue, 11 Feb 2025 00:36:28 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99ff6a903sm20217467b3.84.2025.02.11.00.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 00:36:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Feb 2025 03:36:23 -0500
Message-Id: <D7PH9S5RQ3L8.2ZAE5MLH5PN5Y@gmail.com>
Subject: Re: [PATCH v4 1/9] driver core: add a faux bus for use when a
 simple device/bus is needed
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: <linux-kernel@vger.kernel.org>, "Lyude Paul" <lyude@redhat.com>, "Rafael
 J. Wysocki" <rafael@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexander Lobakin" <aleksander.lobakin@intel.com>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Bjorn Helgaas" <bhelgaas@google.com>,
 "Jonathan Cameron" <Jonathan.Cameron@huawei.com>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Lukas Wunner" <lukas@wunner.de>, "Mark Brown"
 <broonie@kernel.org>, =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>,
 "Robin Murphy" <robin.murphy@arm.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Zijun Hu" <quic_zijuhu@quicinc.com>,
 <linux-usb@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <2025021023-sandstorm-precise-9f5d@gregkh>
 <2025021026-atlantic-gibberish-3f0c@gregkh>
 <D7OYKAYV14AZ.2D8Q4XP557FSR@gmail.com>
 <2025021111-landowner-gleaming-5971@gregkh>
 <2025021113-hundredth-pandemic-4529@gregkh>
 <D7PG55S1KG10.27S2ZIBE1TCUC@gmail.com>
 <2025021121-chaps-jawline-caf5@gregkh>
In-Reply-To: <2025021121-chaps-jawline-caf5@gregkh>

On Tue Feb 11, 2025 at 3:17 AM -05, Greg Kroah-Hartman wrote:
> On Tue, Feb 11, 2025 at 02:43:20AM -0500, Kurt Borja wrote:
>> On Tue Feb 11, 2025 at 2:33 AM -05, Greg Kroah-Hartman wrote:
>> > On Tue, Feb 11, 2025 at 08:27:26AM +0100, Greg Kroah-Hartman wrote:
>> >> On Mon, Feb 10, 2025 at 12:56:46PM -0500, Kurt Borja wrote:
>> >> I'll work on adding "if probe failed, don't let the device be created=
"
>> >> logic as it's a simple change, BUT it is a functionally different cha=
nge
>> >> from what the current api that this code is replacing is doing (i.e. =
the
>> >> current platform device creation code does this today and no one has
>> >> ever hit this in their use of it in the past few decades.)
>> >
>> > How about something as simple as this change, does that provide what y=
ou
>> > are thinking about here?  Only compile tested, not runtime tested at
>> > all:
>>=20
>> Yes, LGTM. However dev->driver is set to NULL if the probe fails so
>> wouldn't
>>=20
>> 	if (!dev->driver)
>>=20
>> do the job?
>
> True, that would work, and be much simpler, I'll go add that AND
> actually test it :)

Nice :)

>
>> I understand your point about groups. This of course solves it, although
>> isn't there a small windows between device_add() and device_destroy() in
>> the failed probe path, in which a show/store/visibility method could
>> dereference a NULL drvdata?
>
> Ok, I looked it up and it turns out that the groups wouldn't have even
> been created if probe() failed (see the call to call_driver_probe() in
> really_probe() in drivers/base/dd.c)  So all should be good here.

Are you refering to this line [1]? Because those are the driver's
dev_groups.

dev->groups are added by device_add_attrs() in device_add(). Here is the
line [2]. This happens *way* before the device is added to the bus.

Also I tested with a sample faux device (faux faux device :)) and the
groups do get added, even if the probe fails.

[1] https://elixir.bootlin.com/linux/v6.14-rc1/source/drivers/base/core.c#L=
2887
[2] https://elixir.bootlin.com/linux/v6.14-rc1/source/drivers/base/core.c#L=
2887

--=20
 ~ Kurt

>
> thanks,
>
> greg k-h

