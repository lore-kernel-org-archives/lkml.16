Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2B826FA4B
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 19:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746474946; cv=none; b=SKZc0GBQCZ+qxwzHrjYQqClQzFc+78uoj7GiqBUh/69hSHzYva3o6KjWmzK32y/fx/pMIdi24ikdfgWwZXMXY+74l1P/3i5ZstWX8sv7eeBMLaKl7vX/uxpNXneq0ynZ5jxtfE81bKXmVRy9f2sY+bminRxRV62jQ1+f8LBYUic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746474946; c=relaxed/simple;
	bh=RGhrUhERQwmWG22CI39MafSDQwomsfrX4WJjmiI8SVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cUxvAdvj7+KcgD0f+filuGD/sYgeZHjQVPDj67tHQWjQddMQkpf1hgXpBGOyF64ukYbNxollnp7GDW0QOJr5nd9kqf2ufaIdPaHJxOFnTtvZwpRGl1nJzOOm+e4SK2Aei/EXq6vHkH9CIUa3rwjEeJhKCxtvhTivGeIEWksxnvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3ifxYQIy; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3ifxYQIy"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5f88f236167so2710a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 12:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746474943; x=1747079743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGhrUhERQwmWG22CI39MafSDQwomsfrX4WJjmiI8SVI=;
        b=3ifxYQIyOhDwOSeIN3KE0ntPimLMCGCptHgd478SoIf6SUwuTtn1VsNPZVqj7eshCw
         l/QvKi8nyrh+lhesLmCqRRgse24R4Z9C0K3n+6yRZoHNVsbIpcDD1K1KSTPqrmMGIrwY
         L/4H/s9xA3IoMSWraR8QUbLMAetx416mokJo3GRVwB9wV/Ae32+HeTAMd5whJwzLB7zX
         /lHCs6p4QrwdNfmZLL+G3L51MDsSq4RXITGmeCB5XQcdh2rg6VZ5bP3+ZKaBHsKcTtdT
         Q//PSgW2077U0BC5EVxxdf1EQ9hS2cci6qn55hvmMSCirOkIrA/l3BnJigKcvPG93YXr
         FJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746474943; x=1747079743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGhrUhERQwmWG22CI39MafSDQwomsfrX4WJjmiI8SVI=;
        b=MBKoILFyCLXXSSq5uyTUGq/4QPmYy7fQ98RjQcJ7zYKldFbh1CeFVlIFvVNw1ZhbMx
         BJlY1JnBgoKL3CEWGQAa6q2zxRZxZjvaXvcsTHGCabsZZKmkTjlu9QoL+ME9dzDEIv3V
         Z8jEdcQwXlnZm6/nMsydotOguTDPQn5DYmnME4waBZkq/+bvXjGmJVx3ZQeYgeA6+k4u
         3gBctZNBHAfTYu1WxNqSR2AFyOFMScyV6Toaimu978IJ4MGWzlii1c5Aj2eTPOhPS+8d
         P4beWBP/DfEnhKqxept+44HpcEUqmESGb6TWskLrvQulfdlb2sqxUqEXL/cOEiFwZ5SR
         jAkg==
X-Forwarded-Encrypted: i=1; AJvYcCXg/YMZ8wzMnbwhn3N2Ro34c3tMc0AU/+oT0Aws/pZowDwClOKcFsISTsiBzaOZbUTUaYYOiNkfa+TIg9s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbcIdK8IlrEv8cXcXjCdGB4nUpg8GGvsF64+qTtokZfCsKrz4D
	HSuoiTk3sC8w/alxJHu4gKtc4IxVOQY48bcCJm93CTQf7ZCuB1aQS9ImzKv/KmkZy1YVb+MyjnM
	19hMenLjFl0N6pFWRf/aQ3PjKZbx62eQ2+ZHG
X-Gm-Gg: ASbGnctYL+W4z8TJpaVUf35o1vRuIwDFZRiNFNhGQiXHWYgz1hACr5CMOQ9yiZO18kG
	0Q9E2mmoHXaCvMEEs/OII4YWhSnVqLwvpi/EQfN+OQa6N+aS/9AmKa3ni7a2OW+OX9WzOSBRnDj
	tUpMiCcVgjJBIJIWQRrB/qDJ6nUO4M0GirVabbByl1RUuwe/oO/JurEM7ACIzy
X-Google-Smtp-Source: AGHT+IE8pVv8vSvzVcyTPhfWeaAafX01XSZmjT3LXYmjAanZIAEnxeE4xHmNJ3sAg2LYV5sidxqS/G91rARIhm9ORDo=
X-Received: by 2002:a05:6402:1a29:b0:5e5:b44c:ec8f with SMTP id
 4fb4d7f45d1cf-5fb72db5ff0mr4797a12.3.1746474942569; Mon, 05 May 2025 12:55:42
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505193828.21759-1-kuniyu@amazon.com> <20250505194451.22723-1-kuniyu@amazon.com>
In-Reply-To: <20250505194451.22723-1-kuniyu@amazon.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 5 May 2025 21:55:06 +0200
X-Gm-Features: ATxdqUHmxqxtf3xEtL_3ggl9pGJ2mTIq1tYtwvsmbhM2zMKZsVX7F5lKso7edio
Message-ID: <CAG48ez2YRJxDmAZEOSWVvCyz0fkHN2NaC=_mLzcLibVKVOWqHw@mail.gmail.com>
Subject: Re: [PATCH RFC v3 08/10] net, pidfs, coredump: only allow coredumping
 tasks to connect to coredump socket
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: alexander@mihalicyn.com, bluca@debian.org, brauner@kernel.org, 
	daan.j.demeyer@gmail.com, davem@davemloft.net, david@readahead.eu, 
	edumazet@google.com, horms@kernel.org, jack@suse.cz, kuba@kernel.org, 
	lennart@poettering.net, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, me@yhndnzj.com, netdev@vger.kernel.org, 
	oleg@redhat.com, pabeni@redhat.com, viro@zeniv.linux.org.uk, 
	zbyszek@in.waw.pl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 9:45=E2=80=AFPM Kuniyuki Iwashima <kuniyu@amazon.com=
> wrote:
> and LSM can check if the source socket is a kernel socket too.

("a kernel socket" is not necessarily the same as "a kernel socket
intended for core dumping")
