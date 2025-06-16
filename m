Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D7D1EB9FA;
	Mon, 16 Jun 2025 21:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750109325; cv=none; b=BkLa/v8xHin+VaUdF6kHD1JBzs70+Y8rKfk0S5k760ByKmfbMyS/hb4eiG904EEKZpDFUV2KwjZxJEhkfGFfAgszIZTccfS9VgR13XgDGLuIP2Il0VDMuYIyYmwJTy5naRkMG6YrWc7NRAy56hXHnax8dByZTWOozmAq1Flt7/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750109325; c=relaxed/simple;
	bh=tHvZkL3b841MNEO9/DdSITMV0vDLxLNrNJMk62HpFVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h+Lk41FImRm9lyTFhSgLbWPrZgBMbviOYApa2Hfjfr5TjQfBGflPM0JlTg7YnKuXkf7taeYye7ZYzDwbxdmmXgRxSGtYGlcEnoCutQP9BZuT1seHdhZ1iZLN2XbUhekZnY5THHYnhXeHesHNphb0qQlwpBmsFT5EMOHHeDbAlYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBaKC4ZL; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBaKC4ZL"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-312a806f002so833881a91.3;
        Mon, 16 Jun 2025 14:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750109324; x=1750714124; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHvZkL3b841MNEO9/DdSITMV0vDLxLNrNJMk62HpFVE=;
        b=lBaKC4ZLcwVOMgjqjL8DaTg/eNgYnAWsY1N2tz7bV9c0HUWVeRgQRk0OXmwVn+br/d
         EkgzZ0tfym4B6nF2jmvyoqQ+OS2n9TnqSIqSKZXz9MmCcVUmF+J6JCQ5jjOEJbuvQvKH
         02FvbCwG+QULBi2h6rkUHVsg3aZHnON5RgijJvnGEfIXWiLLMSgghuZjBfzs2tUu2mZv
         3HDKFksxPapJ+3qDW8sOVM0b9SlhIckCBqNa8jaU+QTg2eyuQ8x0JkDZRb58faMMDk+f
         MfLUjQH1BXXi2BLmJWibjBiVwj6HNTD72kEQBnfY6V9csknVLLW+E8pnjy3UMzj7uLzB
         /BiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750109324; x=1750714124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHvZkL3b841MNEO9/DdSITMV0vDLxLNrNJMk62HpFVE=;
        b=vg0Zwh8doM8wBRw/V4e+bzFcX+ekI4WtC5ODMoGqUAWAVdZ8ZZ3b5XLf7jcD2FSxiY
         XEmdvwWkA6hgcBcKB3RPIGKZKuPUiiTY/O5c0yePImkTwQvhZIeKQGYd0P4KKonvP5WM
         nnUQIlo7OYAUNtSUaXeMG/QbxfowrHllusSEztf1GbXCCeg6o6lzYb2BafTEpGg1runH
         tiilBZL13wbNzXNdoGzrIkG7g3rGjoHoPlz+iT1rqGqSQmKkykNAQjkpWSwyPii2kDUv
         8F0v9lgatnr2zoKJcMq/FKdmjIJuwmK4dfUxywK3VKkdgR5MRNSi3kJxAYkq3VJBNUX/
         Ww5g==
X-Forwarded-Encrypted: i=1; AJvYcCU3OLIih02rVfW9DTVFmKEHwRu80So1XiKtXqhgEK/sw5eBHpoxI4p/G90mTOJ7+VKHmbRaJhUodW45j3//mA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8XthJx7lcd9qVYu77wrv6xpwnWgwX/uIhNJG70kYpamg0ttOp
	jw6MHKzmosetC4ed/czf8wLi3rPshOBl9GetA3FgGdiyy6l7W/ZdzbHWSJXeXGtcjjiQbFqrKWp
	uFARLS1W7pGXBRU192ZXIeMS1pmsKtOW/ob4M
X-Gm-Gg: ASbGncuc8OCKsKi4AkFX+zQ/Zini9icQ3LbpGp/ogWM3Z4gneOnQzibxm5/76LbZO61
	HTjgfS48vF7d1/KUeFkOZ4ML4EbmTmftUTi79m2QxTxfq9aJlQF2ObmlZ1/DOVOR2qz5lvPMB+b
	dR8WmWs7OJ3dMev2yDyhB7G+74DhxhgGRdfMwFsAmAPSI=
X-Google-Smtp-Source: AGHT+IFpeYpl22BIjz3gujyrkdt7SBYSAPG2/B7ertdSdDyvPD9lzSXyH4tJedlNbF4lFCbNR5qtS+JKwgj6IfoWHPA=
X-Received: by 2002:a17:90a:ec84:b0:311:e9a6:332e with SMTP id
 98e67ed59e1d1-313f1b312d5mr6208943a91.0.1750109323846; Mon, 16 Jun 2025
 14:28:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616153604.49418-1-boqun.feng@gmail.com> <20250616153604.49418-3-boqun.feng@gmail.com>
In-Reply-To: <20250616153604.49418-3-boqun.feng@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Jun 2025 23:28:31 +0200
X-Gm-Features: AX0GCFtsVkSsb9r-Et1SiuSY4RT6eaG72b8XtmUQN8OOVG598eWPzfBSVVitO-g
Message-ID: <CANiq72mES+dPBuhsdh0-hJcV69AO74j6W5vhCeo+yV5S-Zp+yg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: task: Add Rust version of might_sleep()
To: Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, pmladek@suse.com, 
	fujita.tomonori@gmail.com, mingo@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 5:36=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> +/// Equivalent to the C side [`might_sleep()`], this function serves as

I am always pleased to see intra-doc links, but wouldn't this one
point to the Rust item? :) i.e. we need to add the link, right?

I would normally ask for an example of typical usage, but do we have
some good C docs on that already that we could link otherwise?

Thanks!

Cheers,
Miguel
