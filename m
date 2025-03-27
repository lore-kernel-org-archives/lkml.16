Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE2821422C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743085375; cv=none; b=owG5r2BoTiZ1NFPF0souM2cEpJVzZvdPtj0FeHjM+vJB7kZRteMl2nydeuvh4RcgQGYTOfWORXftrp+lbyF3qz9PxK6gmycLVBk9PUyxoiPPctvroSJQYloJguA2TnOfxtZVNC9pQaxTqTwvWeYRJ/qy7MQW+NsFymU950MNI9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743085375; c=relaxed/simple;
	bh=fjzgEC9sE1O7WE9Cc67Qkqp6QucKVRp1A2FAVFdolFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N1K6bCgQ6GFevw+2Fq/rJw+vb4qjlssZR4BYv4WpHIdyHoQHdt0zaE0yebOtZJOYVdfC6cE2vLaL1yEtDKh53HIhvTP/Xrw/4+klokOpt3/tmEjeHzuO+xKX/VjtqkLOMoxvROGqlq9VfjYcDAU6qobV7WpulVI660dK6uZgU1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JuUOGvgg; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JuUOGvgg"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6eeb7589db4so4638856d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 07:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743085373; x=1743690173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hX4sahM5YSPdcjm7sUg4I+6OXP63Z2ITLCKrFRCwRg8=;
        b=JuUOGvggDnP9HM/z4ru5E9w1ZwnsykeyHhKlw7O76mMebhm+QzrkNwvbyLL+ZF72N1
         /g8nlFK3pgeZKerKtZFKSMFPltdJFe3F34szAbZl7Djdqp9n0RCj03G1IpsiSxhUHUcL
         K0vo9ZxQgZ7h1kDhpYSLKqJfQwbxfuSjuffeiTioYEihl7NUxnV8qldOIyi/JDrgO5G+
         +8e8hT+G1IFvT8ktHUBNWffHJPQyLF1Z9PVrq7tx29/ivnmoC4o0pZPEdgfTtsk524D2
         jxEcVbwtVHMXBGpnWpzix66vZoD+22hZrtW03T5B1G337S9V5j4eL7Qk8TZ7K8EhxClF
         +k4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743085373; x=1743690173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hX4sahM5YSPdcjm7sUg4I+6OXP63Z2ITLCKrFRCwRg8=;
        b=VkxfNgU45ZMhEZVu0Gr4B7ABgCzUpd6pprm2hI3XAFh1nQ0Uh2CdXrPPwS0kbiMCO2
         XTauLZa9YMn433SqsRa/LiAMz8Pp3Ij0QdokWCWzGMBSVlf+1ZY4ic5+NWjn0flXUmKX
         KA3j+uwFE0GlVUoSYcBuFoq5sGUaAuf0zGe1CfZxBUygFINw9PDubm/PKWkAYiP+2UX6
         IxjUpA4QbNiu/KNs3nEjdU0occUnQZJSPh6PrZXcBIs+Dp2bXPcZunorsBxucGv+nJY9
         E9dCdZGW8LDux/RgwZP28x7XxBZZyRyPcC0mGgMA3/62ceH8zv+1rTR/tcQmMEpbsa2g
         G/WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKowoOZt/IXT7M7D0LZxzlyoCcyrhtEDHm9LamVolMooG12ULubTYZdduCNiqCyA3U8sbT7FLWiFgHP0I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Fb19jFkvqSG2CNUMZ9S9L1cxvHWZpx/08F2rvHCvsT4y/qqm
	mjzFbXezfHf2oty7qrZhFcI+ZjfuZYC8qM2ueag0shu0i/CcTaDlKuDw+kFRzFnxQH/TypITdgu
	V83KyzhZt61a54yDbvA2oOMDi33g=
X-Gm-Gg: ASbGncs9YX1zyF/k/qfaX+xsvnq2cfl8RAqn4Tyw7cSk6nKdpI2nk6Jbf/nVI8wVHc5
	SAVLIiCZPML530Hmbj2Emloakbr8nYpakpSDjOHctjgNt/DLl1M2d6BjW93EL0/UwsilwZlfPDV
	nIk7muE8QGzhHj5JYEaGQ0xmGh
