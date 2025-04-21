Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32BF17BB6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 14:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745247033; cv=none; b=KH01rPBFhYelkZNob3ozWbl/1W3BiFlfYgaEFAwCUcRnu6QRmra7sKwt6Iud6wtH4HLNuuXZdUvLlOQUVFtrrnKAt4crkllsQ7PDY4lZogEKoXJnM3aztFnJizcGRceXery9Q3TM5Z3Ssm9BsKTygcfBTKz8V9D01OEswFsg1ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745247033; c=relaxed/simple;
	bh=ma6VSPAerTYV945vq+tPVgiv/w3GUlc6YvG/pZlt/8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=itWWbmNDqGmK0nXvUmy30eWjreN8KQgxFcPOemE/upDAbjkTZy93W7OnYekBfLJeZOSABMA/i5REXJ+T6KUF3mTKcvZ3uHiAm18sCwA5M4zGtDiNZLwMM1lQVTLXVj5eXOGsAtZqrfzhTFnAg9m00lTFJStFCPgbQTRqmUahJEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=BAFv76h3; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="BAFv76h3"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-af9a6958a08so411935a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745247031; x=1745851831; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QENNCrjCWntef3deRbb4YDB7wTorwvsVGVDTK+xRntE=;
        b=BAFv76h3i5ZBorkZj7biuvAx9izUG4xLIE3L1fkYy8Bp1we6ekcm0AxLDlr+K5G12R
         KYm8xhTEQ3JnvnD1JdtEy3icbiqnbip1d2tyixLVqrpj53vbhE/HTbMf560ORiMRj4zq
         R9vQw6RoAodlHYGz+Ea/iPyjR42maG2QljDZs8/QFLwQUjIU7EDK/gJ81GQFWKtmct4V
         3nT+ji7epzuArxpc3wTEH8ryGCvzgGrCsssag1W1aF8zf2tHhTxiXbVT4l9XWq96+gda
         9XVk+i3ieD0Dah/cBddOFHP9AwmcNkrJgAEOVR1TT/Zi/piA4iMNRRHwfaTw9J108gfU
         zydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745247031; x=1745851831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QENNCrjCWntef3deRbb4YDB7wTorwvsVGVDTK+xRntE=;
        b=Vs+ZygY6zUwHiNrzj/VMktzGIsUfG4o2zXnrciJx0dlOWESP8Lpbk4cz58xMtUmSpF
         9yuNDuHcIFcFOwK/KP/IkW0bwghMHi7jJ37EybL+XwcE+c9uT9wvQ5bBwmEEo05DMP/y
         Ej62dU0kf0QQCaHH6IYsJZdZZoNlzoCJW8JKSWd/xOrxx+PNIRSrRpPJ42+76XWbFvsr
         lSrwbrRvo5FzTC7du6jVAbQDcqUzt6QqcuyLwVWQBVhPEfkQ/oYV4jwA7HMwyNjmPBiZ
         G9j1chusTwxWjaVdD+o05tyn2aFYpyIKFoLms51eHsEMLlvobsgTfxQ8NtMh866+reed
         iSaw==
X-Forwarded-Encrypted: i=1; AJvYcCV6XsjuvdIda66IQzAmAkud07tnjpv7NvazP2W8CkDbh93cBbB8XkRaAM5ZAxb5VkOgwbI6BrZuBPDhNUU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+qx5LrHd+yqlpkW0HeiRctM+2ZaVyYGBVujZ7deCkK8DKwn9e
	7M0GRhQgkshazDAdhLIOGOjpMJUe5b+ZQY7mBG6BazXIzm6Sq5TEbISAGYUuyoAD6Opezcx/phC
	iFUP7OkltQCyAeMm9LjgfCkSMrQU5D1VB2u5K47eYajAa8qVg
X-Gm-Gg: ASbGncuk6ca7mwNLecxnMlMvk2f2bGLa8rZ8SKcBCUrkQgJYjn5avxO1uzPvcYZmliD
	3ZZm1ej7iUDu13iaXZVRLNA4ZPEy3NWe7ioww8K5VqBNvWHjxzyz6Q9Vn7JSsLE5Lh5xllJCMMA
	n1ylSEbWPnIX0mV2AaIWJF4g==
X-Google-Smtp-Source: AGHT+IHGyIn8Ggts2Cc0qvPGykqovnuCA00psLfWjJbSCUbMZNw6jer7jEaCr1NDs6Jo7lxB27P4MZf4Q205Us9cxvc=
X-Received: by 2002:a17:90b:3b82:b0:2ff:6bcf:5411 with SMTP id
 98e67ed59e1d1-3087bb313f0mr6899291a91.1.1745247030715; Mon, 21 Apr 2025
 07:50:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250420164653epcas5p10dba2c638655fd4b16c6553d5125a3a0@epcas5p1.samsung.com>
 <20250420164450.1144416-1-csander@purestorage.com> <ba40abc8-8b41-4e2c-a700-04e8e424bcc3@samsung.com>
In-Reply-To: <ba40abc8-8b41-4e2c-a700-04e8e424bcc3@samsung.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Mon, 21 Apr 2025 07:50:19 -0700
X-Gm-Features: ATxdqUF55Ax7ibERHwBXWAwdTqIHaIXovQcmFJZCKc-VxqIvQ5GCvoXYN6uIH88
Message-ID: <CADUfDZpDS6GUOhhM=je1hiKd-iAQLR6c6pWCyS-qTuutKNWzuw@mail.gmail.com>
Subject: Re: [PATCH] nvme/pci: make PRP list DMA pools per-NUMA-node
To: Kanchan Joshi <joshi.k@samsung.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 12:09=E2=80=AFAM Kanchan Joshi <joshi.k@samsung.com=
> wrote:
>
> On 4/20/2025 10:14 PM, Caleb Sander Mateos wrote:
> >   static int nvme_init_hctx(struct blk_mq_hw_ctx *hctx, void *data,
> >                         unsigned int hctx_idx)
>
> Missing this handling for admin queue.
>
> We may go to that case (i.e., admin command with data payload > 1
> segment) less often. But when we do, this code will give
> null-pointer-deference.

Good catch, will fix in v2. I'll also adopt your suggestion of
dynamically allocating the per-NUMA-node pool list.

Thanks,
Caleb
