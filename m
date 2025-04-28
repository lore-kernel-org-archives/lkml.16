Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAF81DED72
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745824994; cv=none; b=Pjgh9zU4M2ZJgJNulNa8Vb0dDjBG6X6umHxS0AVfYnt2pf4tub92NBAZC3uIaBGXnQOUV12S87lw/aXx1XtwYcJrIcMLqM+fLfRL9zUXc9pqqYjoaoIbPfzUouG5y/2J6qvprviO6i2CnLYJmpu4TN6yHDAxDUyQ8mDJLsZR99g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745824994; c=relaxed/simple;
	bh=y4TmJ25vii3OrXTwRyQdX/ywNKcOJxWOhKaA/i78N9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPwJtVnY6YiAZ/1eAx4i9PXlKSeDdzOOPHX5nsNpapWAZ5Bp7WdX1W02EN/HjqGNSwzipMlg6u6wM+qpU+0MbCjl+2DbdhySNw48QW9S5qOyfYtgbzYrzyFd01k4yZC4JABuoQOu1A8AfvtQAZKvYOut7fuCFy+OmL/ZnSAhExA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZvIE2yC8; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZvIE2yC8"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30db1bc464dso45925001fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 00:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745824990; x=1746429790; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9x67H52mTbsg04NVD/Q33hB/CMZ41whHB5oYC02pu1I=;
        b=ZvIE2yC86sZbybwON/1EN0eXzh5dZJNP9NUOt3kI6h6+YeNe9lD/MQUq67vm8x7B9/
         eUSK0cjfidJcUXriwtnqcy430NtoaSBmYFvkztxr8irCuzV3+JmsqNV/zIKVAx8U0dyD
         1ALY7DkK9kfDaa7hH05p25uMfggcGscKtOJZEEdbCufS8rQRcbwlBzU3xABdftpyhBku
         KBy2giByOfAC6AjlI8J493mG5NSQpUYv/RcHdRLY6uT1C3cGoqD+KtFgB6Re4x/TqYQi
         Fb8ag7ybGT9NTRLp41dFgmxc3RsFA+jDF1zqYqDnkDei52c8R93KWVN7jGmWaEw53ZAA
         SucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745824990; x=1746429790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9x67H52mTbsg04NVD/Q33hB/CMZ41whHB5oYC02pu1I=;
        b=oom7S4/rqeXlPFTWu4x+N+eTlHYVjUvhWrURHohtRdN0oLfdP5TiKaOaM12idXf6oB
         bs60Mk7zNZVf+0jKQWUgQ4OU8MAreIoEfAfkt08/0pN1IExYEV6rbzT5eNW2wSb9XUN2
         V54VvzVwexXib1ldEKR4lYyW+/HIUzbJgvodOMOSZGWVx9vRwlYlzqNceESBaWJmK7l2
         I0+qV9mwfjz2Ay58S4tH/8LNVKPIG7ggnCatB9/qJuEaLHAu54Hnm8BEiH8MXqbc8RvW
         Ca3lpB1NPVKEfGdRR/OK3VPymeXcEut+/6JwKeRcw074BiKtJtNxAZI8BOQySQR4fSLD
         mETQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMO+EpSA1xuVf1pmYWcJYn2Xu+IyZdEfc2JnpijwB7VWi/yEICSmkmVKIDp38Y/Ed4WpuoXAWSBM/Kix4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1gxMu+U3JSERKNnCG1+mLC98IOP7EZckLtcU8aIetHuaDVol1
	QKuY4mrSSUHVWWTQdqcAzsObcH7T3/AfzD5XR0Sr/RyV6/+d/kSKCQYePhHGl+BMWxkVBqz0y18
	AlxKCIkQQyBQcBdXlE9/c9rFJvyPCy/wh0+VZIw==
X-Gm-Gg: ASbGnctuyTlEiIO6Osv02nwdHHuqMDOGH9DuYV1prwRF4BVUltH3wQfyZZp/G0B3Khm
	//+mpxIEIBtPVa66UYtIMLyB8mIIHGV3Itw7gVF6gi9pyuReHTA8ZcPf0yc4qq/TUGnYSlmTEA6
	oMDyrikGuFSaJ65GIckJftUoP4rovNdjxtBD5h73qotBAkTl+xpE6fYpA=
X-Google-Smtp-Source: AGHT+IFsQTT0ZbvF2qsf5+nWdF2LXv1YLg7Wzp3Hnhz2hZmRgl3unVDnUWtxNWTIAipXDSD9b/QyDMAwPEPo1cUC+LY=
X-Received: by 2002:a2e:be1e:0:b0:30d:626e:d031 with SMTP id
 38308e7fff4ca-319086bae60mr41404681fa.33.1745824989984; Mon, 28 Apr 2025
 00:23:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403161143.361461-1-marco.crivellari@suse.com>
 <20250403161143.361461-2-marco.crivellari@suse.com> <CAAhV-H6WszbD2o=fUqzz-FcOho-=ZxMQjW3EHKE5z=azntdbeQ@mail.gmail.com>
 <alpine.DEB.2.21.2504280224110.31828@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2504280224110.31828@angie.orcam.me.uk>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 28 Apr 2025 09:22:57 +0200
X-Gm-Features: ATxdqUFSBq62_eANDu94efqw9HNqo6fYEiyzy9a3lY1upZoFgF-wlLqcETO9rhc
Message-ID: <CAAofZF6U_PotxSiXEs+-T5C7E=xA5+7j4=rc-PS-njQMRoCo3g@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] MIPS: Fix idle VS timer enqueue
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Huacai Chen <chenhuacai@kernel.org>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

Sorry, I have tested the code only with both the patches applied
(when I also ran the tests with qemu) and I didn't notice my mistake.

I will submit a new version with the correction and the changes
suggested in the other patch, when we find the proper way to do it.

Thank you.


On Mon, Apr 28, 2025 at 3:32=E2=80=AFAM Maciej W. Rozycki <macro@orcam.me.u=
k> wrote:
>
> On Sun, 27 Apr 2025, Huacai Chen wrote:
>
> > > +r4k_wait_exit:
> > > +       .set    mips0
> > > +       local_irq_disable
> > >         jr      ra
> > > -        nop
> > > -       .set    pop
> > > -       END(__r4k_wait)
> > > +       END(r4k_wait)
> > > +       .previous
> > I'm very sorry for the late response, but I think ".previous" should
> > be moved to the second patch.
>
>  Indeed; does it even assemble?  Correctness aside I'd rather it didn't
> cause someone a problem with bisecting sometime.  NB I had no opportunity
> either to look at this version earlier.
>
>   Maciej



--=20

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com
