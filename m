Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12E9281346
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 15:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747669270; cv=none; b=gucU54U94c2hD20wQCVvYIvKv59ZuSZXQZ+96AoCCIzJEzG53BD35FgFmr6NZKH8xn8V9vcxsnayxmTrOlvjyoOBq4Ta4jdgK4CTbYI7txAADWxGI3DJxtJrh4UfDsgB/vH+qc0qzCpbXkd5a4spmHuWQ9fqx+OtSdxYe2aTsZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747669270; c=relaxed/simple;
	bh=JWwxo0x+l19TqUeaDFmjwz0H0sA5vd+hp1s5vT1QIhw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tzk4RivNyIZsLSyDG1AC9gJovw7XrjdnOgCIK05yB3qQzpEsY0kjN4pVOizE3g35Gk8oLjWA7LAenFB7UTrE8j933jYqOtjIdpx/M7hKZMwvvW/qbZsFjZLRHUHUOLLwagM6AV3qDtm9CAM+QKOxaHM3WiiYwyAUstt8AW5TXsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=BiEOr8lh; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="BiEOr8lh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9HMc0DzIN5ocrXZLGX5hiW5AlfZP52hbSKBuKVVgxw8=;
  b=BiEOr8lh1wbmqmPbg972i+TnuDfMlW9JpMOq4PXcQ00yckg/fDp/evN6
   TXLX0ltcbAsPdK/AvMslBPE98gezKlPvAAn38pHMJ8h5Roa+VDDC1nD+K
   WenDR9H3KIIeDXGfFefWZUTHbtRM9ZVPCq9Z9K9SJ9xzSjm0enLCaf/MB
   U=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,301,1739833200"; 
   d="scan'208";a="116972886"
Received: from unknown (HELO hadrien) ([194.182.8.86])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 17:39:53 +0200
Date: Mon, 19 May 2025 17:39:52 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Luo Jie <quic_luoj@quicinc.com>
cc: Markus Elfring <Markus.Elfring@web.de>, cocci@inria.fr, 
    linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
    Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
    Julia Lawall <Julia.Lawall@inria.fr>, Marc Zyngier <maz@kernel.org>, 
    Nicolas Palix <nicolas.palix@imag.fr>, 
    Oliver Upton <oliver.upton@linux.dev>, 
    Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
    Suzuki Poulouse <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
    Yury Norov <yury.norov@gmail.com>, Zenghui Yu <yuzenghui@huawei.com>, 
    LKML <linux-kernel@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
    "Kiran Kumar C.S.K" <quic_kkumarcs@quicinc.com>, 
    Lei Wei <quic_leiwei@quicinc.com>, Pavithra R <quic_pavir@quicinc.com>, 
    Suruchi Agarwal <quic_suruchia@quicinc.com>, quic_linchen@quicinc.com
Subject: Re: [cocci] [PATCH v3 2/6] coccinelle: misc: Add field_modify
 script
In-Reply-To: <1e3ba498-2bfb-4cab-ba13-5ab2c5b03ef9@quicinc.com>
Message-ID: <6fe2aed9-f29e-4a77-5f47-855cfefe1973@inria.fr>
References: <20250417-field_modify-v3-0-6f7992aafcb7@quicinc.com> <20250417-field_modify-v3-2-6f7992aafcb7@quicinc.com> <a1be0efc-a4c9-461d-a01a-8fb830b2c68d@web.de> <0ee48e2f-58db-49b0-b651-dcc0e517465e@quicinc.com> <43712874-6f1d-435c-98b2-30ac44d25309@web.de>
 <1e3ba498-2bfb-4cab-ba13-5ab2c5b03ef9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-477211006-1747669194=:4212"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-477211006-1747669194=:4212
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Mon, 19 May 2025, Luo Jie wrote:

>
>
> On 4/24/2025 12:35 AM, Markus Elfring wrote:
> > …
> > > > -reg &= ~mask;
> > > > -reg |= FIELD_PREP
> > > > +       FIELD_MODIFY
> > > >                     (mask,
> > > > +                  &reg,
> > > >                      val
> > > >                     );
> > …
> > > With this code variant, there is no space prior to &reg, here is the
> > > example code changes generated by the SmPL code as below, is this
> > > expected?
> > …
> > > +++ b/drivers/phy/starfive/phy-jh7110-dphy-tx.c
> > > @@ -244,8 +244,7 @@ static int stf_dphy_configure(struct phy
> > >          i = stf_dphy_get_config_index(bitrate);
> > >
> > >          tmp = readl(dphy->topsys + STF_DPHY_APBIFSAIF_SYSCFG(100));
> > > -       tmp &= ~STF_DPHY_REFCLK_IN_SEL;
> > > -       tmp |= FIELD_PREP(STF_DPHY_REFCLK_IN_SEL, STF_DPHY_REFCLK_12M);
> > > +       FIELD_MODIFY(STF_DPHY_REFCLK_IN_SEL,&tmp, STF_DPHY_REFCLK_12M);
> > >          writel(tmp, dphy->topsys + STF_DPHY_APBIFSAIF_SYSCFG(100));
> >
> > The Coccinelle software is still evolving somehow.
> > Thus your test result can trigger further development considerations.
> > I hope that clarifications and corresponding improvements can be achieved
> > also according to such source code layout concerns.
> >
> > Regards,
> > Markus
>
> OK, understand. I will keep the original patch as below for now, as we
> need to ensure the script generates code with the expected style.
> +- reg &= ~mask;
> +- reg |= FIELD_PREP(mask, val);
> ++ FIELD_MODIFY(mask, &reg, val);
>
> In addition, below case is filed to request this improvement on the
> coccinelle project.
> https://github.com/coccinelle/coccinelle/issues/397

Thanks for the report.

julia


>
> Thanks.
>
--8323329-477211006-1747669194=:4212--
