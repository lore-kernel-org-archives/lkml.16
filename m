Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111DD1BEF76
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739176221; cv=none; b=mS7d8nt7xvSj3hwsBLkjd2gJL6DpWWgsqnFSIj3H18BYBnfDp+g7P0y+HNyz3w0sSX3Bqp+V3XdlOtYc++gQyb183OoTcElR7k+HG+CzDEOwHRAqjXSo6/KUU4UEBJpzLx1pzD/F58jST1lCf/EaN1WcLi1fybNSbGIDyzFL0QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739176221; c=relaxed/simple;
	bh=PPmmV6mrjHp+lAp5KhBgmJc4ilN/3JaEJWAOyFrLPSw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GKcM3tfqCvCDnAvKD9kCcmGCHMkWoCaUBB5cbw1UG7KYH0S+WOgmFcPMHyjMoyD4jBdPLGcGbUl0/IuI6+AEvSUMRy2dY11W1zGE4CJiOb2K/z/c21Fc+0Xv778HMlhU/9yzq7u3P+5JVM4SXg8Q6BFgQtQw+J3q//Q4S6Tw3yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wnliu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HBdFdtZ6; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wnliu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HBdFdtZ6"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fa32e4044bso5124725a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 00:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739176219; x=1739781019; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPmmV6mrjHp+lAp5KhBgmJc4ilN/3JaEJWAOyFrLPSw=;
        b=HBdFdtZ6JSHjJJd3i3oiGM5RcWOB/3gKKGkpOXMp9hhM4TSpwwSuXJ0x16fU0X7Sw1
         k3IFOEiaOnlbaWcIh0qzts39EMozAwzlsCFs9ci9VVFIerlbmki9s5rU2DALc75ooGrm
         ORZQqARub0fhNvZpO8sAC1IXXzoDkxW9Lh9dQ0PGSc7BPGHukWSoHmLM9Qm2dy+RTzQ+
         mh7R9RCjeOSmwqNaNE0x6RAPnn0XS1Gp3S/daMZdGYbLh1QMzAnsr5HJktAVHM174LrL
         h4hPXDlxwfC4svcCWJ54qZQBh9WZf3MufmeFmTGfTnMOydT1FvfTBb4wwJ5/1MLQhv9u
         mM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739176219; x=1739781019;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PPmmV6mrjHp+lAp5KhBgmJc4ilN/3JaEJWAOyFrLPSw=;
        b=cIAZyOUgz2J8E1NXaR4OspqdvZGBctZE6fbWfs0x06iXwC3B+uX4ErPuimTW+ibego
         Edmn+KUoTjIfTfzFX+2U1G531g3S7BUbi5f5GcJBmMQVY8xii9iR6/RWd360RvIRytvl
         kWzIPogQ/XT9CYoC+kiqWQtqSbbtCPxwx0v855ciMja8FYX7JErql13Tve08eqDrHEnG
         G1+uAFzeuJX1RfZOveHMLHHKQt1FsN9PiaigciQ2tynoJtYJSaWzhU3qI9ybIv2Ww3LN
         pohSjGorX0ryP2s7yDz9dFxBnMPkZWRY6qW3ofVoyJkinENxki6xgXcY8R9SHNaGXCkq
         4saQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGyN7/+HON/QMtP4FhSFckDLrGAl5WNnZGzRxrvjwQrfTnwvuINAUW3hf87npuyNt2gVY0jRvdxkHMiOg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj3hIAQEI/cMi/g1vf63ZYCd3Y0c9CUjrV5IVFfREJfK0ejPft
	yVT6SiIuwAKqDafrD3jMR6YKiUrhtY9Nlgoj33ovZGdaAoixuiq4kZtW7fnO/8D1yUe/JSoWmA=
	=
X-Google-Smtp-Source: AGHT+IEXo1lV682Dvui+xqTqQ9vsTUnOVO23WNyemCNciJ06wQPtgH2MGkCCmvZ/liuvldm8njt7IMjgAA==
X-Received: from pfbbi7.prod.google.com ([2002:a05:6a00:3107:b0:730:9499:1f46])
 (user=wnliu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:850:b0:730:949d:2d3f
 with SMTP id d2e1a72fcca58-730949d3086mr2135669b3a.7.1739176219304; Mon, 10
 Feb 2025 00:30:19 -0800 (PST)
Date: Mon, 10 Feb 2025 08:30:15 +0000
In-Reply-To: <mb61pikpm3q76.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <mb61pikpm3q76.fsf@kernel.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250210083017.280937-1-wnliu@google.com>
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
From: Weinan Liu <wnliu@google.com>
To: puranjay@kernel.org
Cc: indu.bhagat@oracle.com, irogers@google.com, joe.lawrence@redhat.com, 
	jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org, 
	live-patching@vger.kernel.org, mark.rutland@arm.com, peterz@infradead.org, 
	roman.gushchin@linux.dev, rostedt@goodmis.org, will@kernel.org, 
	wnliu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 4:16=E2=80=AFAM Puranjay Mohan <puranjay@kernel.org>=
 wrote:
>
> Yes, I think we should, but others people could add more to this.
>=20
> I have been testing this series with Kpatch and created a PR that works
> with this unwinder: https://github.com/dynup/kpatch/pull/1439
>=20
> For the modules, I think we need per module sframe tables that are
> initialised when the module is loaded. And the unwinder should use the
> module specific table if the IP is in a module's code.
>=20
> Have you already started working on it? if not I would like to help and
> work on that.
>=20
> Thanks,
> Puranjay

Thanks for updating the arm64 kpatch PR so quickly.
So we can use kpatch to test this proposal.

I already have a WIP patch to add sframe support to the kernel module.
However, it is not yet working. I had trouble unwinding frames for the=20
kernel module using the current algorithm.

Indu has likely identified the issue and will be addressing it from the
toolchain side.

https://sourceware.org/bugzilla/show_bug.cgi?id=3D32666
