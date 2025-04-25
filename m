Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A89E8528E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745545015; cv=none; b=pygb3jzbVAVm+KRY/m5yE5FC/qDQe9ZuxmmZptO6hNqCdSV0XrHCTXr+dMG4I+Hj+7b7t5IsVZK908waW1BUBTrYR6qEhfzp5Za7hPg5U5cIdeuE07Ugxe711qYQdgqlmv/ot09Gtqg/6m7pmJDWq8etFLPwlMuRgvj8ZV+qgHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745545015; c=relaxed/simple;
	bh=p5aAM8nvuq5KR9Vajvi+nQEW2Rln1Bwv8GwF4gnQeO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PAAM03o9i2WfJ1oxluI6pAARx8UL/r/M8d2uv8UpOhIjrzd5VTbQQkyhRoH949kF4ikCmjoZU0IJywctxq1XVXjiqprtBJRBDto40ErwzfoKQnupFoMq5Qk/t5NGVDED/h8gWza7gnJMIrQJtBro5qLBFA91JDpIEJGeiO2P+nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QVkPdYIf; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QVkPdYIf"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-acacb8743a7so286502666b.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745545010; x=1746149810; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b7Zbmc9PFyMIhUbm13T2e4rkkq7qjR76gjJbFxlv9Tw=;
        b=QVkPdYIfSkCmSkKgIhQo2BYTr+zHC+pgsmsJIvmfSy5iqhTRk1qblc4lPYoyCj/UZK
         rgMMUXd0sgTDVbSD7PpZcSkhDKuGVWl8lH2md1cE60/7iRn+LE3o569aA5ygAjE26OYA
         m6uKiFJJdejofsDcqIUMTXKBOBD5ozHxEz4KM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745545010; x=1746149810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7Zbmc9PFyMIhUbm13T2e4rkkq7qjR76gjJbFxlv9Tw=;
        b=D8O4p1+t3XkJiikro0Y3vWUAoI7TNF6x7fq05JciEE+Q1OnbKPU3YzvNmEKvaNl6WT
         5Hy/6KIKOBxCZAyg/rNLockRrKeQZ2f29HXdXS6e1Zrwz39we2RbJSuteoqxxaRcfw+H
         OA6lTDNacWx2E5Uj4D/hQxwaGWkcD/yF5kTTzVnFGVN1GhksndlKDIMrKfXZ2t3r1kmv
         ZHNxz0bX29WsDxyHgsvNVTEn6BRMWnbtuNmbOc/HWHM+kK6yUqErvTOqiXuz3ZeDZG1A
         Xuou6PubHqdowWovhvesA5kj+bt2/6+rykElv4rRGFDIvAd162FBmPFjkpUS2ptG7WR6
         o6pw==
X-Forwarded-Encrypted: i=1; AJvYcCWUCGi+ZdVlryxbSN2csHVqNZT6Fj2ZVQIaFKni6hkTOpQjd3lsM5xFQsuHhOMDIA9gcSNvpphuBR/Mm6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNn+UVSb3T5pzuPHseEC6xd4ek8uTo4Arkr3WD4SMdnKnYMJju
	axkr4RSsYVYpv7p0Jx9Ijuf0J+ZoEUz19Tw3DFJ5u0N3rGVD89/XRYBjCwfba9fpHSsKTRi4GCC
	28KbV5g==
X-Gm-Gg: ASbGncthYkO8ZZP8WKA3AZiiYf3/VxdIBN3j5FqgtQCDqpIQKp6BIjcgY5FM7jgpGYZ
	7KP4soL8d5lLENuLZQbVZknMjEAS+zzZ6wiYQteHxSocKeRGWGm74ZYprVdOLcWn17fXw/7kK25
	9ThcwivH/gNMb7rYSzhBcvkvJK2MQ1RQFZ5kaRPCoFSd4+4QnOVZPB1ZCaePqTMzLsz4reR9reL
	p6KCd7HV5KmySeGD4uy6wnvsKo9I/xTwDgkQDUQb2ge10AVWUIrlrcTxFy0etrsE27KD502Djnx
	Sz9tSVEw2YrYls8YXZQgS+xtfhQEfVP1n1UY0muc30dXiW36gvfCUrPwlPs/6QRYvHBGbNZYsMq
	S6jWS+KbgYfRh22o=
X-Google-Smtp-Source: AGHT+IEFxilkq1QymT8bTPcvVyOn/kVUINmXrpDrtN6a4h38fFqXkhb/NDdMhEriTiCGA6FS8Lp+BA==
X-Received: by 2002:a17:907:3ea8:b0:acb:b9ab:6d75 with SMTP id a640c23a62f3a-ace73540b78mr22703166b.23.1745545010391;
        Thu, 24 Apr 2025 18:36:50 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41b2fcsm50243066b.26.2025.04.24.18.36.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 18:36:49 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-acacb8743a7so286500266b.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:36:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXjDJE5cHWIPwaaVq6Ikk0sOQ9O0dX8LzRrtMLjK19Duqs/zL2FiKykaV8gqrKhaU+F5fvcPgQ1VMBY6gg=@vger.kernel.org
X-Received: by 2002:a17:907:97c4:b0:ace:4870:507c with SMTP id
 a640c23a62f3a-ace5a44a4bdmr367221766b.23.1745545009283; Thu, 24 Apr 2025
 18:36:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425003342.GA795313@ax162>
In-Reply-To: <20250425003342.GA795313@ax162>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 24 Apr 2025 18:36:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=whfT3A8K2Z+WbieGG5Hhc9QAT5s3qsbB19O0Roj2G5tfA@mail.gmail.com>
X-Gm-Features: ATxdqUH_oZs_YreS6F_9--y11jLu023Kq43k2pNb3lC2tv-avxOMETPk50B1xGw
Message-ID: <CAHk-=whfT3A8K2Z+WbieGG5Hhc9QAT5s3qsbB19O0Roj2G5tfA@mail.gmail.com>
Subject: Re: Adding __popcountsi2 and __popcountdi2
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Apr 2025 at 17:33, Nathan Chancellor <nathan@kernel.org> wrote:
>
> I figured added
> these may not be as bad as the wcslen() case because most architectures
> generally have an optimized popcount implementation and I am not sure
> compiler builtins are banned entirely from the kernel but I can
> understand if it is still contentious.

Why does the compiler even bother to do this if the architecture
doesn't have the popcount instruction? The function call is quite
possibly more expensive than just doing it the stupid way.

But if you want to do this, put the damn thing as an alias on the code
that actually *does* the SW fallback in lib/hweight.c.

Because the way your patch does it now, it takes "I'm doing stupid
things" to the next level by turning that function call into *two*
function calls - first calling __popcountsi2, which then calls
__sw_hweight32.

Let's not do stupid things, ok?

              Linus
