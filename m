Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47108171092
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 15:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743175076; cv=none; b=pXSENA+k1l9kNGbqeBLREQt8vCxxlfRdVamVXXrZmf/KV3A8cNARMFTUTIv9IEuU5RvwJjb/MQUhNfV4F+jqyWTRoY24ZDyyvg0r3goiaUysE07L9/JjEP/5Rj66fiIPoaJWd0huuqbamKpe0nrw0VcGUMX5YRVQYInbigo8oqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743175076; c=relaxed/simple;
	bh=jEhtVTn1QWFoySaUXbkHkCIjovKC7NhTpAQFfzMoxEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gc9C7Hq90apUSapcD+Edue/OXS0O6fKxdkHV7cunoLoRG8lRZEG30k9QuppsCweHf3I433z2Klpe6mjGUHyUjJuRGZdXyZmpLQ1nL7vWbl7iE3UhguDy241NaCVx1ZwNLwtYfQPV54/NEa1G7VDIdKZ2TlBHBkysTFuxzQ63rpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+GsAMeU; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+GsAMeU"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86d587dbc15so2030369241.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 08:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743175074; x=1743779874; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Jn0e09I6pw9OL2TVwRIfefTbq7C/d6a62JusO5U0Kc=;
        b=Q+GsAMeUU7rxujJZW5HlZcidmoJGTmqztWqEmMhYlOiKgO2nbvkCR33/1mF4b3PbTU
         Qk5rGr1lxUDQAYA1DJkkPQK1c/IonSOj/mwXaDGAeFn2CWnvMLInQ4yKBmkoPrvZzkj8
         Pz9J6OX9sjFqQmTxbfXHgHbiPyema/fHMwr3xA1jGMSVIBJ8TrxPbYi79KMqsDzp28s0
         dLv734kL4k7jg9RYaRQ3D/GiXx0dukNvPfJgzqE649hDdmIut7WdDYjsdI0+LQld1K+/
         NpEXuHcGj0QKtJ2fuKs2u6BnVqloTemnyzhMgGA51i2VsONnV15yKD5ipRl1/SrjOdO3
         VZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743175074; x=1743779874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Jn0e09I6pw9OL2TVwRIfefTbq7C/d6a62JusO5U0Kc=;
        b=dCaXMoMNFrpO9D9H+TtWdxrg1Osp+y6cXqABvxiH5apnuYNEGqqTDUwENFoperCVE6
         OSBH6ZYmMQEYPKuO4CPHkhN0aPh+e29AZSjWG1hTG7pCh40cvCPdW1q5AXfqzJn5+wiM
         UF/k+IjQM7mZ5fZngeeA2KOoj7Ah2tqndAikY830IFJQ9EHa8k4yjE5Ievbpmxi2A/5B
         dqZHXPkFnUPgCiyCEDSjaJPOwVTeUQbCclwFn7QfJNZqsFgwyfzEApVBldZ0leyEa8up
         mclKKRV22x2XG2iSAVbmk0dh83J1RCV9lUmuyGWfiGJ0b8vHUQqK8k9XQ8DE9MyZBVXB
         G6ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO7qwYk777xiY5yKj9iORZtVWJnYCzjB9hqfZsx3lq7pMY2f6MLbZl9xoJdhtYBIDnxvCnTv3ZpB3EZk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhqmQIpnFUyQ+xXzKnaW09JTsrhDvjMm0+Ac0Qjvmvjmnl9Zve
	Wzzi789ERONlB9OrgM13/l2g2lkoCIFBiiRi121ThZIUNd5ri8m2uUmxEKcNBcpY7cxcKROOy/7
	ZLMoSspCd5HTemNPHZD2nvyA5ScE=
X-Gm-Gg: ASbGnctvBkLSsx3sIPz6Q2eP8p492ECS6DQFA2taHpiZUy8qJYiR6pnaM1FxcWejjFo
	qkDhX1ty3RjI9Wvb4QFdUogHT9XXDSFgXu6uroQDvXfBztQ+n7hwRH0SG3bF126ZeIRP0nvWR5q
	ddHZmQMZgNj7+6z3Qfk8oZjIIwRzw=
X-Google-Smtp-Source: AGHT+IEqrBEH5TDL81Y5j3ZIzOBqupeT+igPlWE2szhh0MEQKTWwtxcEL2xqXu4qp0Tz0FWhtqAPB67lgvSSjeeodZY=
X-Received: by 2002:a05:6122:889:b0:50d:39aa:7881 with SMTP id
 71dfb90a1353d-52610fc715cmr2676350e0c.0.1743175073764; Fri, 28 Mar 2025
 08:17:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743163800.git.abrahamadekunle50@gmail.com>
 <dd32dfe6c837d88dd13a546aadcb0bc207b997d6.1743163801.git.abrahamadekunle50@gmail.com>
 <21e624e7-c18f-6aa2-2a16-7cd46e706d47@inria.fr> <CADYq+fZd=C-EydjBmkP6Rh6XAJS6Kg1nM7zGhyLrGYiLGkZ8mw@mail.gmail.com>
 <acd2df4b-6865-d2c0-7bc2-babcc930d03d@inria.fr>
In-Reply-To: <acd2df4b-6865-d2c0-7bc2-babcc930d03d@inria.fr>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Fri, 28 Mar 2025 16:17:44 +0100
X-Gm-Features: AQ5f1JoIf6U6Zu3AD1_fwccY3uYCCIVmv3RFHYcdBK_5pT0_ajsEDqFotfNCPoc
Message-ID: <CADYq+fY-UNbpWeefGuo_Y5OG98AQRu1=uZYu2cqpONOTpar4YA@mail.gmail.com>
Subject: Re: [PATCH 5/5] staging: rtl8723bs: modify variable names to comply
 with kernel naming convention
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 4:13=E2=80=AFPM Julia Lawall <julia.lawall@inria.fr=
> wrote:
>
>
>
> On Fri, 28 Mar 2025, Samuel Abraham wrote:
>
> > On Fri, Mar 28, 2025 at 3:55=E2=80=AFPM Julia Lawall <julia.lawall@inri=
a.fr> wrote:
> > >
> > >
> > >
> > > On Fri, 28 Mar 2025, Abraham Samuel Adekunle wrote:
> > >
> > > > The variable names use the camelCase naming convention which is not=
 consistent
> > > > with Linux kernel naming convention.
> > > >
> > > > Modify the names to use snake_case in adherence to the Linux kernel=
 approved
> > > > naming convention for consistency with the codebase.
> > >
> > > There is another naming issue that checkpatch perhaps doesn't warn ab=
out
> > > which is the encoding of types in variable names.  You can see some
> > > variables with names that start with b for boolean and p for pointer.
> > > Those letters shouldn't be used in kernel code.
> > >
> > > julia
> >
> > Hello, and thank you very much for your review
> > Do I send that as a different standalone patch?
> > Or should I send a v2 after attaching the patch to the patchset?
>
> Perhaps find some different files than the ones affected by your patchset
> and send a standalone patch.
>
> julia

Okay noted.
Thanks

Adekunle.
