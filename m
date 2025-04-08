Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB4223C8C7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 18:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744135658; cv=none; b=GabkHA0tR9ePffLIMoyY2dLrheo453NKDIQGPYxsq/j3QAVTjV1AUPMbXuUUkgzezESylQLqRL0MhVh0HEiM/qQpNHwe2T1AdfQ/FCpqsjAS2DRboY+LDquCTK4AtspAZXKThC29fzGO4mkVKc2e0xm1PhVPkELLkI/HXQfOVWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744135658; c=relaxed/simple;
	bh=E9Bl23eY8LT4mEzyLs68LFT5XER8x3zAEixPN0nLsvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VN1ZGcnADtfkU8kZWFZu4QZKDUP07ObPtz/9miWxMSywATwHgz3tHGCS3YwAPSt8V2SetK+cSIZBhAeLslHwXcdjvj1w40VyjYwmxxoE/9zekq3uA/kJlTK2NWhLemsIz9ggfYT6M84VR6gardXCzKMpMJXm4I/pE6Y8XMfnKkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=YojMme6g; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YojMme6g"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so5983021a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 11:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744135654; x=1744740454; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lBSA8eXQHypf7dmR+BUk1pz+2UL5Kr5yQ1c49+ifFD8=;
        b=YojMme6g6cyvmwdR7+QmyF94VeO8ydVTaQfenw9DbiRoWFLHI8/PYcd9erXm9j7QN5
         8Xv2YrT1C4g5WyevHIYkAJkhZ/c5ZpkY90XlfbFRJNj8rpcv+yQ6mLKxE21zIlMjfMes
         XHVCL1NsAHlioJXZ43cm+lIhfKojV8bW2p9oc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744135654; x=1744740454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBSA8eXQHypf7dmR+BUk1pz+2UL5Kr5yQ1c49+ifFD8=;
        b=ArBFYOQ7GikQjRf6cevcWQyHAj3xYJ0RbhhjOpbbWmKuFGAH9Q+Vl1sndMYl1mSeWg
         G1RC3QxFJedch2Q0sJmqzefTWvBYLk7glA2N+wTOdPn0TyTtpZr0kKaTCv/omv2sGU0c
         ApgKiNY5cRhvOMl9iXTvEqkdSbj4kiNuk5Ewb+tC0NgcFqYYIObB7ys/veFqo82bYcqB
         SiGWkxJPnYTFeK+TKQX0pquTe87OB++ToaBXkACzl69Z7w8kaM13WXLUPjzQxkaNSQTd
         lqb6P43w47vPXU11C8cs0Hbadrg0E9CxX1jYprKjQQSEqShWb/nY+2fJ7dSJrF5pGQcd
         vdlw==
X-Forwarded-Encrypted: i=1; AJvYcCUWUrOakfGt0uA6RSAWkPhEOUcApJklmKYV//TRgMs0JvS98SiB5KE8BHBvhBI7sOThGKesDFucTh7F7HM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0DOQh70tMEsbzC/pZg7nFtIaLw5NwStXcnMTC4rNmPisjS25z
	RHjupmHh74z/Rywbm55jy98EiexxXGBMzV04cIn9Q6JAu1Mso2l/z20NNlmGRj1zvmIbzhT87wN
	Dxn8=
X-Gm-Gg: ASbGncs6Z/BnpQGQsRuXuO2BS5XtfcP2oetwrwwOQpXKHHhTWOdtv/PCaN1avdwtNwr
	yJx3sVO3BzILxqwcUWwtH495w5ACTckZ+/00YIheGZSH+7rAxxcMjLAhXhjb+l95JnK8yMLPteS
	qBGhE8AvP/xxU6LoT83sIVUOLB+17e3VRay9NihP36C8IupLEf35xvPof7pEda4LkelWcvz4cwU
	ynpgo1fxU8E38LHLFXX1LweVLPulf72shA9mruVFPeuVozyD7Vzmu0E7gIRmMcnFEMUNQDuSauY
	dDj1ABZarnUpnNCPbse4htTMKurrW2irGscQTRsaZr0VYJScJlB2gqxa5hpa/xBlqkYzkhzNXxY
	dHEAouewPFMqpM0sI+2E=
X-Google-Smtp-Source: AGHT+IFobVCl5dxe9VZjvLsQ81FF0k/DR/WN1NBdOvrzR6uIJIIj+Cw5IJv3TqsX+o0wDA3Kg1Fm4w==
X-Received: by 2002:a05:6402:234c:b0:5e5:854d:4d17 with SMTP id 4fb4d7f45d1cf-5f1f47050ecmr4263449a12.11.1744135654224;
        Tue, 08 Apr 2025 11:07:34 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f088084f17sm8593819a12.61.2025.04.08.11.07.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 11:07:33 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac7bd86f637so1060935166b.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 11:07:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXzFcdTtiltShJc2uOA3416jEJaEQngEo5YN/uqVq239ZBgpoawPtWGyiq4+/IecImdnxeVpGiO/gM9baw=@vger.kernel.org
X-Received: by 2002:a17:907:6094:b0:abf:6f25:9881 with SMTP id
 a640c23a62f3a-ac81a878edbmr425494066b.25.1744135652736; Tue, 08 Apr 2025
 11:07:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744098446.git.jpoimboe@kernel.org> <fc972ba4995d826fcfb8d02733a14be8d670900b.1744098446.git.jpoimboe@kernel.org>
In-Reply-To: <fc972ba4995d826fcfb8d02733a14be8d670900b.1744098446.git.jpoimboe@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 8 Apr 2025 11:07:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wizyNY=-D_7YVZuGdya2gRg_JgWSuNjnYbKaMYK_rOaig@mail.gmail.com>
X-Gm-Features: ATxdqUEzh7FuccfSDckBJtvhQUy4qE3B61vW2z14oHPyhLqNHUb46KFyHkl24x4
Message-ID: <CAHk-=wizyNY=-D_7YVZuGdya2gRg_JgWSuNjnYbKaMYK_rOaig@mail.gmail.com>
Subject: Re: [PATCH RFC 1/5] objtool: Remove ANNOTATE_IGNORE_ALTERNATIVE from CLAC/STAC
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Apr 2025 at 01:21, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
>  #define ASM_CLAC \
> -       ALTERNATIVE __stringify(ANNOTATE_IGNORE_ALTERNATIVE), "clac", X86_FEATURE_SMAP
> +       ALTERNATIVE "", "clac", X86_FEATURE_SMAP
>
>  #define ASM_STAC \
> -       ALTERNATIVE __stringify(ANNOTATE_IGNORE_ALTERNATIVE), "stac", X86_FEATURE_SMAP
> +       ALTERNATIVE "", "stac", X86_FEATURE_SMAP

Thanks. I didn't actually test the patch, but it obviously fixes my
concerns, so I'm acking it without any testing what-so-ever.

              Linus
