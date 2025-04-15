Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CE32D8DA0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 23:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744758191; cv=none; b=srQ6j8eIAZywEdMbILqi+Ss5ZAER8V+/NHJUF8n3tSOUd4qenM5u2TvMae8OjFXvFr++ko3ZTstb/fuf3Ia+JvazYgtxIv6jZrdjh9510/FPkYrASwaj2S1j8+dMga2fFylK4BaozVPVUcn7KC7e6x49tH96lNtnwUg/CzVMNac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744758191; c=relaxed/simple;
	bh=F5YcBZyIVCi665xnkBe2Uc/inuU/b6VJ4p5aoH7ixQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DsKDcAa2wVM4jq2pmmb0ye0ddHCf4U6cCanOwvSFob8ip8qvsCDWkZXn2KvE4BmeEZ1vaRMr/WNq5kh+cDrMCC7aaisG9NHyjaoY8Ry8iPymiU17uktyYA6Ipa4n9Iv/+ZjHdrvoXWsdpy+LsnDDw1Itaf029BDJHlYmX1eJag4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=XXT0xl+D; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="XXT0xl+D"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso59457895e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 16:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744758187; x=1745362987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/qDwZEzKD3yGMGg8Li/ADCxpZW4mGQ7aCfoPmv5avU=;
        b=XXT0xl+DERyDRau4TMfxbCEJQ1PXOVgFSEIwU6EJRFQtE/rsQ/dutGwLd5dur8aGck
         FB5lWRJdC9c+rMhdZ76h/IJ6BUBfz3pXlGx47HaArb0y+V1024tWxndDom3stZYe9hqg
         LDF/UGdXYfKsw1OhHvAVOKhWJleIjyyRcFrDme8Tp7vHjOXOEg/PWHqIEKr9pi2LM6ay
         2jWfXKDLa6vEZDWPAoI1vYNPDYmyhHAfqmIE/l7H2G5WjPywnmX/EgNrhi2Vj+JcRSHq
         kse60yFR4QvGu6IErPNnT4RsqZUB3L2F2ZOQhOfUey563bvVSBaelCz2StAQgJvRzOgw
         ACyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744758187; x=1745362987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/qDwZEzKD3yGMGg8Li/ADCxpZW4mGQ7aCfoPmv5avU=;
        b=rcdZ2HphKDBfCVdpKBEiWa1IHZX5g/GFJBkh+F7YYk3L65y8qe154qe8QLhhWNBt8W
         GUz/XGQYQ3H+Ms0dZc3e+jtMw+blelmFPkNtGUp8YY9gPavPFpcTkzA3Ky9b6d49qyKC
         RUyxn/t1OWC43LDTXWenABccZZla0sDWhghV+56YVBTWGWuzrO30f/ZoBkGyPjXibxCL
         eiBRaGafrBfYYyhq2clWEoDVuCnJkVy9nS9frlCZuj0RjJ/04WUGomOys2zVf09y7Tie
         fzjBX7Gf00s/q0W4SdmH/8NCjH4g9ylFw4x7s0hVeAAw7nVagN5JSJKEF/v1dHb7pdhI
         5raw==
X-Forwarded-Encrypted: i=1; AJvYcCXn+ScraWl8IMasqimup7rzaGdWeOJjAR2vK+TePxzGiHC50eHEwkXVrfyI3YVxMW2V9KiBuMFr+Hu94rY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuJaGsGTG3Jb5lPmOVqaYnZLBFI8Nzh1aca+snVs9p1ityhk+0
	g3rooVVAkwr5jOuy4ZQuiAqCheUFBbloPyuww4psaShKsvQDjnx5smcTWEs50xufPJUrsulj+Hk
	cqXj0Ncp3N2dVgLOeqfmT7vwy2RdQbFBOdJQNjA==
X-Gm-Gg: ASbGnctqn3k9ZYvYnZwMfNwa/xWmetb/GC/uL48QrH059NE0rpJTGqAnxx+j19WWi4G
	75WZdxok/t0mf/MqNXFxUhhvsaKl9gW5RRiy35j2mHMV4d/o7WRZ6zwOHfMLhFUcOKoEnGK26pD
	gDwR52ilszCiykiRLJkLEZS9k=
