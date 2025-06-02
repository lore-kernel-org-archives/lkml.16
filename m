Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BE213BC35
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 20:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748894573; cv=none; b=Fd+gjMwzCtXpi22FSdAkjAQfJDKrywuPiiFbTKHBuCBj0SSbTod73YlR1P4T0r1ZfgnrHgU2yMO0R/SULUF2Tqe1Eyd2ZyNXPP/z6DBvTpRl2sHTlgUQnPsvBfKdYy3toAatZDZjrdQ/nHsMUuirtTDMOwp0FElwXCSt73sedXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748894573; c=relaxed/simple;
	bh=O44jyZ1Kd5oy20AmMmw4W6ZFK/TJmZN764rJdr8yx4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UyPV7PqpbmHOuRgzj17/tHIbE1nTfofbBRKsEohn6eSohBLOe4hcz2bUPIxrHG9kAVkvLPIrLEcHDaR82bcRkf4X+7HOsyMA1A6815fm1TJWQVgMCTHe0gpNZc0Tz/Dfeh2Y4x4RbebZxq01d5uX1kJlETVkf99a9bW2s/0wkNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iylWw/Jx; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iylWw/Jx"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7d09a032914so391101685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 13:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748894570; x=1749499370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O44jyZ1Kd5oy20AmMmw4W6ZFK/TJmZN764rJdr8yx4I=;
        b=iylWw/JxxWujBMjFUrikA+1ZWIGEE0meR8bh8CWFU8HFvD8n398lEvox18579iQHd7
         mqWsIgHEJbnv+QquBgmvsiMqWjOfNDA0NTDtruHxAy9EUXeZQ+IQpO43sHgYXhWq+BS1
         2qCYtNzB4yZ1DcKxdc98PkAMtsymI8qUsh+uYLArSHIp1FUIrrBdx2/QKZiz6f6uXs6w
         tP6kiDcP+UynlE4wPW6bZqrifxlt26xh1J23szo6yIHQ+3O/RutyQ1T7XlgULOQulhAr
         gDR7jJmhhw8gWy7LcTKyJC+R2cQlocMvfxwiY0Uc1RfeeHsxEvEAt4LGt6Q/R6nSufve
         n4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748894570; x=1749499370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O44jyZ1Kd5oy20AmMmw4W6ZFK/TJmZN764rJdr8yx4I=;
        b=TBEZVUDxuHFvn8tCaLm3WbP+ftDwj7k9OT5uagPmgy9tjCjtHHjXVxm9FBZbRdk5sT
         ihM+vclyfgwCP9WL323LBFUJxWC0zdN7r7pFwTKp11mxEkKkOxXtpBbHx7heG24SwVS4
         LFofMurQsBoOeHX9GMNnfiOELiDDGmAPpjrPfPG9Te9LkQqdO9VKv80ycW/QR6oY4R2s
         9FJQ+sCoh4wqysmpJJc17R+ClCFgyD3RIumBf4FAgFtg2aTyxIRQgP6YrSn3kjyOhStL
         dK5wY38DNKmNLT2nH4gZHxW6byMZx7zxFupa5mGyoDcSulqH1F/VM9wwY/6kFbrDab/1
         jY/w==
X-Forwarded-Encrypted: i=1; AJvYcCWP3SjLyZyjXawjhiHGcUj4wTTn8KaDcCIZ7/cm9JkTBblrTFxxt335hvlA3+NdFfFi7JEHvrs6il4F6r0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdjTOb3EpIhyi6Zr2rWfSotNW9yqIgY1ZNH+lVF2gY+BgkZ1sW
	NcMgiWFo65+Dq6JhJQnQ6htaLz+rIloP7a9UXwcXJutDCSXpljMko0wt4B1eyxiQeVmWSwFIMVJ
	7h1H9a4S7IopYircaaDqzAL5Lu/k29ZU+Yk9tEdbC
X-Gm-Gg: ASbGncuFd3uae49ELxg86DVmPnBOTwrlLhaKbNQN4ZS1WQmrnHshtAfo+LFFncJwIZS
	RpfRq6ylyiAWUUeu3xJBXqeNij9u/5y86UBmCg32n7/9fgumfuKmstfKmEAwAqRWagpLDMy+6JH
	oOa8N2BtmQznoYcMH+4MIxr9p3sxjvdNllBLG1JgZyfew=
X-Google-Smtp-Source: AGHT+IHgeqPf5EHr1jkfDZ0TWZsQVURsdNh9voMjdnoBkFzaz/mgj3xBAjN2lvxPZngxMNZ2zDqWAhRk0bMIaFAslVQ=
X-Received: by 2002:a05:620a:17a9:b0:7cf:749d:803e with SMTP id
 af79cd13be357-7d0a2034287mr2485082285a.51.1748894570064; Mon, 02 Jun 2025
 13:02:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250531072031.2263491-1-blakejones@google.com> <CAADnVQJv_FVciT9LC+W=sVtWAt9oXeAACzmTHzyqY-2svi4ugA@mail.gmail.com>
In-Reply-To: <CAADnVQJv_FVciT9LC+W=sVtWAt9oXeAACzmTHzyqY-2svi4ugA@mail.gmail.com>
From: Blake Jones <blakejones@google.com>
Date: Mon, 2 Jun 2025 13:02:37 -0700
X-Gm-Features: AX0GCFsfxApMIel-NOMbuG9RAZwUCpPsL1Wg6IssdJPcoBruecM6kKjr4-18sUg
Message-ID: <CAP_z_ChBf6tiBZuLYE8ZGOXLYPpbNtH3F54_yBmF59oWpZ_q5A@mail.gmail.com>
Subject: Re: [PATCH] libbpf: add support for printing BTF character arrays as strings
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Namhyung Kim <namhyung@kernel.org>, 
	Ian Rogers <irogers@google.com>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexei,

Thanks for taking a look at this.

On Sat, May 31, 2025 at 11:20=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> Please split selftests vs main libbpf parts.
> [...]
> Please use normal kernel style comments.
> We're gradually getting away from networking style.
> [...]
> we allow up to 100 char per line.
> Don't split it that short.

I'll clean these up and send out a new patch set.

Blake
