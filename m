Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBB0BA38
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 19:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749238635; cv=none; b=eIKN9YgMQRMRoqpp8HGiTTUbm/WCQ2Mp8mOxTuQQ10BcmbeM5mEiu7L/Lh4jBef4Z7TC9hzJTg7/tcMmVhCStczQontDaFk02T3hSjabftu0FPZauSnuMLBN8zM00iEJAPszdKqMJieUSRRsIvKTRYFrjBsWA9u4h7gdz8Zx6Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749238635; c=relaxed/simple;
	bh=DP7B/KnXqE/5Fx+2b6vnlriV7vATtl0GEcFlV7hZQBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ETlAzJYeLSENzO8g899dsCxAVkhetkeftI0wFNQ+cGzDBKPtIzuwNrzOTMRtLVY3gjht7CHa2Wr+hvMiHUZwDcsb0sGXM3Zf/NMwnLV1VlCBBETpKamQ/h7L9WfquTvr+OBjBfhoxr+xT+ERhhr264bEw32ANBTASHz9KSEYz0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Zvlv95Tt; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Zvlv95Tt"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6071ac9dc3eso3889273a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 12:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749238630; x=1749843430; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jgatZKIZeCG/8Okk2kimmj0LPUfz/8b8SqKivoXRX6U=;
        b=Zvlv95Tt01eVuI9fm/KD/aoUSTBAEFxRKoXJqhj6TsPWkOxlq3xPFG6PEkCUORqyVF
         Qov1aKbqDPKX8K7ZDZIWkUxVO4T9IkZ+5NxZFBF/IybqfF5BMjKRS+pwhpmoPcijiwvD
         hAqKDZYfsnCsp5/L0zDt96FYMmGkv7PTQ45y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749238630; x=1749843430;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgatZKIZeCG/8Okk2kimmj0LPUfz/8b8SqKivoXRX6U=;
        b=YQfkq/3X7mxllzvevaNwbBf3iOz+mb2RV01/1oXENnf3R0pG5bnJJ2DQUJmQ3kAP+V
         M3k73phG7GJ4COXWeuPhzRrujiqhgO4ckIOA8dehOJRrGLNmwXbd9zy5Re/VNDisrOQb
         04Rwfz89O1cqOf3gXYiF1hWjEs1cjHzUEnVtWN97G1QKhScQoMHsD0dB8EHQUdi9aJrx
         x/R8wPVnSAtE9/dhUPr72xAknfkQNA6zRCiFu48nITqlZu1ks/vQvobK+mWIzjMuP/eL
         ReqqdcluLtN1EF9i6a/EN5LZYdggrIe3gcQlIr7QvwkkDhdUWFC16CPOx7yq0M5r+u+f
         13UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOs7SewDj04mdkno2N+ucXUK7rE2AXZTIrEwHIVjQP3n4Yq4605hSE6RsOjDdlho78jK6kwQ7sCOLXmwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBIivnn8MDBJqxV2fmh17twOBUs8WGJUGOF1xRsu2rd7aZHIDk
	j8JEJQ8CoVbgXsi0H9pkzebweOfdIJ17IBvxBYJ3oUyETQDAMzJ2MJ52Mo2uI60i7m03n9V3omJ
	jpcpb5tQ=
X-Gm-Gg: ASbGncua0YAtWP7hAyYfo/HNOQT4fhIDdDAYgZ5EIH4ZVxVEPGhK57njgIVQ/zQBBvF
	krTtvtRaa0dkZ96TZ+E1QD1xd0/u9ATyW8Iu8dptuTOzdY8FFmEMkGtcjx8rIV65I0MOnRDIRdf
	ZA1fPpXJdn+SGmxC3XfGD7luTybl2kqC5EjpVhastO5cPDIA9TrPZC0GULj7ygQyCAHuvxskIF8
	TkRxBQLJcPF89L/KhfFLzgr0WyrGKhKfrQdT5d5xe4ZFY2zCNZ8Euv9N00Nf4ufUAp6yba1jBhC
	ltSKi0XGqpXNjemdsWR/XZzwGeGYLmJL1PhRY5lVbjNd5mpN/suu9AGle57ninjaK/Oy3qM+TSp
	9QXMXD/65+pUNhjdaX2zgsMVUhw==
X-Google-Smtp-Source: AGHT+IFsj0I9US6PlHCFFoGhK10J9JSnznLo++vnXEODr+HFx5nGyEuXgfhnXhNKJRXGxSO+NgSoXw==
X-Received: by 2002:a05:6402:4307:b0:604:e602:779a with SMTP id 4fb4d7f45d1cf-6077498deb5mr4751912a12.28.1749238630522;
        Fri, 06 Jun 2025 12:37:10 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60778377a51sm1432265a12.23.2025.06.06.12.37.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 12:37:09 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so2117735a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 12:37:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUsGjPaFODJVQMbJBh0ORQLtmwqEwxG7mSNJTWSH93heqkJSmZ6EXI7uHayXrNu72X9sBQK/+sAArqT1ng=@vger.kernel.org
X-Received: by 2002:a05:6402:1ed5:b0:604:e82b:e255 with SMTP id
 4fb4d7f45d1cf-6077285cb5fmr3963530a12.0.1749238629421; Fri, 06 Jun 2025
 12:37:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aEKpKk71YuLPPMZC@kroah.com>
In-Reply-To: <aEKpKk71YuLPPMZC@kroah.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Jun 2025 12:36:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh3sbe9ZU_-q4Et=OWtedfFoB2tsZy_+ssMRZnsjApYhw@mail.gmail.com>
X-Gm-Features: AX0GCFtGZ3fLGhUMu4DFWfeNgP1rwthkpBUB0ueA9yTfoNZEIvW9N3jor1L4vq4
Message-ID: <CAHk-=wh3sbe9ZU_-q4Et=OWtedfFoB2tsZy_+ssMRZnsjApYhw@mail.gmail.com>
Subject: Re: [GIT PULL] TTY / Serial driver changes for 6.16-rc1
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.cz>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Jun 2025 at 01:39, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> Here is the big set of tty and serial driver changes for 6.16-rc1.
> A little more churn than normal in this portion of the kernel for this
> development cycle, Jiri and Nicholas were busy with cleanups and reviews
> and fixes for the vt unicode handling logic which composed most of the
> overall work in here.

That series of "revert one series to re-apply the other" looks
absolutely disgusting.

I was close to deciding to not pull this at all, because some of it is
just inexcusably stupid. Lookie here:

  git diff d066989a3d41..d066989a3d41^^
  git log -2 --oneline d066989a3d41

and just stare in wonder at the pure unadulterated garbage.

Yes, the second series then improves on the first one the rest of the
way, but this should have been done better. And I don't mean just that
one truly pointless revert and reapply, but just "people should have
communicated that the patch series wasn't done"

I've pulled this, but I want to protest this kind of development
practice. The complete mindlessness of that "revert only to reapply"
really almost made me throw this out.

               Linus
