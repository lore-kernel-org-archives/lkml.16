Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BD324E4A6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743695939; cv=none; b=PINElXkUNaYIaLjWxIHy4VD1CWEhqtpJU2Dp7VrsBahfX0b93FSY5kpVUiHBjlPsU1Pbc+GpG/RAoo76N8XamvjsLTdeCFpx1nfvNgQ9Q9nDt8s7Ql6mV0sjzYdaeGd9jrkItZZLj2i7zMjUNQmX0naIMVAEGAeDeANMN1W9BZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743695939; c=relaxed/simple;
	bh=cY/RFAhcEkUnKb4MwDBSP9iQTmh7oJk/eObJ57TthzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZdSdSLZui7OZ9oSnyLbwiKhW1HIjK5oDvtEPaX/3h0PB6cnX4TqpvfaaSLkzaljZHQrcRvOPbrgBRXT+eMr24Hxt8coMd5YFP0ocbOAQdDdI8BndVLIYeqaTakWm2WLxbZqF44f8tdS8uew4HWe8qZEy6BgS5b9Mol8xvvKvrCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GvDW0Btw; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GvDW0Btw"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e6194e9d2cso1932787a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 08:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743695934; x=1744300734; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AZVWx7znPScRp1RosYWpCK/444f00VsUmeHKWdi2HpU=;
        b=GvDW0BtwgXmn8fjz7lvk9U8X44GvltPnCF3hWdTnC2jxRBGGotDmpw7cMC1qlwaJ+5
         yey2HU9J5YxWiAT8FFh8uhWywmQZQRnST9/PCV2B0jiyXmlkdZCAAw8Y8s3x1B3e+r9u
         OzvuePzPkKbb180rgmVz/snBXRUrP9VyzdxhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743695934; x=1744300734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AZVWx7znPScRp1RosYWpCK/444f00VsUmeHKWdi2HpU=;
        b=gs1s3r/wi+9CWBeUq9xTXX75gGwRvRNsuhCo6NsLrcwnbwfZIBcn4g3qa72vflO9Fs
         K2X9jlcCtKFq8ogF51XwHW2LD2vFMoelgkd37fgOiGzGXI02CC38trnmEh1gsylEpfKH
         y69ZwKClQoShfPiR6bgCDthUBxjYwmddrfuj6Vy2MLfw0cSM6aOml+87WSlpqAAlTgZC
         odPQYCLVWCcpaiam4XJUOFaXJTl2hJIxqpBFnI31l6R6FLaYKKKdLA6XfHHksISDWZxD
         ILhTlZ4LVs4QT2U35B3hXDnJ6jiOBMyJAH8EB98qEh0ZcoxsKX+lAq/kuR1CLDMYGRWe
         k1uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVacyHAPdLpzBH4hmRyY+0G5iCWGqIpbofCcbo0R7ScaiHkFUAYR7Qj/MG2PNDm0Ec+8L+HOC9gNRql46E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM+X+EzLBm/Xq3MpmtQZ2WbOk4OiQpO54+3shhiJY98UvFn+Ii
	/IMz05mrLGg8Kmc47qz/HbUDWYLytiHel1497Pdc2MkjcIZJH9o7mttIFCGYg1NSAtUXHP+An1S
	YtBM=
X-Gm-Gg: ASbGncuUJ03SU+W5dCOXPZ8JqRIGM/db9HmUFCrxDGmHHfXn8cZ6WB4KSejGUjLdeo0
	jnMXschfANiefoq716vh2WF9R0nTCCEMeuMcTYphEWQ5GotE9UWDJDdxb/yARldQlrf2LJB/JLC
	gsskPVzMuzMJtGjuwIpFCsDvvt/jsVLCDfeRYeQPgjFTR8YjMgENIPpsqKXNHx2lEgTdIACbTye
	i7w7N2fQtJbhdsyKHpzX/ZqnszTFvHV6hPfCvA5J+AQ85rfbjGhUKqXwaUWFh0X59IyVEZNzCbE
	ocYhoa2T1tIjZFiD6OqLwNY8DlAMv5EVVenRCLZKZRKdfkz1AWyRTj3k2BCjHBlr1vH8HPDe/ue
	JnX95U5LmLjfa+nbYswQ=
