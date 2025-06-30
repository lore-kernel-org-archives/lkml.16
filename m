Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D172E6D1D
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 19:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312608; cv=none; b=Z/iEhH6wy0xhu4nNPS0DFbWopDDChDCDDC0IqlGIeY7fVTnOdlpLsVslGoOdPWALP84cgK4V3Ci7Js9OKJiEkxe2jnirYEiV/c3eBvbekmCOosmtiTp/aHcrbq81exUltElD6/z1lZq1YGS2002L3M42PirQLe6LoXFgiGWrgAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312608; c=relaxed/simple;
	bh=ZSkubfhqVXLd7YH+k9rQ3uDHyM9ioOoYHsHETArWmSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s6a1y2QS8lZ6RVemflJljcl3AoLzHh1VtuUqVOMCMsR9rLULMfamKKulwnzu8POtJTEnOo52+MDfzDH1/TkinPo+A4BLt9W085ewnBysJ68899m5QQ0HAgBkTui/oqMdXVdaCE2802+E9V+vlPdUkJyWPD3dbcYDo44qzrRhpDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fL4n7rb1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fL4n7rb1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F170C4CEEF
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 19:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751312607;
	bh=ZSkubfhqVXLd7YH+k9rQ3uDHyM9ioOoYHsHETArWmSk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fL4n7rb16aEtoVokpBJRrVUOKTTZVhtTlR7guYgXhpca7bVPSjGL+7lKFKPGZzWJ1
	 CXXYIi9Tn2V5fOF1JS+Mfu+mA411JumoDbgtHAgbsnjZRMnZRBlB/mdg5WgCK/z/a8
	 e7lUsIkj0JPgL+n8K9W9AFSTZ7x1BHpf1gNctrZRycJS6W6rZ0+U7pcq0fdzLCH3RR
	 VBdajIb1KVziXTZzFpK1uD0ub/hp2jJywmUBf3UoKSoqtvbo7qztti9zU/WH5aY63/
	 UCUjbRXO8Din21t+4S53orbU4zYXHVqvHO5EE4b8Mr+nijBOYz6srIRUKHStcj5Or+
	 h+1Bpc4w73aUA==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad572ba1347so382751866b.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:43:27 -0700 (PDT)
X-Gm-Message-State: AOJu0YztgQ57/IPCTF/9RJH7RzZtW3NypYj2ineJqckb9K812HdKcTB9
	LqSNS4mIgSZ18q9GltVZx4QlyPhB1o7htbMUeQUZuXAl+r55DrUanG6rv2oxgkoJbrTfvjbN54v
	9egubGdqUBTrNzxQqDV8ggUWA7+2+mw==
X-Google-Smtp-Source: AGHT+IFKZ/kbBUfwZnqm7gEA5iSt95YpqCW1f5i6bgaXWikT6oqEphe4Aq6o75Dpbzy9bVcKNeNOa9VWgkYugZj0oW0=
X-Received: by 2002:a17:907:3f99:b0:adb:1eee:a083 with SMTP id
 a640c23a62f3a-ae350101214mr1208078666b.47.1751312605837; Mon, 30 Jun 2025
 12:43:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613130356.8080-1-james.morse@arm.com> <20250613130356.8080-3-james.morse@arm.com>
 <CAL_Jsq+rsBq1Dsw4+hfkMhopN9Pdwyp9JJbqeT6yB+d++s4v7g@mail.gmail.com> <ee08ba7e-2669-447f-ae04-5a6b00a16e77@arm.com>
In-Reply-To: <ee08ba7e-2669-447f-ae04-5a6b00a16e77@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 30 Jun 2025 14:43:14 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+mXkQTM-zbozPGkCQ40CusOUudWgtaxx_ufqL+0t96mQ@mail.gmail.com>
X-Gm-Features: Ac12FXztdZ7tU869i3uqHvpyvYlVYuzqfpcGXRVIaR9xnjjoItGphSvr73c5ZSM
Message-ID: <CAL_Jsq+mXkQTM-zbozPGkCQ40CusOUudWgtaxx_ufqL+0t96mQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] cacheinfo: Add arch hook to compress CPU h/w id into
 32 bits for cache-id
