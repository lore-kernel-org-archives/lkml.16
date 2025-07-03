Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63C517548
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 12:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751546011; cv=none; b=EuVgi5VZ54vP+j4cjcrwRbZ8tm35j9M1VuZvproAexEKhGpAU2ivUIe+b6UyVoPC902GFiM38n9ugpgjuvImugJZmuT9Ot4s/NDLzd1K2LNXyW8wVQuLLpyMv4VMmiDEPJV0KUQtknJm/1F87Zat5TCo/yecPlpnpbBRqB93xTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751546011; c=relaxed/simple;
	bh=Ptsjzf8+zecQzbj9dMtjUikfyamkQ+9Ox2BXpSwfkxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uuq3RY9u04U6TY7v2yNy7CCQPU5ElFfjO/sD95tV0J6yNMAbnkxSjcojDKOjThXWhNdsf73xkgD5Mwb1bXd99h9CXS46Dy7bDEV+oGND49ZR42BUIQhQxKxWp3qFHGP4OdxDVRfT+93PlCWKlJYXuJModTQlijwNVNCfUnKGJAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZddOiBiZ; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZddOiBiZ"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a585dc5f4aso91740731cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 05:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751546008; x=1752150808; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ptsjzf8+zecQzbj9dMtjUikfyamkQ+9Ox2BXpSwfkxI=;
        b=ZddOiBiZLmtx4grLzKnfksSKl/aKFRgU/C4WULR8znD2CEboCyw96JbpljLltTqCzh
         2jipic95mUhjIvoHFIQ+uNqG2LOqPQ7i3ISnO2hv33/aifbsfXUevL7MeM8ofAt6ap2Z
         8P6rUFNzgofOc0PbyeV/rHHIjF83PN+H62uiUCFhMYf0wsby0351UzN21j7cgeXGJ6kZ
         tssgeem65u2jusBL7RWPrS35+ZmAMCKlG+rZTiJuvHENiTjQm5AzjA7rKyi1GxnvImFW
         iLHBiRqXuaj/Vd3qxX4YLOHt1/5Ub7lDm/vd9dtMobgfrANklja7C2nyigIe9yemRwT9
         ddnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751546008; x=1752150808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ptsjzf8+zecQzbj9dMtjUikfyamkQ+9Ox2BXpSwfkxI=;
        b=Y5sa4rUK5/JJzQuj54CCpS21QLbg/T5sxSx/guSnDgSuZV/ZEGfGIwMKdSSU/ADQdu
         ZfXMEYdW906Q8YGNs5LHkLY0tKBrlV2MMgYNkH0Bxu5gzePtF4YfDurocAVVpIR+fyJk
         zYZRrT2TFsj0kdDEC6M/7MqBcur2lBjE3XxXCVURHFkfadRZ14Lp75VUlD0uW1hksZKW
         A19/03cx9ja4SEliaaP1aMH1uaiWbTyhteEe/smKc/HMSDqWA0C/77cCsf26SkFcR8uM
         PF4v/e/JVXoDT8sRw+A8dGvytzyM2Y8+34nHPBGKN59d0c5tNwE70juQz13Y8SQWWwlb
         FpOw==
X-Forwarded-Encrypted: i=1; AJvYcCXFRKMlmR3lGIEdfZbv5rqT7bG/BRGa98miLL2kS7E5uuXREq+WvK7Jv27ftfdH6OnbcwQz8d6oya00YSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJdzBgTRP5/PmW9i8Bw4MDDd62q0rzdjSRrbfAOlIriQ1/sz+9
	DOgE47Vmgb63DGQgkZ0qllSchtBPAqp+d/TUKw+XgePTrhsQ3/HHlD+YeNS0j+jZm7BIOTCgkNx
	vKp42afDFNiUNbqTfjGP411mjIv6mc7WCKc45ERx+
X-Gm-Gg: ASbGnctPH3ci0otpgFtFFwdZ52Uv5fLDWhEeHp3glT8RhRQuEaPzPWhMuPL0m/yy4vh
	pWZ+XmEkPyw1AUPetrNFgxApTXJfWewuI8G6+uzji8WJmIqYfhLoMjcifB05GtZhlMpwvRHU8MR
	vHtTmYeNmykSU4jRq61t5jOLvdCpn58pOit4U22uZKf3c=
X-Google-Smtp-Source: AGHT+IHxCWPBsSRbtYOVftLPJkM3kyPLupAKcQLcv+QF0+EbxfFG7g/xCWEfeXsj+2gKQRieuEutHEvyqdr+9YatpbI=
X-Received: by 2002:ac8:59c3:0:b0:4a7:9d00:770 with SMTP id
 d75a77b69052e-4a97695c4ccmr122755671cf.18.1751546007977; Thu, 03 Jul 2025
 05:33:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702110039.15038-1-jiayuan.chen@linux.dev>
 <c9c5d36bc516e70171d1bb1974806e16020fbff1@linux.dev> <CANn89iJdGZq0HW3+uGLCMtekC7G5cPnHChCJFCUhvzuzPuhsrA@mail.gmail.com>
 <CANn89iJD6ZYCBBT_qsgm_HJ5Xrups1evzp9ej=UYGP5sv6oG_A@mail.gmail.com>
 <c910cfc4b58e9e2e1ceaca9d4dc7d68b679caa48@linux.dev> <CANn89iL=GR5iHXUQ6Jor_rjkn91vuL5w8DCrxwJRQGSO7zmQ-w@mail.gmail.com>
 <6724e69057445ab66d70f0b28c115e2d8fb5543b@linux.dev>
In-Reply-To: <6724e69057445ab66d70f0b28c115e2d8fb5543b@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 3 Jul 2025 05:33:16 -0700
X-Gm-Features: Ac12FXyLpTLWTKVyDtut9uoSQuD_gpE99ErR38nFK0rRJuJ6pTn1bXL_9TRwT8g
Message-ID: <CANn89iKxTj29DG-44d7SbhEh3_h4PG8009RK9+sAZJx_pg04kw@mail.gmail.com>
Subject: Re: [PATCH net-next v1] tcp: Correct signedness in skb remaining
 space calculation
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, mrpre@163.com, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	David Howells <dhowells@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 5:03=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.dev=
> wrote:

> Hi Eric,
>
> I'm working with a reproducer generated by syzkaller [1], and its core
> logic is roughly as follows:
>
> '''
> setsockopt(fd, TCP_REPAIR, 1)
> connect(fd);
> setsockopt(fd, TCP_REPAIR, -1)
>
> send(fd, small);
> sendmmsg(fd, buffer_2G);
> '''
>
> First, because TCP_REPAIR is enabled, the send() operation leaves the skb
> at the tail of the write_queue. Subsequently, sendmmsg is called to send
> 2GB of data.
>
> Due to TCP_REPAIR, the size_goal is reduced, which can cause the copy
> variable to become negative. However, because of integer promotion bug
> mentioned in the previous email, this negative value is misinterpreted as
> a large positive number. Ultimately, copy becomes a huge value, approachi=
ng
> the int32 limit. This, in turn, causes sk->sk_forward_alloc to overflow,
> which is the exact issue reported by syzkaller.
>
> On a related note, even without using TCP_REPAIR, the tcp_bound_to_half_w=
nd()
> function can also reduce size_goal on its own. Therefore, my understandin=
g is
> that under extreme conditions, we might still encounter an overflow in
> sk->sk_forward_alloc.
>
> So, I think we have good reason to change copy to an int.

Ok, I wish you had stated you were working on a syzbot report from the
very beginning.

Why hiding ?

Please send a V2 of the patch.
