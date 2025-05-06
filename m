Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64B6264620
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746523521; cv=none; b=nIwgFgUfrOuwrBIatSn3FLZK5wFZ44haXPHgehVf6wiXV9ZJlL+QMgTjiq9t73ZbkivRxYytysj5vi+EZIbzpOG5k8eVXzN8W0GRr0jk2tyo/JDkx8T6NF7HD1uXd7ig09o8m2+Z9YYHTC/0XEyN7nRSxadyYVnjX7TK2xNtgTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746523521; c=relaxed/simple;
	bh=u/fjceFFYQeTWywO/Seg4JF6qIiA9+WAhSikZDLBgdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VhtUHO9rwGg99FPiau3cpLbaTesSQfo/fzfZuQpw1ijgLgBiFosd/dVLvUgHDQoGdabSy7QPgu99hHehHQaQVx8BC1AKIpO265Aq7gSH0b5jsP41KwstZrUPt1rborV5SlZZFCDE6/nxDXfdFb/GWHZ9nEzC2E6//4Wma/am6UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SVjZVqlC; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SVjZVqlC"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f6c3f7b0b0so10711958a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 02:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746523517; x=1747128317; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DdF+CAHcMRS7HlmyHTj6/cf2/xdE8uY87Wf9zE4PiJU=;
        b=SVjZVqlC3G7FQ2kaxMZ3ibJaVdQN8m1rQPsTUyG0o1xk6d5I21X0ditdtcenVa1mCl
         vKjtATTjQG/nmT/pn+W44ub9n0oQVpp7dcdg6bPxdPhNNeFr1ayz/e2SasKajQCYKL7z
         13GQTwlPLMH8dSzbXG8gUVj4jY9gfgOgpEt3noyw9qYo3mJvlB9p0QdYy5SdG4QNc9FF
         IV5Jm4mo777Wm1OuMf3XDnBFPrlt210KSoTpFlao+mZee9Y2OBffaO4daSzFQ/6DuDR2
         u8nU0lEvpD/lSDJPIJF4YQs2N+PX/n24rajR0AeSUa1wDryRq1CL8KZeUF+kSmxj/Hdy
         PT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523517; x=1747128317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DdF+CAHcMRS7HlmyHTj6/cf2/xdE8uY87Wf9zE4PiJU=;
        b=LaQCU0sSRlFM/G9tPssSqsMs+EHyXJfVZfRglUTCC0D8TWW1y0/rl3doRDiYt3hm0u
         FlJigy5B5tjlBwoqGrduXLqieIlq8F57nteJ7lG+N3MeHp0XyBrvMZRhOgT557E2O4pl
         XdNzFDaALBq2dP0s7LqC9cluEeOuChUx9My2ja57rqZbUnD4Quo4HsIuEz53IftLJ2QC
         eqVCXFYFXk9QdWwe0x60iHTXM4bdG2kYR8Ukysmjg3HAmEl4B3yhGHpIRorLSWfkB0nL
         GZ0ty93jlMybYDVPdsfyEbWUkMQFaaIRa2UBSOmqvpIhZA9UixekNKbwIyJLbkMwaw6n
         5N5g==
X-Forwarded-Encrypted: i=1; AJvYcCV1GmeQBmV4FUi55ZG7rdgVE4uEl/zfIrPQjPiII7XfaV+QSwSQNRhIB/H3lMQYT2fIHGaDr9cWggWsL00=@vger.kernel.org
X-Gm-Message-State: AOJu0YylCzAxBsEbswJxpJ0c55QYDnBb+f5EtyPoAODDs4T8Wd+PCIW8
	t1scNhkAH76poQC4fHz+qZ5bvbn4vwaW7kdfBCuiyizRkzdIaImE5Iy7MAUwgqsOzFisqkuJ0e4
	vzk4=
X-Gm-Gg: ASbGncuCvuDigdRYWw2C3vOZiTHjTVaKQza8VIoohgEyNpWwnZXmhMRtahckoUB6eB/
	6DyGDF0cvYUwRtg1RITL9uhih1e/gqPOxCEHZmDDhwyWB4v55Kb9hW4JlYFmuYYYluusMnSVAGu
	/Jd6kk+MoZOsXyyQDjREaFwG16+3fgymwQBrQPhmYXiPGVmYLUFiBTBPrVXo6b2lZUs83dMhXm8
	UwkDPa51BP9oBP+GZdlG1inkSt7ppvRWg0L0pGjQuIoCPRKqza22B+4xoa2jP5vU8fptbyqmXre
	oZ0y4aFaQ8NiNoLpikS8bjUiPiu6wkJGGtQMv2DjP+Q=
X-Google-Smtp-Source: AGHT+IFJwd3zspYui36u1KUzmHMVo7G43aqyrNepvwB6J1nr5ibdR0TaraM6KsH+9IsD5N40UWm8xA==
X-Received: by 2002:a05:6402:268c:b0:5fb:3ca1:fb3c with SMTP id 4fb4d7f45d1cf-5fb3ca1fcdamr3871684a12.27.1746523517074;
        Tue, 06 May 2025 02:25:17 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa7781d7d9sm7310792a12.47.2025.05.06.02.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 02:25:16 -0700 (PDT)
Message-ID: <7803cd39-8b40-4956-86de-f2750d8e3b13@suse.com>
Date: Tue, 6 May 2025 11:25:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] gendwarfksyms: Add a kABI rule to override type
 strings
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@samsung.com>,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Giuliano Procida <gprocida@google.com>
References: <20250505212401.3379699-6-samitolvanen@google.com>
 <20250505212401.3379699-9-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250505212401.3379699-9-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/5/25 23:24, Sami Tolvanen wrote:
> In rare situations where distributions must make significant
> changes to otherwise opaque data structures that have
> inadvertently been included in the published ABI, keeping
> symbol versions stable using the existing kABI macros can
> become tedious.
> 
> For example, Android decided to switch to a newer io_uring
> implementation in the 5.10 GKI kernel "to resolve a huge number
> of potential, and known, problems with the codebase," requiring
> "horrible hacks" with genksyms:
> 
>   "A number of the io_uring structures get used in other core
>   kernel structures, only as "opaque" pointers, so there is
>   not any real ABI breakage.  But, due to the visibility of
>   the structures going away, the CRC values of many scheduler
>   variables and functions were changed."
>     -- https://r.android.com/2425293
> 
> While these specific changes probably could have been hidden
> from gendwarfksyms using the existing kABI macros, this may not
> always be the case.
> 
> Add a last resort kABI rule that allows distribution
> maintainers to fully override a type string for a symbol or a
> type. Also add a more informative error message in case we find
> a non-existent type references when calculating versions.
> 
> Suggested-by: Giuliano Procida <gprocida@google.com>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
