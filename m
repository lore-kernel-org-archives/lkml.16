Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A968920CCCC
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 15:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749829951; cv=none; b=hrexQJfMYmio5a7iX2ZDa8zHY3ub8rfuYp43fdjUVlqZpyLDPSWhSQERiQuOF8dxBm4aVq3yIWeZWGKZWgvlytMcbEoUEluBVOOpSTNXcPhZFad7+tpWaZVjFm18zRy9xsdsPUpO7YgcCvx9fPGbBxb1EROHck44udxE3QWXN7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749829951; c=relaxed/simple;
	bh=L3C/8HhJvQFmY7lye9zaWma1xMOKBPxxNywL4tlzLMk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Babj6/ML3uFQ8IkdrS7IGTks1fccaEESA1jf/kmw2WObFY+sV3AwyAvH+VdCQakNpjcUjvxicdXzVVh32YPtmEXorU1YS1UmLQou1fYSwH3nc11Y2w0mAoeQ4Dt7cFaUPMZHecNr8CqJTEWI/iz25FIwNJC7s1vi9rlp+TFfumg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4T7pW6z; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4T7pW6z"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-452f9735424so8337415e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749829948; x=1750434748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/A3BrYCrv39DbsgbB/mMrX15vuVGEbL7oR3ajVbCV20=;
        b=V4T7pW6z9Uks01lPhEwAqt4F1K7nj7LsTmUhX4XRbYq7CCZHCjg/AumZQmy2LNuNg6
         ajUq+ZIu1kMpvbFVMirVfegBqbfXpXOF3VNngk0+kFEinMx1i9zHPofe8JnqYGPTohNc
         8gunUojkmtG8hYzJqcGZHUOdPB09Vj95vGaxA/u0TOFRPFzjPm6wl3pUTL/exQte7hzc
         9dI33buUCFR4epnyUlTrRsWhyRE2dEDBVUeHO+woppxgOq4FYRhBpvaSSswTV+2kYLcg
         ycMfUDZRYHZodhEKVsrIRch8m5KzlDQJ55GyM+L2+IcNH3fxUszVAxRtsiVZrrilN70G
         mWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749829948; x=1750434748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/A3BrYCrv39DbsgbB/mMrX15vuVGEbL7oR3ajVbCV20=;
        b=jVHRQA8FpsgxTzccIWOnsC9JvUeWswjyKxRcM+xCOofp5OSyqJ3y+PbE0yJ5GRYb6u
         1q2AflPepPwAnMwWWoL/BAuq/ki42xr+n2XM2RkW+tnVPbhC7jil6i3WDo1yHbIsFcMp
         vgd55ERVnmmkunu7ZhmtC3LXHHopXqut3mmmqd/57U55HyE3ElBiFo/uq3EJmVBV19Da
         Ncf8GG+4dqtVWcpkNsa+uYc5YXXyV3e6nLrQxGMUQNWhwMqkMfV846BmHb8EahpTUKxL
         XEUaD8ziQvuHuAeN7JMHH4CDgfmyS0hjgfFAXpQf2fTsMU8Ui0YQeD/xdbThDrvu7lR4
         ckrg==
X-Forwarded-Encrypted: i=1; AJvYcCWDgCs11DCi+hOCxXfeT7leBWVU5A+GblP+pgNPn+UFdMWRYcP42DUOPro80TZrYH/sd+dfTNnfSVFl8ms=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuFZvzN3TTBbqA4CGsOy92adZ0UXktCY+rfmK5N2yukuCNXXYk
	W7uxtPfxnRs5O6ycHRmWHFUk231dLOul31ggb6xUV8pd82MXg685G+Qw
X-Gm-Gg: ASbGnctr8VM76PSefa49cJFyG1j4OD9itYIGAcYSlni3ZbJqm8SpqMbs0BkJeRBS3Xz
	ltXMeM2Dq8d/LB+VbI5lVm6TsS9XEsrElCy218o4o9zXoOjNtoja+Z83I0egF5t26TmsgvZTILq
	s2nu8eFFktwt3a91uDP8DT14ySFDDK1pMwN6+QcqhT35lnzSr6x5QBji7lodrC7ARX1A47iasaq
	u/xPrECFTsW1p2zAMSMk1ST9oqNd9ZT4ndSropHoaxRgFoRPLdG8U8vZR1fcwvbLJCili/v2qop
	+UHCa69tT5KsXDb04pUUPy0n3QjR1FZ1SJ3/Cdwz7Vh6yNLZcla0u07YFypF14dNoBLO0isy+HG
	zA8JT+RM3n1+qehGkWHnOhn8J
X-Google-Smtp-Source: AGHT+IElMqUUk1YlnmEZZhYHFJv1in0BvsowUK458/pFR5pgfb3KnXFmtZ1cu5Epd8Tzf9xWRjLFJQ==
X-Received: by 2002:a05:6000:4305:b0:3a4:dbac:2db6 with SMTP id ffacd0b85a97d-3a572e553e0mr213678f8f.49.1749829947747;
        Fri, 13 Jun 2025 08:52:27 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7cb65sm2772544f8f.38.2025.06.13.08.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 08:52:27 -0700 (PDT)
Date: Fri, 13 Jun 2025 16:52:26 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Atish Patra" <atishp@rivosinc.com>, "Andrew Jones"
 <ajones@ventanamicro.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>, "Anup Patel" <apatel@ventanamicro.com>
Subject: Re: [PATCH 2/2] RISC-V: make use of variadic sbi_ecall
Message-ID: <20250613165226.751541c6@pumpkin>
In-Reply-To: <DALGSCDW0GIG.10I22KD2SCSNX@ventanamicro.com>
References: <20250612145754.2126147-2-rkrcmar@ventanamicro.com>
	<20250612145754.2126147-4-rkrcmar@ventanamicro.com>
	<20250613115459.6293f929@pumpkin>
	<DALGSCDW0GIG.10I22KD2SCSNX@ventanamicro.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 13 Jun 2025 16:10:52 +0200
Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@ventanamicro.com> wrote:

...
> The macro will result in the same arguments as before, and it is what
> the sbi_ecall actually should do.

Ugg...
Are you using pre-processor 'magic' to add a pile of zeros and then
select the first 'n' arguments?
That ought to be banned as error prone.

I think the one for strncpy() removes the immediate compile error for:
	strncpy(dest, src, 1, 2);

  David
