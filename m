Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E53D72624
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691149; cv=none; b=ggybbGI2QTpaQyhwNkufKKqLQOHrEVvoyLEOdPkawj8sHh1smoMGKw4gNdiYaVabNET/BXRqSzgTFtV2dStD09VaaqVb7kWJeMWsgGzz4DoLekis7zBf1wW58l2Mp08mBFnV8WKw4FMGpceEqq8n3lf6twMc/zOMPadLcGX8KrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691149; c=relaxed/simple;
	bh=BGLolw1OHDgzRQRSVHu6bP4bOR6UGr5oa1nQhRO9Iaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CC4/na7ZbeC7QhfOyiwO+/3opUV1W55cMLoAmW4ITyoWpW/R1NvkY9PtVpaehlPhsIODfgGpjkA3BdokzqjikkgNZial04VByO6UwK5/2rRB8KTRPjdC7Q+3We+I2FEVOGl0CMzvw7m44XeZONy1LXc3UwUPuOTB4ILKcvezESs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OTrAWlXE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OTrAWlXE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B6ADC4CEF1
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750691148;
	bh=BGLolw1OHDgzRQRSVHu6bP4bOR6UGr5oa1nQhRO9Iaw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OTrAWlXEqER8s3fC4Du+FufM0rb+0d3QzuwEPOc4CJXzSfmjasZZ0ZsHWFO0/AwQ7
	 FrD9jn3Os70jLcwO5aKeSHj/NptmgTU3xti52bRB3i87HIz40JN5NOPfaabNtcvPGO
	 dnQiuT04RZGtmk6+j++4ofRjOHbxdM5nS/36PTBReW3K3eY81Hr9cak63vuV9rKvi6
	 x8yEWO9STV4Iq3thvAPbMVb1Kn0jesEjSjJWORdp5ZTYX9/kFB0VA61JPaqrNtC/TO
	 /CGHkgJajmn94S+iZC1XjDXeF643pJX2DecLrk0BTQpIrCyF0c4jTsZ3igwgnn3ZdY
	 NFq0RntRhHmWg==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-adfb562266cso778032966b.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:05:48 -0700 (PDT)
X-Gm-Message-State: AOJu0YwJud2iT3yDLLYdudcIBfJZGmng2QlwQ0COmex/YUCmOG8u9e+A
	U9Xjz3cl9o8zIHQ5wdd+6sqkGac6kzWY+UQnljuG4kvGsqnFSDCHTPHjKHAVEXpUCJ0peXl94kw
	vo4dsIoDfXw2X5NbIHEQdv4GONT3JUg==
X-Google-Smtp-Source: AGHT+IG9p6Zu6Fd7+Bcgke2KZ+yJ3wzAadO6WtoYXMwwtd3LyCC7cV0CYf90lekWfovyEwjPUV+MirJCAoH2Y7zt/0k=
X-Received: by 2002:a17:906:9c82:b0:ad8:93c0:27a5 with SMTP id
 a640c23a62f3a-ae05792716emr1179556166b.5.1750691147064; Mon, 23 Jun 2025
 08:05:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613130356.8080-1-james.morse@arm.com>
In-Reply-To: <20250613130356.8080-1-james.morse@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 23 Jun 2025 10:05:35 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKD7yOxSnfnah2gE0EodtQ4KyJ2_qXmMu2oK9i6numzwA@mail.gmail.com>
X-Gm-Features: Ac12FXwzawAJxW0H6SL7NFHDsYDzMvsMRRXGyNtOlEIdLWJc6ed_7vQOPGHyLBs
Message-ID: <CAL_JsqKD7yOxSnfnah2gE0EodtQ4KyJ2_qXmMu2oK9i6numzwA@mail.gmail.com>
Subject: Re: [PATCH 0/5] cacheinfo: Set cache 'id' based on DT data
To: James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, sudeep.holla@arm.com, 
	Ben Horgan <ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 8:04=E2=80=AFAM James Morse <james.morse@arm.com> w=
rote:
>
> This series adds support for cache-ids to device-tree systems.
> These values are exposed to user-space via
> /sys/devices/system/cpu/cpuX/cache/indexY/id
> and are used to identify caches and their associated CPUs by kernel inter=
faces
> such as resctrl.
>
> Resctrl anticipates cache-ids are unique for a given cache level, but may
> be sparse. See Documentation/filesystems/resctrl.rst's "Cache IDs" sectio=
n.
>
> Another user is PCIe's cache-steering hints, where an id provided by the
> hardware would be needed. Today this expects a platform specific ACPI hoo=
k
> the program that value into the PCIe root port registers. If DT platforms
> are ever supported, it will likely need a kernel driver to convert the
> user-space cache-id to whatever hardware value is needed.
>
> Rob H previously preferred to generate a cache-id from the information DT
> already has. (Rob: does the PCIe cache-steering use-case change this?)

I don't think so because who knows what values the PCI root port
needs. It's never going to be the cache id directly since that is per
level. So we'd need some sort of mapping. That's going to be something
like this:

Userspace level+id -> DT cache node -> PCI RP value

So the first translation is the same as you have here. The 2nd
translation might be something we put in DT or could be in PCI host
bridge driver.

Rob
