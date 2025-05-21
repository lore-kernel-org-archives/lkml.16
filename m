Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB7426FA40
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831972; cv=none; b=eAqHtqe6HqgYar2WE8Dy6coWs/KiH4AphABsA+DutR8VZhPa8nac7GwvcXL6M5sl4jqlNTVZiD0ROcDBmHiS3ZwlknXsoHD8cNgFEESjMqJMEFDUc1rUmJRga3oCjvXdzyjNAb296utINfQt3gKVaTf7C0MkGd7pYLefl5Ho3ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831972; c=relaxed/simple;
	bh=ex8fec4lSvRbizAHGxTk9eHxJUEJr45NNb5J8gjLy/w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BrHA1wpVYRaQ074YLVT3mkfL+i9UdN+sLCKVfQP2GLwEv3pwTIPgiM+GHKKTDUBRA+7A7VfACujD1i6zYZ83wjFxkG15mOb3JJpEJjjGzDPIhBPpNtSPhJz4e5YXYCSTkCyF3D3iNgcsptt0kxrbhV7/y4kpwFoa01IDVRWRH14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhDTcpxO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhDTcpxO"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf680d351so47028605e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 05:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747831968; x=1748436768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2Q5akduCpfDqsqlBatix18/uxsvR0mlb10E3tY0o/A=;
        b=bhDTcpxOaNbgXzjZ3lKI6e/Mk0QzcX/rfuqtDl/D5O2VWzH2zpPe3Jj4Vp7Z1MzIDq
         Gpcslx0Vrt00zGjYRsh+O4zciweXuA0f8zowKzc6/p3TmVdiDsvKl6YniFZZ9iaryyrF
         GY7QxwmOcLiPq+zklcyR6ktpVM3th72v6cNcNrNIaNWnRpdeTBvdW09Wad+ZIF//aLKp
         d1xYqEUzVbXqMYshYBdrtiA3Q3dLPqgu/nSFu+LBp15/LAJrZBj+WKgbmM/pRjgRDJep
         c5ThhUI6077Cln6xACX/FV85O6jNMqajjwcs45ED6oAS4Gpc0CRAULsRv2mX4GKaRyaC
         ZLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831968; x=1748436768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2Q5akduCpfDqsqlBatix18/uxsvR0mlb10E3tY0o/A=;
        b=ZWbf9fQ2blBAVPi2J1dbqWXcl9V1qePvSOGHpjEDh/Lkf12urYdaK72w2TLm2ZqAFe
         MRN4h94Wz+9svneeIBN1LGu/ZLcMbPn4wZm6aFNrakx0E6xfTzKILWs0d6E/Ks9BrNSy
         JW3xpcaJwJOKfDbtSi9HH8n+PNESMTI+sLhSTAhhkDv9jwuSgt2d8sozgDKPCWjwVFaJ
         STkCgz5Ayoz6ouU6QNo5Eivh/gfRYDAkV1Onsu+pAzjSgZQyFLUaIYvw3N7MYy2hLQrY
         l2A6eB+hURe9W2DmtLOVFhsuXIKp70vhcyLEVTea9/iqkcawv267FpgXErrDFs6WOCwN
         Tx0w==
X-Forwarded-Encrypted: i=1; AJvYcCVAu3ksKoMZdIKaGhCFBzPemBc2p9oBFe962fuHLvmv7oLeL5wh3nS1W8znWq6i7BJ6Jy6aG2Axy58r7g0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnm2tyecIf9wzWF87Bxsr5nGaYHwV1gKPt7eT/xhsXWdlhSTKO
	ykBToWCAHzB3yJbHHNxWycV9BM2ak4fxSSs9msByyk7XTGeXoOvemB+M
X-Gm-Gg: ASbGncvJPOJPXO+gEFDR5bGA4tsUMGth3xczJ0gmHqSVcbwbZPxU4KRjFvhFQu0wude
	HqGSMed77Po6T/HXaxWTxOugHS7Dt9QpL2IknlVjvvKoxgpkmyhxTmiAt+4c9IF6Q8lfpCl1xRd
	v3KdcRwtZmyqsBwaX1ipTr3IKD2/iSOS/f+yv50ecmI/yh9PYX5noQhPXJdE27fFEGoXck77hfh
	r/p0YIFua4sYF4onKsbuzW9eLYHmKfrQtjwH1WhtScYiFm04ZpUxemZrXujNnsDHjsc4Cp7j29y
	u10eRPtanUbfgGF8cZBSxGR9F/+I8NiLv56LYIyEI76EI3+3sMhzZAm5Ww6QblJK5DrOvHgdq4f
	kCRYC5duytWI5oA==
