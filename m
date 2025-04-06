Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623912E62A8
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 12:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743942631; cv=none; b=tZ25ZGfwa1HokQu5YcDFp7Do1Ft2lsYYt7RgKaqR2O+zxaszVp0EzSO9KH9uoVSxAeKb/JRsx+eSSGJjppV03+MqT7E/NnBzbFS8pan5gpZx1mU7oBtPGtq51pGn0wSb83AEI25T86Sb5CfWKSUVXArP0YkV7CdCFvYx0KvoH88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743942631; c=relaxed/simple;
	bh=N5r0JiULqzPi+V4N19jPfbBwt6AhALX1PgzKOoXE+iA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rEYZCJl20R1/HQRXaG1rg/kmE/sjefD4QKRkntWFtpVBwns/cV2kvtxfskKJvPTV9XdOK2I6R7jjWo0iQ8iKW0Exm4Oblz25ncMuE9I29Kyqbc1SVBSrlCXiavEpJJaPkTalXeM6Mon+08Cgyff98bKtfwzWcPW9WqUbnCITqrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYKPPOIh; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYKPPOIh"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so29685645e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 05:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743942628; x=1744547428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27ZzGC1mXUeS6cbn5X3MQhYDvdmp1YS63dmHNlqBrgY=;
        b=VYKPPOIhS/ixEalr3sTPFsL0YR0jEm6dEP99OKwFnotBwKBp0tiN3o41Ba//Sg8mcI
         4+VTfJjmkDein3FI+fzq+0+Yi1oqtFm3XPOd6qBxPxyQFnY5JXni9GYLGythDZ9BZEOW
         EjVMKGM3HTCX9+6TYrQg7RqUBKU/x4aAeGYxnSwlwYrCFaGY0JqT9/HrFBaywil4/Yoj
         3aKjpFhsdk6x/MsZ0bKHuAFBFTIn6Aarw84Ha6T6N62wsXccu2Lf5sEHgO3I8nvMTMSj
         VP3+Yf03io+4v3VcGrnWZ8u39tZYxHzD7/y60dzjI246wkJa6jyJFnjc+XKZT2RfxKfP
         wv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743942628; x=1744547428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27ZzGC1mXUeS6cbn5X3MQhYDvdmp1YS63dmHNlqBrgY=;
        b=EhGHUiHK1l3GgOslhj6YkYTkWZnyZAUU9rsIAHoOw/nm6KzHiIMBwpm2ZQtsg21tHw
         Har4ZsVat4x3JRF9MyyDogqWgoPIN+DYWGYnk7ZjUwfb9y6D7+e+CHLYcBWL3149Vfp3
         Q4pGAhJpHaSlc93Nv7+DeEmnwhPKMsJeeAe9XFmC22XWwjXeJO5oz6AvJRkMzd4W2sqJ
         10veBbkRmhYQl85ZnXC8qRve4zKqFZUeooAOUSXGyJuiNVA9E8yxpObQZ6M1GJx8JVpd
         8zJGbTJZDhr7OxqiDLmn3joH2SRr1owgM2kBkKLSOkJpzjJxJanxa9kRHsSbqthAdFtX
         hfxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsLQmEQpINcJI6aIVA32vFeV5BsWF1s733VD2DglG7qQ/k3eMg8/rrFvtd1JTwXdXxg5DCyTqsxRkeSNg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPFXZoL9wlv1oiPIEYLkqIh0ZO5p4FAC+C3KYxJghfSQUEIuur
	mCCkFADHwT1E1reL63ZJT9kpsWq0ECss1Op9rVSylZseUMFAc8y4
X-Gm-Gg: ASbGnctgKK0A367xiX/+kydEFQ2ww8xX2QVY8pDH+ep1oNwR7k6CX94JByGULdBq3qK
	IQnVnIA1z2RAD/BI+wjPXsh7HzojQ8Ey7G1U2Z7E0SHMr9FdMN6RxqCLOFcfatnW+aa1JENJDGJ
	iKhln9hqGUcg+oQ14ivEXsOxqvAdNu4AGj6uCLJvfYSHDNvYVJk/RpEOafmwxVLUJjQ3U2nAs6a
	hQ1qu05qhM0vSdFeaXOdVq76jaHG73naLu5+bdEJhmzYrRcuNQ4zwyErQvUfz6zsgTaSEq4bY78
	045vbOKRiklUDS4UDboWzOQoQ5DotGMHakqiEBDxB/HYDnaMETMxxPBPv2JdbwnPEr3v31AGooy
	AWO5sCxw=
X-Google-Smtp-Source: AGHT+IE+vD85l8GbuJOWF4zGEwxh9rPoNGRM9Mv/p3U25C8lQi6nMxQ3MJq9sXlmS6zsGbo37dUkWQ==
X-Received: by 2002:a05:600c:4e10:b0:43c:ec72:3daf with SMTP id 5b1f17b1804b1-43ebf6645demr144133265e9.14.1743942627252;
        Sun, 06 Apr 2025 05:30:27 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096896sm9403234f8f.19.2025.04.06.05.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 05:30:26 -0700 (PDT)
