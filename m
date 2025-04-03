Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C1024EF7B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 16:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743696394; cv=none; b=Klzd9UGNvK5yAA5UQgVqJ6Y9tcU2NobQn2SdAl33r3s3NHixctScXYP0DNYpcN0OShcrsrUraDjUHI6dz2W6mABKVEBZCTT3q/HagIQQNUm6iYqDwRoBQ8KwEvcUwhF4BPf1I+yzueGI9Wy/aChhKDfyRpjWGCxNXHWs4ebFN5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743696394; c=relaxed/simple;
	bh=rrhANOPG/mURHbTGtrf3YMdkKB3nTA2YvICGzH9Kpbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BVCka1xKHBFbDOXkw2UJtKjQvrvZjuX7Tv1ylPpASOBiW7qYuLslK+ReWMF7CJ8W9I4FumsnmXkqpL0GV94FUmYtLlgmFVY0ZJ8Rk5wwMR0XQb5i0GrtTQP8zUbr18GDUbBcxlTLK6TB1aoOcmR45DMhOVNNdngdp+x4DPyK4S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RmVlYlKe; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RmVlYlKe"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac298c8fa50so181457266b.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 09:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743696390; x=1744301190; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XPVI13HQrunGU/IvN8XS/1QE+4YARD/DsjfX5tTYxjw=;
        b=RmVlYlKejb4tp0sKTn9hSfNLBzkllQpfbdCZUha91cEXWqrC7J3R9BzAaLA7H76zMv
         KzkuNNEBbXW/Qzb7e29Jo5lBKClbllzRirc4CRGdrQUM8KjBMcSTIrqdKwp4tOZYIveC
         WjLnmINqsm9bssy/yq9L0XwyN+ubSpTUgIyYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743696390; x=1744301190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XPVI13HQrunGU/IvN8XS/1QE+4YARD/DsjfX5tTYxjw=;
        b=aIGd9pKSqt38ES/32Ex0KrDq/tzOvFge4hjru8XaGBhznJ9dS3vG2ttnpOuvInMXxB
         253JrqO4auCKYoxEjLV8yKgML8lFaILBWlU6uQPq0jDPo8fORCANTsBymJAJDkE+Ru1s
         GCk8NFEnL9z14rzV/iiY6LIp5DJTZo6R0fMaiH9om5N7EdUShuh/NgL2tqAkywjwABbG
         UOBzew286F44ZW/FAQfOjw1AIEJ1CW7KBFLufai3epPRLeTuIeG9+jGGtJ579PwTvwef
         fdJqjAGzji2ZeF7hWmG6ulNsZPtgKaLTA6C3mT2gE62yOk13iegAoOzfTcD6c6YEpejV
         Ts4w==
X-Forwarded-Encrypted: i=1; AJvYcCXUE3d2ert+YHJUB/tlw9vnicNpM0mPresPg1TxTJE2Um2IiWcC2RJZTRL2DmMSor/Auw2JlnQQjzIFkJY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh0OPYxrmo0MANK1s60s6/B/4/muGwPYRRtel6BYsTXhfGK8BL
	7JIeZKx2XPLS4pAwhO3wNJg2g3H4Kpgn+Apt4AnLTiQpuMpL2VD0nu+kYglBi0BVB+8LmLvNRLw
	cZr0=
X-Gm-Gg: ASbGncuFqTBnO2zfPSc568hjFAyho7K9wYZWF44+fGeYVDI9dhk3QO7tkHhux5lBKpW
	8X/LN4xWicuvKk+Us7TJJPF7T0VWm19GOD5mNVxWBkJY/QRME93PQbUi5W51DVYnommeb4DHh0u
	OprwqIlZJbU5bucWu1odeqXAvy9PpRo/YG7WKmQTlxP542qCgoT4OGIDh7u3xSC5OR4wMSz2oja
	d6cbmZ89NkJynXRqS1IQgAKEfS6U5c40OFUnQpUzwU4CXH7HFqfGQR4ief/ilMbxhTbje9LiNol
	2SS2ToYXj1YWJK1YKF1eAJPBlSrkbZ8/PSFLrRanMQeArLiu/pgk2ysRItwvbI5cRphait9zkoY
	B2/oE7bEMW2C1eq0hYXAsGWh/doWIUw==
X-Google-Smtp-Source: AGHT+IEjetBh5hDIC9bE5S1ss+O5S3H7Gk13DAiNIK+FCKVasvNoan8SIN+HqM3l1aJ1EQJH6ujpmQ==
X-Received: by 2002:a17:907:1c27:b0:ac7:391b:e684 with SMTP id a640c23a62f3a-ac7d19fbafamr12613466b.58.1743696389812;
        Thu, 03 Apr 2025 09:06:29 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013f32csm112608566b.104.2025.04.03.09.06.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 09:06:28 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so1796260a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 09:06:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMXoCelcY9xnICJMj5rmj3tiDsfswVX/rYudgkJXqrmWHv2iwkq2Cah+svf0Gbfv3vB9APtaLtg38RBpM=@vger.kernel.org
X-Received: by 2002:a17:907:970c:b0:ac7:970b:8ee5 with SMTP id
 a640c23a62f3a-ac7d17d1cb8mr16085266b.27.1743696387758; Thu, 03 Apr 2025
 09:06:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z-xFKa5hiQ5urVwS@gmail.com> <CAHk-=wgqa0B9OV+EAQ34-VOUAeVB2o2bXnZXQDG7u+Z=4Cmw8w@mail.gmail.com>
 <n7p2rtrq6vvfteu5szlubng4wj6akgn45suekjdxojrpuxr6dp@oxjfxawkv3xs>
 <Z-6gyQk2WlHc4DNw@gmail.com> <aanudixqjhm7asrp5tzsx5vc7pctei5bskdhdxk5up2g6gvqbz@z7owxfn6krgt>
 <sqn3nlc6q26h5dnwnrsikg3mthxv4o7litoilsgufq4sdhcfqd@hp4goo43hdof>
In-Reply-To: <sqn3nlc6q26h5dnwnrsikg3mthxv4o7litoilsgufq4sdhcfqd@hp4goo43hdof>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 3 Apr 2025 09:06:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh2WtMskQ7ASnDJ_n0ZJs4hueEXsurwQpEvzmx-aZKFag@mail.gmail.com>
X-Gm-Features: ATxdqUH9TF0VFn6lpqQlCGjZDLtfDBGhFWPb8_gd-ivzU_3OWn_1FdBtxvqg61U
Message-ID: <CAHk-=wh2WtMskQ7ASnDJ_n0ZJs4hueEXsurwQpEvzmx-aZKFag@mail.gmail.com>
Subject: Re: [GIT PULL] objtool fixes
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <a.p.zijlstra@chello.nl>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Apr 2025 at 08:43, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> # OBJTOOL ANNOTATION
> 911: .pushsection .discard.annotate_insn,"M",@progbits,8; .long 911b - .; .long 6; .popsection

Josh, what's wrong with just disassembling the damn instruction?

It's what objtool does.

By all means add annotations for when the kernel does something
*special*, and the annotation is "this violates the usual rules".
Those kinds of annotations make perfect sense, and are a "don't
complain about this, because I know I'm doing something odd".

So annotations for things like non-standard stack frames etc are a good thing.

But dammit, clac/stac is *not* that. Quite the reverse. clac/stac *is*
the usual rule. clac/stac *is* the annotation.

             Linus
