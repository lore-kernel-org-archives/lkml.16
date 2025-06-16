Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C714226463A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750092646; cv=none; b=ihVMVaLhvYmiQ+hqxlu5JEaC5akTflBqUJo3vhBi6Y/bgMk/H3kSLamVqm0WcuSJIS+X2gOJT6aRfB/pEZPKltpmdJVQi6c8ooEkbnkL7Cjm9nRHuv04UQxTNG4C/fWMLOXkz0VK82s7oIcKNF1qXL5Tpq5f7cQYqu/QYRtlZHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750092646; c=relaxed/simple;
	bh=i7VPpTuoi35inIgu0sFVPjS7BoZ4bprIIRn2d9yt3Q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YS2y/obh27a1tAzOvKcBNFavuwl6tIAkujI+smvtMVzdUFGouHwFwherth7Xrx/XJarSIZgN3pydggEguKfxjCQAdzWEQ4WfSrYFQpDTlhbLAFmgzCbwOd78j2SdSYAQVGSvKlpvseQfhM2yznuXCBn+pNG6En9iAedHVF+byxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=09/72+bT; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="09/72+bT"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-235ca5eba8cso5785ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750092644; x=1750697444; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7VPpTuoi35inIgu0sFVPjS7BoZ4bprIIRn2d9yt3Q4=;
        b=09/72+bTPK2IMIsioHzCkRtgfI0FIcxyCH1bxEcu83Q5tQKWwrecNOPPKDzwoIXUYL
         LxPPh9PMk5+T4qsUEuSZJFYEpfvdCcIOPt+sSwoYTqEHTgCovLKw46lC6YiQtS+WNI00
         M0pgSLKqDX2cUpGNJQA2ToqCFEGe9EpBJL48iSSD3XF9GJxwrs+YpUADC+tzSN90TBSE
         Iizbv0CqGYMqyoViYuQQKvm2acNkQ5FHUPE1lBQdUhmobskre24VDm6N1nt0NOamygTq
         dTPppw1ti/Ls2xt+kTaHHB2XGZUVkXXvp05kmHk9+hm3/T3ptCg4AB4N8V9JmMHpLxE3
         NZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750092644; x=1750697444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7VPpTuoi35inIgu0sFVPjS7BoZ4bprIIRn2d9yt3Q4=;
        b=OmXlY10k6XIp6HZQ4Xt6NdkBKTu+XQXB8/ytbpt04dFbg/xwtZkE4yNh0hc6DekDsd
         UZG3g0jQxBAbi8mia1iYixR2g5JA3KOifBsb1vy5SabJb5HZdUxmloUOBnunk70CAiLv
         zR2BgX8/HRkCopRYvOLrT45qgjUjF/Wi6h3jZ4F7e54OihzPvMyfDtyPLdtfwrqg3YFH
         rvZF7mlRQ97lICNgHFUgR6QyMe9D1kPrvaWhX+GFqFejpxaAMXt9rUDtt0UA2GEd4sLy
         oO5KEqMZPvSpVjaODV+xYgkm72w1k1+9XleJi6qk/EmVRZhMPR3ti+RyU5o7HJBsMMx0
         cqLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5Ej1jCU4kzwAroRJe5vCpLAO/aiYunVMu+IDFgcnuvwNqVFyIQVPu50QIkTsAA2uhn6WousvraC4ke3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOzGHcsg1oSzhqWw41Zm6i5Fl2tKfjqZkDj04J2BYJZUipZJIL
	jfEnyEVhMepiuW9Cp6Vm31UR+ZhY3S1sffABcHpg+CuHIo7PBZxmMY756INozQIdpAovzODyiHP
	FHzs0qkJ3jnBeOwsGqEKyXz2UyyjlpKQ74ai8vaG1O7y+J0/IeNTFGz3KMc8=
X-Gm-Gg: ASbGncvOOv4yVZU/amdXZ6lxjXClZIQx8I+wkp5m4na+4gONKhZl5ofihJfzrnQEZx0
	0+mfvhnFyyOjiUsz2f4SAY4NGZKOUGBbMhsVdv89utUp2tiMGzJZUU9Nfk5WaGD07QUi6w7r959
	at0GXzVk710tKlq/H5EDsioOcNE5xrheinXdu4dXts6eiG
X-Google-Smtp-Source: AGHT+IEtmysCAJRd2Y9culPw1HiQoqC3NL7/XlkliBg+tjU0JjnXJI9OhunLKvbKSDCPBjM/5UoyKyxVUINNmNXhTp4=
X-Received: by 2002:a17:902:d48f:b0:223:2630:6b86 with SMTP id
 d9443c01a7336-2366eef035dmr4334895ad.7.1750092643541; Mon, 16 Jun 2025
 09:50:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250615200733.520113-1-almasrymina@google.com> <aFAsRzbS1vTyB_uO@mini-arch>
In-Reply-To: <aFAsRzbS1vTyB_uO@mini-arch>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 16 Jun 2025 09:50:30 -0700
X-Gm-Features: AX0GCFtWTNjY1-x8SLZxP4yAbb2nIqk27bHyOOiZQoVuQA14qOEbD5vctBOxGo8
Message-ID: <CAHS8izMgmSQPPqu4xo1To=4vFvJi+cxP72KewhMJ+BqDbka0hQ@mail.gmail.com>
Subject: Re: [PATCH net v1] net: netmem: fix skb_ensure_writable with
 unreadable skbs
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	willemb@google.com, sdf@fomichev.me, asml.silence@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 7:38=E2=80=AFAM Stanislav Fomichev <stfomichev@gmai=
l.com> wrote:
>
> On 06/15, Mina Almasry wrote:
> > skb_ensure_writable should succeed when it's trying to write to the
> > header of the unreadable skbs, so it doesn't need an unconditional
> > skb_frags_readable check. The preceding pskb_may_pull() call will
> > succeed if write_len is within the head and fail if we're trying to
> > write to the unreadable payload, so we don't need an additional check.
> >
> > Removing this check restores DSCP functionality with unreadable skbs as
> > it's called from dscp_tg.
>
> Can you share more info on which use-case (or which call sites) you're
> trying to fix?

Hi Stan,

It's the use case of setting a DSCP header, and the call site is
dscp_tg() -> skb_ensure_writable.

Repro steps should roughly be:

# Set DSCP header
sudo iptables -tmangle -A POSTROUTING -p tcp -m comment --comment
"foo" -j DSCP --set-dscp 0x08

# then run some unreadable netmem workload.

Before this change you should see 0 throughput, after this change the
unreadable netmem workload should work as expected.

--=20
Thanks,
Mina
