Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FF5195985
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 18:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743620213; cv=none; b=i19srPKW/LXl7qCWopshlXqWYnmkOuRrJ46q4UXm1C5ArxyRDFzCEs0T9n8klej8KVvXJtFEEbHGy1P9HXKfSphR2HbyBoNQGD0XMjQ+o8Dx4bDTdYekE6Iufukb0CYxnl8/RLAZWXkeKlzuWZGmULftggy6q+NEY4tDBnwlB3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743620213; c=relaxed/simple;
	bh=wwsSS1JZOJ1V9xZomLo12YUzYojC76SUgcPHLSSooOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZU/Hbr0VNz1ldLv9CkgJBOW81F4Xdaj16OcBEbrRaUKzWCddADRBPod9cicGO9AZUjIF6hEv2uPtoJ7I/n6F27V6L3OIOSwdI3lfQj5hSzvoGftISuGckJY/eTLdUZ1csgv+MwI2qJjaTGf2GFhrJOJbzQYfRv9OUX7lPqNS6h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fiqer87X; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fiqer87X"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso15311566b.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 11:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743620209; x=1744225009; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yh1jFp7ObhLBDGOSbL83dYMEFRG1k6cE2Qucdq1E4jQ=;
        b=fiqer87X6c1F4hw/5EGL1TcMxK7EwSCmd3jmlIsGAjuPUIHGp5vb4E/c/Y5UfztgVb
         uxGUPb1V8HfCSqA/EwQAqddCBL1GOkEYdfU7VRqD00ZuPEuV5p8ROaCr4X/6PV6PVGwU
         DnIQFrhD5AX5vF9sGAbGK7cN/gKp3TIDe26eI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743620209; x=1744225009;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yh1jFp7ObhLBDGOSbL83dYMEFRG1k6cE2Qucdq1E4jQ=;
        b=FylP1oqfUHw/H+QBXPDd8jplvH/2ltAl7mMdBDDs0F/5NAnCb9XAj+mrtLai6K6hH7
         Qj1GJO+NBjhhnqzkJfA4xXTZFFfAXiH2UMYYU690tOzcttJIi3NhIzK/uqHuCJt7O68w
         dvXWAL0vweFU9hDBC6u4zTRZGuJ7kOPZWIh0ue4ZZxNGN66rEdLPGCWq+UCSulYemInt
         Mi98WDrk8/G2F1g1+Fpr7RLkGpGE/NcXaKxOooKzXB1FxRpCdYnG7VCodGLnonUmd+ci
         D/GKl9RbAEPqZwN17AhCoCg4n1yEg/HbfAqLB1m0G3Z0gd2TN7vCsgK2lxBe4ByTISDU
         MuSw==
X-Forwarded-Encrypted: i=1; AJvYcCW/r7IytXFviUGQ/tkm3C2B5PsQYeK8GLJcVvwNcQMi3Un8JhFwR5qM/5+YzWWK/ktqC70opLj1LfzXkd0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt3hQetgPfdP4qx9iu/Is2bFxk5fIjduZPdp8j9ywxk2wnKg4Y
	ryeMEMn4s0RV5rSsT827PLB3lMXZSMt36LoOxyL4asRLJ45EsO5pn3vhWx3T5E52jkOXLCH8uhP
	Zw4c=
X-Gm-Gg: ASbGnctB3T7WwhPctt2AP8PdXrEISowMFdoQjW+PcfRm5BIo2iqDZVjffSNFlqWbHoi
	f/uahgzWfS6kcVb5C6rCT4pPnYi4gm8SqzR913TFT574nEXx5I426nud7fJSHHx1QtJytW9e8cl
	/xeUGu8j9WKsrj6Py9bHeFwt9KHRaEaSVYOR51UokeGOT4rKNzI8/Qcpm92P5RZtI6k7oW4ZawL
	M5c2JcDhc/+lY7ksdYWG+yxsZssxCdb5F67xptLD1HkQ4h2X0NkBQvWXwTv81jzpb1xtXaOvuBR
	MsV7AFX+FGqTKiVeJ1qPplTtYPQwg5Z6oUtXpVWIT8uZatswU8h+S+Ows5smG+4jt6NkSNBq3je
	eraxL3PGHgFaj8NMlM04=
