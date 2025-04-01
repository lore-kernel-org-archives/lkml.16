Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D48313212A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 20:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743538416; cv=none; b=N+mC/ykT54yQSLFwo82KbLx3tIwyP2F2vMW/Nph/Bvf0Dr9pFk8H8JwWCrdY7MaIe6/FSmYJG6lBP4kyl9lNyH+VpYLmFpjx2fRgAxV2Z4LGqVWqIKE5e56xEduWJ80DG3+5WiTJafoLvDvdDFaRKYjXsA2/+e86xygXQEcIDRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743538416; c=relaxed/simple;
	bh=rCt+/dpbAzzfA3GSyrd+8pnf+asH9uHiS96GGGoOkec=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=p4iVfQ5fsDP/aXju4xOmiNGeI37eiC9rp2KT/hG1/5F5TSJ5qcdUMGVYmy3wNIw5Gb0xR3st3d6z3+lvzhsp1d9SDa7RUSRu798mzv/2C/gdIXismp+6uIsiwE0y4i5uQ1OxCFTZl4QlD3CaodutrFZ9FIHLBhOuPaA5CWJIi1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=oTEHrQcm; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="oTEHrQcm"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4769f3e19a9so41756251cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 13:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743538412; x=1744143212; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=N6RcwdLwJHVSF6RfZ+AmDIydDmW/wAWUNS5MGoxg2aU=;
        b=oTEHrQcm3JHuHPOuaaoW5whXJPKjFnAz2vsgVMxp0Ll1IyxdLEI7CIgQUhOOKqxoQP
         SUETKgdgce6RggLzOPb7LSowjS9GthqhRtbam6ys1RJnRs5l6amssylFsEkF43GWTHFP
         nXfbwtg95l8gj9bwpjT29kL2eqgqcee6Z9N/WVWxsOOJW5UreuTCQo4qwfMbbxvrsPOh
         VdyRGci/tEztQ6kEMk17UaB0zsTvRS8aax+tDijiEPrx2q/FNmNX16WsAoGVKVv3N1Mv
         Od1Ay/xwQXHcPiUvw6ofItMGn7+5Zveu87sFy/9Je/vgehucWTjERjYIyzMP6exWDB6B
         7haA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743538412; x=1744143212;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N6RcwdLwJHVSF6RfZ+AmDIydDmW/wAWUNS5MGoxg2aU=;
        b=jwU7s6pMa1FGF6gky0vYDiBO4JHc5vOpZmWXwHduv0aErv7VxfiV2vczgSACtIULco
         yyv+2Q4950HoODIIHfFwUn/4Ea2nfAf3lXiG7iJ3GhCMZGtKtXhpVSWOuHpoJZEMBwMS
         LmHqT+lPVhs4HqV5anjbZV9V7EMUIIhkxd2jMU8ZOfGwqMKyppOK+uEWqf+oRSSKHVM1
         32m1yJBnr0ryUqvoxBVHhhUQ+TVdMz3WzjkHo4h2jeBYTVu8BP0GJfQlSo1o3pXE1BtQ
         qSqzW+WxR+AvZ7OnspAwp7ny+POXjQZH/UGlgIKH4bPhikgZoTv5DkZfLZpEl1MCEMSe
         G4tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpy0akIFLJiKqWzFDFKNETuJGbqWlbpp1kYZgd0Yn1V17JEvRy6zxE76fhe9ul6YeG/Tcd3dyihOCvA1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC+vUcXvXp2NC4s8FdXWz0G54VfXdvA5Y8YF/ly6UTgzuIbLAy
	omPfERcBk8jisQ5gMKgNqkZcFl5Zh1r07Ms4zLUzJboZ/Gh39W11/PvGZghIjqg=
