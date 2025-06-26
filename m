Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B998B23B61F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750927209; cv=none; b=S/1TDdOYnkrdWwQZUFYDtlXA1jNurVSB8caKAd39T9v3dLj9aTOcJyLpDd4btnAVQBBpgi5mTjA9NP5VQDytXjcpjkCbFu4FRVOZAhFSOyXhGbrLk5OBE0cSjbF6C8fDT3jJKH0RyhYqY6sJQIdxtT0NTUnBuzcQCNPalgVJijo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750927209; c=relaxed/simple;
	bh=qeXksUF95t7j8fufzrGvvwqKIxNAuDnTZhd6tkl1V8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bJLCC1WDpeq5o3w1k+B+uViyfbCgbUZ5zj8CNrFkdP2atVdbBS/QSa9u9jcPJk/OvBPabsNRZBFcL9VxDNvIUOyHp4u91Od9FV8veMUCBWxlLSiqhqFMvE1UMLe9IfBdVnnSNV2jwar5A0VfmBHdAYGZ5YQ2HXe9LPgYgtXiiTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-528ce9730cfso209009e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750927206; x=1751532006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=md/YimW6cxDI1mQlDnB4XDpgGsxgoMmV/QV/Bk6cGXo=;
        b=nfoxBZwnvXDiVsqFGZAH+U4sqUmceoV3F471stf10QCGjsE/c+onBwPhAKadYcV+7B
         izT6u59HcZ3sn9543RfpRNmQx2DkaUYaK6niKTmNOSzbI7oPovI5KOcBaKHCypzGlifV
         B/pX/Aa/8RuFZD+tQciMguxgoRk48htnRGJvBoIRY2YMIObg65LIrAx9tnEVS0dyco42
         fp/DB/AouZSF8cCh7t34TE/qWsSvq+p1FXtHC//AayP1dWKu0TxFTb5T9exlhAT9U2Jh
         47ffPdkeG6Eu0X/tliYeTsHTkxpzJKS+JYWHVL+Qw0r1jD2SLOqNr/rnzJRA+0KxHltb
         wwyw==
X-Forwarded-Encrypted: i=1; AJvYcCWAxWJG3fITccYK2UMWIOVtQLxNa2cTsYfxAxCmBrdiLstIFlfBH1rP0sseYnHmKrmF0bwdlk3FPGz3pWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzxMhLA1+fDUl8Z04ojMp9RudEqLkMPG2uVWlY8h3yt+FsSslZ
	mrGvsH5CoEhi33+wfZHeAZMUwZ75o93HrLEIKIjRKPePa/e8/PvRY7b4Qw/QkcU2
X-Gm-Gg: ASbGncuJd8VLPO8GUqjp0GxV0z2iHLCU2LfTnxqK2TnSNufX+vN4Qc1Ec7toK/XGjdf
	vHH+uiLPjttBr+Athbpm2DB/8bPEKXzNBJaj/T9V+0xbPh/uA4I1mB8iwll40BrfCnQm/TDKams
	cQ2qvwauqXbTsex3yL+yu9aYe6dW9tPBMwmKo4CHbGIgBDUtEO92L7sDdWPDDlI1ofMLMpwnhC2
	kJ1pe+qBs6BNeIFua1x6oS/59fHfP6fM8KoHH5KnPqCgf5Ki5JTToi29JDMkAfHJ/RMxeiU3F1m
	IMIw1Os6SuqA+TDGT4mEuYbNTIPgc2OWhag6cPWHY2c8dGCVRWf2tX6krvCRjLHJRTq/axrWsy/
	Q0+FUfImYaDipK+z8LbsvWLDc
X-Google-Smtp-Source: AGHT+IHnuJfEbwR/5nyKBqnene9mGswsbi2c7TiTuE7VUOBI51swcWSiEdobCB2bDM+5TYkmjFo8jA==
X-Received: by 2002:a05:6122:2887:b0:530:6c3e:4db1 with SMTP id 71dfb90a1353d-532ef476ce0mr4960702e0c.6.1750927206380;
        Thu, 26 Jun 2025 01:40:06 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-884d1da0967sm172218241.29.2025.06.26.01.40.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 01:40:05 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-87f25076697so218683241.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:40:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVt5ErtfIWDDVHuCFR21Opf+1Sd9+8X0CAEToujigJo9Y9svUilQwj2pOJtVHmpmTorOWm6RZVhnEVeTXI=@vger.kernel.org
X-Received: by 2002:a05:6102:e0b:b0:4e5:a6ad:8fee with SMTP id
 ada2fe7eead31-4ecc76995e9mr5141786137.19.1750927205507; Thu, 26 Jun 2025
 01:40:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611001255.527952-1-vishal.moola@gmail.com> <20250611001255.527952-5-vishal.moola@gmail.com>
In-Reply-To: <20250611001255.527952-5-vishal.moola@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jun 2025 10:39:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWTUH7g8rsv+U7oRQi9Xxrg-_LWmBvAoV1XBa3BvrSA8g@mail.gmail.com>
X-Gm-Features: Ac12FXzMwLUwExJVMIRYYdFiU5SpZE69imPVWDF6nzBjPzIJC28SN5VooQ2k9_o
Message-ID: <CAMuHMdWTUH7g8rsv+U7oRQi9Xxrg-_LWmBvAoV1XBa3BvrSA8g@mail.gmail.com>
Subject: Re: [PATCH 4/4] m68k: mm: Convert pointer table macros to use ptdescs
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Jun 2025 at 02:13, Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
> Motorola uses its pointer tables for page tables, so its macros should be
> using struct ptdesc, not struct page. This removes a user of page->lru.
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
