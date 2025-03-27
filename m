Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799E218C03D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 06:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743057613; cv=none; b=FTwCLZy2aUNAsvHxs748HL9lUDEAQrO1gR1Fh0rL1YWEuSYRbN19tLWWBJBgFtS3jFbCWUQ6ZJkaa+5pfOOnXLAhB9Vw8XQegmTMmUmowpNvH27loN3K6mS5nklquce/mghwj1qwyWjgnPnUhRrVZytqxbSbZNf1a6R+22N3COs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743057613; c=relaxed/simple;
	bh=hVhB3pfbSavGJmn5ih9KdVU6u//4aoMC7TEHsPVQVmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ijFyUT63sGObShgEnVbtVozOlK30YoFpfMPtVBXt47iPyuU7AJeUTsHvI8QLlA3Gu59UPO5VUvEiA/NcP+mhRsJg+cAajoIcjUDZRqjDysrf9wRl7xzetUGc5oKGBqQ5j8CXA+NN4IQMNXKsnu6KMGlvCZe7ZfYDbCtt8Cndvdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dk0yZ6Aa; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dk0yZ6Aa"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47692b9d059so9336411cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 23:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743057609; x=1743662409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVhB3pfbSavGJmn5ih9KdVU6u//4aoMC7TEHsPVQVmw=;
        b=dk0yZ6Aa82hg8NmF9O1fmtmCK2X6oC4v2KOK/2AVdwGNwKP8mM93iAPmD/gdWmj4UE
         zmt5KPaqr58u3nPs9e9zZVVg8pxmoKjHcgXLhs0gbTlyOJ1RMdtZad3Fon9h27XPgfME
         itrYlUpqC+ZH5uN2EtykDmhxCY+h72RuuRKaET/DfEI3BJvhI5bTlsgpnq4FIpRvAGoM
         qk521t4It5l+kreUOV4S5B4boxJczjiOOVlzUdIADyLMAHd8vVNlZVpQz0VhVXUUBrII
         ohZstWRc+iaxc9RirbL2vVhAV5V84EJY1IKi007cpk2Z5CLEvOovJi5DXz0wPRQJh4wX
         YbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743057609; x=1743662409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVhB3pfbSavGJmn5ih9KdVU6u//4aoMC7TEHsPVQVmw=;
        b=TR6KJI9iwjvOusi2o1xVl2fUF5zJ1xJCS3fwyVBkqvHdpsuZSaoINAY9qKauRV3KNg
         z+IqM6qXsQVqKcz67MlGhqvDKs4LiA65N6cu4l3O+hdBerA1dFT3yloVlJlzSwDhF/2j
         OHEKtYrQmWVWyiBjSklqzK3qeclgcALcLOnIS9ngOP2CizMpW5o20fFpdxosfx6qcVyq
         otOiUYi1X1bAyx/Rodokn8lCswSfBLu2fMfIc9GqlGKbuoMYV2TM4EOcKLfHPlmAeTdU
         ++B2eydjdT6OszIv8uUqN8A278fxitavcAYaj6WbYP7tv4AVWlGEs74MUbBymP8hYci7
         zcYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKrIFoFfaVSK94wINLbp4cAHA5dEpDfLba6gXzYo82jtlTZxIQ5cYW/5ZIRj78QN5PnY5t1IUPTQ5qXec=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQiq4rgH34cHrcXTeDmFy8DJw062IS7St1LwSi8Ma6jfCnRgIB
	vazSEjWUWDD5fX969ts2m2tkiO+VdeuJV1uXmfmDcx5vk88gxsV9tAJH2wqEy/JZh2eAre74q77
	Jb0w9IgGm61aBoMoyHEy1JP/Cd8MZ0bwyqabr
X-Gm-Gg: ASbGnctyzv81/yWI4IoJO1ssSfvuKpnRp+biw+4TWoWr8rs23GRjaXTXgbcxJgI2UHh
	K/uosyOWQc6RrbMkpYYzxzWomIDXil4TlTB0MFC8hSMvYEcV2uyZByCq9mlDpp9gh2tDuRgqkyn
	33k+5jSUHyNZ6LPyrb+DqEAM02NKM=
X-Google-Smtp-Source: AGHT+IEM0+rxaQ5zCqmBUxN4zvMYmyJ5g+nu3EDBzsma/EgV6CrhhJPxV6MT8hz+Jt9uHg2FWusC7jJC8D1fgCu1IYM=
X-Received: by 2002:a05:622a:5145:b0:476:a4eb:10a5 with SMTP id
 d75a77b69052e-4776e0abbbcmr42147561cf.12.1743057608966; Wed, 26 Mar 2025
 23:40:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327015827.2729554-1-wangliang74@huawei.com>
 <CANn89iJn5gARyEPHeYxZxERpERdNKMngMcP1BbKrW9ebxB-tRw@mail.gmail.com> <df2d0ac0-c80e-4511-9303-3ee773c73a22@huawei.com>
In-Reply-To: <df2d0ac0-c80e-4511-9303-3ee773c73a22@huawei.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 27 Mar 2025 07:39:58 +0100
X-Gm-Features: AQ5f1JrtUReUuY-3assA0nRUX3KVWYXbt4WVNWESX6MNVW1HNkE5q-S8tpom3HE
Message-ID: <CANn89iJdThGoaVc3LbucK_QGe1akNzmd5YOhMqmshwh_RfOn+A@mail.gmail.com>
Subject: Re: [PATCH net] ipv6: sit: fix skb_under_panic with overflowed needed_headroom
To: Wang Liang <wangliang74@huawei.com>
Cc: davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, kuniyu@amazon.com, yuehaibing@huawei.com, 
	zhangchangzhong@huawei.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 7:33=E2=80=AFAM Wang Liang <wangliang74@huawei.com>=
 wrote:
>
>
>
> You can get the report in
> https://syzkaller.appspot.com/text?tag=3DCrashReport&x=3D106b6b34880000

Well, please provide the most accurate stack trace with symbols in
your patch then ?

If you spent time reproducing the issue and providing your stack
trace, please add the symbols.
