Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214A01DE8BF
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748402631; cv=none; b=bzm7qye/uaqxkilaQU1j2Pq4Jju1W+nuV5jrt4x6wf266p7ZjM40v3m9IwwQHHZdQQwOzozzTHcxzG08jcszz9m6aL2UMlVLTdY3JCLGMdBRTzAf6ABUFxXwVMc9af9O82DvazGj8DUZ79YnKCFfIAHAw+Z6A1dVzugWNkc7VsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748402631; c=relaxed/simple;
	bh=vqO+Pm/HwIo5j2bH5VUANxqKXpi6ZB2hEzbeH28UmWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l07FwUOANzEr0oWpPFcR+wJqEwOFHGtIZJ9r/XSa6P7l0c6NVc9IPnAWsxSiZQHc80O1Xt1Hka7Y4LkiuDMW+7IC4sPUuREJVA40yrnbkJk9QPfBH/JbHV+jN9l/brxGy3WhtWNHD6PI+21Y1md0beRpHyDad8qCiTA2qkEqjlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p0vwD/5X; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p0vwD/5X"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2348ac8e0b4so71515ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748402629; x=1749007429; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqO+Pm/HwIo5j2bH5VUANxqKXpi6ZB2hEzbeH28UmWo=;
        b=p0vwD/5XFh5llZYeWqF0PTmm2GwywM3CMo5XuibxGx4z5aBU+feF/KYJw7NsnDeLKK
         Q8ySWDV47zStZCcEkuEjvESRXvcFONuczH+Q5Hh1E8UB4mmMUR7Pbi+pRz1/3lLIg0+A
         mrls/9KvgpIOVPva4ETMsqimq0vZCy332ZaY5METQoTcARwUV90jGo9o8h6jxtBk4rLO
         9bpRLtFTPoeFFbBPc27xnmUpcJoiqKJXU6vJwcjxcsLQChvcKJzCzVBN/smFSZYqdO/Z
         NEUQChhzzsoPCxSSHexqktR1BvduQAIcTgGSIXCHGOU1qGxdJkC9hDQrOAqo+/qz13rj
         7ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748402629; x=1749007429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqO+Pm/HwIo5j2bH5VUANxqKXpi6ZB2hEzbeH28UmWo=;
        b=dEzObRDfTRsrDVkGgza5+j7pJ355w7CBwoBBGmyuvMYR3GQaaVYGjvXEkLNiUN9S1S
         iGci2vMwbWHSATJZtWfRkjkkOQVm3dRgeEY7bsPRbTppywP0/Typ6wT+VV5jY2pi7Osg
         jcTVDzpM7OBlxapFjpoR35W9J1MxbA73IbM+dmIWajzygPufwkywXDYo6z6GpMO+8k/1
         VcLok9bdPivW+LNMD7HCJOjzRjLgg73u4tKrfCeNi8Revmqv1ZpeSI1w9ybusfugDOgM
         O6Her650dWxxstTsU0egTJiB98BmPmyZSRcHHcS1krY45EKw07gYOwkHw8QQCRRB2qBl
         wiXg==
X-Forwarded-Encrypted: i=1; AJvYcCUp5CyhBvla3QNvsIkiooSbPBlSrXVaNZWH/dIyJQ5pbKiuO1JW5Z2hF1ZNVcA7hUZYf3zG2WfnlI0xfI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLRgUHIIWANfS9DLvKRoNVSM+1erFGOJH3WrwqcLR5dNjLyQnh
	KFyYckrBQvl0GqfxuHG4Xx8Zopi+LRKVj9UCAT0yMcKM7gnhmblz2gZ0HDOPG6ElDh5v2i+tjyA
	ION/jDXv5gJdTeyvEuIqQClou8zjPS4rb99kvHgpN
X-Gm-Gg: ASbGncvLKbIyLhee7DEWK15D2yWBgU8jnuRr8yCFDxoRYpB+TIc6O4qdG1MJd6lIjDz
	aTU2Gkw0q274dizDjbXI/L1CoGYAO4nuEgOnUelXbWFneL2qbRwmfDyUARnwj7RV88jVyauRjhd
	WfPnTb64fHrkAhpcU/e1BqzB87eX7UTSqf/nxFmu5k7YOW
X-Google-Smtp-Source: AGHT+IHrCaCboVb+mYd6VODPHySRh2UlXAVZ/QOay+nn+pjpJ//L1jegP3WSxBTh/9vzWlfdXpQUzy+19mVRhyBPxn0=
X-Received: by 2002:a17:903:1b63:b0:21f:2ded:bfc5 with SMTP id
 d9443c01a7336-234c55ab5aamr1578395ad.28.1748402629057; Tue, 27 May 2025
 20:23:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528022911.73453-1-byungchul@sk.com> <20250528022911.73453-11-byungchul@sk.com>
In-Reply-To: <20250528022911.73453-11-byungchul@sk.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 27 May 2025 20:23:35 -0700
X-Gm-Features: AX0GCFsppSqNuMrfRURYgwM0eiForkoo7rTRScW8zc9A7vZ7d83h17DCjG3kLl0
Message-ID: <CAHS8izMWhqJacD2UKJWGOEFoqcSbeaiEYkkQsiHPKkCNwnOmHw@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] page_pool: rename __page_pool_alloc_pages_slow()
 to __page_pool_alloc_netmems_slow()
To: Byungchul Park <byungchul@sk.com>
Cc: willy@infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kernel_team@skhynix.com, kuba@kernel.org, 
	ilias.apalodimas@linaro.org, harry.yoo@oracle.com, hawk@kernel.org, 
	akpm@linux-foundation.org, davem@davemloft.net, john.fastabend@gmail.com, 
	andrew+netdev@lunn.ch, asml.silence@gmail.com, toke@redhat.com, 
	tariqt@nvidia.com, edumazet@google.com, pabeni@redhat.com, saeedm@nvidia.com, 
	leon@kernel.org, ast@kernel.org, daniel@iogearbox.net, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, horms@kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, vishal.moola@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 7:29=E2=80=AFPM Byungchul Park <byungchul@sk.com> w=
rote:
>
> Now that __page_pool_alloc_pages_slow() is for allocating netmem, not
> struct page, rename it to __page_pool_alloc_netmems_slow() to reflect
> what it does.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