Date: Sun, 6 Apr 2025 13:30:24 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Pitre <npitre@baylibre.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>, Oleg
 Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Biju Das
 <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 1/3] lib: Add mul_u64_add_u64_div_u64() and
 mul_u64_u64_div_u64_roundup()
Message-ID: <20250406133024.0d422c82@pumpkin>
In-Reply-To: <20250406103516.53a32bca@pumpkin>
References: <20250405204530.186242-1-david.laight.linux@gmail.com>
	<20250405204530.186242-2-david.laight.linux@gmail.com>
	<43q1qr20-9q83-74n7-no7p-n178p6s6p279@onlyvoer.pbz>
	<20250406103516.53a32bca@pumpkin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 6 Apr 2025 10:35:16 +0100
David Laight <david.laight.linux@gmail.com> wrote:

> On Sat, 5 Apr 2025 21:46:25 -0400 (EDT)
> Nicolas Pitre <npitre@baylibre.com> wrote:
> 
> > On Sat, 5 Apr 2025, David Laight wrote:
> >   
> > > The existing mul_u64_u64_div_u64() rounds down, a 'rounding up'
> > > variant needs 'divisor - 1' adding in between the multiply and
> > > divide so cannot easily be done by a caller.
> > > 
> > > Add mul_u64_add_u64_div_u64(a, b, c, d) that calculates (a * b + c)/d
> > > and implement the 'round down' and 'round up' using it.
> > > 
> > > Update the x86-64 asm to optimise for 'c' being a constant zero.
> > > 
> > > For architectures that support u128 check for a 64bit product after
> > > the multiply (will be cheap).
> > > Leave in the early check for other architectures (mostly 32bit) when
> > > 'c' is zero to avoid the multi-part multiply.
> > > 
> > > Note that the cost of the 128bit divide will dwarf the rest of the code.
> > > This function is very slow on everything except x86-64 (very very slow
> > > on 32bit).
> > > 
> > > Add kerndoc definitions for all three functions.
> > > 
> > > Signed-off-by: David Laight <david.laight.linux@gmail.com>    
> > 
> > Reviewed-by: Nicolas Pitre <npitre@baylibre.com>
> > 
> > Sidenote: The 128-bits division cost is proportional to the number of 
> > bits in the final result. So if the result is 0x0080000000000000 then 
> > the loop will execute only once and exit early.  
> 
> Some performance measurements for the test cases:
> 0: ok    50    25    19    19    19    19    19    19    19    19 mul_u64_u64_div_u64 
> 1: ok     2     0     0     0     0     0     0     0     0     0 mul_u64_u64_div_u64 
> 2: ok     4     4     4     4     4     4     4     4     4     4 mul_u64_u64_div_u64 
> 3: ok     4     4     4     4     4     4     4     4     4     4 mul_u64_u64_div_u64 
> 4: ok     4     4     4     4     4     4     4     4     4     4 mul_u64_u64_div_u64 
> 5: ok    15     8     4     4     4     4     4     4     4     4 mul_u64_u64_div_u64 
> 6: ok   275   225   223   223   223   223   223   224   224   223 mul_u64_u64_div_u64 
> 7: ok     9     6     4     4     4     4     5     5     4     4 mul_u64_u64_div_u64 
> 8: ok   241   192   187   187   187   187   187   188   187   187 mul_u64_u64_div_u64 
> 9: ok   212   172   169   169   169   169   169   169   169   169 mul_u64_u64_div_u64 
> 10: ok    12     6     4     4     4     4     4     4     4     4 mul_u64_u64_div_u64 
> 11: ok     9     5     4     4     4     4     4     4     4     4 mul_u64_u64_div_u64 
> 12: ok     6     4     4     4     4     4     4     4     4     4 mul_u64_u64_div_u64 
> 13: ok     6     5     5     4     4     4     4     4     4     4 mul_u64_u64_div_u64 
> 14: ok     4     4     5     5     4     4     4     4     4     5 mul_u64_u64_div_u64 
> 15: ok    18    12     8     8     8     8     8     8     8     8 mul_u64_u64_div_u64 
> 16: ok    18    11     6     6     6     6     6     6     6     6 mul_u64_u64_div_u64 
> 17: ok    22    16    11    11    11    11    11    11    11    11 mul_u64_u64_div_u64 
> 18: ok    25    18     9     9     9     9     9    10     9    10 mul_u64_u64_div_u64 
> 19: ok   272   231   227   227   226   227   227   227   227   226 mul_u64_u64_div_u64 
> 20: ok   198   188   185   185   185   186   185   185   186   186 mul_u64_u64_div_u64 
> 21: ok   207   198   196   196   196   196   196   196   196   196 mul_u64_u64_div_u64 
> 22: ok   201   189   190   189   190   189   190   189   190   189 mul_u64_u64_div_u64 
> 23: ok   224   184   181   181   181   181   180   180   181   181 mul_u64_u64_div_u64 
> 24: ok   238   185   179   179   179   179   179   179   179   179 mul_u64_u64_div_u64 
> 25: ok   208   178   177   177   177   177   177   177   177   177 mul_u64_u64_div_u64 
> 26: ok   170   146   139   139   139   139   139   139   139   139 mul_u64_u64_div_u64 
> 27: ok   256   204   196   196   196   196   196   196   196   196 mul_u64_u64_div_u64 
> 28: ok   227   195   194   195   194   195   194   195   194   195 mul_u64_u64_div_u64 
> 
> Entry 0 is an extra test and is the test overhead - subtracted from the others.

