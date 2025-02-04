Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EBE20C034
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 23:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738712199; cv=none; b=Bqg9KEYv9ybcHmr8fEQjAmUVrdOGz5B7vWdqHt5K7MSTZpKFqnDKPq5yw9jQaHHzb4UzQoWOdD1sdMyh+Avau1smTHzidKL8MJyQrj2Y5b2DDIHCINjvLAhjsFQ/o52LvuPxsGG0Ik/YAGeHUOelKRc4hgpHLM2/VBLxAo0GC3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738712199; c=relaxed/simple;
	bh=QjEre/G3BLqcrCF5wreFajQVoRGv9unmtvDg4S23UQU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=mByg9/mOFZaSzS0IyY3YbdTDr0px/oIEFLS70oN+5uOhHVh0tvIsAyAh3gMXIvThhvccB8B5A7wVCl8DMoXQMA7EGV2iRDYI7s2ie9uCbNkXgd9cJUveWxW658zg8jpEJ7K03USqe6ISYUJCwTQOGt3K1YJ5MabymJDAtjfawfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com; spf=pass smtp.mailfrom=jrtc27.com; dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b=Pxq14T6q; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b="Pxq14T6q"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso3362689f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 15:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1738712196; x=1739316996; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjEre/G3BLqcrCF5wreFajQVoRGv9unmtvDg4S23UQU=;
        b=Pxq14T6qk7wHnCKc8K8smJ8lKDbvd5HZIJQAy4wZws/37SBi5T81I4WPYeFnDoDPDA
         b27wDaPlImy2bIR5tWFoMGvGFXeKVeEfyUMDBgTKfscvnfLBhsAH7mdvpnYOah6ZJ0P3
         BCNF4SYQwIlKwB8OeNDobvgJ3/U0HhXQBM4vnuET8y7VhcAenEMzh+W/glWWQIC1jT0A
         pY4+MNfHEB+MS6qu7P9lZ28/idUer6ygbT9kCCtEHm5bFtuY1cabP8gatpTpRa7TBZjr
         x6FZTmO0QQWgcgohdPSQQ4BPp1ZHGBNrqXT6J+pK9K6Wq3+1F+V7ZxWrnTARgXvfhtBt
         kpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738712196; x=1739316996;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjEre/G3BLqcrCF5wreFajQVoRGv9unmtvDg4S23UQU=;
        b=MUku5jESyzVCWFmg/mwSxKMzdaRkq81CfOIUORqSRuxJBiagP5fPz3tL9CdfMpGwBi
         +PUx84Wj7aA4FT0zAtX/tdI8/Uit57urzqCh+s0tagXJ2mHvAX5pPMR5l50urM3vkn3M
         dD5GG0cPvT4itvnyAjWG7mY5eDRxgE6yEcNNOzF//P+Tu1+VgxCisCQn5F0rDYsK9qiL
         RClxfiYU8cvsv4nlucRIbILDLhtp0nyetNxiG1bTctLu39BIg2FkkxBILToaposKQkbs
         oibhse5KMvBBs7mqfMm2YtL36WnEd/eWCJtAzRbF/Cj5s4RiT4EF072tfUUKJwkwbeRK
         xVEA==
X-Forwarded-Encrypted: i=1; AJvYcCW7Fly7TIDYLpnrpZAoBbycLS1LwDJXgIElspR+semtpiFrKptx6pOc0nSUPjs9Z3IILBmLQyFwnb6Y1zI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3QICD+gIGkoRBupYNCXv0AsIg6q0m8x5DyZWwFnxHCuq/qqF8
	RDhjbx0vZDpfZFud00SszEsIZOtKVu60Ai9Mh9E6qOQy3+N9lPERHyWoIsZ6YoI=
X-Gm-Gg: ASbGnct2pXJqsFpMwISTJXWuf6drZRKBQm+hJgM62y23TyM5JclBRuAOyIR3QAH2WCN
	k2aSOu6GpuHGzDOU7zFOqutJ0XbUJW+2LqiQDPuHOY3a36oV+uvcP+8thZZV6XYwCte67QjpB6J
	iFFe4QWNjflYQGkGyTbE5B4FRNq1pK/99ujf/YQUUJy3y4zTve0H5hMHqNzW73TGYGZGqv9rP7d
	qNFI+Nj2zw0slyGkVVpcVsLWlK7bQFPcTJj8Wi15/AgQAxnKjM5LXeFCbvwZjEvV4sRGxO78h18
	Jf2w7PWLiRb54bn8K7ib6N4i7nfZ
