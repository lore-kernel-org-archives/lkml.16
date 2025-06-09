Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64CA21C185
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 19:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749495872; cv=none; b=eNqQM/rnvRUb/PhU3ichxyqvKNYCIDhmB2cS8f9cjSiPllQDZq1gpAiUYZoyaq76WThp0q3SL0R1t/CMt0ESPC/sPI03oozI3yw8Uw/Zf9OKZEVE1uZjT6bS+fbSfs7weOGBUzXPriXT9NQFROKzaQ1ndBXZcPrd4d+DTXUDKqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749495872; c=relaxed/simple;
	bh=n9ujBk8zt+n9BN7bQTD5uBq6pRzWJinp6zbbjnjvSCk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gblYsBjvnsLMEqZnfLcuJkhe7FeAQq4N3ZAeLZVmyEXQ17OpSYWJRZMJ1Zx2FEHpuhxStPTDwjdnjfTEHt+FhBNmRW9Htu8Z4ob0uSL35TDgJtdUAep5vC718tNj0Cd0yDhdYk8gVyLuFHnAESGF5oZClx78UhJ/jolaPVtA4Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/cpJFT2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/cpJFT2"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so56878425e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 12:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749495869; x=1750100669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsP7jZVVZMGdt311iJwP9QeNOHBh02uGGjddNS3Gj1Y=;
        b=b/cpJFT2Ro/1OJohY94qmVYEYLL8s8Y7Q5IrC3ub2cdgdfhrBj+YLrj97T7pJ8s4zY
         ayjVvcZbUd0cxA1LGlsM/hOGi2hSZHSHW5Is4lxOhdhL6SN+sh1bmYDosThC4B1qB131
         xJFzB/Bsx/Y5HaRT7MMh8+iUnsl1mbSvR+y7HcaDUjlNXdfzukQw+zsJuJ8sIpgV2/W0
         JgvTLpnPxaKMSCglTNSXcwLN2ANZHucN9DB+ftU2KKfz/6IEdIrh9m6ckPNlu2t3LhoN
         JN4520RDYXk2uzXiLtavyNDvEcIXgF7/Kohpf8kC8bdSesQ+SbgDHuwnlYZL9F26nzVo
         Udbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749495869; x=1750100669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsP7jZVVZMGdt311iJwP9QeNOHBh02uGGjddNS3Gj1Y=;
        b=agoetGOXI9Cg/T3s46vt77sBshx344x3EV+iyOIfklmvvmBZBTrHKEV8p/UjetzPxK
         TfqSe0cvM44XpA8RQxMTEV5aPMliR65e5iyN1oC3/zgJJq/N8wQuhmI2TI4SVbwuZx4N
         4VIe39ohr9I6bvNgNJRczQNz4t8B0bGxed+H859OwkgI/UtI93hwdUMR3d7wky0KtQ6u
         BTNmD5Tr90ZsglglXnZLr2fadCclM/F3tuNIER4BZp5VMZ8xH5KbyBOJMI7PPC85cyQt
         NCloZjTZSRG8X/uwto8swdm5cNt9AnNYBBOtXTBtSE8W4ukGbKEOFaaiUxGd1snCHCln
         QOrg==
X-Forwarded-Encrypted: i=1; AJvYcCVdEaqNKj4TE0JKYgUzaNRV5hVAq1b62J/AE2ZaHPjAfSAmdoGyiW0wZ7d8HS/s3Tk3iAtwc/aqho4GdlA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyras1mr77HNWeScI3C+2wv7f3L/EZ5P9UK4WEFCBb70JAPjDQs
	eddE/NyQ/832T8Oglkn1TmqMCy+a1KDys2WfRZZ2G8wz9mTiwHxMyKZ+
X-Gm-Gg: ASbGncuwDib96ny5dLGRGAjdKOYY7674LSWX82UuoStyJB/SSBjUz/eOI/gxk0keohk
	WiXjpciMfei8lpWekbm812XHNbWA2CmuyeVKObPS5TTCwQLBM6hCHSqa6i5t7VAhNcZOGmTr7oJ
	VvRSWfAkHORjsgVdZoqg7gAaETHNQrz9yivXPGToc1FJwmOJ2bMNdbMoXU8XMYta1KYAW1jhu1K
	didPeWF+Z2eDDgvRNF7JI6/vPG7AxUgC1et7RDuaBzpHI1MvlntAVZWgbItwrLyuAxV3rGT6KVM
	ndeaorBRDUbJKjptxG+AGJF4eXUFutdeC3bt6TJGKajS4bKLHOop8uIBF2m6EFgcF/nwVIjICSE
	tPXBREqmPI9GdfQ==
X-Google-Smtp-Source: AGHT+IEWIkvo58G5j2JuXXqpUNQ75fNd9mnbji3kbUxk9+YmiqSoJszIWvLBd9IgIo43qknOCbCO+w==
X-Received: by 2002:a05:600c:37cd:b0:43c:ee3f:2c3 with SMTP id 5b1f17b1804b1-45201364a49mr123238825e9.7.1749495868795;
        Mon, 09 Jun 2025 12:04:28 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm10168519f8f.74.2025.06.09.12.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 12:04:28 -0700 (PDT)
Date: Mon, 9 Jun 2025 20:04:27 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Mateusz Guzik
 <mjguzik@gmail.com>, torvalds@linux-foundation.org, mingo@redhat.com,
 x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
Message-ID: <20250609200427.7384908a@pumpkin>
In-Reply-To: <CAFULd4as4U96E17qDhpOKpxxVkcTjNq6=7O3y0Wq3XhFxhavag@mail.gmail.com>
References: <20250605164733.737543-1-mjguzik@gmail.com>
	<20250605190054.GH30486@noisy.programming.kicks-ass.net>
	<CAFULd4Z4SJZErfV1AG_a-+SDd=gnXa88=suRAFN3RHB5M+=bFw@mail.gmail.com>
	<20250608215127.3b41ac1d@pumpkin>
	<CAFULd4as4U96E17qDhpOKpxxVkcTjNq6=7O3y0Wq3XhFxhavag@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 9 Jun 2025 08:04:34 +0200
Uros Bizjak <ubizjak@gmail.com> wrote:

> On Sun, Jun 8, 2025 at 10:51=E2=80=AFPM David Laight
> <david.laight.linux@gmail.com> wrote:
..
> > Do you ever want it?
> > From what I remember of benchmarking 'rep movsb' even on Ivy bridge the
> > alignment makes almost no difference to throughput. =20
>=20
> Please note that the instruction is "rep movsQ", it moves 64bit
> quantities. The alignment is needed to align data to the 64-bit
> boundary.

No it isn't, there is no requirement to align the data for 'rep movsq'.
Even a naive cpu will do misaligned transfers quite happily.
The worst that ought to happen is each memory access being split in two.
Since it is likely that copies will be aligned (or so short it doesn't
matter) the alignment code is just a waste of time.

Even length checks to decide the algorithm cost - and can kill overall
performance if the copies are often short.
You really do need the software to give a compile-time hint of the likely
length and use that select the algorithm.=20

I need to check Sandy bridge (I've got one with a recent debian installed)
but even on ivy bridge 'rep movsq' is pretty identical to 'rep movsb'
with the count multiplied by 8.

The fixed/setup costs do vary by cpu, but the per-byte costs for moderate
(a few k - fitting in the D-cache) copies were the same for all the intel
cpu I had to hand at the time.
The only thing that mattered was cache-line aligning %rdi - doubled through=
put.

	David

