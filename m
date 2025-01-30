Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0828C2770C
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 17:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738257703; cv=none; b=kGQbQ+IX99rNFcJH7q1mPPI2WYWrPbE6JyXz+YUMhSk2q6RkIpxhLuBStnjpMA7h16CHajU5wFM6/IVWTvCYCc62/31VdAtoSnOFLTad18GfIRKmajb7tIIqiw9tiRNMYjnvmnEBUYZsJ8VCJGizT7GYu7WYKLYGL+4/6s9wThs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738257703; c=relaxed/simple;
	bh=EmlbAWWBKZdvIU2V9lLarLuH6pI9xLKB4n4tT0QWAsA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Kv4bQ2MTMGGYFGhw86IPuMpGEd35drBRNgjYi95GsxXAOmsBcrnS3bBXeiR64vm3unMouUH+W4ezAA7bvCVOOShBlRo4KmnWdNEli8FNb6cck7eLjvGS2FxPe2goIIZH8VR8LuwRFtPNBTzWJB8LqHStw1lQvuS8/q0Kpwq9TgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com; spf=pass smtp.mailfrom=jrtc27.com; dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b=JaLrz+vr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b="JaLrz+vr"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4368a293339so12537125e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 09:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1738257700; x=1738862500; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmlbAWWBKZdvIU2V9lLarLuH6pI9xLKB4n4tT0QWAsA=;
        b=JaLrz+vrF8pjRsOJlLnlA3aiZFCnmUT0MsUrNt/IgJ9lgU5Ko/Ua2pAz8e5w5Fck/D
         1sywoxvDbVL67z4QEPRKbSXuylrQDlJZ+pJ1odt+B9lo46ovbsdo84A17vjdZ4g6pT+J
         /m8dD/kFfqZvhlBQ3SJjDCuGyMauXJ26LMPZ1Ar3zNEp+LvSwVhkRCdrgAlR9IUJxCU0
         h9WNPvntogMF5yBaoZJYuQ4pTJv1j18QQ7cMM+cpKhfKuXsjx8XutwkihIBys0SIu+Eh
         C/eYJ1qWBYcb03TEcOmNtniswMI0H7sEGMEePtfVn44lRYHNg7hHkQbGbQ0F8ij8TC5J
         /Kgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738257700; x=1738862500;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmlbAWWBKZdvIU2V9lLarLuH6pI9xLKB4n4tT0QWAsA=;
        b=TEGzvzgS6VGvnbT7KJ/5x80jWrFQDVEt21Vxs19m+AtsQK2QTigINXbQQ15JQzwuj/
         AOfQdpIOfFfjJBO0s0YQaRox6d+ZlRQ13u7/e6gxa/LKApSkdhl2xoLb5it4jSSdOeOr
         4uDAtm0gh4D1BhFFPb6VhOHuvQR2IjH0xBzAQibRaLrqXbCzDBgS0SWRPJ1MwzJldFqV
         pTAcCf1M+sbNswUNPeyJ171h3eDTYvA1+3FF0f7DQVhc2AfW+PZ7EgWhZ80D3tqW7ac7
         iC39qAM84BNRYyxqXDfZsX1ddKs3biWEcl+eYxITW8G5ryl4LerOrgFgpw3o6F1vlzzJ
         cx6w==
X-Forwarded-Encrypted: i=1; AJvYcCUv6zrwX9SfidEYHfSHqX4hZUQ3NfKbJP8mzLe6r/aW+RudF1SGc5EKpaiRd4m2b5R9eijudRbuXMiwqIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLYSzh1YJCUB3hMjBO6ZRFWjYDGxHwb58uLPP8JNn807p9aRY5
	cReVsUbhRJbU3Q7qyPAtzNGSRgDHk09vQrZ+/K7UM1/68BS+D51yUzVuL0nyooI1B0vRZzLvg3J
	d
X-Gm-Gg: ASbGncvlyNsm9KUbgpVZm0r3OY27PXOv0s9jDXZ5qMDE4AczFAOrI45CqqiqyUFZ9H6
	u1Q6KX0mFgpw8LshV2OGF6TgtQcrXCurC4oyjt2pxX1UZucVNftdvrmYmDRnpvOoCVHh0KsahlN
	jYCOTEcMBArleZyF3QFWQqYWttrVfhZcP4GifhIrfTsulSg77IbyYqIj9mLUli/X+o/6K14dVR4
	1wt61dJZbXG5pQ/jAhY4T0Wy//vrEv4zJlWTR6ERiXX2NFDPcuck0IXpQTwabPg4ohWB/3Z4oSs
	GBRurx+CPFmPnx1Q9kiNAaizdAb7
X-Google-Smtp-Source: AGHT+IEA3QinVd6YP+HnUwsrfnbEDxZBHCObVP3XKrEUyZXRM0hNCM4PGW5LxoktwFLYP/PvE7wd0A==
X-Received: by 2002:a05:600c:3149:b0:434:fd15:3adc with SMTP id 5b1f17b1804b1-438dc424f5emr62875505e9.25.1738257699900;
        Thu, 30 Jan 2025 09:21:39 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec02bsm2593578f8f.13.2025.01.30.09.21.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jan 2025 09:21:39 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for unsigned
 in arch_cmpxchg
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <mvmwmec2t7u.fsf@suse.de>
Date: Thu, 30 Jan 2025 17:21:28 +0000
Cc: Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <CC2D9220-F8DE-4CC8-ACAD-7B1A21E276FE@jrtc27.com>
References: <mvmed0k4prh.fsf@suse.de>
 <c9cbc2be-d1fd-44ef-aa14-fd25a5ff8490@ghiti.fr> <mvm5xlw4anb.fsf@suse.de>
 <ac53a62e-4f89-49c9-a755-fdfa7a582337@ghiti.fr> <mvmwmec2t7u.fsf@suse.de>
To: Andreas Schwab <schwab@suse.de>
X-Mailer: Apple Mail (2.3826.300.87.4.3)

On 30 Jan 2025, at 15:53, Andreas Schwab <schwab@suse.de> wrote:
>=20
> On Jan 30 2025, Alexandre Ghiti wrote:
>=20
>> a2 is used as it is passed by the calling function, so we can't be =
sure a2
>> is sign extended to me, what am I missing?
>=20
> 32-bit scalar arguments are guaranteed to be sign extended on entry.

Firstly, the calling convention is irrelevant if the function is
inlined, which this almost always will be.

Secondly, whilst GCC (still?) maintains the invariant that 32-bit
registers are kept sign-extended in registers on RISC-V, and there=E2=80=99=
s a
non-normative note in the unprivileged spec about this, LLVM does not,
any extra bits are wholly unspecified, so you must not write inline
assembly that depends on them being well-define, either by ignoring the
bits or by converting your arguments to be whole-register types. If
your compiler has already extended the value in the manner you care
about then that=E2=80=99ll be a no-op, and if it hasn=E2=80=99t then =
it=E2=80=99ll do what you
need.

We had an issue like this years ago in FreeBSD (also for a uint32_t
CAS) and this was the conclusion I reached [1].

Jess

[1] https://reviews.freebsd.org/D22084

