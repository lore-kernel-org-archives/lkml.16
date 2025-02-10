Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2040D24418C
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211745; cv=none; b=BRFqS4qqptGr6StkizK7ht3pFjvPsoX9UaZItv98nJFZKI4h889ge77CLBf8kffKhG07WDY5+L9ZcFbfs+3QKnAmQ6V1TGO7tRZsSwcmZ0C3uM4kU9Wp1J64VAFjlpbYFujrcd+lm8qnpv2/fnSIRadBBXnT8NXWG+cFB4qQ1NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211745; c=relaxed/simple;
	bh=IcdrIqs90CcLCAGhFUsmvv1jkxcaZyMPFUeEij+QgGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=rHA5kXujflw8lJIzcfRYXO0kvn99AYoNIhs7+CYraDQwymtQbXn/CPsJfVuqPQdq8/BntYpaw/YdlV+aBGpMKuK5JCWglWnMN8B5rlo//ECxlSFjgZSmwqHWinsbmk7XHvGkO3TIw7TdYC6qGUaaZoBhAR8mA8ocL/6dxdqJtl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b1olh1jz; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b1olh1jz"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d146357fb2so4295ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739211743; x=1739816543; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcdrIqs90CcLCAGhFUsmvv1jkxcaZyMPFUeEij+QgGg=;
        b=b1olh1jzEupzU/TXA4iKTVqgf6+0E7yYWLgFM6zHR4n16dH78YZ83whPBcdbsqpTLB
         hXKq6pWb0LEq8PCN1LRR6lA2p7i8yw1FpFQsSFlqDWme2rsi4Nf0y7AWVpeWBmKTr5YI
         Ic5LLI/PWhjIIhRc6GMHnHEE9yIJjIGa+eLMKy77bR2UGCGBz+vRVvKKJPbWCVqTlQ9O
         fKX/GEMTOH9ky3QLZqzyu3MUzIzW6D+knSZuk4wzWDc75JD+ev0skfcRnGBfzjBFRo3+
         fuMfxZYL9gt5TlKLo/QY/5XaEqeTRtyWr+Q0smWjjb9/IjzB6lG1ST96rSeX+jUmOM1k
         +6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211743; x=1739816543;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcdrIqs90CcLCAGhFUsmvv1jkxcaZyMPFUeEij+QgGg=;
        b=FlhI03bC5yYhb+JoLfN+dkxjZn+7AqEVhkFdp/8IkeQS6Ad6M4Jt+mFMCOcpIkyX55
         MEr7PRhLYI8Of7+93A2xRzDKvFfuuDvtF4tI/U4Y2wRSaYo4svKSmeHJtHn2LHRDY5x5
         VQ8+bi0voaoE9DDvHbw4OChdtcfUucw6BMPpFxfjX8eBOIlpGjQJKofuskeHk0voyVrk
         E8JCrkUCA7BPo/jGYiWBfLvR4PD0sElGDzVJs28PD+tnNh48YeIueeDnnsyZKuNJUXa9
         5CQxwbp3rqWca0KrZNam4a4s35gmERCNGoBoF6jgKcjV9ww9KOowuwqCqBDHasmMXyIS
         Kx3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgSWwNp3ER+UhRSdDxNmHGp/SmrpBhcaYe7mUukmwGUN0NkY5pSQBEpYpV9UHHo1VIyQWlrsxQrATbwbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs5I6gUqclwaCC865ba1XtEXj6DZ8sUwmZL/yOMBQP5RFQ1Es8
	EwO8Vm2uDn+gPEGbsBFtlAJtybGdAEZ98bg9LQp8VQcGZIr/ZUPGdSr47ARvyOk50/Yh0ym8eiw
	3ilyZbHy7BeSTqjWInEHqyOsyH8OkzpFdTFco
X-Gm-Gg: ASbGncvhgYzB8XSslnWHzeVbotviYwTKJXqqGfKlNUgHq48SfYyNrOwFiMMtZJReBz9
	taqRJgfDV67v9UqU7iE2UU3cOa3wLxfGuwUDQOeBSYrwe3R5IgBY5N3BNqyV2eysdfGWGjRWA0q
	pJvt+SnRNXjE197rDxDO/uHWWl
X-Google-Smtp-Source: AGHT+IFTAuNfiw/XhQoBcYu+J9Hya4qnn2jHdbkYvCPw3zBjIRxktXB1NTEFecewpM4GA6NHDMZjZHi5G1f5cYQe1Cg=
X-Received: by 2002:a05:6e02:2491:b0:3d0:62be:12c3 with SMTP id
 e9e14a558f8ab-3d14efbfcd0mr7274625ab.1.1739211743085; Mon, 10 Feb 2025
 10:22:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250106215443.198633-1-irogers@google.com>
In-Reply-To: <20250106215443.198633-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 10 Feb 2025 10:22:12 -0800
X-Gm-Features: AWEUYZmXHIPhU1yc2AP2lYcBo-6OHxpX8oMootUclJA7tttmBpiUKue4uJ9MEFM
Message-ID: <CAP-5=fWvsy74obPj7Fs2ghUHNVu1A5ywkpjOU6ibC7vvWu2b0w@mail.gmail.com>
Subject: Re: [PATCH v1] tools build: Fix a number of Wconversion warnings
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 1:54=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> There's some expressed interest in having the compiler flag
> -Wconversion detect at build time certain kinds of potential problems:
> https://lore.kernel.org/lkml/20250103182532.GB781381@e132581.arm.com/
>
> As feature detection passes -Wconversion from CFLAGS when set, the
> feature detection compile tests need to not fail because of
> -Wconversion as the failure will be interpretted as a missing
> feature. Switch various types to avoid the -Wconversion issue, the
> exact meaning of the code is unimportant as it is typically looking
> for header file definitions.
>
> Signed-off-by: Ian Rogers <irogers@google.com>

Ping. Also:
Reviewed-by: James Clark <james.clark@linaro.org>
Would be nice to be cleaner wrt compiler warnings.

Thanks,
Ian
