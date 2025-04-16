Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2582045B7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 19:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744830780; cv=none; b=NhtGZjcgtgQkilDbMgtDji1ryEJdVmgRuKc+FnQFeVXDkFnII5SmTX9Oa4XK9Y5AzoR+oZLZySo9rBPI4qVsNchy4cIg7UIimhpgVLjB+CU6U2/9zxrm+6rNvO5uug2mbHQzE+2W+DykqCtEqoZj7MzRJbRnP9Z1XqKgTarikLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744830780; c=relaxed/simple;
	bh=YAJyde0rKlA3/Jqp4w4fxsQdvAfJUtcgdJrAhXCwwWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NNlfKsE3bcjKiTD8t8oMCaUUcgsodG5g3SzjpK3pgtYLIErOHwOOD7Qjmg+YEaNVrj9lBLhHeUZbHM+fncy+KuJK6ggfDBhmr2fh7W1vj6LNrTvzuj5zcX0PrPvRnpFKAqhUQUtyk3SjyacaPT1A54iZ+vy/Np7RFMZHbkaAsYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=dNubGrkb; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="dNubGrkb"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-301a6347494so1239205a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744830777; x=1745435577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAJyde0rKlA3/Jqp4w4fxsQdvAfJUtcgdJrAhXCwwWk=;
        b=dNubGrkbCdiSRJ7SVPJ2fmimk4f7lxRhnPd8I6lRJGrHsfLy96c33eE1vZf5IDN3dn
         GmD0et2ca+ZYf9mfDO/hxcka6zOLDOf4c46jEGH2bT0VwxzPH7enhGkzNCNsydofISMm
         FUFn3of5G1nNhQtk9HS1QQUcVqZxCtXFhR10iGnbmJQTkn9+e9anSUix8+9YDXzLwjXQ
         WpzMxfEBTv64CE8a+rhWWhNhOE5+4mkico+y+RIpzFZblHYUbIw5A8QT0xxKWkMQ/A8u
         4VLLVC5IHLifkgPSYGrTmYSebbHxcKCN2xuoVGnh7PSbt4Yky6NDE5DBCahaY0XW3DzN
         SASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744830777; x=1745435577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAJyde0rKlA3/Jqp4w4fxsQdvAfJUtcgdJrAhXCwwWk=;
        b=ZDYMdBtU6JJQue4XcjQkKnqgaiz1V0bQjeOOiW9UI+UauJhOIt66HKDPH80HgKf3IY
         w8tThrXF5XQtXa7ZB8H8mRlEzcTkpPR6M8v56LTnC6bRcqKYRanNmwphHnJg2sg9mIzR
         f6iCD7qh58k6e9SHEQVGtxAbaKMKe3D+sPTgy5sOBH/QpCOxXSd5vPEhV5r6gftOgHbb
         BFGpBBdtPyeUnEgT5njmdJx80OGCnPtelrFNrMr2iAjB3yzlAkQ3sCc+1A6ncv9MzM4W
         5oFcZxY+gqyhi3gIj9ky29bVU/jbG6+24zEdQbpSKKksDN+BYxPpUD8H41P0rVfJ9QYZ
         dFsw==
X-Forwarded-Encrypted: i=1; AJvYcCUaH+tRgyVIBmVPFxdSBefVtx1kmLTsqDY8/PQ2AHyagnH8E7ba2MWAKWL7Bwpin648Lb3kS5h0a/8c1Ks=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeXNR3WQRKO1st8tBoTnNaIdGRjg+g7VTZTlbCZu9kVx1EMCBi
	J3r0Anl2WWoT4HGo3KBGpjs7QMHBe8Z98uQxcJsjiBB8c/sZEIrqFTZOAasAog2W7WYVlH8l8q2
	oNMvOzYd4JO7XXnUrzbFbyYu50qvwyTWeKnzLxA==
X-Gm-Gg: ASbGncv1bJHdXgozFjP5SWW3w8YCocVRQYLsERNdWwCZ0adlyZv/Op5j+gn8eZcui7j
	J/FlRbYpsm2SkEgbONDOOYoAKp0Ee8SLt3sXj9s5zjJYq3Ll74Hoh5thMhCIt7rMH2C+66cPoT2
	4CC0aV1bUaXoaDFzxzqPs6SWWz
X-Google-Smtp-Source: AGHT+IEEcaK/kf+hnH7WpJIPAbQ8YV9bexKkzYpKirQXm53d9m61Se6AU0kOe6wu5D9y8Gg8iAntt2FdlcQVnKoaH4I=
X-Received: by 2002:a17:90b:1c8b:b0:2fe:b879:b68c with SMTP id
 98e67ed59e1d1-3086d45aa33mr512422a91.6.1744830777267; Wed, 16 Apr 2025
 12:12:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415-ublk_task_per_io-v4-0-54210b91a46f@purestorage.com> <20250415-ublk_task_per_io-v4-3-54210b91a46f@purestorage.com>
In-Reply-To: <20250415-ublk_task_per_io-v4-3-54210b91a46f@purestorage.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Wed, 16 Apr 2025 12:12:46 -0700
X-Gm-Features: ATxdqUHTDCU2rQJ_X2Nhw10mB39sRHdrBHSFxas462wTw_XpTmSoKQxHVE6ODV4
Message-ID: <CADUfDZofzZk4vE4E=aKcTTDwm7KxT1F-3_xMTrw796nL_tH=YA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] ublk: mark ublk_queue as const for ublk_register_io_buf
To: Uday Shankar <ushankar@purestorage.com>
Cc: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 6:00=E2=80=AFPM Uday Shankar <ushankar@purestorage.=
com> wrote:
>
> We now allow multiple tasks to operate on I/Os belonging to the same
> queue concurrently. This means that any writes to ublk_queue in the I/O
> path are potential sources of data races. Try to prevent these by
> marking ublk_queue pointers as const in ublk_register_io_buf.
>
> Suggested-by: Ming Lei <ming.lei@redhat.com>
> Signed-off-by: Uday Shankar <ushankar@purestorage.com>

Reviewed-by: Caleb Sander Mateos <csander@purestorage.com>