Except I'd failed to add the 'if (!a) return' so it was doing all the multiples.

> Each column is clocks for one run of the test, but for this set I'm running
> the actual test 16 times and later dividing the clock count by 16.
> It doesn't make much difference though, so the cost of the
> 	mfence; rdpmc; mfence; nop_test; mfence; rdpmc; mfence
> really is about 190 clocks (between the rdpmc results).
> 
> As soon as you hit a non-trival case the number of clocks increases
> dramatically.
> 
> This is on a zen5 in 64bit mode ignoring the u128 path.
> (I don't have the packages installed to compile a 32bit binary).

I had a brain wave.
If I make the mul_div depend on the result of the first rdpmc and make the
second rdpmc depend on the mul_div all the mfence can be removed.
(easily done by + (value & volatile_zero)).
(I need to do the same 'trick' for my 'rep movsb' measurements.)

I then get (for 10 single calls of each mul_div):
0: ok   109    62    27    26    26    26    26    26    26    26 mul_u64_u64_div_u64 
1: ok   100    48    47    26    25    25    25    25    25    25 mul_u64_u64_div_u64 
2: ok   306    31    31    31    31    31    31    31    31    31 mul_u64_u64_div_u64 
3: ok    32    32    32    32    32    32    32    32    32    32 mul_u64_u64_div_u64 
4: ok   329    31    31    31    31    31    31    31    31    31 mul_u64_u64_div_u64 
5: ok   108    61    59    34    34    34    34    34    34    34 mul_u64_u64_div_u64 
6: ok   892   462   290   245   243   243   243   243   243   243 mul_u64_u64_div_u64 
7: ok    95    80    34    34    34    34    34    34    34    34 mul_u64_u64_div_u64 
8: ok   598   500   217   218   216   214   213   218   216   218 mul_u64_u64_div_u64 
9: ok   532   461   228   186   187   189   189   189   189   189 mul_u64_u64_div_u64 
10: ok    57    53    31    31    31    31    31    31    31    31 mul_u64_u64_div_u64 
11: ok    71    41    41    27    27    27    27    27    27    27 mul_u64_u64_div_u64 
12: ok    54    27    27    27    27    27    27    27    27    27 mul_u64_u64_div_u64 
13: ok    60    34    34    34    34    34    34    34    34    34 mul_u64_u64_div_u64 
14: ok    34    34    34    34    34    34    34    34    34    34 mul_u64_u64_div_u64 
15: ok    74    94    24    24    24    24    24    24    24    24 mul_u64_u64_div_u64 
16: ok   124    46    45    20    20    20    20    20    20    20 mul_u64_u64_div_u64 
17: ok   140    79    26    24    25    24    25    24    25    24 mul_u64_u64_div_u64 
18: ok   144   106    24    23    23    23    23    23    23    23 mul_u64_u64_div_u64 
19: ok   569   357   204   203   204   203   204   203   204   203 mul_u64_u64_div_u64 
20: ok   263   279   240   208   208   208   208   208   208   208 mul_u64_u64_div_u64 
21: ok   351   580   397   216   215   215   215   215   215   215 mul_u64_u64_div_u64 
22: ok   293   267   267   208   209   207   208   207   208   207 mul_u64_u64_div_u64 
23: ok   536   319   236   236   236   236   236   236   236   236 mul_u64_u64_div_u64 
24: ok   984   334   194   194   197   193   193   193   193   193 mul_u64_u64_div_u64 
25: ok   630   360   195   199   199   199   199   199   199   199 mul_u64_u64_div_u64 
26: ok   558   239   150   149   148   151   149   151   149   151 mul_u64_u64_div_u64 
27: ok   997   414   215   219   214   219   214   219   214   219 mul_u64_u64_div_u64 
28: ok   679   398   216   216   213   215   217   216   216   213 mul_u64_u64_div_u64 

which now includes the cost of the divide when the product is 64bit.
The first few results on each row are affected by things like cache reads and
branch prediction.
But the later ones are pretty stable.

	David





