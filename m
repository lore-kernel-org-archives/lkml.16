Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E63D1865EB
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 14:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746370727; cv=none; b=mRCBMFHwCn7Q7mDKkWv+MD9I/BHEwaQe8PnIAthyMFFv35ZNjb7s1Yp63eIlLkdccImi8p7RTow4Fk9xB14CaTMdeyjQftP7f9SQhFwd1PiqbpQGHxI606Am15hCLc68rtR9ZLVZn3l6reDxH0BlJX2+O/scOxj6TtOdiQ8jz5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746370727; c=relaxed/simple;
	bh=YCQOkxAmAoKniJqGEMFaMB2obnpR1GeEVIGPxOrMFeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kLf++xzgzluGBFpOuDSjJumurjkevKeNtTEuTKEQvwSE6b+X3A96bKdfGkEMzCo6n00d80upPXDkZ5sWVFTmRWl4FqiwqxicZUaKw+ayIPG/jmn0PLPac05z959O2Qo+J4sFZBSwT3lDZISIuHQxYdRcGW/UalA5ih8axlE8FpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MV98NS3b; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MV98NS3b"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so5425057a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 07:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746370722; x=1746975522; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lJQWmC9QIR1GqAn7EuHVBw4D7Vmqv6rbT+SYCA2GeCo=;
        b=MV98NS3b/0myXum44BLXpg5OlLjQq320FfQvsxv3wZ6sp5lwN0W1fA72A/ExkNEwbE
         2jkaJzdidnh9OEZ6I6340JRoyRWn0XYKGMcG10nyDUBrVsVPNxnAl3p0zqfstvPRhoec
         av7K+aDP2MZHLB3ozGO4vwZqCLqFkDPI2aX/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746370722; x=1746975522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJQWmC9QIR1GqAn7EuHVBw4D7Vmqv6rbT+SYCA2GeCo=;
        b=AhfJ/nMo30KalTyEBrxpNE/tOcPEoxdVAC4cgaIKbctVVhMB/uKNnC67dEcq43/GnM
         RaQUhU2+9Kwx9KLRZjBrpJJcFdtf7t4r3/LaNsprPVbOLzI3u7OhelTpf6g/wFDww4ov
         gR0WWT+oAWmyU8AmxS+CxdZEMiEqqy0CxdTxpL5aBVmaQsw2lfzrxY42wYpJ0tSktdf6
         hPvdjUVNZZt2xk1LjV63Dbwz7kAcc7JeA5rBMscaBx601j1uUdVa5/MMviXh+cHnlD8E
         cxhTTyMLTq+Bbo9OuvDJYEvlHZnepIQQBdFEBQrBYSEwMJn7TSuhZPUfW5Up7EkJycLY
         TnmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYMwPQnv2u2lTGf56hWspQzYIlM1EgTPnFE97DBdO5J7RIacTjExljjk84eHE9kmUXUJfjQ4lZBI14t70=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvibmYbTvfTYwUCkKLD4xlNyJZOdPSffhPdr+JvIoykrJ3WB41
	QJidy6qTJMDpYTezXZbOh0hJ5LzNSZDHgWRvwbkDx3R7ObSs4pmA7lSmOQDdhpYktk8A/V4bo9j
	DrFg=
X-Gm-Gg: ASbGnctMvHdv+vj7BR7WuQ2B7/YrwkkA3apcvaNSuQNlSuGbZeniJek38N2eljRxrex
	UJDTBu/yZEoxlRKZCqiqB0zZnw33gcxfapRAdwBMPm/k24M383OE+shK8d9pX2rn/O9w2HIW/+e
	6J837DAWLwO6s113AwJousMhaAtTnayff45VlMLuj2CeZhLlAyhdu1cDAc3KMIjz0r/OyG5J6at
	h5qykQcTPXnCYrYebtn9Htm9uZH1KSczr02AvWg/B1TrzbmpBiAoGeCuba97992TFDjqvW4lGhE
	EE2w3obYgKdB+pylSpNjXrSvA6KzdgXX+p3Q/Y6MQdpGuVUv2QXXyqHebWq0Jhi8Zx+u7xWy6Va
	TbdfMx1qjcdQz5EM=
X-Google-Smtp-Source: AGHT+IHtOT5i2q2PbrLKqywsJGJX2Gtz6IrtQJjs8dfw0w13af98vHnH8ezOeJIhbaKgHSqlQArWXA==
X-Received: by 2002:a17:906:c10b:b0:ace:68ad:b4d8 with SMTP id a640c23a62f3a-ad1a4acf991mr397032566b.38.1746370722400;
        Sun, 04 May 2025 07:58:42 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c03d5sm337049866b.103.2025.05.04.07.58.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 07:58:40 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5f4d28d9fd8so4919422a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 07:58:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5beWoDynLiGli371JqoH+WHkTfTBjJyBXk2x0ScSGPIqllUeOdyRtF3ONpRKAj57HxVj6P0GeujcznY8=@vger.kernel.org
X-Received: by 2002:a05:6402:1e8c:b0:5f4:d4a7:dab1 with SMTP id
 4fb4d7f45d1cf-5fab057e228mr3829067a12.18.1746370720194; Sun, 04 May 2025
 07:58:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250504095230.2932860-25-ardb+git@google.com>
 <20250504095230.2932860-28-ardb+git@google.com> <aBdwwR52hI37bW9a@gmail.com>
In-Reply-To: <aBdwwR52hI37bW9a@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 4 May 2025 07:58:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiaEzS_7CBVTz3RYnDt5zJus_GsPtfSjojkqiiMU-vSHQ@mail.gmail.com>
X-Gm-Features: ATxdqUGrQFb-vV5qF8DsS24Prd3WnIbHufOoMJqqrYQlYx-uXMmu1ORPeNjPfro
Message-ID: <CAHk-=wiaEzS_7CBVTz3RYnDt5zJus_GsPtfSjojkqiiMU-vSHQ@mail.gmail.com>
Subject: Re: [RFT PATCH v2 03/23] x86/boot: Drop global variables keeping
 track of LA57 state
To: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Dionna Amalie Glaze <dionnaglaze@google.com>, 
	Kevin Loughlin <kevinloughlin@google.com>, Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 4 May 2025 at 06:51, Ingo Molnar <mingo@kernel.org> wrote:
>
> Cannot pgtable_l5_enabled() be a single, simple percpu flag or so?

Isn't this logically something that should just be a static key? For
some reason I thought we did that already, but looking around, that
was only in the critical user access routines (and got replaced by the
'runtime-const' stuff)

But I guess that what Ard wants to get rid of is the variable itself,
and for early boot using static keys sounds like a bad idea.

Honestly, looking at this, I think we should fix the *users* of
pgtable_l5_enabled().

Because I think there are two distinct classes:

 - the stuff in <asm/pgtable.h> is exposed as the generic page table
accessor macros to "real" code, and should probably use a static key
(ie things like pgd_clear() / pgd_none() and friends)

 - but in code like __kernel_physical_mapping_init() feels to me like
using the value in %cr4 actually makes sense

but that looks like a much bigger and fundamental patch than Ard's.

                 Linus
