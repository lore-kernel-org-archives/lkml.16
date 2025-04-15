Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4E427A92E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704605; cv=none; b=g2c9A+lTYGqNMxMHuZSrIE+FMChgegStrL8JI7Y0IQUKtkHr1ixM/iBi18gfwF66PoyI/UifMsjxzJ6hcwoOTRmp3HkMJORuS8nzawFqu79pRzqoB0dTVbq+Jgef7a7emeGToY0+4TmkG3a1JopJSX4ccaBI1ZTaVqXCMGL6thU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704605; c=relaxed/simple;
	bh=bBthIQs6Lqo7DTLZXclDwiIZ48cL/2/rNfNSA6P3KWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RR7ANnAkVYUTrW/LVN9IH33ibhp/u9wECnVKlcbP4KbFhIpbqX+hU0ZJbyv09RExhC8zT+NyaVj6ovkPlswfEuWsdfYCTZyCTcVC1CNbRuiU2FNeIzQuuAImLFXQIk5Gj/yqbESALxKQgWOs8ovMkzXLtG8GAHrSoPS2WujgOaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=ZKr715lb; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="ZKr715lb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744704594;
	bh=iNh5evHJUywRwTG+40vvBkWAew+FHIXObMQAM9x50Ig=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=ZKr715lbhp8BZUrEBD7SZGXBN0OEBT4CF/tka0GjX1nGwvJgPMLqQT/zw4LH/Eo7N
	 HRxOjmSHSsYW5N6OfO52SioR9tdkHfSaY1Sgk5w6pN3oIY28ezuHBm2sSFaaLFKKSw
	 dh4bofsAwOl/O61b5kVwRwoCFrQoqc5IDtYdaIy4=
X-QQ-mid: izesmtp27t1744704592t803f7266
X-QQ-Originating-IP: l8XTN5UMy0vdIMnD8w6d6O/e5CF1SAwRw8T28AofESA=
Received: from mail-yb1-f180.google.com ( [209.85.219.180])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 16:09:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7463771453584462835
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e643f0933afso5020308276.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:09:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUS5prdhqv/2ljvF8/IePLc8OhL3sru5ZvDCWyyOsIXYWVeRAdE/72XpVYb6gyBu76wHjsbXQIOFH/byWk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp8DNSNrF+Y2vV1jr7zdjY8Rjuf6gqTV31BXIt9ZCnwsGJbmcw
	PqwfLsGCIRw+HiMx97l4+oSL4S+C4ZppkoEpzS3cYMow4Ffe0EQT5IrY1w+nKgWkyg4CSbB0iL/
	KimEEnO8bHRw7Qppx0YBih0RLt78=
X-Google-Smtp-Source: AGHT+IF44p1Tl1fp8b57iSl2LN3MmmbjsUksYboLirN5uKzIqEc9Wg6NTY7B4YCgu9/aQ2qBxW8fFjV63/YhrNc1n+A=
X-Received: by 2002:a05:6902:4a2:b0:e63:cfb7:5da5 with SMTP id
 3f1490d57ef6-e70a600de9amr2485436276.9.1744704589570; Tue, 15 Apr 2025
 01:09:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <31F42D8141CDD2D0+20250411105142.89296-1-chenlinxuan@uniontech.com>
 <20250411105459.90782-1-chenlinxuan@uniontech.com> <8921351F23CD8948+20250411105459.90782-4-chenlinxuan@uniontech.com>
 <87sem9svmn.fsf@intel.com>
