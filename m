Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2775221570
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873883; cv=none; b=YaUHULG7s4R+zf6WQGro11ft1PRyjKgW8IHmNOkivw5WQbUBsRRWGcPeIozejsI2KUEriTZrno52fBAOFov5m6XwbGq/SGLVcMHWhY4Ri4U+GmQtHVWyLbc/7NFX3IjZ//0IMw5Nlo3WdzarZvEwCITj657Lpmf5ihgcA02K5Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873883; c=relaxed/simple;
	bh=Y1kfu9Z+QL2uu7AjVyJUXKJPHvRaR5bEkxSSmhH3KP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YxzzU/8MMDkdfUDEslxG5JqGRkXgN4LXTytRcrdyBNRB1HecPZHVtRlkNFy+fsy0c209T/g5L+0h/274S5EHWhafZ98nOnKoz6dOcRovgNoIOzhMYpSrgmCd6IXI2TeMnxo7vAy1C/QWlaonOK8hdGFHrLAbBSaWba38gtA1OyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LUHyW9pR; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LUHyW9pR"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso743117a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745873879; x=1746478679; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AuAi49HAJJQIt//Ur0G31c7rmQctMxdbA26IlvOPDzQ=;
        b=LUHyW9pRwuZVYDWdoAlR1U85oS4dQqOgIk6XOpQWfMbVKXbUxtTTZfyIARRONOUHXI
         rLXCrIfhfEpo/IKKqnJfDvV8eoU9VAxPkaNXK/XIPwb4f+Lk5SqdCsxbOKMhFu40PQm1
         jwrwg5d94sG0U53KFrkNbyjcpMSiHAcOyW3Ik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873879; x=1746478679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AuAi49HAJJQIt//Ur0G31c7rmQctMxdbA26IlvOPDzQ=;
        b=APvg14BuD0wtVg3WvTOSyJnhAcAmyd2Jh+bP2niXycv61o8dPJR/BhtuSU5mm/rwAU
         U7xG4ELsADbPzX9tiJsVoiicjlCEd1xU07xegA0ToiUj+U8Rwlmj8pTKleEORciF0zqp
         CdMGV1IRL8u+LIDKsWMI3KNjsvbkr/FmwyQyrqkusQiLzZUtE3yXl4uc4duQ8XnkdoPG
         I6tl6xmT5qAylInYk0d72DsEsYAnGIuJenGBM0zxvmgsMlh4ALhItuk6FIP+j0fOpDOq
         njux4bxJWgec/Z5JD1tTCEz+dWFrL0QSRz3xJtYimg6hHh2EYJfLgzgsNJfzs77JxwL7
         WP+w==
X-Forwarded-Encrypted: i=1; AJvYcCV1vpNBLE4y910LXfCufA0OO1N58T9LdnfSsAYSPLB3Z6Hhsd0f6ZM5onzETMVnOOQd6OfH21F5qKGsrsA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlPHpvLt5vZ/mVNYXRFogBymAPunUBDxC02pC5z6lQvUSMK/qI
	pnYGdHF41zoQJ7pSdEsOvvkVNMVUXAaodBb+zIZpm0IV6ez2L1uoOxUC5WZLawJnz8aBg0gYkxS
	ml9Am9A==
X-Gm-Gg: ASbGncvwiT0Vbm9+kULV72UvS9OzIeSGhTi2tnYggG6/TaMFiv1dXIfiJ5TRE8aUqDy
	cb0Zj1jbTNa5P/j6MxH6rJWnCLw6C74XHS3hQ9nS3mhNSLpc4g8ZWQW3JeGtYEPx/Lw06EKmvGI
	4uXqNgzEjdXPYUT4RTKLi1WOp/yNoeckKJ0QYFcNpMY2jTS567LncbsLdVnmnEYFNDRLhG7Oiuh
	5aJDJoPqdLZOoPRm04oZ4xp/zJVYJ6wEn32ZuEAKpC+YMiktDwb/d4bXO7opbk41NlVYN4TBjM7
	SEfYYKbknct21u7S/NjlpQAUQ30NE/By3SEbZlNMquoYxqWquYhECNgFqIYUXgol9GRTdh0N2D+
	WHIF+2uGIexPBX2lhCuZk8kyo3Q==
