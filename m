Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4E01D63F5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743435327; cv=none; b=OwX2cVi73IEULWJURsVqNS2wBuCBkHBoX79dHfvN3eCS1MQJRdnPqBG0aIbzCFTUXeC5NP5uBsaoIaoVzYvs7Ow5UdD5lYzhzdzd25wsRKRSKXqQazhQIJllz5jMEYTTC3K4weEOk4+87uDARtCmBwKk0ivUVTt5GSFvyXExcDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743435327; c=relaxed/simple;
	bh=mf2ZQZcGlrZbDzDVP0+T7LZsc7c+wwjyubj2Hr6h3pM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dEWjKgXOj/DoH6t51R65fovHOnMNITank9Fm4bWgcH/qqSv2DTM3rwRzaz1mbpb2qiXC7HlNHICQaKlw72fSEI2A3gWlVxIgJ1v+RioePrNyDMkOHrR5ck6PNcX2SpBpMzCN4dbgPbIxeZR83pwihe9sIdm/HV0QVZp+LguFdkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Hb8he2Co; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Hb8he2Co"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so934764566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743435324; x=1744040124; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YO0dREAco9t7gPO+WazvaPupC7wRyoflD+tJnxLDjG0=;
        b=Hb8he2Coa/TuZCItycEKr6RJhz7Q2tu3D6kKcZiXQy+ql1CoGVJruWnNJ4O4jQkwfu
         B3eQRE1ZUAx8av809bszbO1f2HG1A3nwFlJRhxptPhhCz5GlejMK6RBWAxoLZqkSoHSR
         emZfeZkn1D319YI07/QllBbng47+Lyvqxu0xA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743435324; x=1744040124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YO0dREAco9t7gPO+WazvaPupC7wRyoflD+tJnxLDjG0=;
        b=qQLnAAAQq896UQr2N19hIbJ2Ta5X134r8PgIkpiMv0opaF+OaKLkjlJKC/95MyYGiY
         bs+rw6wauDZRe4w85PobIZ3JMrH2L87AUgyoob5z1Zn4aanleAJKACBmvKQeqx/lSH2+
         FsgDMGDTkuqFSmGkiSUFrb3jM5AeftLdPoBuOj1amwX6hSCka3qNmUOD+TVafRwtPbtm
         zrvxUiSrnAsgQNSzHWOXE+2DSmC9hmhVYikpT3LDPQ5agVqywCvVhXuP167DW8BZZhJW
         PyDwad0XyOFJcfb7BtIvTMV3kvkt6nbmWB9YWgR1EPqrfbsj7S8L2brKfvnL74IhpoGu
         D0sA==
X-Forwarded-Encrypted: i=1; AJvYcCXDnNrQbHCRu6nyX4uMKCPIJxK6JSH32PuNiqFHJum7UK+QN2eTA3/zZvvfcO4PMf2LIYN5QRWCwf8enXs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg/X6uKjqiPnHm1Mw+aYCO/nGzMKI4HegwGiJARt6j1jgJg7d6
	xI6d8xbRCvWWf45T5pboAO41kOeIQzwlhGuxmvj/Zio9iBVP+E8BY3O1jxM4PRUFzaNfiPqcGoS
	KFvQ=
X-Gm-Gg: ASbGncvsMXufm/kekBdduj7bPnJnMu/L8LlVvfdmVUU3LKhWJrflMiO0cXoglWCtpeW
	Ezj4i1nzjiz4mNv7uf23nY351Pn7Fer+4UsocS3THv6wYcN1oETUMYpMpuIhcv5njEhRiNTGARn
	aQhjM4wtOK8o5SEYROiB6koeE01zJ8oHAWoOpZ1IbUONxai2XeNAWk1GpmGTwfscFpyXan7L6hk
	zlZVilvc+XKCVM1r9LVKL8KjomL69usB5wMeq1TWEFll5uQRvjR1wjWDNaA9MtgYTE2Qt2jBnKZ
	ZxAbaeRM8Z0Vz5E3vNj0ph6IaYJAUYkvG66r7smhFEg5Freah2BlhTj6Ea3jyqzW5+I3LmbBAjm
	YqhsfdfSfkzd9hW3332Q=
