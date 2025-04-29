Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A076428A408
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745926143; cv=none; b=ShBjZdTZ5jQp9GRTCAvHppP5V4beOwWJ8w/BnWjkdmFa+sfKXWz5hRxNLaeIUVJTVHOJhIeA5fKglq39+k5M+fhSxPxLrJo2LqSh2+hQtCDib73tnFTQE6lWKsHr0lxGDTxu+ymxtPVjFnvMP9wsfDrpWYEp+q7tFd53vFQQ3xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745926143; c=relaxed/simple;
	bh=woNcnGyRMngmeBUkRPsajMQzsA3UMnX5RgufC6TFXWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3tqQPlSZGf0973MjNqXK0CCV21mrC+x1Uh4g0bKL3e3GZlpB012rhZSB7RAr5sadgTvMaF2/QQ7CPx7dNyDHj2iuHXHFgSbd6Taif5g0I9+0ZZjwhtHOVm9jqXoekfhvBjZUbsHI3Y/rM14sZkY9OyvGlilDbg4ywIC1EUg+Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=K5xxbzUv; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="K5xxbzUv"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so726427166b.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 04:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1745926140; x=1746530940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIoZ3nN0C31ZPTqFel4RMOGDKIa68DpeenYKqk6VfsQ=;
        b=K5xxbzUvNOOxPX0kbpH1WP0Izxgca+OkXy78x+OrbvgV5v5JxVsOUwjBMZ2dajyr8V
         yMDr13TzQkTGa3+S7K5dqP16YUCwc/fKWcVEqe37uENtD1JGOdiE3CpRwffgfFL7p+VL
         TEE8F5+zOJ10C9Y17xj5bhx8gRFQUTRinG7kj9JyioR121CZeU0oQhJJArLB8mL/1XAX
         f+2jo177ucEyHkwxHpRK1GvR0HKJtDMBwFcNzXHdfPInnp4IYcAiS9C2QIUiegUOGkF5
         bzIyGGB6t8vnQhXgjNbfFq584aRV9IrLW8/HaSdKKQqiAP3ADpun3L+js1AnQnVT6Xw9
         RIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745926140; x=1746530940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIoZ3nN0C31ZPTqFel4RMOGDKIa68DpeenYKqk6VfsQ=;
        b=ZDwYrD6nYkI8f54m6zkZ2Di4DzRVjmx6q2U2dJZl9r/BKO8aO0dNlJBbVWI44lyh8L
         i6PtEKaQ1R6/rYoJbr8+fne47Ojij1CwqqY4la+MCMVNt8lNjPcJSLUkKnilr+66t8t8
         ZAGvyCxJqpN+s0mBf4oQQBHs8z9H9VOhtQQI+4DsKNry5MX+WAo7aUmLaMY2jfTeynpd
         GOwV9XLMc8U5juruIx+mBgJXODtPgCypBDiErosdqV3eSmX3uwxvbs6TNJdidKOjnp+k
         YklcQrFptPjgLuXXJdn7u+8eEpdfpDaBrfGaPAI5TfjHY7jq9sArnASZqtjSzsgTlE/a
         wihg==
X-Forwarded-Encrypted: i=1; AJvYcCVcKAyyyjDpAg6yWadnQSeXabWLYpuTnv7oRegqxs0pWrg658pUyrgasPmH7LufqG1foDe5mfJIdbANDEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkE8+DdL5ORhI0Tv16WN4mYpZrPatETcJrbcdus6WisknhcB7W
	fF4jP8sgWxxS9a/YxFTh0YyGzWueqln/tqwW9scQEn7Kdpl0DW39IVWUXTAFaX2vYv/Tt+weevr
	A5Ol90HkPLwmvKyZSuWUdP7MBxSzZUs+sfWMW2w==
X-Gm-Gg: ASbGnctFB2cTaC8ReSZ3H2k4QrrO5xD9CLzKfNTMsZkXRrwg32EobwLEkTss4mP+rBl
	w1goJRhR75VZFoCdwEItaDLHtrVbNHFTIfTdhvsoXibVB1qufrbEt3luYPXIWlizBCO9MWA/sRG
	TQ+UlEumQyU477/R9i97xVaZ+ljbKq9tV/yUxBx7CuE/aFzo8Rnis=
X-Google-Smtp-Source: AGHT+IGjoR04h69uMXHDsdBtG074fuZoFntLqbfxBJk9NcMcDj521Y2Up1m3ZJ5XB8Jn6dDlhMY0y/QZHjlufEac2Ok=
X-Received: by 2002:a17:907:94c8:b0:acb:86f0:feda with SMTP id
 a640c23a62f3a-acec84f5d8cmr195879166b.14.1745926139901; Tue, 29 Apr 2025
 04:28:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429094644.3501450-1-max.kellermann@ionos.com>
 <20250429094644.3501450-2-max.kellermann@ionos.com> <20250429-anpassen-exkremente-98686d53a021@brauner>
In-Reply-To: <20250429-anpassen-exkremente-98686d53a021@brauner>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Tue, 29 Apr 2025 13:28:49 +0200
X-Gm-Features: ATxdqUFsLIr3chYss1V6gmvWCU-RFkcmRMl-1ioABEd1mZT4GU4ZyUxUEwy6kZM
Message-ID: <CAKPOu+8H11mcMEn5gQYcJs5BhTt8J8Cypz73Vdp_tTHZRXgOKg@mail.gmail.com>
Subject: Re: [PATCH 2/2] fs: make several inode lock operations killable
To: Christian Brauner <brauner@kernel.org>
Cc: viro@zeniv.linux.org.uk, jack@suse.cz, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 1:12=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
> > --- a/fs/read_write.c
> > +++ b/fs/read_write.c
> > @@ -332,7 +332,9 @@ loff_t default_llseek(struct file *file, loff_t off=
set, int whence)
> >       struct inode *inode =3D file_inode(file);
> >       loff_t retval;
> >
> > -     inode_lock(inode);
> > +     retval =3D inode_lock_killable(inode);
>
> That change doesn't seem so obviously fine to me.

Why do you think so? And how is this different than the other two.

> Either way I'd like to see this split in three patches and some
> reasoning why it's safe and some justification why it's wanted...

Sure I can split this patch, but before I spend the time, I'd like us
first to agree that the patch is useful.

I wrote this while debugging lots of netfs/nfs/ceph bugs; even without
these bugs, I/O operations on netfs can take a looong time (if the
server is slow) and the inode is locked during the whole operation.
That can cause lots of other processes to go stuck, and my patch
allows these operations to be canceled. Without this, the processes
not only remain stuck until the inode is unlocked, but all stuck
processes have to finish all their I/O before anything can continue.
I'd like to be able to "kill -9" stuck processes.

A similar NFS-specific patch I wrote was merged last year:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D38a125b31504f91bf6fdd3cfc3a3e9a721e6c97a
The same patch for Ceph was never merged (but not explicitly
rejected): https://lore.kernel.org/lkml/20241206165014.165614-1-max.kellerm=
ann@ionos.com/
Prior to my work, several NFS operations were already killable.
