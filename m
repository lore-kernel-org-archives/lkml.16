Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A782525D1E2
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 16:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746204207; cv=none; b=B6/6lwhvZY+6bB0/8194TnXuIx64zicUszUuZoaNs3fE1li2QmPzFql7Tkk0YhweJz2S4q1MXukn+r39Nx9hVMourt0gw3U5spbd/MtTo5NffQuBavuRgN88sP2nz0cokJfIw5I6kbhkE9r/A1OBvSpbFCvP2j3aB1e0lbUoC+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746204207; c=relaxed/simple;
	bh=HSWejsQUIC5AVkuX0S8B3IVpbNA6F4zhsZS0ah5X99o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=neauP+9Bn/FgaG54IDtFsitOSFOn0R1ZJekYl452hEBXwI+gJ5djW2BzfHZkgP2jD5ELDmYzv+2UhAhLWiUts7VFiqyULZ1tyo6QCDXsqXZ5e8ZWI4TILgg1HvyXIBCTqjDIYr0Q5pLNTkLKKyHg5UGC/xAybRqDX0CBuvEU1bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W4jAsoWx; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W4jAsoWx"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d91a45d148so335ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 09:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746204205; x=1746809005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfhSF1OBdwUfsA1pakNcUwq7Cj4Gcs5LK2vK2irHdRY=;
        b=W4jAsoWxAl2hQcwXwKhaxrR5OTdkXvIMnG65vu+uH9e4Uo74a/G0jAWzW6P19qaFyx
         qk+u0KyQV9Id/WoB3zxf11uhqi56tHH2wHEpWP846hsOLXjBjCmdEBdcD6HK/OTnPS+y
         uHBAYPTy5QyS04PNnK//ttWYwzwAeCmSfEp+KYuGr87yGzCpiraX63BFkvFr6yhMFAt7
         eBJ54KhZFhv1aMaMW9T21BrDJR9DMBSvQ+ppluvftRF6hfqo5Q8Sy8Fajivp51V/hYgp
         KFhKoda4OOP15zmSWGH4O36kpYPxk8KcqryX4vmNGxYsFrqKhmzKZMcMCVRH4cxvDvao
         oYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746204205; x=1746809005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfhSF1OBdwUfsA1pakNcUwq7Cj4Gcs5LK2vK2irHdRY=;
        b=sGBZeMpiUJb5aui8ngzS1y7xCeDInepgrl6NchzyD4kh7CKrN0e9uto+bPW633i/VM
         m31vIYJ5DyirXYkIZVs+4WOY6cW8DGrsXtwXmngaHSGnKAeFn72uSCojs57D8Id5AdJ3
         dTU29QR5UKG22Nm9m+RzsFAJau8mxDGJrbZ8YG+TnnvlBcqyMyi/JLMb6HpXylEUfiyj
         t+1iuDN3ihhWg3tuqtStkW1LooMZ6QLL+LUeUaNe3D4qL8iqhbEJ1hIyrJaQm40oP8/4
         T/E4vxxgajdoROp+jxOMYBnGGBGzwQ1ozm0e2Ua8XH16i1x8k9JpbcO2MFfmMlByoO/0
         q/dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTtTvUGhLRTgYlwVWZ8rLTn03VJxNJ43R3R0u7aFtu+I6CHrRE0ypxkFMoauyzBgA8rbNKqJusipRzjAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YysCpkpTxwyRKMFmkqLkqdTyPmbY6+1CZCiY2oXchB/ZyFCLMdy
	4iNIBiyh+06jHSduGqhiIr4r3oIGQW6PHA4c2AtdsBhnRPwc5zpafFVK8s4hHkFLI6p3XnLHRdx
	h+QXWRXmwWeYjxcprGhNNkhe7iVijmuNEaMfY
X-Gm-Gg: ASbGncsAimvT4UZjd+oLhOmzHrWPArVt5wtXZzHKzGvsz3XdP7M/wTcXejaVYTpSuEU
	XfEJC5qBwrPddig1i9KF9Ony0c+DeqqmnVocC6CLUgS/hQx35QiPBJshCUoP44Y0CexktbzytVY
	a3nIuvytdl4wu5L2gx4gdSf5qKyU1YUM26tg==
X-Google-Smtp-Source: AGHT+IGl8Ey1mD7g9HdYk+68mf77nPG69tteIpFx6Qvv3ot7wI3HcIw7QJ3SYNwPij9nPcd00LD5BKx8PJeqjrdMYP8=
X-Received: by 2002:a05:6e02:b4c:b0:3d9:6463:a8cd with SMTP id
 e9e14a558f8ab-3d96f2523dcmr6638415ab.14.1746204204424; Fri, 02 May 2025
 09:43:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430171534.132774-1-irogers@google.com> <20250430171534.132774-3-irogers@google.com>
 <aBTs6yvKlCYYgU2O@yury>
In-Reply-To: <aBTs6yvKlCYYgU2O@yury>
From: Ian Rogers <irogers@google.com>
Date: Fri, 2 May 2025 09:43:12 -0700
X-Gm-Features: ATxdqUEaNzyEBZLtUQ1jfImxKvfknBZnmDSgU_oST5gHw-xFYWsjcme0fXmFH_E
Message-ID: <CAP-5=fXqLh7RdUok5oqVwyGOWCH3fktmVeECdi4ENBWnEHeJYQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] bitmap: Silence a clang -Wshorten-64-to-32 warning
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Jakub Kicinski <kuba@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 9:03=E2=80=AFAM Yury Norov <yury.norov@gmail.com> wr=
ote:
>
> Hi Ian,
>
> On Wed, Apr 30, 2025 at 10:15:31AM -0700, Ian Rogers wrote:
> > The clang warning -Wshorten-64-to-32 can be useful to catch
> > inadvertent truncation. In some instances this truncation can lead to
> > changing the sign of a result, for example, truncation to return an
> > int to fit a sort routine. Silence the warning by making the implicit
> > truncation explicit. This isn't to say the code is currently incorrect
> > but without silencing the warning it is hard to spot the erroneous
> > cases.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  include/linux/bitmap.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> > index 595217b7a6e7..4395e0a618f4 100644
> > --- a/include/linux/bitmap.h
> > +++ b/include/linux/bitmap.h
> > @@ -442,7 +442,7 @@ static __always_inline
> >  unsigned int bitmap_weight(const unsigned long *src, unsigned int nbit=
s)
> >  {
> >       if (small_const_nbits(nbits))
> > -             return hweight_long(*src & BITMAP_LAST_WORD_MASK(nbits));
> > +             return (int)hweight_long(*src & BITMAP_LAST_WORD_MASK(nbi=
ts));
>
> This should return unsigned int, I guess?

Hi Yury, I don't disagree. The issue there is that this could break
printf flags, etc. reliant on the return type. I've tried to keep the
patch minimal in this regard.

> Also, most of the functions you touch here have their copies in tools.
> Can you please keep them synchronized?

Yes, I do most of my work on the perf tool in the tools directory and
these patches come from adding -Wshorten-64-to-32 there due to a bug
found in ARM code that -Wshorten-64-to-32 would have caught:
https://lore.kernel.org/lkml/20250331172759.115604-1-leo.yan@arm.com/
The most recent patch series for tools is:
https://lore.kernel.org/linux-perf-users/20250430175036.184610-1-irogers@go=
ogle.com/
However, I wanted to get the kernel versions of these headers agreed
before syncing them into the tools directory.

Thanks,
Ian



> Thanks,
> Yury
>
> >       return __bitmap_weight(src, nbits);
> >  }
> >
> > --
> > 2.49.0.906.g1f30a19c02-goog
