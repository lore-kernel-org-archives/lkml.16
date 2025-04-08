Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF03231C9F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 19:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744139230; cv=none; b=MhWa44/lsI/LG+uPOvLZRAzRAyD4JFHCzhM6MaNKzt0pYDm01Klpfu5o0YokLdr7IEEArIr8a3xhJ3gmgmk3UexXdnskkYzeG3SSAHGBwiQ8rmLH4+s0D4nFTGyf4MBVpbM+cT5pjvUntrvbO/Fn3CDoYKQg6T6TKTRHjFy5G/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744139230; c=relaxed/simple;
	bh=pZLJnU5MBzggGR25yfKxPJTnmjKhYM8nlpq0QnfKJxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iq11ndvQbllVuOC3WbLp+xvlpcVOV65VLx94GHmVGot1rAERUYsdunL45GxmnjPfNzufJmkENhp619CeuAePL0Yafys63S0bUs4AfdvlP5AFzXNsgrP8Hy6tU/WrTIYvcn8yMpe5JZ8NWQEenL/K6aQcX7HIUR+XddnU9UO7V4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OCF3bPaL; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OCF3bPaL"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-47664364628so32831cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 12:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744139228; x=1744744028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93nqZU5s/fidU6KQmyWJ+8+WA5HOv5RZeLSBQVSW7pY=;
        b=OCF3bPaL+3FslH9YZ7CeEequAgIIflLAkq3A89gZwajAjvd2UJXzcAzBlCZG6rYPZJ
         upqUh63rnD725UMuiQgSkyiL796Vrx08Rb9XTHvQvim9eVvVZLVbCz9NizR+n1UASfTI
         AKR5OKorFLAQ1oYjw7v5+uwfy98VNf0w34HO65Lq6QE5zrCVEtzaqenfhW4YM2ljQAZP
         8sqzWnSge9pMwaYXEZ4bnB45+OP99+0vBwQfwQObb2yQGyNvb28X0RVMLeYDSscPTPBh
         LAxFvxRXGro+5gLdyTNTr9Mx/ljL/utuzkpBvcLRpFBIOMXBO8etDf7fzdKpqb+1/+3C
         XNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744139228; x=1744744028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93nqZU5s/fidU6KQmyWJ+8+WA5HOv5RZeLSBQVSW7pY=;
        b=PT/hhshYWeJm4Vr+d9//eYdACuZkdyv3LQuqvPmKOV/mPcqi0rTcS+pVoH6FgBxVpC
         K5zx2gpOQJ3lssZriK+XdElEjOIRuF/Mymj6EP7TKCsOl8uwYehomBpZuCWZnZRccs1r
         KbGxGEacn3odmYahsPiI716yTmAheUR9KvuvKFQoElQQr4prIilJbHPD4PINOwx0V1rw
         SGcjl/g2V8DywKoZgEwAK1MAHOe+UKlfWWfKiPrXjEOisJfvhYjeR7fPjDTLrS1bxMTD
         +DIG6J3rUmA+KGrgmKQbsO7kXhtiWtQNrLk4lf1WuLhTDsJ8b3/Jvm0C49JTCL5lIKJz
         xaSw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ5I0veXHlFXab/uAM9603CmpwTslPykcg5CqHFWAIGA98pn4xhIKjDMvUnd0r4X7FUBSUAyngVyUvmxE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTcKFdqXqW4o3WAs/OFdnJO2Mn9583HM7kIyfQs5kgqOxPuKRn
	maNFp8+hu7uQm+dw9oHts9BO+/nodEUUfcNB13nhnIE0rN0JDOsOE69R9QZnLG+rA542rKNXAms
	3zjRCpdAGaenVjKDyu6cfqOtnY+WiU5mpvK9S
X-Gm-Gg: ASbGncv1ynxFMcm3A2IfIvCSJH98Re7MVJxFdrHxZ9uqQdh/HskjbYSMebbJ4JwSrNq
	t3GzgLSWd5aMxcsR3ddGwUEn7Yqo/iHRdvwf7gvGD420WJiWvAeckvy7WKumS8nsP8kRnBQ/NUq
	+ElcErDK7O6wX/qt1c9Jlc0J2X3is30S/fJeRbnw==
X-Google-Smtp-Source: AGHT+IHU3BjoLfm0LIuRrotuBrlGix9R6faP3V4CJEcVcdR9oJuJJuB96HzJW4gxD+c3m7UP0Jupbiy6dgNF7zINniE=
X-Received: by 2002:a05:622a:b:b0:477:1dd7:af94 with SMTP id
 d75a77b69052e-4795f06e7f4mr3538441cf.2.1744139227413; Tue, 08 Apr 2025
 12:07:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-fix_net-v1-1-375271a79c11@quicinc.com>
In-Reply-To: <20250408-fix_net-v1-1-375271a79c11@quicinc.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 8 Apr 2025 21:06:55 +0200
X-Gm-Features: ATxdqUGZJ248TBvxAhOrlI6sj4tN-bv4Xzr4A8hA3BIPlgVZCyrznqJKUvvciOY
Message-ID: <CANn89iKP-5hy-oMuYwEvwFOzzAkfF5=8v7patSE5z7PZQS0V2Q@mail.gmail.com>
Subject: Re: [PATCH net-next] sock: Correct error checking condition for assign|release_proto_idx()
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Pavel Emelyanov <xemul@openvz.org>, 
	Eric Dumazet <dada1@cosmosbay.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Zijun Hu <quic_zijuhu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 3:43=E2=80=AFPM Zijun Hu <zijun_hu@icloud.com> wrote=
:
>
> From: Zijun Hu <quic_zijuhu@quicinc.com>
>
> assign|release_proto_idx() wrongly check find_first_zero_bit() failure
> by condition '(prot->inuse_idx =3D=3D PROTO_INUSE_NR - 1)' obviously.
>
> Fix by correcting the condition to '(prot->inuse_idx =3D=3D PROTO_INUSE_N=
R)'
> Also check @->inuse_idx before accessing @->val[] to avoid OOB.
>
> Fixes: 13ff3d6fa4e6 ("[SOCK]: Enumerate struct proto-s to facilitate perc=
pu inuse accounting (v2).")
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---
>  include/net/sock.h | 5 ++++-
>  net/core/sock.c    | 7 +++++--
>  2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/include/net/sock.h b/include/net/sock.h
> index 8daf1b3b12c607d81920682139b53fee935c9bb5..9ece93a3dd044997276b0fa37=
dddc7b5bbdacc43 100644
> --- a/include/net/sock.h
> +++ b/include/net/sock.h
> @@ -1421,7 +1421,10 @@ struct prot_inuse {
>  static inline void sock_prot_inuse_add(const struct net *net,
>                                        const struct proto *prot, int val)
>  {
> -       this_cpu_add(net->core.prot_inuse->val[prot->inuse_idx], val);
> +       unsigned int idx =3D prot->inuse_idx;
> +
> +       if (likely(idx < PROTO_INUSE_NR))
> +               this_cpu_add(net->core.prot_inuse->val[idx], val);
>  }

I do not think we are going to add such a test in the fast path, for a
bug that can not happen.

Please give us a reproducer ?
