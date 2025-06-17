Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED7D2EFDB4
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190915; cv=none; b=OPnCyRK3IEe3hgK/Z+pZccTH2/p61lKJOm38O6WSnUyuSQb9Niw+VilUtI/jiJBV+3Ez4cLCCmP6p1LM20uDEa/QPtrL/EicYCxWs2zS2kbXwnfDW2NQNRWMeGSwbmd1/fDr4MFEmV9h76zw/zidcnoiao83F4RBAfhh6oT57OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190915; c=relaxed/simple;
	bh=NQoGyMTrLvZ94cQK6qr/U5S3n/jCYrB9gj8+lWNrtVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MG1h+Qv3Ilaio6oWazfVs68kkO4P9ogNCecUL0iEf8Wi0/d9rAYGTtu5hheasZZcGNbuAx1SF0rJs83gOcHslCwbfqxTfKYGF9gcokmuxU+zKvI3JaMWgOhZmBrmdKZ0GNBaqTAVCOTHg/QoUS0MpwQe8mp9aqwRJD1cboH5KlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DHFFK/Vl; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DHFFK/Vl"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-acae7e7587dso939158166b.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750190911; x=1750795711; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KANIOG1UnKUU5UjGnVcj73JF4ShRkYSB4zL4V2vR3Pc=;
        b=DHFFK/VlZ4Ssk73LyTWhzRdIdZa31mheZCsUMVBcoWLZFg1+x9hxtDzvFjgmRerD7o
         L0eBp1m6Seou/nVH5kT/zfilk99apca1R+zbaVQYjK7ayFiD5AilrcYWPwo9rCXr1ST7
         WZFlfuvMy5dM9emEnaELYsnUDIP3VXjre6NQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750190911; x=1750795711;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KANIOG1UnKUU5UjGnVcj73JF4ShRkYSB4zL4V2vR3Pc=;
        b=c+ybgczSAWaZT9VvpiGc1sCMPOvz7n3m85fNwQDxWCmi4uSj68IHLYGH6Y9W3mRTer
         3ZS+AkwpagH8p+GjpYfiHkp9yDiipjSN0anO4Qde4FlTXTM/+8DbjJ7n9wihdEYi/o9O
         USnBwWIk5Bsu/V6Z+XcOlYXX1IZUxxCEmvI6NAdrgHZUH6kuv/9595QQaOPcAUSosIZs
         9Nuwu69RU/X30L9mOpSQjOc18YAbqNRW4VvJ/Hs4DFG8rP1ezxobPpuVNiPaqN2P0SH7
         x+8HXg8E/bpJ/jUmJG+WxOf8mASi/a8+rrFJcRTyc83MRuNn1QhN/aUCnY9JY/bJpQe7
         Yktw==
X-Forwarded-Encrypted: i=1; AJvYcCUxoP6LOpuHMv65pUEA6qnVhQ8ciOum7nSz9jYmOFM1g9TIj81itMrePqusnFQeqjbJ5Xtbh7SQRCzTKwY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Kf7+jnqNcCcPWcpyJXMo/wcj9orGdobqWRif3BQTD/9c8HJA
	W5Zi5SMto87bIb15ysmmBOeyMINIXALU0oPAkxnAii0W/fwC6eDwLfyIMWqQJcdkN0NaCxrQzQz
	JBQtSCx8=
X-Gm-Gg: ASbGnctLXfXvGZjldZB7Zq2YuDQNoj2pE7seaAePXCyOzNapcEw8aEtgB2xoIm48Zk0
	KGXGkARc1AIcx+t5GsOPcxSzpPUbNlmdORombbBdUbPv1KTMx+Bw7nG98vs1hjOsES37NZuJGcU
	IKKpcOVMJRumT1qJogosuhvwqBiciA+Du3XqSU96Df54ATM60yZjmNu4ZTvAIC2uPSAnDMvEeQX
	AF542znAnUdjnlFmXvEZhDZlBP8m8kTwsSgLgjPWbM5BWGPgDGQ8ycmuNGcbBBnFci9GNB28meW
	mPvIJ9kUq0zlJrYGsavBXiIS1Loli60enhF/Ab/cdNh2BdvoJW20bJ21M6JeH80nik9HDIR0ETM
	MlPoqMq6pUTEui0HznlS13PHjO9et6rI35ZrD
X-Google-Smtp-Source: AGHT+IEKcmP+nYQ+Thb2/TbRRgi12RQF+yx845khOcShj23UC9t6t0/TYzxhIFq4Y2C0MqTQbq250w==
X-Received: by 2002:a17:907:d23:b0:add:fc26:c1c4 with SMTP id a640c23a62f3a-adfad534e86mr1363144466b.59.1750190911298;
        Tue, 17 Jun 2025 13:08:31 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8156ed7sm926110166b.37.2025.06.17.13.08.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 13:08:30 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-601dfef6a8dso10273251a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:08:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVkeuuenzrJHRwElQSSS2tS5kmY/iXvNaeIYZDBMKAYkJl/LOuJGzCfHj+xndOZautGD85mQy0lluk29ZE=@vger.kernel.org
X-Received: by 2002:a05:6402:2550:b0:5f3:857f:2b38 with SMTP id
 4fb4d7f45d1cf-608d0948ae9mr13954090a12.17.1750190910438; Tue, 17 Jun 2025
 13:08:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616014019.415791-1-ebiggers@kernel.org> <20250617060523.GH8289@sol>
 <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com>
 <20250617192212.GA1365424@google.com> <CAHk-=wiB6XYBt81zpebysAoya4T-YiiZEmW_7+TtoA=FSCA4XQ@mail.gmail.com>
 <20250617195858.GA1288@sol>
In-Reply-To: <20250617195858.GA1288@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Jun 2025 13:08:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=whJjS_wfxCDhkj2fNp1XPAbxDDdNwF1iqZbamZumBmZPg@mail.gmail.com>
X-Gm-Features: AX0GCFuoL7ATRJ2CnwP4RNLTBvlSmkXnXI8fTIZk-24R8V3-BYf3WTK_tAsCN-o
Message-ID: <CAHk-=whJjS_wfxCDhkj2fNp1XPAbxDDdNwF1iqZbamZumBmZPg@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jun 2025 at 12:59, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Again, the tests depend on the code they test being added first.

Sure, and that's fine. We have lots of "this depends on that".

> I could do two pull requests, the first with all non-test code and the second
> with all test code, where the second depends on the first, i.e. it will have the
> last commit of the first as its base commit.  Is that what you want?

Yes.

Or if one single pull request, split out the diffstat with the
explanation (that's the "Or at the very least spell things out *very*
clearly" option). But two separate pull requests would actually be my
preference.

          Linus
