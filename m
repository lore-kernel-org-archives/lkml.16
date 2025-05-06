Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556D3214221
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 07:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746518042; cv=none; b=uVRbrEtz925UCBnk6CMFvaRkD8+Qzoei1oXIzQiWMkFrHCoFBC3lQ3/cN3ecu4zLdjCXhm1HN+qa/SslztPW9VUGwJEhIRAqyNs5kTNm+C/3LEYmiE7K9fhSuHLVae4BEkC6WkUKJumMyee6L85X2oGjoi1VGyeR/rzo/45j+lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746518042; c=relaxed/simple;
	bh=2pceY21HXPtPw8/ljmmoL68c5jWxfiDJhxApfHam9Jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJFWX7vwiBkHDsvvnENvKd02IvedZo2keBrq7I38peq5h1oB0WpK1QXRFy8Fm7+Ow2v4iny8kOfevxiZhTcK95i5IWVN0/PC2QQ5UK86dwqrTjmaSRIdyKIfge3xrKc9Zh9rIwTt8G6AkK5ClGvWrowFiACk38AJgB9PU1txIdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bsNCwFWH; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bsNCwFWH"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3105ef2a06cso50792941fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 00:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746518038; x=1747122838; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01kJ9UREWk6Z8MO8rJuNtGQkQCdgEUCbi3nLRVMNP0k=;
        b=bsNCwFWHW1Kjh8amSh7O3HlaJP+SIhe7lY7Tp7giGN55SYUAGxB+gl7IoDmOi02WMT
         0cfOE2gbIZ4dIgfDaDq6Pg7FwbCndE1kazuwW37W4gWIcJ4Z+D+Mt9QLUWAhjUaCV3GZ
         auHL452BqaVTR12TiPVqsuKfSqWff5W4G/5xvxitWaDhSZnLMqu62a9s9w1PNLb20kjg
         /A5VHt/hI1hs14vbcc0L5mJXdwodMITD/7uqcFJFI8eeysDGp4Ins8Cjp4ehWJmeJUbO
         +V8zeR3zptJIQfm214JhEH5P3OxpSI7sNjlu13uUA3UEXbUILgA2UYh+wwt1n7L0nXHt
         w10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746518038; x=1747122838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01kJ9UREWk6Z8MO8rJuNtGQkQCdgEUCbi3nLRVMNP0k=;
        b=DeQI9nbMfPePQCF5M9rh3ernhNx68fmhUhMtGHt9yBtj7rVcjQh9lcIwOUvpwpwR8/
         4fwv4XLr8vWpx3OalEhwdAX0ymAPwME8fFWrNM5gOU8P9FbqPEvQDQVFvE+x/mbFGFFb
         uZebP3ZP3/Gt+fvwLqI+sMGRuJzRZycQPbS5CXAkf2wH+cOGlla6gRvSdk11v5FlSOFx
         zHMLXxc+UFxDEMMwKNh+eoEhYTcmdQGAIGvzum3Vq/3yJBcY0xYf+PzQ6g9ECNWPq5bq
         MCDcpkr9/VHMFfKK6nQ0BA0866ZQj41L1W17wLnHK2bu29wSew3wKZJDbMHs3v3GsJBv
         4bgA==
X-Forwarded-Encrypted: i=1; AJvYcCWKNw0itI9sEYEa1ouDUm746M1VoAizuPtiJDs3UilgyA1Yif+A8YDpPnAjl+hk2C3sl55Mtx0qqAThR5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWOHjF5heu/ujN3pB+Ikufon94gqIphJcgZgXfU+P5CQBMksmt
	kWwIdYl8JTOHiowHm2LWl7W2Iwye7G0pSy8Mo/q40K30BO6+QczEECH99t2Q2nI4EMjJWXR6nsZ
	quNZDxPA6s25JcgCTnOjnsYSJfDFnaNY8mrWQ/1hSfaPZc1Wm
