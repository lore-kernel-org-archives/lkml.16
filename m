Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5511421884A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745614946; cv=none; b=eq6/xm/RAKKgDL3kg8v9go4o/KPQocZt3UXmLUbk0BCfrYzC/Z0d4JtAAsNOVbbPBEvSVm7WWWlSvtCZH8F37DR3hD+C0uAQs5w+CQN6uRyUVibo8hAuLCoo3xRVYXr2QVPNDa1wB2WYoIEmXwpw916tF5Fw/eClTGAeinYHclc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745614946; c=relaxed/simple;
	bh=YjVgZ7YLACPGigcJE/0fO5Qbc8alP8X4CtE466WwsR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dgnbsNrPdfvtTPk19CF6BnZP8BfRyu/EcsQvU+iY0qLDOctFlF22AMUG32upN0aq2XZrF6/KvNLYvFrylyCqRLHpsLHzmDczsXvYtSqZWWQFkc8G1ymMAZNEvBzsF8ycUxzDlaDl5Su6/4ggSlNIulHdAAHAzMTQ6BmnMT0UiEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TvRglG5S; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TvRglG5S"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so35667226d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745614944; x=1746219744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TblJnP0G9WT88M2TZcj3zg5YJeY+7C7HhDuNxDIznE=;
        b=TvRglG5Sm1iJmBFXnRluZQk4+3U6E5voNcvALt14XMCp2WF2gMNrRxCvTsuK4MrEbm
         9FM2Tnm8gI3+8/nfzZBtMDoTAulIXttQbhIsSpkcxApHCGI4cfcqemZAk0eznNNRsYUe
         I/wqNQluGKCbafRX80eORnym/3uCoJhZuCZT0g06zRdk05eQVYiIAgDdznba/nqFzju8
         vU4QOMix17enEim/aBdYk3LxIuB9kWUM63M2IOITvTEQmjub7imIpsez7Z9NPXcWZlPm
         HzX5oXwpGnXePtzrpA35IwfvFgFbRD3Qc4GaC4PzuBotVwNmkJrJnLFdaGB5P5bO5bEq
         yn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745614944; x=1746219744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TblJnP0G9WT88M2TZcj3zg5YJeY+7C7HhDuNxDIznE=;
        b=mW5c2CeFb97l0GgHwMkthY1IQ/hAQLKHZPDb0wKA7y9q0zAeldYVT+qAhH/w8mo5dW
         C7xyuA8TYKirhlr29OiOv7+MkfPrW7qFCiaiMVtL6oIbv1f3tTI5vcdJzlYMnUjwS2rv
         noYstgnC8+aS03a4yxTN4qkQUtl4ZcJBtB0Uu0v/7cW5mf8j5TM5PQBdYG09g3GUId1H
         OLlpKSKyOs1hQY3F8doeoc6380v3urgXJKNnrYB0wdXj+RSdn2UxaiujZ4AyiS80Rii4
         9YB9sp43dp4B8Iu0zS8P3l20ZUCklUozDjK7uPsYoEyLzGrzfs2usjuINf2oVgBiWb5W
         KJ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWrHOtJABhH3nTGKR6OW0oK3duOs+YeepB0i5DC5rFZctghZk/1BBe02wiyyDOmgnFgAW5J484pXWgmB3o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3va/43+uvBim3JVeMDTAg64nW2VxWDjSvKm++oJdCsKw2dZTt
	aISNzC2pnb95Q84PS9ulsmwendp3RGVtVEB5XCk4VG3mShkaoLTNJJY6Fd1pR9pLvOJdWBpwzfq
	A1tgi5LZUinUYCXdfx9/ryoCwPoksT4NA2r4=
X-Gm-Gg: ASbGncscIj7G1AXbrXOdynKaWIuzq71uNKVpGznnhEDKNMZBijHNzJBEheSOg0EmnJ3
	XqP9vWtEz7mGxCLCSx/AntWZzvA6GvR5L4yHY9c+uGR2aLrRRs3fMbRhpN2QQs9FTzj4qdPw+o9
	N3YegTcw==
