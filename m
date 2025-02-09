Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75471FAA
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 00:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739061516; cv=none; b=fh1pVxHZHhtr2m8CP6TgAEk2FsTuoPgudikHs1TSMEWO1NQQQtewPmtWVcN2NGYuYgPrqv9Fb0rQc1xo2XVEtvUZPo0z/jq/aaPoNuDton7MFPEGidLYEBe06r1+6wMUhwKMBUvWhsBgsNHS62BzFlwNqNgT8GSsY89FZ/LrPZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739061516; c=relaxed/simple;
	bh=CqFwDQk8ZO8KaElTUuAAT5fEUMYKx14RB/fB9xepEq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YfaAyKWDt+FceuExVe5kMyiXc6XNgnDgdo96XTNQTu9KAZoo8qUt3ecEaDTu8AVYHR+YwV+cDtxB/yM3YTA9a/89IgsG9LRzI5/22/TyfTfvejrRORByKdubCXWWxhEc9NJlZHMxLrQjNkKL4CsZg2x+uagbVUrnWXdQqT1j6L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iQ/Ryz2t; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQ/Ryz2t"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e41e17645dso29643076d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 16:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739061513; x=1739666313; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtFxXHIEUU6XMrO6182OKYlXQcVc9DZk/u3p5a1Aph8=;
        b=iQ/Ryz2tmSF/NiVAyr8uStd8wqin/ChY+ArApdc6i2DbMy8n4v42k1pBtbNNeLI6Lq
         orfrDwr9n7bJ1EReY4W7lak04U1GeCFup1zU8Iq8KRGfPb1ndnU1vSzr10sTADy214gN
         7Ea4LGYg8YNNBjEETifR7Fv6UU593ufMFAWqLEMN3ynmTdUkD08cLAXbocjdr3/rin5y
         fX4n/w1SIu0awhTqIHvrnNy70RDL4Q465RoJOMU8dcsMFxD9mzeKQ3gBBUUzx4bntXxF
         Zp1MCRhITqWH8PX4PvGv9FGmnYm+oo2+LL0C3NbqTfEd+ikRpmehHs0nP7Kr4KdCLTB/
         xEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739061513; x=1739666313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtFxXHIEUU6XMrO6182OKYlXQcVc9DZk/u3p5a1Aph8=;
        b=MlGvCNQaEt4iPOJ23HFWG/BhBK5M3Xs656xQKIw1AkA+A6+XFZWZ5h8C4xMOUjYWUj
         G0stz1JX9xhlIymPi1K5kAVve4ugAoVR8WYRlUUIZPsRMtbDjO4oWxVlD1MfuzBDQglj
         /wYeLuXDvbc6gjpXs0WQJCgxuxj6y5nmPo89XM6XK9zu9uYprAVzKYIWr7cUmqRpp4m2
         n3CwVtX7bs9kSoOPorBKCKJY+xzbU/viFg3VE1nSbi09dqr3FgRRAF73atHyK7cJlESj
         C3rgTatpflI/P/REoPsdeXfKYBlrfzttS7LYLQU+S3wa9CQ5tzZtPUv3Q8HhPR8xfMvD
         v1ew==
X-Gm-Message-State: AOJu0YzcN/zGNF56puMYCtViBELC+kON28F+n7wWtemf9nbwzFOX/88z
	0wO2z9M8C8lb6cwurizg/0fcy+nZZLqX76iEmiXJ55KFy1cyGS57cXMhq39OmmKLgoZI20cvM4G
	HqF5dmcHeB4Wm9Qu/aplpxr508NbA8HNMo18=
X-Gm-Gg: ASbGncuJ/CqG7dwg/okt0lS06MxcgL5tIul6UaTrFbqJLGQj+Lwftv9Sam1lTgeqUoK
	bHCkbQ9dJzy/xJL2w64QKeXNoqwL4hx2t+OwMkGOEVmK2nEsDSfXkNNcoTrDEyQCG9+5CmfUQnA
	==
X-Google-Smtp-Source: AGHT+IH3HtcDCwXi1TseCxZ2c7bhcBtcdZWzVEGkkpRzwdVhrVOR7AqjYmrtCJV4/M6fdA7c6Xj2jBWBbfqsKHeP36k=
X-Received: by 2002:a05:6214:5098:b0:6e0:86ab:4b46 with SMTP id
 6a1803df08f44-6e4456d2125mr138522486d6.31.1739061513150; Sat, 08 Feb 2025
 16:38:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204040444.6299-1-diego.viola@gmail.com> <87cyfxfxix.fsf@trenco.lwn.net>
In-Reply-To: <87cyfxfxix.fsf@trenco.lwn.net>
From: Diego Viola <diego.viola@gmail.com>
Date: Sat, 8 Feb 2025 21:38:22 -0300
X-Gm-Features: AWEUYZlhbZ3CkfeYlijPuL_4Rcu_4V4WXA4LxsE7ly1sUQaceiD6ZP3q8IdhPtc
Message-ID: <CA+ToGPGsTHhU+CAZqhEfOTmB3Asn48aOh7oN0yBtrR-4SRQOow@mail.gmail.com>
Subject: Re: [PATCH TRIVIAL] docs: admin-guide: rename GTK+ to GTK
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 2:08=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wro=
te:
>
> Diego Viola <diego.viola@gmail.com> writes:
>
> > Upstream calls it "GTK" now, see [1]
> >
> > [1] https://mail.gnome.org/archives/gtk-devel-list/2019-February/msg000=
00.html
> >
> > Signed-off-by: Diego Viola <diego.viola@gmail.com>
> > ---
> >  Documentation/admin-guide/README.rst                    | 2 +-
> >  Documentation/translations/zh_CN/admin-guide/README.rst | 2 +-
> >  Documentation/translations/zh_TW/admin-guide/README.rst | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
>
> Applied, thanks.
>

Thank you!

> jon

Diego
