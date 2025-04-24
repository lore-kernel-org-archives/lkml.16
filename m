Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8721D63C3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745520571; cv=none; b=AaGZ1RgfNIoyTJJ4MI+cRUZSbw+5Fk7dE7OuJ/z0QCtLAMhAFFrEL15n8d7P1h/C8EyoKUqNc96ocsoi148CxCANgeya/cdxWgZQ5hmSGr6XsU1whs5RHpy0TWhKPkXGP8yZij1FNoZmm0jWPHIFt7Z4uMA6MReuj39gYyXmmNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745520571; c=relaxed/simple;
	bh=YJThV8OU+yLTh48RfiUdm+OTToDHsoL5U/oCrdFEqDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hBOaEcWCAhZd+9osiz235Da4BwYzd3FAeLCthz1HfOqzpcVY+HJbGobo57hKxE+nCXhwru7MmP1h2pD7rSN4kiHft5CICfSaPnCOFYic5MI7QmV8BBdE8GmU3hHE8MPIkueAqaVWddXpXB+9vRFCRQIMBcqcVKWD9vhu4J4ZlCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ylzR3I28; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ylzR3I28"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2240aad70f2so22995ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745520569; x=1746125369; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJThV8OU+yLTh48RfiUdm+OTToDHsoL5U/oCrdFEqDQ=;
        b=ylzR3I28/yHFuETRVx8TQjGviT85wGYNO9xhZfMuqph6DIlhaSNwaWlvkbtPK+qs6B
         ElMVBnjACjOFiHTrBVLwYd0Ca2Bvc55SIR11MRMKQdqC8pWDQ02LcBDNfeiyTRnZ5NNU
         VMrctS6S7a6mrVAt0zxIvDmckXP/ME542w8bOGeXP/yi/f+pdH6jDv3F/FZqfds1HJIy
         CmMS680r1gfHpGVYwT3Dpz2TINkurECqb7m/VPrDGvlHQ8N/F80q96LKwbu+ATbjBkLf
         pAIcJXHi1I9IhYCmVJiTMIOvpxgVkg4KgEzzvZCM1nspYuccVgdk/hS2G9SO+thvSb9j
         Wi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745520569; x=1746125369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJThV8OU+yLTh48RfiUdm+OTToDHsoL5U/oCrdFEqDQ=;
        b=RSFNH9LeD6wQi27CPayviwp21/lszncHl/00Aa4gWuL+q3zNQ8P0mrzln/yFffB/ED
         DW43UT2PQh+F/5BmgKI826L0bkg5jBOZrP9oD4w4rwjbS/EukttyA9FSWpyolz6cv4nq
         4ZigG0y+9H14IJf3+wd+Vx+EUp0Q1DRDmLgsZS+4D8A/nrWnbpEN4MnRKFYtIaTQ0RJS
         LF4wOyhJGByx3kw93UhRieYQMwYviWl/1mxeVetJAjrLG5qljPs2+tYetmCdL6ecKq9X
         t2Rp78gMdy/BrWli/6nNx46Jvmi051S5z/kftJLcKfXsyhhVJrwnBeTyrCWNzlPElG3/
         2cmA==
X-Forwarded-Encrypted: i=1; AJvYcCVeJjG056KFl0tTjF2TnQO4xvVBH/JOzKUqFmKqjKHcws98pj2Vuti8+h2eL6FaDQ3ma/B6AADXS9jRwY4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDBp2RB/e7qHiC5QxgClRCsaSUUdKul47ou9gbERMnK3DXxeoD
	KC8cw6oKsCiUY2WumgwMfQo6QVRRIeSNfkftihGMC0OMSakJsjQ9L4cYCvPiEDLECatkOnPQj8z
	uikoHdzveAtTyT5iNCBiPF16EW0x0dAY/BAAP
X-Gm-Gg: ASbGncsJdAu5ssnfnNXqlkC5O/1RqqwjzLvD2HqTZFcJqiK9Bm5gyKZI0l3uJu3SkPo
	Cu5qZtC8quenqANNwtkcelLcoMYnOBLvf2oT2Hdr3ka79Y5HwxGMmacgBERVuEZYa34N5IrAaG1
	i+cd0ZM1zRTTrIJBE4EXoeSF7MoVkGb8p6MPI3pGuLcama88O8yVya
X-Google-Smtp-Source: AGHT+IG7TvFiypkSdm6cFL8QXv7Geze56CiuyUqiMCDjIy5B3tjxrLsMvkElYIkhtHnXIN1qIRY0zGBcPAIono1A5h0=
X-Received: by 2002:a17:903:2053:b0:220:ce33:6385 with SMTP id
 d9443c01a7336-22dbdb49fd4mr181535ad.9.1745520568724; Thu, 24 Apr 2025
 11:49:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424040301.2480876-1-almasrymina@google.com>
In-Reply-To: <20250424040301.2480876-1-almasrymina@google.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 24 Apr 2025 11:49:16 -0700
X-Gm-Features: ATxdqUGSuXy2A5TP0CkyPakNQ5S2ontOlQJJboyrRu9J3Ao5kJdPZ2OrP3y4P5Q
Message-ID: <CAHS8izOT38_nGbPnvxaqxV-y-dUcUkqEEjfSAutd0oqsYrB4RQ@mail.gmail.com>
Subject: Re: [PATCH net-next v11 0/8] Device memory TCP TX
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, io-uring@vger.kernel.org, 
	virtualization@lists.linux.dev, kvm@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jeroen de Borst <jeroendb@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
	Willem de Bruijn <willemb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Ahern <dsahern@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	sdf@fomichev.me, dw@davidwei.uk, Jamal Hadi Salim <jhs@mojatatu.com>, 
	Victor Nogueira <victor@mojatatu.com>, Pedro Tammela <pctammela@mojatatu.com>, 
	Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 9:03=E2=80=AFPM Mina Almasry <almasrymina@google.co=
m> wrote:
>
> v11: https://lore.kernel.org/netdev/20250423031117.907681-1-almasrymina@g=
oogle.com/
>
> Addressed a couple of nits and collected Acked-by from Harshitha
> (thanks!)
>

Hello,

I made a slight mistake sending this iteration and accidentally
dropped patch 9, which contains the selftest. There is nothing wrong
with the selftest in this iteration, I just accidentally cropped the
series 1 patch too early.

I'll repost after the cooldown, and if this happens to get merged I'll
just send the selftest as a follow up patch, it's an independent
change anyway.

--=20
Thanks,
Mina
