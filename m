Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F818224252
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744124843; cv=none; b=ka5TUFb43qdBaTmcRB1q3dFTnsB+ShaTV/Mhk6aWzehT/1ALJa8SsAkeV/y+qWfwlvufZVhMr+KEyrJokCyBsL2F9yNOeb7sHG1RtGhJvBM4SKrXgw75pyJwrKEag+FCtQ3ZvQBRQff2xxT1dikKaVtms6fFZ8jR570H7gHcSYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744124843; c=relaxed/simple;
	bh=S53wWg6EVuiCl94q6KeD9ibvuRkH7pkNwygNbzLdELg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aBLv2HNYEdPlkn0B0z4fDbF+TOqxXTJi3YL1Bqn+hYRSqleW3uP8y6QUDOcWkuV9ggj+FAOjetWD5Y9bJ9SjsEONz7bATmVQ7pJvDOi/dvUSaPKVjrUK7GTwy4qJIOq4/UBKlG4ZXEBO9eZYMhAOBn8mtqol41QWhpm7s1LI0dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RywL16kE; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RywL16kE"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2264c9d0295so222325ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 08:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744124841; x=1744729641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unlVTFrgXvzgDf2aayfiA97WI+Y8WYBYEfd6y5NTwTE=;
        b=RywL16kEOFtbTP2genqiDWBVdaajuoTGPDy2aX83qoaHTxbtXVO5GHmJY3GijOUypA
         PfvhJwJJnb9ezLWxFdMQBRwBLrSYKl6oo2zpHq5mLl6tRt6qSKdgWzVo1vmhTRmxJweI
         PdQMXRa0HiOoaG9UTOqPtKPqqgshCrOAPSKN1FtCQosSXMM8piMJHQ/5fn2o7nHUHnJz
         vxb2Kpi5jpLi7eFM8uFhjMh3JeiyOYE8M5rbzmbp0cBxmyzn5rg0OQKY9dzeTGe1ibJ6
         YN3umapW+N8/2dihPCC5aqUmGqVcDF1IzvI2Wygzh9Qrf0KLvtcyTEcD2u8LmAGGE4kx
         jCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744124841; x=1744729641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unlVTFrgXvzgDf2aayfiA97WI+Y8WYBYEfd6y5NTwTE=;
        b=InIB0KIMSB14g18Fp6uEeI1ETqle85fPBuDLojHI+pwiwOmmMqf8kvsV7bskux9G5C
         gDPOLzc7JKhuJyfO2pHB9PcguRRAi+t2QpaXsbQ9udA6mCjEtv1psyx0xjMTyrGTzFkO
         NCSjAo0FECMqRvZ6UkQbECAq3IxBbNv5MIAFx2UEQEQ4yJc2gAsdbO8Dek5iVMZG8bVv
         cPcOJ2u7L120iK5+Iom5EzTnTm4EVwE62iXhsjYwaWQpciJbHlV5N5+iefKgqUTwDHUZ
         KJ07DdXUjpTRisaDSRXVI8PvS9ZkxpQ1AO/RhHWev0KebiU8qbgHRr9x3yo7S3GTGOa8
         8jnA==
X-Forwarded-Encrypted: i=1; AJvYcCX/wYErrKOW1PmIh9FdkW8/J7zjLg7IHANerRB+776BfEq6hFJsjIeizn86qfBNBfycbNjAr0FWiGb3UaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOYqei4uhXu2C3LEI2ASX36lqsXEvmy7tM7cpj2Dm0S8RZX/tT
	8ZiCC/4iNKxnMFQqL/ZlubWj3Y0rATrJQloSQ+RJnviSe7+oKv5CQTKXxqq9jbajdbltzRuIASj
	m01lrTsMkEiWyW+ayH4aCCKxDegvlUrjrBDXZ
X-Gm-Gg: ASbGncu5bBMg/ei29BM/8fgbfn5nD/0PurXphWalu2Si4zEICoEL/fYtbqYxFWumneI
	cP36MOp2q7bPHZdYZmH2Gmxfy2JpxYydwhnh7TGTwHEomDBzDSXeZp7lfjLr7urQ0YC+vQ553cO
	u01FJtkr2DfWqM4fIA/bFHboMEDzDZczSQHMDfbd39aFB557JLOkXLLmY=
