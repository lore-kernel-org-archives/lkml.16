Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A58A29;
	Wed, 16 Apr 2025 13:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744810212; cv=none; b=gXC5eUGOUHyaNfbamlT4CUVhPrfc+EHB4kRFAMCJm1o2Cwej5oHT7DSF6wMEd+B4S7hhXAZtSgo+h9g0b2xSNRDCLO2uWpVpV4jP095B86WtkPGEiiBxkc/qcTmAIJw6YQ+6MU4v4aiOu70r/8mLoIDEWVkVAStzs1xmksYYFY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744810212; c=relaxed/simple;
	bh=M7SOqanCPqWPCm2zWsBokQ3qxhyAPPhSYNPDy+/60es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pekVHnw3M4wU8k3tIUCtIinkO1pzg7YGIKTwmLbDGixuHB8J5T90ZUsgdz5rJTX/hAFDgaQtLfMnvjxXtfTP2Fnzj5WIwdA1HUYm+zrJq00BLAHhwQfMikGmSa6YAOguXfVLgZJeo/2Wfzyg7tbrHJINSlvCL7bQdjA/FUJ4l3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/wOdIQa; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/wOdIQa"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ff6ce72844so1181780a91.2;
        Wed, 16 Apr 2025 06:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744810209; x=1745415009; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7SOqanCPqWPCm2zWsBokQ3qxhyAPPhSYNPDy+/60es=;
        b=g/wOdIQaSV4QrL0MXPB76plUsnF2Qaf3tuo+pF7FO273a+kzbxS6RpV4JQ/m4wr27d
         7qggHsBcZWYUSJFdKtz5G1ALbLLfNTB/wu8IAuhFf5ndLbkex2L2kDbUH78nzKSZeC7U
         lVMntJMpXGs5CpuqvR2mUo/bgJ8Arv/WG2Cpqy1g/V9kisJObL8mgblcEQOnokBlQ/Jo
         4xFDz90GScvgKsT+rcmQU44FZiq6vZHbpqZT9zxUGiZkMwYpF5gkGXgutFOgdZprKDWK
         m4e6K1PmsUDsPujcSuLkrryHmf8ggK4o/3yKlk+zKC7iGUEvVOgLx53DBCC/BJV68WnW
         emeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744810209; x=1745415009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M7SOqanCPqWPCm2zWsBokQ3qxhyAPPhSYNPDy+/60es=;
        b=raNojqtksjleCtS+1Kd7KnC55eLEevvjQVMT7XTSSClNByVc//ufzGOAdOA8Ldo/t/
         t4VvV3aZSQnDBUvqWrUidm9Ykl+YJ5xAPEIEzEo5CXQh72T/uGRHewlyyDU9uE1dt5SE
         ESB+ZLanmSzdC1nJdRvL3yOcKy+xiMG7yuJZ3B8S8KEcQ/H66041Ndj/fFZpSB7+4zqA
         sJl8xFPrrDYDB+bBZJoHcprXl7SvCuQTw1KrsoR2sPdyshg3gXFDtJMi/C4glQfJDgQY
         3YuYinqEMkd5MuYHEETY4f5OKcxP/TT4EmMuE5lSHyrvPLUJiA5Ncs48vzmlkaDaTUnJ
         SwNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMn/pfeaaQ1rbc5Z3p8Inpj4dyk0r3ShVPZ3AdEDnokKi2AX70rSZckbCAF7tw6qWeIzzPv0pUc8mK+OKs4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAKpAu0q5pxJ0dSjTNLXIU7KY1V4JiH/MDR0Awu/hlh5OpNRZJ
	adjqFC5mQU5SaXh8+y8UgrJ7ahXkbZy8dcEZ2iXKVcHgY0xGeRHBAGOzs0lg36ehWh6VLCus4S5
	iXbtn46+H9cPkaLxAN7aw55lQ4qc=
X-Gm-Gg: ASbGncvxbzgDjTZAkqcZkQdMbYS3g4UsNolL/QcMUXXa38h2NiwKyQstqIkwCg1tvEt
	5kI0pf38Bo+JsXf3QoKM18k0teK/SrBop1iSo9YPn8HUgJcXM+xnxDACJUUCfuNjWOx4UC6IQzA
	HND7N+7uwn+7egoszhLietEA==
X-Google-Smtp-Source: AGHT+IEwqoR/ZdCUuFVUx41ef6kAglIExYvY/h4i+l06OhViuq4tGJlS3fKFaJpZokhR6c/KiGZ3MsRSNWZ7jETIbwI=
X-Received: by 2002:a17:90b:384c:b0:306:b6ae:4d7a with SMTP id
 98e67ed59e1d1-30864165e44mr969828a91.3.1744810209181; Wed, 16 Apr 2025
 06:30:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416090544.3311613-1-mingo@kernel.org> <20250416090544.3311613-2-mingo@kernel.org>
In-Reply-To: <20250416090544.3311613-2-mingo@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 16 Apr 2025 15:29:56 +0200
X-Gm-Features: ATxdqUF-CimKuGN_3uvT_4oqwKYyRZ7BH3Ejuw-DMr1WAcpy2wEK_rFGthW6VeY
Message-ID: <CANiq72kW2xps1Am5HEe4+uPykFjm2Pf4kKoGWVNjVkG4HSmH0Q@mail.gmail.com>
Subject: Re: [PATCH 01/10] rust: Rename timer_container_of() to hrtimer_container_of()
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 11:05=E2=80=AFAM Ingo Molnar <mingo@kernel.org> wro=
te:
>
> This primitive is dealing with 'struct hrtimer' objects, not
> 'struct timer_list' objects - so clarify the name.
>
> We want to introduce the timer_container_of() symbol in the kernel
> for timer_list, make sure there's no clash of namespaces, at least
> on the conceptual plane.

Andreas should Ack, but I quickly build-tested it and it looks OK:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cc'ing the rust-for-linux ML too.

Thanks!

Cheers,
Miguel
