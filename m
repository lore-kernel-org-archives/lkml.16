Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D768B67F
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 19:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747683178; cv=none; b=CEhdOPSe4fCe5rIESnPb7V0OapF1dpKluF33fmHcnZ+/bTo5d7U+ejvJ4CVReMSH9RCzWJD6chl0Ilb5MBOphLdpEpH/vPDM2sY9dO45JHG2qPBU028slnvd8iov6EIq/qCWm3k8A5qos7fmuzd+HHHKCL52nbMS9300R9u1WRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747683178; c=relaxed/simple;
	bh=m6NaGapAZ49mCAV3YTC7ZH95qWHvpXrbuc2cbKM20Z4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t3MYWVC14kYcRyYPZ4MQ4dFG4M/tvq5wxH7UbTGNtg5gmDv4/lpIM8lfrMXunHiI6TVCq7GtGqhX2MPjVuoav7OgxJQZYNf4SPkxyHdiMDiHb2AvfOo8+jv34cta7HjYJef9TgppMbt5mWDta9zTu+J3Do+CYuG/L/EtmL1guy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UPeRKoLS; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UPeRKoLS"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-601a67c6e61so13404a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747683174; x=1748287974; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pd99E++PIpsoG+9M5QM27H5eDmCI3r4xK5cT/AfBF+8=;
        b=UPeRKoLSeJA98eAIF7xQJlfQCDAFcG/WNxKeErqoj3/p9g0NXlU7EA+1oFrq8OtBQM
         oJaNigNHfoINSLM64MYLfF3tjdlMoaV3bDS8DYybi2QgeTryjzij7LbdVnzAxQzYuyaS
         nLWlGVU617IEXI02hu7HrvPCVIcF8105+ppcpmqk3BwRY/pEf8OKW2EIWvvx+tnVn8gc
         A4xKH5Mh4ACqVSkVAJU+UChxKAtfje7yb9sKuZowD/pk9FgEOkqMoUpw9W1Mx/wFajyY
         j5XBKKXMJYSDh49tq5UVUrteFbB2413bHvzTyHi0qYSl53HkA6tIX2XfiSacSQPkEgqp
         S8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747683174; x=1748287974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pd99E++PIpsoG+9M5QM27H5eDmCI3r4xK5cT/AfBF+8=;
        b=Y86CjiCHC/6INkpr8IJItLyT1xKUK8TDfwyvG2TSpt1LtfA6oDcJZEPrTV7R3wBp3b
         UHTJikA2WY/gNv2Nk6lpm7y1TKPQ1Ki3+VeZlo2gIJIwLhXInT5nazaaENzYl+eyddcH
         YJ2dJkWI2Dbozd/HmREAhLp5uq8hcKbPmG08iTfdrOpeMCiDNiDVgTkHShlPKhpAorOL
         Ym3eAQHRk3/FnGjKHH1hcrTtPS4YrXanO9GVReZPZt2P/Rud7JvtLzBHFsk132XUbiNz
         5MZ622sRHFNspyNUVs9JFHuEE4flPMfpPmoc3QANlILhH74ggZZLUlgWNFzjCfdYPJbL
         PfxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsMAbLfjm1tlRm/6d7HNwuK/mPrnIt+EaOK+NjxmdPdyoRI0fovBiGLyZWt17iVbtwyxQLwSbSy1XTLik=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7U4z+zxhmSrEuGGGmDWpqhGt40qui1lQSGjHBia2ON/aVQUcn
	yrVsKW8avINCHdA4liEDfA5cJ12NHUSeNUg6R63n7vlONlA8drIHTpNHIuBbvHIJKz62l1oy+jd
	Oz8Fnmu3wHBsKvy9MVR+EXvzZ3J4ilEXyZ6bYPFu+
X-Gm-Gg: ASbGnctA0Tn0rYRpTcfm6h6zRIZHBi4GpUH6NNCRQBI3yY1A3XHTKydKYbkwtEvf6Oj
	+kFIg84snOR2lpNh/HYhpI6mefifXDf9VyhQzu/pHStqLK85seniftoVa0os8Jqoj7i7jzJccSp
	58PoIByYvqzWHTTQR4oUp9Nb+c9oQv4ACXT33M24kGhJLPmggTOk64TgX2bak=
