Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFECCA935
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 00:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750380699; cv=none; b=pr3/I3dSKPVbI8LnbjEGvwPpGkqmDxckuNUQgg3Lk91jb5LR4bRne2ARLA8DxZ08QS993k2/U49YhJq4vjLkjrsfhrLJioG7F1flu6juWTH0F1colnP2HH1j3CgJMi9o/nF153rdChY4zXTSOR9gU/I70+TbepGJrQ9DkQ65vtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750380699; c=relaxed/simple;
	bh=XBfHEcK0mWjYsnnj8nv9sCwT1bjoUaVhc1XilYY5l2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ITlT0A1F9Tbx5F5kQXRRKUP/kujdKMAF0CqQyU5XhVDWd0tf3kZO4GZUHKLAwUtrRUR9AuDJpna7Lzc34CiJBeTch4Zhxt2/16t7bHcZFrcBN5TlGYTagDFak5IZSyg5hFASDLY8f+V5nE41Ir6TEkLt1FHnQckHfonEszM44/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZnMK5G+A; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZnMK5G+A"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ade58ef47c0so271792266b.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 17:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750380695; x=1750985495; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=amCKKTK7Xfm9vaiLtnNoWf+4gB9P6Ypa7zFByBfugqE=;
        b=ZnMK5G+A+WEyalYQwt6JJpcaXysCvoia/8R/4lxRVhmsdzlQe4pnji9hPimg0B92b5
         cs8Vd8ETAyI8J8gPskDBALJ8qYGeuC4Zp7NFB/rw/e9W5Z23TFRM4rnTmeiH2IkKtXXc
         e07+0f1vbS4EE1B6U8dRGaXIiJahM6TLHAmDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750380695; x=1750985495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amCKKTK7Xfm9vaiLtnNoWf+4gB9P6Ypa7zFByBfugqE=;
        b=q+ns2FltHy2ZnwfMYbkqSVxgBYixeRGILQ0GRcbgsuQNZjS1Do7oEXASejShDmx3WA
         jG7MGFFNVeNOFkAacaA0XU9hEd480tbuJ7y3zgrOtx93o9+axgyVr5FQO96zxZbB3QYI
         A5zBKahxPObVPmsxOHlRM5M8Ed53EkERhLt+8amDdZzSzljUzKo5L6tSK01EO0yRG3ta
         ZSSi1w1YB2Ify6fYDstU9XPTUZCrdqeHe2NHlfIiMc4pv2dtgppN9HBpUvV87K3QLino
         tUhaoVFFpP+zorUR981yIN7vN/7Er67HHdPnadgW5qGVYDcl9hayYXyAb32ktUxX4dJA
         W4sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdwayont0tmhuJ7eQDMEpy+f7w06rpks37i2CGkJUcNi5j7yRvF54uI9Xan6K44NVk6Od9Kr2G2tcbrM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzU9IWphv51+DJBsC/wZZ2y44EnzGpbsnQBvx2WLNgpexHVTAJ
	x5e22wNgP/RXRcoiL3TWHNM2TrG/DgBipQWsTjQGIPyx6d5Y1GxTIkt8nnkSeoKNvXlQaosFkyv
	gyaR5LCo=
X-Gm-Gg: ASbGncsCMCrnHOqVIOMdgKVjMI52Ry6hbpjFU/yhE+03E6LE/XxpyoEfsFGvvvp3PO6
	y9iovwJKB59wOURLQaEn785F4aCHMEVoFJ8e1aV3ARnXH3mmRnwmY2op1U8UVgnNTCv+5BFCodx
	PPumDMzXHc35JlSgjeuu8QfquI1Ugp2gYNTNGY3BmK6jubeCQ/0pxzQFPsey2BwMWx42CcXjKhq
	HNwRwTyfLJdfX1jeMH6AoBgwGqQ4aQ28GXoTueetKDuSItIRG4XQvPxyZgLx6zIVm0atKJRvyzy
	2+Lzlog0XZJrL/bqRWpMuuHvhW8CCxWTZCDQACPWrT6Ihypl8pGIOvxWdhjlk1Ogfbi6ywZ/c7C
	udskAMInyBjli8OzAVWnrrauMQ76oXtK+kSsy
X-Google-Smtp-Source: AGHT+IFVp0AOW+NscGhnKkXZnJYN3QQ48MudWdtCKr0QJs8aWYuINFFzn0KZVh445VLgqdkr89KctQ==
X-Received: by 2002:a17:907:2da9:b0:ade:9249:25dd with SMTP id a640c23a62f3a-ae05ae1fb69mr40766666b.8.1750380694831;
        Thu, 19 Jun 2025 17:51:34 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0543410bcsm70046566b.184.2025.06.19.17.51.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 17:51:34 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-609c6afade7so4231644a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 17:51:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVzM8DP8D96J3RBPn/yz1e+bOtCj0OM/RdWzJ+06zwaPDRb3eepUAfK/1+OmUelUMS7jacLYN8Wexs4XBk=@vger.kernel.org
X-Received: by 2002:a17:907:3cd4:b0:ad8:93f6:6637 with SMTP id
 a640c23a62f3a-ae05aff9d00mr27360766b.21.1750380693794; Thu, 19 Jun 2025
 17:51:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4xkggoquxqprvphz2hwnir7nnuygeybf2xzpr5a4qtj4cko6fk@dlrov4usdlzm>
In-Reply-To: <4xkggoquxqprvphz2hwnir7nnuygeybf2xzpr5a4qtj4cko6fk@dlrov4usdlzm>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 19 Jun 2025 17:51:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi2ae794_MyuW1XJAR64RDkDLUsRHvSemuWAkO6T45=YA@mail.gmail.com>
X-Gm-Features: AX0GCFuhpreW8drYXdBOfJBDTA2DYta__fpckLTs4pxLGozxz1PdEwH2JifGeHE
Message-ID: <CAHk-=wi2ae794_MyuW1XJAR64RDkDLUsRHvSemuWAkO6T45=YA@mail.gmail.com>
Subject: Re: [GIT PULL] bcachefs fixes for 6.16-rc3
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-bcachefs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Jun 2025 at 16:06, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> - New option: journal_rewind
>
>   This lets the entire filesystem be reset to an earlier point in time.
>
>   Note that this is only a disaster recovery tool, and right now there
>   are major caveats to using it (discards should be disabled, in
>   particular), but it successfully restored the filesystem of one of the
>   users who was bit by the subvolume deletion bug and didn't have
>   backups. I'll likely be making some changes to the discard path in the
>   future to make this a reliable recovery tool.

You seem to have forgotten what the point of the merge window was again.

We don't start adding new features just because you found other bugs.

I remain steadfastly convinced that anybody who uses bcachefs is
expecting it to be experimental. They had better.

Make the -rc fixes be pure fixes.

                Linus
