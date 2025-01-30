Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1200B38DD3
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 18:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738260952; cv=none; b=l3ygcsHQ3ZALyCL6coU2E6z7ErqrEo+pCwcIEptW0y8fVioETrqJBLxb8x6180cwAvbS4s/nG0qhBHyA6AjtF4ascaRxcvGTyjBE6WyXC9i5IPuwr11QVDSNpT3X8c8cgi4JWEaLCPJP4D0nkj3XmbTMFM6ZZt5iByQO4nxIqDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738260952; c=relaxed/simple;
	bh=At5pzXzArVUwf/ifDdm/Z1ds0BoRp6LnLgHv8zhoARI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KfyQco9QENSvUVHFDoroDW0SamrATK6A/kFiltqriKXfyK0h940/8duo4YwS+vpTwU8uhtBec6OSBlwC88MahqdxcINkM+xMUuzWxbWHi1hWcMBQoV8JyK8U/63MIbntIKbE0mv4ot93rcQ65e8ArLcLf5lYatk5uxVvxIyhmmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZFSKpVzr; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZFSKpVzr"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-467abce2ef9so8231cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 10:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738260950; x=1738865750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEOd77SjPb3m7UT+5pRuzEhuc6qBHIUpHw9saacVwdQ=;
        b=ZFSKpVzr45UPgxBYQxiPSDkR/NkP6BNxBqb+aZP5fxBY1jJH2KxX2O7z8LHQJ0puKI
         JU87GHeRSOYyh2JZEk578Lnj852FUDq7RdYjvB2bulZvYLDk7QOH9Ba35fP0/n58KE7S
         +iMcDrRWYJMPAR+KMxTH9HKbK2mJM/hwLbkdgcAwZ6b8u6nr8MVmSmHhUHamC9Zdg9WP
         k9hdThNZU1fID3+l+EIm54JtX5KBSHUeZ+grepEpbionP0u/hRs0eqHnidE5BZzz42Ed
         NupzRsq0fArJhShFAaEsK1vB0VVo1Wm0uqz74eyE2rDjafvwF0dNPDwGvYoTTYzBL97m
         zq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738260950; x=1738865750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEOd77SjPb3m7UT+5pRuzEhuc6qBHIUpHw9saacVwdQ=;
        b=utqG7MSBFhTrlQ2G1Q2lDQ73NAl+ANe9V15r6duLohcCxa6bxiwCOsVglFYxSDB1+w
         4anuBjdCTFrvO/vh8Z9zUtGkruY1yDmM7xCSOZKvlkDzWBYOTCSySkurfqSrHancW1/D
         CJKrYqnNp1cf/No02YW+WJ9s9uJOSz5vQqaaryYkpxOwRW3TatwbroOGJBgTxGgzb1HE
         limZEFzG7lFPjgVk1e+T8tH+oqRFcN3qunHfFgbstA4IXfYYi1ZozCV1dsFUoexElKZ3
         KtjtnlW295chv9DdlO1caw1fkwM54zRw9+cDuG+6CHSfj0KgAvUGPQ50nnZdzlG681Lx
         UK9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3hV4KesA6aaglLNjjHfRtWVz6cozS6uCGt24iLkgc7bjEavpSswsWVdMPImagAbN0nZuOZKB2Qblqerc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr6gnAflV5Mmg051bAIkxSQ8Qk5y3NrpMkcSerecAt5HfxDDCY
	jFD1Zrpu3TCSCK2gCKfc0as/sFlLG8qpqSgZzHTCiifX916Zv6ZJf0PrH/k6sDM4FJogH2cB8yr
	v5WwV+GQBUR7X3Wxnjs668Z1P3coAyn+oNHYL
X-Gm-Gg: ASbGncsZt/2s04UZnFnFnw0OUWZTNZK31Md5NwnyDjn/B6J1rXMgXnYLulY2fME2xF/
	2YCUg6jREc5hUVMj38xkZPlmja3jmR7Sl4E27hiad/f2icXGqblQ0kv76mA8L12OFUfSSl5cqFE
	ZJs78qNrZ//8P91fWLRiTzk4uY
X-Google-Smtp-Source: AGHT+IFp3IJsIIJ2xzyXdmC4xIiXCDX+fRic3ZlvOOA8Nre+b/VfyACkHHml3EuDasdckZPGmgEzAI0EypULH8+K6l8=
X-Received: by 2002:a05:622a:3cb:b0:466:861a:f633 with SMTP id
 d75a77b69052e-46fdf5b7ce6mr3849541cf.5.1738260949710; Thu, 30 Jan 2025
 10:15:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250127215020.4023545-1-mclapinski@google.com>
 <20250127215020.4023545-3-mclapinski@google.com> <20250127171857.34c71d3a6f0cde1953b02a58@linux-foundation.org>
 <e524abae-918b-4b23-8648-bf56f78464de@suse.cz>
In-Reply-To: <e524abae-918b-4b23-8648-bf56f78464de@suse.cz>
From: =?UTF-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?= <mclapinski@google.com>
Date: Thu, 30 Jan 2025 19:15:38 +0100
X-Gm-Features: AWEUYZnKb3rdQYIrF52rDuhVSFHUBikcqJzeUKWyTV-PGmhKIVE_rm6uFpOUdG0
Message-ID: <CAAi7L5cc7q=3f_vF+7AYE15WTRDs8Tr1mkb6cm5YuU8n8Wu0cg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mm/compaction: make proactive compaction high
 watermark configurable via sysctl
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, Pasha Tatashin <tatashin@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 3:18=E2=80=AFPM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 1/28/25 02:18, Andrew Morton wrote:
> > On Mon, 27 Jan 2025 22:50:20 +0100 Michal Clapinski <mclapinski@google.=
com> wrote:
> >
> >> Currently, the difference between the high and low watermarks for
> >> proactive compaction is hardcoded to 10. This hardcoded difference is
> >> too large for free page reporting to work well.
> >>
> >> Add a new sysctl, `compaction_proactiveness_leeway`, to control the
> >> difference between the high and low watermarks.
> >>
> >
> > Oh dear, yet another tunable.  Is there any way in which we can
> > acceptably improve the kernel without adding this?
>
> compaction_proactiveness between 0 and 90 works as usual,
> thus up to low watermark of 10 and high watermark of 20
>
> compaction_proactiveness between 90 and 100 additionally reduces leeway,
> with value of 100 resulting of low =3D high =3D 0
>
> or some similar scheme, as long as a value of 100 does low =3D high =3D 0

Yes, I was thinking about
leeway =3D min(10, (100 - wmark_low) / 2);
to be able to get small leeway (and therefore more stable memory usage
on the host) without having to opt for very aggressive compaction
goals.

Both of those solutions have the disadvantage of introducing even
bigger changes to the behavior of systems that were already set to
compaction_proactiveness close to 100. Though I'm not sure how common
changing this tunable at all is.

> It's rather arbitrary but AFAIU does what Michal needs and higher
> proactiveness means more aggressive compaction.
>
> Question is, would anyone else find it useful to have low_watermark of 0 =
and
> high watermark of 10?
>
>
