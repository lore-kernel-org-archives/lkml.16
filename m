Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA884535D8
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747123070; cv=none; b=AOKbO6DNHh+1uJtd09FfiNCUpIY7abIAa3MmaT5ASY2Lp3YBJ9LRtePG4ErArHTMg0W0gOdcwJ4D8vS3sfqiM3Q11tQfvfjuwKSMir9ydX05Jh3zuybmVScVMn+C3o5khHPyigw1JlJeCdgSvhWd90bBdyA0fn7bqGdZ5eD21ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747123070; c=relaxed/simple;
	bh=QsPvCeXq5hg0Tk+eYDzBTh6QThUKaB6hBRXmouWU5aI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ky1Ix0T0jRopGSYIBM16jPM/mbf3b/EmvUqQO6ZF3S7/QJvAzTcm4nTxIE5sdHWdaRjvNhANEGzIgMaYXlbyuY21bbLMYK57cVaKwTwrBC5zlTvJY0poBeHZB2Lt1zI7NMXIKS3LNQsBYjmF6y3TO7ImbIpwUTpqQeOAQ9aRHk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=NB8rDEo0; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="NB8rDEo0"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-476f4e9cf92so44491901cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 00:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1747123067; x=1747727867; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SXJVtZL1or8cMJixWX1yCQl+rGlb0UkQ81qk49TibCA=;
        b=NB8rDEo0PJef0u1NBt3NKuC+S9leWDZwdqNhVEhGHkk4cdgUk8LQfJ8rFiBvt2zxty
         CtYmHph4rfbN1Lk5TOO3pcxBshF5HlG8QL08a+rottWc/lxvlQgyq1xECPid0mYWOe/V
         DNRzCtCQBGX9GGqyskZhygJGLhn98YVY2VUgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747123067; x=1747727867;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXJVtZL1or8cMJixWX1yCQl+rGlb0UkQ81qk49TibCA=;
        b=oZGFr5AWmiMEvNR5gJlRGKL8qptrxB9TSo0opw+aX9146uJpF93n9MWmScBRd8tylh
         Rxj8qMP89XCL4srjuXIkt/7DHixa15qYly3RlJ17feo5by+XozX2Mo2UTCGws/aU5tZV
         w9UAQzjbaRBadcGWUjm2V0I+rv693BDKgsPCm8FOLm+3J71fhdpl/auKBoMIF4yTUiiH
         yZ+qi98ZZuFCBg33JX587PKyVqmdwtnaRKUFes1e7ErUkxt5wvXj11u4VzBzoCeaKwTS
         qin7Ecx0iqOJWw2pCbno3UAzqqBoi1bPPP7af/bnCB4oZh5Ek0nX7XEN3C3AGCPEgLNT
         vJyA==
X-Forwarded-Encrypted: i=1; AJvYcCVgoEzetFocZVLoC82PCNu3wsrkpnGuFtXxPTPgs7lH0/NZEo2lEm+AsWWqa9PvKenfTBWZCQqaz4TO7qA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN+1WEfoFcNuzp7W5xcDGYj8F0LZuBoH4LFJOfkGB7haBBqdnq
	t+2lpgL05rmSNwRgjqBiHNnzCOQkubPQAwTIoECAqwE5/A7zWy8QziH4ixUqbzVVT+CicK8Jm99
	Csg0wv+v23A9buXe6LPVC5lwNyLNaHnzP0hqkmw==
X-Gm-Gg: ASbGncsZXjgOEa8kts1JylBRfDukZCIzEkfEdAhiOBKKOG52A5fYwLYYPzuFP0mR9i9
	Oqx9ok1jgrEQN3pGactgHoPsAGZPHeN7UnxMnQdFwhS1n2TJCsoKsUEY5cA1OeMb7bOt5CpKKOF
	Z4mkGT3IpD+gKbWh+xoCO5rKXy842G0qs=
X-Google-Smtp-Source: AGHT+IHI6dsSKsGZFfoZq4o/Ub5Ri5nv7cGQmV1dJDEinCDieLL/mFotCccaNVUSBg7uUwM57BkT7txrx05cpWkH0Bk=
X-Received: by 2002:a05:622a:1892:b0:476:7d74:dd10 with SMTP id
 d75a77b69052e-4945273a9a7mr288477541cf.19.1747123067580; Tue, 13 May 2025
 00:57:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-fusectl-backing-files-v3-0-393761f9b683@uniontech.com>
 <20250509-fusectl-backing-files-v3-2-393761f9b683@uniontech.com>
 <CAJfpegvhZ8Pts5EJDU0efcdHRZk39mcHxmVCNGvKXTZBG63k6g@mail.gmail.com>
 <CAC1kPDPeQbvnZnsqeYc5igT3cX=CjLGFCda1VJE2DYPaTULMFg@mail.gmail.com>
 <CAJfpegsTfUQ53hmnm7192-4ywLmXDLLwjV01tjCK7PVEqtE=yw@mail.gmail.com>
 <CAC1kPDPWag5oaZH62YbF8c=g7dK2_AbFfYMK7EzgcegDHL829Q@mail.gmail.com>
 <CAJfpegu59imrvXSbkPYOSkn0k_FrE6nAK1JYWO2Gg==Ozk9KSg@mail.gmail.com>
 <CAOQ4uxgM+oJxp0Od=i=Twj9EN2v2+rFByEKabZybic=6gA0QgA@mail.gmail.com>
 <CAJfpegs-SbCUA-nGnnoHr=UUwzzNKuZ9fOB86+jgxM6RH4twAA@mail.gmail.com> <20250513-etage-dankbar-0d4e76980043@brauner>
In-Reply-To: <20250513-etage-dankbar-0d4e76980043@brauner>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 13 May 2025 09:57:35 +0200
X-Gm-Features: AX0GCFsDFZdwWLBzFGFEw6NDwwOPLVDuadqeBK8hpwKan4IfdIF7U4uWzPHpP8g
Message-ID: <CAJfpegsmvhsSGVGih=44tE6Ro7x3RzvOHuaREu+Abd2eZMR6Rw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] fs: fuse: add backing_files control file
To: Christian Brauner <brauner@kernel.org>
Cc: Amir Goldstein <amir73il@gmail.com>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 May 2025 at 09:39, Christian Brauner <brauner@kernel.org> wrote:

> No, the xattr interface is ugly as hell and I don't want it used as a
> generic information transportation information interface. And I don't
> want a single thing that sets a precedent in that direction.

You are getting emotional and the last messages from you contain zero
technical details.

I know about the buffer sizing one, can you describe your other gripes?

> > But if the data is inherently variable sized, adding specialized
> > interface is not going to magically solve that.
> >
> > Instead we can concentrate on solving the buffer sizing problem
> > generally, so that all may benefit.
>
> The xattr system call as far as I'm concerned is not going to be pimped
> to support stuff like that.

Heh?  IIRC there were positive reactions to e.g. "O_XATTR", it just
didn't get implemented.  Can try to dig this up from the archives.

> Then by all means we can come up with a scheme in procfs that displays
> this hierarchically if we have to.

Yeah, perhaps it's doable.

Thanks,
Miklos