X-Google-Smtp-Source: AGHT+IHorR5piFPLvlyTTIt7yOeaH81YYykazyXayeFGeggEy+NeQBc8UVXI0Hjq2JSaAgRqDD3dEq/Pl9ZpA4J3aMg=
X-Received: by 2002:a50:9f08:0:b0:601:f23b:a377 with SMTP id
 4fb4d7f45d1cf-601f23ba435mr95619a12.6.1747683174104; Mon, 19 May 2025
 12:32:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519131151.988900-1-chenridong@huaweicloud.com>
In-Reply-To: <20250519131151.988900-1-chenridong@huaweicloud.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 19 May 2025 21:32:17 +0200
X-Gm-Features: AX0GCFsyR9RJD4iICdH4N5pJ3OSKzdWAtfFWE4VI-UNMhtqXCTOcC3Q_YL_LLiY
Message-ID: <CAG48ez2bFhYYj2qkJk3j5t=3VwYUH4sSMuohyC=MfrRw-bv22g@mail.gmail.com>
Subject: Re: [RFC next v2 0/2] ucounts: turn the atomic rlimit to percpu_counter
To: Chen Ridong <chenridong@huaweicloud.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, vbabka@suse.cz, pfalcato@suse.de, 
	bigeasy@linutronix.de, paulmck@kernel.org, chenridong@huawei.com, 
	roman.gushchin@linux.dev, brauner@kernel.org, pmladek@suse.com, 
	geert@linux-m68k.org, mingo@kernel.org, rrangel@chromium.org, 
	francesco@valla.it, kpsingh@kernel.org, guoweikang.kernel@gmail.com, 
	link@vivo.com, viro@zeniv.linux.org.uk, neil@brown.name, nichen@iscas.ac.cn, 
	tglx@linutronix.de, frederic@kernel.org, peterz@infradead.org, 
	oleg@redhat.com, joel.granados@kernel.org, linux@weissschuh.net, 
	avagin@google.com, legion@kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, lujialin4@huawei.com, 
	"Serge E. Hallyn" <serge@hallyn.com>, David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 3:25=E2=80=AFPM Chen Ridong <chenridong@huaweicloud=
.com> wrote:
> From: Chen Ridong <chenridong@huawei.com>
>
> The will-it-scale test case signal1 [1] has been observed. and the test
> results reveal that the signal sending system call lacks linearity.
> To further investigate this issue, we initiated a series of tests by
> launching varying numbers of dockers and closely monitored the throughput
> of each individual docker. The detailed test outcomes are presented as
> follows:
>
>         | Dockers     |1      |4      |8      |16     |32     |64     |
>         | Throughput  |380068 |353204 |308948 |306453 |180659 |129152 |
>
> The data clearly demonstrates a discernible trend: as the quantity of
> dockers increases, the throughput per container progressively declines.

But is that actually a problem? Do you have real workloads that
concurrently send so many signals, or create inotify watches so
quickly, that this is has an actual performance impact?

> In-depth analysis has identified the root cause of this performance
> degradation. The ucouts module conducts statistics on rlimit, which
> involves a significant number of atomic operations. These atomic
> operations, when acting on the same variable, trigger a substantial numbe=
r
> of cache misses or remote accesses, ultimately resulting in a drop in
> performance.

You're probably running into the namespace-associated ucounts here? So
the issue is probably that Docker creates all your containers with the
same owner UID (EUID at namespace creation), causing them all to
account towards a single ucount, while normally outside of containers,
each RUID has its own ucount instance?

Sharing of rlimits between containers is probably normally undesirable
even without the cacheline bouncing, because it means that too much
resource usage in one container can cause resource allocations in
another container to fail... so I think the real problem here is at a
higher level, in the namespace setup code. Maybe root should be able
to create a namespace that doesn't inherit ucount limits of its owner
UID, or something like that...
