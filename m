Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F381C1D7994
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 15:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743177057; cv=none; b=OLaF6rqCnqep8rGuxTmEEoSPASYDSdjKEyP7yiRY8GwpgapmR7nHixuzxeYtyBsRAME9PB+irkj5+VAJp3McUofFm0cZiKDlovMi4cnZYc/8lcb27cWpPVOlmXvU8zzbbKWpQ8IIpCa6GTPA6JAizisUvO6F5QaHNfp4x+rtHTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743177057; c=relaxed/simple;
	bh=IWTfqsVvVgi/hP71Z135wMU/o8EPNrZSl4azIVzxnCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eche++PZ5Ev5TgmJD20HaXQJdg6A8/Ky3Eg9e49TXZeGCFmTv8JaPu5U+rWpDw680rcMURIVxCj19JPeNuoBXo3K8GCQAIV0c1ntiq4WQ4FBVTgWOwX7TVSSh3EqABk2/xDn3YyR3VywnU0P95gDa3eaWC5QOFYDYHeCtV4HuJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=A0TXKlbz; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="A0TXKlbz"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e549b0f8d57so2069415276.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 08:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1743177055; x=1743781855; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWTfqsVvVgi/hP71Z135wMU/o8EPNrZSl4azIVzxnCQ=;
        b=A0TXKlbzgWoIJWUCcS1g6m4gB92pmVfS4ayaRmJRj8PfR5P+DadTlr1BlxYiyyszFo
         KjenS1U4JF0tO/G9rnlg8I4x8rJoYhe4dcoAN380BIiqtVVZKA3IznFlwaeL+DPjK1en
         DlWWURj6ompDlsJvvH1vhSE4vlkZ7JxBPxTxVj/vIM1eUz/LkWuoMvNZYEuyonEwlRLZ
         8+Oy0KkvJcz1+Nqx8IvdGycX9Q0QIigXhhe+tGH46dFD9hNo/tXO97M/+CrtFyQBVdWA
         lsY6mOFz14wHAlhnhMGYdHLygBtlEp8eRhA02FDPJJk+sS8hoSNLkBj8xGUL3y16pG4O
         fJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743177055; x=1743781855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWTfqsVvVgi/hP71Z135wMU/o8EPNrZSl4azIVzxnCQ=;
        b=p8uNBwINLORCOn9vzWh0h/bgpv3TRpNnuPNrQTUI00Y3xuuCckCWIBa1Va15Miuu6S
         2PhK21OK0dKG5G9gxIkRJCAcyl1go1WAvTQhnbnSH9qDTYUqD2iM+M7MHwW6qdPRHmOb
         CcmR3bh5DHvOtrOgxDKj1laNyDXxXfdfujZXYJysucne6KstACsF0x0P8AkdswIKpQHC
         Cx+IPD8feLVf/ivSW89/qzgWmuf5XS0IYwhNo203Ku+npM4TOg9X2BQYBpNlw1PLvL1A
         1FG61xdG9CKw9D6xp9QTnyR0woUCgcwGUgbtnOHH8ZbSt8PdTwuP4JG1IIRo6z1cc5On
         yoxw==
X-Forwarded-Encrypted: i=1; AJvYcCV0rcmXjLkyUTnnLX0UenffEfpK+ZGMCgH/V8LkQKphlHpIBdI2ij3yDKoAL44KZPcr/dHokOYSYOy1GWY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ2l0ujhKvEFVNeLpeiBAhk9+mHKCpXEYiUkoADjCoRVQP5dyI
	YjVeAyMxm0H9Tp9mjjOGXg9FBqQRLpFNh+fR390ueATOq0gEcWPtdb/SX2PnK2FVaWnSiEOf1XG
	lFM/sXdx0w+MqSxFPj2xkzaoE4xbgHlXRjLOL7rhlypcLUzYrnA==
X-Gm-Gg: ASbGnct3vk7kzX3UtzRbEEz7Ef6fZ4iqEwACjuY66zArvh1UlXDKJOqJR2JVJGS2Z6I
	roE61KPtyY7+JZD3VpdBIdZKSM0+S21F1xxq3kvV68+mY5+VfseVTKOmqyhVye955ACJBRD7Veo
	3bN2WQeVL0MvofV7AVN7Gx8SkF1g==
X-Google-Smtp-Source: AGHT+IEpEvG12k9EhW0t6Ss1dI/+g3R223n9G7clkh8aJcJAyStHlnHfKcGU1LazGfTgQ6VJCqaeHdZrYN7ebpWksnU=
X-Received: by 2002:a05:6902:1448:b0:e60:8a06:1ddd with SMTP id
 3f1490d57ef6-e6943648d55mr9900351276.36.1743177054737; Fri, 28 Mar 2025
 08:50:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025032711045196042914@163.com>
In-Reply-To: <2025032711045196042914@163.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 28 Mar 2025 11:50:43 -0400
X-Gm-Features: AQ5f1Jq4tu3wIwY65gUTiHaep4vWg7HYdfRwGAKu9fpF3-_Zc87Fp3qWLTVd26U
Message-ID: <CAHC9VhTRUAV6P17TfXoODwowpAHwnhhLai6naVE300Y76Kk40Q@mail.gmail.com>
Subject: Re: Fw: [PATCH] netlabel: Fix NULL pointer exception caused by
 CALIPSO on IPv4 sockets
To: "mowenroot@163.com" <mowenroot@163.com>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev <netdev@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, Bitao Ouyang <1985755126@qq.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 11:05=E2=80=AFPM mowenroot@163.com <mowenroot@163.c=
om> wrote:
> On Thu, Mar 27, 2025 at 3:38 AM Paul Moore paul@paul-moore.com wrote:
>
> > For all three function, I'd probably add a single blank line between th=
e local variable declarations and the code below for the sake of readabilit=
y. I'd probably also drop the comment as the code seems reasonably obvious =
(inet6_sk() can return NULL, we can't do anything with a NULL ptr so bail),=
 but neither are reasons for not applying this patch, if anything they can =
be fixed up during the merge assuming the patch author agrees.
> >
> > Anyway, this looks good to me, Jakub and/or other netdev folks, we shou=
ld get this marked for stable and sent up to Linus, do you want to do that =
or should I?
>
> Thank you for your acknowledgment and suggestions! Your insights have bee=
n very helpful to us.
>
> We fully agree with your suggestions regarding code formatting and commen=
t adjustments. Since you are more familiar with the code, we would apprecia=
te it if you could help handle these modifications and complete the merge. =
If you are willing to do so, we would be very grateful!
>
> Previously, the email failed to be delivered to netdev@vger.kernel.org an=
d linux-kernel@vger.kernel.org due to formatting issues. We sincerely apolo=
gize for any inconvenience this may have caused.

Most (all?) of the Linux kernel mailing lists have requirements around
only sending plaintext email, no HTML, no MIME, etc.; I believe that
was the issue with some of your email to the lists.

The Linux kernel documentation does have some guidance on configuring
popular email clients as well as submitting patches, you can browse
the documentation online (relevant links below).

https://docs.kernel.org/process/submitting-patches.html
https://docs.kernel.org/process/email-clients.html

> Thank you again for your guidance and support. We are delighted to learn =
from you!

Thanks for the problem report and your help with finding and testing a
solution :)

--=20
paul-moore.com
