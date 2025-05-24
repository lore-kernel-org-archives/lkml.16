Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74FA191F74
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 02:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748052617; cv=none; b=RTw40VVhgrz/mUn+jZQwdG3I2Q1vlWhEHnH8FL9A39/wS7K7aIpRoIkjC25rAuG9ei7HXPilNnTjojTooxWfc5r4ns3DiSxt0Groo7G4nLOued8qHbYAdVZXJ0lCwKat6ZVI3GcbxZQlSP5wdQCMi+tyi3K/CFKlwPFrutMZp/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748052617; c=relaxed/simple;
	bh=o4MvvKaZWgzzKt41LfWGF6XxHz6DvTMbHLbGblGx36c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gN05clQuAkZ5PPm+Gm0nbC3/Oys0e01QwH2QkcbkJxS72g4vTzO5OR2DuYQ/S4syz9E+0sdYEoRGijTa7aVrxAaLbouZCxjt759h5knhs0eoa0K7BtgB+CVepD23O1vCo0Y82NsSAn4xYO3qKhxC1TF7djwZsaP3MdbjoKXszbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=PU8clbf7; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="PU8clbf7"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32840b91488so4050771fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1748052614; x=1748657414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7TEkWtOA1fKJ9Z3MfHUljq+ctXCp/GLeazv/q5J3eQ=;
        b=PU8clbf7ukGyCeKd2uECagqv+9gGN324heIc/TboTLadTrNfcI6gRgMdVIJs08wmcn
         X42OPZ7l+1wt963IY0v/9i5xk+RNeqJeq96ubhCD3XldzXdRAThqlHFbs5X5cUd7kx3p
         8wOv5YGVujzxT7P+ZiRSQi3dovTWwEZIcQ/rcFG1Xircbe0iXKQYpJuky/gFsQ/uijyX
         bqR+6lo60OCKASBDJvBjFVuzR59Xu5RRKQXMpANgS1wExW+DYfPnZOTVMnWUKLMDIAG5
         WCoMTm8ajiI2TUS8mQZuvWeSRE5jWGxy27des1VDojRxzIUkem86+j8yaZaKS1QNlpd4
         JVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748052614; x=1748657414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7TEkWtOA1fKJ9Z3MfHUljq+ctXCp/GLeazv/q5J3eQ=;
        b=TR9JiCLbmmaJv/HhBxI+n9Ul0Er7Zge/22YeJGWN2XfvbDMgW4pIIixY7qqwTUvSSm
         kYdXVDv1LAEO/5EsKJTZkodFGE3nQc9Rk1uvE32eB4jKEIrQMi+keuLB2gHc1mQYGGhm
         fNrw91o3FXX1nvBWQU14/ivNAgEk4zzti4da52rvrc+S9ZDKARDL3lRBDkbKnG0xccDT
         dc/9gV2xLNdKGRlM1cJ8HPfVVEJOb7vCifcKdbhE9cn1v2IDmV1AygzA0UBsXmcP98ZV
         b9JcVrawPaPdj3BboCI+j4LgjjscCqCI5mCU4ZVVvUGgW9+MM5Cdn2Ot/yNSZhN+dTqv
         kv5w==
X-Forwarded-Encrypted: i=1; AJvYcCX90dbLIWYn+l8KnqqvKqh61mfx4zfFzhwDxY3l7gMpXuJtezvK3HfGntoeV4t/Jce3Dv1Y+CxUjTTgMGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB33mSiYcke4UeGQNzHTSfqtddmkLGA6U9LutVzK2RIT9x65kT
	HkSsuHuz1+8H8DIczSIFPd5fxsMd+LmhP/AMMOEM4LV1v3cUookhABSYpCrztMNtD9o8xS+/JD9
	VsSYbY5dBJbV6fh3ExRJE+PPjD5T9VAs9zuw9I8IG4naMgJdwgxX1lIU=