X-Google-Smtp-Source: AGHT+IEbYs1SnazTxli1ivvCCDO1Cn9LUrxieFBceKbd6w0ve1uSZrVLlYscY7LZ+tYIHGaLpjoemg==
X-Received: by 2002:a5d:4c47:0:b0:38b:dc3d:e4be with SMTP id ffacd0b85a97d-38db49214e3mr355994f8f.51.1738712196024;
        Tue, 04 Feb 2025 15:36:36 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec369sm16900115f8f.8.2025.02.04.15.36.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Feb 2025 15:36:35 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode for
 x86
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org>
Date: Tue, 4 Feb 2025 23:36:23 +0000
Cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 luto@kernel.org,
 xin@zytor.com,
 kirill.shutemov@linux.intel.com,
 palmer@dabbelt.com,
 tj@kernel.org,
 andreyknvl@gmail.com,
 brgerst@gmail.com,
 ardb@kernel.org,
 dave.hansen@linux.intel.com,
 jgross@suse.com,
 will@kernel.org,
 akpm@linux-foundation.org,
 arnd@arndb.de,
 corbet@lwn.net,
 dvyukov@google.com,
 richard.weiyang@gmail.com,
 ytcoode@gmail.com,
 tglx@linutronix.de,
 hpa@zytor.com,
 seanjc@google.com,
 paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu,
 justinstitt@google.com,
 jason.andryuk@amd.com,
 glider@google.com,
 ubizjak@gmail.com,
 jannh@google.com,
 bhe@redhat.com,
 vincenzo.frascino@arm.com,
 rafael.j.wysocki@intel.com,
 ndesaulniers@google.com,
 mingo@redhat.com,
 catalin.marinas@arm.com,
 junichi.nomura@nec.com,
 nathan@kernel.org,
 ryabinin.a.a@gmail.com,
 dennis@kernel.org,
 bp@alien8.de,
 kevinloughlin@google.com,
 morbo@google.com,
 dan.j.williams@intel.com,
 julian.stecklina@cyberus-technology.de,
 peterz@infradead.org,
 kees@kernel.org,
 kasan-dev@googlegroups.com,
 x86@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 llvm@lists.linux.dev,
 linux-doc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0BDD645A-3BBE-4A85-9098-257B281A3BA0@jrtc27.com>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org>
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
X-Mailer: Apple Mail (2.3826.300.87.4.3)

On 4 Feb 2025, at 18:58, Christoph Lameter (Ampere) <cl@gentwo.org> =
wrote:
> ARM64 supports MTE which is hardware support for tagging 16 byte =
granules
> and verification of tags in pointers all in hardware and on some =
platforms
> with *no* performance penalty since the tag is stored in the ECC areas =
of
> DRAM and verified at the same time as the ECC.
>=20
> Could we get support for that? This would allow us to enable tag =
checking
> in production systems without performance penalty and no memory =
overhead.

It=E2=80=99s not =E2=80=9Cno performance penalty=E2=80=9D, there is a =
cost to tracking the MTE
tags for checking. In asynchronous (or asymmetric) mode that=E2=80=99s =
not too
bad, but in synchronous mode there is a significant overhead even with
ECC. Normally on a store, once you=E2=80=99ve translated it and have the =
data,
you can buffer it up and defer the actual write until some time later.
If you hit in the L1 cache then that will probably be quite soon, but
if you miss then you have to wait for the data to come back from lower
levels of the hierarchy, potentially all the way out to DRAM. Or if you
have a write-around cache then you just send it out to the next level
when it=E2=80=99s ready. But now, if you have synchronous MTE, you =
cannot
retire your store instruction until you know what the tag for the
location you=E2=80=99re storing to is; effectively you have to wait =
until you
can do the full cache lookup, and potentially miss, until it can
retire. This puts pressure on the various microarchitectural structures
that track instructions as they get executed, as instructions are now
in flight for longer. Yes, it may well be that it is quicker for the
memory controller to get the tags from ECC bits than via some other
means, but you=E2=80=99re already paying many many cycles at that point, =
with
the relevant store being stuck unable to retire (and thus every
instruction after it in the instruction stream) that whole time, and no
write allocate or write around schemes can help you, because you
fundamentally have to wait for the tags to be read before you know if
the instruction is going to trap.

Now, you can choose to not use synchronous mode due to that overhead,
but that=E2=80=99s nuance that isn=E2=80=99t considered by your reply =
here and has some
consequences.

Jess

