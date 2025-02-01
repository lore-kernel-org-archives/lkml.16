Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D04838FA3
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 04:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738382416; cv=none; b=TK21OfilrkUwlhKvAYLdX+M4wSzQE9CKlMntpr7yi1jqJ2iSXzJm3ZPhPPpTlEH7Kj1qC9UzOnDTtNK8T3k9m3VmsckUyrzLjhTuYYPe2H7I5Xrc+yJkm9sgdNvdhDBaxvmgG+VpdaxWw4h/uQ9H7a8iNjg1Dr28F5cP/Cqj8qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738382416; c=relaxed/simple;
	bh=J+/DF/MYyybwQOoCzh3Da5vL6r/HrjuAQsfm2tKlNwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e6v1Tnd87ntlnHqQie62rjx8E2msvUgfycXu8i1Fjt0mux6tpsDejlDxXIdDB1Ev9fX+Jo/iQpA/txgXMWEG5D9j9TeqWPJ7N5qw/vPLcoDP/+41eHXB9OBbwg2l4N/w48orujW/bCtRd14nqY8eyIstL0Fw4GRY//wPWG+0Z4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MvjJ1zhG; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MvjJ1zhG"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab2e308a99bso521540166b.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 20:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738382412; x=1738987212; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0zk4WN08CNrpl2CFHu09s+YzfSsVnh8G4cBCTok6rwk=;
        b=MvjJ1zhGxC+ZsdLplCVpitekjFNhtrlSI9FBIoFxhvalMIstZe+aBN3+Jv+zj+UEiI
         SGV5vjEHdEsP0GwIP28G50UXPk4tNzK7DpuzQtJJIZ7ZAlVRearfUmZ+8zqIly2SS39d
         t2GtM/M0Hyrr80X6G5u9ncI9tl2k3+kaQK0wM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738382412; x=1738987212;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0zk4WN08CNrpl2CFHu09s+YzfSsVnh8G4cBCTok6rwk=;
        b=xO2dlE3cyoy2TwjTjr+RmuF6m1RZ4CLlcu9cz36V64ZFtPVwX5CxV/GXhYiT1ZMHC2
         EktkbAQe/RdDlctUdpCDD3AjYLAjyv6q6mQBf2T6xCfWGHyktfogHEqd7jXyL/k0Gwy5
         ATW+VxxVdsz4/7rGRZfEvUVHcpE/IqTM3585x8dh9ehVzfoiCrQgwCm0BxTbtp1iWWfT
         QBRAEI3EcXBxvoeo6By4D7wQ0TZ0NyrbjHj/fR3oLbBTM7T2MEgkf/yRXgWnd3qy1DtZ
         LnLM++ykPwOxxjeeHzH8IEy6dx3AFe1tMUEhHY6Jt3l8HIGrcyO+HHQ9l6iPOrZozOuF
         o3nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhO/qWYOvXi86OL1ix9lOKeGd0blfPL8DMuL9Umnf0xf2MdoRsFXvgtABE/g0GElGBx1XvID8jUXT/OKY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzixzMXewTlBHKqRqn3gsjYboIISLDFjccfcA2crM0T+YI4756X
	cSk3UtxIbDFmaXliqT2B6aA3tPH7vYITmfzdIKIws3dlPnJ2oKBEs8Y7Cf1btFIAnDEA1dx0/Vl
	KBsc=
X-Gm-Gg: ASbGncto5jE5iQKx6rWB/0CidWyxyXOUKy/iRT7s80n85d+57aKESCsy2s6SgUuHX9i
	U91sepSdR4I9H3O327k5MAgkPW2Je4iR4iDwXDawwZ6og5ZPvFAKzRCBSP0qGTE7EWPKuLdOJP0
	RibwKAqwZqZTmjfCqpkRWrBGYCrW3WAQHvI5/x9c809PZqi2bMJckABQp0RU0Mym60abh0dbFFY
	Xfj1KLLGga1iZpncbGh8FJLvtNtijcQkUeVvx83/yEyDQ0Cm2g3x6sQCPcvoAKy+S8jokFYlPdk
	2eKbOSO+5eAPHYg3KIB/wRHaf4Xd6X6BvZSZ9BxlI8SxDNHWFwCbO1KwBAZ8Hs1rrQ==
X-Google-Smtp-Source: AGHT+IGtSNwsjqlsi6hW8CpLqIDEOl1ve6tUkPhJno2HV6GqbzXRTyhDLbPQKmYU4196HpduxETysQ==
X-Received: by 2002:a17:906:650:b0:ab6:f88f:bf1f with SMTP id a640c23a62f3a-ab6f88fc26fmr709995666b.27.1738382412270;
        Fri, 31 Jan 2025 20:00:12 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49ff75esm391015566b.99.2025.01.31.20.00.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 20:00:11 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab6fb2940d4so296810266b.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 20:00:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWHpv04I3wYt4+zL8kmozuqQ1l1ydqjQHDOvJnL3fypIMhFJTbXrMZG4ruhS5sj3ERIVVWbS8tm5gU9X98=@vger.kernel.org
X-Received: by 2002:a17:906:dc90:b0:ab6:d4ce:5674 with SMTP id
 a640c23a62f3a-ab6f760de6emr713220566b.26.1738382409950; Fri, 31 Jan 2025
 20:00:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9> <20250201020003.GA77370@sol.localdomain>
In-Reply-To: <20250201020003.GA77370@sol.localdomain>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 31 Jan 2025 19:59:53 -0800
X-Gmail-Original-Message-ID: <CAHk-=whk5X3s=vRM8-pZHmLLOempVbDHUJKofVhsnUUmHp9YmQ@mail.gmail.com>
X-Gm-Features: AWEUYZnb9RzpYW6_8B6f0D6dkej0i9B545ZoGrtrx0yV0z_972ni3dxKSAkg_Js
Message-ID: <CAHk-=whk5X3s=vRM8-pZHmLLOempVbDHUJKofVhsnUUmHp9YmQ@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Patches for the 6.14 Merge Window, Part 1
To: Eric Biggers <ebiggers@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Jan 2025 at 18:00, Eric Biggers <ebiggers@kernel.org> wrote:
>
> FYI this pull request added a 90KB ELF binary at
> scripts/selinux/genheaders/genheaders in the following commit:

Grr. And yes, I missed that entirely. It's the stale version of a
build-time executable that is now called security/selinux/genheaders.
It got renamed some time ago.

We actually have code to get rid of stale copies of that file exactly
*because* the renaming caused annoying left-overs in peoples build
trees that "make clean" didn't get rid of (because "make clean" just
cleaned up the *new* location). So renaming generated files easily
causes stale files to be left around.

So it gets removed automatically by

   ./scripts/remove-stale-files

But that removal happens as part of 'archprepare', and I suspect this
got committed before the stale file removal, and then the commit got
rebased (Author date of commit: last August. Commit date: this
Wednesday. Date of genheaders moving: September)

> Presumably a mistake, or else something a lot more interesting.

Well, unlikely to be anything more interesting, since the only thing
that is ever done with that file is removing it. It's not actually
ever *run*.

But yes, very annoying to have this in the kernel git history now,
even if I'll obviously get rid of it.

Thanks for noticing.

                   Linus
