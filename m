Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127E319E7E2;
	Thu, 24 Apr 2025 13:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745502597; cv=none; b=uayF76GQxFQrUZGoh+fm8N+pYLcFam7dn/pRSwj21XZL7HPWp+lAHE235dIFh6bZ0ASpjG8hAePqSXXw9PoYu7pcCNUZ/f/QrOPC3op3IwXAGOHYLH/pCsGR7B8BP8xoNe8+D0zQ1VJgod7A89KvbsOxSbfzRAzwPkoj/D14ztU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745502597; c=relaxed/simple;
	bh=0Y5oM8I6DLWLWxXU/OSALwZE+sDM5g7F5Gf28iAR/8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PFkaUdgTJepFKaMPdxL/c2mZxoGpjcBYB0uep7gQrcKMwPvOlZg5Kt2oCWYuaO4reUzNXpRdtVtTdCikrVr/c+hrg8oCS8Ozm3V+QhmyyhYe46Kgz6vQttlwjPUtOlu3GndvlFKlWlRqWo/Az0QuS8LeW3nHhjQhkOIn6j5LJHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpA875SV; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpA875SV"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bf3f3539dso11647341fa.1;
        Thu, 24 Apr 2025 06:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745502594; x=1746107394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Y5oM8I6DLWLWxXU/OSALwZE+sDM5g7F5Gf28iAR/8k=;
        b=SpA875SV5UjGX/lG+RHcj14ypJEzisbtrKumT3DtBAKxlqNxDgbM4LM7tl2T6hOPJ9
         9YKVkArJJllEk3jatwPT32aXqI/4lBnaK6cdQBIHCOtYZa3Vo3tWHuYMIjnkLgXTaTlH
         4vAKgA6BPBmQ0jty8EndT4f8V8t9pPJ/Jqap5ndZ7V6bSb1Er9kgSfdxIYEFiD/Ehlxd
         ALK6LQxNIoabp9oUlOpdVARkDGKHu5UQT/nRYMKWRS/BE8xFRn68ZcIEjqw6y8amjRqu
         H06QYvotxVBc8HTVHUalFwO/C62BWB0VZDYJyL8dLoKoQgeRUuQeyfMiHO9JvbVm1US7
         puJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745502594; x=1746107394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Y5oM8I6DLWLWxXU/OSALwZE+sDM5g7F5Gf28iAR/8k=;
        b=DcpWhK5YI+YmWZlJ3DUaxTlqsJX0hUhU55UjMj2HV4BnObjbrGlTureiP0sMe49Sa/
         MjhAcBPMD1yeaXCJT9I+xL9LdIKGPYSRY5qDOjVHIEv66ZXArvAvYtvu6i1nOHa3pFzn
         S0fgUY8576q+9jE1U9Ai1Ouj23ibD8QtJuzdMT4p4nRHprUga0DJvyDtlvEgkxV2wNVO
         LqzfX6UVdUOq8DGxaCAQ/fdjSg6b30Z9T29VOcWJtYb0NcfB++VoGEC14O/pdhtVTFni
         kYrqL8PKav8Z5B5WK1VAU6qau3WUjar+BaGvLXpAVeGiHlZNaVP80izYAwN0prlbkMM/
         nAZg==
X-Forwarded-Encrypted: i=1; AJvYcCUwhE0PTALV7vsXE5+12tTjr0UP3wlaDGSL44q5jlGgAIKy0+7P2N+nFtNJqZN0SmEMtrI1Be1q7hXh0bgzNFw=@vger.kernel.org, AJvYcCXdz2kdiSJdkYZuWXgEtnvRiAB4SebottW+TZX6RuWlvwxgdSmXzXuypWypp9RSi0Wvp6OqSy4QSnw3KVk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG8ays1NJr5LSpqZFcipC+3roQiLVxbnJCj7DvJ7ECCRQE4XjT
	Z8jRPqgPktu/EJghgnv+iPgHqxNMo7LOMmdS9V271uAaMMZkKroGifxaAzAyugTBLIoe95CvrQD
	VdseXz5NHu+jdvxGAx4KP1imqFgX/qqhB9N0=
X-Gm-Gg: ASbGnct23I+5FsiyQTD2Ik/O+zMQQQXiqv9+1lxQXIwtH/Sa+nItfawMDl0tv/hKCxl
	ASACjtm2ALjT2fyhFbeg6PKWIgzZBy1rFn6jTPR5VMaUgmFImCdNhNQStcN4yoM1A+I8kodzTEt
	aESc76rXnECcUEGuz/X67lw9PRdDVDX5Zs1RCxJw==
X-Google-Smtp-Source: AGHT+IFiA4/n0vlyL4EG3WuNiyLJubXIWwUKM+1k25Diy0MV2fU0ViyHmuPJ6quZLvMiOTc624XymmjWjq+uXExGLxg=
X-Received: by 2002:a2e:b890:0:b0:30b:e73e:e472 with SMTP id
 38308e7fff4ca-317cde05778mr7647921fa.14.1745502594124; Thu, 24 Apr 2025
 06:49:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
 <20250422-vec-methods-v3-5-deff5eea568a@google.com> <5fb8bfb7-961a-442a-b091-0349c8aa5ddc@kernel.org>
 <aAokixHVo5YjazmL@google.com>
In-Reply-To: <aAokixHVo5YjazmL@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 24 Apr 2025 09:49:18 -0400
X-Gm-Features: ATxdqUGfmvl_biZkJPTdnqIwzPPCsHMqZQweS-9LbsuYdGNgkMVW6K3o25EGoq0
Message-ID: <CAJ-ks9=wr84zoxsyncOu==BQUS+Y7Lc8CUgfgKwuJc9imu87rg@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] rust: alloc: add Vec::retain
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 7:46=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Wed, Apr 23, 2025 at 02:14:11PM +0200, Danilo Krummrich wrote:
> > On 4/22/25 11:52 AM, Alice Ryhl wrote:
> > > Unfortunately this can't be a kunit test because it uses the upstream
> > > Rust implementation of Vec::retain as a comparison, which we can't ca=
ll
> > > from a kunit test.
> >
> > Would it work from the rusttest target? We can use our kernel Vec type =
from
> > there, but I don't remember if we still can use std Vec from there.
>
> My guess is no, but I don't know for sure.

Isn't it possible to write a test without needing std's implementation?
