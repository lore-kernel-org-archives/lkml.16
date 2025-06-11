Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C808F5B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749618320; cv=none; b=VnoE8G2Z/NHPtazs+ptyHOrokHMo5Yz4Cz2dl9caKjchVMtI4HM51NmZ0FxjEQq9cjOBE/SRmdqO+z/NB9f3XYqu6AnMVldk7vhDMF6IAZFlJZMnZUlUkYTi2593gHKn0cFazWWmY7a1dd+ZLY2pqugKUUpg+wFf+KcEWB3E9KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749618320; c=relaxed/simple;
	bh=kkmdnNGTSHDm5LljW4hOlyUUxAgOmYXmbFid0Wnb6eM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MoTFfBaA42/2U7Zu8E2YS5fwKZTdUuOj0PPuuGs8ldJ23Ar/fMe7vgARS7A9r9mipBWEwptZht5EGb5EUg6kGxH5guZrTJ9LaUV698uYQ3YRf+76BVvAJoCYzjGrmmKPPYKDxOpc5Xwjxc9sGuigvufFUjbMy8ln9B+sBh2jaBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1eKrc0AJ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1eKrc0AJ"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54e98f73850so6555935e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749618315; x=1750223115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkmdnNGTSHDm5LljW4hOlyUUxAgOmYXmbFid0Wnb6eM=;
        b=1eKrc0AJAn+KH0juRZ7T1Ndw4yPJULIsk6vQv763XINW8Omz+ZE+f0sODebkUIDUHb
         +mCBWi00HcGzNEUMD1OYNsWAMj1eCf2lCHUV8ahYstf2FeCIJyn/CnIJNZ81Tm9Cu5s9
         zlrQq3Wj6B5BCyc+bpSxQgE/eEjEdFYkotrkTZYjs7KFxz//5S6wK27WewRNiFypQsvm
         mBUmwZ221JtfhC/IAKkyQ8HSLYxLu1XRnRQot06+bV6xz7Io1rZR8nfGNuysAg37MYCt
         eUfHfeeqOANrK4cnXDl9/1I5U9U0SzxOGwNMsXh0Toag5sQZolQe+nq6LlqeTesdqc94
         eT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749618315; x=1750223115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkmdnNGTSHDm5LljW4hOlyUUxAgOmYXmbFid0Wnb6eM=;
        b=XIjBlxOAVcapAqJ41w3pY+PVLQSEwxip+HQcMPyCf7z7zNI8nJ2Wr7A0fSfciXbvCp
         4vmRy2VMPwHMNPQOu18vmM1LL1XntBHfVUhkR7nQCCsIuw9YtvCBnUSBnnM0sEfQDJae
         drxtQM/6NdG5U8O2Om0XsffXImx5GZOuFfCX1rKezpd64ztxIiPYnFfLJ6/EZGnWnecB
         KtAgL6i1HQHDiTmGsjzh/VziXFFvkXvsCpUsX66eU18wXQ0RIT+0GL4tHGkz7da9dAOj
         PfdVRCEE6D4M1EwhMjOYox3ebJ5SVnOtC9NVEqd01/PQkEKdSc1rR9JtASLypdrmGVfZ
         Qtfw==
X-Forwarded-Encrypted: i=1; AJvYcCWkhi1QvDzixe29cdWdCvaKdNDOO+J57ypSe+KtUSj/824oIVkQ0RUWWS4E18BxcSSHrw2R52bMnCLtb3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLz/qKzrbGtm3SEcYriX6ndV6pMqqwMYQGrR3wZ4/G0uYc23Ex
	HGdXaId7ldp/VoSKAqvKzWSOayORx4LGpdES212AAnzxFEG4NgejoiHMLna6qEZ5Ykkn3l3u5u5
	4OGsYfHraWdVUDv3u6Vw8rLJ/gY7zeRb35jVad8s=
