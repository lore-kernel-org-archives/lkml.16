Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA532A1CA
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 09:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743932123; cv=none; b=JgOsW6mgKJpsBquekC684uY4kSsnIvn2LQh2DFq3cuz7S6SfOcmo19ovPwDPm8AF/hcYzioEp9CBHL4NbmjgsHJfMbBoDGqS0ZEmJQnTEDx7nRb+41PHSeyUkqUk0HayGVpMYwPbGl4DgiMm6rw0GtONuPSE0oEQZAJnRruUPZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743932123; c=relaxed/simple;
	bh=h8x7CPj3Uez1QG6s4rJAUps0i+C+b7Wur4itq2wdRWU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UUHNVtXD/hINGGXWmLXSC2wJtiUUi7A0iajAcVYqJGMsdevgdNGNLekof2Xm9zQSm4X5il971PsL7I7TdUPOjxVLNfzXBX2wfsgBT435qUcuSy097zjUSaz/lZvdONNNyM4qkC76ITLCPZexey7iknnDlJAifwPlJkPRpycd1TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XiHlmuls; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XiHlmuls"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c1efc4577so1820497f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 02:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743932120; x=1744536920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+0RAdE7mOv0Vx695LUmkWS72J17zM7YZ2AJmVX5tihk=;
        b=XiHlmulsGCQKrt1podtk/tNtrz7Gti+Zq9jkaQBLoCDvpQcHvoiinOaid4tg+7opEO
         T1K3QpSLjl91iRx/rfRd2HkeOtNEBFU3usR6BXmIAGEDaKJwxoQqlMGgrkOQhS9s34rX
         n67Vgmf1AyCH0/mLfJ6Gql0ktt8La4UjQcUCZIrIDfubilqUIYn7Rc/T0nhQtSNSl46W
         LRZDTKdCyG2d8unQ0XDbjl/WegidsfURjfnMM6GeawSfhVnqL0szJMmmJXejNVtz1srs
         llnMDsuX4fE9i5wpa2ESJsLXoW085dGdz2iNYUvhrZlndLzmjyVBoBO1YXlvgmXsSlNU
         aIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743932120; x=1744536920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+0RAdE7mOv0Vx695LUmkWS72J17zM7YZ2AJmVX5tihk=;
        b=C9/h6ZQ/ET/FrPDQ/UJEwFEFOcjtNlLX4DG/ybF73ghG8OS7Tz3tDk3xipQ2DuYEEY
         6RUWuXruWYLylJ9UEyH5sVKyQho3YLyFlko/7eJuO2xAxhwwlcAgiJAzZj9W5TsFj1bj
         T8Te7JVRIFQUsJWkvaqXq34yA3OncUoNjfr3e1Ij+BMOhonmegA38LpHUY2q8JvcJ6Od
         EenW6qEnbQ9yu3JiPXtzdUY9/tKldX+fprNpbeLy0v+fzOsTLsy2Vat84VrWlS0oYvcI
         pSx8VULKc7sxC+cmkOptK+SYjS6CKcVbsh0t36GYiHLFOMSCddjeR4ZkVF9MDjNsjWy4
         wKpg==
X-Forwarded-Encrypted: i=1; AJvYcCVPEmkLBRDveUFlg36zr0xn6lmULTI4/5pOgtgFTCtNImdkUVrHXnckZWX4MYFdhmkZ4wiSqzutfIzxAOo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsgq7bNFIlIiq8iPt4PQAtTls/PQBQUidbJvi6UZoBF3S5YkKI
	CDsOJr9crr1zTqjgWftYeqzxe+qX49uRfSQM8JoBvW0bNQ+XS4hM
X-Gm-Gg: ASbGnctCBgvzLK+jQ6Vq33b/GvQbZF90suWk0atjcTusPsN11OtoD8vZJhHfAO1c99M
	RBRYQB3LegnwXIH44teCrn2LH1DzoUzxskkzONfHOLe8h2Y6FGahFjzWZ/Karn9xwnnOjVkljnW
	hiTbuq5O7Pi/hcI+ROSwIgrVqT+N2ONbw1DAXKoBtUy/ERXQM51ZRxOvEUio1fXzEQOJZgKZg2Y
	SPqj7yDKCw3TWiQuWnzx3UFPv+yc9hJKwpUGiDK1qNdvF3SCKxBNJcJZRlwSZyhDL9x/hl49ZkQ
	lYjvV3qdPD3sDBDC7Ea76w63nCO2UuGD4z7E4iIZf1zwLA8yDTB95D8ett7xHDlGOjlAkia6n5h
	L3XME4H3DaHjMIcZwnw==
X-Google-Smtp-Source: AGHT+IH3gcbipcXWr9OTwLddb7q12GrJpjJrj06O7GrLgcsZBW7N/RP4n/IH4BeospXWp3DaTJTzqw==
X-Received: by 2002:a05:6000:1a88:b0:391:47d8:de3a with SMTP id ffacd0b85a97d-39cba97f7d5mr6820324f8f.53.1743932119854;
        Sun, 06 Apr 2025 02:35:19 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a0a90sm8870188f8f.21.2025.04.06.02.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 02:35:19 -0700 (PDT)
Date: Sun, 6 Apr 2025 10:35:16 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Pitre <npitre@baylibre.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>, Oleg
 Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Biju Das
 <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 1/3] lib: Add mul_u64_add_u64_div_u64() and
 mul_u64_u64_div_u64_roundup()
