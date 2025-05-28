Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD3B2868A1
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748438587; cv=none; b=lfVrjDRFiWr4gGwEX2sru/QAbVbbxHw1mUcOLfwxxb/nHod1GmcOC7GPwRXuqxjqQyivbeOjgxlW2m7M61N1+aDYS53tlzHerkYiMbifNElA0qIlE3W92LgujnTicfPgMdEHpKQ43tW7UaH+zxh9/yB9PY3gYxqzzACXyC0dvhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748438587; c=relaxed/simple;
	bh=wLAIAFZApvRfJYt9cSIjJYMbXnMPn+iDGWN+sR5UeVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=au3PDJdkTROx+eBoxBsS8McXm8H2+Ig7wbzedUC1ephO24jPWjkOj+KqSYIDL8E372dRtnOSKohFxtWHIc6jd1tXNi3xxpEejDa6JlgFv3cbSdtzG8+QDSone1ioqhDhMd0Qq7gHckN6DG7ZAQdsXJZRTl5AUHMTTfxKliKTMsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bXHor/Y7; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bXHor/Y7"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-476b89782c3so42609011cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748438584; x=1749043384; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLAIAFZApvRfJYt9cSIjJYMbXnMPn+iDGWN+sR5UeVM=;
        b=bXHor/Y7iQUXdwSub6pJ/SULEIUI9E2G2oEq5gCdmBNzJVk/WLvueLT9dqNF6vGO0u
         jwZy5d+WWZ6RkjW0yV+i5AnCp96ClSK7wnVzflG0GZb0ljTG0NEvFs/sjhiHNbE9zIJP
         wZ5dhtaUWNiuPFYV2QBsHIqJBlZPgMTA3UM6KbHET60PIPtok/itn5OfFFTzXhpgEG7J
         shImmydziY1PQlihUm8Vdf4oDYFmoiky+Mq+bTSljcNVwkc2QZroAxVDoIiZsHQapUST
         cbnP3s8kBFciuwnQk8RBVGB79itJKm9m6SK3EEO1yOXSc1tA4oxha8hTscS4pjW6SoHS
         RTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748438584; x=1749043384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLAIAFZApvRfJYt9cSIjJYMbXnMPn+iDGWN+sR5UeVM=;
        b=rF++YHCKSZPnaN03+I6rZnLAZGiCFAvxfqi+20ymGKAljGb0AhD9Q3SAJ/3LTw0N/m
         bLd97UeRQkPHQmbWuu7WVHy7Tc6QZl9zBcp69vHn2ZXW3359uR9a0vbMO56P4jbADp2e
         Vglc48zxF2r1LzlpXhXx8VkJarkiBf/3sKadglAb6gTUMQlXvCGFiImBfho8+t2KWW1g
         uaeaCaX6OE1ysgp53Z4yJ+1huh8e4HpjTeRBMOJo748prvU8LFqh4X8BUEq4RQ2nUzEf
         k4giYNU2MylojSZyanqgw0bRHZ3tFj3821MJhgtTwRFimRLPXAh4LqE5lSdZoP7yA9cB
         9A+w==
X-Forwarded-Encrypted: i=1; AJvYcCVzsnsKxsd1GWdzr27afjbv3jpOVoSIqj4iiZU8kBSfBZzB0fNsPbUpbLbO6Ey6LzTxhZlE9EllG6jQCvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfIY6rOCaFriec7xGpP5qP7zTcZ8CWLkTcszsI9rJypNV1+ume
	clw8UIjsuWdIXUvtZc8HbqEa5fBS9eIpWexGNLHBm2Ji2OCVIOOYfXkhIhq7egi1psM1mpNH/BM
	ldf9CXOAVBVSVgS80ll9IGNcDfPMXqnkhghlY5GYX
X-Gm-Gg: ASbGncs24Fe/Hfx4fYkBcYhl0pGVlY43/0useov7y0yW1k/amYZ5J2fkJGtHLdu+Fjd
	42AxIlk7TN/xdF414Lh2AFB4KTLujqZkaNpZmPHNsGtRfqazcLYBW6w8ocvqII4VgkJ66fJSzk7
	r1K4VzinhgYYTnZVWmPplrc/0ogCnMlmzYO4kM1s0uEwI=
X-Google-Smtp-Source: AGHT+IGbZYbMUUF0o/p3mJU8DlaGsdqh7xPg6DKlw1BJkyhZ4Y5kJip0JlOAmFjFmFCnoDaO4CJolysrrKy64JLg9BY=
X-Received: by 2002:a05:622a:608d:b0:494:b1f9:d683 with SMTP id
 d75a77b69052e-4a38c7dd4cfmr34934901cf.49.1748438584068; Wed, 28 May 2025
 06:23:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANn89i+C-qk-WhEanMS_tRiYJHHixH33MAO3u-wQVdWGJOjskw@mail.gmail.com>
 <20250526194619126ArX868H3UosA7Jz31tRqF@zte.com.cn>
In-Reply-To: <20250526194619126ArX868H3UosA7Jz31tRqF@zte.com.cn>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 28 May 2025 06:22:53 -0700
X-Gm-Features: AX0GCFuFbinN-PIix2adUwdlDdRnQDxrOpLHN9thHLQVIv65tW3K_tN3mCvIi88
Message-ID: <CANn89iL43q7tCETt3gW9L_HVHdRrovu9mauekA3QrWrpVSm+Ow@mail.gmail.com>
Subject: Re: [PATCH net-next] net: arp: use kfree_skb_reason() in arp_rcv()
To: jiang.kun2@zte.com.cn
Cc: davem@davemloft.net, kuba@kernel.org, dsahern@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, xu.xin16@zte.com.cn, yang.yang29@zte.com.cn, 
	wang.yaxin@zte.com.cn, fan.yu9@zte.com.cn, he.peilin@zte.com.cn, 
	tu.qiang35@zte.com.cn, qiu.yutan@zte.com.cn, zhang.yunkai@zte.com.cn, 
	ye.xingchen@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 4:47=E2=80=AFAM <jiang.kun2@zte.com.cn> wrote:
>
> >Are these errors common enough to get dedicated drop reasons ? Most
> >stacks have implemented ARP more than 20 years ago.
> >
> >I think that for rare events like this, the standard call graph should
> >be plenty enough. (perf record -ag -e skb:kfree_skb)
> >
> >Otherwise we will get 1000 drop reasons, and the profusion of names
> >makes them useless.
>
> Thank you for your feedback.
>
> Maliciously crafted ARP packets often trigger these two scenarios.
> Using perf cannot directly distinguish between the two cases;
> additionally, enabling perf in embedded environments may lead to
> noticeable performance overhead.

ARP packets are local to the domain. They are not a concern, really.

If your local domain has 'malicious hosts', they could actually
trigger more issues by sending
complete packets, to make sure to fill various hash tables.