To: James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, sudeep.holla@arm.com, 
	Ben Horgan <ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 11:38=E2=80=AFAM James Morse <james.morse@arm.com> =
wrote:
>
> Hi Rob,
>
> On 23/06/2025 15:48, Rob Herring wrote:
> > On Fri, Jun 13, 2025 at 8:04=E2=80=AFAM James Morse <james.morse@arm.co=
m> wrote:
> >> Filesystems like resctrl use the cache-id exposed via sysfs to identif=
y
> >> groups of CPUs. The value is also used for PCIe cache steering tags. O=
n
> >> DT platforms cache-id is not something that is described in the
> >> device-tree, but instead generated from the smallest CPU h/w id of the
> >> CPUs associated with that cache.
> >>
> >> CPU h/w ids may be larger than 32 bits.
> >>
> >> Add a hook to allow architectures to compress the value from the devic=
etree
> >> into 32 bits. Returning the same value is always safe as cache_of_set_=
id()
> >> will stop if a value larger than 32 bits is seen.
> >>
> >> For example, on arm64 the value is the MPIDR affinity register, which =
only
> >> has 32 bits of affinity data, but spread across the 64 bit field. An
> >> arch-specific bit swizzle gives a 32 bit value.
>
> > What's missing here is why do we need the cache id to be only 32-bits?
> > I suppose it is because the sysfs 'id' file has been implicitly that?
>
> Yup, and its too late to change.
>
>
> > Why can't we just allow 64-bit values there? Obviously, you can't have
> > a 64-bit value on x86 because that might break existing userspace.
>
> It's the same user-space. Users of resctrl should be portable between arc=
hitectures.
> Resctrl isn't the only user, of the cache-id field.
>
>
> > But for Arm, there is no existing userspace to break.
>
> libvirt: https://github.com/libvirt/libvirt/blob/master/src/util/virresct=
rl.c#L1588

Looks to me like AMD wasn't even supported til v10.8.0 (2024-10-01)[1].

> DPDK: http://inbox.dpdk.org/dev/20241021015246.304431-2-wathsala.vithanag=
e@arm.com/

Is that even applied yet?

> > Even with 32-bits,
> > it is entirely possible that an existing userspace assumed values less
> > than 32-bits and would be broken for Arm as-is.
>
> Sure, but I've not found a project where that is broken yet.
>
>
> > It is obviously nice
> > if we can avoid modifying userspace, but I don't think that's a
> > requirement and I'd be surprised if there's not other things that need
> > to be adapted for MPAM support.
>
> The whole multi-year effort has been to make existing user-space work wit=
hout any ABI
> changes. The effect is some platforms have features that can't be used be=
cause resctrl
> expects things to be Xeon shaped.
> But if your platform looks a bit like a Xeon (cache portion controls on t=
he L3, memory
> bandwidth controls somewhere that is believably the L3), then resctrl wor=
ks as it does on
> Intel. The only thing that has come a little unstuck is the 'num_rmid' pr=
operty where MPAM
> doesn't have an equivalent, so '1' is exposed as a safe value.

Fair enough, but I'd be rather surprised if there doesn't end up being
changes to support Arm platforms.

> > Also, what if an architecture can't swizzle their value into 32-bits?
> > They would be stuck with requiring userspace to deal with 64-bit
> > values.
>
> Remap them in a more complicated way. Chances are there aren't 2^32 CPUs.

What about using the logical CPU number instead? That's stable for a
given machine and firmware. And then instead of having 3 sets of
numbers (MPIDR, compressed MPIDR, and logical CPU), we'd still only
have 2. And logical CPU is what sysfs already exposes to userspace.

Rob

[1] https://libvirt.org/news.html