X-Google-Smtp-Source: AGHT+IE2EihoIdtPem85pN3+YzlXAM7GREtd/O9TZ32eZR1ntxbkG6rjrtOfhenLccadohgQAwnARQ==
X-Received: by 2002:a17:907:c1f:b0:abf:4ca9:55ff with SMTP id a640c23a62f3a-ac738a9853fmr740451966b.32.1743435323687;
        Mon, 31 Mar 2025 08:35:23 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71967fd33sm647461266b.142.2025.03.31.08.35.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 08:35:23 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so934759766b.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:35:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVXFyku1hx4iv8i/PhGOWi0kd0bMmf6Z04S0W/WiAYKAoChxxeAImgUfsStFjE2o61odCTgVWqyJXT020w=@vger.kernel.org
X-Received: by 2002:a17:907:3e03:b0:ac3:b115:21b8 with SMTP id
 a640c23a62f3a-ac738c21274mr750571766b.47.1743435322576; Mon, 31 Mar 2025
 08:35:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327145159.99799-1-alexei.starovoitov@gmail.com>
 <CAHk-=wgRbk2ezu1TNewZQSrT1MCzP-xAXrcHXULMeW=RRSak5A@mail.gmail.com>
 <CAHk-=whVcfPyL3PhmSoQyRQZpYUDaKTFA+MOR9w8HCXDdQX8Uw@mail.gmail.com>
 <CAADnVQKBg0ESvDRvs_cHHrwLrpkar9bAZ9JJRnxUwe4zfGym6w@mail.gmail.com>
 <20250331071409.ycI7q6Q2@linutronix.de> <39586553-6185-4b83-b18a-3716caf2f3cf@suse.cz>
In-Reply-To: <39586553-6185-4b83-b18a-3716caf2f3cf@suse.cz>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 Mar 2025 08:35:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj1jFH2Gc2Pq+-m_32BL9-CbdD7vReTJgd7Wbt2_EnH3Q@mail.gmail.com>
X-Gm-Features: AQ5f1JpPp2rq7h82rgAtWGoIctm8Ha-dBePer7BRjKEaDaPgda8D0EyYKeuC6qY
Message-ID: <CAHk-=wj1jFH2Gc2Pq+-m_32BL9-CbdD7vReTJgd7Wbt2_EnH3Q@mail.gmail.com>
Subject: Re: [GIT PULL] Introduce try_alloc_pages for 6.15
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Sebastian Sewior <bigeasy@linutronix.de>, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>, bpf <bpf@vger.kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Michal Hocko <mhocko@suse.com>, Shakeel Butt <shakeel.butt@linux.dev>, linux-mm <linux-mm@kvack.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Mar 2025 at 02:59, Vlastimil Babka <vbabka@suse.cz> wrote:
>
> Yes I was going to point out that e.g. "nmisafe_local_lock_irqsave()" seems
> rather misleading to me as this operation is not a nmisafe one?

Yeah, it's not a great name either, IO admit.

> The following attempt [2] meant there would be only a new local_trylock_t
> type, but the existing locking operations would remain the same, relying on
> _Generic() parts inside them.

Hmm. I actually like that approach.

That avoids having the misleading operation naming. IOW, you'd not
have a "localtry" when it's not a trylock, and you'd not have
"nmisafe" when it's not an operation that is actually nmi-safe.

The downside of _Generic() is that it's a bit subtle and can hide the
actual operation, but I think that in this situation that's the whole
point.

So yes, I'd vote for the "let's just introduce the new type that has
the required 'acquired' field, and then use a _Generic() model to
automatically pick the right op".

                Linus
