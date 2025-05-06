Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F9728643F
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 18:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746556765; cv=none; b=ZhB578EIERZi2BRegfuaHHdGa8ABGdVWzJzcsXRE4E1nf7m/vlZZrWWedSdclcKQVCwtNfR+c58YnJtag40ndZa3dG3DkOL0YSo6Y2V1FbTPwqmwsX05kaJ/MCoKPwxZF95xHhFlPN4/hyfmAlH1H6JG5hOzIIVmvQNHO6NsVZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746556765; c=relaxed/simple;
	bh=lPYivgk0xfutw01QzoOp0OupuYw51Ml3y8ei5c8gF+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a3JoahmIDYJ7xUJjiX8YbWYpwvJI3jN5ocu3056kJXLDvZaPHxAOf8ZlSfW/EwjCNXTDrS9ehGeug86SEAjsRsemxQn0ed+zdal0XbVQRV2aWj9y57ZbiaVK+IMS+x2Osl/BJKvQ5qQyMVxx20QTA0KIGq/k7IXoX129JlJgBeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=eY26IJRN; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eY26IJRN"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5f624291db6so9148035a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 11:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746556760; x=1747161560; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nCBDi58Txc/os7kJTAWaxmXvvyTt49JjrraeZ/2XGCw=;
        b=eY26IJRNg2Y+TyjiuLHj6wAt+XFOJj1slLkXMutRL7vtWVmiiuWc5qN4wS4kDR42ty
         k07NIU0aXI3sbOw9+hDjoNdBDx1c5iefGTxWFfiYQMIzuOhDBjT4azmZNLUclzNqATLN
         q5i6ul//LFFYoe7bde+MBJz4sg8W+zfaSjqaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746556760; x=1747161560;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCBDi58Txc/os7kJTAWaxmXvvyTt49JjrraeZ/2XGCw=;
        b=fIO0BPsNPodo7sgkJDkVbM7X52lJGQ51CjH+nCjtw3JzG4+CYYnEh4LgMfHrCox/Tc
         npfYz5XGzyZ2c4aUruXTkkyKeF4xjGHxEMpqc86yOlGbAFphi23SjG0MXKkvq3ZDFoZM
         ej4HrN4c9VRRR1sXQH3MKZE1SsmAvHpl42XbMr4z7doAUC9Dgczo3/FYUjsRvjrgyJZv
         tmIlduPqcWcawCWc5K1dT5sFsiX29FzJiEso0I1y1SyDKHH43hO9EZVK0RetuMEeQM+O
         5NfYtiRMh7WW2ROfFJSgvl+HBdjlPBdl/CU+mDfDxqTMxfwAyUu/ibVFqYR9Y/WG9/Yf
         P4LA==
X-Forwarded-Encrypted: i=1; AJvYcCVAcrT8ChTpGdMMfBWGQ7pttXJGWn9iSPh3KQVImUKBoneRmRSSySaloXW0XTE+nZlFUSZQfAkDh2Nn87c=@vger.kernel.org
X-Gm-Message-State: AOJu0YymIKOphlsFWj7Y/7wow4GlviPLzrtx6aH+6gXVvNUlraHjVawW
	iwr4XGEZNGcoWixmJP1ulwyuBxs6Q2es9j/fYKY3+QemsIIqWA+ZyRVDPxTjRWXIOywfJZXkUpY
	NlnY=
X-Gm-Gg: ASbGncsEBBhTeEboxld+dcZBEK3NeuVrJrt8B2enDMJPv//G+whfNgTORCrQlUKf3B/
	zHgXpqP4jLN0U/c2gtBWy5VaTa2pPp9stpMopuV26y9YnMYUq8dhQ3X07kGixz8u1KPpFWUw7Ri
	kkCAlTEB33ZvkyJuSU6v2LLoLmPPqIb/lZx4bYPgNN7fDyeWFnP/Dvp36ncWVFLJgwMxKnfAfCE
	wfm348B8kVBJ1jxsWLs/xgv0Dik+Np4ea92Eutkf6eXQLGStq06Uoqu788QL1TKad1aK7S0ui2V
	9iTpNyrVkFQVlUlm+224OsL2uhUrSSmUpiJTesyNKfCqRSNpH8Stpw65YQ5dClv4RgpXXcEZwSJ
	VEPoz7i3dW47V0sFcSPBaT4KALQ==
X-Google-Smtp-Source: AGHT+IHJtBzpHR0U6zVmCinms1QNB+BLajxUAxZkRmwHhgmuYdyM0CQtz+lOD3LwSn4c/sqbly1fBg==
X-Received: by 2002:a17:907:8a8d:b0:ace:ed3b:285e with SMTP id a640c23a62f3a-ad1e8d8971amr48631266b.56.1746556760137;
        Tue, 06 May 2025 11:39:20 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1e26fa7e2sm93773566b.97.2025.05.06.11.39.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 11:39:19 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-acb415dd8faso905330866b.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 11:39:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCoOUwA9qEJFy6mZOz3Jpq0oOq3qObviDhbAqOy501Z/riY2INcopy6cYbMgyEI1Jxs10/WQ7doT2mbpc=@vger.kernel.org
X-Received: by 2002:a17:907:c201:b0:ac7:322c:fd0c with SMTP id
 a640c23a62f3a-ad1e8d21c55mr46895566b.40.1746556759040; Tue, 06 May 2025
 11:39:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506154532.1281909-5-ardb+git@google.com> <20250506154532.1281909-8-ardb+git@google.com>
 <CAHk-=whrcutH0LcMmaeJxxMeYpw2R5T80yoQAXbrRHNSTCB0Pw@mail.gmail.com>
 <CAMj1kXFSae=stazUv8doka-zLOnDdXXR4ASxHKe5f97ikg3V2A@mail.gmail.com>
 <CAHk-=whxP5Ywpv-U=2NPFhk929VHB9_kdp10+HFJQ4VxEGdX9A@mail.gmail.com>
 <CAMj1kXGwYXXpjPgDwjKMEZJkuGJ8ZuCpMpc7fTvo58PNtu-czA@mail.gmail.com>
 <CAHk-=wiz5oXq2f_87hHViN2TZQO9VHpaWb5fWWGJbUWQw1ChVw@mail.gmail.com>
 <CAMj1kXEtW2bAQK4hN-S5C=Po5dk1q14+GJjzEJsjfz9OeOMoCg@mail.gmail.com> <CAHk-=whRNPK7hTtPYh3SEe0WXEHR=aedc3bc-y_e08ujOxmgJg@mail.gmail.com>
In-Reply-To: <CAHk-=whRNPK7hTtPYh3SEe0WXEHR=aedc3bc-y_e08ujOxmgJg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 6 May 2025 11:39:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj9jR8HVOoEsAppFCGH0BcRCY6CrVNUFpeSswxD3Ho67Q@mail.gmail.com>
X-Gm-Features: ATxdqUG4rggI2tT94lfI8HbAA-QaCulJTZ7QfMP-gOY2Oc7jcYksV_Mvu_OkSk8
Message-ID: <CAHk-=wj9jR8HVOoEsAppFCGH0BcRCY6CrVNUFpeSswxD3Ho67Q@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] x86/boot: Use alternatives based selector for
 5-level paging constants
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 11:17, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The early boot alternatives code fixup should be really easy - no need
> to worry about IPIs and things like that.

Actually, we already run the alternatives fixup before smp, so I guess
we already do that.

But I think we could fairly easily add another section for early boot
alternatives and just use the existing apply_alternatives() for this,
and run it long before arch_cpu_finalize_init().

No?

              Linus
