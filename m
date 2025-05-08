Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D55199931
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746707188; cv=none; b=hdEeVmdO6dE2DSAHd0AYdifoO5Zrh1a+5/WQPI4TEJrrGXkeRYVypwSAFNswxRXahCUlN5nDUTAM1Msp6Kmrhmb+IXQoFbcRehMN5Gk3Lz/OIqhmJOeDtvf2Q+J92EYKb08GmQ/xOql1t96q+BfC/Blzdou6Hv4QgQB5ChflfxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746707188; c=relaxed/simple;
	bh=JulDBx7+gMMk07sfoYJ6Yckp7iHWbGd/5055q91zNW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OFgY9tsjGXc9MWyKkNIgF+8I0qYz4OQLmprLtF2ltBglreEtXrp2wT/hNNPAjpMS2k5GklpTofHaYlHGziKrWnQGV7WCdqxmk6NIm6UwK0Xr3PoYXMQmXUR4D03KUzJf32hPH9QReNTztKCNpGtsxJTcbdRpo3M3mjtXUd7P1Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x3c0kjlp; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x3c0kjlp"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39ee651e419so482458f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 05:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746707185; x=1747311985; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zuDfxCH33LiqZEZn5otDlZzjgELDv57+KJ96MnpE7U4=;
        b=x3c0kjlpUbwgAj0o3P9gPJL0L9ChnIDZou/A4SLMMWWI0ruZ5N/o4jk6Ib4zcUosVQ
         XKQ9kLq8/RMjU8fvt0Awo6WRgU8VlzDAiO9m5MFgLN8KCBZfd7VcZfN1W4DK0oClAGXa
         ybMUnRuzdUJ03MzY3NmZcYLfm/wSNEm9PGpaUOih4i4wZG+r0utnlHERXH1IZtzj2s9v
         pKKFY5teoHQoO0UMUAH6+Z+uVR7kI1EEL8Ela8QI6tAgyVRoLwjLCdaJR37z2o7JgkKR
         /6d0JMWZKECHyM4pcGOcItm7oFuay5AHVYNAF6ljp3iio28OBeBmz2LO4AWqRVnuLPuY
         pjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746707185; x=1747311985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zuDfxCH33LiqZEZn5otDlZzjgELDv57+KJ96MnpE7U4=;
        b=w6cZj1lz0KodUG3I2riEaiIy72fQAyUzTke0Lekvj9U3iqcTTIbT80zv1m5iEfz8Wm
         ifiMdQ47uxkxHK07M9d1cM2Ws8gbD2V2nVj6B/NXYW0JgaHOoDpq9PDjd2hAnPFSOYaC
         iw1ebVhEz+SDQxY6izrqEqk+8S/CUK2jJ+ceXewuIm4+lTuN9u6kFdwrnOW35evmcSbq
         EILMxRAiOyuGiqVOQxct1LhCsKcJWIhd3hH/+fVicvNw2Vg9PM/D+dAy6uCFgzccXwyn
         5MCxvQPcvZcGfOki1XGtjmLpXWvuKOPIOMwzgVAPCdYdB8WEXhAW8ROR/oMv58Z+3t6U
         FtxQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3vV3mhRxWsSblYRqFVXtBsSIQoMM4GvSrJFczFWbPMy/56zqNtvwNL9uE/KyX7kXF06/LT2fcZfqBZmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzASrmBa1dhxYP6KNAM0jq4uQy4EV30oSmhXzRkYXwce7embAET
	koeIFfFRLri5lOmNukAm5fB4RSTj3PWOpWAXhhxAWlap6/QcpsjSoQdOm/Z6ObydXg/lAe3vO4f
	khwhHedjmI9QylLAYoghAwzGCIZ7J1NVnq9kY
X-Gm-Gg: ASbGncsM4VY6HNZdXEEdQhuxVRqHPw61xHm/PmQdFD1NkyD+mStmR3B4zDb2zoN+y20
	0IAFor15HrQEBmr4FeKerb+rBgqa6ovEYNCJLGAOyc6t2aW1puddwsGSAyi5mK/SEUYLaiGnXf7
	vNxxT1Me4xWd7ck+U2Tg/uoH5gg5BHPCpyc0uusd6zv2Ql0OSe
X-Google-Smtp-Source: AGHT+IHBz/sJpAHiuTBLGG0tLMbYKjUsbJ4DWgTAOgMsxgMSoqxTToKnYwzD+hlukKMzCAgbP+8UVhAAIXQCwVemSA8=
X-Received: by 2002:a05:6000:18a9:b0:3a0:b941:dc24 with SMTP id
 ffacd0b85a97d-3a0b941dc86mr3186655f8f.11.1746707184919; Thu, 08 May 2025
 05:26:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505214306.3843294-3-ynaffit@google.com> <aByhDepxNsCCr3rI@google.com>
In-Reply-To: <aByhDepxNsCCr3rI@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 8 May 2025 14:26:13 +0200
X-Gm-Features: ATxdqUGbU3BQWNJdLvnAsMxjyVMGme5RfN6TmygoyBiOEke0YqLH6Yo4uMQEdJI
Message-ID: <CAH5fLghwpEE8GAjVTFOj0pBJ-HW=LvaWf_K3P9+optpjTsAfmw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] binder: Refactor binder_node print synchronization
To: Tiffany Yang <ynaffit@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 2:18=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> On Mon, May 05, 2025 at 09:42:32PM +0000, Tiffany Yang wrote:
> > +     if (node->proc)
> > +             binder_inner_proc_unlock(node->proc);
> > +     else
> > +             spin_unlock(&binder_dead_nodes_lock);
>
> I don't buy this logic. Imagine the following scenario:
>
> 1. print_binder_proc is called, and we loop over proc->nodes.
> 2. We call binder_inner_proc_unlock(node->proc).
> 3. On another thread, binder_deferred_release() is called.
> 4. The node is removed from proc->nodes and node->proc is set to NULL.
> 5. Back in print_next_binder_node_ilocked(), we now call
>    spin_lock(&binder_dead_nodes_lock) and return.
> 6. In print_binder_proc(), we think that we hold the proc lock, but
>    actually we hold the dead nodes lock instead. BOOM.
>
> What happens with the current code is that print_binder_proc() takes the
> proc lock again after the node was removed from proc->nodes, and then it
> exits the loop because rb_next(n) returns NULL when called on a node not
> in any rb-tree.

Oh, there's a v3 of this. Let me resend it there.

Alice
