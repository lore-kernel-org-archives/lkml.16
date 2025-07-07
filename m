Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EE1293C6A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 13:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895323; cv=none; b=mCuRk0LelESOiooIb5vbOQsBIlUlWpo6h3yNELLi0g2wxmemiAKqwsN4D004LkFye39N+zH5yNpv7prL6omuVQoB3g/ysmcDkP69z+XOhcsl2p/3w0hxqmPRX2KMidGG8v6CZXv8csLVkEj5koop/RW9z8o86SxBiXU4tgDbAbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895323; c=relaxed/simple;
	bh=O8hQBASf5iMOBLgxVLic0uuXr1IXkFH1Kh4Bty5fihM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mM4jSNnCRSvVGZGd/Qc9cTVv/LN85nYN/sW1/z5SdqedGWw2kSzXpdG/V3opeGqLA9vanETU9CXMG/x+UhPJfsRrD0d26ZkHYOCCwMrtx1yUr+0GbZVvRGAaQ35XEMy/cA/PGMoB2sVndEmzOOP8yroJ/+/8gXGbl9Z9UikNjq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t++THqT9; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t++THqT9"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60867565fb5so5151936a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 06:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751895320; x=1752500120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iglN2fDJo6Jj8oOAA17PlpCWLQPcfqHRK3QqDqJauNc=;
        b=t++THqT95wpZgG/8BQyOvlDdpS61ZE5mR5RIGRcuwNE0bFbY3U5+c0F3bPrvTcDeWL
         +r/f9QOjdiw16LIXmsn9jRKfaXrLZUcsozK67OV5m2IKpFq0iTaNG6NgzIVwEIF0/Erl
         61kbwrrqb25HXLB9SleCLITSkJsKPhhZHC+UX5Y+Eg24a2MfiW5ZgmTQ8OdxQjRKzKjr
         fzyvKq2FxjNuzDuHm0jP59RjqP0fdjpyvESC6K3fb/Nv5QYkJEH+PaZ5AuLE8c6mxx8k
         HSmbnr5g9DIdWpQwcndOJQ4exk3xXvvt1i4sQ/3Ea/3+fX1SPvOH4WB8S4oIVvH34a1/
         fGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751895320; x=1752500120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iglN2fDJo6Jj8oOAA17PlpCWLQPcfqHRK3QqDqJauNc=;
        b=teXgHliUIRoU+4Mv8RN3XMPvlJLcXxrHMzoIzzLEoo5fRumAJFUm+Ft6a0QkfrpXn8
         92h5TQGDi/+i2eBqeRgTIaQA767EVp3GtSKHfDPHSQ9af0g3ybolCjg+M75ew5uea2Ob
         i87REfm0936RHIrjhQEqktRZoNT6qgl3//yg7bi3DlyVqxrnQQr8rqGSe0ovUPc1ki21
         eK1Fhnjb2rjgs4FLlJ+APEsnF4t/FgSC/MGNBcGKpqeLBZSywCyOibEucZrNhfZvLUrd
         dH3VQnWg3u+fdRbKKoJWkLrksgXGMzkYm/74xzIeRomUnL1YRA3I/hpBYTTrCavBnblW
         H3VA==
X-Forwarded-Encrypted: i=1; AJvYcCU4o0mGUWOnISAGBOK0Csn1hG223Ij9O3KeQSkp1aEozI5HjsUjvTDUSIHK3kFKVxcLRO3jyoVuN8S0Cck=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmqOW5Tmk2OroOsEVuClcUtvcmTf/vC8T5h7+3VSP/CeLtLRct
	eGM4vysjn4qYnPVjsVL/6986d4XAwwo0i5Nr6w5EYTRXO4h4+wI4Gwb1DUuJuZdjY3I3B3sN+Un
	58j+U1rxqtkTMF6PinsEkD4wUpWletvTCUSTgFCUKzMkvOV1etKbL9xo=
X-Gm-Gg: ASbGnctE8/xp/qSd7GAMHK9Ulchn5AiXYT5vZiDMV98HE8SqrnvIjf6Mnh+RSSpa+JD
	I8zaJjmLQr+0wyo5zsTYZwcBiRws5AZ5O7izWsI2hCyj7pDkfm3IJh+odtVxTQEytxk83n9Z3ne
	euIKmg8KJ3MgM5SEIGaomBseD/m75bRBdUTMv48DL7GH344YlaPNoYycNEyK6PMx7DeOP78Zv5+
	leeKQZ8Oo6Ihg==