X-Gm-Gg: ASbGnctyuT1YC/FMHNeJPFBw5YkOaGeRxh/orxKVL9Ijrz4gelS5QPP0w5+B2zLfU2u
	NCR0RzS6Qgk2BxJ9aZPE5ICyK7jx8FouDC5C+xNRUfgkOkX3g7ynWeNW2tjkC5v6gAboGmNxcLd
	YwsYH5Z2pPcPfn5RDb9rMKWU9YABUQZPGRNXgJr8m6srzfjJ57BL8wVqyUJe9D2Z0fTMXSfnPTg
	TwaUW0QaQ==
X-Google-Smtp-Source: AGHT+IE/fprRL99S53wa27tr66htoJWBBEWowogykcX/nE+6mri0imeFAJs2j5ZZl3Go8XECmghmkFAhn+HG+abIAOE=
X-Received: by 2002:a05:6512:6c4:b0:553:2868:6358 with SMTP id
 2adb3069b0e04-5539c2194aemr614461e87.35.1749618315030; Tue, 10 Jun 2025
 22:05:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407134712.93062-1-hupu.gm@gmail.com> <CANDhNCosvML9XKH8HV1QBXKzxt3zMWxzsPSUfYxoyPCORf6Krw@mail.gmail.com>
 <CADHxFxS+qpmD8r1uxru+VWLj=K616=jLKbBgUR3Ed7ZBY1gidg@mail.gmail.com>
 <CANDhNCqgCGtWubkuMpn=GdfLwP6d5kMEvbhoQL4oef5yf_74ug@mail.gmail.com>
 <CANDhNCqv0iFMJanxj4uTyOHGUGxfCqb18Ku+w5y9JFKRm0M=Rg@mail.gmail.com>
 <CADHxFxQoNOBCOMDsh0iNrdD=ke=YweVZgZrTWbBQRA8SYy9McA@mail.gmail.com>
 <CADHxFxRd66FB6=wgY2-NLxqiMGZui+um+h2LUe4+hwXabdUpVg@mail.gmail.com>
 <CANDhNCq+xE4dpecHio2x6TJXMXxhQjrDk1oCon=NR2b+k0Y9yQ@mail.gmail.com>
 <CADHxFxSVdt_oG=J=aJDfkOcYEBScUxKV=NZNUvgtkAj6sbWvGA@mail.gmail.com>
 <CADHxFxQ8GqndiKGT2z2aUFU5qQQSU1QxQR1CrHsaa8ShrJ6D+Q@mail.gmail.com> <CADHxFxRN5yPwk6jVcnz9dpsZaFk8=91Jto9euBiOnrYzqncfdQ@mail.gmail.com>
In-Reply-To: <CADHxFxRN5yPwk6jVcnz9dpsZaFk8=91Jto9euBiOnrYzqncfdQ@mail.gmail.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 10 Jun 2025 22:05:02 -0700
X-Gm-Features: AX0GCFuZwQdCp3e8rumLm3fwLMSSYdxZSsEoadxmThU3N3eI-bhVyTKurz3AysQ
Message-ID: <CANDhNCoLYSFfry3bKhdC+YC1JYhtcgDpGLHTt-5v_4yDtR9QQw@mail.gmail.com>
Subject: Re: [RFC 1/1] sched: Skip redundant operations for proxy tasks
 needing return migration
To: hupu <hupu.gm@gmail.com>
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com, 
	vschneid@redhat.com, mingo@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, hupu@transsion.com, Suleiman Souhlal <suleiman@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 7:32=E2=80=AFPM hupu <hupu.gm@gmail.com> wrote:
>
> Hi John,
> It has been a few days without any response to this email. I'm
> resending it for further discussion.

Apologies, I'm swamped at the moment with some other items and haven't
had time to give your suggestions enough serious thought to reply. :(

I have made some slow progress on a few items. Suggested by Suleiman,
I've reworked the migration logic to be considered after the owner
on_rq check, so we avoid migrating tasks to only realize they are
waiting on a sleeping owner and pulling them off the rq. This should
help reduce the number of migrations we make.

Unfortunately I've also been tripping over a crash with the full
series (not the portion I'm currently submitting upstream) that often
takes 30+ hours to reproduce and extra debugging logic seems to make
it even harder to hit. With all the other tasks, keeping enough
context in my head to make progress on this has been frustratingly
slow.

I'll hopefully have something to share soon and I can

thanks
-john
