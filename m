Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0814A35
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 00:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744935382; cv=none; b=NbQOFhH4eFgFX5I38JOZpJsDMvZS20eCZsBINprItPWRoc/dFO5Jhv46NF903T2ShCQp3KXFWMNhfFwI+03T9sfJonPVgeLsxTDbKExbJUMeFrgPu1LbQnBrQHY9t0rzH6DNMKn0YHbVUaxyRRzU7HLJm4Vgixa0sqvZNL4Fz7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744935382; c=relaxed/simple;
	bh=lOOBnsEVQ83vWj+4JVv3ct2xw51zRGxGxwuZHHRMJZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tL0FzwpF2izsa44UxsR/fBtz9oABK98VDzMe11yVa5ZB92PHOSlxxRIDvTwMeN7uL8NhEk9e5XXrLRe/kpRCFoCaFa1dv7lJDmFqumigPoq3M88fPch6aAG30Y86BnHiQnOSLIqJDx/sB8lj5DXQi8ft8bihLH1p//jFtuTiJjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GzmpNpWh; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GzmpNpWh"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86d2fba8647so989732241.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 17:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744935380; x=1745540180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lOOBnsEVQ83vWj+4JVv3ct2xw51zRGxGxwuZHHRMJZE=;
        b=GzmpNpWhPfjNYuyyGrs1jUiiqz/vPn6J5Amcdpj2VmxXxHmnAPdkTuQJmoWE3PIcZj
         dyNNIOVImZ2gNGrWx9XMJofggbP8Avq67AjQkWpgZBbXMlNiz5DhdZtEryUc8GmPjrT7
         n4on9VJQv71HlMxnxxM14RFE3BH2BDJS/31MxKIK2IGvIH/TsBPsMKu92kkGvUPJu9VL
         VHwM8yTv68k74par0K7XF9I6kTyDdtDjsvpEQRSqT+NshvSBKBANwu+kIywdM9zikfB3
         OrdHnK1xGs6922x+DwCO9BNVOtDte33RpsiSldyVDXV9UQGyQcnWtsvLPjmc4NkOgBeV
         Bgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744935380; x=1745540180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOOBnsEVQ83vWj+4JVv3ct2xw51zRGxGxwuZHHRMJZE=;
        b=br8PqHK5LIIfBUQObaF8X6B27xrrDEnChER8dbMA1AMQI7NJKDzcK2Wp/fbLwQdFu8
         fReSpnInsfcBs+uwQijZ3rPK2mIEsp+pTmAWXvu+XJ2IBzLYGIa4QAhnMkgC1Il0fis/
         uWXe1y4W+nT9+s3RbDuwvAyBgAmfPriCkKcN0S8BCxxlEdz9uBP6tcGsMhxz2XNi/Cfs
         pdCMZ0bKngBwKVrSnc1DIwpWnhEpngMMlxckWD38yGdHjMvU0QzPnVfWJqw+kWIdYLRL
         uyAjFNfD6zoPl29060AbSZwxVrTX8l9opCvBJXwXgEsXlFS15VBabxUrQjJAEdbtNpWh
         IH5A==
X-Forwarded-Encrypted: i=1; AJvYcCU17SvNwMGxoeg2t92I00+07UYmN/RrKk4bq3QgHLQHce89bJoQ411JHaiw404ujJv3q2mSy01tLAbt2lQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb2iow8lHOrgy8RN0ySRFc5yevRJJJA5u0keHltSjJ89gKEW5i
	V+m0Xg8CEjMvX08JtHXI0bzsM2dxMtGikCRyzjgb8T1fPBdZmfYi+VkyF3u6rnD9UxGMGQfpDqp
	KGRciyeLYAaqgOiqQC9LXF/06smA=
X-Gm-Gg: ASbGncvK2xD8MDDDNDo/rK1If37em0OL/jFpm81uYWZCsaOdGd2yT2GKlD8pJg25xTN
	r1weYySbZpSZHJGrPfqIbqFPDfGuIQ3e4Evyyb8SbU7f9QUF2Q2RVyw6k5UAIkCyKiX63cUrKwx
	UWMDcjigujt/mw1B4jZmo6l+if5gX8auDFkA==
X-Google-Smtp-Source: AGHT+IFvCD8mslOTJ9nrFgy3RkDz5sNJuLB43+a7Aclh55XAXaKScsEyxJ6QN0L4x207LPlf5KFArIvS2b1KYaR1zkA=
X-Received: by 2002:a05:6102:21a9:b0:4bb:e36f:6a35 with SMTP id
 ada2fe7eead31-4cb80132831mr982715137.14.1744935379741; Thu, 17 Apr 2025
 17:16:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGsJ_4yUUK8LoejaUrXWscpPSQevq8jB4eFwpd6+Gw3T5JxdNg@mail.gmail.com>
 <6259cc1d-93a8-4293-9009-a6119166f023@redhat.com> <CAGsJ_4wnqyaZntmtOvtTZRq2XuKsKRTokwf1GeX91FpfqW_nzw@mail.gmail.com>
 <d5cd2055-62ea-4534-b5e2-c6a5bfa9b1c4@redhat.com> <20250416141531.GD741145@cmpxchg.org>
 <239cfe47-9826-402b-8008-de707faa160e@redhat.com> <20250416181835.GA779666@cmpxchg.org>
 <CAGsJ_4zt2Yuornri1bO=3o7myey1Q2dmvtjn2baD0ahxOyoNjw@mail.gmail.com>
 <20250416235849.GA780688@cmpxchg.org> <CAGsJ_4wfWLbDC5SruF5TtH-VXE08OWxan12qNYSV3vGzBfe5Bg@mail.gmail.com>
 <20250417121755.GB780688@cmpxchg.org> <3b665ef9-d773-476c-826c-8729056c611c@redhat.com>
In-Reply-To: <3b665ef9-d773-476c-826c-8729056c611c@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 18 Apr 2025 08:16:08 +0800
X-Gm-Features: ATxdqUEjLptYY-bhBBBBLN84W2atkttrkwLoq4YeN6fayJWBYn3iMpxOwantGK4
Message-ID: <CAGsJ_4yUCEG-QyVJiCBBr+LEz4wWDpqws+NhXw6pH5C5+kNUmA@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: don't promote exclusive file folios of dying processes
To: David Hildenbrand <david@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Matthew Wilcox <willy@infradead.org>, 
	Oscar Salvador <osalvador@suse.de>, Ryan Roberts <ryan.roberts@arm.com>, Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 8:57=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> >> We actually took a more aggressive approach by implementing a hook to =
demote
> >> exclusive folios of dying apps, which yielded good results=E2=80=94red=
ucing kswapd
> >> overhead, refaults, and thrashing. Of course, it is even much more con=
troversial
> >> than this patch.
> >
> > That doesn't sound wrong to me for Android apps.
> >
> > How about a prctl() to request the behavior for those specific app
> > processes where you have clear usage signal?
>
> I was thinking about the same, so likely that might be a viable solution.

Many thanks to both Johannes and David for the suggestion. I=E2=80=99d be d=
elighted to
take a look at this.

>
> --
> Cheers,
>
> David / dhildenb
>

Thanks
Barry
