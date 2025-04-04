Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D30425776
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 07:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743753536; cv=none; b=HxpUKPqKIvkg0Zce0RxTMoOmIlaQu9G1SRCF3nHUZgW80NdlhQweBFuQxJDTZsP2NNAM5Q1/kdbK9NeKWsNlhFQmI0PhAbWbZCnedeXnxERckWeI26Tk5O8HWOmHzqBTisZwveKzcePXOCBiNIgM/vlIwCp1XoP9f+8J46sfwwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743753536; c=relaxed/simple;
	bh=UUjzB8EKvto6Mi+McaUUa66PIdWe5H8zn4PvcUFx5v0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQEOqwP79wC0HIcLdVdK93rL6Mn1zaiHFba/dqlJrDWhK6bRLUTIfD0vFNk67WTji4kc8wnJVCZXA5weCzMqbNu/nxaWoBj771ZilOMOVRnVC14esCbFG8yhKthzAvB03voTRk8OuOEgi1WYXlvPhhaUgjR3jaV/SzzZj/mQWKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T2gtlH/X; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2gtlH/X"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-524125f6cadso1788203e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 00:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743753533; x=1744358333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGt7mfXqnCsxJf6ymQojTs7U2r6jHdpo83KmTV6yu60=;
        b=T2gtlH/XbSwXxoskRN+qDk19enLiSa+aYx41g32T0BgoEtlgfG71T0IZxQWVRuu4R1
         6kX1IsvrW43Ly6JTAH72SZnNdOjHj/NlYx8GMnBew3Dcr2OARptiPNZ7Tcp7PBHB8jOV
         cpy6tpERZYaHw5Nud7SvBTpEFaoUIacR+L3hb7Pz451Eg1EiUnkjMReYWXsJYcuZbDAi
         QHfX4I5XQm9hr92965hgZxARgRsrZDtCfexWIPAfQwbb4MMT6bRu0471Q/Fe3cTzckDR
         +Bk0UD/ORB8TIT86tKpE5jcv4PHolbK5I0jsUplhuU2qwm0lwCmRvTUCWAN0TPRVwDNB
         WzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743753533; x=1744358333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGt7mfXqnCsxJf6ymQojTs7U2r6jHdpo83KmTV6yu60=;
        b=uiYorCRH1G+q0/pigvPorbmnqJp/4/S3fwMsD98W6cT337Uka4RW1ae39et7W/ntqI
         hQC0fx7UxibHudo4AFFk0nXvUXJ1eo5BkhcmomrcZUOzAYkOwJ9/y+pNXXSpc3bovs0i
         gGi3QMQdwPU70qsyI8Sg14IuMTNUp9xbX8bXGSZf6lLGZGO97/kvhhZu7ZjUqSVeqIDi
         Rs83N0T7HjWLxDob7ClUybU4xiDXGCaqk8QxJqg55459o2MquPUdj4twX2AD/lxvUHle
         A6f3zjcN0GZDYIqx+x99GKfhbipi8ZRCnyhfIY89t0s9fsptwWe8+TFFK7IKVedSkgw+
         wcPg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ5qnD1JFsYekF7yYY4dCAFbd4O8E7EGmzluNmdhDgiGiwblhVeYJullWWEckA0eeqLOSZiKUPmXyGOUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBX+qFivmil/4eNoKdK7Pp6TdQAB8/RWldzxqDXU9vhc5YIEFB
	6dkhB1O98mTbqTCVAcG6P7BNBEWIX8yri5C78VucNxwkawu2t+7xnajuEXrM9GnhXeD/gIMW9op
	Cbo0A7mSMMeTzYK+XedCyxMBUs8I=
X-Gm-Gg: ASbGncvstDGIltiZi+GU///0YiuIGHzFaCY4XAscO0zlsq2GIl780NQak7AU7UlzCU4
	bipEZ4r0Y/qG+miDbxMws13atC/oP/n2wuxsZ6dKQjUBKR99b0joWRCbXuYnUPyHpvSdUOIGDH/
	tAyBlE6Z7JLJPlJJLD2wMuUhKVOPM=
X-Google-Smtp-Source: AGHT+IG18H2efN3W0ynslk7u6ZVVcWZdIvpP+NTBsn2fgurwqAFVSJxosdOjlAphvZS+agE+uFb1CvcSXL9ki1DqXqY=
X-Received: by 2002:a05:6122:8c01:b0:520:4996:7cf2 with SMTP id
 71dfb90a1353d-52765da1546mr778622e0c.10.1743753533250; Fri, 04 Apr 2025
 00:58:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743723590.git.abrahamadekunle50@gmail.com>
 <6fe7cb92811d07865830974cb366d99981ab1755.1743723591.git.abrahamadekunle50@gmail.com>
 <CAHp75Vem1E9wmmfXWsbawj2f+F=UkfzML7HyAnhTdsUqvjW91g@mail.gmail.com>
In-Reply-To: <CAHp75Vem1E9wmmfXWsbawj2f+F=UkfzML7HyAnhTdsUqvjW91g@mail.gmail.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Fri, 4 Apr 2025 08:58:44 +0100
X-Gm-Features: ATxdqUHLFQnBzkVzPAsbPZ-fN4f13INUlSaGlgt92rS1o8ASalZ-kH56X9NRuu8
Message-ID: <CADYq+fYU=rb1EBgv0U87mFMFe2ct87g05GEyu8oG9=+xHjccyg@mail.gmail.com>
Subject: Re: [v3 1/1] staging: rtl8723bs: Prevent duplicate NULL tests on a value
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 8:53=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Apr 4, 2025 at 3:03=E2=80=AFAM Abraham Samuel Adekunle
> <abrahamadekunle50@gmail.com> wrote:
> >
> > When a value has been tested for NULL in an expression, a
> > second NULL test on the same value in another expression
> > is unnecessary when the value has not been assigned NULL.
> >
> > Remove unnecessary duplicate NULL tests on the same value that
> > has previously been NULL tested.
> >
> > Found by Coccinelle.
>
> ...
>
> > +                       psta->sta_xmitpriv.txseq_tid[pattrib->priority]=
 &=3D 0xFFF;
>
> > +                                       psta->BA_starting_seqctrl[pattr=
ib->priority & 0x0f] =3D
> > +                                               (tx_seq + 1) & 0xfff;
>
> > +                                       psta->BA_starting_seqctrl[pattr=
ib->priority & 0x0f] =3D
> > +                                               (pattrib->seqnum + 1) %=
 4096;
>
> Logically it's obvious that you need to align all cases to have
> consistent approach.
> Besides that the commit message should mention this change. Something lik=
e this
> "While at it, convert '& 0xfff' cases to use modulo operator and
> decimal number to make the upper limit visible and clear what the
> semantic of it is."

Okay, I will do that.
Thank you for being so patient

Adekunle.