X-Gm-Gg: ASbGncuYFbC/XJ66D2Hg+vYUF2TSgzuJ3zy9fSdDmMxRU9ubWvc/rH+8d+BuQwMoCa3
	ppTCndfL6F1m36+WW3kd2IXYuUIcBukDD/iDIgZa8fuEyqUsnD2kbMRxltnr7GQHzgCwGo9VhkH
	QZ5cQxDsc2DcHe+zd+jHD9LOro5DhDGMtnZ5E9KaxkLo8M9VWFLayN260=
X-Google-Smtp-Source: AGHT+IHycczXOp0YLcooZNerTLlbSq9H7Wn2zHlB9IvVn/LG+26tFESGOVxKi2vt2XlyGdxVkr6VpNWi09X2wzGONjA=
X-Received: by 2002:a2e:be25:0:b0:30d:e104:d64b with SMTP id
 38308e7fff4ca-3266d0f0218mr5543611fa.39.1746518038436; Tue, 06 May 2025
 00:53:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503082834.49413-1-marco.crivellari@suse.com>
 <20250505065121.dlEw6_SC@linutronix.de> <aBiD9C727RSyNtme@tiehlicka>
In-Reply-To: <aBiD9C727RSyNtme@tiehlicka>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 6 May 2025 09:53:47 +0200
X-Gm-Features: ATxdqUFeODjIYzcZXHjLF9gfCe4oZRSuKJTl9U7qtkMsreCjJ2xo2V6T_YnUNXQ
Message-ID: <CAAofZF5ZJ36vr_8exeMrnLXxD1u6aaTR3kp+oEztKQYe4f0__Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] Workqueue: rename system workqueue and add WQ_PERCPU
To: Michal Hocko <mhocko@suse.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-kernel@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

I will integrate the cover letter with more information
(also pointed out by Tejun, I noticed).

Thanks!


On Mon, May 5, 2025 at 11:25=E2=80=AFAM Michal Hocko <mhocko@suse.com> wrot=
e:
>
> On Mon 05-05-25 08:51:21, Sebastian Andrzej Siewior wrote:
> > On 2025-05-03 10:28:30 [+0200], Marco Crivellari wrote:
> > > Hi!
> > Hi,
> >
> > > This series is the follow up of the discussion from:
> > >     "workqueue: Always use wq_select_unbound_cpu() for WORK_CPU_UNBOU=
ND."
> > >     https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de=
/
> > >
> > > 1)  [P 1-2] system workqueue rename:
> > >
> > >     system_wq is a per-CPU workqueue, but his name is not clear.
> > >     system_unbound_wq is to be used when locality is not required.
> > >
> > >     system_wq renamed in system_percpu_wq, while system_unbound_wq
> > >     became system_dfl_wq.
> > >
> > > 2)  [P 3] Introduction of WQ_PERCPU.
> > >
> > >     This patch adds a new WQ_PERCPU flag to explicitly request the le=
gacy
> > >     per-CPU behavior. WQ_UNBOUND will be removed once the migration i=
s
> > >     complete.
> > >
> > >     Every alloc_workqueue() caller should use one among WQ_PERCPU or
> > >     WQ_UNBOUND. This is actually enforced warning if both or none of =
them
> > >     are present at the same time.
> > >
> > > 3)  [P 4] alloc_workqueue() callee should pass explicitly WQ_PERCPU.
> > >
> > >     This patch ensures that every caller that needs per-cpu workqueue
> > >     will explicitly require it, using the WQ_PERCPU flag.
> >
> > Sounds like a plan.
> > I assume the huge patches were made with coccinelle?
>
> Yes, this makes a lot of sense. I think it is worth mentioning why do we
> want/need to go through this major refactoring. From my POV this will
> help cpu isolation in a long term because it reduces unpredictable
> interference from pcp workers.
> --
> Michal Hocko
> SUSE Labs



--=20

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com
