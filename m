Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91CB208D0
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 08:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743238104; cv=none; b=rG3d75KyoNOYC33frEWAWNZwTxE6MssIw2fre+ke22T1mTOFgJAf/Btw8PO/4xP5WGok6BLzO41qq1HvU6J/JLC6FVHY0Wgv9ovKTklJZZ7fqfbKsTyyMyh3nZs5KlAg6zDNqDDj+G6hksVXYKCcUOhltwrmolzsq5AdYx2kA8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743238104; c=relaxed/simple;
	bh=7b5xeDcGCdtsTCCz63v6qe/umnBA9a/AJw4tXCW+r5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A9V4ApJfnpCd8J6pOyPjU/DOh0CeszuHEYhr9A3kA9R+1tWG9YxRz1mh/IA7dUfcliMHd6ilDlAz+z8ANlXZo6pRmioQENd/1kPhk1oAtFVEYUqaaHVm2PwcW9ZI9u6lGHxV4aiHfVw6qYMMMc95+lXzGEeOzA13jQf4OO+43ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chX5K8OY; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chX5K8OY"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30c2d427194so29784601fa.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 01:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743238101; x=1743842901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nwuEpJzQFQurVKIoRIMqcXmjzrbmsPVGF6Vz2+s+bQ=;
        b=chX5K8OYt8/5U1nvVjHpbowBjullNOvIaIcPOsDbOh1gKbvgsuxUgUT5E58deZiZ3n
         XCvbkCbumXEmUolNnD9TrwfNuDAijdakFiaA9WuLhvGZ2S+fPIah+0eUvwW3Pd/HHuzx
         I6/gKLSIGNac1WR35vBNGDPRA7pS0VO4Qry/iWaqcFZFwLNfDPGohaDfjo4R+S1J9zpi
         fYu8BrK+EwjH0PdrPHWcL+CXweRo5mIbrzHsDhLAiLkfnXlvtlror0oJUqMI9tZeBgDq
         er+9Le1xbVH4nPT2PURzw42R+1RvzvkbQmQavUXXLXL85PgOJ/V0KIrExZh1gcsYxecl
         xNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743238101; x=1743842901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nwuEpJzQFQurVKIoRIMqcXmjzrbmsPVGF6Vz2+s+bQ=;
        b=HXqzv1xyXUF6Y8j5jXvCa2Z2gcqs1ELN69HQfTLVOt8Z5z1ZMhm1YMQcOkU56zV089
         W5kFFpFKNMS8KmXsUvAumq+Uwj8gR4AsGcBCR2jfWBRFRRXzMv2QpmZlyGtd1WCzhmVm
         2vBQp4fAlvDV9c5PoIJ21i6H0KfaYFjB6aPR0ldHpx7tQJbw7jHp/ZdNCWm90CZvq3YI
         GyvJ3AMk8uzEZpgDbfJhsOs0l6sgoUrfacjFdh6JKC7QUuyvDlyCnuiI4pfUPpF5Njc2
         UWQfvd+QKhNfqiBOx9Izp/3/YyFG18Jpyo+Kv8CCiCfgpUfI4/7OlSWlOP1w65BYqPQ2
         8yRg==
X-Forwarded-Encrypted: i=1; AJvYcCVS9S1mbYjq6+0agyJHGzhoanxy95fAKjZUmSnhcE9b799Bjs7t0vKUYSzRkSLkW+W2mFA1pwRa5PPU36c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrcurxFYaknGhki3m4o298/mB3kUw0pmqx5usgCkWh0/kS5Tmk
	zYocSNdRjXtVvEcLHeSjEgPGcrzhJdFZDzP6Fv2bvQ7HKqjBgAi8t6cSSttk1sPJTuwRie5J0iN
	FR5kVLfzdTuCZBLq2VAwx2r8w337akg==
X-Gm-Gg: ASbGncvDvYXOqcFXk3/aBh16nXRcC9tOQcnsRLqi7/OcANpP5JVCJwD5mMWMZLdrsBF
	R4f/LGHi9ZYtiJMNGyCbbrovcV7TJdglF+nTP/k2A74PtwDwEIZB3A+VR4AcT0I1MNqhT3MoAI4
	BzjBpOQvmL6C780dm4vWS18h6oa4cKt88JwjiF
X-Google-Smtp-Source: AGHT+IHDuBrbEGjNiEHyI2aE8xq7LaVKUuk/Tr+EcyUchZ2bsFIxhh/uufhM2/+6DZumbKtt7lt4AcJRwCvd/ckZKFM=
X-Received: by 2002:a2e:a547:0:b0:30b:c328:3c9f with SMTP id
 38308e7fff4ca-30de027a2dbmr8215651fa.20.1743238100549; Sat, 29 Mar 2025
 01:48:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325175215.330659-1-ubizjak@gmail.com> <20250325175215.330659-2-ubizjak@gmail.com>
 <Z-MjgKSzJKIVooFI@gmail.com> <CAFULd4agDYNCJrQQ8bji09eGVJp1D46LH=fOpcfciza2qhKJfg@mail.gmail.com>
 <Z-cib74Y1NjB4huZ@gmail.com>
In-Reply-To: <Z-cib74Y1NjB4huZ@gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sat, 29 Mar 2025 09:48:14 +0100
X-Gm-Features: AQ5f1Jr8R0HyYLkgmpYzCnKQEbYTwtaHN1gJVQXu2h_ZgM-aFDunDBNhfiW1vBI
Message-ID: <CAFULd4ZzoW+vP_pa1hEF--gvsG8yaPLU8S7oBkJBZLP4Tirepw@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/bitops: Fix false output register dependency of
 TZCNT insn
To: Ingo Molnar <mingo@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 11:28=E2=80=AFPM Ingo Molnar <mingo@kernel.org> wro=
te:
>
>
> * Uros Bizjak <ubizjak@gmail.com> wrote:
>
> > On Tue, Mar 25, 2025 at 10:43=E2=80=AFPM Ingo Molnar <mingo@kernel.org>=
 wrote:
> > >
> > >
> > > * Uros Bizjak <ubizjak@gmail.com> wrote:
> > >
> > > > On Haswell and later Intel processors, the TZCNT instruction appear=
s
> > > > to have a false dependency on the destination register. Even though
> > > > the instruction only writes to it, the instruction will wait until
> > > > destination is ready before executing. This false dependency
> > > > was fixed for Skylake (and later) processors.
> > > >
> > > > Fix false dependency by clearing the destination register first.
> > > >
> > > > The x86_64 defconfig object size increases by 4215 bytes:
> > > >
> > > >           text           data     bss      dec            hex filen=
ame
> > > >       27342396        4642999  814852 32800247        1f47df7 vmlin=
ux-old.o
> > > >       27346611        4643015  814852 32804478        1f48e7e vmlin=
ux-new.o
> > >
> > > Yeah, so Skylake was released in 2015, about a decade ago.
> > >
> > > So we'd be making the kernel larger for an unquantified
> > > micro-optimization for CPUs that almost nobody uses anymore.
> > > That's a bad trade-off.
> >
> > Yes, 4.2k seems a bit excessive. OTOH, I'd not say that the issue is
> > a micro-optimization, it is bordering on the hardware bug.
>
> Has this been quantified, and do we really care about the
> micro-performance of ~10-year old CPUs, especially at the
> expense of modern CPUs?

No, although the change would be a one liner now. Without specially
crafted benchmark loops the impact is not noticeable and typical
kernel usage of these instructions is not that sensitive on
destination.

Thanks,
Uros.
