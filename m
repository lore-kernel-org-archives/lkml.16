Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5D523C8B4
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 08:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739003421; cv=none; b=eDfAdFRbiAsPGVpYOLoxHYZqLON31hISs2FtQ6N0xcIZ4Gw9B0I/oBpU8LavjRsOrfxGJw+A8u9t9g+SBom6iGfT2ACs14SDyNzHkT0RlexsFuL79i6+GiVcU3OpdZQJOCxvVMXeWw4FX5PPB24ULQA5oAOp8U/ZGY3g9URkyfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739003421; c=relaxed/simple;
	bh=lVCj6stM71jMuixwYTktojduHC37Po17hX5XNGGUIXw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cLQbZZBu6mXAF0KfOJ62MuuOMQWIv6+U568A1bNs/1YrlDHPHvdK8nW3WLKy1S+ou0n1YYEFHSexv5mxiFCbrXjU4EO3Xu7Xvy1C4ICODyaNOMJB99uPU+mTUeBzBnVSHmp1RDCwXg52oZu5Mb+akhYNJ7wxkk5aCQvGLjxu9OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLC/RcH0; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLC/RcH0"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-21f6d2642faso7041945ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 00:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739003419; x=1739608219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLh4hyi5Aar0uyVibaHz9opaMmC7Yry3R/PXmYXXrV8=;
        b=FLC/RcH0wi/k8lB1HSffFaTht7M/kIa1Luxgebn9KKhFjF9NwgCLeXWQ6XlCkm51RV
         66XlmKj3GOq+LjeEsMrIfSRuX5v+seVko7s2LMaVQLbkpVRFnNJ1ce1P5N0VR/5zOKKN
         lZ0NmhErNi8b8QMH9ggOaQs0VMmEmHkeWKFrPzHiDgrgE+UMmEO52RJQSfK6LdzjCVut
         ouAyK8Clh/JjrlCLgjLQTeVGzruA35NwJePWf5faaKLjy6ug0Z6UIqOvhHYENuveUYu8
         Wk8t1tOhnPKiTZKV4HRsdHX80qrb9yBxWNG9QQqFG+Dll3PEdtF8cY43x0zjUwn1u428
         DtDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739003419; x=1739608219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLh4hyi5Aar0uyVibaHz9opaMmC7Yry3R/PXmYXXrV8=;
        b=kFV4ZVWzD6NTIysYM7OKFb4nOzHZQ+lNMwQ1h7VbiaF7tdHYMCInHMoyafOZ+myVZC
         fcIJbxQ5eqTEpA2mumIQkG1qCmD29zDh/UMSopzEq1RGwrIRrfNUs9hiT604Hf7XH2qY
         J25WhOutL/nuva/w/KNPhXBsODpH3yGb8KevhuxlIRcSELLn2GP42ho9pnxZUoHjQfl2
         TonaJt6pJOQmHVgEV2Q7D02WWs7N3rvAakze7e+df1q4UjZX3jvgRPtir+IKN1wt4axI
         Jz72bC8mKnnTmzIKOhxcIQvhg9+z/LvCxZH1oBoHtl5NYkxubzuNvkKaaETlo6YA7GLR
         JnFg==
X-Forwarded-Encrypted: i=1; AJvYcCXVBFlda4n991UTcEmXQ9h3zM9zkLxYOIpsHAi4PVrU2F8neZBqU9uPxv8rG6m4L0iQYWQoF9XwY98VzAk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy8yWKgcoQWSdCa9hROQKNPxZgQhQtCWJgoEKME51X+hRi2gQP
	pZTQPoJyoAd5KMq7hB+E69qzARfqgx/+5VNm6XzDHPb2jKvgXRow
X-Gm-Gg: ASbGnctvyCX0M3gezP523UKGHbWtTy8IdBBeR0kse0GVx2hBNOoe2YbpMFpVih//yQv
	nLSJGOTQaflWBOdCE209sz1Io9T0556u+SXLW5ut974s/EP1kdgJq/6xTQs3HDLaeTsYWhDdGIH
	TZlBslVyQXrM+D1PVr9glVwWPDAVEh/alM/8zF0iI4Cd8duRZmT6S/64PL3hiRSbhAy7O5G4+8O
	4RhLuZfxy4lKsXRU08FjIfNAjy1A89NCiGOLSQIN1o6trUp7nq7mfinbVtNonwot8LDmCr/SNEv
	o/z/KD8zAtUPjKlpRc4xzSM92yIN079RHiU=
X-Google-Smtp-Source: AGHT+IG4GwGQ6J4q9ICdapIGhJcxzR3D6XKSnGRBbEohjVtQenXmj68MCdTksljdu/p1p2iLUhd6Lw==
X-Received: by 2002:a05:6a00:139c:b0:72a:a7a4:b4cd with SMTP id d2e1a72fcca58-7305d54712emr8610378b3a.21.1739003418868;
        Sat, 08 Feb 2025 00:30:18 -0800 (PST)
Received: from localhost.localdomain ([114.67.205.189])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51af64c1dsm4293089a12.52.2025.02.08.00.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 00:30:18 -0800 (PST)
From: zihan zhou <15645113830zzh@gmail.com>
To: peterz@infradead.org
Cc: 15645113830zzh@gmail.com,
	bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH V1] sched: Cancel the slice protection of the idle entity
Date: Sat,  8 Feb 2025 16:29:16 +0800
Message-Id: <20250208082915.20842-1-15645113830zzh@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250207123620.GA10324@noisy.programming.kicks-ass.net>
References: <20250207123620.GA10324@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > A wakeup non-idle entity should preempt idle entity at any time,
> > but because of the slice protection of the idle entity, the non-idle
> > entity has to wait, so just cancel it.
> > 
> > Signed-off-by: zihan zhou <15645113830zzh@gmail.com>
> > ---
> >  kernel/sched/fair.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 3e9ca38512de..7777d110d053 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -8851,8 +8851,19 @@ static void check_preempt_wakeup_fair(struct rq *rq, struct task_struct *p, int
> >  	 * Preempt an idle entity in favor of a non-idle entity (and don't preempt
> >  	 * in the inverse case).
> >  	 */
> > -	if (cse_is_idle && !pse_is_idle)
> > +	if (cse_is_idle && !pse_is_idle) {
> > +
> > +		/*
> > +		 * When non-idle entity preempt an idle entity,
> > +		 * don't give idle entity slice protection.
> > +		 */
> > +		if (se->vlag == se->deadline)
> > +			se->vlag = se->deadline + 1;
> > +
> >  		goto preempt;
> > +
> > +	}
> 
> Yes, I suppose we can do this.

Thank you very much for your affirmation! 
