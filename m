Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE997194C86
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747406062; cv=none; b=VKPgTCry75zZTyCCfGyyBjlqCqu+sVTxSKlRdafJng4HeIsE7FWb3HdH02QsMT5B0dee1CJ3Z6Yxsnl8e5t+4pB+Zl0eBpCRNzApEfwz5L5+XPVMdCojjjnifFx1cq1XkWtSTqo6Dw/doxI4QGuq2m81d6ypFWT6LuGSCfnD62w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747406062; c=relaxed/simple;
	bh=jzl/I6bmaZHg+UPF2Q4+lk9TcQHEK2RBu6uj6QAfp48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u+Oyf9WoOd34yF+pBtgAPirmXpFC9kPIe6dIgOSeS8CzoX4AWrUK1B2h+cslqii9J64dHB3MhPEAq4Yr+AQ5SFhY6aKUGyeTiwEf31Tw8Ka+C/IOMPKyrixoQSeA6bHZ8i9P26yStTMxpuDugl6YQPzhfaYhuTD15ijFW0ATbcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vGuVxTQI; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vGuVxTQI"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5fce6c7598bso12468a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 07:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747406057; x=1748010857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzl/I6bmaZHg+UPF2Q4+lk9TcQHEK2RBu6uj6QAfp48=;
        b=vGuVxTQIYGn+f+GPputS3WJ9uQtgpFnyZMc9zU0hVE3w1I4meBQumbC+zkmaj5pMWe
         /dZ/2GJ0+PzCZcZR/PQPexTMpxLls4XG1LTX8Mc3C/i8CG32oIFfgPxVGqdcwchU5zB4
         waLL9ogKl6fzdnTwNoLduMHTbuvTcTxKFViMrSAH36JaH9xcg8H+evngATmCjuUndS1Q
         AyBQSmOBIhMjyk8aWV4d+pWVovMq91xkrfFSjlI6R5pYhyDsP6ynrmFd1CfsBwzd71gm
         kNsReH4HvmeReUdPdQCbQt7EY6p3YBi3CeqZKPedRIR4RMFJfu1wO/izNHE/etK1p/JD
         YnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747406057; x=1748010857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzl/I6bmaZHg+UPF2Q4+lk9TcQHEK2RBu6uj6QAfp48=;
        b=NJGINhn4V6PEwOlfZBnfMKcNOLXKTTDOojcug8XBtxmZXwByZ7q93wGJ4CnZ5FbNIZ
         GPSk9flVy43zicce/M7DLbJ0GbnfQcOFTC9LonXRk8uOIuTKEikxDFKiEiyZMaz/1dzu
         Zwm4m9i03y/5GH0Ma5anmTunoBaKQS+bphXbE9/NZHgiWaK2d5azHifw7z+BW1yH/+Fp
         1CDD/U3y6mOx1LBRY7Bj2gO03Q3ZM5FptrPY0yplg1iAaDwaqUNT6F5dq67F7+mYOwY6
         K7Tvd8zz1ljtnIlShLhESIo7JlKKf/B32dQCTu5MtaFsbUAfJUk5irYsUbD3x14T6zvQ
         Hm0g==
X-Forwarded-Encrypted: i=1; AJvYcCUL1D+mms7j1PQWziGkurJL5vtlPyqFfdpxH+bVl3ChRd/7HB6KYmlTyoZZ+4M5lIZHWNh7R53QaFlsgM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsirGLgET12/5oJaE6T7iAdCgrnOUdBZFs7ERhAur7FRyXe99P
	iM1F5p4K1RIi46Y0bClNUqJ1NdapcUrwS3Z0CZ6sUyjQRutMRQvMcpgTStkU8F7P2LEylMiYaq9
	4qcbpuUfq+GNV1i5M6p93aNTJxBRfSQEOQzU1EG/w
X-Gm-Gg: ASbGnct49svUCoDlZGyNBQEJF31lrdJGcgr2GQTRVT9AVr6Z8DxSeSCK+/AKOHSc5uU
	g1bNXcvNsx99RvMMDiyCUKXks78phaujHE8QJPpoo4hmGBt36nEG8pRKzsTB6Uvz0Btt9oiGYXD
	Iu8pBcrObYuba66WEQNnWYvTVOmJYvwZAEwaxhOskcy7tt+MnS5WVgyo99pzJu
X-Google-Smtp-Source: AGHT+IGCSHxzW91C4A5f0hB+8GzPDiVXw/aNuBqA0vePJ7mSh5UedOWWbXq+/BmaUddB31Y12bkHvm3bpH51L/eGgVg=
X-Received: by 2002:a50:8e51:0:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-5ffce29ea75mr210811a12.7.1747406056679; Fri, 16 May 2025
 07:34:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516-work-coredump-socket-v8-0-664f3caf2516@kernel.org> <20250516-work-coredump-socket-v8-4-664f3caf2516@kernel.org>
In-Reply-To: <20250516-work-coredump-socket-v8-4-664f3caf2516@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Fri, 16 May 2025 16:33:40 +0200
X-Gm-Features: AX0GCFtQVpgNrEjVFvdmdJYYDaEF3VTJ2Dm_tJFrdzJ22BVKOsDvuggvKcRma0U
Message-ID: <CAG48ez0e+-SdB6AWXFKBy4i2Dy8ducic4aH5=hKQDqpN_G-sRg@mail.gmail.com>
Subject: Re: [PATCH v8 4/9] coredump: add coredump socket
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, Eric Dumazet <edumazet@google.com>, Oleg Nesterov <oleg@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Daan De Meyer <daan.j.demeyer@gmail.com>, David Rheinsberg <david@readahead.eu>, 
	Jakub Kicinski <kuba@kernel.org>, Jan Kara <jack@suse.cz>, 
	Lennart Poettering <lennart@poettering.net>, Luca Boccassi <luca.boccassi@gmail.com>, 
	Mike Yuan <me@yhndnzj.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	=?UTF-8?Q?Zbigniew_J=C4=99drzejewski=2DSzmek?= <zbyszek@in.waw.pl>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-security-module@vger.kernel.org, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 1:26=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
> Coredumping currently supports two modes:
[..]
> Acked-by: Luca Boccassi <luca.boccassi@gmail.com>
> Reviewed-by: Kuniyuki Iwashima <kuniyu@amazon.com>
> Reviewed-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
> Signed-off-by: Christian Brauner <brauner@kernel.org>

Reviewed-by: Jann Horn <jannh@google.com>
