Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38E72BDC01;
	Fri, 20 Jun 2025 17:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750439187; cv=none; b=cspRohQpH51HY1nEHjIMRqGWBvkaJnBHDowospRlKxUJDkD4YEEnF+PIG7qvuhfF4cxrPRhFoPvKs0B8W//MtibQYEdA+uuYtjtafZmJ/zQBN/94MzFGdWUSuauRe2drjQko+13ud+5S1ZhAh+w+w7RkSqffuDh25c180h/EDRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750439187; c=relaxed/simple;
	bh=nR8JCkDCS0gb3QmY+xkreXhapsXDdGblPAP/bOLVoRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BeFF8xD+lP9RDG69dR+3/DVzEKijK9thzlyvxA3fI7M6vJHXfikZnOfP3IEJoDGspUDfGcFw/yc5O8KvsnYAgTvTCPMJFIIq9R7O3ucZBJ6xHJ/WfIqx8j8XgB7O7mS+Q1xwMjRHzYWLVSPESBE7mK0CkJ39fVRe+5V+pFCdEXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFmvIfPM; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFmvIfPM"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-313dc7be67aso323756a91.0;
        Fri, 20 Jun 2025 10:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750439185; x=1751043985; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nR8JCkDCS0gb3QmY+xkreXhapsXDdGblPAP/bOLVoRc=;
        b=BFmvIfPMS4Vd5tcFW2uMcgjP1gjcza401C+46iWrxVQQQJlcnwPcjHpYwwuF2dpAx/
         8w6Ku7ojiRiC6SN+iNZqGoGvyNrDUr/0nKydGzBFetD8En4HhJe2j7y+Hb2kE0LabNF9
         MIUordx/ie9Z1tQGNQzRHGvK9BT2osUgzhhwSb9+rdtUMBcHQ3qJMSzkee1PXnGZOfsW
         A5Ohi6q/WG85ceipvrjwnobXHxB2ks3bRirqevJrG1Si/oI/XPF9reR3mhFGOVtuQN7O
         tKvh4lbIy1KVNGa4QQV22+DbP+zj3HC0LvqF3llX53eH+CC/Eg+OPHVeJucQvR1KhEbM
         Kfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750439185; x=1751043985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nR8JCkDCS0gb3QmY+xkreXhapsXDdGblPAP/bOLVoRc=;
        b=suU67btpWPEMfop9IYLN0NfEZq/5hkAzeGdQKrSrWPP0uoIXidJfjb45HNXyXv3sFX
         7Cgrar97oz9mtgx9ZGK8jr2YWrVVrBV2C2y5VN/nJHHxgpI7gvwnG1MNoVjgZwCb/w2k
         WEY+jmIfMOb4errOV/KgVt4NepsJW4CgtA1QfS/+iHl34eJkypILZz4T5LYi0uAPtXgh
         MYq3mtRkttfmFu/BFHxqn76qqmxuUWBnSOpYks4cKLv0WFbvuvguyelVVed6iw7aWDg3
         ZTzPSoTNl0BR+bIhqNcAzi1UhUqs6bzY55nJ8Qnt882ENju2whBhXJ4IIRDz8jQ7JHBL
         G+cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQKfJNMBN5xUFszCWCZkdGzE+SVIfKFN6X4yS8lltrESWW44XsyWzU6CNLOUAX5qQmK2wLDNqmcJqvWMd5OqY=@vger.kernel.org, AJvYcCWdR2jJNu9TQMdUOF79E2eMXLhMsZpv4D43f6+kZTYtSH+1r0AhUiuo45x+/BCFXBjbn2vmiU80eS3/ayc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNiauedL4Z3MmSJ19tncAC2+mZ3YjSFBJcwSOl1OObKSjQh2TG
	0wjSgSBtt+IUwTy/0+lX4wIh/5fnnWqgGzHdT9Jlk1swCWcHNNMyBK4v6JkqkTU3fGkbuHi76AL
	GeqkOawW7y97sEashvAUEGDc/krZ4Rqo=
X-Gm-Gg: ASbGncuZy5YKGrxeWgff6sJqf8nQRkt0LvXDYLURlr4JGYmrADP5OmbwrHljVlep/Iu
	h+AAE0ZEprbA63m30Anu3Igchb0rPsxID2Pstg97w8Av4sfTzMtX1jHvVVyYqzCPSGNtDAaHHLp
	PeyfBZ/9fkciSh7Ya3QL2prdAPtpkthwg5F4zShoCbS/yB6fxAvVA6Fg==
X-Google-Smtp-Source: AGHT+IFUdRD9ff/2AXzkajZ014jgzqnnrOctCnqUh751BOw8Une3qB2C2bF1iaF/ptF/GHz1mrxH1fQWMGB98YE9euA=
X-Received: by 2002:a17:90b:51c3:b0:311:a314:c2dd with SMTP id
 98e67ed59e1d1-3159d8c6cedmr2366780a91.4.1750439185108; Fri, 20 Jun 2025
 10:06:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com> <20250620-num-v1-1-7ec3d3fb06c9@nvidia.com>
 <CANiq72=BSnom-nQgzLvv-cqwSknK1uJ=CXGP51r0WRj1Y553Ew@mail.gmail.com> <DAREXAUV51B6.7X7TPOJKK249@nvidia.com>
In-Reply-To: <DAREXAUV51B6.7X7TPOJKK249@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Jun 2025 19:06:12 +0200
X-Gm-Features: Ac12FXy9impNFri4YJFlzwQ3T6GDHruzREl_6st0yjIG4jjsANoToHYXbGIIsEw
Message-ID: <CANiq72=kfhLwpXL0s2HWbW79QEZNTvJ1UKBSzp6MHyoVEUAC1A@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: add `num` module with `PowerOfTwo` type
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 3:59=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> This reminds me that I should also check whether upstream Rust would be
> interested in `prev_multiple_of` and `last_set_bit`. The docs I've read
> for contributing looked a bit intimidating, with RFCs to write and all.
> Would you have a pointer for where I should start? Maybe a Zulip thread?

I would say it is actually quite straightforward compared to, say, WG14/21.

The first thing I added was a method too, to see how things worked,
and I started just by sending the PR.

So I would say, go for it! :)

Cheers,
Miguel
