Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CCD2FC00F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 13:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751635290; cv=none; b=IW40nTFFtgx2mqVIWAcRlW4qNFE9VAIKYWU86Si6Vg4fIk6fF+5zs+GntPh3wX3bAKszeK5mB+11YwrbydVRp2CDqa4q+lstxKURTLJCm5G71k2FFK7M/jLt73WOheffb2WpWWJkV35NiWUoVU6yUw+4+FSVKfJyRxkkiO+XLPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751635290; c=relaxed/simple;
	bh=7pn26wqB7E4DE9j9SBfVpNf9QfVcZlLPWhXa5E3wFDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JkcFmyJ4WIeuPETHZMXhI0ZO0HktPMs2sBFtrPOTIu3QlC3p4CijhJRo2l+Hdo99DbpwZtmZp0yBcHvZitkqTlKkL/R90/d5q1quLM+4Onq1cbK1NzZJh/N6NoCIAcqgga0ZSyeRGA3mGd/dCmQMriXP+Mr7ZJf88cF0PnXIkCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=RqO4wxcA; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="RqO4wxcA"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-313756c602fso144594a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 06:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1751635288; x=1752240088; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csIpx3MVIrBW0iB8PUre3Gjdgc8zO1/zBahLxylLNK4=;
        b=RqO4wxcATY0DN1w0xMdQTqSQvbj/XBdi62Ap1815F11TgkV8hr4xQZy9rc/8q0OxGo
         SvFvqnLVixyqdV6HvHBkvtDwgOTG6nuHWCSVFn5Abkl1K+rsMK7TrIlJT8igRNSEbDhM
         LuFm/NJqRogi2DKGP3jj7uVxYTP0rGmpWveti4xRspeWUu8qDJDz0aMAT4ANdhJUy700
         /N9Dj4Bkv0DaV7JicGjwFl1N2RHwabOgNIFUiC+jnq8BE0Uq38p0XC9fLC1WJ4Lq7HYM
         MpTKpfm3TxTZJEcoLf+1qwwJOgJkqr1QazWUmVi7VIMV8cjnzoTh7CyTq7eazmcFzx3r
         8/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751635288; x=1752240088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csIpx3MVIrBW0iB8PUre3Gjdgc8zO1/zBahLxylLNK4=;
        b=ohJW2QD1bRwzQL1IkS93HrHX5VOaz45hYmhCobraTSgqPKoPy58alVcmVRBxnhbw4f
         GSQWgxUKzh3vLQnWnN4XpWAZSIx8ua6OOIRDEgloZBG8ZUMhJY+W9KznJu+E82KHm1xR
         DLifk301noM78SFvPIkNohMWysnW5BF5U8FsJkCLS0He3ImSXOBXmFEHPfksgEdBZfSc
         mACUQG7sdw3NHeSgWs6cwVyyy3yyAEapFR21/GYiSo3LZrLedxu8jXpPERGJMck/OlBj
         xJnjUXVYs0wdLFn6pCW1AoQ3MoUr/twPL9/3WC13sDq1dpr7N9VHGe3ci/4cxcFJgHQS
         FmFw==
X-Forwarded-Encrypted: i=1; AJvYcCVN+E9qmRAtvwwnx/IuajPpOT1pyNjp3ZBZmp3lAGyGV7V0uDDbhZVxrQ5prz6w7ZKtlkA1jURu8AyRQgA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8HMaqx7zfMUr1yr+wnKcWRjt7Tdc7vDCcFrDzIxJl78Z6YXFh
	esPNaKN14uhVv2ZNQd6Ov4BqGE7j+90CP1RuFhN4nyt/mwfS5DmPzXELap5BWxclxgO+ofc4u+N
	ab+9oMycuJdoevZn+ebWTfo9el+vt2IyJREB4RU9MEg==
X-Gm-Gg: ASbGncvUtEPipEf8WFaON1Fc4NcWhKv3O3UeB4x+HkvFrW4Rs6dwKkVZPHWylbHDvzu
	jwl9vj+utJh3hBx4+z65wR4rHy6uEJMRo1ojs4ShmlRuxxxNqUUkpcDaSnvvTRjlMTgZtjoraoO
	MS3ATtugg6NHBJMbaZM/6BuojLDxoKIkh8Ppja81PcnA==
