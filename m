Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F0228D822
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751303940; cv=none; b=qO5g3Bc0Npoa9g/SRCLuyfruOfZx01u8Y0XWq/z00Ymdx7c2/t+/68fnWLclFlOhS+u9Wx5RH2r4LXgKMK0xPnW+p2pGzV04t/N527v9f1dnw3QVZ+2zX0Qddu3pMpYH6N/rcd7NrpVEvw/RNcQhWDHEhCuec1CmUPAyt3XRlvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751303940; c=relaxed/simple;
	bh=BAiyrEhhiV383mOUgct4OWopIaapKv+OJACBpBkj1ek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bno1PI4xcmJiDuivqxwnwifjTfANdKIbapacq2ZXlpBE1MHBafAjOS34mPCMvvDKc6nnIrFwTrECtE2Lvuidp/UXVsuuZSI23ZqrhfhENccDzYZcIjZJfnSSJHJJTIKsoHPcxSapRyevNs5FFKckljyNdEvZmjxKYU2tUaI0NSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omnibond.com; spf=pass smtp.mailfrom=omnibond.com; dkim=pass (2048-bit key) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b=N6SzM47S; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omnibond.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omnibond.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="N6SzM47S"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-742c3d06de3so2829528b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=omnibond-com.20230601.gappssmtp.com; s=20230601; t=1751303938; x=1751908738; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAiyrEhhiV383mOUgct4OWopIaapKv+OJACBpBkj1ek=;
        b=N6SzM47SjBPaM9N5+BXTagoTQMRvP1/xg1Zk1DnYxUnqVLneVnD3p9nyuNSc0KuIf6
         s2dhbU9CZtmyzFLPBNbmWZPWY9SsxC1l6bYiv/oGAUKa3B5RBYNT4GGEVdJgipkCehh4
         tkBLqxfURK1yivMq06zFywLRQLX7S+IYw5QWdu2Gx1rQ7jes7cuM5Xbo2m6JNdlQ5cFx
         NtExuzO3pZq0CAoSwErgZWcrIfLeJAK/z9csZOxX7NLdW+Jv5Nx2Ec+EkHvBneoqvR5i
         0tkBZ6Y1b+an5dpXOKdVtSY/7TjoyYe3nGmOz7bu+YU0AEBoUeyVKNptp7uwZaF602oX
         Kx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751303938; x=1751908738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAiyrEhhiV383mOUgct4OWopIaapKv+OJACBpBkj1ek=;
        b=HT2R0+tQioEgMt769zs/3vzCnM6yIfErENuq9G488ubSotHqcBkD2+KSYs1Hh+Z/JQ
         a+KjXbj6fGgCE7JRirPTxvBl1MhIkacnuagQncw62GGrJ3RlDmwDCpXmdFhj7c8QFpRQ
         rqVbt5Ur84N7w+YB+OuT74eH8HVxSBMD8b2Zl3GnFClGmW1Ik8PfKDFbvfPsrqI/1dc4
         YiJ7WA5C73uBRrw8quSfAXJCkGUUjoWR4WAbeuID8p/5UvjqD1nYY0/XBRRBj4JkejKI
         zWy0NNgs8y9pbdOVl25FoniqG2rr/HxzLAWqqjPPWy+gJo6MnLLZMcWbQEJXlpqLUq1P
         rByw==
X-Forwarded-Encrypted: i=1; AJvYcCVcfVa4SsKZicnV5G5tBWq02jdrvXICTXn8Onl8ntl/IKaI2iu+LAFWAq/N5Ku2DDjKgKQhtAFw/coKsCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDkr78yKrT9O4EIud9DUjvAufeQHnzGfFTKH+zyeP3kup8fba8
	G+M54B2xZ+DOz8+PqfWdg0fKh2azjdUDxz7pI5O4Y87GF93tv2mOWLA3jS3QPMXuu+SRbU6xD1g
	7aLZdBJpISR1ZtjCGdnuCdQqyTXsocZPHuVzbZ4k6A9TtpWfA9Eg=
