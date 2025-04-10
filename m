Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CED204582
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744274977; cv=none; b=R1h0irpxPUmmRkm4YVpiEnp0DZhDAAHL/3kyIOm/TIu67YjVDan+pDmhQg4azjCdTYFg/q/PBmmna8kaC4PSuhVFs1sJOrrRSdVhWSnmVZdmhHnpAVgo+VtLAJycc/35cz/gtekd+n9A3bJ4wa/r8hGmyACXNB5auatPlZM8K68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744274977; c=relaxed/simple;
	bh=+btaMpKeeBdGRBlfpT1TSOPhvtORg43su9uQOsAX5Es=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=hJJTeQn6JwDqnil83QrWWUVL23oH+YY+ztvrDfkrPkYepHDaIoDdZkUqlVtkpN4SSqAr6SSaE4//QIK1S5JlRzPYrI0q2ejvICLSEJwUG1USUOM3r/Txi3LRMvYB6DlYhUNO/bv8N+v6lZ0uLL6buBZ6RtoXN15/PYfHwtJqDkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ArZVnl9J; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ArZVnl9J"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d64e6c83eso575445e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 01:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744274973; x=1744879773; darn=vger.kernel.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IEwPf3cBEf9ZFD3zZhCOLbWBp0B51DbgggktH5J+y1E=;
        b=ArZVnl9J30sx8+yQyFZEjZBH01meAzlOv5Gr9qxWKtevq/gXBjej+DpnfllAfQvwM2
         bVXGaNyAmrgsp18pRPd2LiR+Y4UaZYIbphPpVT19PftYwQYsg6JAlA/uGP/3vmGIbqfB
         FJVw+q+esOAmA225EUTqTT7vKI4hqNULUnjoxnUc/XDdU6tGlTkvCv9jdzLqVMa0sEPE
         M3iTHC0DpI5Hfqwo38fdg5QTR2Fll25bgvcj+wq3hP/OH/EwmNsVFmo9Mmr313/ZoZSZ
         HdDjcS1w//G29nTd7FYXG3tsCrTU5WcQmkyvwj3milGagQLDf6F7u31LWoj2T8Ftj1++
         j5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744274973; x=1744879773;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IEwPf3cBEf9ZFD3zZhCOLbWBp0B51DbgggktH5J+y1E=;
        b=NVpCRPKNKmqqDGQz1ukPNcwrUwZLWbCcOf+IAGD5K82FQwZn0sz6TK4PHqPDyWSVZ3
         f2bschCwyjFHMCCBHmWFiqsIIlpFw+yymT1dlbPJmMJhehFSjgSJx81jX6wvyzcIaTmJ
         86JcvIwXtd9PNkaqlqErjAc9VyT4FxmjZ8J9rEU5a5Ze/wbQSCyjxi53RnwtJjhW1jcf
         amhBS7EZV0IZEBf58Gz4tGlHPrKC/cnGlGBrUfEXzbcZu5hjndzEMObuV0zCUvx74tfe
         m7+dWDaH/RYEyaWNZEMY1VP6WlixJmDZJSfo7tmxuGcK0u3Ft6ve/LNcmYJAvEEOF+o+
         AgLA==
X-Gm-Message-State: AOJu0YykjfI/xYwIpAkBU4BMwuvUoCHofzgR8CIeYQwuEtayH51JwIKD
	XGFbMt7m3E01qfVflcz63DL5uQutW5sfaCm6hEvd4G1RFGow1I9rJgXAND9raKA=
X-Gm-Gg: ASbGncs4SBv4o5FKsc0WvbK4+w/zH3MbZ34iBmg9EJNPZKj1iK6JN/34vvrByvJteNf
	LOoLvHxROZtDyEy0jQ/XUhXRKFVDsyCvKPSgjZESrdfsb9tq42Shf4OVYZ34vCPIeF6NvzRQJfI
	xf3PlOo/9NmhNlzu8o08sUvZRj68Tw+b8K2E7FywZGi7UeArjxLf7I8vOcbYIE+CwvgX5QSwp0J
	MQ+N4siu3bexkR2SLyHKhvLjQll2yT2Kp8hkPko24rFQvqZRZfW5DRerYzoTph4qeA8R9w0Z6Eq
	isQ7+QWg2VhIXbuei26/gnpAmi32E7vYvgmVR4Ry9JoybTM5Snnzzs16pm4=
X-Google-Smtp-Source: AGHT+IGXp6uVqxTmSQMdMVt3uEBGD0ZfsrbyUn6XrfTKoToYQ6belt1Wh1Dck02/rxvTlH6EUyAxZw==
X-Received: by 2002:a05:600c:c87:b0:439:94f8:fc7b with SMTP id 5b1f17b1804b1-43f1eae40f4mr19787055e9.0.1744274973504;
        Thu, 10 Apr 2025 01:49:33 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:7d22:13bb:e539:15ee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d069sm47866185e9.17.2025.04.10.01.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 01:49:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Apr 2025 10:49:32 +0200
Message-Id: <D92TVG7AWGLG.1GO0C83SS7M9G@ventanamicro.com>
To: "Deepak Gupta" <debug@rivosinc.com>, "Thomas Gleixner"
 <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov"
 <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Conor Dooley" <conor@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Arnd Bergmann"
 <arnd@arndb.de>, "Christian Brauner" <brauner@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Oleg Nesterov" <oleg@redhat.com>, "Eric Biederman"
 <ebiederm@xmission.com>, "Kees Cook" <kees@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <shuah@kernel.org>, "Jann Horn"
 <jannh@google.com>, "Conor Dooley" <conor+dt@kernel.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v12 17/28] riscv/signal: save and restore of shadow
 stack for signal
Cc: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <alistair.francis@wdc.com>, <richard.henderson@linaro.org>,
 <jim.shu@sifive.com>, <andybnac@gmail.com>, <kito.cheng@sifive.com>,
 <charlie@rivosinc.com>, <atishp@rivosinc.com>, <evan@rivosinc.com>,
 <cleger@rivosinc.com>, <alexghiti@rivosinc.com>, <samitolvanen@google.com>,
 <broonie@kernel.org>, <rick.p.edgecombe@intel.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-17-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-17-e51202b53138@rivosinc.com>

2025-03-14T14:39:36-07:00, Deepak Gupta <debug@rivosinc.com>:
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> @@ -140,6 +142,62 @@ static long __restore_v_state(struct pt_regs *regs, =
void __user *sc_vec)
>  	return copy_from_user(current->thread.vstate.datap, datap, riscv_v_vsiz=
e);
>  }
> =20
> +static long save_cfiss_state(struct pt_regs *regs, void __user *sc_cfi)
> +{
> +	struct __sc_riscv_cfi_state __user *state =3D sc_cfi;
> +	unsigned long ss_ptr =3D 0;
> +	long err =3D 0;
> +
> +	if (!IS_ENABLED(CONFIG_RISCV_USER_CFI) || !is_shstk_enabled(current))

!is_shstk_enabled() should be enough here.

[The rest looks fine, but I'll need more time to think about it.
 I'll return to this patch in v13.]
