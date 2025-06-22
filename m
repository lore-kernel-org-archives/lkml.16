Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00771167DB7;
	Sun, 22 Jun 2025 23:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750635733; cv=none; b=O7nzcT+szPykG88NtmP9UqV/venXuP+yKj0lzQAAIz9fP7L7+/FG6GGLIcYTTtl9M0NJGQjtLpxO6rIc7Vq6Dx1HgszyV1gKuCJrOMiWBbdFGLbhWDlLoqe+dMFfE7cPPFP+WQS77RWzfggbdrCEVgFnz94eywa+jPEooxY9uhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750635733; c=relaxed/simple;
	bh=xu5TIHGybIPfNvLwyvfLcbEZ6GtCVWyyWGe0mtahQNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hL6g0Qz1eTfoPT8VaxaIiiEftl9TTkP2xLnSlFJkqdliRVpijgGDqs0M+F/7/OgG9NyWojh3QNhya5/bo4J2V4L0ZrG+KGEVwehvdVNqiU4/xljkQM4CHN6ZZPjS8vQJPrPBnRa7zhW0xVuDX5EJILTyuuYwBWizTdXgcMt3UoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TyDOcPcd; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyDOcPcd"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2eb6c422828so2123061fac.1;
        Sun, 22 Jun 2025 16:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750635731; x=1751240531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X02XUS5FnsxUiuzmvCAP6QQynrT5d6AhXsvxvVft44c=;
        b=TyDOcPcdgIE4VrFzK4t12N9f9dC5czMRgaqEWG2vdFWKvfTAoHMZxLcQVABzOgCumn
         X3KVo4zQqGlp3c4ftN1R6/RKB7EGSZao+nqri3mjhQjlojQkJ6+hrfhEDx1IrXdYrLH6
         DRKB/bpNE86Fb/aaOp54MSr45HoN4W7MowP3cM0IBUfskxp3IVOAMl3KLX9bPK+UvMV9
         rhSo4pRkIiVNpnEtRkpOhQSjIzI9YPJ6BNvxej4tUSnUnuCpaXU/parlYodFgYTyPK1e
         wKXywQrFym6dappxA+3xtMXNpmgrTegLjQCwm+euASF3XOf/yGqduAuAaUKzLyDzxNM6
         7WCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750635731; x=1751240531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X02XUS5FnsxUiuzmvCAP6QQynrT5d6AhXsvxvVft44c=;
        b=c2WkT9GIEKl53rBQF88UwqMJjqx4+7Zpb8PGTK6bA/pqSSJm9sJEEZD1ohLgQD9O4V
         lPZ5JYDIdArcsdxpajbBnCrDUSr20p/ZIVaqaYIdYaSm6NNLrcJSOCdq7c+hsRGoS9zI
         wCeJ1a85pgirxjizfN+nCZMWAQbPkMODwraSYV+NNbIWBbN6daCPE+yrkVjXEHDeH4TY
         FP3hpUVTEzEFocA80QSYCE4xbYrdNePJnRTIFY7Rho7YUhnviXuX/q4lI0O4pVGbkReJ
         FGMjQOgckRvdtyDKc1oCQqlfOT4EMkRbuRUpmwIhVF0PKRGcptidpIx/qwiVskrO+4wo
         uJ4g==
X-Forwarded-Encrypted: i=1; AJvYcCWQeI4dNrCse/CjvkuuJWFJecZW/PM1ZcJIXwz5Am2jN/siU0RriM9Ctp7gUG8a99L6lsw54tUr0r6rCbi1@vger.kernel.org, AJvYcCXcxZejUoSIkZ8keH54yq/qaZRgVB85/RHAqlhXHAsdHji/uOP+pzZP4R4GYynImT23zHi+zY+vlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEim7HTGz3ZWhm5P3tOZ1G77ZfwbcmxB4V9JDNAYDWQnpm0h0M
	LAsXD0i1CUbN9Nc+1jcCMqiDoyYSNIh/YFMKiGLgX/eVz1W2ENCJbjyu4WPPV0z8BJWUqn3cQN+
	GJF0SK9oSgtKPXoaqlXqbyfPToioIrbU=
X-Gm-Gg: ASbGnctOk9CozLye4/IixE/KY1+H6NkiiaQb95CCyByNDTYkY3MqkUtX4bU+Jo0sDym
	9MNgj3HmAc6JtDaeUpR34s6isKXiGaGX2O8Oqp2uRrm4Th8fnjbX0sMu5MTz/gT7wRzw+sXhWzE
	iC523CNlFl2qn1niAnBgV+iDC0LHCZuJ/ZQ5WMAEDaowTb
X-Google-Smtp-Source: AGHT+IFiMcGR2ysePMIV8Y5lW6ZrANq6bvDnxE1/zoKJXL4wWWd25sjw7GvrVPtZMFV78GwzvcJfprs6bZqwWA7WIxA=
X-Received: by 2002:a05:6871:2108:b0:2d5:97d0:c03c with SMTP id
 586e51a60fabf-2ef2aab2ca4mr7071617fac.18.1750635730847; Sun, 22 Jun 2025
 16:42:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606-mbox-drop-reacquire-lock-v1-1-d36d1a13d83f@linaro.org>
In-Reply-To: <20250606-mbox-drop-reacquire-lock-v1-1-d36d1a13d83f@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 22 Jun 2025 18:41:59 -0500
X-Gm-Features: Ac12FXyYldMHAZzPimUiIoS4Skvo9wHzp8jNLBh5ctWPaYdaDoFaftPVoeq4ze0
Message-ID: <CABb+yY2HYgS25xouVJpq+Aia1M=b1_ocbHiyrnVqZcf0c0xcGg@mail.gmail.com>
Subject: Re: [PATCH] mailbox: stop the release and reacquire of the chan lock
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peter.griffin@linaro.org, andre.draszik@linaro.org, 
	willmcvicker@google.com, cristian.marussi@arm.com, sudeep.holla@arm.com, 
	kernel-team@android.com, arm-scmi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 8:41=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro.=
org> wrote:
>
> There are two cases where the chan lock is released and reacquired
> were it shouldn't really be:
>
> 1/ released at the end of add_to_rbuf() and reacquired at the beginning
> of msg_submit(). After the lock is released at the end of add_to_rbuf(),
> if the mailbox core is under heavy load, the mailbox software queue may
> fill up without any of the threads getting the chance to drain the
> software queue.
>         T#0 acquires chan lock, fills rbuf, releases the lock, then
>         T#1 acquires chan lock, fills rbuf, releases the lock, then
>         ...
>         T#MBOX_TX_QUEUE_LEN returns -ENOBUFS;
> We shall drain the software queue as fast as we can, while still holding
> the channel lock.
>
I don't see any issue to fix to begin with.
T#0 does drain the queue by moving on to submit the message after
adding it to the rbuf.
And until the tx is done, T#1 would still be only adding to the rbuf
because of chan->active_req.

> 2/ tx_tick() releases the lock after setting chan->active_req =3D NULL.
> This gives again the possibility for the software queue to fill up, as
> described in case 1/.
>
This again is not an issue. The user(s) should account for the fact
that the message bus
 may be busy and there can be only limited buffers in the queue.

Thanks
