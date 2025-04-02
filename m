Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B2A1C860F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 18:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743618565; cv=none; b=a+vVEY6tXFNQEWDZ3mNGc2df3tRP+gT2uv9Sf3CxHxJsViz4jedSwldjAe93l7NgLIdeuoeg5PL9rw3Iwk6c1p5QncTCzwQ/hIyRGq+J0kFNloOaVEq//3KGTOosOO7AfcV257N4J8H1uOgTiN4YGcCGC4h7ENpGXFgM5qiGZFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743618565; c=relaxed/simple;
	bh=UGTmqaAwJLatlzaq1p3+HmP4fgE7ybtpG6cAdyQKEwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z71z9QWev0JyKb+cTytNAnYyKaV3yH/6st8nuhXDZsXPqUmBDpEFHeO2rT7wrl8skXEseTmigzZiK+ukGedVwBI0cM2hQbd09QKJ6U8LWmEHxxFXaMLb3gT3ksoqEKbFze57RdpjlFPwymxc9Xu2f1a6zGr6D0YaFyQHW9xq5LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bBhSVL37; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bBhSVL37"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so193311a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 11:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743618561; x=1744223361; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhDeiG3XZDDBldCAqMcweB0+kts9uc1sZmovY354eSM=;
        b=bBhSVL37gY8PZ1F0LFxAUHVrkZCDWiQekYyG/kefA/6pi2Tg8pW3uZcq5adQcI34yO
         LW5ZD2DiTspluBVNYOUgHhvJCP4ooO+9ehobEDedDEvkuNSTxcXTFcI+eOZN6EilEnV5
         o4BbFmPzgZI4iUz4SVSwqCOeOVPDAfihw9fCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743618561; x=1744223361;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZhDeiG3XZDDBldCAqMcweB0+kts9uc1sZmovY354eSM=;
        b=PPt9R0BzxAEX868LH73lPCOh0beXQpY0ufg4VH4jeKIotYPVuI8erTtbSznIrfXbv8
         iWd/Fpjohch/6wPKpmFypecSRLmaIu6RW/rTV0ZFk8u5BhBxiqTLxN6qQfR+GVFHB+x/
         R8ULuPQ1xYsRzZkO0chbKYHWYhqs7nLu0odUhTkaGE4bZy5lmsbIX8dB6icntpAzHusl
         oF/maiZEMHLZL14jjeh/lKFNwm/Nj4m/A+8DW09qaVKHXQmuWTbrAg0vC7L5TmwgOS3r
         wHc3Q4owtsMFpUdWs++zbpxl6zv0zPufkqjQrgFX/LzvuVmuZEfaahCOI3In5NCyqPBu
         +HKw==
X-Forwarded-Encrypted: i=1; AJvYcCV3a2gr1gvktGP9Hay89g+HYQgLFN3suyuo+dN7AKte1dyYa8l1XvO++C6bLNQOBn9WULUitlbB3NRXp7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCRroSerJihSp7VV/WQQlBnpMNwS9qDVtm1wp2uJtBTRAKaM2r
	GCFBSvWfKu1eKst9U6TFJNmAP/rjUZYVu+L7cXOdX1sjeJPquYG0cwu4keDTn9j8S3rbTQFxV6Z
	BNs4=
X-Gm-Gg: ASbGncuoNAOqCWpbyPRZoomuoejEc6yExBx0NAs0UUGm4EWsGDzlzJKuHGQBqATPpeA
	xCFDbL/6j92b6UB9gXci6rqkHT3SRhd08sfzU/st1W0ODM4oAP974joV3BhNzE/MChMc7oXERoA
	rGDa1+XlSv9rjhVsAjzIQElN4m8+oSZuEySINk6Gm4q4n7dAhx3MlPW4mSzPpyGex/X6Buxjnfr
	74sfcd/xuTsuH6qPyH5GfDO3mjbwJfVyx1YvtDttclFE2BllYfDL9DtInmzheeXJQgXtv0666H6
	O+/1L4eBedtCGhERX9LclmL6K1ZU6mjdtFrxi4NbXhLYm8BzuqsF+wAhlEdWGD5sxggdaXinR93
	CPjjHOrv1Jd+x7Q6xShbPUbLgkS32Dw==
X-Google-Smtp-Source: AGHT+IHrlUwDRhPY2Hfb/vEHmqLom1Y9tFlXm9BurUuAqEaQoLHTzhczKf7hLUH37CCB7c7mONVFgw==
X-Received: by 2002:a05:6402:2744:b0:5ed:79cb:116f with SMTP id 4fb4d7f45d1cf-5edfdafccefmr16453397a12.25.1743618560695;
        Wed, 02 Apr 2025 11:29:20 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16aae90sm9052660a12.15.2025.04.02.11.29.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 11:29:19 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2c663a3daso11708166b.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 11:29:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWaVJ7MKpk+ynfOgH2R+0ANfpX5aZ7P/MAzGQzxJXr0UlFLkQJnn9MHPmrOGQiyoat7zU0XO1pTZGxNqfs=@vger.kernel.org
X-Received: by 2002:a17:907:97c9:b0:ac4:3d0:8bc6 with SMTP id
 a640c23a62f3a-ac7389e1864mr1611206166b.13.1743618559154; Wed, 02 Apr 2025
 11:29:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGudoHEV-PFSr-xKUx5GkTf4KasJc=aNNzQbkoTnFVLisKti+A@mail.gmail.com>
 <948fffdc-d0d8-49c4-90b6-b91f282f76c9@citrix.com>
In-Reply-To: <948fffdc-d0d8-49c4-90b6-b91f282f76c9@citrix.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Apr 2025 11:29:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg4syfXPBgQhq50ePOnB=zP9Jk1U+GmjXWmDMwcQ7X7WA@mail.gmail.com>
X-Gm-Features: AQ5f1Jq_AlPUNJYvqZOLNAUo4-IhVSzOQBj_SYuotHcClMBbp19xe924coazHiU
Message-ID: <CAHk-=wg4syfXPBgQhq50ePOnB=zP9Jk1U+GmjXWmDMwcQ7X7WA@mail.gmail.com>
Subject: Re: [RFC PATCH] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: mjguzik@gmail.com, linux-kernel@vger.kernel.org, mingo@redhat.com, 
	x86@kernel.org, "Peter Zijlstra (Intel)" <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Apr 2025 at 11:17, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> Taking a leaf out of the repoline book, the ideal library call(s) would be:
>
>     CALL __x86_thunk_rep_{mov,stos}sb
>
> using the REP ABI (parameters in %rcx/%rdi/etc), rather than the SYSV ABI.

Yes. That's basically what 'rep_movs_alternative' does so that we can
basically do a

                ALTERNATIVE("rep movsb",
                            "call rep_movs_alternative",
ALT_NOT(X86_FEATURE_FSRM))

but we only do this for user space copies exactly because we don't
have a good way to do it for compiler-generated ones.

If gcc just did an out-of-line call, but used the 'rep movs' "calling
convention", we would be able to basically do the rewriting
dynamically, replacing the call with an inlined "rep movsb" where
appropriate.

                 Linus
