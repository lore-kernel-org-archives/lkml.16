Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F0522A1C5
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 13:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746709882; cv=none; b=CXIMb9I7BvofcIf7IOpTzzs8utOsgvfJpeuH7W/tr+WF2bE324xZ7f5EexpgyYa8zPJXjPawq9hD2vR5oHJ3aR4623KoxRrcOtttgzDbUl0BtSg697Ke8/LslHiCZTDk457qkG5pIUUqJ5P2axknzex7t5qN8bnz01I8IBSamBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746709882; c=relaxed/simple;
	bh=1wwTO5Nw42Ep7tw3uZOYZ34griFSvPoI6Sesn0+sV5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HRd5yAbVYyy3i3CMM/fHuj6oOpP6cx49bf7D6p/Q7KVuSNM7GlwoLTQl1ZqaxnFkmqIFaru0ckUk4vO9bwVs0HproSCONkrPoFZnx/ZUlnnhzPkLH/UecY6f36361stbtpaMXYDZnEOlc3nQA+XPCsWylHs0aarH7I2gcbQFQmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=xH7ZZVDq; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="xH7ZZVDq"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3d9189e9a06so3934405ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 06:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746709879; x=1747314679; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIIzVOYBzARToag3Hu6HMwC8LbExnwHHAZ9eRtDBxjM=;
        b=xH7ZZVDqzqiI4rdOwYagK9n1lQnbR7IHdnlMMZzJ4v8b7+I2yRvvuGXkuFHI++t6JC
         tzn53s6nw/14/jCIqQZFah61+ZYQ0ASTKVsVBhi0ZkWOAoh/aEUiJGn78Y+Fad139v7v
         9rhtLaDsZoj1QrkC/fzeQJX5nS9J3VFNlogJgzWg+WOW22c+ZEo6Gh+c3PmiLZxFGVDQ
         8iW/nleDxXS8USd7kM/TCjFBlFq9ULnixiENny4bJVM1WLc8TxJ6NzRXT9OXdXJShyhX
         gKqiv8YIF0zIhuGm+7sJKorjs2I3rXfTIGbNQhXd/41njfnKJRe+CAkZtgtpBXYlnU6Z
         cFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746709879; x=1747314679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIIzVOYBzARToag3Hu6HMwC8LbExnwHHAZ9eRtDBxjM=;
        b=nqcZ+yUIcWK8iJosLxzzF9pBA9lwcjnbM5oo8Fu6SHqFA37JA7cdqVQglESb9j6jlW
         F/dCD9negnvhbl8LkSdx30gREm1qPsKARRakj4ZK8wR3UPGYplCL02IbV+KP6QxlL6UN
         Esjr7r3Vj45EMQvf6bjRTMpteO+jkJ6nSJGA5zrfbNUHU7qVQOk2oym6eshla+SOcoY7
         QDUNle87OXMpLU4b7oNn2tH2F50C10d0O7rmATDqRzqq9xjwfYqZI6PGh1IDTudVD+5u
         YN9iJszGaFeMPgucvMJPAezBvXXs/jE8kjUWQcqLXLVyDMKac8T+w6SLv1s2osdSdKBs
         sGnw==
X-Forwarded-Encrypted: i=1; AJvYcCXMRwdERoN38Pgn3aYQCcmXylA7Lo3/SSfYq9jZZCkAbFSM/vM+QB+qw8GPozPlHxNvK26fLmDtGTLGBs8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzehMkixw4rHSnRdMusPIxW7pHXAdhMIrOyucHuV6EPQK9KIGeK
	0B3QJiJURtV92aLpzeKi2hu0TgwZhLoAEjryNBojS35V4r/GS0NxDvxWH3KmuNwDXTR2TWQnEAW
	ioBKzWRoDQK5IFlacVxv+x0AH0iK52P8TBJR2vw==
X-Gm-Gg: ASbGncvH2cbfYmmWvi9iqLslSdHbSQOa/wtjasjPMEJUtXulagGKBqg/NTZ62dq+JQF
	OB+KvkXypxD0nAJ8dk7kE5+0x6pMmTGfXayKiHJdUi+SZOeZ+ZBSdnXvQs7Sw/QAXDnfDqFyTh3
	isxZp9bE0/s0eYWhmwQp1fk0WMgUC49s5nww==
X-Google-Smtp-Source: AGHT+IHQLQeo4Cv5ChZYTmyYcmLv/sbqMMoInT3yPEcu0Vzy2BhXgfYdd3qe4Af9myyCvg8pUIR3RpvOggHqQ9hf9zI=
X-Received: by 2002:a05:6e02:1809:b0:3d8:2178:5c63 with SMTP id
 e9e14a558f8ab-3da738d5abcmr87761745ab.4.1746709879462; Thu, 08 May 2025
 06:11:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-6-rkrcmar@ventanamicro.com> <CAAhSdy3y0-hz59Nrqvvhp=+cWJe1s50K7EpuZmKBqfy-XQFd1Q@mail.gmail.com>
 <D9QOY9TMQXSX.2VOEKVRCXKOO1@ventanamicro.com>
In-Reply-To: <D9QOY9TMQXSX.2VOEKVRCXKOO1@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 8 May 2025 18:41:08 +0530
X-Gm-Features: ATxdqUFytTSYeO2NMWgtWuuoNAjjyJfo1ZnV22TOYS1tMfbGTisHt7Mnprxdk_c
Message-ID: <CAAhSdy0-9OQmBf2VkJJFb+Gmwk3hmNapkjvJYvT06CG9eULDgQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] KVM: RISC-V: remove unnecessary SBI reset state
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 3:32=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar=
@ventanamicro.com> wrote:
>
> 2025-05-08T11:48:00+05:30, Anup Patel <anup@brainfault.org>:
> > On Thu, Apr 3, 2025 at 5:02=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkr=
cmar@ventanamicro.com> wrote:
> >>
> >> The SBI reset state has only two variables -- pc and a1.
> >> The rest is known, so keep only the necessary information.
> >>
> >> The reset structures make sense if we want userspace to control the
> >> reset state (which we do), but I'd still remove them now and reintrodu=
ce
> >> with the userspace interface later -- we could probably have just a
> >> single reset state per VM, instead of a reset state for each VCPU.
> >>
> >> Signed-off-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@ventanamicro.com>
> >
> > Queued this patch for Linux-6.16
>
> [5/5] was already applied, which means that [3/5] would be nicer with
>
>   memset(&vcpu->arch.smstateen_csr, 0, sizeof(vcpu->arch.smstateen_csr));
>
> in the new function (kvm_riscv_vcpu_context_reset) where we memset(0)
> the other csr context.
>
> Should I add a patch to do that in v2?

Yes, please add it to your v2. I will update my queue accordingly.

Regards,
Anup
