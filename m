Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D477A19049A
	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 22:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743029134; cv=none; b=dvAdla50W7pv+4WqYbSy4gAZ/kER1UsnLg0Z1phhD1MpjvbswAL/pFgUrH/xAbSq91jGKa0UQANrQkEJGqpA6Ok0vwjmDCO5dSuryoAM+GDoZqKojMNNTuGx9NqDqreKmspLj0/8Rn56/gi1cjB5EsZbOcdOSUuNFSz4cRpVots=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743029134; c=relaxed/simple;
	bh=BVLc4Cs+kPGHHIapTf7b2/6k7Pv1AD4F+S0N9LLwE90=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JbBwyC/sHiRHtPGRKVDo+J4Vl3d+sdzChkEjOHtGQtIAgwIh7httC+W6V40eTD64vS/eaE2+IdFX938v+lybsmwvSzcf8OY0hJ5rpCRhs65i1Lr93YopmAmtLquSpB+E/siQzOhmxYtOVX0K+uvh7TbbcCq5qSbB9H9QYoJUi0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BG0eYod7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BG0eYod7"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso1540195e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 15:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743029131; x=1743633931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iS9lo6v9uqzT79qsPERG/X1mPvo0CpW/ilxnQt/Lclw=;
        b=BG0eYod7dNLta+Whs+pHV4NRzSSHbSybVYxi5vIz8DokYLAQjinvaGQhlZ3gOW+uL7
         IpOCLija67W0W5hBEYcAoS7X1sCEIjDnUzZ8nyVfUcY/VjCJ2VlaDh1ANZpoaxvXodqA
         KNXCjupwC1V28GpgKgcrnDvitWTtxV2109Esdv+tt2BKFySzVUIkITFw0+5GvBU86vzb
         NsCnxinFwojsKK9Skku16KMn84Sx7EjI4eoe1LMwdbD3eeMfP0TQzhNxdy2wNYU0gikU
         rnUeUzYW2M0fcIgiS8x7psR3eW2y2RjXTzspCyrsPNE+ggp+K6EZn5eCB7W0eRJZhdmk
         07UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743029131; x=1743633931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iS9lo6v9uqzT79qsPERG/X1mPvo0CpW/ilxnQt/Lclw=;
        b=AXd1yzcBpJu07D217Sx0af/0iSYZGUaikCrrBjsH6D3RYL4uXW/kZR3xnN9hwrRDw+
         nDArB2RtvN8jPnrjzNAAefCoK6GOp5pIKEigtf9WJ5uaev9saVSWyzViDjozDgTcsxGV
         iyGEJ6DN8pWcXUwO8vgkyqHoFA02EDqtRUjFs3rXBZ+3XO/tn2Vi9+ehDsKYm2ugOcQe
         8mjN7C0GXpQwlJVY0lclon0kQp3nJBxmmtKcFH05bzDELdFj5jxBLOpw5zvlYPYc0hR6
         QHGMyAtI5hQugibYaD8pxkc1R6/JAYJNqHWvYO7ouRwHUGnVjq1h+vjCS6P2gzsLPr53
         9OpQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1QXUmwqx07bvNBsrqZQpX3o5ADDGfeKaPxCBDPz2MzYnwnY9UqZ2+KiBVuGun2/fPsj6FfA7veFGb4Pc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRFissDETEJeXuUn+B5dY8QvhP21XVTi5leRWKH7QP+krAd1/2
	UxtDIPSsxehJ39OfcQmJV9F8BYeHLECF7aRVt58y25yiRYjLYTpW
X-Gm-Gg: ASbGncs0eQZeWm48saiURJcwWqM3MdWl4hRU7H8wdX0DbxjpTJoIZLLENyJKD2QPk4c
	xtrjXIPYVTOnhO7qaLAnsS9e6rQQhZuSU1tWWByUpqGLeSNXgW5X/cYsncB9ZF+WAMAKQ8DX/Cm
	h0jaI6X0nYx1+DHoQQkXDw3rRizwSeu3NQE/rt5ReaJaYlnt84eAuD93Xd3Z/luxXdpjgfIBoTm
	+2rRKEk/D8T5XuEUTAQMWVQX4JsPPef9aMc25TaHMg7R8DGq+d9VYJK76nfJnHIbNGISRyWeyMQ
	RJCAnTKGxFRsIaoncSraHd3BOuMTx5r+SJmZXPRiKue9Q/Kj/jrURZ1+VRyjnPC2zMICMSxza1X
	W3HhFyTE=
