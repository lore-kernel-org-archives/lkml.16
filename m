Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB424191F74
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 15:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746460768; cv=none; b=b2lFnbILNPENycK/5lMRvcbthYZuxBMJcj9vJlLmBcijMghycF0NRxCOnjtlWD32i6oqT/FgGkhftvIMRVLnXhZU4ZVJ4c8GlIijV4dgVjZd34dQ6vPn7Fwcoxm5uPIQrZB9ZAKifLNx9NE+968bkk1h34aV4bZ/DZtRyBsmmJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746460768; c=relaxed/simple;
	bh=CZ5YZR8vd/Lu2Ss7P+RG/Y/rSM4qJDC7fiNB+25hNdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s3e0aMGzGOBvGX+JYTT5o2ij4TYqV9J0Gr40/Php9UCWBfcaP4HRcg4AHventaCylaxiDcDeCL40Z02PiR6dIrvPO0d1n+ZR9tJ2yNJ4XXtsyR88MuyBTsd6iYZkIg5m7BPx5A+7ZGExplFG+jNtQxTxI00hyd4KIQrHCQiZ83A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=b0vzDiwj; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="b0vzDiwj"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac3b12e8518so784284166b.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 08:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746460765; x=1747065565; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sOExoN+dRP27L7MNSDgre/m11lglNHtePeOmVgRFcTw=;
        b=b0vzDiwjzIvyPm1ePaSBzkFEi3cs0Yghkpj4K+kPb1CKDd9yOchfQxMsXT6UdNSPST
         beNsL0wve8L9RywMwkO1qFFy8IKtyEwYbIwm3dtW55kNwy5IHz4/Ue06qg8DDYf6KHlg
         ZkuQosS9ua03v0S5RLFVC+/q6szjWvoN43XSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746460765; x=1747065565;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOExoN+dRP27L7MNSDgre/m11lglNHtePeOmVgRFcTw=;
        b=plnH3EgRbe+ceLXIcD4yGsIo/d0drLOk7wuZJxmKVjtjZ5zONbwWeYM9/OMljHWYPT
         ue4wZaNVbkponoSNGrOnKbELEu082Mu3hc0J4YKLbuT9I6tl7ENznTmxrWLHypPYqu7u
         6h6ys/lPYI2Ij0enX/U2QE34HGHdhRCtcsB8W8oXvWUDsiHWFAWv4Njy9fJbSDt6KH2e
         /OA8DdpdN57PZrxZmKEJvVUfXkGD3zqdDieQ0JlgHoeTi19qRhXz6AjMAnPqT6j93Af0
         WtWv/lIHetYARIwpBJawuGl9CaXW2Ppt4HIybb3B9QNbKlV6r+/RRU14Et4rAWrQS8iK
         YbeQ==
X-Forwarded-Encrypted: i=1; AJvYcCW003fj6klQku7o5TkQCoW5QsRJQW1Eurkr44sh+VI5zcs2yCwr8xlHcQ96vS+PF2wZ1tBHYDGEAxEtr5U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7LMr9QGGUo79ClasM/D/2WZbMurfXu9Fwopy/sVqJNw71/e9a
	vF7EI+F7ru+hp2g/ASX5icmIFMcbv/EVoT6STPtEoykUZcMA5BU5yp6VHCcysTZyuYayO1kHz/8
	3pVw=
X-Gm-Gg: ASbGnct4waS1r5eNdSrZfmlwmeLhtD1XffBKP11rtLDYiPEd/zobM6MhPbfaUTImN+x
	JBvBAzDuePjRieRWkDiO4sjwzvVglgZNyQ1uyc/n8orFdNtl+7AaoWvTMMihF3wzf2W0tEbTTNu
	uU+KwLuhgaR8RsMkmdobGk56o6YlSClXm3EckhiR/djpq3ZZrqJdgKkakSnSlgxKKU7hf/1DwWz
	KcII1fkKxqL9HWnJ7zUrrMo/zacUFA/PfCsYNpb+oXzR1JfkzGnaQ+8m+68G9CrAlKtXmX1OE2t
	lvtJLlmMufZxClqaX5Uen2JhLFsJwJ8lQcPQySgIANzZr/l6hpQwiixAu/d0At5d5ORQ+IFaDDi
	JT7ZpJ3udApBvPq4=
X-Google-Smtp-Source: AGHT+IG6E8WvAZ2yafvXidWxb9UV24FN+xjMxEmSo3ldfNHgCoY939AF0Tgru1ZhlFI4QppaoUU46Q==
X-Received: by 2002:a17:906:794f:b0:aca:c699:8d3a with SMTP id a640c23a62f3a-ad1a495a222mr736219866b.22.1746460763662;
        Mon, 05 May 2025 08:59:23 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18953ff9esm510836266b.162.2025.05.05.08.59.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 08:59:22 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5fab81d6677so595819a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 08:59:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX5IM8xcs7AnyBRfOvh2FfE6dB7UMj4CwtjnYRxY+1D2zLgiOcO5kOHLGtSTv6yEDPJgzaHdv77T47xY5M=@vger.kernel.org
X-Received: by 2002:a05:6402:1d51:b0:5f4:9017:c6a1 with SMTP id
 4fb4d7f45d1cf-5fab05c2703mr6698936a12.25.1746460761719; Mon, 05 May 2025
 08:59:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425084216.3913608-1-mingo@kernel.org> <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 5 May 2025 08:59:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wicfBCyMj_x5BiL32o55jqXfnxgn=X5BZZjA-FFER82Jg@mail.gmail.com>
X-Gm-Features: ATxdqUELlF2gVUAMJAU4MGkQVjQnE32U2eG1GJ3_P02IkRENLM28UuhiREB4C-k
Message-ID: <CAHk-=wicfBCyMj_x5BiL32o55jqXfnxgn=X5BZZjA-FFER82Jg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/15] x86: Remove support for TSC-less and CX8-less CPUs
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, 
	"Ahmed S . Darwish" <darwi@linutronix.de>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	John Ogness <john.ogness@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 May 2025 at 01:53, Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
>  We also have platforms that lack atomics, let alone double-precision ones
> and they're fine too, so why is x86 different?

So I don't know if you saw this thread:

   https://lore.kernel.org/all/202504211553.3ba9400-lkp@intel.com/

where I initially thought that it was the lack of TSC, but it looks
like it's the CMPXCHG8B code that ends up causing problems.

And the core issue boils down to "there's no point in wasting time on
even debugging this".

So basically, the support for i486 costs us more than it is worth.

             Linus
