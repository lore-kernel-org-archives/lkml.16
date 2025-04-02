Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE1719E826
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 18:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743619208; cv=none; b=g8LIqb7oXz8TC9wAQSbympbC5rAT94Tole+1w4uZ4jzUPMmOQ80Js/owq4GMMXOc8bVbRM5MuS45xRO13k83AkELmLtjy/spXTjy1X7cC/lOVK0xg74qpbGf8LPmPeVetg2KU+Y2ctM80Wh5lQVDX1l0bfbaxH0ZIx3UxGqYulY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743619208; c=relaxed/simple;
	bh=qtWBCuy2bEC7WNdaJLPfgj9TXSRipxsath+GwLA8wwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R8ckvpi263fczE+nJceTISu1mbei3pWX102SlmjRvyfVzNrj9dnZ/cYTh3HglqyWF5zKF7MZxODwzmWtbxC9TRmCnrA/xtHnxR4IGO8tnieKjMN+NOgxLAr244N183nbgZZjdz/ZXkQSEkM0H4HgNdJHnIWoPsV9MrdcdOWgvQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=f6xsb/9a; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="f6xsb/9a"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso758384f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 11:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743619202; x=1744224002; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CN0Ank11k5Ff8vlzb1zmQOxlnXsF9/tLRiVAYjU0m2o=;
        b=f6xsb/9ammH+guYKepCy0LwGLPyclHuOvAwTs59dUlhIaJSb9bUjPA+t4GufyofQsq
         Y7ifQIErSUQkkquYhco8pJFXtuEZV0eRiOxt8r3eIN7U/fxJpCyPM2GXqFqTaCZwCbaR
         vVl0xvLhcpW0cqeJ8uceAghXPYML7fK9INXdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743619202; x=1744224002;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CN0Ank11k5Ff8vlzb1zmQOxlnXsF9/tLRiVAYjU0m2o=;
        b=QNMAiOrjcDKj111PlQ6mMKfpNvZlqJiQca35PBo0a1xzaPhWcbpHf7Za0viCslrsJk
         ELKxYgBbHWRKJqRwpxTgI/Kd/uTjYMznVpP5bXRUG0ThE6Ot6+p3kmQpDJbD3x5GYGrn
         zByy2X5rBV0ZGxweMsrnF8fSGsE70ATZ3OA865Z4ZCafJs6P0RvJj0FYNqsp5qXAE3oX
         R3e3fkVmS7nXs+d7rxxgBqUAaREQGrGLPrVgVEkCVeSKDRLR2l7oPJYrFe1GJds4W5Xh
         Mz43OYqf/DxBTqcEIS4yS8w5aLPC3tYSFfLJ49NmOC9IvjoLwQjja+49kWxo5ajndx5P
         aHiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1Hn4bkN0Jn+v1zxIDeKheH6tUxeOBH2k/K5jX+394j7gbXEcDjCjz1n9C5CiyRe/UlIlycyVzRVphIjs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw68WZAgeiJi6Cp7NohheS8ygN5VM7p1kiUsr51KLv+ayPYhz5C
	7/x/26OO1bUzzeG9twgiKiRBdoUUbsW6Ehm5sARD05wJdADxsGoJnsSoSRPZzz0=
X-Gm-Gg: ASbGncuTga66e1/xZK79mBElXN/eREE0yctdzx97O164itPFsEUF8yoQCfMj6jJ2d75
	uDIEsnhwF1yurjP3W2zTsbwTMWrD3PgmBxVb2xntDSZfaUt0w6usCYNCETeLJotTe8T5juHay1d
	hUwXaP75CuycdwtBmCSXP/J8n3Znxfl+Dj9ApMo3AD5JOvwVUhRC3Ev/pa+KXdT6tR2I3zFWJdf
	FZAFDYcmksXimPXBOOIXGG9zGirr/xquk5NVaxwdP3dHu0R0WRoeD0szbbze+7YjxvazNP2rGjU
	dAuABqBYv4RKu2XBd7xOSx+7CA7Nx8cZd/vVDM79EqPED4jT4ugaqvYApzYjCCIwKqHQDBFady6
	mxXgmg5tC1A==
X-Google-Smtp-Source: AGHT+IEK2h/pWYEShjWJcu3coYpjWKibIiuvxxbNpc4sukgHKbWI7uvVA9AmRXWQoL9zOMHkWI4dWA==
X-Received: by 2002:a05:6000:22c5:b0:39c:2c0b:8db4 with SMTP id ffacd0b85a97d-39c2e610ac9mr601605f8f.10.1743619202352;
        Wed, 02 Apr 2025 11:40:02 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663617sm17849456f8f.34.2025.04.02.11.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 11:40:01 -0700 (PDT)
Message-ID: <e0021746-d43c-4c45-83b6-bcf3982b2548@citrix.com>
Date: Wed, 2 Apr 2025 19:40:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: mjguzik@gmail.com, linux-kernel@vger.kernel.org, mingo@redhat.com,
 x86@kernel.org, "Peter Zijlstra (Intel)" <peterz@infradead.org>
References: <CAGudoHEV-PFSr-xKUx5GkTf4KasJc=aNNzQbkoTnFVLisKti+A@mail.gmail.com>
 <948fffdc-d0d8-49c4-90b6-b91f282f76c9@citrix.com>
 <CAHk-=wg4syfXPBgQhq50ePOnB=zP9Jk1U+GmjXWmDMwcQ7X7WA@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAHk-=wg4syfXPBgQhq50ePOnB=zP9Jk1U+GmjXWmDMwcQ7X7WA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/04/2025 7:29 pm, Linus Torvalds wrote:
> On Wed, 2 Apr 2025 at 11:17, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> Taking a leaf out of the repoline book, the ideal library call(s) would be:
>>
>>     CALL __x86_thunk_rep_{mov,stos}sb
>>
>> using the REP ABI (parameters in %rcx/%rdi/etc), rather than the SYSV ABI.
> Yes. That's basically what 'rep_movs_alternative' does so that we can
> basically do a
>
>                 ALTERNATIVE("rep movsb",
>                             "call rep_movs_alternative",
> ALT_NOT(X86_FEATURE_FSRM))
>
> but we only do this for user space copies exactly because we don't
> have a good way to do it for compiler-generated ones.
>
> If gcc just did an out-of-line call, but used the 'rep movs' "calling
> convention", we would be able to basically do the rewriting
> dynamically, replacing the call with an inlined "rep movsb" where
> appropriate.

You still want the compiler to be able to do a first-pass optimisation
over __builtin_mem*(), for elimination/merging/etc, but if it could stop
half way through what it currently does and just emit the library call,
that would be excellent.

~Andrew
