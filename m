Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9482B10E9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744829419; cv=none; b=oeW/oph7YQYInoyHCam26/1PAZgOk1HwjaQs/t2LFNj0msfA480C0I5vu5/XwqJZN75RN+2gkAcFen5fFM0dtDHuyGZ3QEoeYbawXES9JOAgAmeDMh2YkhEY/r73U+JOv3TcOOEfaDZvx3TpfygyKrSkuWaKXdpAwQxF1Zrgbhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744829419; c=relaxed/simple;
	bh=h36nxeJS7+e5+KXgXM/7hnRS9OTumi3xvvKJ+Oaapaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TbMo4Rn5bjXY+JGFIbzVoZMxwvJrRK8lEL1xNLueJbhH4a3OoxQOA/hu0A38i0xYSh13ITxPeQFXO9wuHQ8qo8LlB+6HyPM6iQJYkb9PlUnATAfKf97oS+z4FYyclVNE6uwRZ4IEDvXku8CRgbKXJDwl3GDHG4RYE0EseUfnuX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=RC1+J1Jq; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="RC1+J1Jq"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-301b4f97cc1so1238023a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744829414; x=1745434214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h36nxeJS7+e5+KXgXM/7hnRS9OTumi3xvvKJ+Oaapaw=;
        b=RC1+J1JqgcRQ43YKxs07m+vlxDQIc1fQOFZmqQOqSN3ioEC/+fCojevJIyAir2rEx3
         kzd/N7bx0f2E9W/C9ChrcFrmWRnGOVhoqLRoAl5kg5NSq2SXhvR7LvqhyJmScYAilSL4
         Li1XNK30CXBl6IbZljUMbrWrZhQoaoujsELEWOE5gcryuIHQiWNhmWYy7D5L/XwF5th1
         pwUUVWCANc/xXfODmFh67UwHDkZdsHvRmkcB+nEGeGbav5g3SlhFaDI2K08Rj71bPLsA
         /+1xuw1S2APjGyjWF0eBu9AEFY5X3qj3WsIad8b6Nif18GGB12sov9YYX08HXcDRcMIj
         LJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744829414; x=1745434214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h36nxeJS7+e5+KXgXM/7hnRS9OTumi3xvvKJ+Oaapaw=;
        b=aha+xAeUCcfctwsRhFy2ob3vz1JoV+ortg+etC+woQAosptDjaXywjNNhwa7bOwY9M
         PzQi/JBIG9UuF/GvstqQX8qB4jjNJ7PsY4Bvvy+5ofYveid0GxkHDFGOCifvrbya6L5p
         Yr72+kB/ffAmIrvJUGellpoUkafQLQcmheXPaJnGpQk+Hz+Qnv44ZW0eo1IXnspb74mT
         BhRefnIhwDyIcDr7jZDomhbUd8bF5UmQ+9gwQbResNN7rvAC9rhS3apnuk7yHb9Mif04
         +nPr3xY5U31LgC4CH1ttcuiyZYQtA0jX5m+Cq20wx//uYibzQZwQ/tqRoFQdU7l/nOc9
         Ueug==
X-Forwarded-Encrypted: i=1; AJvYcCXyPE16JXkIGaYa6VVn1+JRSYbF+jopK7t62rW9hDw8Atr9tqPn2i7sZxISQmrE4Dy0Le0aoRMJYf0rCsY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywet/CLsuzeOBcFiKPOhH1XdU87du4NDVbUbBwnW18+PIqsin9n
	l2R+7De6Lne0Eb9bvocIXmxSZSs41LBlbtsClXlG5VpNxeSnMes6QMc9zAEliMvGyThC8JHvDoQ
	rQLFlyADPc9BpOxjkhqvDMqv5xRv8lP0AoAC0dBEYkQrbl2Tn
X-Gm-Gg: ASbGncvEoM2s3bRiQ7TocjsLS1xHng8RA9yJqyBfiqwFFBNA7TfCw4aM4XW55jpUWhi
	DRgNVL/lMxxiSWgXwP27Ff/gM/PWIn5solP7TxcrNETu/Nm7AW3hZbOIboKBWuKSTO04JAA4E+S
	m3yNBFksMxOn13T7xmTtycjsmIxCEJkQsX5DQ=
X-Google-Smtp-Source: AGHT+IFNVLouPuTdR9txLY+lbppx58sp7frzHLO33b43YS9nsLB6D+0mYiiF97X/id+PCYzsWGBlvViMyHFluLHbpcw=
X-Received: by 2002:a17:90b:3906:b0:2ff:5759:549a with SMTP id
 98e67ed59e1d1-3086d3dd440mr483957a91.1.1744829413820; Wed, 16 Apr 2025
 11:50:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416171934.3632673-1-csander@purestorage.com> <Z//yJApTjXvfVnga@dev-ushankar.dev.purestorage.com>
In-Reply-To: <Z//yJApTjXvfVnga@dev-ushankar.dev.purestorage.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Wed, 16 Apr 2025 11:50:00 -0700
X-Gm-Features: ATxdqUHTqrlv47_Rxh4oWznVmpNwqFylQxf_YaMWzBKEGCHIp49yYhjElGMaqho
Message-ID: <CADUfDZpH=EpCBtO0zuETcARpQ1pYy3w3ES2O6J89MH+15eOPgA@mail.gmail.com>
Subject: Re: [PATCH] ublk: pass ubq, req, and io to ublk_commit_completion()
To: Uday Shankar <ushankar@purestorage.com>
Cc: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 11:08=E2=80=AFAM Uday Shankar <ushankar@purestorage=
.com> wrote:
>
> On Wed, Apr 16, 2025 at 11:19:33AM -0600, Caleb Sander Mateos wrote:
> > __ublk_ch_uring_cmd() already computes struct ublk_queue *ubq,
> > struct request *req, and struct ublk_io *io. Pass them to
> > ublk_commit_completion() to avoid repeating the lookups.
>
> I think this is rolled into https://lore.kernel.org/linux-block/20250415-=
ublk_task_per_io-v4-2-54210b91a46f@purestorage.com/

Yup, it sure is. Thanks for already doing this.

Best,
Caleb