Message-ID: <20250406103516.53a32bca@pumpkin>
In-Reply-To: <43q1qr20-9q83-74n7-no7p-n178p6s6p279@onlyvoer.pbz>
References: <20250405204530.186242-1-david.laight.linux@gmail.com>
	<20250405204530.186242-2-david.laight.linux@gmail.com>
	<43q1qr20-9q83-74n7-no7p-n178p6s6p279@onlyvoer.pbz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 5 Apr 2025 21:46:25 -0400 (EDT)
Nicolas Pitre <npitre@baylibre.com> wrote:

> On Sat, 5 Apr 2025, David Laight wrote:
> 
> > The existing mul_u64_u64_div_u64() rounds down, a 'rounding up'
> > variant needs 'divisor - 1' adding in between the multiply and
> > divide so cannot easily be done by a caller.
> > 
> > Add mul_u64_add_u64_div_u64(a, b, c, d) that calculates (a * b + c)/d
> > and implement the 'round down' and 'round up' using it.
> > 
> > Update the x86-64 asm to optimise for 'c' being a constant zero.
> > 
> > For architectures that support u128 check for a 64bit product after
> > the multiply (will be cheap).
> > Leave in the early check for other architectures (mostly 32bit) when
> > 'c' is zero to avoid the multi-part multiply.
> > 
> > Note that the cost of the 128bit divide will dwarf the rest of the code.
> > This function is very slow on everything except x86-64 (very very slow
> > on 32bit).
> > 
> > Add kerndoc definitions for all three functions.
> > 
> > Signed-off-by: David Laight <david.laight.linux@gmail.com>  
> 
> Reviewed-by: Nicolas Pitre <npitre@baylibre.com>
> 
> Sidenote: The 128-bits division cost is proportional to the number of 
> bits in the final result. So if the result is 0x0080000000000000 then 
> the loop will execute only once and exit early.

Some performance measurements for the test cases:
0: ok    50    25    19    19    19    19    19    19    19    19 mul_u64_u64_div_u64 
1: ok     2     0     0     0     0     0     0     0     0     0 mul_u64_u64_div_u64 
2: ok     4     4     4     4     4     4     4     4     4     4 mul_u64_u64_div_u64 
3: ok     4     4     4     4     4     4     4     4     4     4 mul_u64_u64_div_u64 
4: ok     4     4     4     4     4     4     4     4     4     4 mul_u64_u64_div_u64 
5: ok    15     8     4     4     4     4     4     4     4     4 mul_u64_u64_div_u64 
6: ok   275   225   223   223   223   223   223   224   224   223 mul_u64_u64_div_u64 
7: ok     9     6     4     4     4     4     5     5     4     4 mul_u64_u64_div_u64 
8: ok   241   192   187   187   187   187   187   188   187   187 mul_u64_u64_div_u64 
9: ok   212   172   169   169   169   169   169   169   169   169 mul_u64_u64_div_u64 
10: ok    12     6     4     4     4     4     4     4     4     4 mul_u64_u64_div_u64 
11: ok     9     5     4     4     4     4     4     4     4     4 mul_u64_u64_div_u64 
12: ok     6     4     4     4     4     4     4     4     4     4 mul_u64_u64_div_u64 
13: ok     6     5     5     4     4     4     4     4     4     4 mul_u64_u64_div_u64 
14: ok     4     4     5     5     4     4     4     4     4     5 mul_u64_u64_div_u64 
15: ok    18    12     8     8     8     8     8     8     8     8 mul_u64_u64_div_u64 
16: ok    18    11     6     6     6     6     6     6     6     6 mul_u64_u64_div_u64 
17: ok    22    16    11    11    11    11    11    11    11    11 mul_u64_u64_div_u64 
18: ok    25    18     9     9     9     9     9    10     9    10 mul_u64_u64_div_u64 
19: ok   272   231   227   227   226   227   227   227   227   226 mul_u64_u64_div_u64 
20: ok   198   188   185   185   185   186   185   185   186   186 mul_u64_u64_div_u64 
21: ok   207   198   196   196   196   196   196   196   196   196 mul_u64_u64_div_u64 
22: ok   201   189   190   189   190   189   190   189   190   189 mul_u64_u64_div_u64 
23: ok   224   184   181   181   181   181   180   180   181   181 mul_u64_u64_div_u64 
24: ok   238   185   179   179   179   179   179   179   179   179 mul_u64_u64_div_u64 
25: ok   208   178   177   177   177   177   177   177   177   177 mul_u64_u64_div_u64 
26: ok   170   146   139   139   139   139   139   139   139   139 mul_u64_u64_div_u64 
27: ok   256   204   196   196   196   196   196   196   196   196 mul_u64_u64_div_u64 
28: ok   227   195   194   195   194   195   194   195   194   195 mul_u64_u64_div_u64 

Entry 0 is an extra test and is the test overhead - subtracted from the others.
Each column is clocks for one run of the test, but for this set I'm running
the actual test 16 times and later dividing the clock count by 16.
It doesn't make much difference though, so the cost of the
	mfence; rdpmc; mfence; nop_test; mfence; rdpmc; mfence
really is about 190 clocks (between the rdpmc results).

As soon as you hit a non-trival case the number of clocks increases
dramatically.

This is on a zen5 in 64bit mode ignoring the u128 path.
(I don't have the packages installed to compile a 32bit binary).

Maybe I can compile it for arm32, it'll need the mfence and rdpmc changing.
But maybe something simple will be ok on a pi-5.

(oh and yes, I didn't need to include autoconf.h)

	David



