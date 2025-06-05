Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCE23FB31;
	Thu,  5 Jun 2025 01:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749088606; cv=none; b=rOikNvCv2rLA9nXlk7CYHSbM11acxsv7aU42JSWz1JtZcNZMBp2QRUn2bX42O21nWLJCWpaLRsXjxMCRce0IUZS9VR0eNE0vEZ5h8sC4MGBmOspKloEMkp/pVfPYaAGSf7NFEncBgOkeKZ6Cd/UMMqUusWnxWzHx9zhW7KexViA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749088606; c=relaxed/simple;
	bh=hxHhCDDPHxwIzDJ0REZ0X+PrkWb9cpY+n8pdJBmfk4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kpNjxkDCSmrtUxL6JAPXWd9RUQokecX98ZkVTQTSQ9O7Lq4ozTnOCP0X0Ng1MAaWrIdkqIkaeOit02H4B52KhnzAeRx5Pft/Naaf//WgoCP+TB6KFWlbxty0prpZpnZtpzdWZLgzqXvpEnjN9sh7Akl8lGb3eX2xytrmJgwqZWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYUzaYxP; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYUzaYxP"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-312efc384fcso61124a91.3;
        Wed, 04 Jun 2025 18:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749088604; x=1749693404; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxHhCDDPHxwIzDJ0REZ0X+PrkWb9cpY+n8pdJBmfk4E=;
        b=UYUzaYxPRk0exd0Vu9Ll93ebUVv8OFB1RLSLyKUmWob3WLtq9LZITLIlExTZUYgO6h
         +jyifjedp9+rw1f1OOHM2uBwYGA6fEewqVzbsE6Z4YjQXs0UFRtCpKi8E86MAlDu8Xyq
         eU54KgV+5SY1Hoyt3Ynmk8k4ZtJqHYzw2X4oBXP2eLN2tYeeyt/8/fKyjQMvgE06z9k2
         3co7+mjI6059CmXE4GhqP4O7en5Law5vHivf06OiDUmHasxJob8CIApvC7HOLokojV5X
         fEbH/CuZfG4UnCw/+dRsB/rTi82DSltBeJCNdyjflgkyXMEE7otp91+aO/jZhRIi5Qb1
         i09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749088604; x=1749693404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxHhCDDPHxwIzDJ0REZ0X+PrkWb9cpY+n8pdJBmfk4E=;
        b=hppNHGfJSBWAnQ9fPEXCOUj1X+8jumV8W00o1qwTxnnjJvZ/Rwdt0v1r+ihDCE+/id
         L9Zmcqdcyv5l30jXIXKHajp3zuRLrdA557mpA9S2InK0caM9JK/fUyfvSOth4XTCceTv
         e3uwEp/PtuSQ0ZmXmpD1XCLXv+2h9vwpBHwAf/47TcZg4/8qsFlFFUj4nKNeh5ocGLzf
         mHfAbURtZDCm+6VEn9yZGTEsHArkjpSxv4a4/4N9CiXPcHOduKLQUCXyxSHfv4i14rhs
         g6F+8BIv8PCPkYJKz+IXgvah6juU6Y2lnpuy3jukddtJwW7JIYRpFJRl93xZU4lIg+Hy
         eNpg==
X-Forwarded-Encrypted: i=1; AJvYcCWTo47NvrQj3IDMH3T+UvGzGUc+CluI2wOHRtqpVDl0CZZGMAOkc+QcblSExbWrCH96TyrwLhFNIrxTZd8HdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy44nfiO2TAHfPLrCJ6NXGKeC//p7EiSFFsHDBwePq1ix7rdOQn
	8gQ9Znhu57sS4EZBVxxhMXOHEL193vSW8XAlcZ2TQiOIdvaR5VLCuWcKfdcv26zK9e3gntYcYw7
	noQ60YZqBw5qqtqfUu73t7MgR1jMCTcU=
X-Gm-Gg: ASbGncsrN8p1s6rA0m7tCHK0G++uRgqJgE/0PSrCY9Hw+RQ/4Ea/EhkFxBEzaNxP/Q+
	sCEksF3VmpwuCxlBe2x0o6z9NvwNk8+8M4+lFGM3MxmPdGM+y/IAbimcxg4DDSBDwlCThyyuJ9v
	qrChOoC2ACtg+S2xLtHxu7fKJWCeGpuMXy
X-Google-Smtp-Source: AGHT+IFHh37ON8OdKdzVBBFcxedCAlOOwXK4V/iC1EPOOjVJZxdYBvuNOsHpf8VVt21G19e5ASyjwRRmZcF7LJTAmMs=
X-Received: by 2002:a17:90b:48c6:b0:30a:80bc:ad4 with SMTP id
 98e67ed59e1d1-3130cabf1f7mr2575310a91.0.1749088604483; Wed, 04 Jun 2025
 18:56:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502094537.231725-1-fujita.tomonori@gmail.com>
In-Reply-To: <20250502094537.231725-1-fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Jun 2025 03:56:31 +0200
X-Gm-Features: AX0GCFugcCm505NwwgN-68q9ZVnBp5bIOw8-paPBHPB9oCMtC5Zudgwp1svRBNU
Message-ID: <CANiq72=GXWj-aj1kPwnH=9mwR=GgrfJ4xsQUK36SFBRedk3oYg@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] rust: Add bug/warn abstractions
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, peterz@infradead.org, hpa@zytor.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn, 
	yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 11:46=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> This patchset adds warn_on macro with the bug/warn abstraction that
> utilizes the kernel's BUG/WARN feature via assembly.

This passed my usual tests -- I will take a better look and pick it
early next cycle.

Cheers,
Miguel
