Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492712E62D9
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 19:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750189456; cv=none; b=KY8oXHUbEEqYwfT6EZTu4oBA075/KdAIdur0KQ3WJmMa1k1Q2sGAf2ztGDkgodZDab/Zbzvs/RXBTjS9GhgtDOMNwQNDquFrUrVbX5H+2iILgge5Z/zFjrbguy0SAUUqS543/gtQQf98ocsXeNj0VeVSCn+ZWLum6TJEZ6+sYtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750189456; c=relaxed/simple;
	bh=GglwgC9V6N5x5dY/greRFE2ImYu5s9zU1NI2hHBVjMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O0LakuSqAEqEbpVYkqK7mbtuhCa7noHz/jZVGA+DrFrOh1nvZTFEVCxI/e0ZwHYVhnIaPCnqoJBhxgdglE7aQs97Tpi1qsCFjjxAN6boWJ+bIunXwGXfhtFb+jD+HEpIp0VySofxtDv8mlb1DEstC8boUejvXJ9QxZ3ZOaF44Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NQQzjbOq; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NQQzjbOq"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-607c2b96b29so12058322a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750189452; x=1750794252; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9BlEsfucVc/RasLKZoG4B3LJbpSakOO/+DV6/Nb67hA=;
        b=NQQzjbOqUu+mki5AFz9jfPsnfnR+o0kX+ev1gARHH1+K+lMy4kh7UvyhM78HvjD7JV
         8Vtzis3NDCMBFko2oK3YY8mmGfRBjasjQV3I1pGa5jraKewkxkElu3Wraw8dCPdihibP
         6VkMof1CDemGZF9wL0FX4yEgiusSKWj5RW2Q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750189452; x=1750794252;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9BlEsfucVc/RasLKZoG4B3LJbpSakOO/+DV6/Nb67hA=;
        b=rVHOHrj9moH40M/54xQN8jdLaG5xE36V+FajeuhZ9jUCbPZp6OcLvKtsMB7WDXqnum
         qs6R9xnW5Ysh3sU5fh+aszcdtBejcEf+906I3BO9Xfl6UoGnT94E+j3n9pRXGJVqXHeu
         +rqsnpnW9MTjSFwNP7VL1eaPcNXz2V1ApCfwrVPNvkyDvaSk84qkks59ssANcFglFZYE
         BS38cnihXRIWT/uJUYxSsVBw7aZQexDN69M139AQhTyVfDLppMBRAzBmPnytiO/jDkUg
         MioFC8BibtCQ++T6rApehN3w2xl1J23GboW/dU477d9ANruvgcMP+7HJjoEZ8jgmHeRJ
         pQcw==
X-Forwarded-Encrypted: i=1; AJvYcCV91DFFIemYJO2QCEefOZh1Zhu3WXYuq5UMTqVhFyF1zYq/i/1Z5gut/qBEh2P58cMdToio+g3YeG5pT2s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9/FChEbYvqhJiwK+eRNk1cJ6i1keMaEHEBGC1DcY1Ogk0grZ/
	rJE6Sal1iHVtgkqxZBJazTWx1d3KqsyM9BdU92N6U1XLwzudNQA1xaDcC6RaN7RYv8VkmR9Bwbv
	e/S93DD4=
X-Gm-Gg: ASbGncudP6M8waKAzVJqbuW4eopHMTJ7bxtqzaiHq7N+zc8FALjMfdJi5y37bnQbWLa
	5vKwT0UKjZKTOA7R7qkw2/tkyfmm1nCW1nF6c2ZCj6OB8NUBIWVXdKgB9FOycthiRdnMF7lGgmd
	7exqYYAWfQiTlUrwTHAYPY4VkIQJp5cXcn0Dzv4T5ZJfdQGvIh7RPYxfSVSfF8t0QHV/l7h6YBP
	pQnCLYf1cPUZxG5uLp2pdA0f3cxb2543oZaHLScsdeA8bWVlOX0Svwy1Fh2emnotn5B76SNSXI3
	6koOYCNUPxhYU438XDeA9Gj3zRucrRxEs8m04XRf9mB/wa7fK5G91L/hwW17N/Dp3PMpBUZvEyJ
	Sw0Ig3H+qYYWo+09QSCEGH066bIuVe2DlzEk3
X-Google-Smtp-Source: AGHT+IH12jZtaqACKeVxKxSOvQPmGKlx+iCUmBq4b1yqYrJGF7hyCVALi9RfZEbaWQ9MLo2GvaltYg==
X-Received: by 2002:a05:6402:5186:b0:604:a19a:d84b with SMTP id 4fb4d7f45d1cf-608d0836253mr13007469a12.5.1750189452236;
        Tue, 17 Jun 2025 12:44:12 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6090063ff9asm5712125a12.21.2025.06.17.12.44.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 12:44:11 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so12933475a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:44:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXzKWtgvulTSzFY+3PvjBI123e9F3Lw0rUnaZogMcGLR/+ZY96/W5pKxcd4lplooocrro2qHfXf3YKZAFs=@vger.kernel.org
X-Received: by 2002:a05:6402:278e:b0:602:29e0:5e2f with SMTP id
 4fb4d7f45d1cf-608d086197cmr14681659a12.10.1750189450991; Tue, 17 Jun 2025
 12:44:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616014019.415791-1-ebiggers@kernel.org> <20250617060523.GH8289@sol>
 <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com> <20250617192212.GA1365424@google.com>
In-Reply-To: <20250617192212.GA1365424@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Jun 2025 12:43:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiB6XYBt81zpebysAoya4T-YiiZEmW_7+TtoA=FSCA4XQ@mail.gmail.com>
X-Gm-Features: AX0GCFszNgSlkg9Mnl9IREDvPmSYgcHDQLiQJ6pRqgmPlre4NTxTJm_9n0SX2DU
Message-ID: <CAHk-=wiB6XYBt81zpebysAoya4T-YiiZEmW_7+TtoA=FSCA4XQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jun 2025 at 12:22, Eric Biggers <ebiggers@kernel.org> wrote:
>>
> The tests are already in their own patches: patches 4 and 5.  Yes, this patchset
> has a negative diffstat once you subtract them.

Yes, the patches were separate, but my point stands.

Let me repeat that part of the email since you seem to have missed it:

> If I see a pull request that only adds new tests, it's a no-brainer.
>
> If I see a pull request that only re-organizes the code and the
> diffstat just just renames with some small updates for new locations,
> it's a no-brainer.
>
> If I see a pull request that does both, it's a pain in the arse,
> because then I need to start to look into individual commits and go
> "which does what".

IOW, I really prefer pull requests to do clearly separate things too
when we're talking re-organization. Or at the very least spell things
out *very* clearly.

Otherwise I have to waste time just to go split things out _anyway_.

            Linus