X-Google-Smtp-Source: AGHT+IET++QyEw80P77BIRzs6JWa9kHBMfwtkMIUTg5pCT3exqjnCE5AHFUJIOdI1A973C72FUTiNPTJJ/5qE+IOutw=
X-Received: by 2002:a50:eb0c:0:b0:607:32e8:652 with SMTP id
 4fb4d7f45d1cf-60ff3c0d6e8mr6977121a12.19.1751895320263; Mon, 07 Jul 2025
 06:35:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610131231.1724627-1-jkangas@redhat.com> <aGvHUTC7Kbe9lru3@jkangas-thinkpadp1gen3.rmtuswa.csb>
In-Reply-To: <aGvHUTC7Kbe9lru3@jkangas-thinkpadp1gen3.rmtuswa.csb>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Mon, 7 Jul 2025 19:05:09 +0530
X-Gm-Features: Ac12FXyRxHcDe4-WqyYgc42A2U_9x5Uy_U3EHMTjmhyPcBLa1jvXKcYwtoIgS80
Message-ID: <CAO_48GHtUG_hTFvLVQfG06FxdO_6z5m0WofXKh=WhgCjNguxPg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] dma-buf: heaps: Use constant name for CMA heap
To: Jared Kangas <jkangas@redhat.com>
Cc: benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	tjmercier@google.com, christian.koenig@amd.com, mripard@kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Jared,

On Mon, 7 Jul 2025 at 18:40, Jared Kangas <jkangas@redhat.com> wrote:
>
> On Tue, Jun 10, 2025 at 06:12:28AM -0700, Jared Kangas wrote:
> > Hi all,
> >
> > This patch series is based on a previous discussion around CMA heap
> > naming. [1] The heap's name depends on the device name, which is
> > generally "reserved", "linux,cma", or "default-pool", but could be any
> > arbitrary name given to the default CMA area in the devicetree. For a
> > consistent userspace interface, the series introduces a constant name
> > for the CMA heap, and for backwards compatibility, an additional Kconfi=
g
> > that controls the creation of a legacy-named heap with the same CMA
> > backing.
> >
> > The ideas to handle backwards compatibility in [1] are to either use a
> > symlink or add a heap node with a duplicate minor. However, I assume
> > that we don't want to create symlinks in /dev from module initcalls, an=
d
> > attempting to duplicate minors would cause device_create() to fail.
> > Because of these drawbacks, after brainstorming with Maxime Ripard, I
> > went with creating a new node in devtmpfs with its own minor. This
> > admittedly makes it a little unclear that the old and new nodes are
> > backed by the same heap when both are present. The only approach that I
> > think would provide total clarity on this in userspace is symlinking,
> > which seemed like a fairly involved solution for devtmpfs, but if I'm
> > wrong on this, please let me know.
> >
> > Changelog:
> >
> > v4:
> >   - Fix ERR_PTR() usage for negative return value.
> >
> > v3:
> >   - Extract documentation markup fix to separate patch.
> >   - Adjust DEFAULT_CMA_NAME per discussion in [2].
> >   - Warn if the legacy heap name and the default heap name are the same=
.
> >   - Fix DMABUF_HEAPS_CMA_LEGACY prompt.
> >   - Touch up commit log wording.
> >
> > v2:
> >   - Use tabs instead of spaces for large vertical alignment.
> >
> > [1]: https://lore.kernel.org/all/f6412229-4606-41ad-8c05-7bbba2eb6e08@t=
i.com/
> > [2]: https://lore.kernel.org/all/CANDhNCroe6ZBtN_o=3Dc71kzFFaWK-fF5rCdn=
r9P5h1sgPOWSGSw@mail.gmail.com/
> >
> > Jared Kangas (3):
> >   Documentation: dma-buf: heaps: Fix code markup
> >   dma-buf: heaps: Parameterize heap name in __add_cma_heap()
> >   dma-buf: heaps: Give default CMA heap a fixed name
> >
> >  Documentation/userspace-api/dma-buf-heaps.rst | 11 +++---
> >  drivers/dma-buf/heaps/Kconfig                 | 10 ++++++
> >  drivers/dma-buf/heaps/cma_heap.c              | 36 +++++++++++++++----
> >  3 files changed, 46 insertions(+), 11 deletions(-)
> >
> > --
> > 2.49.0
> >
>
> Hi Sumit,
>
> Just wanted to check in on this since discussion has died down this
> iteration: what's the status on this series? If there's anything I can
> do to help, I'm happy to lend a hand.

I'm sorry, I had to be out for a bit due to some personal reasons;
overall it looks good to me. I'll apply it very soon.

Thank you for your patience!

>
> Thanks,
> Jared
Best,
Sumit.
>


--=20
Thanks and regards,

Sumit Semwal (he / him)
Senior Tech Lead - Android, Platforms and Virtualisation
Linaro.org =E2=94=82 Arm Solutions at Light Speed
