Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97615276054
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747740546; cv=none; b=YFtAu17peMHcxKeoGvOxW6wUd1h8UKclT2ufHXvqq/4LWTZzBkPiGodZUI/pQWcAbd83lBNKlIW2Mg7TDComhjkB6JZdgZVlPVn/Eg++K45/+pXqDJjXbgjJi83edHN3QMdG1lHInsjtWo6K/G5kEFWOXjBi2LT1Imj3RGQDcrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747740546; c=relaxed/simple;
	bh=ITixkASM5BUY8sv1BMLy4OLcgMe9u7SJzfLP7iRRUeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RQFojUKY+64yQJUFp7IMYjgTzA2ceNXeLS5PTH6G04LgEQUXUBApfPrP58iI3AOnSW8pmd6SvB+Px/A/d+v8WPV/27NVnDg3YDpDAM0nELiM1f0frOe4J+sIH6LfoJNnr1IkMKxwYsEzJR8jW/DhHU1UBERFWEmYsnnxEYNTQEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pz9/kGfv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pz9/kGfv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74489C4AF0B
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747740546;
	bh=ITixkASM5BUY8sv1BMLy4OLcgMe9u7SJzfLP7iRRUeY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pz9/kGfvWLy9zVVuBw9HWkvJfYUd+6/d0ky7BF+6hhdFKOW15z6kz2Hi6EG7ydB0G
	 GjMCflxWPe3K9/gXkgPPg98CxI9D0MnA7N1KGCsXtQ632PvfW4GV1kk/GPqpwa8GWh
	 AR5tm2cv2anH3KXNjpGTLUGN4caRhlTAx9hkWMH62/bHgFLX2fC3/9HAlcIzjHOFjV
	 4ceUvveInO8utOW7ED1SgXY40BquTGoJfoW7tsp75buN9+ifUUr6Slt/zMSynqgn9T
	 mSNWS2ShmCk+s330lF1Rv3M652g8FflSB0GXtyKdgOWhPhWaqLm9mh4ELc2YZi02i7
	 oXRJN/Ke/b3zg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so6938316e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 04:29:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVsybHVmjze40YLgNi5/YZIEvRUkdwDAXfEvvRPOLKCbpswYwRLZbChHX8IiVJINuY3pCwhSabN4d7dbZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzH95Q8yb20DGLdqkeng30Ra/LD6OJrP6JAXkUn32y9zFAVhG8
	CZRRw83ak/BVX4sLmVbgYHO9y4tGDHi0PDYjFn92yfvbyan4LgBMMq75nty+nTxWkNYkSSbpfaA
	LC3z2uOCxov2FORo8d5s8PE88JL8Xzto=
X-Google-Smtp-Source: AGHT+IFdHbQ3GaFPmumYDG5VnaYJludIAs/4FDnfD9vMwy/1qcvTwH7RXLhX5vdT3HXZoyfuzfy9/yn3fHq++qPfbqA=
X-Received: by 2002:a05:6512:460f:b0:550:e5b3:b1b1 with SMTP id
 2adb3069b0e04-550e71952b2mr5158922e87.12.1747740544811; Tue, 20 May 2025
 04:29:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520104138.2734372-9-ardb+git@google.com> <20250520104138.2734372-11-ardb+git@google.com>
 <awmpxjln22i5zmnv3wcwhzvpbbjqmhiw3onmpq66owbtdoujs5@f336cwpvlasn>
In-Reply-To: <awmpxjln22i5zmnv3wcwhzvpbbjqmhiw3onmpq66owbtdoujs5@f336cwpvlasn>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 20 May 2025 13:28:52 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE+2P6_y0SnmtmD=J42pe67itnr5jQs6NxjMTvV7HHp0A@mail.gmail.com>
X-Gm-Features: AX0GCFvApIPVyrHszFFfybr6GbvWF8eavV4pUDvP-KAQaxSTMaRBYOz-axXzC_M
Message-ID: <CAMj1kXE+2P6_y0SnmtmD=J42pe67itnr5jQs6NxjMTvV7HHp0A@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] x86/mm: Use a single cache hot per-CPU variable to
 record pgdir_shift
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Brian Gerst <brgerst@gmail.com>, Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 May 2025 at 13:03, Kirill A. Shutemov <kirill@shutemov.name> wrote:
>
> On Tue, May 20, 2025 at 12:41:41PM +0200, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Shrink the global variable 'pgdir_shift' to a single byte, and move it
> > to the cache hot per-CPU variable section so that it can be accessed
> > virtually for free.
>
> Hm. I am not convinced about per-CPU being useful here. Read-only cache
> lines can be shared between cores anyway.
>
> Putting it to __ro_after_init should do the trick, no?
>

Are you saying we shouldn't optimize prematurely? You must be new here :-)

But seriously, whatever works is fine with me, as long as the
observable return value of pgtable_l5_enabled() never changes.
