Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86DF72600
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 02:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751335594; cv=none; b=QOL/QutYO9BRpRYJyTkOjJLW1wMWj6yPZ31f5syfu1VgXNqk70ZqX/587ID8iApDGPNYO1OIICKMyKxKZt1UcMV6JfkYBPCutea4vYSbQSli/rf+oV1ODEpfVT5YVRmbZP/LNNOHJA2FlfeCDZ8lTtrRVO6lmIFQpIPRxINHsdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751335594; c=relaxed/simple;
	bh=XrwXszs+4CKh3uvk7NsR2H8vx1ReZK1MCq5Q7S9Pyfo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DGf9jWTLCj7xbtsMtKyPoZ5FTMvXP155mENPEwhnNn6HiGweX0x6oPifIPq/VQNOQmT4eVbUTzqIOxfYVFttEA/B3kBWtlnRqNEyYEKaoL5b4q+6tFajMhvUwmLABYrZnOZUVhu1jnyV4T3SIRKAxS6BEZWw6ariYYN1wUltuIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FoUNe/L7; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FoUNe/L7"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so4732564a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 19:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1751335591; x=1751940391; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fN4lVWlc90R79Gu5dER97dXUSpIGy23I1H05DCfQFHA=;
        b=FoUNe/L77KQY/JcKHutwuE216lXD2ALSlzoZv6xF1E8HCibUylC1YE+eiHLxZDZbG9
         siEPqcZ+vhBXNfwS4SKR3NrIMi6uAdsWKzzj8NO/7p/D9Dx8HzmeJRFvZsCoTUpZQSIc
         I2dPxkMe9tvrpttFpJfQtKJj9VGcBB6NjZ0yA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751335591; x=1751940391;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fN4lVWlc90R79Gu5dER97dXUSpIGy23I1H05DCfQFHA=;
        b=FRfH59egzYKTfUjz5N0G4RbLkVANgQiOKDUlUOI9dXTHuKG2ka5YmfZ5WhPTSGEzjY
         l93yCF3HN+gIyZ2gwL936NsKIauk/tiVDgkPU615sC/yW8aWaaUI1TlUsP9zn+wm6D14
         QeNwyBKeTt1dE5AcZQuApqGDGDrCFCWqNG19mFg3yOqDg21FF5YPJkwj1A/N/28kHV6n
         O6lW+dVb4s5o3GozrY3djfj78qLv/evNL8ETZFrjDuzBrOdF4Xw+G6BedyXOMTG+UbbP
         n4XnPqG5md7n7QE3ATy6R3cZqTiNuTmYGxV5SrJ3FKno1h9QyiDnXLmCF1cf8dR/SXKs
         rsdw==
X-Gm-Message-State: AOJu0YzqQeCWf5o89LF1dr8SRmqZ+vtZl6Zm/ga1HfFZMKhk2SVEAgPM
	YYic38ELxAuDhmq0WUphX8KuvebF58xtT4qeqGiil+I/0tfT3SrvxJQ+3b88Ys/q6RHsiXj8VKj
	EZKdRKtA=
X-Gm-Gg: ASbGncsCBnfnew3sfzltyk3MA3Q49i4ftJ6OolBjtz01KD1W1tZi7MdsGHPqMlUGr+p
	/CMO0/JHkCwcTN+cum/g1IHxBDx4ehp7Jve5tHMlDvcWUBn5DoZ465sBZismxR4EaewvAjPbV8q
	R2xneAi79kEBsDZnt8kFpM3s+9yo/UnLP4WvRbWj/Z2plvwr5HDbjL29EROGoke81zz7eTg5L+o
	dHoJWdViebWEw/xmf+o1fxjIWk/VjGA0y76HhSPYG4pr5I4Uf6Gg2rox94iexDifx6/bYbuz1TZ
	2x1720jsaSikCvU9Utzz3oIPnSmkZt66aCVoCKqGnR19D0uBkLKYG+idgXPOGMLsF4VwMez68w0
	3dIS0ZwVly/OkGv4WWrG4CqJsK0IOBPMvD7Lc
X-Google-Smtp-Source: AGHT+IEoR5JKP7qSU2EBjXlqcX7l2iiGuwCzNS0R8WAGQGpDFC5/FFD5Yp3O3Epstcs0Yl+tkecPcA==
X-Received: by 2002:a05:6402:3553:b0:601:ad95:ca6d with SMTP id 4fb4d7f45d1cf-60c88db5a47mr13621085a12.8.1751335590813;
        Mon, 30 Jun 2025 19:06:30 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c831aa9d0sm6929666a12.46.2025.06.30.19.06.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 19:06:29 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-608acb0a27fso4655356a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 19:06:29 -0700 (PDT)
X-Received: by 2002:a05:6402:50cf:b0:607:2d8a:9b2a with SMTP id
 4fb4d7f45d1cf-60c88ed9d2bmr13448124a12.31.1751335588910; Mon, 30 Jun 2025
 19:06:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701005321.942306427@goodmis.org>
In-Reply-To: <20250701005321.942306427@goodmis.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 30 Jun 2025 19:06:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wijwK_idn0TFvu2NL0vUaQF93xK01_Rru78EMqUHj=b1w@mail.gmail.com>
X-Gm-Features: Ac12FXyRoMfhGWW7-qb33RWCFdUsK39k_kEcOT1weCLo6TBUE8tUjRhvy0zUkHM
Message-ID: <CAHk-=wijwK_idn0TFvu2NL0vUaQF93xK01_Rru78EMqUHj=b1w@mail.gmail.com>
Subject: Re: [PATCH v12 00/14] unwind_user: x86: Deferred unwinding infrastructure
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, x86@kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrii Nakryiko <andrii@kernel.org>, Indu Bhagat <indu.bhagat@oracle.com>, 
	"Jose E. Marchesi" <jemarch@gnu.org>, Beau Belgrave <beaub@linux.microsoft.com>, 
	Jens Remus <jremus@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jens Axboe <axboe@kernel.dk>, Florian Weimer <fweimer@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Jun 2025 at 17:54, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> This is the first patch series of a set that will make it possible to be able
> to use SFrames[1] in the Linux kernel. A quick recap of the motivation for
> doing this.

You have a '[1]' to indicate there's a link to what SFrames are.

But no such link actually exists in this email. Hmm?

           Linus
