Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E07D262FDA
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747901639; cv=none; b=AgrFvKIMkUHVVWjPCmNmve55qMjsAunEtfy23/IQ3ZC7FPh0/EYZOHQQ9866MtH7NsKh3Tz7lFG3bwTvC6QJYtd6tQTJ/4f3uqMOAaxZ7quDiJ/j/2AEQDGmr98oY+js2J8WF/iMd5SzDumF6yKd6HIB8eYn7KFkjPbQVQ76XpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747901639; c=relaxed/simple;
	bh=qnh/L98cmCh06yFhdCD+49/1rYyJlK6mPsgNKSKJHOw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=TejHwNLtis57rMaNxYvYXr9Oe38Hgr1Jn+dBzBgBDTbPPPNhYT2WrgwbEt9TXFYKREt3LE+Uu2jhMLvp6HQkSvEto74iHELHYWrJYVuDYoDLfsSEE77qeROy4kD3il1nIjzTft5lSNrK/p/yHXdFTVM/rQ/7hceRWMKH3gBq4Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=fail (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=elV1jIXh reason="key not found in DNS"; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="elV1jIXh"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-86135af1045so914101939f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 01:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1747901637; x=1748506437; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8fveunfssaG8fltpv/kYgW4QFBaP5Z1Q9jmR2Ucz+w=;
        b=elV1jIXh7uh8PDXK/kEkBs9YAdr7hqn+s9WqQ+zMcb4u1ylH4CWYkotahBvp31AxAO
         c7gHttphIbuexTKMAsruMs5ka6hrQv/zQVd6ZO75C6mKU8E0jR/mxGJB2cDLA/TGyT/g
         /nTbqkxb5l4BGcChI7hHbEp9FUH/pAlsUEzjAcuyYPqEjaX2QIX0Kler1KnymTObEArr
         9cJiqIeDDg/OqEt9CnkmDvxcI3DzUctO2di3I6ITpe4pJBKRbuxc9sEzBcGfgBu1nSIz
         /vWqZwTs+TFlejTtlJEkuCPt46dS8Mf4I4u1pA1cx/z3HsxZzENMLyU10dxmcK59S2fe
         xQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747901637; x=1748506437;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c8fveunfssaG8fltpv/kYgW4QFBaP5Z1Q9jmR2Ucz+w=;
        b=fpxhVfw/weOtyDKs2HXIrHAlWTlrcO3YLbqMTb1tNmtqImJa52fP7tSF1lX9f5a4PO
         7hXnkczK/Kv/7HIiQat1uxh+Cf81ZFS/Gt17k4TF9SepZIfRbSYxwwQNf/F76B6KbDzN
         PnNp/0B1cIoC0O2jfrM6+MppPX1rjcjjj9Dw9Gy4C6MmqUeHgOJlEvTKBl6vgeiEYcRQ
         WLxUH2a3Uax2PK4BNxjE0TE+rdrR97iqkumdF1ZMvQKWp726ySyXHM7xiUoYRDblFueW
         QYKSSyqaWvQ/qzJkc3vz6xHrBKqUrXVFP8YQ2KihGfyCz9vcbI9aJ3ZE+0U2e7oB3veF
         I0HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwzSH8tMIhFt+UTlT61zHyK+40wWi2YytoS0U4G9/hijOzz51kw2SojSAkYB6YyH8PJe2rlTWbdn5+HB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YySAxQvD9vnJRifIPGPSIz6tN6yk/7ZxzerLbJZeNaA/TVZCpuq
	o9N48HyKxvKeUOYBaKd1nzmL/N7o/ogGBNfCs1cApV8ttmW6CpnknNDuOBfSTB+so40=
X-Gm-Gg: ASbGnctTZiHL5LtFgCBfmOaionhpR0/HnovdZV12HKn+r+3wgZnTub/LxyHWXN3iRxk
	KyYNhhG4QdmaNwgRb7x1U0KAp3RJHLv8ELq0qXi47xnmP7RtzHNTjawfCMantSy+u18ndP+up64
	/ktocXKPY9i63pCxUwjuQBa4McZRwwoJIUg2IqqBdmV6FGsAPtVX6YIjNYy6YJ0HFZ5w+LMTefs
	bOolpxhKEko1ZRAPx9eHdmo3/qhmL4qHL1/sQywTFoPy93RVXJAWHRVMXJJb1bUP1pF5uXqGHL2
	cdSKQwIpuhvGK/0Ct0nkj/xGb9JXXJO4gyPedZ2joDH6NjyC
X-Google-Smtp-Source: AGHT+IGjlgR+V6jDNuVgn2VgB5uR3ziTvMUlyMDL1h3fTHRWO4bCzJmoSqf3GPL+uFJjXhgZZKrRUw==
X-Received: by 2002:a05:6602:4808:b0:867:6680:8191 with SMTP id ca18e2360f4ac-86a2306ee1cmr3484870639f.0.1747901637427;
        Thu, 22 May 2025 01:13:57 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc4ea5d9sm3017587173.141.2025.05.22.01.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 01:13:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 02:13:55 -0600
Message-Id: <DA2JF2BN2EX1.221D1WL4QHH8B@brighamcampbell.com>
Subject: Re: [PATCH 1/1] Fixing a minor typo in YAML document
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Jihed Chaibi"
 <jihed.chaibi.dev@gmail.com>
Cc: <heiko@sntech.de>, <briannorris@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-kernel-mentees@lists.linux.dev>, <skhan@linuxfoundation.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250517020552.737932-1-jihed.chaibi.dev@gmail.com>
 <62bd6757-c4d0-42c1-a76d-abea18a8a55e@kernel.org>
 <CANBuOYpRQNx+n6BjpAF0LufpUqRA3wU-GzSNygeWurohXYNF6A@mail.gmail.com>
 <5f7f8cbc-6501-459f-906a-250be5443d0e@kernel.org>
In-Reply-To: <5f7f8cbc-6501-459f-906a-250be5443d0e@kernel.org>

On Sun May 18, 2025 at 4:34 AM MDT, Krzysztof Kozlowski wrote:
>                        If you do not Cc maintainers, how is it supposed
> to be picked up by these maintainers?

While I understand that Jihed made an egregious error in not Cc'ing
everyone listed by get_maintainers.pl, I also appreciate the irony in
the subsystem maintainer complaining that this change isn't going to be
picked up by the subsystem maintainer.

How _did_ you catch this patch without being Cc'ed? Care to explain to
the uninitiated?

Thanks,
Brigham
