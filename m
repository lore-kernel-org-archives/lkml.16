Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286521C6FF4
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 23:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747178000; cv=none; b=qnoJGgnDQT6wNC9XZN2h7U17gAyVWC0+YSpmIGbpxecTfVlZ+1vuVUr7AzgAE5cWi4uZdSx8Nsamv/Y+i1c5w6nAU25aJgvWcnq5hSG343koZ0AYjPi1OP+rDXeKu6kpShv+JVx6dhVIHfL5XKuWLcKvJsQUVMiS0duP9YnMqWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747178000; c=relaxed/simple;
	bh=mkNoC9Ryjx5ogPibaruvHLv5BB0SKVa9LeUZetHB668=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mYVbCG7Xfqztb0+hKsMsAQ4e8vUbNZFmVhPkxY2JzQ1rcoI3wb6oy8KHH5MgoLtTJhiRSDdHbsf8gjG5Ac+vCvMlzQq1Nq3sg8GvTSRacGKZQ46rBLvzIqx81GvoBNCyyYA34HZeNRCErPN9ea7kkmvVuG7I4RO2tbSzGls2RCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=dZ2Q8r41; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="dZ2Q8r41"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70a2970cb70so50313537b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1747177998; x=1747782798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiQbN1KcgTdXz0K2nzgAi4Zdc8zBRkZfmeECcgv3ydc=;
        b=dZ2Q8r41/H/WVPFxRkTvgt116JPUMWrXkKLKUm+HTy3Jc4ALAfb4M1xby7fRHPiFRu
         0o++vToPt831qri85tV9CTMBZ4kVl/GUn8gj2lgwp3/enONWMsJZemHCMwi7ywYbP4On
         g3006Ln7sZLiLe+acUSk3H+UkV0WfiqLH/KJTAHPT4GYvCYbhcCHIgbEJ6P7FVlyOI+C
         mO/yVV3Of6Zzh1KJVouhYMkoQ+iJZ3Drt5swuHKTlhBKuLoc+cfjaI+QXY7DXyFrrSJS
         DmNwBbW29pvpFxdajyc0a5sTSov05eciea0vMwARymoZOiWU+9otaF29R88sTJ3+o4wx
         g9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747177998; x=1747782798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JiQbN1KcgTdXz0K2nzgAi4Zdc8zBRkZfmeECcgv3ydc=;
        b=CBZREbMiiw9hQuHxSAfV/c+kk+CLWlFTPIdLPE+lGxtbkKxkvja8FAI0uzHu/qFfw/
         Je+9F26pwyDcfo7Kv48DwZIaT4oxuifHWuJWLcWwpPgL+QEXlQIRuNfdcuMK009zP9bE
         5Bq0qFWwQ3PmU7sCylC+qyTvIp/iwv5SvO+Yt56yBNEZUqa9yisyA60fGSYDuB6xjn8N
         HKZN88bH+4C/xZfhtRaZQcTjandoP0GwA2fO3PFOEqyNEFwGjnHdPaKEHCiQKwvHw8kt
         qo9AL1pUIYnmDZP6HEIxanN7MM8DSDnqtYtn8YBXsswtGaH36+TzaT5+M9CuPLwC7Q2b
         QGOg==
X-Forwarded-Encrypted: i=1; AJvYcCXlZ4KozDI20OfcBOBJ5TJTHrN4bDgxN3yOLnZdBRatIPuCWdvSSsk0uNcN2GWHPcCoZTqHgiV8CmODR1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/9Py38mREEOmAnwHzUTlEr4WHSbOx0KPLzt7J16Sd2G+bIEDb
	R8EFb3zcAEN0CNFgeLwZtc3mTImH5oWmTv1cnnSYYHs9nJvxAqLbObmxMZK0YA8hk2zxi2+fYq4
	+jjd8U7w0TQXurx5A6AT1piia0CpSWihQli2o/1MflwgZCDtaCA==
X-Gm-Gg: ASbGnctyYP0sAnvJB3/iX7PgI+Mnp4w9Yi1AanXkyk52vS5SnVqN3bwdR7AqQ0NqY7m
	D/ClldwpyAgf1tmtcD6XzgX6h5vkQ9OAUMRfsDTqrOk9J1wgYya40rxh/j1gpKLKoyxTWWd67s8
	2Nho5D334WxE7bArCIphogwFLef7Nbhk2O
X-Google-Smtp-Source: AGHT+IGLKVOpD4gMWPsE80wgsYXtnIT3oZdD49clxQKHdbkqN8XwpQ6PDL6R86iNciW5PD8VH5cUkNh1g8L2GtOCwBU=
X-Received: by 2002:a05:690c:6a09:b0:709:1bf8:f7a6 with SMTP id
 00721157ae682-70c7f2221cbmr21351427b3.28.1747177998122; Tue, 13 May 2025
 16:13:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508140438.648533-2-alexjlzheng@tencent.com>
 <20250509032326.GJ2023217@ZenIV> <20250509043757.GL2023217@ZenIV>
In-Reply-To: <20250509043757.GL2023217@ZenIV>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 13 May 2025 19:13:07 -0400
X-Gm-Features: AX0GCFttm-rmrczbIyF2qWJ3ynZfRM2SOJV9UI_yLmpmO36LFSjrxOCcAum3iQY
Message-ID: <CAHC9VhR7-R20Q7A8RGCAMvBxNyUXOcj-dHAcMi-GAyVsxQZ7aQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] securityfs: don't pin dentries twice, once is enough...
To: linux-security-module@vger.kernel.org
Cc: Al Viro <viro@zeniv.linux.org.uk>, alexjlzheng@gmail.com, jmorris@namei.org, 
	serge@hallyn.com, greg@kroah.com, chrisw@osdl.org, 
	linux-kernel@vger.kernel.org, Jinliang Zheng <alexjlzheng@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 12:38=E2=80=AFAM Al Viro <viro@zeniv.linux.org.uk> w=
rote:
>
> From 5c463d47c814e16adb6e997a05ca5625df41152d Mon Sep 17 00:00:00 2001
> From: Al Viro <viro@zeniv.linux.org.uk>
> Date: Thu, 8 May 2025 23:38:01 -0400
> Subject: [PATCH 1/8] securityfs: don't pin dentries twice, once is enough=
...
>
> incidentally, securityfs_recursive_remove() is broken without that -
> it leaks dentries, since simple_recursive_removal() does not expect
> anything of that sort.  It could be worked around by dput() in
> remove_one() callback, but it's easier to just drop that double-get
> stuff.
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
>  security/inode.c | 2 --
>  1 file changed, 2 deletions(-)

Replying with a lore link to the associated discussion and warning so
we have some record of it in the LSM patchwork.

https://lore.kernel.org/linux-security-module/20250509044613.GT2023217@ZenI=
V/

--=20
paul-moore.com
