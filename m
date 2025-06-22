Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116AE4409
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 20:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750623004; cv=none; b=sv9q0IBIbEsok3/kBSjBkVokRbEB4lmBFvyycXnVso3ay+9AtHThsoqK9f03QxsG3y8zH5jmg04Qcf6/RI07oxhcmKyLqIf4pLwxBejMhjPolmty/kEhauRpd6jer9lLXr6gymumO5KCS4ZjzQr/AyuOeJYvRDRc9D5j6C1e/r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750623004; c=relaxed/simple;
	bh=RLlTtbGIkd2WnrLY6pst/lSjGikLjHy+0aURPSy6JZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T+5ho7GkJWrA/9iRC7f0mmHHjrTeL5sd355V7vVDv3WxudeBLnjVG/88lZgV64VsVcqct/4VsYYGKBsFfwJgHSXkrDucSpPoFm3X3OJh8GzYWGJ35zO2dLe2G4lO1qJkTfuPBU+ItlbEOkt3+6Lqgg4moo/Of+QeyoXveL7zG/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3l04Kk5; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3l04Kk5"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e81749142b3so2987666276.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 13:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750623002; x=1751227802; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RLlTtbGIkd2WnrLY6pst/lSjGikLjHy+0aURPSy6JZw=;
        b=W3l04Kk5XaTUIBe0uAlSGDPecw6TvBh+/0Tq/XjKReuCVYaO3pCfMbUz0B3IQ/fpZ6
         qZJMKF38AKRe/cf7wQUQYYWdGo0V8i7KFiaxiwTheNhzPBQ00XBupqWxxOuJsWd52B2G
         DXGsaSyCSck4oUyllSQVMoHLJRx2z+jlvh+ofHBf3hHJwROiFgH0J88gmygPocHkPEHr
         4qfgdNX2FsR4td82X6yPXt/99Q9p3bqF/nh2tK5LBqezVG0XAOjSjs6PQSJ85ysgvCLm
         I/mWedG9d8Vy8czhWu0M53jKukOkpZiKW+XjXZEgb4C0bvAcJC0/dCmX8BYV7lAHtMBp
         kniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750623002; x=1751227802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RLlTtbGIkd2WnrLY6pst/lSjGikLjHy+0aURPSy6JZw=;
        b=U1xGHM21JLGGY27+55nm19vTDXiqvwbbLlureOUaik2hcK1xtwfbdeivpBoLVeJf8v
         0jrAQipcfzNwShkREZLklnhHuLILhe5pXlt+v2zxa383r6NDYeZU9FbMxLn1yLU7Z5Lz
         fQP9aVRpx7gEO1mEWy3mUvp3DKfJ173j1Ew80jBe9s5FLXWYFv7OZapv0a7s9EOoGqP0
         9Od71R+vrvn+qlGRmB4cew30SYKs/zW+u0Rd26Lfw8WSrLjNwhvmbC9DMAtVQeXVZLB1
         yoG9ceyfyGBJeGjgQiWZTdnahx9Wjy9mZLbPaXXFRIfkuzZ3IEkU3dwt3YvNZLXMrQ8h
         yyww==
X-Forwarded-Encrypted: i=1; AJvYcCURRLrfX9jYz3WD1KYbY0fmVjIbeqLD12esiVg12sQGEbaUKJ6NcSYLl+gTKWHA6q2Ppt8hkiI9dwd7gx4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDlXJ6zqS+cxY1Qrci+VDcPqKuSDfU9x8pjiNrvm0RyVYyqGUg
	Cbmo+E6zhmJ73bJUI1qx/s3Cftt1fIXjd6OkLB8FLZ48O5DpJGnEHt5WxAXrnQyzPp8Y9vWslAZ
	8Tepzo32glR22SXkziPirjD44temZTRCUiDGCAvQ=
X-Gm-Gg: ASbGnctNPt9lL2bK9yGy0nU+cE5EY7alnFyyiTLa0vykSCxhWh1q+3xZMu4ErPlggji
	bolqsKFDaDgrVcBjf2ysR1Wt0zCh+Onl2CTXXTA8IFx6EhtvNM7TYVU7rOx+G7EMvNybGiRSZP1
	OsQSKew/QME2+KdeJbyUjimrl9g7+IaWrTjZXoRAVJLKYIngA5MEt25Snt1RZJi/0aP16lMXFG
X-Google-Smtp-Source: AGHT+IH/QbHlv0d5LvDariDLVy9bYP9kuiri86X6R6Wf+mNq5l225sSWKZu2l5H1dZZKJaJklP1fhfovASEYZhGPfCk=
X-Received: by 2002:a05:6902:2601:b0:e81:9e35:c60c with SMTP id
 3f1490d57ef6-e842bc773f3mr13107484276.8.1750623001848; Sun, 22 Jun 2025
 13:10:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608163559.36401-1-a.jahangirzad@gmail.com>
 <CADf5TKvyKvaP3eZUR81ND6JQUfVqUEroCrXp=joZ8GHdu2EBbA@mail.gmail.com> <20250622184815.GW1880847@ZenIV>
In-Reply-To: <20250622184815.GW1880847@ZenIV>
From: Amir Mohammad Jahangirzad <a.jahangirzad@gmail.com>
Date: Sun, 22 Jun 2025 23:39:44 +0330
X-Gm-Features: AX0GCFuYDKS6wqvx3AWbJ5HrmH8X0x0efV9w6EhbpCgQ35IdWOoVIV48DnoMY68
Message-ID: <CADf5TKvorgeCJ=6u6=jhxetUhDx3SCnUBe+cpbUQu5gADqRRCg@mail.gmail.com>
Subject: Re: [PATCH] fs/orangefs: use snprintf() instead of sprintf()
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: hubcap@omnibond.com, martin@omnibond.com, devel@lists.orangefs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 10:18=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> =
wrote:
>
> On Sun, Jun 22, 2025 at 10:09:58PM +0330, Amir Mohammad Jahangirzad wrote=
:
>
> > > Replace sprintf() with snprintf() for copying the debug string
> > > into a temporary buffer, using ORANGEFS_MAX_DEBUG_STRING_LEN as
> > > the maximum size to ensure safe formatting and prevent memory
> > > corruption in edge cases.
>
> Out of curiosity - have you actually looked at the format used there?

No, I just found this through static analysis. Is there any issue with it?
