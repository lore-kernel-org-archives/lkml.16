Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA5B22CBF9
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746805773; cv=none; b=YN7o0+9ATiJ+qNU6NILEoAWz20eHUSzptGiOGsXRcFv6ty6ZqTf4L46lZtizOhdbD8UaPPN+u/F4Iuk4dINN+Wtpp4++P8OtIUHnJfsMQHmsjGVvmnndLZ6UnUGAlqmQOSxM9jTdiX8dDBj19bcqCJaon/8Mts22zWjFXmdrqj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746805773; c=relaxed/simple;
	bh=mZhmz0qN6pyyOUt0hjpHgbQhT1axoAo4wExNnDS4mjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YTBY7yf5ukTM0fyLCp1ozqghrsrLTM/mMkgE63jmxi4Ma2ZFeAxyK/v1RPdZJRCYeYgzukH+uDhHvbJaXJ/EVZxXw+CkdYOs4E4IggemNDIhac0SV3bMi9KbvU/8Br3IYCu/IeUqGuGYELFpO0CqNB7NE0chKXLcDe8oIUIyvbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gywHVw+F; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gywHVw+F"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso2747640b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 08:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746805766; x=1747410566; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6eYgOkl3zFCnRizCPFXVOuEo+Aqs2WGbNaDfD6G1vg=;
        b=gywHVw+Fb7Ya/sOKTJFqs1iIWwkTuBs3BiWRcAtdUa3JKTdr20YecyA1EFqwGd5G+q
         3b8B4MI++uUErcGNSdUt7zVTVR+/S3uul/0FTz+UGlB0gMylUD71Id5CPTqIly80yCL6
         beBwJkB+zplmYng1yU9y2U/CixQCgRKvUb/SQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746805766; x=1747410566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6eYgOkl3zFCnRizCPFXVOuEo+Aqs2WGbNaDfD6G1vg=;
        b=TDqUEjCofQGDUDCw/ALbDD8vJ4vTeLpHbOzOsAQun8O0i4NNFESo8ZS+73IZmnyryo
         YSlrd8eNhqObbJD2m+Wwg+DC07jinXwoBSAfahYpA+e3Sya/RyAzKSiz5CuL+Zl+U5Nw
         kcXjeI1ZY5E4JMWQJzyUHqdvT05NxONsCJK+c1Sx+4XZDEoOA29OZQleCBACz1tdyW7m
         dXFrSUrxHkxDUl/zBcglfpYdeZsFzjNLpB5F3wHRW5MAJzL7Ucr0QoWozwQDkDIQfAF3
         IvMCj0NJD2PYHc7SJC5NQDrXV5q28+3kfO1WtW53mfG+aSZL323Z1M/XzDt/6HOjBx71
         BIng==
X-Gm-Message-State: AOJu0Ywg27Sgjy9fT1hqWRiKexlvajCvjI0Qog2uzhJYSzyzZtitAVXW
	5kwgQ/Y4Z6vKCVBlqgyRx7NIyrRIN2/UewxhqHGLpoHe+UAKQlew33DJtnxx1HhogucNp5YtaDU
	=
X-Gm-Gg: ASbGncuV0KHF1d2wPPgWjlEeAEKXCZH1kCX2P/v5mcoG7+uftXCFs4SezCUmYIjZGfP
	kJExmac+gnags4GbRDa2AVQDfD7omKuNC30efSRO+74VtdnTR0MhYaXvBCkuqfoDOEJw8tOxu+7
	4zboLr08dHAlBrASMnLaFZOkElJCYSYIRorG8sQd/bWJ/nTywW3MhUxvUxUklnne8UttXIfizLF
	U/hSyjEm14poEuGRjSUaBLAzcbOU69F7dFe+ZDtZQAGqYUGrlu/6ni+/QcXGLpvUCBbMXoZUIK5
	YiFcXknEm7xkTW12mLtAu4D7QAKxPuNWi3JCu0l0o7+jq9iNTe0h2Pj4qGE9KwTpnaIz1wCzXcI
	Xua7DC83G
X-Google-Smtp-Source: AGHT+IEM2idcI0kcw7SvhLb88hO4Onlt5W+qBa4vh4EjEPjBTWRpMGqh9KTiTir9Ndj0UUxUbiPYsA==
X-Received: by 2002:a05:6a00:8c6:b0:73e:1e24:5a4e with SMTP id d2e1a72fcca58-7423c0668cemr6257136b3a.24.1746805766128;
        Fri, 09 May 2025 08:49:26 -0700 (PDT)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com. [209.85.215.177])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a0f141sm1880767b3a.117.2025.05.09.08.49.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 08:49:23 -0700 (PDT)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b074d908e56so1495921a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 08:49:23 -0700 (PDT)
X-Received: by 2002:a17:903:1948:b0:227:eb61:34b8 with SMTP id
 d9443c01a7336-22fc8b60b7emr51857875ad.25.1746805763167; Fri, 09 May 2025
 08:49:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509131249.340302366@goodmis.org> <20250509131316.139772566@goodmis.org>
In-Reply-To: <20250509131316.139772566@goodmis.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 9 May 2025 08:49:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Urs5yKCA38MgXOy7_LhV44-kT7tFGohtxSMzeeozjeDQ@mail.gmail.com>
X-Gm-Features: ATxdqUH62jgYdW9rPqm34dMa2PXBe_nfoRMdNZtLpBylh13yOwm8z7yRoNMbR-A
Message-ID: <CAD=FV=Urs5yKCA38MgXOy7_LhV44-kT7tFGohtxSMzeeozjeDQ@mail.gmail.com>
Subject: Re: [for-next][PATCH 16/31] tracing: Add tracer_tracing_disable/enable()
 functions
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jason Wessel <jason.wessel@windriver.com>, 
	Daniel Thompson <danielt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 9, 2025 at 6:13=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
> From: Steven Rostedt <rostedt@goodmis.org>
>
> Allow a tracer to disable writing to its buffer for a temporary amount of
> time and re-enable it.
>
> The tracer_tracing_disable() will disable writing to the trace array
> buffer, and requires a tracer_tracing_enable() to re-enable it.
>
> The difference between tracer_tracing_disable() and tracer_tracing_off()
> is that the disable version can nest, and requires as many enable() calls
> as disable() calls to re-enable the buffer. Where as the off() function
> can be called multiple times and only requires a singe tracer_tracing_on(=
)
> to re-enable the buffer.
>
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Daniel Thompson <danielt@kernel.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Link: https://lore.kernel.org/20250505212235.210330010@goodmis.org
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>  kernel/trace/trace.c | 33 +++++++++++++++++++++++++++++++++
>  kernel/trace/trace.h |  2 ++
>  2 files changed, 35 insertions(+)

I'm not deeply familiar with the tracing system internals, but it
seems reasonable to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
