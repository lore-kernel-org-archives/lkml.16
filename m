Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34DA2222C2
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 16:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748882311; cv=none; b=nfeIelxSUY+6v/QTalzO1KOAl9R1QUch4VEvhy1A1CyrqaAsLI1SLjfZDdOxguzEIo1eYJlLclc5cySY5SiP/1zyvFD2bZL0S8k2wIK+j27FMP8/4Fjk1uMSsTiDgk/jRAPY0LZqE2698xtpt7NU4oIWAg5l+FqGJMj797I4pw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748882311; c=relaxed/simple;
	bh=bnG5iPo3HwSaDL4fm9oeTibpsEbFGsBs3Rwq7zBxREI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TW6z5NBmU4eCwFT+/KdD41thbU11kWmp/X2Xn8wjMm8W6v4TJEGNBHFPPPEebbiiHrEyjYq0ZG/ujwU3+np/oHFr9r4Zo4CcCaNK5U0co59OV9XbJSw4Ipsoqe+l9wVrtcreLmWAVuRqFbYCWYLPFdXIajP6EVCBvM/uHxMk7Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GsYj4swa; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GsYj4swa"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad8a8da2376so752804866b.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 09:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748882307; x=1749487107; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ve0jVjoVm4UNAa1zq2jlYcjMy+9TmFYLnbDma3YExQ=;
        b=GsYj4swai2LpZSDEnZigVRTlsmDyMLVSD7bJWKp7DAXClCJUGfFLcRCDYTIfj3cOmK
         9dAZmiRdz9Qh0ZwudFht6OBQEweyt86JsH6sksNHa4jc4eLj42WqbMxNOE6QwkCi/5RT
         Sk+Uz8Tnom/MabXB+ckcCnHj1B8tqnQxhioKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748882307; x=1749487107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Ve0jVjoVm4UNAa1zq2jlYcjMy+9TmFYLnbDma3YExQ=;
        b=GCSg3VaJdiBc7Tqfwk5f5nXCG/cIde2J49v5ipWuwx6iqsGzO0NI7BQAHvd959BgtE
         7LQHpZrh0v6s4JuFg2mE3ZVmWeC9AGt8unWGOBpeosyAfeE4tbIUgv4i9JV06XCe8Kvm
         s2BCCq3rUqx4B9N9jx9KONezIHX1FlXxJLXpfOCblBtVnQz5StigbTinoNWjpTsp3Cxs
         o4BTGz4C7C3auFj/HYL1rTB1i3IwrTDYWlZvF3uRqE9UJV+Lo98jvC55LU0XNTMC3N45
         Li0pUGRYturPyZY/A7ksPVfc7PXz284xOtTlK20TquxMZn3lrHPcVXDCEonkcsEIDWwj
         NtGg==
X-Forwarded-Encrypted: i=1; AJvYcCVdlyOHSzUJx8VkxX8wYu5dpqKVCDb14IGVBfObfgoyhH81OEKWOe+vlbA3L7ekwFjlRGER4jiR0RZk1V4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy50JG+qhrfCGV1bKOvC4L5MqXY2gNGvXzkn9tOkK2/pMXux+BZ
	cufmAa+lrBY0FdVQgeRgYraHgC14ZHGttvnUWGKtDC2YJDIBeWZRvF4nHqfsdn3lQAou6VX5Cnq
	WTnidFFwIjQ==
X-Gm-Gg: ASbGncvaNq+Q1u4bOnFa+iXFg01uR033eVIxZgn9wX2/zg0Mwrlr5NKkCDxONnXi8YT
	GeTLyksbuwM59yZ0fxX2ZGkDOMFJq3Kru7bcYTHp6V5wtbr66Zf23Wr117o4lJ9Eaa3XZM5NiA1
	qXSJbTrHQOQnnQwQA50ahFiYKIfg/+BCaDE7iuuKywlcUTf8zvC4pV919SSgPgTM9tmdo998Rtg
	BxADuMz2o5sOGrD3YNdiDoL7VKJK5ztYwjQirLHY2hleNMRwz33NYPcNgFjpQMrT9O/TGAh1mS1
	leoCmdGj9N3VQG122gvyN01fxfAWpwXB2LJFk9TapfJN5NCFaVt8/zFahOjHbI29BiQWiQh+HR2
	lZYFGb+97CdXZfsJxq37r1cJ18QVyjnQzy0k=
X-Google-Smtp-Source: AGHT+IGc5Z3bGUXiUiKz3+vpVfGkb54Jd++/dD/hAZTaTsvDrp6JJzaJFLmrzmJXGkCy5UNA0ewhhw==
X-Received: by 2002:a17:907:944c:b0:ad8:9257:571b with SMTP id a640c23a62f3a-adb493ca4ccmr965155566b.16.1748882306639;
        Mon, 02 Jun 2025 09:38:26 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82ccf8sm812190666b.44.2025.06.02.09.38.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 09:38:26 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-601dfef6a8dso7439616a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 09:38:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvPxtdocCIY22MDsYli0uj+8r+NeSImPbdy9ijA6CfL8cGIifCWdi114e+qoalCzGuoFuT2qXhXbu5p1o=@vger.kernel.org
X-Received: by 2002:a05:6402:1e8e:b0:5ff:fa46:907c with SMTP id
 4fb4d7f45d1cf-605b795f738mr7361957a12.29.1748882305561; Mon, 02 Jun 2025
 09:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602144201.301974933@infradead.org> <20250602144755.928750774@infradead.org>
 <CAHk-=whkD=pveK6X_5gtVbJ62+86oBOr9JokneYpSJyxjHFBpQ@mail.gmail.com> <20250602154943.GB30486@noisy.programming.kicks-ass.net>
In-Reply-To: <20250602154943.GB30486@noisy.programming.kicks-ass.net>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Mon, 2 Jun 2025 09:38:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiYHv2duN1Aj3E5UD3zH=z6A9YpGJ1Mxj_CWL7_FRMKgw@mail.gmail.com>
X-Gm-Features: AX0GCFuvpCkGBoAVw0sdcta4oPa5A0cQ4_MuEqZwMXvu5E9D5nsfPp8D2ElYHCQ
Message-ID: <CAHk-=wiYHv2duN1Aj3E5UD3zH=z6A9YpGJ1Mxj_CWL7_FRMKgw@mail.gmail.com>
Subject: Re: [RFC 6/8] x86_64/bug: Implement __WARN_printf()
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kees@kernel.org, 
	acarmina@redhat.com, jpoimboe@kernel.org, mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Jun 2025 at 08:50, Peter Zijlstra <peterz@infradead.org> wrote:
>
> Yes, it absolutely builds with clang. The inline asm isn't something we
> don't already do elsewhere :-) *cough* extable *cough*

Eww. I hadn't looked at that (or repressed it if I did). *Shudder*.

But looking around, I don't think any of the normal code I ever look
at actually *generate* that disgusting thing.

I had to search for it, and looked at the absolute horror it generates
in the futex code, and honestly, if I ever have to look at that
garbage, I would throw up.

And WARN_ONCE() is in stuff I *do* look at.

So no. I'm NAK'ing it just because it makes the asm look entirely unreadable.

And no, I'm not ok with only using 'objdump' and friends to look at
assembly generation. I want to be able to do

   make xyz.s

and look at code generation without throwing up.

The fact that we have this disgusting thing elsewhere in places that
I've not looked at does *not* excuse adding it to other places.

                Linus