X-Google-Smtp-Source: AGHT+IGbdP8c63lTJLIt4kC+AH9ZhmPIkxANQSWDYKC1hULMCRkqfFuZm2V6NAjr9d7ZqsQrCPYgfA==
X-Received: by 2002:a05:600c:4f94:b0:43c:eea9:f45d with SMTP id 5b1f17b1804b1-43d850fd6aemr12139275e9.18.1743029130752;
        Wed, 26 Mar 2025 15:45:30 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82e835fesm16972295e9.10.2025.03.26.15.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 15:45:30 -0700 (PDT)
Date: Wed, 26 Mar 2025 22:45:27 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Herton Krzesinski <hkrzesin@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mateusz Guzik
 <mjguzik@gmail.com>, x86@kernel.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 olichtne@redhat.com, atomasov@redhat.com, aokuliar@redhat.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86: handle the tail in rep_movs_alternative() with an
 overlapping store
Message-ID: <20250326224527.10105902@pumpkin>
In-Reply-To: <CAJmZWFHTG8cR77zrUpKF81tphcTQ1fyDO6vqnY57ptcs2yM=-A@mail.gmail.com>
References: <20250320190514.1961144-1-mjguzik@gmail.com>
	<CAHk-=whd82fzhEbFRw9d_EMtR1SeefOJabjCHcm4-6jzeqqd3g@mail.gmail.com>
	<CAGudoHGNFT+LC24842ZKLWBxD3vvvddBqDKa6gkixN4Esor+RQ@mail.gmail.com>
	<CAHk-=wjo__Bj3JNw_7E8HhTDUF65LVOApvN0D2cofgotJoqpmg@mail.gmail.com>
	<CAHk-=wjxi0poUzCd666Kx5wCjgOwN5v=-zG8xSAL7Wj_ax8Zvw@mail.gmail.com>
	<20250321204723.1e21cb23@pumpkin>
	<CAJmZWFHTG8cR77zrUpKF81tphcTQ1fyDO6vqnY57ptcs2yM=-A@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Mar 2025 19:42:09 -0300
Herton Krzesinski <hkrzesin@redhat.com> wrote:

...
> I have been trying to also measure the impact of changes like above, however,
> it seems I don't get improvement or it's limited due impact of
> profiling, I tried
> to uninline/move copy_user_generic() like this:

If you use the PERF_COUNT_HW_CPU_CYCLES counter bracketed by 'mfence'
you can get reasonably consistent cycle counts for short sequences.

The problem here is that you need the specific cpu that is causing issues.
Probably zen2 or zen3.

Benchmarking 'rep movsb' on a zen5 can be summarised:
Test overhead: 195 clocks ('rep movb' asm with a 'nop') subtracted from the
other values.
  length    clocks
       0       7
   1..3f       5
      40       4
  41..7f       5
  80..1ff     39 (except 16c with is 4 clocks faster!)
      200     38
 201..23f     40
      240     38
 241..27f     41
      280     39
The pattern then continues much the same, increasing by 1 clock every 64 bytes
with the multiple of 64 being a bit cheaper.

With a 'sailing wind' a copy loop should do 8 bytes/clock.
(Faster if the cpu supports more than one write/clock.)
So might be faster for lengths between 128 and ~256.

Misaligning the addresses doesn't usually make any difference.
(There is a small penalty for destinations in the last cache line of a page.)

But there is strange oddity.
If (dest - src) % 4096 is between 1 and 63 then short copies are 55 clocks
jumping to 75 at 128 bytes and then increasing slowly.
(I think that matches what I've seen.)

	David