X-Google-Smtp-Source: AGHT+IGWjQsMuUfhEXKkfLBEsy3K/vfYyPb1nS6yNoJ8gEOUi90zbQI3JHwMWdIMpEvzsVF9y/PX9Q==
X-Received: by 2002:a05:6402:26d6:b0:5dc:7f96:6263 with SMTP id 4fb4d7f45d1cf-5f0871e683amr2673377a12.15.1743695933789;
        Thu, 03 Apr 2025 08:58:53 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a45d3sm1116989a12.70.2025.04.03.08.58.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 08:58:53 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so172352566b.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 08:58:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX6SSqMpci+teiLpm71vl8DG/3SPQEm7jXc7CU6cSpI2LMUuSkn3Fvh+/E+tjGm02JC1QvuSXtBe1IJIBA=@vger.kernel.org
X-Received: by 2002:a17:907:981:b0:ac3:1763:cc32 with SMTP id
 a640c23a62f3a-ac7d191b295mr10603866b.29.1743695932165; Thu, 03 Apr 2025
 08:58:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z-xFKa5hiQ5urVwS@gmail.com> <CAHk-=wgqa0B9OV+EAQ34-VOUAeVB2o2bXnZXQDG7u+Z=4Cmw8w@mail.gmail.com>
 <n7p2rtrq6vvfteu5szlubng4wj6akgn45suekjdxojrpuxr6dp@oxjfxawkv3xs> <Z-6gyQk2WlHc4DNw@gmail.com>
In-Reply-To: <Z-6gyQk2WlHc4DNw@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 3 Apr 2025 08:58:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=whYPrtGt6Qk6tregpQ8Xx7BiAh00STY7ne=Zm0NDHg6nQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrTnrIIMhha5s7bxif_hQ53FZjBWTkqvmzxX7-S0qb2cd7CJUtUC453frE
Message-ID: <CAHk-=whYPrtGt6Qk6tregpQ8Xx7BiAh00STY7ne=Zm0NDHg6nQ@mail.gmail.com>
Subject: Re: [GIT PULL] objtool fixes
To: Ingo Molnar <mingo@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <a.p.zijlstra@chello.nl>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Apr 2025 at 07:53, Ingo Molnar <mingo@kernel.org> wrote:
>
> BTW., I do look at generated code, and I know others do too, but at the
> .o most of the time, not at the .s code, via two ways:
>
>       1) objdump --disassemble-all .
>
>       2) perf top's live kernel function annotation and disassembler
>          feature that uses /dev/mem.

Sure, I do both of those too.

However, you are quite wrong:

> Such output is more readable to me:

it's readable for some cases.

But in other cases, it loses a *lot* of information that is in the
generated assembler.

For example, gcc will helpfully annotate the asm output with the names
of the pseudos it uses, so you see things like this:

        movq    %rbx, %rax      # hashlen, __ret

where you see what the names of the variables are (and then for
pseudos that are just internal. you see things like "_31", which is
admittedly not helpful).

And yes, it's not exactly "legible", but it's the kind of thing that
does help when you look at code and don't have to follow by hand what
'%rbx' actually is.

(This is one reason I tend to prefer looking at gcc output over clang
- gcc adds more information like this, and admittedly I'm probably
*much* too used to all the oddities that gcc sometimes does)

So no - objdump and perf is not replacements for just looking at the
compiler output. They are *also* good sources, of course, but objdump
output in particular is just *horrendous*.

objdump still can't even do relocations right, for chrissake, so it
outputs usually just line noise. Any call to another object file will
be just noise:

0000000000000000 <vfs_pressure_ratio>:
       0:       call   5 <vfs_pressure_ratio+0x5>

that's the "call __fentry__" because objdump output is *so* bad.

It's not fit for humans.

I do still look at it in very particular circumstances, though.

           Linus
