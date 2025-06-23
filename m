Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8B21A01B9
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690110; cv=none; b=RP4OHeXorEFAud+K/65T+4W7J9d5KmvXgH8Uch0eQ9qbKdpDKJpSIGRZlREcuvz6QXMeoEyzzxUWOdXM3fSEJ4MRQyiaSPPdTdvRXxg/EA/TImXpLwqHsPMVfG+GRDj8Wj9/1gU4Y0MpKI0fM4zfxwpb7pHnZnxhcznMsu7Z3Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690110; c=relaxed/simple;
	bh=MfuuC+7w2DxvL1+4IGdyXxSYobWxsOTw9r2v/sqdLBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TKhGyq0yqqQzyYdcy1eoWJ98jrSysuchDrJ91sV2p04vLe4kd3nPsxaebyn6gZsaWHejdKfa8RxCOFKvkLODT/n6pLPxlI5H/PyGg7qHs5K/ObvQoZgXsnTuHRCtkaWIIcOrFIDyLzo6H5AHYiqniMJ71L9bKCxGhXBo1xmk7cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FlzIhNrG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FlzIhNrG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B60E5C4CEF0
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750690109;
	bh=MfuuC+7w2DxvL1+4IGdyXxSYobWxsOTw9r2v/sqdLBo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FlzIhNrGnbcVaZRsLjfayf/H1e5q4VaqwbypmWeDnLZmbZhaklNrk4I+mXFkrsp/H
	 z4UtQLebpLgkQo6wMFXJVE/q73Qtl5XzERzGGhdl4ljZmJ3FQublkGZqk/lkSVTX0l
	 YBZs80f04bSuk4Px+IHENSQyAL+0WoqGzNJqo0w/Fcs1hd1jA686qpoCbhl4RYOa4z
	 s18gtTztshzgFdugwxbtR7kgsbbap5j+oMAH2Awd71d8Yf2kePhlHCzOLCiuKFTt4m
	 AlklHYlaA/XuWqGC+SDy+3rvTnCtQB3caMEcW4SPmURZmpeuSZ8+LtCue81UQFXP4U
	 1C0mLrSeMDAsg==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so8043998a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:48:29 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz+Y8OeI8uw21PspoEmj2l87KjPvGv+20KgbNpvAOyDvBPt1I4F
	H/tDzK/j6wjYGiI54tZkZk2sBEkrClsaUEGm6NogYhp3xVS9WZpJB/kGhZdUypQrpEn3ea/kdjg
	Di67JRExJ8zkhNR0O2S1tvVlYoMC7rA==
X-Google-Smtp-Source: AGHT+IEkJTaouEoSLqOFM+aNoCD2YfrR9XQOA+ZEyc7rZToekEocazcacZ5lvHceLe9SxcjElzIsPrZrLktHZjFbJ5w=
X-Received: by 2002:a17:907:3d0a:b0:ae0:67aa:6c95 with SMTP id
 a640c23a62f3a-ae067aa70f8mr1000125866b.53.1750690108323; Mon, 23 Jun 2025
 07:48:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613130356.8080-1-james.morse@arm.com> <20250613130356.8080-3-james.morse@arm.com>
In-Reply-To: <20250613130356.8080-3-james.morse@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 23 Jun 2025 09:48:14 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+rsBq1Dsw4+hfkMhopN9Pdwyp9JJbqeT6yB+d++s4v7g@mail.gmail.com>
X-Gm-Features: Ac12FXyKBJRIelfk3y1WfSywu5MXnF4Xh2DfdmJn8G-sIhaA3G0-KsrimYntTJA
Message-ID: <CAL_Jsq+rsBq1Dsw4+hfkMhopN9Pdwyp9JJbqeT6yB+d++s4v7g@mail.gmail.com>
Subject: Re: [PATCH 2/5] cacheinfo: Add arch hook to compress CPU h/w id into
 32 bits for cache-id
To: James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, sudeep.holla@arm.com, 
	Ben Horgan <ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 8:04=E2=80=AFAM James Morse <james.morse@arm.com> w=
rote:
>
> Filesystems like resctrl use the cache-id exposed via sysfs to identify
> groups of CPUs. The value is also used for PCIe cache steering tags. On
> DT platforms cache-id is not something that is described in the
> device-tree, but instead generated from the smallest CPU h/w id of the
> CPUs associated with that cache.
>
> CPU h/w ids may be larger than 32 bits.
>
> Add a hook to allow architectures to compress the value from the devicetr=
ee
> into 32 bits. Returning the same value is always safe as cache_of_set_id(=
)
> will stop if a value larger than 32 bits is seen.
>
> For example, on arm64 the value is the MPIDR affinity register, which onl=
y
> has 32 bits of affinity data, but spread across the 64 bit field. An
> arch-specific bit swizzle gives a 32 bit value.

What's missing here is why do we need the cache id to be only 32-bits?
I suppose it is because the sysfs 'id' file has been implicitly that?
Why can't we just allow 64-bit values there? Obviously, you can't have
a 64-bit value on x86 because that might break existing userspace. But
for Arm, there is no existing userspace to break. Even with 32-bits,
it is entirely possible that an existing userspace assumed values less
than 32-bits and would be broken for Arm as-is. It is obviously nice
if we can avoid modifying userspace, but I don't think that's a
requirement and I'd be surprised if there's not other things that need
to be adapted for MPAM support.

Also, what if an architecture can't swizzle their value into 32-bits?
They would be stuck with requiring userspace to deal with 64-bit
values.

Rob
