Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6A2247DEA
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748562611; cv=none; b=NVFR0FNjz5h2F0voQ/FycowimMDVq4RZyRen0iwvzK91V7KAfKyfq64nn2lJpPADQdpdd8YJmcP6343CkMeKpdqVgCorC3GMrZ/UYqxSeCpxCW0pS8VeackTXcDdvqJql4j+1D0lWYIlrlkCWoFRotHvXgV84P+mpfmEGh66tFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748562611; c=relaxed/simple;
	bh=/jQS5XQrcSTiYiRSc/N6qNicSbjEH5tvMkYg0lH6Wq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GPgQhIB8RyHc/VXnOc/1plWf+kQByhuZ2O2U5Xw31FCMhfsVRUFKHADHoN09pjZ6c/8bpUh3IbcT3j+Zm8WjfYTpoy4qM7ffNcu1kRtLVs0WZXd/fwmQqvWNLyIuzHQJTxMS9re0P179jq6V8UAzhmQrMsWgvD7jrE9YTUfsxkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G5B1HEW0; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G5B1HEW0"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4e4564178bcso1624874137.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748562609; x=1749167409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jQS5XQrcSTiYiRSc/N6qNicSbjEH5tvMkYg0lH6Wq0=;
        b=G5B1HEW02erwdwrVBnU0j7QU3YNmjD8SJE4Infef6tDUNcPJ6erziSn3dZmvYwYa+l
         Tyraw2OR3WkLv3sJ2l3U/c7F0J6QzNYFWG6vtuASlCuS7CU4QyPTb7s+BhHZIbO92BUI
         i+iN9/NIdGZp3ig2wV5W7yfwoq0gFF4HVfQJCTwkXyapaDWBsen+oNK/N4TtT9nAQHyw
         /Lji2GaUwutmzguW/idrIQZG2kavcs7L28AadE35+tHjwYXuk7cFvAxPykZw8Pp44NXi
         EJv60MaSzjchHE7/m8tqCVoPoWARXuPz46coEj6wKnLxSZZwBdEFxf9RQhXWRcWHFGnn
         KKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748562609; x=1749167409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jQS5XQrcSTiYiRSc/N6qNicSbjEH5tvMkYg0lH6Wq0=;
        b=V15PUdx0/BC4ITTXqJ31MVIPwq4cFVSe2vEYMF7GfIthoi0oqx8cigWbhH+mFuRMPU
         bBLOnLYDQFNKP21Y99p+St5/9d/ZAtm2aSZ2Glsn6Gbe1tDq6sHzgJ1Iel0bWzwraDKQ
         csw3sP2eunCP780+jI8DS7EDmYPeP5T5cLl3oFcm/k9JKP58yu0Fy7lwdZASuIV+6dQD
         Tj3u6d/XSX9cWhaMwlfqr8/8XhZnPlF1Beozl2XnQkp5QRuRDpFGeNHoOUu3xXL3KhWS
         5BvNmcTDfINNnt/iHF5XAjKxv5HWYLvtCz+hHqnVa494qPVgxyNxAOBMoenrNAwCKyhY
         Gbxw==
X-Forwarded-Encrypted: i=1; AJvYcCUNRVnkq8aS2XfxhZ+/6xamlb7AJXDPukJ/UzY1N7jBKjYe57wCGJDzlnLa2MPqe3Yv62cY5LrwenchUCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP4vgzTQjHIrEgt28B71QGXb0PU4lXX0tlRVlzM+SwZYRp29gF
	ZRPl5hqf14cZVmcbwsKTYXObfDF2Kb3HaFdbH3n4WV+dgXjD2ifhZu1cuR8NEouq12i+rn09P19
	cgiA7eCwCefu/guwNCWZFiPJ2cg7I5J2oCdhcpl5u
X-Gm-Gg: ASbGncsEDqnSWHHoAc3r2p74Bo1JQOBI1OY8Ffxminoq6CcrGmMBoZYnVcL/cuBu2K5
	LNyCQmU4amj8dgovMr7qJcVh87cLPhmT/8MHnNxdfRX5Tx7aaQ4hrhJiaGytOKENwCcA5b19Z33
	Ob03YBUH39hbSds7BmiU0sSGWgD4qIwgI/Py/RQayaEnA=
X-Google-Smtp-Source: AGHT+IFt/ivTuvmPFrz20YmtJKKBjvwFbf5WtZzjBqYQF95rJUwlQrpq5rDMJHRKZAZ1A/zY+qqyl8WgCXnFzYIz3Uc=
X-Received: by 2002:a05:6102:f9d:b0:4df:e510:242e with SMTP id
 ada2fe7eead31-4e5ac0bc0e6mr7200256137.5.1748562608979; Thu, 29 May 2025
 16:50:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521222725.3895192-1-blakejones@google.com>
 <20250521222725.3895192-4-blakejones@google.com> <CAP-5=fWZG-N8ZzRh6h1qRuEgFbxTCyEwGu1sZZy+YmnSeGgSSw@mail.gmail.com>
 <CAP_z_Ch2SKwVcSV7ffV1Lbp=6TuKLyofSs1gpfBPMf6mV9-wHA@mail.gmail.com> <CAP-5=fXkfVb4gwuSXr_yZMj8ctPr8LHs-Js7g9hP46dhkU_kQQ@mail.gmail.com>
In-Reply-To: <CAP-5=fXkfVb4gwuSXr_yZMj8ctPr8LHs-Js7g9hP46dhkU_kQQ@mail.gmail.com>
From: Blake Jones <blakejones@google.com>
Date: Thu, 29 May 2025 16:49:57 -0700
X-Gm-Features: AX0GCFtrqvEMNdjlMwMgn5_lFeqF78T2xXt27TWAAtlEFWOjsQdw1dn9gHfduLI
Message-ID: <CAP_z_Ci4X=GRJwKyUMUmypO-xvjuRUR-UPce5hzE_vPf2g_RLQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] perf: collect BPF metadata from new programs, and
 display the new event
To: Ian Rogers <irogers@google.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Chun-Tse Shao <ctshao@google.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	James Clark <james.clark@linaro.org>, Charlie Jenkins <charlie@rivosinc.com>, 
	Andi Kleen <ak@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, Leo Yan <leo.yan@arm.com>, 
	Yujie Liu <yujie.liu@intel.com>, Graham Woodward <graham.woodward@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Ben Gainey <ben.gainey@arm.com>, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 4:27=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
> It should be okay as you can compare the string against that reported
> by `perf version`. On my build in `/tmp/perf`:
> ```
> $ /tmp/perf/perf version
> perf version 6.15.rc7.gb9ac06abfde9
> $ cat /tmp/perf/PERF-VERSION-FILE
> #define PERF_VERSION "6.15.rc7.gb9ac06abfde9"
> ```

Oh, nice! I'll switch the test to use that instead.

Blake
