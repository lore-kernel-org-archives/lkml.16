Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A856E154BF0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 02:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743130066; cv=none; b=DLgSVjPYfIPnQo9m6iE7AAmIsHx25MjKpgdghu1TETQAieLL2NtdV6nyjrL6+fi37Judg/T4CUzlpdTEPC480WC6FUQq+wRMPZ0kusybgRWyzEwQKQwe0IVNX5Egomadu5+zqf5a9qkYpMrv2xVsxF39KFJtfq9AMwZ2Sv9d9LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743130066; c=relaxed/simple;
	bh=QILqAby03bmHK7yv1py+pWbWWURKgWfLFr4gVMP81BQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D6AHXQrmJ4MerMfUppqJ5Lu9mDdiw7D90/T0sp3E+b5Ms5O55hMrb6kjUCp2L0cAPqqAuaYJntXO1PLhgRJ0EdACFHfqEQcMaEpLsnxEZBU49jh7AQyUp1AqA3755bKTPyt/xEHjco5uwIwI3bYNgsFct1n8I6u8ipt9o0pR4MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=IbxB4R11; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="IbxB4R11"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff62f9b6e4so356850a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1743130064; x=1743734864; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EzFQHCtUgWmoDifuVxej7HfnN8BQClVg09pdvG46dw=;
        b=IbxB4R111+2RBJBoyPONFX97qqlBk9yiLiszqSIpPVrWqO/6FPcSYVHSuHjNrNaKdU
         xbtdPZFbtPxxlyxNoMoTvvCWvM6TpqiDiZJEVDhD0+Fx53IOtkknhNOK6TthVRazTCzN
         AgypNeCjyqlrW70fagZhYdqQ3oPG/BPTX62GE1JXrBsODg2RYEDVWBnQC+WRRkYVQfzy
         fGr+E5K0JkyDgXUrxkDen4pOxlG/dKEmqNoVHYJ8sAqpTad75A/Qwlmiv0CJoNczM71H
         dqE+I9mjTI1v418A77F1OAOPMHo4xj8o8xvhaBzBrDup4ynIss66cjoZ1/YpRoePwRUW
         pkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743130064; x=1743734864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+EzFQHCtUgWmoDifuVxej7HfnN8BQClVg09pdvG46dw=;
        b=d0ckIdidZ/ueTaNYUhdWOj2z/4wPH5ZwTZDuzTpsqPm3hYPp5/ilzV15nSDQzMkH2S
         AR/sQuu1iHvEGFphZO/z0cRoQ62hPlld+sZGikf8dtqUOjRSKVI2EazD5bfrwzW/wu/A
         huB+ncEmMR933xmooI1wyAH73S9Ui8OuEat/z/k6Lpy0m8k6kqklQysIpPXokRPp0Y/g
         lOaTc+95eGD3xsJuD1CLpV1880GYo777dWWqkPOmmAPV6PvEhru6fCiGr2quARpcVWWi
         oqDEkeC0rI3ozbaSkhIigDm3MgB6iJqI27LhnTm6Av5Si4lMlivQOopF70aFBalZX+2G
         Z5YA==
X-Forwarded-Encrypted: i=1; AJvYcCUoFOj1T375xdLethwrYPB/qc3bMk7gLLeoRiEIEqriI2eQi4RgIE8JUJbuNvWJS0e6tNYAArMW4BLIo1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJuCFQ3pKKEAUeiMaXqC/0EVj22kDo1XjxuvS4GLG6xK3W19lq
	/F/RsGPFLRWbPC504NmwDP4NU8dHwn4jqqMfCx9trog9A3KpEK7FVNxR0N6pnAz1Y8cVqAGQNcX
	xGnu7UnFvoxEF53xB9FuGk12+R5LLCBQ2GttjpA==
X-Gm-Gg: ASbGncvMn2dUbMp/CHl/dL4bEJOSm/oKcY9UoRRkewLHJxbK+yzpeeApMXVTCVx5wj6
	OOaAQ2pgA5WQhzKlmfLOcYyIC1b92C8Q2iCaQ98AnKtYAOjA1wWbSvkzfSeG1O3Iijo6LfTXpCG
	Mjr5RFhvnt47/oVeDPznJG7Cui
X-Google-Smtp-Source: AGHT+IFyrhfYHVDlBOiKvWboBacvv1fccig7N3Elhwk8fCEKTl6db/yebGmyYLY8ZpyFY7nSqApkcid9OQtcv8EmepA=
X-Received: by 2002:a17:90b:314c:b0:2ff:4a6d:b359 with SMTP id
 98e67ed59e1d1-303b278eefbmr2488894a91.7.1743130063671; Thu, 27 Mar 2025
 19:47:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321205722.3947901-1-csander@purestorage.com>
 <20250321205722.3947901-4-csander@purestorage.com> <20250327104441.GC10068@lst.de>
In-Reply-To: <20250327104441.GC10068@lst.de>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Thu, 27 Mar 2025 19:47:32 -0700
X-Gm-Features: AQ5f1JrA-BzXMglBzOaQqSWgz06sNK3uTMpl7x2enG4XCF9cWuP5AYH0nUF7HF0
Message-ID: <CADUfDZoMhCyM1FQmhftEeC7G2b5Wj338DE=H6XxrUjp=eOoJ4g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] nvme/ioctl: move fixed buffer lookup to nvme_uring_cmd_io()
To: Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 3:44=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> On Fri, Mar 21, 2025 at 02:57:22PM -0600, Caleb Sander Mateos wrote:
> > nvme_map_user_request() is called from both nvme_submit_user_cmd() and
> > nvme_uring_cmd_io(). But the ioucmd branch is only applicable to
> > nvme_uring_cmd_io(). Move it to nvme_uring_cmd_io() and just pass the
> > resulting iov_iter to nvme_map_user_request().
>
> From a quick looks this valid, but actually adds slightly more code.
> Is there some long term plan you have in this area that this helps
> with?  Otherwise it feels like churn.

In v3 [1], the call to io_uring_cmd_import_fixed() is moved before
nvme_alloc_user_request(), which ensures the fixed buffer lookup
happens before the request may go async. That way, the request stills
succeed if the fixed buffer is unregistered before the request can be
reissued in a blocking fashion on the io_uring work queue. There's
also no longer any cleanup required if the lookup fails, so it's a
smaller net increase in lines of code.
Philosophically, it feels like checking the io_uring command flags and
looking up the fixed buffer doesn't really belong in the shared
nvme_map_user_request() helper.
I don't have any particular future plans here. I'd be happy to move
the logic out to a separate helper if you feel nvme_uring_cmd_io() is
getting too big.

Best,
Caleb

[1]: https://lore.kernel.org/lkml/20250324200540.910962-4-csander@purestora=
ge.com/T/#u