X-Google-Smtp-Source: AGHT+IGScjSjd7Z9XuD6a4EdlZtJNz2TmXzO2niHUZWxZUXyLRGkhMS42qGaU5ZBl8GWY7KkkSrMKA==
X-Received: by 2002:a05:6402:35d6:b0:5f4:c5eb:50c9 with SMTP id 4fb4d7f45d1cf-5f73982bd29mr7321461a12.21.1745873878959;
        Mon, 28 Apr 2025 13:57:58 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013ff81dsm6629389a12.24.2025.04.28.13.57.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:57:57 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac339f53df9so1013498966b.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:57:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZplplTfwoCDaiQfILcfnaVeH29vDK6HQURDntwovS4Nj4xK6CH0viiO72IpAtCYLNNtA9hexkVJZ4/XY=@vger.kernel.org
X-Received: by 2002:a17:907:2d21:b0:ace:6e8b:516c with SMTP id
 a640c23a62f3a-ace848f79c7mr950122666b.20.1745873875562; Mon, 28 Apr 2025
 13:57:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
 <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
 <20250426200513.GA427956@ax162> <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
 <20250426232344.GA1395819@ax162> <CAHk-=wha-AgeeqATWRrKuopM4fKhhF_tZE_raQM77qO7Zd3fOQ@mail.gmail.com>
 <CAGG=3QUk8-Ak7YKnRziO4=0z=1C_7+4jF+6ZeDQ9yF+kuTOHOQ@mail.gmail.com>
 <CAHk-=wgrT9++rFTnM1vh3bwx2Pcc18anDGQCwEL+0d2nDm3p+A@mail.gmail.com> <zizdtmyqqprnlgy2rzvvmqzhganxpuxqqkudhwakianlapl6zp@zucf2xtoabez>
In-Reply-To: <zizdtmyqqprnlgy2rzvvmqzhganxpuxqqkudhwakianlapl6zp@zucf2xtoabez>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Apr 2025 13:57:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=witM==gebAaEqr_Z9jV-Y7i-=w_tfMovzhgW+VX4Fwkmw@mail.gmail.com>
X-Gm-Features: ATxdqUHVoU0fqtTa0EcdInlUrRY0LAso2qHrbrMUyXdvOmWof2RJdPZnjJYyf4I
Message-ID: <CAHk-=witM==gebAaEqr_Z9jV-Y7i-=w_tfMovzhgW+VX4Fwkmw@mail.gmail.com>
Subject: Re: clang and drm issue: objtool warnings from clang build
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	"the arch/x86 maintainers" <x86@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Apr 2025 at 12:54, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> BTW, I've noticed Clang also generates UB for negative shift values.  I
> assume we'd want it to stop checking for those as well.

Yeah, that seems to match the exact same issue.

And again - the correct fix would be for the compiler to not do extra
work only to make for worse results.

Note that it's different if we *ask* for -fsanitize-undefined-xyz: at
that point we're literally asking the compiler to add extra code for
reporting.

But even then we absolutely don't want the "fall through to random
code" behavior. We'd only want the reporting part, and then still
generate valid code.

So the "turn undefined behavior into truly random behavior" is *never*
a valid model.

It would be much better handled as implementation-defined. So "divide
by zero" would have a very valid model - it will raise an exception.
And shift by negative would have all the usual semantics on x86 (the
shift value is just masked).

Undefined behavior is a bad bad thing to try to take advantage of.
It's bad in CPU design, it's bad in compiler design. If we have a bug
- and bugs *will* happen - it's a lot better if that bug then causes
some reliably bad behavior. It's better for security, it's better for
debuggability.

            Linus
