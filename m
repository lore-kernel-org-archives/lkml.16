Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800EA1A23AA
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738866970; cv=none; b=Tla9U7bltcynaG/EjG6CZX0P0o5IiJRvslerrZaSKnq9T4Am5cy679/c4Bf25Spgcr96hFOszjsEiOYoqnw0arhqxq7iKBJpKMazWyoJxHglkSjmX36JNlIn5PgJqLapgI8W4DtsPEFGWq3uYuaD9ZLf0483Uq83RKvokKvJiYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738866970; c=relaxed/simple;
	bh=XTtCsosQEph3LuXBO/+5t+Fd3rMoQlxmqBU26UEMH7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fum8A/Sv2m94vm25DAZwleGJaaUdfRXQeMFrbVsNsnB9dra4pWzeYHETO3qGYS9Qg0kJ50oUPeTurk0oiN6fUZ815O13AJ+EOiSemHHWQDcFKQS4bV5IeAhD/+Uwnu+OPLEEtKe9JmI3ASWpele70r7e2aduaLkE5uo6wB5t2fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WD8U08fl; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WD8U08fl"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30795988ebeso11532851fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738866966; x=1739471766; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jXKzpsp2HF6ajtmLJiPFASdUjXub2sfdmB41yGqFJD4=;
        b=WD8U08fltg1I642WEZtHPzK7j49kzg7X6qlDTeHVjfUiOomUwMPhmO6FV8EqxjTFr8
         bTyevKgkVyqbFvvk0NMIjIQmKHlwBkZ7o8l12GSojBs+yfI3aKx1vQYW0MEBZnVITuH2
         568U8zi2f6DecljPj4yDJUjuWR3Kgm+Qk5gr/uTdW4dpPEKb4lvbWMbM9qoZIIWrpEj9
         USADA5smMhySCZDo+xf1ve48l1Wpw/FXPTnjYiaOHH6VRht78D09AUdRnZ22r4W/6UzR
         1UF6KTAQdRsZZ5Z3B7UMh7Bvi5cMPqQxCdBGaxtvarFpIaFAXF+il43DJIFGwknQPPe0
         2Zkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738866966; x=1739471766;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jXKzpsp2HF6ajtmLJiPFASdUjXub2sfdmB41yGqFJD4=;
        b=AvBbNffcWg3FKI93bGA3ElSj089x5FlVOAwyV89wU65EkgplJquRbiD0o48DVGkQ1G
         ZRvDXTN/B1sIbOxY5TAEGf3EbqYPAsturLBr721rKhoB5fKaqv6wjysZaJ0FEJIlRX3U
         3adxV8RcymkqESgOvfyu2gLUaCypDWy1QexovowtaVNn4RYxRBCyxxzkwUDuTqLmwW2q
         hpH0b/cSlt6LrfhoGJk1vOqA9Wa50xH/h5cyrUDNbmwM+cuC22tCYlgl5S59/q/pTgOo
         3KHxSvUTmNGK0IkJWQMq/zqb5KJdmb0kY5EpvmX/mP13YOCMDRL1onw0l5ppfb7B7gPj
         SX5g==
X-Forwarded-Encrypted: i=1; AJvYcCX4jYxNSegvv0QYBO6lJP6qcW/wL/cvMpld7p9b+IhNJ9iDlF3LyayswAVQ3qaOGwTlrjabh//It6pFDks=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYt/2jsRFR1ypgIGHNWXPXtYNzWBeAdxb0b7Q9jUpZyWgciqdR
	JCYj4dnzbpEHVwBT0gAiyG+X0YppyGJV4ya/Qtt27e2A+8V1X/2CbFHlEkjvtiiufu3J+G3NBY3
	2Wge4QQ4zB6UfgqE4b3n54uoKA8qIJVCx5RgO
X-Gm-Gg: ASbGncuYDgPxXnlBt1Rdrhd/COy8SEEaCFA5i+VxmmcxrZ0bVaZ7kXUE8SGdlHfxJdk
	zM1GIg7lcwm94vOBcq7DGM0bAKotHZALBfWQSdBcO2fuAtMfkCnZhXR+DLQaXwi1EQyprD0NTQy
	Uc9TSBR+mpmA1F9y4UiRTEYwGWpLNZBQ==
X-Google-Smtp-Source: AGHT+IF6lI/Eg3OSfG7pW/gQ3oXRIZZ1DQEAknZZLXJRRkowGwOsYuzILwOw7DMrSQ2+uCTp6edKb6GT4vo8jpJvOlI=
X-Received: by 2002:a2e:a54c:0:b0:307:e031:15a8 with SMTP id
 38308e7fff4ca-307e57c7394mr175171fa.8.1738866966472; Thu, 06 Feb 2025
 10:36:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240802061318.2140081-4-aruna.ramakrishna@oracle.com>
 <20250204100134.1843654-1-dvyukov@google.com> <1f3f60b3-1741-4ced-951c-8e103970170f@intel.com>
In-Reply-To: <1f3f60b3-1741-4ced-951c-8e103970170f@intel.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 6 Feb 2025 19:35:54 +0100
X-Gm-Features: AWEUYZkCOGJgbp7k-P-q94mw0_xDb9OMqgvWZyjn7YegC2xWnPKR2iigco-uvuQ
Message-ID: <CACT4Y+Z3suKV=M1zLEfU5SWAmYdLbRcorvsY2UK-CTvYb1bNPA@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] x86/pkeys: Update PKRU to enable all pkeys before XSAVE
To: Dave Hansen <dave.hansen@intel.com>
Cc: aruna.ramakrishna@oracle.com, mathieu.desnoyers@efficios.com, 
	peterz@infradead.org, paulmck@kernel.org, boqun.feng@gmail.com, 
	dave.hansen@linux.intel.com, jannh@google.com, jeffxu@chromium.org, 
	jorgelo@chromium.org, keescook@chromium.org, keith.lucas@oracle.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, mingo@kernel.org, 
	rick.p.edgecombe@intel.com, sroettger@google.com, tglx@linutronix.de, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Feb 2025 at 19:21, Dave Hansen <dave.hansen@intel.com> wrote:
>
> On 2/4/25 02:01, Dmitry Vyukov wrote:
> >> But this updated PKRU value is also pushed onto the sigframe, which
> >> means the register value restored from sigcontext will be different from
> >> the user-defined one, which is unexpected. Fix that by overwriting the
> >> PKRU value on the sigframe with the original, user-defined PKRU.
> >
> > This unfortunatly seems to be broken for rseq user-space writes.
>
> Hi Dmitry,
>
> Are you saying that Aruna's patch caused a regression in the rseq code?
> Or that the rseq code has a separate but similar issue to the one that
> Aruna's patch fixed?

No, no regression.  Just another issue for real PKEY uses.