X-Google-Smtp-Source: AGHT+IE/mfIDh0K7x5d3aIuol2wI4B87U2Xc+G6KAFf/anYB4XvpcOP6VeGqq95KHjFCRACK9eRGvQ==
X-Received: by 2002:a17:906:8465:b0:ac7:3916:327e with SMTP id a640c23a62f3a-ac73916334dmr1312722466b.61.1743620209446;
        Wed, 02 Apr 2025 11:56:49 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac719621b73sm950753766b.120.2025.04.02.11.56.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 11:56:48 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso20281166b.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 11:56:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXhWTCMOsRIZhscfkcqdV52av6Fw5bOm3Ib83I10q2pqP/qHQfqWIOrUyxuqk+B8gJqNDBtn+RJgHaaU0M=@vger.kernel.org
X-Received: by 2002:a17:907:9708:b0:ac1:fab4:a83 with SMTP id
 a640c23a62f3a-ac738a50828mr1664165966b.25.1743620208069; Wed, 02 Apr 2025
 11:56:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGudoHEV-PFSr-xKUx5GkTf4KasJc=aNNzQbkoTnFVLisKti+A@mail.gmail.com>
 <948fffdc-d0d8-49c4-90b6-b91f282f76c9@citrix.com> <CAHk-=wg4syfXPBgQhq50ePOnB=zP9Jk1U+GmjXWmDMwcQ7X7WA@mail.gmail.com>
 <e0021746-d43c-4c45-83b6-bcf3982b2548@citrix.com>
In-Reply-To: <e0021746-d43c-4c45-83b6-bcf3982b2548@citrix.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Apr 2025 11:56:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjYrfUDOd3VYhn8HvH7MCnampXt1TdtaXo86UDrT_rbMQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrrVhUnMsUkzWzSSax1GicAp9nGS9Vsx6_O3y8isGA3p7sqzHU5bmX7gZs
Message-ID: <CAHk-=wjYrfUDOd3VYhn8HvH7MCnampXt1TdtaXo86UDrT_rbMQ@mail.gmail.com>
Subject: Re: [RFC PATCH] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: mjguzik@gmail.com, linux-kernel@vger.kernel.org, mingo@redhat.com, 
	x86@kernel.org, "Peter Zijlstra (Intel)" <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Apr 2025 at 11:40, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> You still want the compiler to be able to do a first-pass optimisation
> over __builtin_mem*(), for elimination/merging/etc

Absolutely.

That's literally why the kernel ends up using __builtin_memcpy() in
the first place - so that the compiler can turn the (very common)
small fixed-size cases into just regular moves.

The function call would only be for actual big moves and/or unknown sizes.

That said, it can be advantageous to have more than one function call.

For the user copy case (where we control the horizontal and the
vertical in the kernel) at one point I did have a patch that did
something fancier than just a single call-out.

Because even when the compiler doesn't know the exact length, it's
often known that it's a multiple of four, for example. It's not all
that uncommon to see code like this:

        memcpy(image->segment, segments, nr_segments * sizeof(*segments));

and an even more common case is "I'm doing an out-of-line call not
because the size is unknown, but because the size is big".

So I noted the size alignment of the size in the function name, so
that I could have different versions for the most obvious
straight-forward cases (notably the "just do word-at-a-time copies").

Admittedly my main use case for that was the big fixed-size case in
the stat code, which just does

        return copy_to_user(statbuf,&tmp,sizeof(tmp)) ? -EFAULT : 0;

and shows up like a sore thumb on some benchmarks.

But I've always hated the patch because it turns out that the real fix
is to get rid of the temporary buffer on the stack, and just copy the
fields one-by-one with 'unsafe_put_user()' and friends, but every time
I do that - and I've done it several times - I end up throwing the
patch away because it ends up being problematic on non-x86
architectures

(Reason: INIT_STRUCT_STAT64_PADDING(). Ugh).

              Linus
