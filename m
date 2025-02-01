Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0161C5F29
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 18:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738435368; cv=none; b=Tfsilu8oqtPWfhJ5tPvkuUoh3SZYzbNX1r1v88yEDlwciPLKCcd+kzVSbhICyLiMFzQSY4yeB5io5xyW95tEqLn8T/WiIdv2dX2TznxnojjUfbi56V9OMO+pZjwlcKb4aVy04pqkvaYAnKWZdr6j9JawwUmEBZs2GmeGQAN9Q18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738435368; c=relaxed/simple;
	bh=XTCt5FhwLoJKxjTmQyf5/llfDJWDoS5HKZbEqF9RtZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EeG6DwwKC8bCh18X0AJwvgMYuDIgTKGKsvyO5VPKoZSuAGZ/Ey9wV++KnSHIOoOVH+yyr76jfrKxH5EQbc6NjMfFs65pKkhcKjohd8U7L9mX3vMI1hAhbxfdyuSF7QsZBji91wJ18sH1hp6iFjGn0uj6z6XUKeuLjjKBXDThzIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXE2b01r; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXE2b01r"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d3e6274015so5111577a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 10:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738435364; x=1739040164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUiqIP2vhap9xFxDdBSTnK/sJOpuqGpUB8RqzKZ8M2U=;
        b=ZXE2b01ri1aLejHcGByBX+ZYb4+IF745vmndreFNQLcGoGhtAmkv5Xj86WJz4Wq7Ab
         NaiLfuzZH4IgEutZw+B4MM4DCDzEswNVvy/LghdGyYU3My8WMhhAJYJiJovmFw7GXG2B
         sNbXgi2Z9NcVMKYAlKUgQmXSt2khE4O3taRY2rQ/8kN8/Pg/SaDp2mjZFZNlT+GWsNGU
         1j8eHHrRlweQ93ifQT0juEeJvjL6depugnA6NwQ35HxqyH2Sh4pPEXL0C30T+21oDIp3
         Phqw0l+Bk4a5xoGa9UOed6I8aI4AfRcSOvZeci8AGZ5LTVGL3ZRV/+zQ/SUIbHfjHi4S
         sYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738435364; x=1739040164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUiqIP2vhap9xFxDdBSTnK/sJOpuqGpUB8RqzKZ8M2U=;
        b=BBB3ALYgGk0OGiqY3RI6EmEjg27iO/8txBSMpGdgUAoQfXECDdItOCR4cSgknIBTll
         ZKEL4zDEAsUVbBCMo/gzQ1p4LsLN658MEdAf/8veQ2R01Q97dWo7OjlBc4r2M6M5NA2D
         xQHib7oB0meul6VBynEkdxa0hfXEV3NLobqrE21UPXW9mtzGFOt8PtzcYt8DhncYMW0N
         xWtS7d7PtTo2J+bqyS+zFHiq/L6nreOjeLkMIhOnQUhZF0AJDfe9cnG4sQ9vEebT0LyK
         tNCi8Npj/3aTHTyWME9JXCvHBcyWblCc65LJnIkRyOseN8TUvaDXwbB5YOYYl1tTbnaS
         h8wQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3LEL250jijPQfmQcP5n69H9tgvV9wk58KqEuWIBky8Q57P4bokKGI4Uy+hhjRxCxM0iBXkpIgLMIDNO4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSRHYg4rEUdXYFJWNE6nHdkQzi9Ph0OwPSnwBHm0j810rKNe5T
	J9VHpLYxxNBQgB1ESi6Uqupk1U5XVfSTdLY1CHdF50THYUAVmsh/R2hzMaxApbwIjcO52mHzulz
	CXmnkBDfaHKKVuJKG04X/sw6ADAs=
X-Gm-Gg: ASbGncsy6vi5VdJgA7Uxty+AZ+uac9z/ukJ/+tphNmTAViOyIlJgqTrpWi2I5Drp/F4
	oDkimGFjiibjj79ysa14E6puYPortXWhQuY3GjluNcQRdaUG1gm9T1zDBLDb/V1wEowUT4Pjc
X-Google-Smtp-Source: AGHT+IH9WOq2E8EYGLLj3CEPsYYcn9PdroifBEXuueOBDVI8+v8aRxyxBPaHGOhX/Jjj6ikmS9o3+MYm98Qg4NgNI6I=
X-Received: by 2002:a05:6402:4406:b0:5dc:5a2f:a726 with SMTP id
 4fb4d7f45d1cf-5dc5efec212mr17241581a12.22.1738435364257; Sat, 01 Feb 2025
 10:42:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201163106.28912-1-mjguzik@gmail.com> <20250201163106.28912-7-mjguzik@gmail.com>
 <20250201181933.07a3e7e2@pumpkin>
In-Reply-To: <20250201181933.07a3e7e2@pumpkin>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Sat, 1 Feb 2025 19:42:32 +0100
X-Gm-Features: AWEUYZmD7n1XmQbjWEcB08JM2uCO0EHuoLzDc68hOqOAuYm8dqiuxxFK2WsQ9dM
Message-ID: <CAGudoHFHzEQhkaJCB3z6qCfDtSRq+zZew3fDkAKG-AEjpMq8Nw@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] pid: drop irq disablement around pidmap_lock
To: David Laight <david.laight.linux@gmail.com>
Cc: ebiederm@xmission.com, oleg@redhat.com, brauner@kernel.org, 
	akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 1, 2025 at 7:19=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Sat,  1 Feb 2025 17:31:06 +0100
> Mateusz Guzik <mjguzik@gmail.com> wrote:
>
> > It no longer serves any purpose now that the tasklist_lock ->
> > pidmap_lock ordering got eliminated.
>
> Not disabling interrupts may make thing worse.
> It is a trade off between 'interrupt latency' and 'lock hold time'.
>
> If interrupts are disabled then (clearly) they can get delayed because
> the lock is held.
> Provided the lock is only held for a short time it probably doesn't matte=
r.
> Indeed, unless it is the worst one, it probably doesn't matter at all.
> After all spin locks shouldn't really be held for significant periods.
>
> OTOH if the lock doesn't disable interrupts then an interrupt will
> increase the length of time a lock is held for.
> This can be significant - and I mean upwards of 1ms.
> Network interrupts can tale a while - and then the work that is deferred
> to 'softint' context happens as well (I don't think a spinlock stops
> the softint code).
>
> I've a feeling that unless a spin lock is held for 'far longer than one
> should ever be held for' then you really want to disable interrupts.
>

Note that taking the interrupt trip increases single-threaded overhead.

Per your own description, if the lock is contested and interrupts are
disabled, handling them also get delayed by CPUs which are busy just
waiting (and which would otherwise take care of them).

So while this is indeed a tradeoff, as I understand the sane default
is to *not* disable interrupts unless necessary.

--=20
Mateusz Guzik <mjguzik gmail.com>