In-Reply-To: <87sem9svmn.fsf@intel.com>
From: Chen Linxuan <chenlinxuan@uniontech.com>
Date: Tue, 15 Apr 2025 16:09:38 +0800
X-Gmail-Original-Message-ID: <E03CDF8280BA0401+CAC1kPDMuAmfoJfL4wjrBEcK+rpgbWk7kYEWJjvps=2UJ6-_WHw@mail.gmail.com>
X-Gm-Features: ATxdqUGMt5t8NoBhtiULJMPe9lwTrkhJZn98DpdX0RPcQenV938hZ2QVLR5IOU8
Message-ID: <CAC1kPDMuAmfoJfL4wjrBEcK+rpgbWk7kYEWJjvps=2UJ6-_WHw@mail.gmail.com>
Subject: Re: [RFC PATCH 4/7] drm/i915/pxp: fix undefined reference to `intel_pxp_gsccs_is_ready_for_sessions'
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Chen Linxuan <chenlinxuan@uniontech.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Alan Previn <alan.previn.teres.alexis@intel.com>, 
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, 
	Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-QQ-SENDSIZE: 520
Feedback-ID: izesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: NPs5Yx/9OOd4u3YYWS2rU+QiAyOTNBfUPAshNVnbFv50+wR6KW7MUWbH
	pXX3452hyrm9PJjMAGm4Q0al+fHb4RZuCMmnF9lty5VShGBn6be9TQ5imie4ukss5cgj012
	HhfNibYQ3VSrCn7VkJWrZQGCZ0+VHRdUM66FX3e2tOsCRicOx4iV3cAL9tEjMdd9Q+xR1EA
	ysNLCeVZHPmZnC8KO6paz9BSx70VNh8pHJaWflQcH5mc5OD9tVp702+KL+2Ma+zGB70pEPO
	iL2DMnxxOEijy5iqrxoZZbkye+TNI5rZFZXUPaoog1DbuYUcLy67qWwXpqQpye2syQR6DgY
	VBH5OXp8+/j61UxH2vQ2e8fBSx7d8UZ5t269I/qSad6Kilc43qoibgwosqf0H4WmnPgRFlu
	HeFlxxiIBKwAkfoE/6FH1fhsrePtfKqTEwNy45/1mU6yiUlV4FnNuUimR63Ro3W1vr0ykrt
	W7uW3sFBhblsiz6gPH3/0s7U2q+GEVUxJ4LGBDbUhAlvwFUC8oWe1UjVv/KzUV6NRaA9hnJ
	0LWJD8VLk8n0lMSfQtx+czLusz7mm6/AEdyjaUFaJXdxT41xB5QMh+nUvztlnjWqNePpjw1
	S3NIthZY+Vcy3+ZFhQ1lAG0asKVxHL5gLTn58LeNhNdg4myh+dInPh2yjb6l0xp4PKQ+Nn+
	z7tjqeE5XW0/WJqi1fuzAQGn9ypKZL1c+OCNoDWD6Ao4wlQ+ACl5RndS37KROZSOLiSmnSL
	P2oPe9hJ7zC6B1FVo4o8IozPHhoW7SVbN52D7ZmQXV2jLa2Ib2TIFXwujQUggzsghn8SeHe
	Kg/CyRGBBpZxpjySRMDFcXvzfQ82qna5iJui9KNt4120k4FOVlx7f57/Fou+M8HyYSUCGcZ
	jVnif4r9uwTXl3J2Du4bG6Ir44RoJNSkdQk9wsYW4UHn/JSDCnxS1bIXF7lO/lFO6U8ZvLN
	AKWFZgcNlgILDpf5oB+DaKOuyYUfX+QGRyWvenWZNZk7jBolR/G8b8VH8RLR1DjmMZZnSHV
	eiBX08XTvdTQg/NYXiXX/QT9fpauUvHsWlHhfEOfzlBwMeF+mznpsnSHQ64iZyRFfQwCWBv
	tIftiEmKHI4ix44QruUcNheYgYBzqUWhMghpXguhvbV
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

Jani Nikula <jani.nikula@linux.intel.com> =E4=BA=8E2025=E5=B9=B44=E6=9C=881=
5=E6=97=A5=E5=91=A8=E4=BA=8C 15:59=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, 11 Apr 2025, Chen Linxuan <chenlinxuan@uniontech.com> wrote:
> > On x86_64 with gcc version 13.3.0, I compile kernel with:
> >
> >   make defconfig
> >   ./scripts/kconfig/merge_config.sh .config <(
> >     echo CONFIG_COMPILE_TEST=3Dy
> >   )
> >   make KCFLAGS=3D"-fno-inline-functions -fno-inline-small-functions -fn=
o-inline-functions-called-once"
>
> The change looks good, but I'm guessing the real explanation is that you
> have CONFIG_DRM_I915_PXP=3Dn and that appears to be broken.
>
> Fixes: 99afb7cc8c44 ("drm/i915/pxp: Add ARB session creation and cleanup"=
)
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>
> But how do you want this merged?
>

As patch 5 has been merged into rdma-next, I think it's OK to merge
this single patch into your tree.

>
> BR,
> Jani.
>
> >
> > Then I get a linker error:
> >
> >   ld: vmlinux.o: in function `pxp_fw_dependencies_completed':
> >   kintel_pxp.c:(.text+0x95728f): undefined reference to `intel_pxp_gscc=
s_is_ready_for_sessions'
> >
> > Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
> > ---
> >  drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h b/drivers/gpu/d=
rm/i915/pxp/intel_pxp_gsccs.h
> > index 9aae779c4da3..4969d3de2bac 100644
> > --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> > +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> > @@ -23,6 +23,7 @@ int intel_pxp_gsccs_init(struct intel_pxp *pxp);
> >
> >  int intel_pxp_gsccs_create_session(struct intel_pxp *pxp, int arb_sess=
ion_id);
> >  void intel_pxp_gsccs_end_arb_fw_session(struct intel_pxp *pxp, u32 arb=
_session_id);
> > +bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp);
> >
> >  #else
> >  static inline void intel_pxp_gsccs_fini(struct intel_pxp *pxp)
> > @@ -34,8 +35,11 @@ static inline int intel_pxp_gsccs_init(struct intel_=
pxp *pxp)
> >       return 0;
> >  }
> >
> > -#endif
> > +static inline bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_=
pxp *pxp)
> > +{
> > +     return false;
> > +}
> >
> > -bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp);
> > +#endif
> >
> >  #endif /*__INTEL_PXP_GSCCS_H__ */
>
> --
> Jani Nikula, Intel
>
>
