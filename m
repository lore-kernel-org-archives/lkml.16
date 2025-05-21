Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F69E1632F2;
	Wed, 21 May 2025 13:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747835854; cv=none; b=pF3zXi1NBx92FDxhqllSwJsfAOCs+lwo/JsvL/Fx4oYHZsp8ycpug1gg39+fs9Nn9Phl8CYHZHkUu0G+kW15tEhcvGZJm9/SBRZkVVkOePfZSvc2KLVUTShuOMyJKEklayG3narFQWEsfmt9n2BFAq/udB0v1k+EBcR81AFaGzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747835854; c=relaxed/simple;
	bh=8z2YBX+EFRSuHcRj54L24/zNxbTxIEMwakhOzYSLITA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vo/IkAHIwQRwtgJFd4dxPVsZsovVh5VIHeEGu9qHTsfoIam5e9PdNmBLIiXbG1R7VTmPBWgWaSGqH+3t/zQQZ5LdiiSJCDqsWuC6qpzZwmDtxFiJ9H44Wr9n9WICGS7zMLm9MMGhi1ygKxGLPVI8LvRNQRX8JVvCUNDY/5ZmfYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VhGDSGFu; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VhGDSGFu"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b170c99aa49so4611009a12.1;
        Wed, 21 May 2025 06:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747835852; x=1748440652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R0+1gi/Kvs1Gh9UB+OHBczCRkWyKK7CTayIxCJ1WI6o=;
        b=VhGDSGFuV3/ga7/g+hKcgeheVv1TK+9JQ5mDJri0vemTWwl/bExauGSCznkizPekU8
         aysJ6gYje7etHlo1rIdK3eWDRUa0lkc/EJ2YXapR95qg0J8K6zPL4lqdvzpWOg5oOTKD
         VVQv0eaQiuT2IIGYWY52fep0cKwNYvxdPnPI7bIXc4JxTIn2Fj4xE53uqnvsD/b2/ER4
         2+DJiD6glvn/83AnUsDo+8FAt8uDKWbVgIDVP5dbn0m2DytpkkHqVoiwB+YLSRCCZtAz
         dAhzoib6RO4z0zKtFNFVTkFx7SRrGsImsWFMx/4CiQ891mOhZU27gi89wx/neklF8jtW
         FU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747835852; x=1748440652;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0+1gi/Kvs1Gh9UB+OHBczCRkWyKK7CTayIxCJ1WI6o=;
        b=hugjRebiMph57hDoH4niUg6oT9EAS3dRWC3CBJRUDI+51b6oQntMwIZjXCyhQWrclA
         z2vVA7wzrTq85HtkLBGJtTcQN+5kaMdJp9Kt3XIoANmjphWjGib4U22ZZg0kR9eoT6xf
         l2RcyDvB0EC6dMMR0aEmLm6wCZcbUNsT1A4d4ihureHIBdZskgskXH6UIa5ah99m9P0B
         xCkPCCZYiEL9gUhfk1s6yaC6/pFRy13BAC0WP9UoxDz3oQrnVpF60slCai2De8wsIYVS
         1Fkq2ZgogN8f07r5bVb9UPb6Na3UgpTAJQtN67522UlckRwBVbphJZ2ivAeOxG51NQOE
         9Raw==
X-Forwarded-Encrypted: i=1; AJvYcCVBFxOHQVx7QYrPNJDD2MEEVjh4S4Wsl1ewHTN2g0zg/eeE7FnOVCwZ3l1Q1H90BxX2ETcRpWowfJqkGIUakbE=@vger.kernel.org, AJvYcCXENf7tLtwl+2/pcjCQs3UQP/+oyFvejfxbq2Ghva/C3mC+qQMCKMRw0XbNKHiNCMYuRBVavV/jUQx5ba4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvk8JSCtS1dwyWTO0ZuWoti2uCa1wFq9q1KuEE1/7LQ0iZmwYr
	8ir0eXu8q8BUlYwG+z6Ix+Xe+1OsHH7yimbwozWc2qXZzH1cNSj5q+DP
X-Gm-Gg: ASbGncu1Wzl8xI6sPGf4w5eQVGDSCTdXGcVOIWrvG29hKkkvXJCGkow8U7vCp2Pvv+Y
	pmoTKoxtUp0bflYd2nFEdBGfTYcfnImDd3Oap2MOF+swYkmQ8XS3TGQlNgNYZ2gzBinyXNm4t30
	hgBf8MBXoiMUm+7ee/ct9GsIKYDCddp/1IQs+VR1E1JylKBuLmNyX2XWia0+7UJumyUpfFJy3Bs
	2HUoJo8XGP/8z0gC+KOrsCINlyXWNauQx8xhCD1vvitpBSfPPnG+Ddi1Tb3o8bt+VB0OVNJfR3k
	SJd9lhePzN+398eJ32v8ED81EI/kxQpTGppqF8qAFtOdQj+68Olb/C1uYLP8x5KCjnsNPLBiLPh
	egjqCxRhaiynde0+vulhjtw==