X-Google-Smtp-Source: AGHT+IGgTI0wLb4VWFIwFuesPYi0ujonBvBDjospI/0Zw+dekcu6dX8nRTileKCKtfQjeN8bQFkbj2voYAnHIZ/dDds=
X-Received: by 2002:a05:600c:a378:b0:43c:fc0c:7f33 with SMTP id
 5b1f17b1804b1-4405a000eb5mr6479155e9.2.1744758187186; Tue, 15 Apr 2025
 16:03:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-tp4129-v1-0-95a747b4c33b@kernel.org> <20250324-tp4129-v1-3-95a747b4c33b@kernel.org>
 <20250410085137.GE1868505-mkhalfella@purestorage.com> <738a41ca-3e4a-48df-9424-2950e6efc082@grimberg.me>
 <4cd2cbb4-95ff-4f3b-b33b-9c066147d12b@flourine.local> <4c334216-74d7-4a30-add1-67b6e023d8d2@grimberg.me>
In-Reply-To: <4c334216-74d7-4a30-add1-67b6e023d8d2@grimberg.me>
From: Randy Jennings <randyj@purestorage.com>
Date: Tue, 15 Apr 2025 16:02:54 -0700
X-Gm-Features: ATxdqUGMQRaR1PEqG2V00cjTZyyCExDD4ZQRBFB78xZj2EdjEnB5NJFcPmkTAVY
Message-ID: <CAPpK+O0tmewK7pH458TOxjtimjO9on=4YDRFbS=FPTgM+KFTzQ@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Daniel Wagner <dwagner@suse.de>, Mohamed Khalfella <mkhalfella@purestorage.com>, 
	Daniel Wagner <wagi@kernel.org>, Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, 
	Hannes Reinecke <hare@suse.de>, John Meneghini <jmeneghi@redhat.com>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 2:07=E2=80=AFPM Sagi Grimberg <sagi@grimberg.me> wr=
ote:
> On 15/04/2025 15:11, Daniel Wagner wrote:
> > On Tue, Apr 15, 2025 at 01:28:15AM +0300, Sagi Grimberg wrote:
> >>>> +void nvme_schedule_failover(struct nvme_ctrl *ctrl)
> >>>> +{
> >>>> +  unsigned long delay;
> >>>> +
> >>>> +  if (ctrl->cqt)
> >>>> +          delay =3D msecs_to_jiffies(ctrl->cqt);
> >>>> +  else
> >>>> +          delay =3D ctrl->kato * HZ;
> >>> I thought that delay =3D m * ctrl->kato + ctrl->cqt
> >>> where m =3D ctrl->ctratt & NVME_CTRL_ATTR_TBKAS ? 3 : 2
> >>> no?
> >> This was said before, but if we are going to always start waiting for =
kato
> >> for failover purposes,
> >> we first need a patch that prevent kato from being arbitrarily long.
> > That should be addressed with the cross controller reset (CCR).
>
> CCR is a better solution as it is explicit, and faster.
>
> >   The KATO*n
> > + CQT is the upper limit for the target recovery. As soon we have CCR,
> > the recovery delay is reduced to the time the CCR exchange takes.
>
> What I meant was that the user can no longer set kato to be arbitrarily
> long when we
> now introduce failover dependency on it.
>
> We need to set a sane maximum value that will failover in a reasonable
> timeframe.
> In other words, kato cannot be allowed to be set by the user to 60
> minutes. While we didn't
> care about it before, now it means that failover may take 60+ minutes.
>
> Hence, my request to set kato to a max absolute value of seconds. My
> vote was 10 (2x of the default),
> but we can also go with 30.
Adding a maximum value for KATO makes a lot of sense to me.  This will
help keep us away from a hung task timeout when the full delay is
taken into account.  30 makes sense to me from the perspective that
the maximum should be long enough to handle non-ideal situations
functionally, but not a value that you expect people to use regularly.

I think CQT should have a maximum allowed value for similar reasons.
If we do clamp down on the CQT, we could be opening ourselves to the
target not completely cleaning up, but it keeps us from a hung task
timeout, and _any_ delay will help most of the time.

CCR will not address arbitrarily long times for either because:
1. It is optional.
2. It may fail.
3. We still need a ceiling on the recovery time we can handle.

Sincerely,
Randy Jennings