X-Google-Smtp-Source: AGHT+IFIalK1q7PuYQacEOOylwigm3MLqAVV4a++wSj1Fi7xAU3siZ8xFwMAdPQtVl58SiCfoJH2rt6pVCi3h6Mkyec=
X-Received: by 2002:a17:90b:50c7:b0:311:b0d3:851 with SMTP id
 98e67ed59e1d1-31aacc13ff3mr1578721a91.4.1751635287572; Fri, 04 Jul 2025
 06:21:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703-ublk_too_many_quiesce-v2-0-3527b5339eeb@purestorage.com> <20250703-ublk_too_many_quiesce-v2-1-3527b5339eeb@purestorage.com>
In-Reply-To: <20250703-ublk_too_many_quiesce-v2-1-3527b5339eeb@purestorage.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Fri, 4 Jul 2025 09:21:16 -0400
X-Gm-Features: Ac12FXzn9AZ9Q0t65Fv80-Zd62OhTB3LYs186s63t3QM7-GfH540rIL_HbSxleQ
Message-ID: <CADUfDZrLOwGxwDg+QOPLXQKfZZbO5kVaV-V-qFQrFTkyOyHPkQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ublk: speed up ublk server exit handling
To: Uday Shankar <ushankar@purestorage.com>
Cc: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 1:41=E2=80=AFAM Uday Shankar <ushankar@purestorage.c=
om> wrote:
>
> Recently, we've observed a few cases where a ublk server is able to
> complete restart more quickly than the driver can process the exit of
> the previous ublk server. The new ublk server comes up, attempts
> recovery of the preexisting ublk devices, and observes them still in
> state UBLK_S_DEV_LIVE. While this is possible due to the asynchronous
> nature of io_uring cleanup and should therefore be handled properly in
> the ublk server, it is still preferable to make ublk server exit
> handling faster if possible, as we should strive for it to not be a
> limiting factor in how fast a ublk server can restart and provide
> service again.
>
> Analysis of the issue showed that the vast majority of the time spent in
> handling the ublk server exit was in calls to blk_mq_quiesce_queue,
> which is essentially just a (relatively expensive) call to
> synchronize_rcu. The ublk server exit path currently issues an
> unnecessarily large number of calls to blk_mq_quiesce_queue, for two
> reasons:
>
> 1. It tries to call blk_mq_quiesce_queue once per ublk_queue. However,
>    blk_mq_quiesce_queue targets the request_queue of the underlying ublk
>    device, of which there is only one. So the number of calls is larger
>    than necessary by a factor of nr_hw_queues.
> 2. In practice, it calls blk_mq_quiesce_queue _more_ than once per
>    ublk_queue. This is because of a data race where we read
>    ubq->canceling without any locking when deciding if we should call
>    ublk_start_cancel. It is thus possible for two calls to
>    ublk_uring_cmd_cancel_fn against the same ublk_queue to both call
>    ublk_start_cancel against the same ublk_queue.
>
> Fix this by making the "canceling" flag a per-device state. This
> actually matches the existing code better, as there are several places
> where the flag is set or cleared for all queues simultaneously, and
> there is the general expectation that cancellation corresponds with ublk
> server exit. This per-device canceling flag is then checked under a
> (new) lock (addressing the data race (2) above), and the queue is only
> quiesced if it is cleared (addressing (1) above). The result is just one
> call to blk_mq_quiesce_queue per ublk device.
>
> To minimize the number of cache lines that are accessed in the hot path,
> the per-queue canceling flag is kept. The values of the per-device
> canceling flag and all per-queue canceling flags should always match.
>
> In our setup, where one ublk server handles I/O for 128 ublk devices,
> each having 24 hardware queues of depth 4096, here are the results
> before and after this patch, where teardown time is measured from the
> first call to io_ring_ctx_wait_and_kill to the return from the last
> ublk_ch_release:
>
>                                                 before          after
> number of calls to blk_mq_quiesce_queue:        6469            256
> teardown time:                                  11.14s          2.44s
>
> There are still some potential optimizations here, but this takes care
> of a big chunk of the ublk server exit handling delay.
>
> Signed-off-by: Uday Shankar <ushankar@purestorage.com>

Reviewed-by: Caleb Sander Mateos <csander@purestorage.com>
