Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAFF198833
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743616718; cv=none; b=Dj0pnJeydv+SoX7RAc12CUuIJRy9qy/OXijfzOMGHnnus5mAakA0dG/YmJivLIIr1F8KbVK/kXJ7bxZNTeB3Rc0p3DXwR32z1d1LOBDUZH/aitJT1YfyP5FkG/S07WfPHHWQ74thrcqndzXk028EV3izThfZO/Z9dGlnko94XjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743616718; c=relaxed/simple;
	bh=D74ofNqOA7SYqmUp+Mla6PTcWb0dGPqjVWpS17OFnfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eiDBPWiYJiKnD1QlSVNq8lImvpQ+0tLvb8tCDc8IgHnEmlBcwh8HYWwgs4iEuSZoZwvwJ4MlA/B2mp5nkfmPIBAOf0mQjEiocKPgYO1HG+y6qeROLY7JeaAbb7994BoSJi7UjHOzoXxGhXmdKX8AfC+zuNP3xX/b15mzfT3CQUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RGY8HGFj; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RGY8HGFj"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac25520a289so5917866b.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743616714; x=1744221514; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1MQX/4jbOB87ZzQVjurudVLbH8O3d+X8ocGzSuwXjw8=;
        b=RGY8HGFjgrGq+9QFgQV3bEKlsvqLuQGiNhZZRjafPLT/F4vO/FNH0eti3tX9ouOeUQ
         7M/NE1OrxtvTFdyR8URIlw+Qx+DvfoFP+PodtQ0ozkrf8cIKQpuq5GxMWExTWSM0PMzY
         Gk5uR480bH/HTPElpKCOYrwhLjclwL33ndL3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743616714; x=1744221514;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MQX/4jbOB87ZzQVjurudVLbH8O3d+X8ocGzSuwXjw8=;
        b=r4x1hStAbg4kbF77/hPVy+dIg0Rjog0l6IxfnpvJ0B2OZFyXzOn7bbmsCfCkgRa0tr
         Z1+LYemfgZH+MbOg+M6RgbQ9+OZv2sc9WYz3N254yjs5xAjI1xCZ06Rsu8dfRjlVVlup
         p3YhkxIGeWaEVe6CmVLd7J4qA3vEoV2HVXI4dzYizNlsXikLZ0AaSAp5exnZzkusGUth
         fizXYiuXfzUcODe6KSS6XFNSyRNMB/dUlVSj2fcwqhc2OIf0Ijn2F5LWyfykEBj2dzfP
         RgbJRl+rnph27+bB3/lI5X4XiyUeMNc2/cihnUIv++YbngwH+bAauAk0Pewkdy32lN/W
         IYrQ==
X-Gm-Message-State: AOJu0Yx8tTlwBy4QZEJDahriBmCHHRL3zHBSShQcjMatQnJwsb/rf0bo
	jAemPuj4B7M4oL/+47fIGyprmOfSluOQK8Vsb8uWrhy/RFiRjOLkqqsBsGd4Yc6+2IV80aWdqwU
	1S20=
X-Gm-Gg: ASbGncurES9bCDP0ULc8av6NFtM9wCps5OQGZFuPLb7TONkh2RtKpY0ToqW+Y4bN2qb
	P/v0htcGe2anWUpOyulQdnuttHQDeb6YMtm5u0qzDwBEc/UVpuIs0RQEIDpEk1rG/0LFkLESFbR
	QLOxeM6C5WR+9IN3MY5bjUQHNS/HqVK8ZDBXVY3XEBmvyai8C0Cs6ZsU3ZEmQkuEQHRhiuN6Cto
	UJbzcRRje9sECdUJfmUnmAfQQk6ANnp6bovUlgfBhxNt4mU6cTs2WzsBoOZKQnS9yHTWX0yYPM9
	CSjpklFtR6Lk0OLC/2O6kCmcrO0TABybbaWfjjpuh18ug5+TVn2XzUjBgev4F50ZQnBnzVL7yLM
	wxtUv33UXylqdiX5/7CI=
X-Google-Smtp-Source: AGHT+IHmObMmOsD8dHzkTsGmgatq71BFWoSdTrfdf+77YSoWT62wYsEuh9HvnJjBb8mO76hVcjYASA==
X-Received: by 2002:a17:907:9693:b0:ac1:ddaa:2c03 with SMTP id a640c23a62f3a-ac7385d8502mr1715880666b.0.1743616714035;
        Wed, 02 Apr 2025 10:58:34 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71961f9dasm963340566b.90.2025.04.02.10.58.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 10:58:33 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ab78e6edb99so4766066b.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:58:33 -0700 (PDT)
X-Received: by 2002:a17:907:724c:b0:ac0:6e7d:cd0b with SMTP id
 a640c23a62f3a-ac738a80f54mr1364237366b.34.1743616712863; Wed, 02 Apr 2025
 10:58:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z-xFKa5hiQ5urVwS@gmail.com>
In-Reply-To: <Z-xFKa5hiQ5urVwS@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Apr 2025 10:58:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgqa0B9OV+EAQ34-VOUAeVB2o2bXnZXQDG7u+Z=4Cmw8w@mail.gmail.com>
X-Gm-Features: AQ5f1JqQq75M_XOdaWX7xnjVetlVA0__RlcFY6Re5xxEPVlslcVR-3_SRVFmbgM
Message-ID: <CAHk-=wgqa0B9OV+EAQ34-VOUAeVB2o2bXnZXQDG7u+Z=4Cmw8w@mail.gmail.com>
Subject: Re: [GIT PULL] objtool fixes
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Apr 2025 at 12:57, Ingo Molnar <mingo@kernel.org> wrote:
>
>  - Fix a number of objtool warnings in various drivers, core kernel
>    code and architecture code. About half of them are potential
>    problems related to out-of-bounds accesses or potential undefined
>    behavior, the other half are additional objtool annotations.

So I've pulled this, but I really dislike some of it.

That

> Josh Poimboeuf (35):
>       objtool: Fix X86_FEATURE_SMAP alternative handling

makes a bad thing even worse.

Apparently nobody else ever looks at generated code, but dammit, the
clac/stac code generation has turned the ugly up to 11.

Yes, the altinstruction replacement thing was already making the
generated asm hard to read, but now it's *also* adding this garbage to
it:

        911:
        .pushsection .discard.annotate_insn,"M",@progbits,8
        .long 911b - .
        .long 6
        .popsection

which is just pure unadulterated pointless noise.

That "annotation #6" is WORTHLESS.

Dammit, objtool could have figured that annotation out ON ITS OWN
without generating shit in our code. It's not like it doesn't already
look at alternatives, and it's not like it couldn't just have seen
"oh, look, it's a nop instruction with a clac/stac instruction as an
alternative".

So why does it add that pointless garbage that makes already nasty
code even nastier?

Please fix this.

            Linus
