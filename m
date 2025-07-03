Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704B01A26B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 01:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751505813; cv=none; b=g/bYTxvH6fCDEU5uCX9ikJTHjtcS8Cvv+wDtqSJ5Dqg5mU2M7CfBc+D2wZoGWTtvI0OBaWrEyL1eoOXXV2iHcz40glvHVrlDQ1Svb9g5LC46I2kYre3dNOThizdkFe4Uj5UpPHcg0swOHOz9WH3j0ydabk2ZP5bfqNvWGQgexUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751505813; c=relaxed/simple;
	bh=XcWyjul+cST6dc8a3yJU1N8vgrQ8Cjb4ZU3ZLa7vC6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wl7/XgNgaD+SlEcWc/03WRgTo7ZkMlA7NcMdmLFZ+QDaOKN+aei5A8170Xynwgo2dbjn7PQPN3HdAI3wFWq7DQvQIcM3UUynEfB/LAxPZcSUIgdmFMJ9p6iP6u7OIDS/lFgySGNiJlYcvuGbGOPBmzf7y7lSDTV+OgaiehP9m/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=PRPFaZk7; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="PRPFaZk7"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2369dd5839dso13236785ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 18:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1751505811; x=1752110611; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcWyjul+cST6dc8a3yJU1N8vgrQ8Cjb4ZU3ZLa7vC6c=;
        b=PRPFaZk7I9umpsofnN49HppE+eGmT0cqaE1vG+zxf1YjYnUOzn6cNY0W7enIXhxRTR
         2vGx2oANlYN0XSw6GYo8ueEjovWjd2Jaan6+wcKJqcPjN10CHPVvQuKf+9sp0nalRgRT
         tc3PBzSOvoOuehsOrkdeJg6gxUk7VeFfqNT+3TpvUxx+A9FBX2aIn+VCew3bofHF2DBx
         kwThT4xytettkc0O4j5A2yzsiHnL61L60K0faw491JzU931TZlo4P7TsxQAoIuxrV1f4
         YzxQljDo8Qe56TDJ59pYbsL+VSRkEXxD+6ZmI9GYCpKWt45Qg4orr1wFaqUn15sCSVgn
         2w4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751505811; x=1752110611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XcWyjul+cST6dc8a3yJU1N8vgrQ8Cjb4ZU3ZLa7vC6c=;
        b=j2smmy5+ALFylUK8KJRYFM6hXFaf9HdqMGK8tlXaRJrqgj1Mi+xoWfljPnOH8wX1pT
         vEJTUMby+UQZK/uNn1441rD3YWu4f3kj9lwWhuucgJjfCFIZ8vzDL4c0ngm4KxIGctF/
         +8VjjRo01vkNNvs21KV07M9cxlp7f1vZUssceK3IM14VpvHsWmgR20iCwuCfHoFjeZfG
         EM0X95c1mxEST5KRFDrNTWmdBSDvGyj2mSkZf6bpfxvRShP+1bsm0XD+5oKXW76KuP+K
         Sikzt8ZaXqPqWPaIvhK3c2SMX8deQSt0SGXIA07EdN+DlkohrfB1HQISGGwQUO1ReWKg
         214A==
X-Forwarded-Encrypted: i=1; AJvYcCVsrfrsXN1m6AwZWKL8t8A03sKVpTl0qphioiwsh2d/XEtUxO//v6RORE7qkQyLDVBHHg1xmiw73FHodFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoBXnfmABmZLJEAF4nE8GwUMSSmn7wWgRjnMuxUX9ooLO91Ygl
	mJ4fRRbNTMQ6RTpYiB5pBoDfUPKyhyCh4gRGMr9jcbysBFIvLwgfSZSlIWhD17hy8V7f3MPDp6S
	43ZO6+g4DL8ggwmf0uJilCtOi3JQiwlzrdbaCsVk1/w==
X-Gm-Gg: ASbGncv1Q7+lEkH4RMReeJYCJFzD5SJJuAFYCVXxYqsZIXF5wY52YN9bcqjlhu8FMBz
	YVBpKr+kytymvqUfOyNo6J0Ivk0pmhDfWMyeyRAnJnO7LqcMA5g6c3RtcR2PII7ThdP9oyA9tew
	OQF6F+nVJpPaKpOHJWGljAjr3B6ZXul10WBTzkhczI1Y9Y1zEfBm91
X-Google-Smtp-Source: AGHT+IFkAQkHEbXHbguNdnR6/BTUXsGm8pJl1CgLp8QiOM1hktxb1eIWny0ADa+KsSrsRdEyWtTgNvTjIiAt6mgCsKk=
X-Received: by 2002:a17:902:ce8d:b0:235:239d:2e3d with SMTP id
 d9443c01a7336-23c7b3d9335mr2342685ad.9.1751505810682; Wed, 02 Jul 2025
 18:23:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619143435.3474028-1-csander@purestorage.com>
 <CADUfDZo5O1zONAdyLnp+Nm2ackD5K5hMtQsO_q4fqfxF2wTcPA@mail.gmail.com> <2cf2350f-286a-42cb-aa02-2eee7099fe22@kernel.dk>
In-Reply-To: <2cf2350f-286a-42cb-aa02-2eee7099fe22@kernel.dk>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Wed, 2 Jul 2025 21:23:19 -0400
X-Gm-Features: Ac12FXxXJmAT6Oz1-QPefjbPTLW4CR97tTMHUWIcn3tRGFvBQPlIlzWWfYbWBVc
Message-ID: <CADUfDZqC9n4jcT_BhoraFzxA77wSyJ4+KZ7jvOs=a_cvr456WA@mail.gmail.com>
Subject: Re: [PATCH] io_uring/rsrc: skip atomic refcount for uncloned buffers
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 7:10=E2=80=AFPM Jens Axboe <axboe@kernel.dk> wrote:
>
> On 7/2/25 3:11 PM, Caleb Sander Mateos wrote:
> > Hi Jens,
> > Any concerns with this one? I thought it was a fairly straightforward
> > optimization in the ublk zero-copy I/O path.
>
> Nope looks fine, I just have a largish backlog from being gone for 10
> days. I'll queue it up for 6.17.

No worries, I was away for a week too. Just wanted to make sure it
hadn't fallen off the radar.

Thanks,
Caleb
