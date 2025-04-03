Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF4E273FD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743694783; cv=none; b=n/ZTbBBtm8dEj5r6aFg+vR+VtU8FnuUUa7zNKl6ntv2wI9rkD8uRyYfJ5g8IL67YRFteSHcwAag4eRuFfcobb/XXitHFWwMq+WNREU8nFdbS+Y/wWCdGuIMT2zIOvFztPab5skgR5LXdo7nMXtWgYIGSXx3WoykWUIovgYfAY0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743694783; c=relaxed/simple;
	bh=b9skG9nBHKd4Gc5Ycbis3gQANvVIBMjoDFng4X9wWWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fX4MsHILG9J43VmUZTnKZRqcKFQb5VqMs/rzaUSSJthE0RfIgh0Ii6jEimo8146IeTEHepyhQ0xoO2TCU3M/nGZ/971O4OT7ioeVhwJB3ERKhV3WB8zZVsDomNLaKiVjXdvlV8pjk1huNZHnbEvHDyJW0soKdDxC1C3CoEMwtrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FbimwoI1; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FbimwoI1"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so142902666b.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 08:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743694779; x=1744299579; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iOGdP5E2fmpu+NQu5moIjskhRrIpZoWHEppOzeWmwr0=;
        b=FbimwoI1+Lw4qe6llfNq4jJwNtHGG2UeU78Jx0HcASPIoqo1vbJMdyKLyAwc5ESFw0
         kGDQ+r7B+bJ88j/VANdoFLzQUnjMMa4b6ErmkcS4ZDDuOkb7p0zL1cvpD8vsnbs0j1Qe
         iL4pQ3eE8iYKTVQg4x+60TTRwreolzlDYTdII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743694779; x=1744299579;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOGdP5E2fmpu+NQu5moIjskhRrIpZoWHEppOzeWmwr0=;
        b=E+KZFlOCiBWkRCSawvvgbuWPp+93ZLfovSQ/IbBqs0glTKLlm4lknAdgljYX3NlBvq
         pvOllpz+IYuHHvMeOVCEl0KnnigrGxaIXCi8WrY6Cumb9AJ0bQzxFhv+/of+OIyNiJf7
         +ZrfZ3AFO2tCideseaN2wYqlJqIENcqA2Ts6JdmyXt8y63QjVFaftyBMD3ee5goHwkgp
         Tx5nQd5cwW3DXXa9R9kJIH7y7GHeizi9aEIWhcqEBgTYzHuGEwj5BmRNYG30vycnSNzT
         mMS6f9+wgnOg4adxX+qne+hodN+nGqx3Y5Snc86r3ulnqa4IpKmaBhNPNRH2EQ0MY6Zj
         Ysxg==
X-Forwarded-Encrypted: i=1; AJvYcCXZeOMC/yHXCg6WdSX48y02ZwyurN0v7OU5qKcRg6T3s8651SLOI1Z05DB1bN8jUjUsmCSgJXHTtEyrYP8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe9WStksVdS/y9hYFUMdbhOETOSOGZ7DPgHDY50A29XSfcNPo9
	kCigJo1RxZtRQnkt9aez3uBb2ETxxwjN8ZJ9yI3MeMIj5z5JqGlr1cjCntvkTwTXo6BtzdK0Quu
	tAsE=
X-Gm-Gg: ASbGnctmJzLQKvBS00wIYHBtPWsi4NDqxYa2JE4k1V7uvJ85SoHoML3kZvmfGMH7Ozo
	B84tJ2KNXlBxbNTiu7mpTDE7jjH256TRHIuxRYXfn3Z0lx5HPfVYcNH6SNjC71xbQEb8DtnNkde
	LvED6XmlCppHhBdhG+euHqVzcX/em+gnmPpKATvat3P9jwda8Yk89776qA1zX2gAllvZn+zFZbU
	ECo4oPjRuopgM77aCpZBp0fbQ3ByVGybigNdGRxrr/X83pLPMeZCGr+beBpqs+3r5H67R+yXZaQ
	5/ufKONd6HHvF2CLrRQuyLoHGBJOQnvH4YcFSJF61wfOaq82n8XJd5hfwNTHUZORcXBJoHmq1gB
	Sl+7/i1DhuhvL7UaIQN/zJYv7HAqN1Q==
X-Google-Smtp-Source: AGHT+IFk/CxEs3aZiY/ZlZK60qrMptY+ss7pNb0QMhIg6MEsFG3E9rbO6CfSUNnWh+Edv1dwK97FbQ==
X-Received: by 2002:a17:907:2d25:b0:ac7:16eb:8499 with SMTP id a640c23a62f3a-ac7d16cbee8mr6061566b.5.1743694779399;
        Thu, 03 Apr 2025 08:39:39 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013e5a8sm108106666b.88.2025.04.03.08.39.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 08:39:38 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac298c8fa50so176353366b.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 08:39:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXyEbebpP/Cf2RAkpjJWvBp694ntsw5qA5eLISgzAXvFQ4Xgvuchay2mYHO83x5mvIX2PM8XySTq+c3uI8=@vger.kernel.org
X-Received: by 2002:a17:906:7309:b0:ac2:88d5:770b with SMTP id
 a640c23a62f3a-ac7d17cb469mr6072866b.25.1743694778335; Thu, 03 Apr 2025
 08:39:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z-xFKa5hiQ5urVwS@gmail.com> <CAHk-=wgqa0B9OV+EAQ34-VOUAeVB2o2bXnZXQDG7u+Z=4Cmw8w@mail.gmail.com>
 <n7p2rtrq6vvfteu5szlubng4wj6akgn45suekjdxojrpuxr6dp@oxjfxawkv3xs>
In-Reply-To: <n7p2rtrq6vvfteu5szlubng4wj6akgn45suekjdxojrpuxr6dp@oxjfxawkv3xs>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 3 Apr 2025 08:39:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjj6=zScZ0UPhRm3tAmEusLmc0UKvD6rRqq7ZpPezJsYQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jq9zknrAEWrRR3fj0y-FJ3NBdG1_HP1faI9cVU-zqrp1rQuWK5QVyuwfvY
Message-ID: <CAHk-=wjj6=zScZ0UPhRm3tAmEusLmc0UKvD6rRqq7ZpPezJsYQ@mail.gmail.com>
Subject: Re: [GIT PULL] objtool fixes
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <a.p.zijlstra@chello.nl>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Apr 2025 at 01:31, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> Ugh, fragile hard-coded special cases like that are exactly what we're
> trying to get away from.  They make the code unmaintainable and they end
> up triggering false positives, just like the one fixed by that patch in
> the first place.

Josh, the "unmaintainable" is more important for the *kernel* than for objtool.

And the whole *point* of objtool is to check the object file and do
those "hard-coded special cases".

So the argument makes no sense.

           Linus