X-Gm-Gg: ASbGncv+x+IHwQW4wST04GeVb0Wa2qaLFkNhxh6CHvqTQgHYsoMFhl2H+xK8QNTC8Ek
	sGFD6dV5N5wYICkSMF1Ows7+hWiUo82yxOZcTtc+0l3S3EyGqrFPWo0sfbTyqNGKl7ViTbf7Kcr
	PewKnun8s8QdkYZQDbqPPWkp+04MP+SAZBP+V/Ce+7ui+iX3YCvcdUPBs=
X-Google-Smtp-Source: AGHT+IF5EUFj3NXjU3AVcJ/Zu/DDPjIC7nSgpWEx00YDQf4mbck1Hjl5QK0YbghJ0YN5j+UjqF3+EU3iklA4MYf3sAc=
X-Received: by 2002:a05:6a00:238b:b0:746:24c9:c92e with SMTP id
 d2e1a72fcca58-74af6ef81a9mr20692678b3a.8.1751303938118; Mon, 30 Jun 2025
 10:18:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608163559.36401-1-a.jahangirzad@gmail.com>
 <CADf5TKvyKvaP3eZUR81ND6JQUfVqUEroCrXp=joZ8GHdu2EBbA@mail.gmail.com>
 <20250622184815.GW1880847@ZenIV> <CADf5TKvorgeCJ=6u6=jhxetUhDx3SCnUBe+cpbUQu5gADqRRCg@mail.gmail.com>
 <CAOg9mSQGNOrA0p4q+9Q_tLCMtBnCuEc5d+TYXdV+7XT4pqOQNg@mail.gmail.com>
In-Reply-To: <CAOg9mSQGNOrA0p4q+9Q_tLCMtBnCuEc5d+TYXdV+7XT4pqOQNg@mail.gmail.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Mon, 30 Jun 2025 13:18:47 -0400
X-Gm-Features: Ac12FXxG1vMznYMejNAEHasbVa_SYqnMqre4yhcxDzQgyJ9n0lVdgpRMdyqH75M
Message-ID: <CAOg9mSScdVGLu6RFFe_Lcv5ugRmN8Ov-qZ=yNUM84Jv94jKz1g@mail.gmail.com>
Subject: Re: [PATCH] fs/orangefs: use snprintf() instead of sprintf()
To: Amir Mohammad Jahangirzad <a.jahangirzad@gmail.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, devel@lists.orangefs.org, 
	linux-kernel@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Amir...

I added your patch to 6.16-rc3 and ran it through xfstests, it
works fine. snprintf won't overflow the buffer and gives you
the opportunity to compare the return code to the buffer size
to detect truncation. It doesn't look like many of the other uses
of snprintf in the kernel bother with checking for truncation.

Whatever Al was pointing out is probably important... :-)

-Mike

On Mon, Jun 23, 2025 at 1:02=E2=80=AFPM Mike Marshall <hubcap@omnibond.com>=
 wrote:
>
> Hi Y'all...
>
> I was about to add Amir's patch on top of 6.16-rc3 and run it through
> xfstests, when I saw Al's comment.
>
> Al patched a similar bit of code in orangefs-debugfs.c without
> removing sprintf:
>
> 45063097 - "don't open-code file_inode()"
>
> When I look at orangefs_debug_read as it is now, I might be trusting
> file->private_data's length too much and Amir's patch might risk sending
> a bad sprintf_ret to simple_read_from_buffer. Al, could you be
> more explicit?
>
> -Mike
>
> On Sun, Jun 22, 2025 at 4:10=E2=80=AFPM Amir Mohammad Jahangirzad
> <a.jahangirzad@gmail.com> wrote:
> >
> > On Sun, Jun 22, 2025 at 10:18=E2=80=AFPM Al Viro <viro@zeniv.linux.org.=
uk> wrote:
> > >
> > > On Sun, Jun 22, 2025 at 10:09:58PM +0330, Amir Mohammad Jahangirzad w=
rote:
> > >
> > > > > Replace sprintf() with snprintf() for copying the debug string
> > > > > into a temporary buffer, using ORANGEFS_MAX_DEBUG_STRING_LEN as
> > > > > the maximum size to ensure safe formatting and prevent memory
> > > > > corruption in edge cases.
> > >
> > > Out of curiosity - have you actually looked at the format used there?
> >
> > No, I just found this through static analysis. Is there any issue with =
it?
