Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B366624C664
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451598; cv=none; b=f/Q4jHtBhMsoOhYee/urn7ASGDmKjmDPcyre7IYjBBUW8uY0DZ3M73jNSmBsMuJO0rfnm9XoN5oQANTF6ZbvWoejNzIlHgZqdMOwnrbCRDIK6t3hzHE5JJa/3Rp85VNWY+MGOZmi8kcGX54IGFU5us2gynqUX7t/PSkh7FsVJQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451598; c=relaxed/simple;
	bh=QMSg+H9E85nSP8AMVhfKPz+3Q4Lbs/NOUsOvvYe5PHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eKUgRfjGRFFQlKRjFV3roaJI02Zbs8mzKzlHedNnOXAnmWvoUKg3sIWoVyKXoEPpCsn/9L5Zg3ncywY46oPnVT3q+4gcUYv4qLHL2ooA2KDCfC+iBc3VsOy9ROPLv9TDSlbsWoSKwsV3FjdvUnNwfUqToAz9oBCz7c5SMvaaIE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f3EfSGv4; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f3EfSGv4"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-70f862dbeaeso44439497b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751451596; x=1752056396; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QMSg+H9E85nSP8AMVhfKPz+3Q4Lbs/NOUsOvvYe5PHE=;
        b=f3EfSGv4GqYgqO4MpVUaeaCURwtltoNVPUFLJDWZKbvKM2wwvfXRTI6Ucg3x4Iftu/
         VhyTnD7eFf/M+kEnoCsCNUGV9T53rUo0iXT/qTa+cVmegjUE/8McUYQWu5oeh7M1xJyo
         G7qwbb3wXv6/l4bIA8oxKnxJY9tX3r+5q5FhXPvZCsQ9/vV9p08GYahxrKRp10NhXcGY
         TiASsYjaqAhwzWruG2q//MeDhnfIkBLYkLFEsXH3vjM5wfMZX46sND6KROsim3SLlKY+
         VC9fmMQWqC1ViRILbAlaT2QzGxEG/+TPakDm1UGFaSwu+BMnKevPadk4nXgxa2vx57HU
         L3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451596; x=1752056396;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QMSg+H9E85nSP8AMVhfKPz+3Q4Lbs/NOUsOvvYe5PHE=;
        b=TdseiOXuyLg7WN5VAAIDJg5EiktzKUE2151KnryGxUO7VHmQxHVuJ5N/7OSIqutg0/
         7zKu5K11b1AwBtERNwWsKE3kXIXvP5CRtfOVuXQjYdy557iYUH6kGW5LrX+yYkXUEPNl
         DU9B/YdY4OtXZV14K94rD0qmAnDxCmMT6Tt5Hmgfr+ycgTCa0scbtQgQmm3HyMVxiDuH
         68e0FsBcUklADeoMXOthykz02Oa81oumEWoIoc+91yybkPZZhb0znlwFVoRZpokGkXZf
         wUKNodi5aWuHXbjQHbFe4oDIjV1OYwrmQIT8ftw6jDftQkrFOJCXEZsBI37UTpFOy/RK
         L/lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFVOEf3aeLpd9z0mn8t02NRPE61MCt/IBLKh8xCnuMz513Od8wyITKgG5ldYMLYWBHKn2LN0zrvjO+f/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX5GKm9xJD05g5s6rkGiU9izpiV0GARjX46qUaC3sF2l0E6Ulf
	ywijidiOIhzaDb0z2cT/nU1y6gvtisccnWHxkTDprTBOWvFqwohmY+K6TA5tfWwAItPov1EM9CV
	unawQNAJfBpQlAoAaGcf1vMMCnJQg7TrMp8zewjUFHg==
X-Gm-Gg: ASbGncuFmyZJFiwK3kt7TGCz5cnH+BS4Oyrjh5Yp/jbTBa6ZBSLr8QpdBc5HkxZr6ru
	/uoDVNulYrzT21NyK4Eng29g3gDt3+p8qUlwrzMfrQ+D9cDNOlRD9ljHj+OQWcWytcHGEgyw0pk
	ij9iYp22O8LxeBulauT0bp7tqnkHeGb8hKrjoF0h4yaCI=
X-Google-Smtp-Source: AGHT+IHG/1GissPVmpknsYzFHMpB6ytPy9MhshgzbgoGfNZ2rCgq5NLTEQSFfMSr0XJegByETigg6aj5tsl8WILZc8k=
X-Received: by 2002:a05:690c:6802:b0:70c:d256:e7fc with SMTP id
 00721157ae682-7164d3f9161mr27758297b3.21.1751451595695; Wed, 02 Jul 2025
 03:19:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701142313.9880-1-terry.tritton@linaro.org>
 <87ikkblkff.ffs@tglx> <aGUggwe_gJon_2E3@MiWiFi-CR6608-srv>
In-Reply-To: <aGUggwe_gJon_2E3@MiWiFi-CR6608-srv>
From: Terry Tritton <terry.tritton@linaro.org>
Date: Wed, 2 Jul 2025 11:19:44 +0100
X-Gm-Features: Ac12FXyuLh0QFcbaVWbl5yokqfl7teNpNT1gidQEcqC-rhZCYHiTlieQ4JcBwVo
Message-ID: <CABeuJB15QXyxSgB60VokSRFVGBRQJfcTNcwuX_wMzrNqmSz0PQ@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/futex: Convert 32bit timespec struct to
 64bit version for 32bit compatibility mode
To: Wei Gao <wegao@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Shuah Khan <shuah@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	ttritton@google.com, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > > Signed-off-by: Wei Gao <wegao@suse.com>
> > > Signed-off-by: Terry Tritton <terry.tritton@linaro.org>
> >
> > This is still wrong.
> >
> > If it is based on someone else work, then you need to attribute it
> > Originally-by and omit the Signed-off-by of the original author.
> >
> > If you just picked it up and adopted it to a later kernel version then
> > you need to add 'From: Original Author' and preserve his Signed-off-by.
>
> @Terry @Thomas, Thank you both for the mention in the commit. I appreciate being included.
> I guess above options both good.

No problem!
Not sure how often this situation comes up where an ltp patch is also
needed in kselftest.
