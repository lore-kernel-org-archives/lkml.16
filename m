Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370E839FD9
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 17:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750180396; cv=none; b=foZoxwgwgYZXMb1ddZVjt+UfcZU+97ZBWFj4W10Taf0u78+H2EIEUkzc5udJp6f7VTXhjNxyGgQtayazFRun1xdrsjvvogW/9xTQkr5flRKvWnUAa7tt1GwjOUEOChJ1afPacrq/zBrmrMU2tDMjO4KAVhYYgQLLCS2r1RU29vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750180396; c=relaxed/simple;
	bh=52976wdskUSnQesCtku/NUa2K5QpFyt4tL8AZSteG80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FYiClATPLKr1aUOWce9wlJ8l1cREiUYgWrHknKjlYwKComzE21l7SM+Ceg5VDQ/VhE0faWDgw6d0u+mQQvFajFrsi0aU97+4EFTHBijHzrOWa/pPv5nPtCyEQOrAekPX3J3tPfNQQLXkm4ZZAQvmG0ZpVs96qIhf+Pim9uX1Xlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evP2EMFU; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evP2EMFU"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6fae04a3795so63703506d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 10:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750180394; x=1750785194; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1pByOWFoioiKjWdK+WRTKkWSVYb/GQiDRdtNrA2GG8w=;
        b=evP2EMFUXZAhNKuMRDAuosKJG2DuYo5jJhxVwoNqOLES1FzwxRt3Hk45dGyK0FcG5K
         qTtu3cVBLif1EshTFYMD8r9slbZZtbciMjimQKYlONC72oZVH+7RNlRaJ21dCVVQUv0V
         TlAh9Z55BtSostzV/1bf7P62Y3nQmvRxRlFVX0p9SN2a6psai10ZBcMvce3p0uywAA/w
         D0q2iurMMb8NvbfytEweAL40RU6wzkzJiIvgtW7j5Y8tpj5ZL2ULi126UtmRqJWrsczN
         mvKx/s+MRh01Nyckl1UbE7PeS+88yn6w2KveUpLUtBP8YJ5i8Dw5H0pPwmWbU+yzL0ty
         M4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750180394; x=1750785194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pByOWFoioiKjWdK+WRTKkWSVYb/GQiDRdtNrA2GG8w=;
        b=aWaScL9G4u/IqUBK8L0p9PX09Yg32l5dvkbzUy0URIsCj510uKDMV4RrWiof0aHKwp
         97R6USFfN7dhmjg5tokTvAleoMcLbwOL2q7taL4OJsqRGleLcre/ZSiNBcMnYvnJQ7me
         ZydTm3q1gft/NGbsaJI1GqKXxKlImDUtctU2MjAMndOTvlB7qWgECJatJEGc/HoC2cBL
         b/5vVN587Uu60lqfzAJpuJcstFvMOkJ+qbJrcoIZ+2B3nw9Fof215J/wsHlPqjocfTFb
         BPkV+MPKwjFLqoGAjpfq8eHVnxG5i/rsNbfHGyoOWKtMtfh9Ts7Qebl4PYTXSfn3Iklm
         mvrA==
X-Forwarded-Encrypted: i=1; AJvYcCXwpP/KWVR9RXPIJEIHi98Z0ELwlGRFzdTsoT9xObvz4ew4/MAPgSi2AHNaT+bA1PG/vq31qt+LA6QVrOI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9lod87zxY6DqlSmmfUbcws6kHgtVUNUm/bldyxARlEfrB7hfh
	bqi1kAUYQTT2gQArMHXpAF54HHE6xnj4HHXk8R4posbM5zXV4cNepVXN
X-Gm-Gg: ASbGncucuVTbqueRJK2LlL3JEbAXifQlC6SgC73QeByU48zk2fwSw2cPUngrJzUbIit
	G3ZkebCEptURYXm91QbhK2om0RUFYQr+yx+S5o8ZinVWBPjnAM1pHNEMq0gCz6c/oeEBl7ir7YT
	YMJA4ZaNU6cbUcIHcUlyJXEWGLyXbhbuaho86v9WdAwZw6tFZdHvexCAsIOMiMrchiO5xOVtmd1
	FEB2xYCgVbI4280Fq7t26LluK343oIZxZD5RP465nGtukLrBAmu3jxh9DVzYaqby8S4b0obfhU6
	OM6CH/+cOj1sA4iCOgQPqiNp9YgeoBzM/R13wntchc4hCUakLY/cc1gU0fUxbe5kZjv0fUtgQYH
	t1R64Iepe4yxgLbH1Xc54WYjjQNjjWC51+8M724C8Zj2jfKwbR7OS
X-Google-Smtp-Source: AGHT+IFg2AZTGdPN/KM61K5m4aSnklley+XcLP5mw4+PcoY3E+ZRw8cbTv+HvkA1+CXxw1OYmogRDw==
X-Received: by 2002:a05:6214:3381:b0:6f8:d223:3c14 with SMTP id 6a1803df08f44-6fb47759658mr215299056d6.25.1750180393969;
        Tue, 17 Jun 2025 10:13:13 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb5011ef19sm33090246d6.38.2025.06.17.10.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 10:13:13 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4A83D1200043;
	Tue, 17 Jun 2025 13:13:13 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 17 Jun 2025 13:13:13 -0400
