Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA40426F466;
	Thu,  8 May 2025 14:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715612; cv=none; b=qTP0QdZaIVaONNKuw8IZ8Iz/WVzw18C0pIVbuQWeQDneuGmAUkcxuEvxgpGRrVQowcX9NWqpufeUYJCAm4IfHF7KvM+FK4juDKzPWcD4ozuIFVsZAkf3wpeA2hQYPsjKtS8iE3GmjZ8zcnWqhJMp3sMzFn+Fr4qiM0QdDcO9KCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715612; c=relaxed/simple;
	bh=tBCpeTTQZ231SSa6DqDph5chs3bX3++EScU/AKu8c1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FsKeoV2SoFAzDBuSpOUkuoqH3NUe1DAelHtoRk58mtBprmH5Kb/kuoeGiVPseYqlD8kHVmYjVc9DEfITQ0LoqNfS+jAw57aVUB8Nh6EiJgZUKQYsAlDT5JbiY+CJOfm+DO2mLtdEvMNkuGn1WA+i9PlhwRmLpkQKZPJhELf2P30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aU8lf9L7; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aU8lf9L7"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5f7ec0e4978so2011158a12.1;
        Thu, 08 May 2025 07:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746715609; x=1747320409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7CqxF0+GwBDk0QErrVq07WxoIRpHZmPETdvZNGiMkI=;
        b=aU8lf9L7CI/iI1C7nVw7Pw2ei1DrAnvX4HMtFD/jsPFiOfVCuEzSeHvGldrm7SX8wx
         0aXmTJgrPcaSLtka8xHY62EJFtY2npwJhoGW+m7BHWPfdmamZSBAyGCRIRNw2Q/t2DJ6
         knqOzOz6D9F9ZtEbzUruJ6KazKIrWUj11k2aeVe0RmZ6r86cdfas+qDMmRTm4mKOggFS
         /FtzlCXIPdPaNt4G/TxNt+T/EIwiS28pNqO+G3RABSgo85HxO9maQljZQsLLplbN1jdy
         Dyrwcx3taouo8vXUgImaOEkOcU35DGkNWK4aIBfw+Lhhv5ABLq8qI2yiD/wxSPP7wFwB
         sRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715609; x=1747320409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7CqxF0+GwBDk0QErrVq07WxoIRpHZmPETdvZNGiMkI=;
        b=TbjYHM1lb/qTIgnTJ6FsLc6dNH6WC5HFvDEdEGcL5aOB3hssWW11X/vQl8PUveJioM
         Yzf35Ske1i+CHpJi6FOysLhIctXBQsDWQ6bUDuf7KL34DbJOAVewT1px8I3rD26o4qxA
         y+vLtq0EzfiuFsjv2KviyQEoqX3jW1lWrqZ5O+owyWOQ2mR4xOAnHTO9QDwV4YF0z3ki
         G1hft3vas1xcGiSRc2Jhh47gutKWTeuyWP+r705QLPgxx5R874GavrJm80nYErI4UwIN
         8/pTmVZ5RDcORJVWtnKpCQBrxCyDmSut8tAbPyR1LuZBQXfrCnbonatYpnZf2o3PkXBx
         rkWA==
X-Forwarded-Encrypted: i=1; AJvYcCUbTep5eN6Ns7ZyZD9qKcghOsFLRHLKhX5g98P7DO7zy8MChUQcV9u2i6asMdHteCCqapSfeivdWxr7p93a@vger.kernel.org, AJvYcCVR9Scmtm1XpcjLZzdJQfgedQlLfSfZD7Xdi731og9SurToaAJ3GduFnNQyRuS74lLVTFEfpaZkJnT1@vger.kernel.org, AJvYcCXCShAHLBpKO8lVj7cyn52Cg8dzxEf9IeQkRkvaGf8GzvAibUXLJul3mVy26jn3ACdIml45EbRg/6IM@vger.kernel.org
X-Gm-Message-State: AOJu0YxZveBFj9Q8BkSY+4i06LjFd1USnARJDcAIs18w2z2CYZnlv9FD
	6I/KvV4yhVKmoU85Dudx2amT/SJOwt/KR2arN97NzrYQe+a6bSpsrgIW4cYdFBVmXIQEEYw6sez
	TPAv4UUZ/ghNSovWfLQB016KH1Zk=
X-Gm-Gg: ASbGncuKateMSFiLp4soZQvCJD4gMsbczaDafVLnKMm0d+G2bsJTqy6vU4qMwGIDpTN
	Jk9VF9027ZXgIStWphE58XqAs/+9130iR+8woYOeUSIuyQP/eARdxnHgeP91crWPxHK2cuxfJdH
	oXy3UMnl3U1mew914whLtXInkK
X-Google-Smtp-Source: AGHT+IHapRMpC96e4Ns9HKMbhCfMvfj8uYQA8zoVUmMq2SPt/wmu7Z6r+RtaYaL1UsQCz8HCNdpeCTNKH7q/g7lJNDs=
X-Received: by 2002:a17:907:9814:b0:ac3:8988:deda with SMTP id
 a640c23a62f3a-ad1e8d0559cmr789193566b.40.1746715608789; Thu, 08 May 2025
 07:46:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508132659.GL3865826@google.com> <20250508142648.7978-1-trannamatk@gmail.com>
In-Reply-To: <20250508142648.7978-1-trannamatk@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 8 May 2025 17:46:12 +0300
X-Gm-Features: ATxdqUHiaH8PbqWfBsEndtwr5BsJ3rjivWkNSVwxx1yUeo4wbB-GYsM_ezNcRas
Message-ID: <CAHp75VcquXy11+mXW8eKgE0ndg3k0y6i=yKQ9_3N2Uh0viZKQg@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
To: Nam Tran <trannamatk@gmail.com>
Cc: lee@kernel.org, andy@kernel.org, geert@linux-m68k.org, pavel@ucw.cz, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	christophe.jaillet@wanadoo.fr, corbet@lwn.net, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 5:27=E2=80=AFPM Nam Tran <trannamatk@gmail.com> wrot=
e:
> On Thu, 8 May 2025 Lee Jones wrote:
> > On Thu, 08 May 2025, Andy Shevchenko wrote:
> > > On Wed, May 7, 2025 at 7:42=E2=80=AFPM Nam Tran <trannamatk@gmail.com=
> wrote:

...

> > > At least, based on the above it's my formal NAK from an auxdisplay pe=
rspective.
> >
> > This is fine.
> >
> > Just be aware, before you submit to LEDs again, that you need to use
> > what is available in the LEDs subsystem to it's fullest, before
> > hand-rolling all of your own APIs.  The first submission didn't use a
> > single LED API.  This, as before, would be a big NACK also.
>
> Thanks for the clarification.
>
> Just to confirm =E2=80=94 the current version of the driver is customized=
 to allow
> user space to directly manipulate LP5812 registers and to support the
> device=E2=80=99s full feature set. Because of this, it doesn=E2=80=99t fo=
llow the standard
> LED interfaces.

But why? What's wrong with the LED ABI? (see also below question
before answering to this one)

> Given that, would it be acceptable to submit this driver under the misc s=
ubsystem instead?

But these are LEDs in the hardware and you can access them as 4
individual LEDs, right?


--=20
With Best Regards,
Andy Shevchenko
