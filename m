Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA51E26773C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750689603; cv=none; b=N6P2cSvwulR2HJSfP4MylVQjdWilJVkRH5tEJio3jhD/DJcOZiasXCUF4YQNfATfyNtrKvpqbvDy7QkYD/DkySZCJxOpto9Pg4h8h6c87bsUMnRzYIYXuQDKd5sOCiS/nua51qpcpwF2Tiof14btY7H2+PWqgMe0DaGDS6Twl9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750689603; c=relaxed/simple;
	bh=lHsHchyWhA35ZLt97FqmbFUE1/lGuLeWn/i1lL1eJ44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C6kEHzHOeGQSQz3JnGSLh6bUznWSKUu1mdC7IVOLAN528Dl9AAg8c6tgvWLZt66HKW6FRhCAKVrv7FJClrnsHL/EKAHVIroPaeg+DkbrEN2389mmvAqCQKHa1LGDVrvp3iJtv9Y0W5neQMwwLAWAXrM9wWzUpRy5ls36Z9Tuk1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PwbRHPpB; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PwbRHPpB"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-adb5cb6d8f1so669902366b.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750689600; x=1751294400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9+0NuJ2HzS3oX9trIsYNygO2Vo4g11wSfp7uWlAzH4=;
        b=PwbRHPpBhlmPizwH+MtEr6HbImm1x3JFpgi6CLiHBVXEjyet7sQl3j2Qyi4eik2Zik
         BIovRH4zz8XIQ+QXp3ffMw2Z+3c8uCJn2Ddo+kTZ0zi6T9oLSu+XrSg3g4DldB+65T5G
         MonlgXJ/cOuQ8WpFWS24/Pnm0y6PD1OjU2rRi7TdJy9iYoF78M7JPn5G2UMBXkWcxiBI
         BOop7zqklgbmpO+LpN2Qny3+UBOz32giwsofy+DIFOGZ4lL+Ipb4EMDK+s1XJJsOidrE
         AKeE1lFLqScZYVyKp4zb3G3SDtQEq6CmMUdXcZZ0RnTarLsh0M27O80owT0qdmN6vphF
         XxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750689600; x=1751294400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9+0NuJ2HzS3oX9trIsYNygO2Vo4g11wSfp7uWlAzH4=;
        b=avyXkRJQdRcqOqVnd+kHk0FIew308wrcVchfyNcygLogu043ndLGHMoH/M/xmDkw20
         0CI+u2Cofo0uLd3559XL/0wlD8IAU5UWdGNB7/3xmTMh66zp2SKCkIi3IXom/GXMMPoi
         lA4MdGCtenmOzsbeus6/sjeIKCkvyv7iNpGfuPYJ05XCE5Cv0kuTgnNI8y198WetD1fG
         BDgwWQ4jEe/dfveeAuxKmVt/L3fjnabeYUpGUzJN9gX4LPqj0dzvFlGNCdmCzLdMVUCj
         0wToP3dQsxIEv3qtI6DchwzY71wg0zZ3SI3Us2gkXBAkfWKl46wboCc92Heia6f5Y7wi
         6yeA==
X-Forwarded-Encrypted: i=1; AJvYcCXoqyVA+ZxuYq7yuH2A+nE8XG6NTsOswxXnSR3+m5eBchWo5nBmdiZboHzuESkf+g+QkPLVLHBxKf/F9bY=@vger.kernel.org
X-Gm-Message-State: AOJu0YziYwSM9QtDo/B+zThWSNEqsdXpoqOlhOfqrLuEFcLUhaKjY0PL
	ZaP/v1+dwG7EB7RTRSzZ2Ig0zbthJ3EfbT+Idqq1Rb8UVqt5S36iSe1IPUUmf+V4v8O2Wh6alU0
	nty6vLaPRSiqhbhHIlEWFFcyYjJFIasfLpjler0s=
X-Gm-Gg: ASbGncvuZ+A7GnGXvzZ3wIncNILSw8wtCR43XGtV9WaqclDHOIDnI4YSOFdU4wPViIT
	KL4MafYEU8TvMnDWZcuHK6g1QrSuchoU2sUjmdqtDEqgj/PnGo9tFXM6mwpfnuaIV9TSgTZ7HTi
	ICVWKxJvpbKL8+VGPi9QAYoUyrGh6w2fyEAx6J2tGyd4zQ7p08o1cyOxYAEaps0HP6IZRW0UUT3
	ER379hK85aU+eOD
X-Google-Smtp-Source: AGHT+IGUfp3/ururE5cq94v6XTOMAtl8+WlC/gPk79G9+PbfymbTdmHbzNmhQMSy0z48u3KWdnPgfyPlB02Iw4aF8ms=
X-Received: by 2002:a17:907:94cc:b0:adf:7740:9284 with SMTP id
 a640c23a62f3a-ae057c709c6mr1353653766b.57.1750689599796; Mon, 23 Jun 2025
 07:39:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620231324.99607-1-sj@kernel.org> <20250621173639.35906-1-sj@kernel.org>
In-Reply-To: <20250621173639.35906-1-sj@kernel.org>
From: Bijan Tabatabai <bijan311@gmail.com>
Date: Mon, 23 Jun 2025 09:39:48 -0500
X-Gm-Features: AX0GCFt6CknS4SwAMKaZry7XGCRzawldZjC64c_mubZJ1QNsGdLh9DYniVyb5kA
Message-ID: <CAMvvPS6yuosvLxUn8+GnGJdqE2LnfGgur0x0hTM6nqmBpU-q9Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/2] mm/damon/paddr: Allow interleaving in
 migrate_{hot,cold} actions
To: SeongJae Park <sj@kernel.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, 
	byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, bijantabatab@micron.com, venkataravis@micron.com, 
	emirakhur@micron.com, ajayjoshi@micron.com, vtavarespetr@micron.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 12:36=E2=80=AFPM SeongJae Park <sj@kernel.org> wrot=
e:
>
> On Fri, 20 Jun 2025 16:13:24 -0700 SeongJae Park <sj@kernel.org> wrote:
>
> > On Fri, 20 Jun 2025 16:47:26 -0500 Bijan Tabatabai <bijan311@gmail.com>=
 wrote:
> [...]
> > > That sounds good to me! Having a prototype from you for the sysfs
> > > interface would certainly be helpful, but if you're busy, I can take =
a
> > > pass at it as well.
> >
> > Great.  I will try to do this by this weekend.
>
> I just posted an RFC for this:
> https://lore.kernel.org/20250621173131.23917-1-sj@kernel.org
>
> Note that I didn't run exhaustive tests with it, so it may have silly bug=
s.  I
> believe it could let you knwo what I'm thinking better than my cheap talk=
s,
> though ;)

I only skimmed through it, but this looks good to me, thanks for
throwing this together! I'll probe more when I use these patches for
the next revision.

I'll try to reply in that thread as well, but it was only sent to my
work email. I'll try to set up my work Outlook client to work with the
mailing list format, but in the future, could you also CC my personal
email (bijan311@gmail.com)? Gmail just makes formatting for the
mailing list easier for me.

Thanks,
Bijan

[...]