X-Google-Smtp-Source: AGHT+IFmVUdRMPT0jOoO+WnV3SCwL4L2KHCpdirUKfb/Y+CP0Y7a7L4QWgyfiMBN9yXO+A9DvjPj409roZoHIlgYGYI=
X-Received: by 2002:a05:6214:410f:b0:6e8:9e9c:d20f with SMTP id
 6a1803df08f44-6ed23897d79mr63094496d6.21.1743085372831; Thu, 27 Mar 2025
 07:22:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_2C3830CD73C3B917ECA59895C90CB43BF009@qq.com>
 <CAKEwX=N98tC5Tq+XYLgAP4MDUBAO01ceE4e+mrk9i3YniL2Vkw@mail.gmail.com>
 <CAKEwX=NbpaQcq_awoPKmAuPWL=D4C2W7o_9D3J_SuDFvtbo9Ag@mail.gmail.com> <Z-Rmo_xx_btMKO99@casper.infradead.org>
In-Reply-To: <Z-Rmo_xx_btMKO99@casper.infradead.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 27 Mar 2025 10:22:41 -0400
X-Gm-Features: AQ5f1Jpcqo2aPvJKeqa0SWvW6GV0i6-uOAUDw9ucZg5DBq1PSgU1PPwluoGO3Qw
Message-ID: <CAKEwX=NqqsO6ajKffUFE1Y4B-YUhABudPbgAKy=16nN_k_-+fQ@mail.gmail.com>
Subject: Re: Linux6.14-rc5 BUG: spinlock bad magic in z3fold_zpool_free
To: Matthew Wilcox <willy@infradead.org>
Cc: ffhgfv <xnxc22xnxc22@qq.com>, "vitaly.wool" <vitaly.wool@konsulko.com>, 
	linmiaohe <linmiaohe@huawei.com>, akpm <akpm@linux-foundation.org>, 
	linux-mm <linux-mm@kvack.org>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 4:42=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Wed, Mar 26, 2025 at 03:43:28PM -0400, Nhat Pham wrote:
> > On Wed, Mar 26, 2025 at 10:32=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> =
wrote:
> > > On Wed, Mar 26, 2025 at 10:11=E2=80=AFAM ffhgfv <xnxc22xnxc22@qq.com>=
 wrote:
> > > >
> > > > Hello, I found a bug titled " BUG: spinlock bad magic in z3fold_zpo=
ol_free   " with modified syzkaller in the Linux6.14-rc5.
> > > > If you fix this issue, please add the following tag to the commit: =
 Reported-by: Jianzhou Zhao <xnxc22xnxc22@qq.com>,    xingwei lee <xrivende=
ll7@gmail.com>, Zhizhuo Tang <strforexctzzchange@foxmail.com>
> > >
> > > Please stop using z3fold :) We already removed it upstream.
> >
> > To clarify a little bit - we've found that z3fold is buggy (for a very
> > long time), and does not outperform zsmalloc in many of the workloads
> > we test on (both microbenchmark and real production workloads). We've
> > deprecated it since 6.12:
> >
> > https://github.com/torvalds/linux/commit/7a2369b74abf76cd3e54c45b30f6ad=
db497f831b
> >
> > and will remove it altogether:
> >
> > https://lore.kernel.org/all/20250129180633.3501650-1-yosry.ahmed@linux.=
dev/
> >
> > Perhaps Vitaly can fix the issue for stability's sake (or in case
> > there is a reason why you MUST use z3fold)? But I strongly recommend
> > you experiment with zsmalloc :)
>
> This group are syzkaller kiddies.  They have no understanding of what
> they're testing; they're just running their fuzzer and sending emails.
> They don't care what's useful, so there's a lot of noise from unmaintaine=
d
> filesystems and so on.

You're right - I just realized they did it once already for zswap:

https://lore.kernel.org/all/tencent_49DA3E780998A9B96ADC9FF658CC84641808@qq=
.com/

It was also due to the (soon-to-be-removed) z3fold backend. To save
time, I'll stop engaging from now on, unless it's a proper issue.