X-Google-Smtp-Source: AGHT+IHpc2l2SfVRc0jgMEt9V5illJo3BE9u9sMuf0NrsqS1uKt+nwi8QhzuuqN+dnknkaKa3RFBGQ==
X-Received: by 2002:a05:6000:40db:b0:3a3:7465:7e60 with SMTP id ffacd0b85a97d-3a374657eb0mr9527460f8f.26.1747831968274;
        Wed, 21 May 2025 05:52:48 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7d975f4sm67311505e9.39.2025.05.21.05.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 05:52:47 -0700 (PDT)
Date: Wed, 21 May 2025 13:52:46 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Pitre <npitre@baylibre.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 next 3/4] lib: Add mul_u64_add_u64_div_u64() and
 mul_u64_u64_div_u64_roundup()
Message-ID: <20250521135246.7dab6bda@pumpkin>
In-Reply-To: <148nop5q-s958-n0q4-66r8-o91ns4pnr4on@onlyvoer.pbz>
References: <20250518133848.5811-1-david.laight.linux@gmail.com>
	<20250518133848.5811-4-david.laight.linux@gmail.com>
	<321rs9r7-8858-p195-263n-49q78q8rn25o@onlyvoer.pbz>
	<20250520223700.2ec735fd@pumpkin>
	<148nop5q-s958-n0q4-66r8-o91ns4pnr4on@onlyvoer.pbz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 May 2025 18:24:58 -0400 (EDT)
Nicolas Pitre <npitre@baylibre.com> wrote:

> On Tue, 20 May 2025, David Laight wrote:
> 
> > On Mon, 19 May 2025 23:03:21 -0400 (EDT)
> > Nicolas Pitre <npitre@baylibre.com> wrote:
> >   
...
> > > Here you should do:
> > > 
> > > 	if (ilog2(a) + ilog2(b) <= 62) {
> > > 		u64 ab = a * b;
> > > 		u64 abc = ab + c;
> > > 		if (ab <= abc)
> > > 			return div64_u64(abc, d);
> > > 	}
> > > 
> > > This is cheap and won't unconditionally discard the faster path when c != 0;  
> > 
> > That isn't really cheap.
> > ilog2() is likely to be a similar cost to a multiply
> > (my brain remembers them both as 'latency 3' on x86).  
> 
> I'm not discussing the ilog2() usage though. I'm just against limiting 
> the test to !c. My suggestion is about supporting all values of c.

I've had further thoughts on that test.
Most (but not all - and I've forgotten which) 64bit cpu have a 64x64=>128
multiple and support u128.
So the 'multiply in parts' code is mostly for 32bit.
That means that the 'a * b' for the call to div64_u64() has to be three
32x32=>64 multiplies with all the extra 'add' and 'adc $0' to generate
a correct 64bit result.
This is (well should be) much the same as the multiply coded in the
function - except it is generated by the compiler itself.
The only parts it can ignore are the those that set 'z' and 'y_hi'.
If my clock sequence (in the other email) is correct it saves 3 of 10
clocks - so test to avoid the multiply has to be better than that.
That probably means the only worthwhile check is for a and b being 32bit
so a single multiply can be used.

The generated code for 32bit x86 isn't as good as one might hope.
partially due to only having 7 (6 if %bp is a stack frame) registers.
clang makes a reasonable job of it, gcc doesn't.
There is already a mul_u32_u32() wrapper in arch/x86/include/asm/div64.h.
There needs to be a similar add_u64_u32() (contains add %s,%d_lo, adc $0,%d_hi).
Without them gcc spills a lot of values to stack - including constant zeros.

I might add those and use them in v3 (which I need to send anyway).
They'll match what my 'pending' faster code does.

	David