X-Google-Smtp-Source: AGHT+IHkfUlwUem4PfnopT+6TlRr3jMpAyAEE+AOQNIQWcfuRd3shIIoUe9Vc6WoUsRXgu3w115ogjdW1I4zauvHggE=
X-Received: by 2002:ad4:5c6e:0:b0:6e4:4adb:8c29 with SMTP id
 6a1803df08f44-6f4c11cfccamr135354956d6.12.1745614941905; Fri, 25 Apr 2025
 14:02:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408195922.770377-1-yabinc@google.com> <20250408195922.770377-3-yabinc@google.com>
 <358f4a8c-29ad-4e5e-91b9-063f06e769ec@linaro.org> <CAJ9a7VigiBrcenP9w84KS21iE8gnB7bGC9Q6ZFF33ZHveu9SEg@mail.gmail.com>
In-Reply-To: <CAJ9a7VigiBrcenP9w84KS21iE8gnB7bGC9Q6ZFF33ZHveu9SEg@mail.gmail.com>
From: Yabin Cui <yabinc@google.com>
Date: Fri, 25 Apr 2025 14:02:10 -0700
X-Gm-Features: ATxdqUHAWEV7N_YSxfaedx7b1DR8Tf9gK0wjsx7y8UL4mHWQiNO2xurmvYk0Xu8
Message-ID: <CALJ9ZPPdqrAJkV7CHJBLGKoqQm5hmR7s_4_qRJ=gWyTvxJtL-g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] coresight: core: Disable helpers for devices that
 fail to enable
To: Mike Leach <mike.leach@linaro.org>
Cc: James Clark <james.clark@linaro.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@arm.com>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 8:25=E2=80=AFAM Mike Leach <mike.leach@linaro.org> =
wrote:
>
> On Tue, 15 Apr 2025 at 14:51, James Clark <james.clark@linaro.org> wrote:
> >
> >
> >
> > On 08/04/2025 8:59 pm, Yabin Cui wrote:
> > > When enabling a SINK or LINK type coresight device fails, the
> > > associated helpers should be disabled.
> > >
> > > Signed-off-by: Yabin Cui <yabinc@google.com>
> > > Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > > ---
> > >   drivers/hwtracing/coresight/coresight-core.c | 9 +++++++--
> > >   1 file changed, 7 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/h=
wtracing/coresight/coresight-core.c
> > > index fb43ef6a3b1f..a56ba9087538 100644
> > > --- a/drivers/hwtracing/coresight/coresight-core.c
> > > +++ b/drivers/hwtracing/coresight/coresight-core.c
> > > @@ -486,8 +486,10 @@ int coresight_enable_path(struct coresight_path =
*path, enum cs_mode mode,
> > >                        * that need disabling. Disabling the path here
> > >                        * would mean we could disrupt an existing sess=
ion.
> > >                        */
> > > -                     if (ret)
> > > +                     if (ret) {
> > > +                             coresight_disable_helpers(csdev);
> >
> > Hi Yabin,
> >
> > Unfortunately coresight_disable_helpers() takes a path pointer now so
> > this needs to be updated.
> >
> > I tested with that change made and it works ok.
> >
> > >                               goto out;
> > > +                     }
> > >                       break;
> > >               case CORESIGHT_DEV_TYPE_SOURCE:
> > >                       /* sources are enabled from either sysFS or Per=
f */
> > > @@ -496,10 +498,13 @@ int coresight_enable_path(struct coresight_path=
 *path, enum cs_mode mode,
> > >                       parent =3D list_prev_entry(nd, link)->csdev;
> > >                       child =3D list_next_entry(nd, link)->csdev;
> > >                       ret =3D coresight_enable_link(csdev, parent, ch=
ild, source);
> > > -                     if (ret)
> > > +                     if (ret) {
> > > +                             coresight_disable_helpers(csdev);
> > >                               goto err;
> > > +                     }
> > >                       break;
> > >               default:
> > > +                     coresight_disable_helpers(csdev);
> >
> > Minor nit, you could collapse these last two into "goto
> > err_disable_helpers" and add another label before err: that disables
> > helpers before falling through to err:.
> >
> > Other than that:
> >
> > Reviewed-by: James Clark <james.clark@linaro.org>
> >
> > >                       goto err;
> > >               }
> > >       }
> >
>
> Subject to James' comments -
>
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>

Hi Mike, I have uploaded the v4 patch as suggested by James, in
"[PATCH v4 2/2] coresight: core: Disable helpers for devices that fail
to enable".
Could you help review the v4 patch? In that patch, Leo suggested consolidat=
ing
error handling. But you expressed concern about it when reviewing the v2 pa=
tch.


>
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK
