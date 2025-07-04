Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351CA2E36F3;
	Fri,  4 Jul 2025 20:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751661076; cv=none; b=BRxGsX68ISsyqHjn+MIWoPoEe7Pk7tFHGM7FtStD2uokLyXthF+EcSbtBdK3Gz/ow958WZiOISYOJvWI9pZiciF7F1bIThk0FR0HX/eUvs8806ptMYzOI9isv/61CNRCP3wNIs++tHzhPfUYnRqBJe1R9je+Qgh6AzUrmVzFQ4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751661076; c=relaxed/simple;
	bh=r6JGhvkS5JtcXutvF5CS2RsKaMnLiutGCf+jWDK9Q/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IYhe89O6kBfMQx4CzhhiZrIXP/T9V+3mqyUSukwaPoBDoJtwJQSVYlz/PuZiE/fxQUld0h8ItZ/eJkPLHjLMCkKU9G1tit2hk4KdxfwtwO0Z6dysDqC8FPqnbX18XKvBL0hUdd08sWcDNyLPzPQdbE1gW/sYdR3xFhthROh4+x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCQsWmtW; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCQsWmtW"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32b3c292bb4so11440571fa.1;
        Fri, 04 Jul 2025 13:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751661073; x=1752265873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6JGhvkS5JtcXutvF5CS2RsKaMnLiutGCf+jWDK9Q/k=;
        b=FCQsWmtWC08heH0vy41s7aoUjVAOhtrwzvuu0zh487gqbNRKa/JnOEC/fImeSG9ibJ
         xIwvWucRnzlpwCMknT5LraQfucpLASBer6+SK3oBHy9ZaDdXkec3TY+M3Xl4a3AYPMsR
         17ZpXO0dAg1ToBnrVXNQAF3hh1EsGxhXSEwBlEX9E/dfYCCUO4dd5/R20u0QwSAgQiHx
         hRrJ23AJJlpRD7g3lLaUw1yfxGDG6qAMa8j/ofaIpJacZav2RKPV05QV73HR2Za72lI1
         9oH4aSU1IyqjYiD7A0SIL749wfMEjopyvNK62/4D/8XJUICPgYjAWWFwp4wIDNUiwVk7
         NPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751661073; x=1752265873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6JGhvkS5JtcXutvF5CS2RsKaMnLiutGCf+jWDK9Q/k=;
        b=oh46pvYMAGyF4/65aID3kRNkpGs2FIkKZGAFaYuwpoMC/4M5T8sM6ASjt3OjwqpPaE
         ayIU2gRyNh3pkd0R5YrafbJIy0eExZTXpsM5Et6enCoy0b1QQT1WtFdryNAMSYCk9XCR
         8FVyDwwqerl5vJmEhLbepQ2EACGHswXPQ2AKrl+3zDTENe7Y7lhuQ5aMrsl0H0Iz/ttF
         4V/x/lkjWCo1wkeLZ4nqdE/tRQrpWTCDdMXCHIR4xB66MpcKP1VYzW2FBX6zWJeZJe7v
         dMF1i3LDp1XM/kLYdSweXTFSj+abEqCT3s5HzKLuwVDhPZ01kFTcRHS5t1SzR9bIiBVl
         cWqw==
X-Forwarded-Encrypted: i=1; AJvYcCVPZiMkDxFHh4Lj+967o9mmJk2hyELZML2ap/tqHsqCP1drT2l2Fey+E85gVgs7xH8gbLrw4bKuFysalSs=@vger.kernel.org, AJvYcCWCAub7t7z+XGNCZnT3OquLM0u9MNNe/wyldHQu3lBCaFquw3DAJxjmsNO+9/cJW0IUei4s/sm8/TABK6DLbg8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLQxtT4z44/3CkkBbVxeGhGCJh9qVQCV9cQMFjC/oXNQT3yepK
	fAfGTesaeovcccSO3KuYcB6lRJ8GXmV8djN1LvxZ0MRZE5fepHtA+kHvJXt9aAVk00GmthtaYA/
	SR9g86HibQqRu937LeARko9Urz/o9Elk=
X-Gm-Gg: ASbGncvqTdxpr3vYqp+Zf+n24nVBOXQsASvlXs5LbjPFlJ4xGsWJg8UvwOw+9hHulrN
	XGRxv/aq0H3TBVG9gYX+hfLcabaSW6m2b234VV3MqtR1WX528KAkThCeosK2V+KrTinRR0aVWU9
	I9BFkOn77ekwHFcFQ2a45gUJU1YikZrLHizMPTaC9OCbliAmpuId7mIHnJ8iMHkBlYMgtACuKRs
	7MjPg==
X-Google-Smtp-Source: AGHT+IHLiQo9zf+W69kDB3cDWqbqqaUTEQB3QA0bwZ3VgeLdHER2o8yZ7zRQtRAdTGfqK0fMqO4rMiTZMdKuA90pQb0=
X-Received: by 2002:a05:651c:54a:b0:32e:aaa0:b06a with SMTP id
 38308e7fff4ca-32f19987962mr836381fa.8.1751661073008; Fri, 04 Jul 2025
 13:31:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704-cstr-include-devres-v1-1-4ee9e56fca09@gmail.com> <483d26c9-413f-49d7-89f7-7cc0e7f4cccd@kernel.org>
In-Reply-To: <483d26c9-413f-49d7-89f7-7cc0e7f4cccd@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 4 Jul 2025 16:30:35 -0400
X-Gm-Features: Ac12FXwXOE57ThArDbVg7drgQErciDXx17aDmobPn4-zcxA1ROvu0X0TWKxx4Vk
Message-ID: <CAJ-ks9m-xkea1AvsPr264rgBvumCDZqr--fYro1e65O-6XOhgw@mail.gmail.com>
Subject: Re: [PATCH] rust: devres: remove unused import
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 4:23=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On 7/4/25 10:11 PM, Tamir Duberstein wrote:
> > As far as I can tell, this was never used.
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>
> Do you want me to take this and the other include fixups through the driv=
er-core
> tree or do you need them in rust-next as prerequisite for your CStr serie=
s?

If you can take them through the driver-core tree, that would be
great. They're needed for the CStr workstream but not for the first
(out of 5) cycle.

Thanks!
