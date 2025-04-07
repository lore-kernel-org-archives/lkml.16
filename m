Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D37253F38
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 19:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744052549; cv=none; b=sbDh7rhLrZwPATVMxH5jOVGyasra+R/9bUlx9ewiO+9XJlde65f9f3q7e4pBySY915E5CRuA+7w91HS2EAjDExKdpOdh9KMIrdaMnrDXlmaRzbBd2Sjvc1Gtf8Kci84j+d128q4EZk9tA2hptf8vM6kf7JP/uXJZ1KfwuLtNVbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744052549; c=relaxed/simple;
	bh=tpFwO288Tb8nOdpntE32gaJlCk1gAnYqdxjp9nQSYPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J89wj+0D+y4Yk5OBxmNK626mPfdnL61brNbsA/X8y7TLtaL+htSz1QxQBFrFaoMdgD8igx8p4R8/TqnT7heQ5FRS+qEcnLGrVRfrQBElBQct3XdgjsxDIff3K3YBYoOqTN5I/arGHX26LBIm0cYn2UOExMQG5pj8cyr0KwpoY6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OSd6DjX5; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OSd6DjX5"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso554860366b.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 12:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744052544; x=1744657344; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KKDCjSJ25xQvHRgBvdt+RYZW/uH0S48oMFdtUEyp/oc=;
        b=OSd6DjX5sGaKLK5Qy9Ws2Zu0MfBZrpFJ3ywrLgSE3vCYkmkU2nvIO0ym0AVvxngnzD
         aIJKQEIEKcs2UmveFz3u5kgIzm98S4lRLjUyvPeMk9wXMiGADuFtSPvRUR54cd+ghD7T
         PMQIlULaqiGaInspYHecQOqw2b7rVnNW/bw94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744052544; x=1744657344;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKDCjSJ25xQvHRgBvdt+RYZW/uH0S48oMFdtUEyp/oc=;
        b=kLw59+7KX0MZ1uQFV1sHskjsS4HYwc7wowifv2uG1WyirasOxYmwGj6S2N+bWaoaPu
         oMb2MEQP1dEyZUDnVJNtmkEObEDE/Vf3BJ927bYUNDUwZg2MPW8OR/HM2ZC4b/1HABg2
         qsyOvJBldes2knwrhAmt9gfc82uh+wVwacwd+IAQqOXB1NcRt/lW63krYiXKL4iv091h
         8dc16GOA+PT+lW3N4TnalqG/V3Ab69A0WuBDo0F9uJIm093Rb8wzd3dtNK9K8qridTzC
         /7HQLCTAYy4JFpISmTx95nAvHfcNthIvQ4N5ldlETNTemArBOrtydGWOxp+j/9P8lfNn
         rkvA==
X-Forwarded-Encrypted: i=1; AJvYcCXEfJ+ygIDmB+m35qEJXxV4UbDmaWqS6zuKcIGLqkLUOHnZj0hgE0b8fzozKdQcv0/RrqZpPeqqw0Bxjvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTSqjAA67IdzusVMD+4arpbiZsOHigqptwLdFfFd9QnpEwhlue
	RXCEF8PTvym3R7b//GzILZgReQkSTBWCzIiwFNdnPubSEHh44wXpF7b8hgokPzCWBJ83BjFPxnv
	U824=
X-Gm-Gg: ASbGnct60YWxCPEmUxYRITFGhEp/fPxULw52lKkjuwoo6ZhV+LdflsPV1OoRF/SnbxG
	Ps7GLa+V2NgZUnQLGhlbclKNkavxzimaZ14mS2umsRdrstIBW4sKJDRYQda9YpIze+ZVTE5eSS0
	04uZ4Gt2PcxQyiqOlbRluLw6S0X3STaskuFjSkf0mT8HdqJaNK8EjjbMUw2Z9/57/jn/SpFyKUH
	3zFFym7mflt0lUnDgTXglmNYVEnE/dow5dHru1owfW0HananAkVQpQfUAb1VV6CiOwRcGViXrOa
	d3CXjaoCp076+XvyMrYFoG5+SJf/Y2EtCwujvz2YKnEHCvZGf1nUuHGNgrkDXlFtxxVGWEE47zx
	/R2LqKwpKlY7RAoLquvg=
X-Google-Smtp-Source: AGHT+IEfd2H/tMndPeXtnLTuKehZ+PpCiteNb/R++JA8OGEdlT6B6xXr0kp/VRkszGul20HW9jMetQ==
X-Received: by 2002:a17:906:f5a9:b0:ac7:cfcc:690d with SMTP id a640c23a62f3a-ac7d1c35d10mr1383012366b.40.1744052544139;
        Mon, 07 Apr 2025 12:02:24 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c0185f84sm799408566b.140.2025.04.07.12.02.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 12:02:23 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso554855166b.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 12:02:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUsg2kLWIkdKd2iTdIjX1aPYbUTSiT8FUQbuf7QkZ7JT/VIqKXz/WcUyClgdASxYbpVv7ZWUCYmslLwBY=@vger.kernel.org
X-Received: by 2002:a17:906:7149:b0:ac7:ec31:deb0 with SMTP id
 a640c23a62f3a-ac7ec31df15mr624002466b.9.1744052541214; Mon, 07 Apr 2025
 12:02:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202504061053.F27227CA@keescook> <CAHk-=whVfxi4KRu-H=tsgSdoGdDz1bvu0_miJT0BTgAf4igpdg@mail.gmail.com>
 <FFE5FB0B-CC92-4A25-8014-E7548AD1C469@kernel.org> <CAHk-=wijG2dSOOFr8CCYygwxZQxdTUj73rfB8=tyZP-3G-8-og@mail.gmail.com>
 <20250407173741.GA3847400@ax162>
In-Reply-To: <20250407173741.GA3847400@ax162>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 7 Apr 2025 12:02:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi89ogViEN5oTBmcNQXnMEB5_Qse9G401pSNzocP_dqQQ@mail.gmail.com>
X-Gm-Features: ATxdqUE0ltJpng-EBWeE1UKan15wl_Wwyop6M2frZ8rfpKkAr90nfs4qcjQcUm4
Message-ID: <CAHk-=wi89ogViEN5oTBmcNQXnMEB5_Qse9G401pSNzocP_dqQQ@mail.gmail.com>
Subject: Re: [GIT PULL] string fixes for v6.15-rc1
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Peter Collingbourne <pcc@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 10:37, Nathan Chancellor <nathan@kernel.org> wrote:
>
> So would the following change be acceptable? I can draft up a commit
> message and send it along today if so.

Absoluterly. That's the right thing to do.

> +# Ensure clang does not transform certain loops into calls to wcslen() after
> +# https://github.com/llvm/llvm-project/commit/9694844d7e36fd5e01011ab56b64f27b867aa72d
> +KBUILD_CFLAGS-$(call clang-min-version, 210000) += -fno-builtin-wcslen

I think you could just use

     KBUILD_CFLAGS += $(call cc-option, -fno-builtin-wcslen)

instead, and not use some version check?

          Linus
