Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8942DCC0D;
	Sun,  1 Jun 2025 20:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748808038; cv=none; b=El0gCiDLkHY5I70B3d7Kir/yB2oYES1KugloQ7fDdV68fd8NhLOGGBStxhV5s/HbAk053GfKTwtWcvZBdub2rWIn4eW1JEBGaMPM+x6WRBDRzLW9rPsu43082ndqSQGTv5BMdwBRSMF6Okey14WAFEGGA9wpTfSld/KisOTOBoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748808038; c=relaxed/simple;
	bh=FJA5dvEtQXSIrwP7i6i8Svxml70JhmXkP4aoC+kTZrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aKJwIQFOxvZjka9giWhVvQhbdmufqDwcsZXNyHLpINz80ANO5e9BNC2LsseW/WnqOL2B55/+NbgFrpvz3QWG1ro8x71fgk4f4093VxjAjwjc71nlw7r+C2vvXVRxYV/Y1SycGrMPZxXOx7NDBit/1unzLbtGmQI9ULIWipdcPzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXjBjlsk; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXjBjlsk"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b26e6c551f8so411149a12.1;
        Sun, 01 Jun 2025 13:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748808036; x=1749412836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJA5dvEtQXSIrwP7i6i8Svxml70JhmXkP4aoC+kTZrs=;
        b=kXjBjlskCVZUS/mIEFSWk+xxIpVxi8yTXrwrWLtwKHzM8ASQE9xL73qbC5CkDZ0HTX
         YV4A3IAKH2pIASwA7L+sNww3px1L+vt7SIC9VP6lhbiQqNjpZXUHxnRA7LYOu64u9Z16
         5kmj6UnzzQyWctJxx4NwR138eYuFw0GP8MlrUArFCzks4ecvFcJUgnBNvN1o6tJUYQXZ
         3DGvSkGQiPMw4YO6orD5YD6OEuZlFwFIkClpvBxaAwqejza4h4iamWTw1YGwgF9697Fh
         3jZjK76KRQO3MU8K45s4hISLpy6ioOV2w3bXZBQ+vbE7DOGxGXDmKLeHXCATSbaHE+/z
         tENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748808036; x=1749412836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJA5dvEtQXSIrwP7i6i8Svxml70JhmXkP4aoC+kTZrs=;
        b=xF4YCvxBvzCNBBfVmLCWwb3YuNAdkt22qVBHnjZK25DAKzJwk0CNcdRrmLkQZt9nRT
         qt2JcrxkJZqlHzOg3Psppg1tfWu6MkwOVn7u2mtzpV375Ljj99Y3E2t5xGrJIho9Gn14
         mgdN07JI+Zo7TVA/oztl3jjVIKZbhdRobLN3zj44muX0BQw0kiEAMouN8cPWq/43JOix
         BujAzgpc+NwibWhSqXb0puwrrwlbuFfsh3AZonH6bdOGT96WMwebDOea0Vl9PUx2baMw
         8sO4qIYGAQ8Ggj9tgS0inD97l9YREiki7H6XS490vPFxMFciB4WxaXEvXZh6ruzhpAWk
         /LDA==
X-Forwarded-Encrypted: i=1; AJvYcCXd94gFwigJt0qR5iV2TfzDY2ybrg3OQNmZRMGPvNg254t0TFzGdS46A7a/Z0hzKh6GhCbIN/zdQnxJp8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEbXkXK5F8XCpiMCSesYm45+MDgq1vTWh1dZcQlfQpaSWApW4K
	++kVX1EWDUF8Sh6Pd8q8g5hZIGo/QbALeiKOhWa2+ra8QxN6O3oj3WxLKbrndMMRpo3WKN98i0o
	fSlLlXaZWFHxlvsRwLMQFYr7yaZNJeuw=
X-Gm-Gg: ASbGncuPxQQ2l1bUGGWHzUtDhfcvWtDf8KPVhqzljbP8qcaJOz58391K9fZgKyW39l3
	6TrfTO9fU5JaJYBPNz82j9GkoVd/TgjSn7UwVcj8Qvofgr1lcJoDOc/TDFPIXgtMoTekjyaxOlh
	nzpL1PZicLMQ62qzYiDhuTBrrGkno/ZnXzloujiqWf4ag=
X-Google-Smtp-Source: AGHT+IG1GMdyr1mGNy94+QAdUb1SThnEvmmUZpzSX8+ma9IgIrUCR6DPEiwWLayWxcvXzMIwBejsPbyGRxfVVO4wl+I=
X-Received: by 2002:a17:90a:f94d:b0:311:c939:c842 with SMTP id
 98e67ed59e1d1-3124db4c59bmr5658794a91.7.1748808036553; Sun, 01 Jun 2025
 13:00:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250601164939.5306-2-saivishnu725@gmail.com>
In-Reply-To: <20250601164939.5306-2-saivishnu725@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 1 Jun 2025 22:00:23 +0200
X-Gm-Features: AX0GCFvNTn-WNeSiTK57hCMRdctxin-ZJiiOuJSnS5XIq9JZhnhz-9jnJnYuRVE
Message-ID: <CANiq72n_pN9i_bnhuE5eD8jE-G9FwP566tfL8w+v44pHBWBu2Q@mail.gmail.com>
Subject: Re: [PATCH v2] rust: doc: Clean up formatting in io.rs
To: saivishnu725@gmail.com
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, gregkh@linuxfoundation.org, daniel.almeida@collabora.com, 
	me@kloenk.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 1, 2025 at 6:52=E2=80=AFPM <saivishnu725@gmail.com> wrote:
>
> From: Sai Vishnu M <saivishnu725@gmail.com>

This "From" line is fine, but it is best to avoid it by configuring
your setup in a way that the From email header matches your Git
author. In other words, the email author is now just
"<saivishnu725@gmail.com>", without your name.

>

The commit message is empty -- the kernel requires providing an
explanation which typically includes the "what" and the "why". In
trivial patches like this one it may seem pointless, but still, it is
good to explain the change :)

> -/// IO-mapped memory, starting at the base address `addr` and spanning `=
maxlen` bytes.

This appears to be the line from v1 -- the patch should apply against
the tree, not against the previous version of the patch. In other
words, patch versions are like rebased, rather than stacked.

> +/// IO-mapped memory region.

The change itself looks good to me, thanks!

> v1: Edit the doc comment for `IoMem` to remove the usage of
> `@` for parameters and replace them with backticks.
> Link to v1: https://lkml.org/lkml/2025/5/30/550

Please prefer lore.kernel.org for links.

> v2: Removed reference to internal variables altogether.
>
> Thanks!
>
> 2.49.0

The changelog (and any other comments) normally goes after the `---`
line (before the diffstat), rather than at the bottom.

By the way, since we will need a v3 to fix these bits, could you
please try the `--base` flag? It is always nice to know against which
commit a patch is generated, even if in cases like this is obvious,
and helps other tooling (e.g. testing bots).

Thanks for the patch!

Cheers,
Miguel
