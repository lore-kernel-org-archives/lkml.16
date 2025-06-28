Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507994503B
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 01:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751073926; cv=none; b=myjYRjO+pLofxmR2mgaQzZzMx6Vfw8JofmVzEUdGDpyi0vsmZv0R+FrUKUWKi+Zl/n+oY94Jdg2hhLQP5MU0fBv2zVYadwXlrGEKgOO1xibxgc9DEpN0I6FYbIRDOXnkotBXoTBcDYWuIbHnjhEEGMReh5SqxbU1jtr7Rf5PWG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751073926; c=relaxed/simple;
	bh=jBsRv1t+MbjjXt+t5j4i2adx0dnBzatWyL4WvWleFvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gg+99NaC2Sqfiq0mAUt4/WnyEA4LU5ErvqaFYk5TOjl+k0WVYThk6QHHKq9Pis9chuL0VSlYLtP08vMkoTkD4LHMHQs5uGFDGvsR1rPsQfXsyh21+fzeKDWeqR8o8KVn7SiJ32CAq2pEZfc8M9GFaiTwyESwYodth2TMJDluHYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w6hWUAVj; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w6hWUAVj"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3de210e6076so45185ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 18:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751073924; x=1751678724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBsRv1t+MbjjXt+t5j4i2adx0dnBzatWyL4WvWleFvc=;
        b=w6hWUAVjIjFBcJGlqhXkNDVAd6QR3x0pjKzZQYahhycetjcL/r3p+bl45Oa1Z9Qrm6
         PZoHbZe0irlKK/DEmeWEoXF7eTZKgVwZKpaSECv34TkfxViuJPTHBkpkIV9ta1bL3UcJ
         Ncw2rCejyFqx9VuEzPtADdAf02Q08DsQk05b8WxLSNhkKvSeCCMGCy2mPKvnPg6WHJkQ
         kt3HXPUmrOl5Bcr/p5HWHVuQyyUEXwptILL5lfjUV55e42ym0lM8rCdtwFaSo/+CI39P
         M2aeYc3EemF9iLldHcr70QR0WOh0O9IVS9nvRje2oEAvUA9AAQ2VyhVQGuRnNID8NLO5
         etqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751073924; x=1751678724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBsRv1t+MbjjXt+t5j4i2adx0dnBzatWyL4WvWleFvc=;
        b=g9EpdKWbRaudpWLhxLjb+G1CVckLTcMlinzh09wneAitzUKltMEBgCV86nKb8mdd3a
         KWhURC2hDeNKiNeXq7kBRTHCU6b420+B+2eePAlsgyLXoniabnUBLA+hcNSeVoKA7k93
         YZEham183mnTce1jafsxSmy7DSU7fciOj7IAD1MnMeTGerJM+pL8eMzPNb8htyDFpC+1
         NF1Bh+tSPXPG0/1gg2T3tVZ6Xt2SBvtcVizUJnIViRNae601mmxsXOJsCtg8zesGWIv2
         MhYIFlT3tHX1crUwwMg53EkCdrma4OBkS+c7ly4bUcidhJsb70VJf0gvCzkxArxdnJvh
         LGdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9mRERkQ8lpUAAEzY8MqTb/9ZfN8LQQb+RzKdehyYb1L/2bOm8fFfXkt7K8/uzhrHXhJN+M4lZtZKpfiw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0wbNEDzpfB23Uc0ulhodIRYGitPYuYQHivv5iOXEXCvNowRIv
	158wSDTjznys+CvXcpoMtuvzxx6Lk1X4kTlU8/duOtr68hp4WQgDgISIO7gVVU2/D8atwpFejM2
	GBsUMHaCoYlMo9wzKIfu3ot7/QQThZOeeLOBpyMj1
X-Gm-Gg: ASbGncvtw4aqH5TtEisUHvYooIJtkLgtQZZwe77Bq9v76YudsW7UhfeFSmj+SrKh5Nd
	t/D4esWP4JyYyioJqbL+P7WN1WBBX1Xv4Dxkxn5Hl8XVfHT+BqUOMKO5EhJ4FZOe8oM2LRQM1/Z
	X60mSWj8ubp+qwGfOzxR/pCZ0FDal/khWV/8j5IjVP0uNB
X-Google-Smtp-Source: AGHT+IGSRQuU3jkfhVSsR7FQ8+3yWy141hegDQ6tZdzLnOk8SKukC27fW4TWxHyP/8wMaDTCmusA+LYzQdfWzyTg8YU=
X-Received: by 2002:a05:6e02:1685:b0:3dd:c526:434f with SMTP id
 e9e14a558f8ab-3df56ce74b3mr774675ab.9.1751073924053; Fri, 27 Jun 2025
 18:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619002034.97007-1-irogers@google.com> <20250619002034.97007-2-irogers@google.com>
 <aFW5aknT69UR3CTV@google.com>
In-Reply-To: <aFW5aknT69UR3CTV@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 27 Jun 2025 18:25:12 -0700
X-Gm-Features: Ac12FXzub2qOEvfir724mQtAGRDikXM7527nrJ2YpeWhE0_sq64ArX2SxUeR28k
Message-ID: <CAP-5=fV2x1EuOuArhLx4QdzYJ3B5S0NTWM3xvVfRNdVni3fTJw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] perf test: Add sched latency and script shell tests
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 12:41=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
> You can use 'thloop' workload which runs 2 threads at the same time.
> Then you don't need to handle the background processes and run it
> directly with perf test.

v3 sent. I held off changing noploop to thloop as I think 2 separate
processes is a little clearer:
https://lore.kernel.org/lkml/20250628012302.1242532-1-irogers@google.com/

Thanks,
Ian
