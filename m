Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79BF1D90C5
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 19:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739127612; cv=none; b=UVpoFmI4gwqxz7tV6hoHm21mEZpp44Q5tNpxb5U+Gsgeb+/cxT+R1CoM0aqX1D+ZqYOPVnCu4Hp4lsETcn71v81Pijko4wXgLmkcngVJTGXkpnBRt8pMCUoMhLVgVt5PKE1kP8D8EciTpPVaCq2v4ex7fgvKaBdtHKGDUYG/E7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739127612; c=relaxed/simple;
	bh=Nx1COVUvU+wEBo7rS+A3sM2la1KsXXS0S2icQFTA4JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nDfWXr5ONO9NN4HeYHkoJbt0xKECgUI7C6+8pteK7rWRmAVbx7gmUHoAjQ5ixSgX7KkvR5b3oUw5ch+YoFdxQnLPXMgf4MKL5ZRSvsVexUdOQAGlVt7aSaQ/BGSqXMrQkcDuVyMKcXeaPTbUZV9JmyHvycTf6c/VMMAF6si1Qbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKNCYwsX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKNCYwsX"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so1809095e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 11:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739127605; x=1739732405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lvcmybcqSmJV69d37kVk3ARuIKqWRF/RWIOT4/WQv4=;
        b=MKNCYwsXhfyhWUeJ33MqAhuYpbE1Oql+r81n4pWejbfcY6yWPHlOMXFk3oSPkXcDnF
         bfMlnVZXYh/IrRerKauq6TnAKPB/LsuSn7/+5+7VGaelTFvTxP1CxcX+9q2DAqUDMZ/I
         j2PhEdcBkAUIa1sA09I7tTYyqCuAB9Bl+Kn93EA5CEyK/R0LDOemGQGD4aRoOQFEWFdZ
         3mY2Rib1xN9zUbWSqgUeaPHn4FOwgA355WbFNBbQX6d2+Id19726yJ4xwuYmA0+9xGiK
         7+IygOjyRz+KXrLM2TGncgPoe5T5nJBAZ2z6k+sK/cA8CqSH+/ezLWmcWrLA+LeABJ+K
         lrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739127605; x=1739732405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9lvcmybcqSmJV69d37kVk3ARuIKqWRF/RWIOT4/WQv4=;
        b=AaoFDpeA89IsFZMK1X8lz0soe4QWzcsTc6OZh6s3ri+LBHI5awmnskdWfGS6+/+KbM
         W/ZX/Z2NxazVG0fLse/oH4xzfgY0fx+AP+R0+417U2Ei7MlBdV0YHtYBphsP+qXCaSA/
         15KocGgMNqigCAKqnEgagLyO84+hsyf54Di+26RUONNxKoQLJ09Q4jsvhAoVq8lLzRai
         sz3yavce7aGzWyAY+faTGNYD9ZMQ0Rfoon/wEC6/CQivrbRmW6Q5ALoFJS36HDVeMSnU
         3mrmr6TVuWL7t5FEO/GK9BL2qvkXrFWKtSpGB/Xaq9U1q6WbDWkiw0PJTn09FkpHRBMo
         wncg==
X-Forwarded-Encrypted: i=1; AJvYcCXSH88cBVEH+G4beSrqXp5EIY6y4R1mz+kWS87FWq6cS2jmIqHqzalN1mX1YC4jXaV4FJWQwWJHg2B3pis=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyni8rBPpnsAJ0cuOPNRd4Tw3DXn6MiDV1fJAA3oOh4eAlRoHgq
	bDQxjxHQZQFlJ8pKbDxEu2HS2JgEQWz0caU5u4jmK030pH6RdRYE
X-Gm-Gg: ASbGncsVHxXQ5TxvJs8wyzrtoI3qrR95fTDnsUfdjs60DoW9PD165wrqzYBrX5+hAHZ
	+EjUCaegw/u4xhAjfpkdO8waC//86b52pGFnoeq/ZjxXMG0xKkp4Xtt1okVHkux/fVvJLDV+PrU
	a9HJw2PTrdZ9oqM/8P+svTGOoNfYEtZOeOIvrLMjkDXVGhSFCGUxSb+SAeApW9pWMFaPvxVzQ+L
	Dj6PUVK7puLzUmJZKbdu+qKfJeMo7RZlTK+LeJAqgF3XzZXagvILRILnBswABx9OyO8SI8iiTKa
	xflBhFpYGbSxXRCxXVixEG9rlHhSzQ88LLAi28V2l0H1YzNT48UL8A==
X-Google-Smtp-Source: AGHT+IE3vofKjpbREQ1MAELkIaFt3Er/nZu5pZY9Cd7q6ezuSdBAdBXun+LkMT0OQki/bAoKdHA8pw==
X-Received: by 2002:a05:600c:4f50:b0:436:ed50:4f8a with SMTP id 5b1f17b1804b1-439249841b4mr97057775e9.10.1739127604819;
        Sun, 09 Feb 2025 11:00:04 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439452533ecsm3110945e9.0.2025.02.09.11.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 11:00:04 -0800 (PST)
Date: Sun, 9 Feb 2025 19:00:03 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, Jan Kara <jack@suse.cz>, John
 Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 1/1] mm: Remove the access_ok() call from
 gup_fast_fallback().
Message-ID: <20250209190003.661db659@pumpkin>
In-Reply-To: <20250209182422.GK3660748@nvidia.com>
References: <20250209174711.60889-1-david.laight.linux@gmail.com>
	<20250209182422.GK3660748@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 9 Feb 2025 14:24:22 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Sun, Feb 09, 2025 at 05:47:11PM +0000, David Laight wrote:
> > Historiaclly the code relied on access_ok() to validate the address range.
> > Commit 26f4c328079d7 added an explicit wrap check before access_ok().
> > Commit c28b1fc70390d then changed the wrap test to use check_add_overflow().
> > Commit 6014bc27561f2 relaxed the checks in x86-64's access_ok() and added
> >   an explicit check for TASK_SIZE here to make up for it.
> > That left a pointless access_ok() call with its associated 'lfence' that
> >   can never actually fail.
> > So just delete the test.
> > 
> > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> > ---
> >  mm/gup.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)  
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> I often wonder about about access_ok() calls, if they still do
> anything..

They still do 'stuff' and end up containing a slow memory synchronising
instruction (to avoid speculative accesses controlled by the application).

But there are better ways to handle bad user pointers.
So, mostly access_ok() isn't needed outside the architecture code
that handles userspace accesses.

	David
