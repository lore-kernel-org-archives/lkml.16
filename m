Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41953134AC;
	Sat, 19 Apr 2025 09:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745054267; cv=none; b=aw9CQMbveIWPM+z4+BrEiEse/E3UYvgJYAo7A7irQzie1eK8VCyLwE20MYO8e1bA2XGALE/B/2bWQmaY9/8FPAvfN89vViiinu+G+vY7n4IUVO6ncT6jZuUGfOtUT+m0IWB0tX9W5jokEZ1vDq8Lo6oB9EipVurM8P/32Te8Gz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745054267; c=relaxed/simple;
	bh=ejhtalbhXbis0GROqrot8TO6O1M7h9CQHQoED+wUlzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=swtKPgnTP9i3krNH8wGAQbNl7rwpFV1WCMMvhLei6jh2V1PHtTrk3Yp3DVQYcH1OUgzwCaMIcI438KRRfqXRTIsDoTp0pm1jIthF9Pp9iQCf5UEPVbN8mcIO8lsZyU8QCdJBHq+wB3CRDgMps4CQlNRz3u7lOp5S1ejgZgZ58jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3ZsjuKf; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3ZsjuKf"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff5544af03so594875a91.1;
        Sat, 19 Apr 2025 02:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745054265; x=1745659065; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2VBAYwV2LMrWAHCoDkD9FE8qKmGgZlHGJOZb6pCdYx8=;
        b=P3ZsjuKfoD3PCY37i58UAs1Z4lzLUJRZ44t9oa6m8pxfW9+Xt1UIfygA/PlqeS3Xwm
         xciVxUDVKkxJ5nXNv/bZPeUc3VABLvBVPeM3VSvqMX217Hpcon7NDRkYgLPYJBkEFv79
         Sk8FzH7J1LIiAdZdVVh3pRqaT9upM3nDKqFADivaDIRZehonIvsCHSCfZMszRAd1xvAw
         JGplzzv0Av7KkDL1ms9Wz5Bc3S1y8JPOb3JcGhh71pNZ9NmFZ4DDqAPbOC4s3ncptmtf
         aK/bac/ktIZohexT3pqV4m0SReZu1Qrnnd4FnQq3OvF6p67vH+g4VTZg7SpQseafhvlr
         SG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745054265; x=1745659065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2VBAYwV2LMrWAHCoDkD9FE8qKmGgZlHGJOZb6pCdYx8=;
        b=T8VNJX/j2wm4uA65yfYk1dnG622WEILZmPrpJ6vc0ZvGCDJTXm3P7aapKdHiEI6M9J
         G15kzKziUdxqsCXtwBOyXPWnTDNHJaYMZ0z1cIDQfUbjaP1Q98FDDPaUgZfveeAsDE18
         2+r9lrNCypkmoGaGeTU9SP45KZEmAWhLvUl2jsKfsCSK2Lobw0iyEF4sgFe6KRAMimb/
         KCakblMwhcjmWgvnduV/m8lDW9i5fvHt824RPwUaU4GSLRB5QKTpk3jys2eNgRv6jdUy
         e95umfPvW4ibcJl0SaDMRUmV4B1OazBGHxm/Mm07Rv0q0gDN/VQrVawNqIQGbN5qU+NK
         yCXA==
X-Forwarded-Encrypted: i=1; AJvYcCW0ttulDR939/5jjCgJ7KXOxTtNXapdrhE7tikZiNvLqW7Vy5P3/J0GxuS2ma0w8oZDAvJoC1c8lu2NMiw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd67vaTKKwAd6CY/rGfFPlMI2PgngZCK1FvJZHa0RR68VQk8+a
	hdMKPXBWxb7UuEiFLo8TPR99T8dBA+INmVUXVztw0ThoST6aGAclI3AeqcfNd4BPAAU08uakHbV
	aFLU8oW3MVdnNyKWrT67cQvkGbuQ=
X-Gm-Gg: ASbGncvQs+rH4DYw3DljT0gnSHHWK1wGY7eTlhurFqbuAOvPYRMTVrZuFKb9lMy1Obf
	rlqA695NdWIVfuNHHgwLS+mi6TzMPibWeKPswdLML1FOYyPx2fEnfE0wKwJfNVdqFCULqWJwzah
	Oy+jfyEwJrseoSi7yYrUqzWA==
X-Google-Smtp-Source: AGHT+IEMLkBabypUvgKaDYyWepK2Ii+0h3cJqrVCBh3l0R/E5e4HJM931GW+uyOL4kpXfLjBo8w9GJsNuEcXmZmm8i4=
X-Received: by 2002:a17:90b:3e85:b0:301:1c11:aa7a with SMTP id
 98e67ed59e1d1-3087bba8573mr2992875a91.3.1745054265325; Sat, 19 Apr 2025
 02:17:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1745019660.git.mchehab+huawei@kernel.org> <9bbcb399f6b6f68e6525131fea41dd0fc9c6978d.1745019660.git.mchehab+huawei@kernel.org>
In-Reply-To: <9bbcb399f6b6f68e6525131fea41dd0fc9c6978d.1745019660.git.mchehab+huawei@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 19 Apr 2025 11:17:33 +0200
X-Gm-Features: ATxdqUGspZWEx4DgsD-vcQZaMigb1ru2NHtL9T1YymoMhbW0bPwK1QcUA9oLdHQ
Message-ID: <CANiq72m5YW1aL+mAg4tcUwB7bKFC_4ZSGyeD8Z+mKzyPYG830g@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] .gitignore: ignore Python compiled bytecode
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Li Zhijian <lizhijian@fujitsu.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tamir Duberstein <tamird@gmail.com>, 
	Vegard Nossum <vegard.nossum@oracle.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 19, 2025 at 1:50=E2=80=AFAM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> +*.pyc
>  *.patch

I think the list is intended to be sorted.

Should `*.pyo` be added as well?

Thanks!

Cheers,
Miguel