X-Gm-Gg: ASbGncsPZmaC5rKN63uLrKrCbcMW4xvRxklNKJIscKIF/4mCzzcpWVgh461NF4h5iSM
	8OjoN8WfyiKzPmv5aFgw064UsqmOSEPKejoBBDbjCDjTpuLIwMQRi6MyUpuS0AVcYr7D3EebF5g
	dqQlmxtkWkwg/hFSk3SNGdJJT4HiHN6vwhHEipJZk6KcKCpVsviJ8Ix8WiVMzrH/wSBglefR/Rw
	s+ro9aG1TcAMqfmTQsg9C0mV3ocqTASwbuBOxwRj6YrGmGQwSXqRi7jQliO/PLrJt/oE9q4y8hz
	7sky6DzptC9fRrQAz73avzuk/C9lb5r6aOSSabcvxmEjm8NbKgIjnZSFtfOxEwhCRh5GMOeAQt1
	x2PHMrRA=
X-Google-Smtp-Source: AGHT+IFYgofgHAQw8rbdbCHiTQbs4oIIQA0c5ewQmdB7tyEEX+drGyyHecRVU3eaajfdN7y1SVLcgQ==
X-Received: by 2002:a05:6214:1d2f:b0:6ed:12b0:f181 with SMTP id 6a1803df08f44-6eed5f9c369mr176808776d6.14.1743538412134;
        Tue, 01 Apr 2025 13:13:32 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec965b24bsm65882606d6.63.2025.04.01.13.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 13:13:31 -0700 (PDT)
Date: Tue, 1 Apr 2025 16:13:30 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
cc: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, 
    Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] math64: Provide an uprounding variant of
 mul_u64_u64_div_u64()
In-Reply-To: <20250401202640.13342a97@pumpkin>
Message-ID: <15qr98n0-q1q0-or1r-7r32-36rrq93p9oq6@onlyvoer.pbz>
References: <20250319171426.175460-2-u.kleine-koenig@baylibre.com> <20250321131813.6a332944@pumpkin> <epuk3zijp2jt6jh72z3xi2wxneeunf5xx2h77kvim6xmzminwj@4saalgxu3enu> <20250331195357.012c221f@pumpkin> <mjqzvj6pujv3b3gnvo5rwgrb62gopysosg4r7su6hcssvys6sz@dzo7hpzqrgg2>
 <20250401202640.13342a97@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463781375-1171171549-1743538411=:3384153"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463781375-1171171549-1743538411=:3384153
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 1 Apr 2025, David Laight wrote:

> On Tue, 1 Apr 2025 09:25:17 +0200
> Uwe Kleine-König <u.kleine-koenig@baylibre.com> wrote:
> 
> > On Mon, Mar 31, 2025 at 07:53:57PM +0100, David Laight wrote:
> > 
> > > But you can rework the code to add in the offset between the multiply
> > > and divide - just needs a 'tweak' to mul_u64_u64_div_u64().  
> > 
> > Yes, that would be a possibility, but I'm not convinced this gives an
> > advantage. Yes it simplifies mul_u64_u64_div_u64_roundup() a bit, in
> > return to making mul_u64_u64_div_u64() a bit more complicated (which is
> > quite complicated already).
> 
> Adding in a 64bit offset isn't that much extra.
> On most cpu it is an 'add' 'adc' pair.
> Clearly it could be optimised away if a constant zero, but that will
> be noise except for the x86-64 asm version.

You still have to ask:

- How many users do need that version?

- For the zero case to be optimized away, you need some inlining which 
  those functions aren't. This means either passing the (albeit tiny) 
  overhead to everybody or duplicating the core division code meaning 
  bigger footprint.

- And this is not only about the extra 2 clocks. You need to account for 
  passing an extra 64-bit argument which is most likely to be spilled to 
  the stack especially on 32-bits systems as the 64x64=128 multiply has 
  to be performed before adding the extra argument.

Hence the proposed compromise.

> Looking at the C version, I wonder if the two ilog2() calls are needed.
> They may not be cheap, and are the same as checking 'n_hi == 0'.

Which two calls? I see only one.

And please explain how it can be the same as checking 'n_hi == 0'.


Nicolas
---1463781375-1171171549-1743538411=:3384153--