X-Google-Smtp-Source: AGHT+IHFvpD+UYJr1rf7dkMEUUfZYlYA2D8wwBs41XpEWpKcKPQk1Z5yF1J8r08XTvksa7AT4b5xjMDYxJPxKmrPCzA=
X-Received: by 2002:a17:903:3d54:b0:215:aca2:dc04 with SMTP id
 d9443c01a7336-22ab711fba1mr2414715ad.26.1744124840778; Tue, 08 Apr 2025
 08:07:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408104851.256868745@linuxfoundation.org> <7d11f01f-9adc-467c-95bc-c9ff4bbf6a0f@leemhuis.info>
In-Reply-To: <7d11f01f-9adc-467c-95bc-c9ff4bbf6a0f@leemhuis.info>
From: Ian Rogers <irogers@google.com>
Date: Tue, 8 Apr 2025 08:07:09 -0700
X-Gm-Features: ATxdqUFsPT9ssGEEy4_cYrt1sV-fWT0gbYl4L_w8VJ-E1PwhOl7_XOsF39WP5YY
Message-ID: <CAP-5=fVCADCyXeeLZT4EpU1OtOxMKB8omf5FFpDHmKgOWetW2A@mail.gmail.com>
Subject: Re: [PATCH 6.13 000/499] 6.13.11-rc1 review
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	patches@lists.linux.dev, linux-kernel@vger.kernel.org, 
	torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, 
	shuah@kernel.org, patches@kernelci.org, lkft-triage@lists.linaro.org, 
	pavel@denx.de, jonathanh@nvidia.com, f.fainelli@gmail.com, 
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de, 
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org, 
	Justin Forbes <jforbes@fedoraproject.org>, Namhyung Kim <namhyung@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 6:09=E2=80=AFAM Thorsten Leemhuis <linux@leemhuis.in=
fo> wrote:
>
> On 08.04.25 12:43, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 6.13.11 release.
> > There are 499 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
>
> Compiling for Fedora failed:
>
> util/stat.c: In function =E2=80=98evsel__is_alias=E2=80=99:
> util/stat.c:565:16: error: implicit declaration of function =E2=80=98perf=
_pmu__name_no_suffix_match=E2=80=99 [-Wimplicit-function-declaration]
>   565 |         return perf_pmu__name_no_suffix_match(evsel_a->pmu, evsel=
_b->pmu->name);
>       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> From a *very very* quick look I wonder if it might be due to this change,
> as it seems to depend on 63e287131cf0c5 ("perf pmu: Rename name matching
> for no suffix or wildcard variants") [v6.15-rc1]:
>
> > Ian Rogers <irogers@google.com>
> >     perf stat: Don't merge counters purely on name
>
> But as I said, it was just a very very quick look, so I might be totally
> off track there.

Thanks Thorsten, I repeated the failure and reverting that patch fixes
the build. Alternatively, cherry-picking:

```
commit 63e287131cf0c59b026053d6d63fe271604ffa7e
Author: Ian Rogers <irogers@google.com>
Date:   Fri Jan 31 23:43:18 2025 -0800

   perf pmu: Rename name matching for no suffix or wildcard variants

   Wildcard PMU naming will match a name like pmu_1 to a PMU name like
   pmu_10 but not to a PMU name like pmu_2 as the suffix forms part of
   the match. No suffix matching will match pmu_10 to either pmu_1 or
   pmu_2. Add or rename matching functions on PMU to make it clearer what
   kind of matching is being performed.

   Signed-off-by: Ian Rogers <irogers@google.com>
   Reviewed-by: Kan Liang <kan.liang@linux.intel.com>
   Link: https://lore.kernel.org/r/20250201074320.746259-4-irogers@google.c=
om
   Signed-off-by: Namhyung Kim <namhyung@kernel.org>
```

Also fixes the build.

Thanks,
Ian

> HTH, Ciao, Thorsten
