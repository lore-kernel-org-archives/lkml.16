Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB6F23ABA9
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750436005; cv=none; b=A6kQ22Kq2ZZFDo6SHD5BS8U88TW7p3eLy4yJApabl1JdK2nEooH86UFjAh8MgVrv7zAwnEzuo4XQfadKKRUqZ6BbsBtHw8j7amTqMynWIqxUg+h8Too6yqJl9oKuwzRKi7Trk0RU+D2KJgSsoqVxgeDpEHzsLoyFOEdXxolq8Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750436005; c=relaxed/simple;
	bh=e2ioOo6tOrojvwl+PZ09pqduoMCa5njb4Ul1tn1cLs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rouZyX+STpDHWnCIQIEbAclqsumy0rNNkBYt2YAUJmV0q0A2X9Bnfn25fVL2SmEWtd28OEtexsr9n7lUAu3Rz21Nd125gFhYIp1fV4UO7H466qik4OBfDW1TwTEa22e6/42LejvTbKjDS7JvwVHycmBSkpjvggzdupyrYky6kdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FNinzajN; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FNinzajN"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32b5226e6beso20065151fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750436001; x=1751040801; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+BNBhps8ESqsk/6hoahhBSDKv6+ptcMKdFQa/wIWNE=;
        b=FNinzajNxie5MaXSPqk7lHlpcFNAhniIH6l5LEzV/icqPQu0yzVE+cfAHjaqDQDaNo
         IAA/o/botDV0sO17sowioiMXhstXWB/BZ04oq5lYxr3naIUmDzJd7/X43qjl0sJWsR4E
         Q+wjOKfO8/39m9Lf04q8tDSLY+6i19iVAz6i9rbAnTFJQBMNVvGSu861ofOoOcyKAfqz
         Yw2YeUY9UOfiPlix5xIeMOHu0F711eWrPwXd8HS8K6dnK7dcY/XyhmBTqwzlhi7H81kX
         MtmBs8Fm/rwpGeH1zbizfj1t1r4TfNp2PVJwFyndrV36q/TVZYbLL5fvi+InqAbvCuAP
         vAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750436001; x=1751040801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z+BNBhps8ESqsk/6hoahhBSDKv6+ptcMKdFQa/wIWNE=;
        b=p2yVpr6uI5hWwcfIzyQACfu2sCK6j4NdMgQ/RozNHLgEkYqR1qrTTxVXfwKyt9FNva
         nNA30QLWh91IzufZK4zO9z+VopZJL84hIAyzTvqN40z55bmHiX24Khh/SXE9pbuyiRUG
         MmuYbosk0vRgvZ05qH2jSWenRS0779CHXfjt2r3xMF0sTalNSN7cD8J5BtdgyTGnrSdZ
         iMq2b7THn2+1hnA+CRuOEfQGPTFv8hAHVZXMPH9P+RHDVATqCoP8sslckGg9eA5rHKQc
         Mscfn4ZzWnjxmi5oiPTeTM4IWEW/ZMcY+WNhdnaNJkBsxt3VaBUOzjmDAVZ8rQN79nZi
         J3xw==
X-Forwarded-Encrypted: i=1; AJvYcCW6YyclG2fs0V35xODs1DJ9XnIRCBudNFWAesp7Hq4WR2vQm4XOv6q6JNIt726GkfOgR/wY6ethlA5HRdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuV8i4pkNmBtRuSi8zaBigNIUHClL4GW51WC2SyblCJ4F8hEiF
	CG+g1rx+brZMj19Qq9p9Yx93WvCmLk7pA80ksUSe6k/sU10LAGHhHMjlw4RS1VVbvXBr8E8Ud9x
	ui+At/RtCYs2+DiICCMt9diEhLYLPVSD4xrfOo6p6/G9GdIhVwi4RYZM=
X-Gm-Gg: ASbGnctoBQvjTf0TISv4wCG7hQQCTY4cqvL64ujHQCkgiNPARafRH2Cw8Gj0kwHdUQQ
	fOZvrfldzMSY6odxY5iiAcrbFb38ddkz4yrp6eBSA0TIkBmKP9FEi9W1YGXT2NGbEgk36Sn+lua
	GRndsvO+cFl1MSijuK9tH0b4tiptj8mn4V7QOvqwIO8wkarilUbCE60+t2ng17R8trhXsDPXfZc
	XbxnE3ikQzLmBw=
X-Google-Smtp-Source: AGHT+IG/0yRlvkHz/hyNvOyJ7JQgCGthWhTAgCo4VQSmwSZZ46C00MC7csLyq+V4fYGsVccVIPvmoD2wNF3OKxiKuSo=
X-Received: by 2002:a2e:b5d6:0:b0:32b:590f:47cb with SMTP id
 38308e7fff4ca-32b98eb67a2mr7177151fa.15.1750436000565; Fri, 20 Jun 2025
 09:13:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250614133531.76742-1-marco.crivellari@suse.com>
 <aFBj9PXQiw-7O6yQ@slm.duckdns.org> <aFFozq_dzk8Qn7XN@localhost.localdomain>
 <aFGwmO3cNdR38lo8@slm.duckdns.org> <aFG5-qBWHy-LeLGS@slm.duckdns.org>
In-Reply-To: <aFG5-qBWHy-LeLGS@slm.duckdns.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 20 Jun 2025 18:13:09 +0200
X-Gm-Features: AX0GCFtTzmftqt0pBzmYbCem1zCTBk5Nid280bcgoVuL8y2D3MGbSKmxNgE7m5o
Message-ID: <CAAofZF7xVETGVzrpHdMghcGDwNvw3jVumFWwWMqd+tq4Gm+m=Q@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Workqueue: add WQ_PERCPU, system_dfl_wq and system_percpu_wq
To: Tejun Heo <tj@kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>, linux-kernel@vger.kernel.org, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Just a quick question Tejun: when do you expect to receive the other patche=
s?
Should I wait till the next rc1?

I just want to check the work again, but they are ready.

Thanks!


On Tue, Jun 17, 2025 at 8:54=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> On Tue, Jun 17, 2025 at 08:14:48AM -1000, Tejun Heo wrote:
> > On Tue, Jun 17, 2025 at 03:08:30PM +0200, Frederic Weisbecker wrote:
> > > Le Mon, Jun 16, 2025 at 08:35:32AM -1000, Tejun Heo a =C3=A9crit :
> > > > On Sat, Jun 14, 2025 at 03:35:28PM +0200, Marco Crivellari wrote:
> > > > > Marco Crivellari (3):
> > > > >   Workqueue: add system_percpu_wq and system_dfl_wq
> > > > >   Workqueue: add new WQ_PERCPU flag
> > > > >   [Doc] Workqueue: add WQ_PERCPU
> > > >
> > > > Applied 1-3 to wq/for-6.17. I applied as-is but the third patch did=
n't need
> > > > to be separate. Maybe something to consider for future.
> > >
> > > If this is for the next merge window, I guess the easiest is to wait =
for it
> > > before sending patches to other subsystems to convert them?
> > >
> > > I guess we could shortcut that with providing a branch that other sub=
systems
> > > could pull from but that doesn't look convenient...
> >
> > Oh yeah, I said I was gonna do that and promptly forgot. I'll set up a
> > separate branch based on v6.15.
>
> Okay, I folded the doc patch into the second one and applied them to the
> following branch.
>
>  git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git WQ_PERCPU
>
> This is v6.15 + only the two patches and should be easy to pull into any
> devel branch.
>
> Thanks.
>
> --
> tejun



--=20

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com