X-ME-Sender: <xms:KaJRaJFUy4fBvelWPiS_85yNLOMwy0W-0RsAzGQommHOTrshti7Xwg>
    <xme:KaJRaOVjL3vYOs-d2fGaGiAZc0__Zw70tjrjYSqaYjK5CZhjTF4Pta2chihTAsecy
    PwNRa7DerwGtude7g>
X-ME-Received: <xmr:KaJRaLKeaauLoiy7gvPknxMh0T-1Br7o8KHpGXbkFk1k0k7t5VYrePMfDD4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdejhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecu
    hfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtg
    homheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleelieev
    tdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihht
    hidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrg
    hilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeejpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehllhhonhhgsehrvgguhhgrthdrtghomhdprhgtph
    htthhopegrlhgvgihjlhiihhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepphgv
    thgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepfihilhhlsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegrlhgvgihjlhiihhgvnhhgsehtvghntggvnhhtrd
    gtohhmpdhrtghpthhtohepsghoqhhunhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:KaJRaPHph80v60KlBWms8dLN4mpSXyLvGVlYAuBLU-DjqyiQASVDcw>
    <xmx:KaJRaPXlfIPIjSNG1ad9IBUJTXq8oPj1_YEdOom6ZSbkhKXQSoto2Q>
    <xmx:KaJRaKOjiid_i5LNtIW0Aw3Px8DcyPD--S02fytxfvVnJQ2mmBby2Q>
    <xmx:KaJRaO2v7Qs300e5z4sEWvYUysuTh18KGKp0muLnZy5WHvjejcny0w>
    <xmx:KaJRaMWib12C_AP6QhZQDwGy0RgiSY7pUXfnEh-uT7ICLK18Nc1pM9xW>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jun 2025 13:13:12 -0400 (EDT)
Date: Tue, 17 Jun 2025 10:13:12 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Waiman Long <llong@redhat.com>
Cc: alexjlzheng@gmail.com, peterz@infradead.org, will@kernel.org,
	linux-kernel@vger.kernel.org,
	Jinliang Zheng <alexjlzheng@tencent.com>
Subject: Re: [PATCH] locking/rwsem: use OWNER_NONSPINNABLE directly instead
 of OWNER_SPINNABLE
Message-ID: <aFGiKIE9xZRRSoVH@tardis.local>
References: <20250610130158.4876-1-alexjlzheng@tencent.com>
 <7a006014-bf6e-4480-bd61-b0333c74e3a4@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a006014-bf6e-4480-bd61-b0333c74e3a4@redhat.com>

On Fri, Jun 13, 2025 at 01:52:43AM -0400, Waiman Long wrote:
> 
> On 6/10/25 9:01 AM, alexjlzheng@gmail.com wrote:
> > From: Jinliang Zheng <alexjlzheng@tencent.com>
> > 
> > After commit 7d43f1ce9dd0 ("locking/rwsem: Enable time-based spinning on
> > reader-owned rwsem"), OWNER_SPINNABLE contains all possible values except
> > OWNER_NONSPINNABLE, namely OWNER_NULL | OWNER_WRITER | OWNER_READER.
> > 
> > Therefore, it is better to use OWNER_NONSPINNABLE directly to determine
> > whether to exit optimistic spin.
> > 
> > And, remove useless OWNER_SPINNABLE to simplify the code.
> > 
> > Signed-off-by: Jinliang Zheng <alexjlzheng@tencent.com>
> > ---
> >   kernel/locking/rwsem.c | 4 +---
> >   1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
> > index 2ddb827e3bea..8572dba95af4 100644
> > --- a/kernel/locking/rwsem.c
> > +++ b/kernel/locking/rwsem.c
> > @@ -727,8 +727,6 @@ static inline bool rwsem_can_spin_on_owner(struct rw_semaphore *sem)
> >   	return ret;
> >   }
> > -#define OWNER_SPINNABLE		(OWNER_NULL | OWNER_WRITER | OWNER_READER)
> > -
> >   static inline enum owner_state
> >   rwsem_owner_state(struct task_struct *owner, unsigned long flags)
> >   {
> > @@ -835,7 +833,7 @@ static bool rwsem_optimistic_spin(struct rw_semaphore *sem)
> >   		enum owner_state owner_state;
> >   		owner_state = rwsem_spin_on_owner(sem);
> > -		if (!(owner_state & OWNER_SPINNABLE))
> > +		if (owner_state == OWNER_NONSPINNABLE)
> >   			break;
> >   		/*
> 
> Right, OWNER_SPINNABLE is no longer needed after commit 7d43f1ce9dd0.
> 
> Acked-by: Waiman Long <longman@redhat.com>
> 

Queued for more tests and reviews, thank you both!

Regards,
Boqun
