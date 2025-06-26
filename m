Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8532957DE
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750927173; cv=none; b=KFerim/ak+Y8tD+/73zkbnASMzocC5Gbks7WkuODGWyS7Kh2RlUB1xmhtXl90jB9/faeWilltgvzvQGgcSTlR4Ylle7HOCTHyEeRS653n/aHAhCFeeeipu+kEH0OfkVaMFTKaKpaooJmXJ4aISjmd6g3lKRlG42cju62yF8A24I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750927173; c=relaxed/simple;
	bh=6PaV7JJYXh8KsTODrQZtbOXxqLUgltfiOiPWjBNzpr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lMZIMF70DFuYI0jk/tucqHaZZekKVdw9uovLmQr0zp+hL3ig8NqST1DXKeL3MAg1aZzhE7Kj+vGkQ7L0yBwNGMTX+hrjnbyQ0dF/uS7zfho7Ee498SbVW/wDRNNkyA1CZS1XoeAPXorOFhRBVjQ8Rh7MGk3NWpfJDlm1eZU2hBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-87f298f3508so89341241.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750927170; x=1751531970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lob2G1MzEWqPTCQFL3Gx57+nKxmTHYmjapAHnccB6w4=;
        b=aMyVjkGdTofcUa6KrIUlzegNEpvxlFjo5Y0YA0fmbaxxXBKbKCOdvUNuNmRQEN5U2d
         qU1lT95RgsPYH9Jx3iIkp69rQmwE+/74kNQCi/3m5kWZagH/8rd9KaI5t8dubwgAnPBf
         inFCFzgYutZqWwzcxhOdhTO0G24T27VwGBjggoZDXXhB3tVYD8jzHGZxgEYvc9oOXlEz
         5y8aiUHA5rCVEEnCMEWqEqTk/e4KpU/rmfz5Fjcab51/cwhhEMMe7jgzZqIWutEW0OJU
         BHoOEhiBNR0TOFyT2sX2JuKNlU4qfu00rUVbMIooT6pLDPZXi9nIG5xoT9siJ3loA1h1
         B6Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWvBNOvVVijpTfhagdjohnvnDRgjCbsaJLY+Gg0SN9hMClODFkCWg9UW74WquKIDbRu56qCxZY5j8Ajprw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPZTyWgWtJp39cqgB29FQ8ioe3wPyXZr1U9hIIXye27oo1HRB4
	q21XoC1IfqeGoldQtSoOrj9ZttF5XFf35+4SBxdGHDIjRZmfOKRsRqoaqX4ikqMm
X-Gm-Gg: ASbGncuBBWvpp7RKLWzPfTMUTuvtxbbYd6fz+RvUCQXhM6CaftEpTlQMOR2NTBMAiUK
	yki614NGC8g3vpdCSZQFs/iVlbCfEaIRU2zyFcMKHpGxkPriocRzm+AGShBiOYESTiGCdjEUueX
	kj+E/pxTIgCDUfDbghXNm5Qg8ZxmptmdxVsBeYdSk8j67MWqduEZ7fH7jqEIMiC1OnrfH+Qi54v
	gXwVkpuqIlcIwoYD/vV3F5O15fHnlUOC/bHiQcKBdYZJfMgwDa2MOIITrDcWYOZmwxQJ/d5f2w+
	sF8tJQb/97NR+bNZLvNsv2FDjDcUSb+iIpMnNjx+cPfbMvjrbDLfmS5ECxlxRQPD4fIegwh1Nol
	OanYniHG6HptAxOBbN4SdwX3N1XbC73qOtTY=
X-Google-Smtp-Source: AGHT+IGN7BcT85hSHRjCxOKIK/IzmFH9kBzvMiCftMJnIe6AOQga4uRoeNROqs/K6KfNuzUl/oOqLg==
X-Received: by 2002:a05:6102:3909:b0:4e2:82b9:b377 with SMTP id ada2fe7eead31-4ecc7696208mr4276646137.18.1750927169855;
        Thu, 26 Jun 2025 01:39:29 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ec98c93ec6sm855822137.17.2025.06.26.01.39.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 01:39:29 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-87f0efa51c0so217036241.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:39:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwDv+1IPcFgEsAzzUL8JwEb46YV+P7Uwng4PN20hrwfYYxVQBMeCSXhXlzH5Zqvf1mxxc1QQhI+BBfv8w=@vger.kernel.org
X-Received: by 2002:a05:6102:441b:b0:4e5:ac0f:582c with SMTP id
 ada2fe7eead31-4ecc767318cmr4581498137.13.1750927168822; Thu, 26 Jun 2025
 01:39:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611001255.527952-1-vishal.moola@gmail.com> <20250611001255.527952-3-vishal.moola@gmail.com>
In-Reply-To: <20250611001255.527952-3-vishal.moola@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jun 2025 10:39:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWg6peQCvAbc9pDpwbWaihFgmLXqP_8wCJj0LqM2Aox3Q@mail.gmail.com>
X-Gm-Features: Ac12FXyvmwAXyOKQTays6DxovKUCjymJjBQVFK-JHF8Pq-Hwz9BIIkfjRAbKh6c
Message-ID: <CAMuHMdWg6peQCvAbc9pDpwbWaihFgmLXqP_8wCJj0LqM2Aox3Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] m68k: mm: Convert free_pointer_table() to use ptdescs
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Jun 2025 at 02:13, Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
> Motorola uses free_pointer_table() for page tables, so it should be using
> struct ptdesc, not struct page.
>
> This helps us prepare to allocate ptdescs as their own memory
> descriptor, and prepares to remove a user of page->lru.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
