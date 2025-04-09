Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9739226A1B9
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213923; cv=none; b=SiqL+EJZVPf7J5kPR5/w9+MXkIVQmY6xJOdD39k3k/u9ssah8Lk4c8P8vlGKVOiWyPS12JbiZu10SEVyx+fQZsl12tCMCEtcDGq7Nu61SUgXR98yROuO/HVmViGtAw38q+sIP+Zc9iubjHXWjhAfftk8YkwNr4zn/B+uF93Wm0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213923; c=relaxed/simple;
	bh=ONPojdIjHrzChrGArc5TbNog7k3iE1RgJww1otzhUnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JMG2ebtPyg0+wxr+Dvh6GzJaMcZnqqKB8cmn1ieB6MJhlZlDYAQofbagjE+oYTBnHM9jD7OG9qnDwDYJjxyJHOvn33otWhar9ihRKuhc4A83H8zhVfMqmzsemeB5ZoIfLWKd9OXlur9jTyOTUWeTqOVKQ5HtjN8jyvIIw9NK5Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3LfF4NoW; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3LfF4NoW"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2240aad70f2so256535ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 08:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744213921; x=1744818721; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONPojdIjHrzChrGArc5TbNog7k3iE1RgJww1otzhUnk=;
        b=3LfF4NoW2Hy8cr3Rc1O5iLYzjM0eigTqpxsQAJiAWNa3OJhinVkWKdLuVhObguAng6
         oA+ImSTo0C/Z39aNmrt/VUROMriGlV+vx5ekqc5hzCdjsIXQXHjqia6u1Xiv1DLACN1s
         7Wy6NAoZshDlBokLvKbI7JccehUQQ/Emayzpf5T5XQRXk9O+Nsg987rFJIqQ7CErmV9K
         FVNGO7Diu46aKNBME0wQdPA4DmlJ/1UKltePav7hZ63WA/oB6Kxcz6xyXkVARR/oToBG
         MMwtHi5R3TMDNZ6otKRd9JUYtyqHwo/8uXMbJ+ia6l7Uxz5t5n0veguYpPJmRdGSEfBr
         4Bbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213921; x=1744818721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONPojdIjHrzChrGArc5TbNog7k3iE1RgJww1otzhUnk=;
        b=w0bSgn1giIOfdDyMtq7t2URr+boC7THZrM/fvcohLAJQTSADG3a2lc4E0fZ5Kc6Qhu
         6D6V1A2R2h/o1Q5QoYnLCIenmggl8Zd+aZK80UYjnDwIg0xKZrJHHbBEx/fCGlmC/F5a
         mJa3p2ys4Vkd/bVXbHnYAD8Qf/KD1htaN0YM4msErTMxB3I7+2zsk+Q5qIleHnFVm1ue
         ntWo76LvlyUA1LuwX2NkMuAsbQ8IooIRUX2HXzuqiK86rvtTY2OvNCqPkFnGMGODotI0
         PivuZ4fro+8W4u3MMXzidM43cJXSFNAD/FyKgNk7Pkb2Mtch5XG+Jbk/dTwmvuK/rn+g
         D40Q==
X-Forwarded-Encrypted: i=1; AJvYcCVShUY2TyWMuua6eukT5UBNXvm0iZ+RkNmGzL/btVgez+DqBE52dS0qwpJUMoN6GK1Ro3qtoBbatDjW1Uc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHVOGov880DnfxcC5VACFyX+3G+2VSoaCL1+IcGowFPjJjklvO
	F50S5jIOrt523bSkHFJEKKo21DDoObj4xktLqpS8U3yUNdF/uIwkgT8GG8GP9TgnHilHQJ2YdzO
	XLm7JixWYXGcLu+pdI6EsJ6rqGlGiAFC1qvJX
X-Gm-Gg: ASbGncs1f27XD8wuguI9MjbWD4S4ZyEtdfYVDfHlETYokt/T25ucqujC9c1MOByqfky
	Ny9P4m3xnz33yql7Y2FYFZKRUxVCxA6kvjPBXIv6XE5rBww3UH47FBaVRHKR7218dU7e8kX/wSQ
	IYzZ996ZzPq0KiZo8OBYhNSLZJ9TmWFAMRGdLais5g2mqdY99Ixls=
X-Google-Smtp-Source: AGHT+IF6yyCNdAKPOUGDf7tH/deR8OUSPsEKAyM/GcYg8ys3pJt4ve2skebZakAwf5x4d+dQfpAfsT+Mf6DXWvSfKCY=
X-Received: by 2002:a17:902:b214:b0:224:38a:bd39 with SMTP id
 d9443c01a7336-22ac3063e0bmr2794735ad.20.1744213920688; Wed, 09 Apr 2025
 08:52:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106003007.2112584-1-ctshao@google.com> <20241106003007.2112584-2-ctshao@google.com>
 <Z32EFouwz3IHw8h0@x1> <CAP-5=fW+HDfNcpTkjPwSLezP-XTj9hkPLrwia_JryCr8+Ro0qA@mail.gmail.com>
In-Reply-To: <CAP-5=fW+HDfNcpTkjPwSLezP-XTj9hkPLrwia_JryCr8+Ro0qA@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 9 Apr 2025 08:51:49 -0700
X-Gm-Features: ATxdqUFVim2h_otrX1XHuXbZPAT-44lJl9Ivy2fN6qb4M_vCGdOa-UQaqWaalt4
Message-ID: <CAP-5=fVX2=iRumkAAUyeVoE-rveaYzUKokGB3g2H1ED4JK3Feg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] perf: Reveal PMU type in fdinfo
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>
Cc: Chun-Tse Shao <ctshao@google.com>, linux-kernel@vger.kernel.org, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Ze Gao <zegao2021@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 8:42=E2=80=AFAM Ian Rogers <irogers@google.com> wro=
te:
>
> On Tue, Jan 7, 2025 at 11:44=E2=80=AFAM Arnaldo Carvalho de Melo
> <acme@kernel.org> wrote:
> >
> > On Wed, Nov 06, 2024 at 12:30:06AM +0000, Chun-Tse Shao wrote:
> > > It gives useful info on knowing which PMUs are reserved by this proce=
ss.
> > > Also add config which would be useful.
> > > Testing cycles:
> >
> > I applied the first patch in the series, that already helps, Peter, wha=
t
> > about this one for the kernel?
>
> Peter, did you have any input on this? I think this is simple value
> add with no real downside. I kind of wish the patch did more than just
> dumping type and config in fdinfo, but getting those two is a big
> start.

Ping.

Thanks,
Ian
