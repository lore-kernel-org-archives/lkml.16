Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DC71A2564
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747984659; cv=none; b=i2vKNaypO+N2IRZSYUZxwL387XfIswyJMlxTxYCs0vg6Q46+VtCoBYc/n/FS0q8tVigyBFSp4JNAzcky33iVB2z6nfcgFi/CNm43pTcxYUbzUgqwGpd45ksxZ2x3eyxeQigrHLqH0BaES5q3G7uHXlUMOQADj4RPzUbDXt0Lims=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747984659; c=relaxed/simple;
	bh=14OpoNR5wXX/CXfjw1QWL9oJm6ZbCTjIwhXlXxgxunE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=Td4Do+XIKT3M3mpw0QvHcNl8Fgkb2jsHcKM1pETlbbHFrPbEgYad/t2DEbCYJUiu+L5KEJIpzaNlUKBH8G+OJZIgURcF99STiQGygrykNAuD5HTA3tX0+MyxCYXCxZzm8Nik/UZKQsR9QCFS9A8vfDBvWzb/dhNmPHTow14ilbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=P6SKMKi1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="P6SKMKi1"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a36561d25cso901824f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747984656; x=1748589456; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Av0wHf24aS4juStS1TN8W3ncbclQw1XJp/gFY5E/1Cs=;
        b=P6SKMKi14rsQzaxehL087WZRxfh3a4Bp5TBCM9Xmo73gWKS1J3icVwlTaj3VgOC2Ha
         habqjD033O2/q857ROST5/DE2FvfIT0fLYujopHHEuVxyYcFc9ufUQCvimXyjo6z07pC
         8LIjkSoeG60QszKZhjRuOI/kw+KlyrrcTRd4dDXJaZ9ExjyUqrCNz723YLVNLboiU6a2
         +GF1l9bVtTnOU/n5trIsIbml239zObafvdF2cKe6WaMojN6+PodiC9+EXuuUrMMrSHdX
         YtUqj9GEnMMuHK4MOSi9PcMJebL01M6vVAWm94euDiXk/lFanJO3j9wRrN3/NuHMC27R
         BGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747984656; x=1748589456;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Av0wHf24aS4juStS1TN8W3ncbclQw1XJp/gFY5E/1Cs=;
        b=i3eNdVJRwVonPdmKZ02HfhTE9zYxqXLbohnct0VY8VS3fh0Hrmrg2FL/o/Gdduvim1
         B/ZFA4LHrgurOGuaHpKd36SiBF+te0Cq5N68vOBJ/tuAiTdG/kOFIFoCue4MUYepN+JT
         nRO5mdMbghontvGm5x0Ar1ruPsCfNET20PLCV0R5Kv9nf1UXn41DBRxSbWHzHL9xVtUu
         up+LoHdrM4LFVBHRKtvt6OcuI2y2fzuBTDoy1acdRe81qw8vEOOn+ZInOp/Mf+IEU2jf
         kI9AWDgBHUzixnTjVQuByax8xk6sI6us76rrBs8xkv2DsrrmKwld1ijBRT/PqNgWlEhd
         WI4A==
X-Forwarded-Encrypted: i=1; AJvYcCWrUYlTzGWIk+PG1kRaplVOvyBLyaUdUppAWpdbBwhD6Em0TS0BW7owzRUkCrC6gVZcy0s1O7JROELrA7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZIBdkUAfnDxB85GHk5KzF4v3YQok6FViSq/8aOioYhVE23ukU
	HuSraDk5lG24FwSk0c58oEnNXtIJmnBuz6v5TsBYmQnWyex3sPF7daguatYOKSzdzQQ=
X-Gm-Gg: ASbGncsSwgoWIO5gW6aAVVIGvapstf96oPZa/62wQZF0Mf6s4dhnas7qvaijMi3S+B2
	0oPFoN7/IHDWpQJazZAwOidgkQW5ohJz7oVExMa9OZwyNRz7CRI4MhlQb1wqEYlGZU30kOTvs2U
	RjWc1dfyC8o/hC7jMeWJ2eDvYa1FwaYOHOtbvTFtnj+Dl0QCgZoZK4jAPiEWky0ODk1MXsuTGr7
	GXd86BnUlVOiE+2sH7gRYieCNuFeH575yX8VJ+8zKKgLG4ZNtm1ftnXsc+XA3Zf9iKqvcK4ziMv
	rGnyYkSgqk7tHQ3jk9O8iVZS73JLnKZayblpj9xKvDGrs4HjvXbi7PbzPl+9CwbgRqXSrlCDWFQ
	uNAwrQb8Ek7c=
X-Google-Smtp-Source: AGHT+IHny3D/gWDxUIqfuvTT+wNP4SQN43b5D98pz4Oyz+pD+zxR9Sz3GTWyxH2BvIqBfK8zfh4AVA==
X-Received: by 2002:a05:600c:4f8e:b0:442:e608:12a6 with SMTP id 5b1f17b1804b1-44b8ab9bd9emr3386425e9.1.1747984655676;
        Fri, 23 May 2025 00:17:35 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d4a3csm134133475e9.22.2025.05.23.00.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 00:17:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 May 2025 09:17:34 +0200
Message-Id: <DA3CUGMQXZNW.2BF5WWE4ANFS0@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v3 0/2] RISC-V: KVM: VCPU reset fixes
Cc: <kvm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Anup Patel" <anup@brainfault.org>, "Atish
 Patra" <atishp@atishpatra.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Andrew Jones" <ajones@ventanamicro.com>
To: "Atish Patra" <atish.patra@linux.dev>, <kvm-riscv@lists.infradead.org>
References: <20250515143723.2450630-4-rkrcmar@ventanamicro.com>
 <1a7a81fd-cf15-4b54-a805-32d66ced4517@linux.dev>
In-Reply-To: <1a7a81fd-cf15-4b54-a805-32d66ced4517@linux.dev>

2025-05-22T14:43:40-07:00, Atish Patra <atish.patra@linux.dev>:
> On 5/15/25 7:37 AM, Radim Kr=C3=84m=C3=83=C2=A1=C3=85 wrote:
>> Hello,
>>=20
>> the design still requires a discussion.
>>=20
>> [v3 1/2] removes most of the additional changes that the KVM capability
>> was doing in v2.  [v3 2/2] is new and previews a general solution to the
>> lack of userspace control over KVM SBI.
>>=20
>
> I am still missing the motivation behind it. If the motivation is SBI=20
> HSM suspend, the PATCH2 doesn't achieve that as it forwards every call=20
> to the user space. Why do you want to control hsm start/stop from the=20
> user space ?

HSM needs fixing, because KVM doesn't know what the state after
sbi_hart_start should be.
For example, we had a discussion about scounteren and regardless of what
default we choose in KVM, the userspace might want a different value.
I don't think that HSM start/stop is a hot path, so trapping to
userspace seems better than adding more kernel code.

Forwarding all the unimplemented SBI ecalls shouldn't be a performance
issue, because S-mode software would hopefully learn after the first
error and stop trying again.

Allowing userspace to fully implement the ecall instruction one of the
motivations as well -- SBI is not a part of RISC-V ISA, so someone might
be interested in accelerating a different M-mode software with KVM.

I'll send v4 later today -- there is a missing part in [2/2], because
userspace also needs to be able to emulate the base SBI extension.
