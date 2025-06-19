Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363E4238178
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335764; cv=none; b=l3fQZFzwVDdkaq3GL8YK6ZCDFApaR2mpE/KkcY0QZcZsAIMnKXu+tq36vGYsA/+Bml2H8U36XFw+FeykkHWJG9mkKS6ucZdhCWJEiBnyBD8Oc1OrkBv1tKsv+ysM1YcACCODtvSohFKexrTjaS4kZHMtFzaoMHBhF1TlT8cw54w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335764; c=relaxed/simple;
	bh=8hfF9WENn26TJxOPJXFf2sXtFmcV5U3id1pstJorT/M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eIj+kc7FZIExYN++vNB3UY0ob0nSVpfMEpp45xLx2swd5L49tptseXbc37pZpVDR0piEhsEAXXmUHO2/Qm326/jTEmuHuXEp4eirXBAVEG2CYOGhYi/x+L9aNjNGocC07qb/NPnousmzDLRVapLcl8/TxVUfp3CuCCtdk1Ve2+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Av9VCFai; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Av9VCFai"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso544687b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335762; x=1750940562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SaXuixrWp6MYXZLfgSHfhs0/fVgTYn7J90oes9s/Ux8=;
        b=Av9VCFaia6tMs0wUfBfwIlZ4qxRBqmQjJvSQDo884hGUJ9g+D3u3emUmyQw2sWDTYt
         nV5rUBz9ZO3YJFIJWH+MCN0/CfM7sKf8Rdy+doI51LE9EVAO1347+U0myf0cbdikGjtM
         Ukall3KKz3FwPrKY+6TPSZOz52iQ+ZRPJJclGQsqAv82KEELZt88yWqEEmLn0710iRzP
         R/xtRqakkziizDMTCjohCM2U3IKtCm9SCllyc/kzabNnKoP4uo4u/lvtscQ08ZDb5O+1
         tp/+aSHix856EiA2/Q7oxIlPsYb/w6QvmqyN2uqyHczqJ6F0U21prYYe5padVLpJyWFO
         VKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335762; x=1750940562;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SaXuixrWp6MYXZLfgSHfhs0/fVgTYn7J90oes9s/Ux8=;
        b=dJI77GvlOAKRGC4RyBwY7ohKPTogEmewIRtF0SjMFOz3cGqUEYvbDC2CjXO1OVjT3o
         7axeyARi44e7iw3iJiX5yA4sz1yIHTdTJ2xVy3t1JtsI+v/Jh7Q3uATo79UMoFfhdQth
         ur360lVaFdbCuDhR8WVl6p3TEkmT1ixvHrxDE2QOe/EZvV6m+lQzEvR6oIZ+TdwDUzTT
         1GSg39X38pmJa+deBrr0Ykdt6FdI5IaNkNZPkg61B5JIh4exZy6MjMPOOCR4NSxRGIFN
         Of6hTvLyzpbi5e0CX23/7kT/HVBS9P2HfCygodMtIBzcSCgzqkilISogem39ckdFdcsh
         nEgQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1wgjSzTWFNWrJpsMuLiuXhphsC0AQerd7LTnIcksIwaa+bEIa38Be+mCxoIKfcf8Pq5jZFfH0M0TCrlI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbRk8Xij3u/06tUHQRkJY6spf1tvkChDMlkjkHA2FSeIWNnos/
	6PnzBjIiO0ms4xPtWrUV5+/oGScjjS7YeR+laCGKVB5SbxQvCemx3CQj
X-Gm-Gg: ASbGncsuZ7b2Z9ISsIVUoVhvIbJ4NcMV2rrpFz6cJv6JEL8Ti8Sff4lmPeXJNWr/wgG
	5ltwbIsWZHFfcx6kSjfBcTN9cUceXVvv4zqSL5cwFBeRvCYYDl4sX1zGRSPR+dsp7RCJICUU7hf
	1Zt9cJVrjgsNUxRaVhiqzpfAlswPxjCJSZ/24JgvUfNFIQ5MlnXsZr/s3HJZzoCXHGq1dH4BcJ1
	+UltSrFrde8zAStbIxxI4trWJGY92q92OD55oj3BRbb8iD+lEKFWska+50grLeDFIcgAKuVbOdZ
	CoQynD5kQ+iDbe/vtl2+Q6bId2IInKScPsZXbNo4EgWR9jq6EuqdVMaRt+Q/g5+c63eAcXXMDZA
	cG1XUEDQc5xllhBwUugX9QGdHiHTp8kjIGikXp10Z7o9j93fz6c8spz4bt64=
X-Google-Smtp-Source: AGHT+IHZxLRTpx9hCAxSDNhzjhuyoOI6Wrn+VhpMQGgP5vgN7RFUZno+5odFWDhNh6HlRZSaShry2A==
X-Received: by 2002:a05:6a00:478c:b0:748:e0ee:dcff with SMTP id d2e1a72fcca58-748e0eee3a9mr7464159b3a.11.1750335762257;
        Thu, 19 Jun 2025 05:22:42 -0700 (PDT)
Received: from mars.local.gmail.com (221x241x217x81.ap221.ftth.ucom.ne.jp. [221.241.217.81])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d255fsm13522153b3a.172.2025.06.19.05.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:22:41 -0700 (PDT)
Date: Thu, 19 Jun 2025 21:22:38 +0900
Message-ID: <m2a5636hv5.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: benjamin@sipsolutions.net
Cc: linux-um@lists.infradead.org,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 06/13] x86/um: nommu: process/thread handling
In-Reply-To: <55ff3fa8f19c61745933e7814029cef526271eb4.camel@sipsolutions.net>
References: <cover.1750294482.git.thehajime@gmail.com>
	<031503649a24799bff082cf917c36550f4820181.1750294482.git.thehajime@gmail.com>
	<55ff3fa8f19c61745933e7814029cef526271eb4.camel@sipsolutions.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/26.3 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable


Hello,

On Thu, 19 Jun 2025 19:36:04 +0900,
Benjamin Berg wrote:

> > +void arch_switch_to(struct task_struct *to)
> > +{
> > +	/*
> > +	 * In !CONFIG_MMU, it doesn't ptrace thus,
> > +	 * The FS_BASE/GS_BASE registers are saved here.
> > +	 */
> > +	current_top_of_stack =3D task_top_of_stack(to);
> > +	current_ptregs =3D (long)task_pt_regs(to);
> > +
> > +	if ((to->thread.regs.regs.gp[FS_BASE / sizeof(unsigned long)] =3D=3D =
0) ||
> > +	=A0=A0=A0 (to->mm =3D=3D NULL))
> > +		return;
> > +
> > +	/* this changes the FS on every context switch */
> > +	arch_prctl(to, ARCH_SET_FS,
> > +		=A0=A0 (void __user *) to->thread.regs.regs.gp[FS_BASE / sizeof(unsi=
gned long)]);
>=20
> Hmm,  the comment mentions FS_BASE/GS_BASE, but here you only handle
> FS_BASE? Is that intentional?

thanks for the comment.

my intention is only specific to fs_base as I saw the register needs
to restore during this switch while with gs_base I didn't.  I can
update it if I see a real issue without it.

The comment needs to be updated (I guess this is copied/pasted from
the original arch_switch_to comment).

-- Hajime
