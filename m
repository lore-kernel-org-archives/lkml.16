Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFF91AB52F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 02:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744856985; cv=none; b=StkKqyw4X+geoNGV450syocz/WI2Ov/MCxvsBD8HQb8OaaZzxYvvpLNKPYIU5fAgIedffMdLMkU9WB+RWnH///uO1sdWGSE89YbXeSdjCC84H+kLRjKK59Ap2A6ugGllwjCr3cOerUR9aQkmnNWdnVYeOIKe4r9tIFIoS8PENHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744856985; c=relaxed/simple;
	bh=6UW+pphW9nJj9i6q808BjRh2mm54X0eNgjTHvKDcaXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D4vrsB0mhmAnCJzc5lNN/MLwh6oFA37BqNxnTHGQKDxkrNfhM5ot4Vf6vq02YPh86VDOZtOWn/5ul/FbDAq6i26mxnd7uiO4V2IrHL/SC1Ro4sQ3rZELyMff+Cxwn2gEU6+JLmFw9K2S/GQyBjvQmuH2f3iYLVZeNpfOJMHTM4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMu0MQp8; arc=none smtp.client-ip=209.85.167.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMu0MQp8"
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-549963b5551so324189e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 19:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744856982; x=1745461782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UW+pphW9nJj9i6q808BjRh2mm54X0eNgjTHvKDcaXs=;
        b=gMu0MQp8Apw4xR4znvJUqjyRaEnwT4BUHrLclgQV1r39n58gwhMrcnWSy7pMRVF5ML
         txp/yNqPYhf4UlRwWKV3scupajTxsKpaDVWqyplj2nGIhhVvgwFz++srtSoTrSl4MC+Z
         ybxdizsma6mMKIOrZYol1D/Wi22MPIhh1f0H/NWkbJQ+eKJsJi8FfCdFRRnlRLnXFRcY
         aLeVRZOculQwq9UYV0MwLZpX9QIP1AaE5i0wrxy2U+wzNxJsugd4sEoUowG8cMZOg6Ya
         /olfgHmrO+OZhHuVa0oI3iWwlj33RrnLEtgWvQCg/OKkCTsRxLo0Jowsa/FGDsTtoaJ/
         jFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744856982; x=1745461782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6UW+pphW9nJj9i6q808BjRh2mm54X0eNgjTHvKDcaXs=;
        b=OoA7xZlqBp3KTbCIgnlSQ/C+LYXA52ZIcjF4ymdEeGEW7A/Val1vtZGTGzKiWB7w6C
         XemvZVJZCPlbLuNDsOL3NC1QigXM1uxkeURXI+jKTRvML9M9LhnrvOGNkd4EeEb6aA6A
         yBFMpQE+MLaBhsqZOmp342pz8GuXzv4583gvjThm2Q8tL9g+E5/rIOBkzbSJnWZ2r4f6
         FWriQMkGifS2CgMFjbnA1OeKPdvlNSDF2RBBxNRN0rdOwC//a5Iz+TCP7tGHgNyV8ov0
         hF9OpzDbcWEt2l6lJvpljJL31FhBd01gAU5R33aFu91C88UsRmS3Mq1xsfx1y7GjM1/1
         Gaqg==
X-Gm-Message-State: AOJu0YwKSUtUh73aPKbWWHLDw4hDxIZUuhl6c0F17b/DN+NiKgpt3SFQ
	V70cIrhg5jaZMOGAjPkE2DA3WMsW0fLS4fjdfKyR4SN3gc7GPloSkA03CZ1Agl1O70pKS45Kr/H
	dt7aIOiIEMrO2+CUahpN+2+iMFVI=
X-Gm-Gg: ASbGncsHHXuut4TcBp6bysBlb3L726xvkG9kZzx9qcDD0CgZSPgpMBO3FheT43BZ1f0
	nXFdLthbiAO5bvh2To+kv2CpoYZZY0emtWwQou6DRqunyBZgPnhk8d6kqulINee++77JUSVfxk9
	/bVVg1Vzx10tWbyUYRQcHY6zKJZMCofCPdiQ==
X-Google-Smtp-Source: AGHT+IEuTxrCKchXylugtbbFB0n8PhnMW/W7EUsoZqCu2l0kl58R5ZjDOaTPudgH+wtLDfMtmERcUUCzR761JH4a+iA=
X-Received: by 2002:a05:6512:3f03:b0:54c:a49:d3ee with SMTP id
 2adb3069b0e04-54d64a7a4e3mr1419476e87.3.1744856981612; Wed, 16 Apr 2025
 19:29:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407134712.93062-1-hupu.gm@gmail.com> <CANDhNCosvML9XKH8HV1QBXKzxt3zMWxzsPSUfYxoyPCORf6Krw@mail.gmail.com>
 <CADHxFxS+qpmD8r1uxru+VWLj=K616=jLKbBgUR3Ed7ZBY1gidg@mail.gmail.com>
 <CANDhNCqgCGtWubkuMpn=GdfLwP6d5kMEvbhoQL4oef5yf_74ug@mail.gmail.com> <CANDhNCqv0iFMJanxj4uTyOHGUGxfCqb18Ku+w5y9JFKRm0M=Rg@mail.gmail.com>
In-Reply-To: <CANDhNCqv0iFMJanxj4uTyOHGUGxfCqb18Ku+w5y9JFKRm0M=Rg@mail.gmail.com>
From: hupu <hupu.gm@gmail.com>
Date: Thu, 17 Apr 2025 10:29:29 +0800
X-Gm-Features: ATxdqUERt9n7rjNiKo4-isYQHXZbgQ1AG3q-6F_I97mh1Xvm4UGTXlyNndRAOpk
Message-ID: <CADHxFxQoNOBCOMDsh0iNrdD=ke=YweVZgZrTWbBQRA8SYy9McA@mail.gmail.com>
Subject: Re: [RFC 1/1] sched: Skip redundant operations for proxy tasks
 needing return migration
To: John Stultz <jstultz@google.com>
Cc: linux-kernel@vger.kernel.org, juri.lelli@redhat.com, peterz@infradead.org, 
	vschneid@redhat.com, mingo@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, hupu@transsion.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 8:24=E2=80=AFAM John Stultz <jstultz@google.com> wr=
ote:
>
> Oh, also I enable locktorture and boot with:
> "torture.random_shuffle=3D1 locktorture.writer_fifo=3D1
> locktorture.torture_type=3Dmutex_lock locktorture.nested_locks=3D8
> locktorture.rt_boost=3D1 locktorture.rt_boost_factor=3D50
> locktorture.stutter=3D0 "
>

Hi John,

Thank you so much for your feedback.

I=E2=80=99ll follow the methods you=E2=80=99ve outlined to try and reproduc=
e the same
issue, and will get back to you for further discussion.

Thanks again,
hupu