X-Google-Smtp-Source: AGHT+IGVi9s0oTxfVW0Z7RPZndmVIwVFJ/m8Ijk1ItkxPamjzeLF2LcDH9LTf7a99UQYb7PJGtnwPg==
X-Received: by 2002:a17:90a:dfc7:b0:310:89e8:c7ba with SMTP id 98e67ed59e1d1-31089e8c7e6mr5867279a91.2.1747835852438;
        Wed, 21 May 2025 06:57:32 -0700 (PDT)
Received: from ?IPV6:2601:644:8500:5dd0:864b:f5ff:fe5c:59a5? ([2601:644:8500:5dd0:864b:f5ff:fe5c:59a5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365d46ffsm3659347a91.25.2025.05.21.06.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 06:57:32 -0700 (PDT)
Message-ID: <d6515a2d-7986-4b53-a655-869d568d4081@gmail.com>
Date: Wed, 21 May 2025 06:57:29 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: Fix rustgcc unknown argument '-mno-fdpic'
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: torvalds@linux-foundation.org, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Christian Schrrefl <chrisi.schrefl@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>,
 anders.roxell@linaro.org, arnd@arndb.de, dan.carpenter@linaro.org,
 laura.nao@collabora.com, lkft-triage@lists.linaro.org,
 regressions@lists.linux.dev, Nick Clifton <nickc@redhat.com>,
 Richard Earnshaw <richard.earnshaw@arm.com>,
 Ramana Radhakrishnan <ramanara@nvidia.com>,
 Linux Kernel Functional Testing <lkft@linaro.org>
References: <20250520-rust-mno-fdpic-arm-fix-v1-1-44e77fe6b2a1@gmail.com>
 <CANiq72nUFqM7mnpSGZF65n3Aak37KVVSa0d830o31EuZyh+OfA@mail.gmail.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <CANiq72nUFqM7mnpSGZF65n3Aak37KVVSa0d830o31EuZyh+OfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Thanks for the patch!
>
> A few quick notes -- I hope these help to explain how it usually woks,
> given what you said in the other thread:
>
>    - Since you asked: in general, Linus does not take patches.
> Normally, patches go through some relevant tree, and then then
> eventually sent to Linus. In this case, the Rust tree would typically
> be the one taking this patch. Please see the `MAINTAINERS` file.

Hello Miguel,


Oh gotcha, yeah b4 inputted the correct To: and CC:, I just moved that 
all to CC: and directed the patch to Linus since this was a bug fix. It 
seems the regular flow still applies. Sorry about that!

>    - You cannot generally send a patch in the name of someone else
> unless they provided their Signed-off-by. Here, neither I nor Naresh
> provided the Signed-off-by as far as I know. Please be careful with
> that! Please read the DCO and the rest of the Submitting Patches file:
> https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
>
>    - Similarly, in general, you should be careful about adding tags
> from someone else unless they provided them or there was an
> understanding they meant to provide it (e.g. Tested-by). Please see
> the "Tagging people requires permission" section in the same file:
> https://docs.kernel.org/process/submitting-patches.html#tagging-people-requires-permission.
>
>    - The chain of SoBs has a particular meaning. For instance, this
> patch would mean (as written) that I wrote the patch, and that then
> Naresh carried it, and then you carried it. And if I had written the
> patch, then the Git author should have been me ("From:" would have
> been added by Git). I guess you may have meant to indicate there were
> several contributors -- that is typically done with e.g.
> Co-developed-by or Suggested-by, depending on how they contributed.
Whoops! I didn't realize that's what that meant, was just wanting to 
give you both credit for that. Thanks!
>    - There is some repeated text in the non-commit message part of the
> email. Also, tags are written without empty lines between them.

Ah, I see. Usually b4 likes doing a cover letter, and for single patches 
it appends that in the commit itself. I'll keep that in mind moving 
forward. And thanks for letting me know about the tags! It seems like b4 
generated that, so I'll manually separate that from now on

>    - Ideally, fixes for build errors contain the main part of the build
> error message in the commit text so that it is easy to match it later
> on.
Ah gotcha, I'll keep that in mind!
> What I would have suggested to do in this situation is to ping in the
> other thread with a normal email (similar to the one you sent), asking
> if Naresh or someone else was going to send it, and mention that
> otherwise you are willing to do so (under yours or perhaps Naresh's
> name).
>
> I hope this helps!

This does, thanks! I'll drop this patch for now then and will assume 
that Naresh will eventually send it. I was hoping to get this in by the 
stable release that is set to happen during the weekend (doesn't excuse 
my sloppiness though, sorry about that once again)

Anyways, thanks for being patient with me as I learn. :)


Thanks,

Rudraksha

>
> Cheers,
> Miguel
