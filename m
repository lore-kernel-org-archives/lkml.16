Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586C222A7E7
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748876276; cv=none; b=OZaGXOGyvX6vGOAyLzsardivFvHQv/c6vdHKvU4Vga7fpHbOZhxpzpiPX0FgZMoYTTJKG5B3ip6glJMmFZs18wNfBsEPqJh0zjjBA2ZOxh4khvUQcq1FzWzDjty8vmOSd1ca076x8630QL6MSgbnBpKlOtapi4MO7qRhc87OUz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748876276; c=relaxed/simple;
	bh=d77GzSTx53gjTiiefmmY/b0p8Ie5aqQOaYKBjBx0aRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YDdH+l1D7uFj9IOM52EZJv8mzG84IocdPiSbWsoKZWI88LnMY+iJun9xPimY6gCqx1xVyKCeptjGD7I2WQ6iZPn/nYmX/IVSJyXmI9Asdff8apbBwJdVbOgbj6pIUfb+rGKs+J/mQ1wKHPLY0qm6WhNMdUe3CCTWHalxzcirUyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CxrpuWrV; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CxrpuWrV"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-adb5cb6d8f1so230429466b.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 07:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748876272; x=1749481072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mfhsd3zciBf1Cp9ftO2PW78HLn18PhsRSwUscwaSVgI=;
        b=CxrpuWrVI8htH8pxSVTgjl83mzf8xsWVVaji5eu8ba83p7H+nczp0zjmi1x39BZsRZ
         V4pCYCwzyRrbAGEGgmqllD3n2T/Lgj9Y7Ok9aFCT3CSPKC8Jpmj32KdYxyP5ZW0S5gwC
         G9cj7aJzXvuazbCWX+ChtOqWjKzcqjnJIh9wJBOzoAdsMCiosYkalGhFrST6D/KnwOXx
         OSU7/Vy084J5+AHbztqum5PeNfZJ8jBNdaaSzfRF95qdlzVOj4ymGS7TyE7Ly02KBjOe
         9Q7tXlXM0ufL2PFL86z6yTMZRJfVXi6yJpab4m/1P62yfCB9ByKQO3ewBbmSNie4qZvT
         GQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748876272; x=1749481072;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfhsd3zciBf1Cp9ftO2PW78HLn18PhsRSwUscwaSVgI=;
        b=l4wPvGUwPvvwkeCdW9xzzUxWZyyk0QJdfe9fXtzD0WQyTby7BJYbnis/fzB8ZecPwW
         tfZxO7MWyG1vO6Y8zjkgdK2X8j5eX8+xcV/HlldeK2Eypmj6b0QDdXWaV52ViEzoAA8m
         ic+wuh5ciRXZ92L7wYed3A61VcV51yzxk/YRBlJnQaWNbvzAvtrGWsbUH+V6wNScNKQp
         WmYw6fWKzFkn4xmamONm3MmZCq0l1JfyprnJUZlhTesBLkrCgO9yBV3S8pQeBDnZY5rX
         4kBkwpREbGCzaz3pfs/FIYZrHEbKG131GbgUyE4oey+C2QpWvm6RDgLppO1GIlspRn1U
         NpZA==
X-Forwarded-Encrypted: i=1; AJvYcCXaNeHlvB/G6mlYRsVxhizUNUH2WHEQrshlDjIQNeCHTpOpUzSd6weEAUavrYsW36ykML6tdnKqiPLemik=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPE+yuae/t1sQU4T/gmhgJKAkVr6gVl7txFVjLeS2AjgpczfzE
	p0goIFvaXNp8X/inXPPKjIsCudsDBJh0QnDHMkBNSaxFltQ4xyNXXkgN9fgwnjeMzuw=
X-Gm-Gg: ASbGncvu/hHtj5x9h3jfVtNgpj+noMj5NYd1OTxpLS8qseIOqbkvwgvMHqTkX+fSf0a
	571ZfjPVlbiDT8YbOWeuwocHLCoZMOK2qaXgRmS2yP+FWS/Idi3nWncrUICQUOtVhgvk7UeIC+1
	vSvFMTDgeyXc0nedZLm3DOi+aY70HpGKY5e+vH0PMmx5qVOw+TSK223KxZT0Fo8D2/fmfma/nPQ
	byC3wHyohtYxMdp4P/j1dfR0T4j61kZEXzZIkojMRj4XrIcFdxjhKNxIyRuES9tSzBgw1aKhlhb
	s2TrJyFYdOeHxlXaUvWGFEEp3VV2TarQTWGMc0OzmPnwCWRtUYCSluCt
X-Google-Smtp-Source: AGHT+IGfnv2OjrCk3ytb5YlHCKbbCVzqXHLK2nGjgKhbsvUiZWJQa579rfG56TKztOc+yd0jWA5x4Q==
X-Received: by 2002:a17:907:9494:b0:ad8:8efe:31fb with SMTP id a640c23a62f3a-adb36c28fd7mr1181567266b.54.1748876272506;
        Mon, 02 Jun 2025 07:57:52 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad3a6c1sm804202066b.153.2025.06.02.07.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 07:57:52 -0700 (PDT)
Message-ID: <dc7c39c3-4388-4660-b3ae-e285419713d3@suse.com>
Date: Mon, 2 Jun 2025 17:57:50 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 32/32] x86/boot/e820: Move index increments outside
 accessors in e820__update_table()
To: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Kees Cook <keescook@chromium.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 David Woodhouse <dwmw@amazon.co.uk>
References: <20250515120549.2820541-1-mingo@kernel.org>
 <20250515120549.2820541-33-mingo@kernel.org>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20250515120549.2820541-33-mingo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/15/25 15:05, Ingo Molnar wrote:
> This kind of code:
> 
> 	change_point[chg_idx++]->entry  = &entries[idx];
> 
> Can be a bit confusing to human readers, and GCC-15 started
> warning about these patterns.
> 
> Move the index increment outside the accessor.
> 
> Suggested-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> Cc: Arnd Bergmann <arnd@kernel.org>
> Cc: David Woodhouse <dwmw@amazon.co.uk>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   arch/x86/kernel/e820.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
> index 10c6e7dc72d7..afb312620c82 100644
> --- a/arch/x86/kernel/e820.c
> +++ b/arch/x86/kernel/e820.c
> @@ -421,9 +421,11 @@ __init int e820__update_table(struct e820_table *table)
>   	for (idx = 0; idx < table->nr_entries; idx++)	{
>   		if (entries[idx].size != 0) {
nit: The level of nesting can easily be reduced by doing
if (entries[idx].size == 0)
	continue;
>   			change_point[chg_idx]->addr	= entries[idx].addr;
> -			change_point[chg_idx++]->entry	= &entries[idx];
> +			change_point[chg_idx]->entry	= &entries[idx];
> +			chg_idx++;

nit: I have to agree with H. Peter Anvin that this seems somewhat odd to 
me as well.

<snip>
