Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C15717A58F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622578; cv=none; b=gxwHk2rw8nn1qmepbPG/JoH3HqrwTv548HdToENok1e2zGvS7a5Fv0ACKUHuM+aEZPFIc4rEhxBVf47BqVRV0FdjsdgAQCA2W/LulhELLcLvC0u93JBnAFectmLFkAW8oMM/Dr48CZpeKxilptCqpN6yKsGa/5cVEsG1gDX71FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622578; c=relaxed/simple;
	bh=msWRTN1Pd68Kddfew//Fbs5bL/LIs12Y4h6U9dPY/Zk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p4UmdJQfG+O4yRqgSdEez2o2rMg/Jxc3de7jahDgD+zgtO8+M7udSkrJm66ab/LPhi9pw9T0gMox6GZzG4NNekTadq5qklzxxGDo0BlSd3efUrF+s7tg77EWKPdTl8eBsCXLho31l0wD5MfvmmeAODwjw+2dIJo1G8cjrUn0rDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=haVibpTb; arc=none smtp.client-ip=209.85.208.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="haVibpTb"
Received: by mail-lj1-f194.google.com with SMTP id 38308e7fff4ca-32a658c4cc4so52603861fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749622573; x=1750227373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msWRTN1Pd68Kddfew//Fbs5bL/LIs12Y4h6U9dPY/Zk=;
        b=haVibpTbqpwlWtUSwzUIVae23cG/xfcsPuQ4kWRnzQ7u5itAzgUoStJ4roA0Ip3Nps
         UjHbP+e75ZkamsMp/5diHSBohjJLz+fNjwXSs+LPR2dOGvIwrMz5P/j344iVqBc8nVTT
         NZSs2pFVNZSrmm65ZCRITXgEVo/o8bjjcHlL9WATXzWxQiLdTSGLe4TH0Is0YjsqzMtW
         mtatTmH7eXe0x7SoOo2pC7TBahL/jzMD0jTz3tNq+DY7oDRzqOlE3sagM2RXiNZagXfU
         bcIjjDmv6urLkfqfqqrcDFGIb0N+xN8XpMfJa0aoh0ni1NZyzRbNTlujo9blOgBHomcc
         sSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622573; x=1750227373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=msWRTN1Pd68Kddfew//Fbs5bL/LIs12Y4h6U9dPY/Zk=;
        b=PgZdH6uSQiO/8rNzkVje7ldLbRdx0LH3l87JW3P7TRDZm5i25vq6JTTZMr64HLlkR4
         s8YRhgmKcxcWy3cLH2LH9Tqg+rgv89KgEVYJxbKvlZTARUt3u3BkpfRAbrzGTMJU5YXZ
         KD4M6Qm5+c9otyL8DCDf4ceiCkdtBq4Ymd3P0BlWmkbx/7PqM+kAuAT9TJENGDYoae/X
         uQ9sMzfpa1pC7RYE63olov8VktA96+3mKC7Wg5WOlcWbYUNgxqveQA8TLjO/mruyzyPc
         qWyS+Rt7wvyr74b0Vv4zcILXgQzSuTIz/FTPdyB4Csbnt4gKXhBRY9IFTR/OTSeslIwh
         Vndg==
X-Forwarded-Encrypted: i=1; AJvYcCXvw9GMipYmQv0iDaQQ6kSlxX6jZcpjiLgGGZEN1G016s2a8binEgxT8YdrN9AaXWZnHmg/cnlEufqEbw8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+fg2acUBmNjwyqHnyKMcuLh10OIOTmBUu09ZCgX0ovy9BuozZ
	SbBKSGJCVrW5qrZhZy/2F4klfbtiC4ItDHWZIR8b/AaVyC7NgvcIy+XvCPVvSFkiVL/a4lR2FUi
	iDEReh7FEi9T0Gzk9JBndFDG7UMNGaBE=
X-Gm-Gg: ASbGncvsPGMvUv65JUMED+e2n6ZUYuXlAqxQEqyuhfJYRTJ0QD2Bw0t4sNalBYlRAQU
	n6FFX98hhT8FxdMsf3x4lAlzsKyCGVUyO2p4U1YfkOv4M/cF1IKQ/TJeueFS26HE8kz9al2B9y9
	BVuCHxD+hg1Rs7y6iRiYuGQd5r7RaV4mKt5YOC4eLnNIERtp7mt9KIcmY=
X-Google-Smtp-Source: AGHT+IEBU9TZ9Mi9o3rgI1uI6Pmk3EX/JHblRMOk8+n2Q+nREohu9jIDALkZywBxO/03UHNfzZIsmnbcBosjY+e9YHU=
X-Received: by 2002:a2e:80cf:0:b0:32a:83b4:c13f with SMTP id
 38308e7fff4ca-32b21d29062mr4056221fa.9.1749622572969; Tue, 10 Jun 2025
 23:16:12 -0700 (PDT)
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
 <CADHxFxQ8GqndiKGT2z2aUFU5qQQSU1QxQR1CrHsaa8ShrJ6D+Q@mail.gmail.com>
 <CADHxFxRN5yPwk6jVcnz9dpsZaFk8=91Jto9euBiOnrYzqncfdQ@mail.gmail.com> <CANDhNCoLYSFfry3bKhdC+YC1JYhtcgDpGLHTt-5v_4yDtR9QQw@mail.gmail.com>
In-Reply-To: <CANDhNCoLYSFfry3bKhdC+YC1JYhtcgDpGLHTt-5v_4yDtR9QQw@mail.gmail.com>
From: hupu <hupu.gm@gmail.com>
Date: Wed, 11 Jun 2025 14:16:00 +0800
X-Gm-Features: AX0GCFthRjFyl940oixLk1X-rN3FVyXWe_SxuAfiFKXKMKu_FCi8LXInyGw8x9M
Message-ID: <CADHxFxSiHJANrsXaOiSoUoBh8Z5Btrc4dRGHJwzLj4ebvy6ktg@mail.gmail.com>
Subject: Re: [RFC 1/1] sched: Skip redundant operations for proxy tasks
 needing return migration
To: John Stultz <jstultz@google.com>
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com, 
	vschneid@redhat.com, mingo@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, hupu@transsion.com, Suleiman Souhlal <suleiman@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John
Thank you for your response.

On Wed, Jun 11, 2025 at 1:05=E2=80=AFPM John Stultz <jstultz@google.com> wr=
ote:
>
> On Tue, Jun 10, 2025 at 7:32=E2=80=AFPM hupu <hupu.gm@gmail.com> wrote:
> >
> > Hi John,
> > It has been a few days without any response to this email. I'm
> > resending it for further discussion.
>
> Apologies, I'm swamped at the moment with some other items and haven't
> had time to give your suggestions enough serious thought to reply. :(
>
> I have made some slow progress on a few items. Suggested by Suleiman,
> I've reworked the migration logic to be considered after the owner
> on_rq check, so we avoid migrating tasks to only realize they are
> waiting on a sleeping owner and pulling them off the rq. This should
> help reduce the number of migrations we make.
>
> Unfortunately I've also been tripping over a crash with the full
> series (not the portion I'm currently submitting upstream) that often
> takes 30+ hours to reproduce and extra debugging logic seems to make
> it even harder to hit. With all the other tasks, keeping enough
> context in my head to make progress on this has been frustratingly
> slow.
>

If you'd like, I'd be happy to help investigate this crash issue. :)

To do that, I would need some additional information, such as the
vmlinux file, coredump, and the source code at the point where the
crash is triggered.

> I'll hopefully have something to share soon and I can
>

Look forward to hearing from you with good news.


Thanks.
hupu
