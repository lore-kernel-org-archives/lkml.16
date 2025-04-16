Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBD1224B1B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 19:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744833329; cv=none; b=XlQ6+mwR3E0LCza3dJdk2v2CUY8QiPsO7tUIp0SBZR2MvohxHW36sLr83GK29p2jTY4EsljT6NOJLoLCzhE+1JdHvPbJKTGi3GZols+zulNyV4Gq77P4MlSa78klj61PzgFOzmr4NQbBSCGElsgtOErYzdXKOQuIwcgvNgE6Iqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744833329; c=relaxed/simple;
	bh=1HUg6vRplYnyCVWiBYojljLFNc1IiwTnkSohA4vTdkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W/OwmNxALhq23f5rW+SEAMzeQrOk3/6PFjGEAyZu1hgsF4uM6bYOPiiiFCAR67xw3TA1j0ykyixiwOGz5YuWeuB+QQz38dJeRlJQFYMMguEnwhuwF5cVmb9hivxukDjGgFIh4KIz5zK6avmhB/d5SRToxTPV3MZQtAIALKcvDx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=BttANV3m; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="BttANV3m"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-223f7b10cbbso84125ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744833326; x=1745438126; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HUg6vRplYnyCVWiBYojljLFNc1IiwTnkSohA4vTdkM=;
        b=BttANV3mwvcyQwuziqUN7MbQfIuxxmpc5mJ334ngqS/qMDf2pmhi8oQWh7Bk6SR/oY
         +rpLChmW8Lju3Wp49gcKHlnUMEEYa1ztzvaL64NbrDGIktFNp4zKKT//LzWB8CCR5OSO
         /2ogF56ymHDTk21fV5KzmEc7PMZK5KfohJWXTG7TsnAZskfq5kBoQMjbv2cutSp3j0/j
         0gzIHy71jpkhFt81MUgdQmlwvn35ipYa58AkDioyGZEtKcaRiQOMakOObVP7+vugAbkH
         6f3ZIMXF+iuy8uUw1MCfT0EjITi52/Tm7jD9g/bAAsf1ssfuvJJmZ0bBKgMvnSnIpAnw
         2uKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744833326; x=1745438126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1HUg6vRplYnyCVWiBYojljLFNc1IiwTnkSohA4vTdkM=;
        b=Udwd3X8jpcUoLlbtirziFspWdQNrOWQUx3dGr90wz0klJL4TX/4w29Aqh8u48eV8mC
         RdmRhGEDkXB/Pd0vxpsX6nx3MBFXjzEfoxreHr1kNQw1/zrArHslovGadlN5bHT0UZ+F
         5/V3yxCOFA31OqlNNaOntQ2Oox2YyE9cECTn1zTVhdyif29WB5u9WDevTg4UTYjJkURg
         iXTUaM18KzOi2lsmP/QFDu7LdBc8Dxbhd6orjtJxyzEYy+4SaQY33VVQ/FOVtphtqcGe
         GMXGHOA1z2jLmL1kYenjRx/AUKofWEB61BJfvY1J7y7+7Kq0dS0CR0CNEEl/619unJma
         pmqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/KkB+tRxNeWxV4P6n0kDRFz7ZyQ5xVSMUWYC8TUSFUsrLM4jFtvPqsux/6oxO+/9Dqv+Lq8L/+jUsv08=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLKMP3talQSRkHs15de7BKDphjyxkHOInc5ck2tjTfcjvMQUr7
	dEuR4k9Z2Hpev8t4cqTycUglqdrK4Fl1skYL1ekd+tLyXDV+Jgv0O795+mrxGoH9qQh0u9b2SQU
	HFjzuI/spjlV54zYHFHmVeMSzivkKD7pxa7U9uA==
X-Gm-Gg: ASbGncvzyg6qCQbbLq+uQ1qpX9RbFc2N9TITfyD4U8UiASxWCJKws2OZUdMCQfW4e22
	5kGrwsFnJ1L+OrqDEAf9039IkbIU2/VBFdw0W3CcuhnA+6WdV3RoYz8aOrQkaCAep4o112YVJo2
	RmcBBtkRNeeoRpru/s6I78LWx8
X-Google-Smtp-Source: AGHT+IGqDMF/ALxgIEpB98flitK9xgvxPgd44G7WeU/Xt83/u6oRlv7JHAEZnJWkR5Q0ZDEgWiYoqEe8L6aCLUjE4bg=
X-Received: by 2002:a17:902:d2cb:b0:22c:336f:cb5c with SMTP id
 d9443c01a7336-22c41200358mr2529885ad.6.1744833326409; Wed, 16 Apr 2025
 12:55:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-ublk_task_per_io-v5-0-9261ad7bff20@purestorage.com> <20250416-ublk_task_per_io-v5-4-9261ad7bff20@purestorage.com>
In-Reply-To: <20250416-ublk_task_per_io-v5-4-9261ad7bff20@purestorage.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Wed, 16 Apr 2025 12:55:15 -0700
X-Gm-Features: ATxdqUFwp4qvZeRJfWY7VwLd0YPT411Yqwdu1i1gJfqMCA8jsnrpr2zoR65e_0k
Message-ID: <CADUfDZqNh1G8VDOw__y96ZBtYa=Y2ZhoX4emutMqxki85YABCQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] ublk: mark ublk_queue as const for ublk_handle_need_get_data
To: Uday Shankar <ushankar@purestorage.com>
Cc: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 12:46=E2=80=AFPM Uday Shankar <ushankar@purestorage=
.com> wrote:
>
> We now allow multiple tasks to operate on I/Os belonging to the same
> queue concurrently. This means that any writes to ublk_queue in the I/O
> path are potential sources of data races. Try to prevent these by
> marking ublk_queue pointers as const in ublk_handle_need_get_data. Also
> move a bit more of the NEED_GET_DATA-specific logic into
> ublk_handle_need_get_data, to make the pattern in __ublk_ch_uring_cmd
> more uniform.
>
> Suggested-by: Ming Lei <ming.lei@redhat.com>
> Signed-off-by: Uday Shankar <ushankar@purestorage.com>

Reviewed-by: Caleb Sander Mateos <csander@purestorage.com>