X-Gm-Gg: ASbGncsnu47lXDhnOfmqXJ0D1+LccvxISPbT5ul2D3bIygDLg8WLgMWx4QZTRW5GObl
	7aMms56q6BsE3/uDM5I+JV/twtRZavoWFO6E4y/YGv+9Kxdj2f2JZkbMeGfDpQjMNJx2Ut5kDcj
	6OnG4w1ouF2yF0FSbC+e6l5B2rdXFOftOiUxuEKes=
X-Google-Smtp-Source: AGHT+IHY5XW6K8OSyPXphlOcDwKBn+R3ju+NDtjgbho1Jx9msYMJnMGN5LmUHY0PKXrBeRjomdAYIIuLKlv3vv3K5ec=
X-Received: by 2002:a05:6512:1242:b0:54e:751f:40a2 with SMTP id
 2adb3069b0e04-5521c7adc37mr417766e87.14.1748052613881; Fri, 23 May 2025
 19:10:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520031552.1931598-1-hezhongkun.hzk@bytedance.com>
 <8029d719-9dc2-4c7d-af71-4f6ae99fe256@redhat.com> <CACSyD1Mmt54dVRiBibcGsum_rRV=_SwP=dxioAxq=EDmPRnY2Q@mail.gmail.com>
 <aC4J9HDo2LKXYG6l@slm.duckdns.org> <CACSyD1MvwPT7i5_PnEp32seeb7X_svdCeFtN6neJ0=QPY1hDsw@mail.gmail.com>
 <aC90-jGtD_tJiP5K@slm.duckdns.org> <CACSyD1P+wuSP2jhMsLHBAXDxGoBkWzK54S5BRzh63yby4g0OHw@mail.gmail.com>
 <aDCnnd46qjAvoxZq@slm.duckdns.org> <CACSyD1OWe-PkUjmcTtbYCbLi3TrxNQd==-zjo4S9X5Ry3Gwbzg@mail.gmail.com>
 <aDEdYIEpu_7o6Kot@slm.duckdns.org>
In-Reply-To: <aDEdYIEpu_7o6Kot@slm.duckdns.org>
From: Zhongkun He <hezhongkun.hzk@bytedance.com>
Date: Sat, 24 May 2025 10:09:36 +0800
X-Gm-Features: AX0GCFtSw_BI9F2a_IL3u-e95lEJrbiFfnBD-W_brUziurfcRh6cHEni89aqwos
Message-ID: <CACSyD1N2CjY-yqcSg+Q6KHKGzzQnio9HjwUHutup+FEX08wg0g@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] cpuset: introduce non-blocking cpuset.mems
 setting option
To: Tejun Heo <tj@kernel.org>
Cc: Waiman Long <llong@redhat.com>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	muchun.song@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 24, 2025 at 9:14=E2=80=AFAM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Sat, May 24, 2025 at 09:10:21AM +0800, Zhongkun He wrote:
> ...
> > We move the task by modifying the cpuset.cpus and cpuset.mems and
> > the memory migration is an option with cpuset.memory_migrate
> > interface in V1. After we relocate the threads, the memory will be
> > migrated by syscall move_pages in userspace slowly, within a few
> > minutes.
> >
> > Presently, cpuset.mems triggers synchronous memory migration,
> > leading to prolonged and unacceptable service downtime in V2.
> >
> > So we hope to add back an interface similar to cgroup v1, optional
> > the migration.
>
> Ah, I see, so it's not that you aren't migrating the memory but more that
> the migration through cpuset.mems is too aggressive and causes disruption=
.
> Is that the right understanding?

Yes, exactly.

>
> If so, would an interface to specify the rate of migration be a better
> interface?
>

Per my understanding,  the interface of migration rate is far more complex.
To slow down the migration, moving it to the userspace can also help determ=
ine
when to carry out this operation.

Perhaps we can give it a try if there is a elegant code implementation whic=
h
can help the people do not migrate it in userspace.
If that path doesn't work, it's okay for us to disable the migration.

> Thanks.
>
> --
> tejun
