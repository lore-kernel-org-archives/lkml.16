Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17D04683
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738308368; cv=none; b=cXUxqUz68EtdrZLr65QzsZaHKJbYw7z9TO+oAi7F5an5VbV4iy88QnnodKiow2BKnUM/pTtOrbEzz8WdL2ifqPrfOWVdR+gW/e0N2A0QzFHAcW46znBMwkGBOmu5WjtLea9MUmkanVR6drZN4OASaxYmyCecmhYtP7QCLot9Qts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738308368; c=relaxed/simple;
	bh=Tr3ksmV2pNqejIWqja5XZ8mPSPBwaqrs3w/kzLOqLi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l398C0BBwH6tTB38iobm6VuW6n+y8+6hhVE271SRCx5TFlYQ6uZ3jwAVnOjhzDYE1/OOrpC1SV0RRH+VgfPnM0xCTA5xghw+412VEHOe4AtTPUIkaj86pN4j4KT3lQ9LetSxkPo6pPl0ftSI78O7P5dOFz7P6aJLAASzQQ0u1dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=V2LS5b0Z; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="V2LS5b0Z"
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2D6F43F516
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738308364;
	bh=Tr3ksmV2pNqejIWqja5XZ8mPSPBwaqrs3w/kzLOqLi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=V2LS5b0ZOru10wBsoh0CMSfBXa6C1E6rPgJUbHUPTZOashpsMSs/gqEPmTxZpYHcV
	 Dc+OT69juZEZ1lCVLTAyD1MkjcpyxGS+Rtwu5nxf/DnalQbI2LCccwXmNDTmIQRT8C
	 NpPP9HA/HNCBcBoen1ImNMus9WdcFWO75olGBMrt1CiPSyKzWkfbgvr2MLQqCVoxe5
	 +4PrKbcp/A3AArUKVoREI8jnnDBlPaxkganicilcAKkNUYl5jQaiBsrwuM5FWXhBXs
	 WvxF2PnA0qK+1oP00BEiMSCCWvV+2sNZdhCgnXB0AO9lczw3GTwCzjYTngcw73muN8
	 fIN//vQZrz/NA==
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5da03762497so1576438a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 23:26:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738308363; x=1738913163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tr3ksmV2pNqejIWqja5XZ8mPSPBwaqrs3w/kzLOqLi8=;
        b=DyCcKOnb5XqUCbqKlIl8F7oi4e59oERJfhoSGJR0VkJcBvBaBfxSYSFP+D8i2yYlCs
         qkoWOH8dLHlF0VO5hZTs/2NqBG+ip+UPVP13pOHwBYZ6wlack9Mo11mTgP4nresahVMK
         4SE2B9b6T7rgjzZai7860dyB0L7S6fMKEQFnK6IzDyOQf18L6VE2PmtAuzXS/MalYw1R
         baLsK59xFmBRNZwsyn8LADxiIrMzUDBfBEntukCZ9yLCWt0IeidXJq4V/brNi+jMgdwB
         TzilvmXl5lcbuLrpwnhQ34WjyQKsNcOKtuv+WIlNiMcXZmw0DXk85+fBsXiYgbf80YZ6
         78oQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2M2U5cIRUGmwxMVfTbIyBORGICDmKknzcHTGJa3mI0YV9URngTUJB+p3LTmNoq+vINEjsC2sA/UmNCQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyThE1EEIB82++lJ93lo5oZscJFmtqjliq8JZfYGuc91669U94H
	aC5LrLRYaiIVA4qhB1zMAeIONb2z81EaH2r3WDOX+rByUuAjdzJIMj3hqVfdoU3WmL6PZhAS3m/
	51r17/rTyiV5AViqVJ6tJ4hdxc5DKq8eJvniP1WO5Igfl4rPEOw0wGVXHB3strHlZih+Gr+1UtI
	iJGL6mHd135BwOSp1sfMV3qo/yXEwJYxfhpR0g5aat3sJ0swX0fLiE
X-Gm-Gg: ASbGncvhud3I8PY86PIC81ifMNlhkatQCif6gixQE5RECNTmu1arlmw6mCKy2vsPtBl
	d40m7EsV+7ENzqgPI3kd8qPScffe8k8GsG4cT4CS3tpsUKUxqC8T+nR4W/0NxIw==
X-Received: by 2002:a05:6402:5215:b0:5d0:e9a8:4c96 with SMTP id 4fb4d7f45d1cf-5dc6f5d1319mr5750213a12.9.1738308362867;
        Thu, 30 Jan 2025 23:26:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHo4YZqyV5ZOEg9+j+noeoGbHn2LUCzKjoiwvK9ssgYbSRCXOD0oMtLMDCHvPeCMnQfqRAl5WKzXsjCA7hTx6c=
X-Received: by 2002:a05:6402:5215:b0:5d0:e9a8:4c96 with SMTP id
 4fb4d7f45d1cf-5dc6f5d1319mr5750191a12.9.1738308362546; Thu, 30 Jan 2025
 23:26:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129155525.663780-1-koichiro.den@canonical.com>
 <CAMRc=Mdim2aSBs+JsL8dECfG0Vvrvcq6CHaGHbBoVhNhSZn9Kg@mail.gmail.com>
 <2kz6mz6nglozgrwudkgziles4wievwfkkl2oo7qyvosirchjuw@y3wfna5dsekv>
 <CAMRc=Mc3qBXaATpYRAXeHne0+mBjErivjvUe4rBEj2ksansatQ@mail.gmail.com> <CAMRc=Mc5WWNErJfEQ4sFRQm_+vDRMa7KBKSPSnP3W8scu4G19A@mail.gmail.com>
In-Reply-To: <CAMRc=Mc5WWNErJfEQ4sFRQm_+vDRMa7KBKSPSnP3W8scu4G19A@mail.gmail.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@canonical.com>
Date: Fri, 31 Jan 2025 08:25:51 +0100
X-Gm-Features: AWEUYZnqd6nFifeeXMsgHpAgXINp0XindBDZvZmEHwOqyGGNlqREVOFH2WdDmfE
Message-ID: <CAFGk_a0U=jSQD85UKC1e=pSWr8W9y_MMAFyPVFOcE-fUZry7-Q@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Introduce configfs-based interface for gpio-aggregator
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Koichiro Den <koichiro.den@canonical.com>, linux-gpio@vger.kernel.org, 
	geert+renesas@glider.be, linus.walleij@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 30 Jan 2025 at 21:48, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Thu, Jan 30, 2025 at 7:40=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > While at it: there's no reason to impose a
> > naming convention of lineX, lineY etc., the names don't matter for the
> > aggregator setup (unlike gpio-sim where they indicate the offset of
> > the line they concern).
> >
>
> Scratch that part. There's a good reason for that - the ordering of
> lines within the aggregator. I'm just not sure whether we should
> impose a strict naming where - for an aggregator of 3 lines total - we
> expect there to exist groups named line0, line1 and line2 or if we
> should be more lenient and possibly sort whatever names the user
> provides alphabetically?

If I may jump in quickly (I provided some initial feedback on the
configfs interfaces
for the first internal patches). I think it's preferable to have
strict and explicit, even
If more verbose, line ordering in the aggregator.The motivator for
this is that whoever
sets up a new device through the aggregator does not have to second guess w=
hat
the driver will do. Implicit ordering could perhaps be fine if the
consumers were to
impose some set of rules themselves, but I fear there would still be
some ambiguity
left if free form names were for e.g. [1, 02, 10]. In the end they
would probably settle
on some mechanism which would mimic what we could already do in the
driver itself
and avoid any further confusion for the user.

Cheers,
Maciej
