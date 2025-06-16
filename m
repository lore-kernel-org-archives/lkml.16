Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C0622AE7A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 23:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750116331; cv=none; b=hVuhxes874BxiVtGVSZOAw+OX6w58r9ZTGaYC5manHwhK2l9omtmtU3SDjj7fR+ZhWyQQ+uBPimKe1pV4GpPHoylNa+wvCkPMmAlMiTkHJ7I2MrjYzf8Zaj87D6of/5xtawGKDWQd+az6oGDEoR0xSlVuTzjiWuCWoiX1CzJyYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750116331; c=relaxed/simple;
	bh=XJOZB+IVtVV5Fzg4VNhb51A3rHsEjRH540doiWQtiW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PsGCStiqufaRbyUDH74jt7iZTJw09Sa181v/zwu76CKbX12Nw2/HVH33SZ4eamYMp6CO16s0bejxrQkgC/zIiuAfoJ4q9xD0nQZh1IdtIiXulltlTRh2jQZW+dobhar3J1Ki7n/9//BtntmJy0v/HiglR++Qltr6whjajXRbHgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jlHuSHoV; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jlHuSHoV"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2348ac8e0b4so39995ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750116329; x=1750721129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5/lOmjyyHT5vJ7/xBgHtX1GoT1b9SMktBmzQn9y1zI=;
        b=jlHuSHoV2gfku5euxLgBnMXT4M5xS62ghsTI1VltKyQ4SuCz6fyBuvw3qt7h1+X+fr
         pvn4TDLBOr1Tf8z3cunIYnBkrdOJNbn+6zBC6gRqJ3MjSsZmqEa7KXKklQ3TeSDtcvpd
         kma3R+xG6XKrUuJ+6LoCAWlX1vUUUsa7Jwd2eKJQHbFNt+xWkM4LOQyCMMfYvABt/cKp
         aGPg4NrYCnRqt6FqMmYjruN3OEJTnCqpZsNvcbGACy8sHQFSYoG2Wxt7cOy+WaRpLoqx
         uy5dYAhbvKiv+GPFuaClnyuEQMyeoEUvqQ1kFPV6hBQobMK9VPR/L2maFHHf6OmT9a5s
         DP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750116329; x=1750721129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o5/lOmjyyHT5vJ7/xBgHtX1GoT1b9SMktBmzQn9y1zI=;
        b=w6xsJJWiERWFeGVXjRsnCLfq7QKeTkg0yAci/ZxTkIXfuEXCfcd4u7QZVU5HKXVe2x
         s9uCgYqPd33G8TR/Q97BzWnijCiKUWK9CfyaMHKHms6oPl1fHHjfemUwNzst+sC4gVUU
         HCed1Eo1QYGIaJFxJzc4diErAZBPQL4Z1WzPZnx+3agqIBLApczqsDQr66PEnbaVNSGG
         maHi/sDEraGYcrdUwh9RHZDRGuKTRMzZyduNwRDL3zfzf4Dk6F0k2FBHZlv5H1h1DO8q
         hPFhVey+/uEYD4oLlduK1DNCVBmpC+FTpcLdKi1u4izV2swlCSZ4HPzCjjhItJFvXKaw
         IfeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE6kCpFB6pathKCozJiuZgooJ7+zyA7RzGYz2pGdViiKhrbA3vfOUtaWGFgqAlhvbOR3Ka26DOrcXE9x4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMUmn6SQ2rroosQvofwX/1svfV6MCEbRppqUns6lq0kop5Oob6
	vTaKd7TtjBs76WxQSDtqQAXHDFd1vQjIh7iy6a9bMJ8Hf8GFNhjyRFloyiVmxnNnttvyc02E2OP
	QWgBX9UFVrGnfI5jCscvgoESTwSjM+smye7Xpo/XP
X-Gm-Gg: ASbGncuJCpsOK7WgREp3sfoS5tRNKVwrEHCjHj1Xm1FhJ0JWJOlRL1w+mdcgwVSygHl
	Uv8PDGxgvA8UzbFPB8gpgregZ+yWoPHnpbwjvw7UBWcrmRaLsoQOLIlbgH67AfXiju3xPCSzCA5
	ofy5XpVqUZbsq40Z1TVgs0+makO+ZcVlT5OJ+V2MPT4NPAh+CfBQEOifo=
X-Google-Smtp-Source: AGHT+IG+8jTrmeV9Ab1gjFTi49osSJNtC3ZPVT/sN+6a6pwpAnDvQS+htP9Bfnx4NBqktMaO4FtmK+YhuC9jHy1qm5o=
X-Received: by 2002:a17:903:19e4:b0:235:e1fa:1fbc with SMTP id
 d9443c01a7336-2366c4c2c44mr6831135ad.0.1750116329324; Mon, 16 Jun 2025
 16:25:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616054504.1644770-1-alok.a.tiwari@oracle.com>
In-Reply-To: <20250616054504.1644770-1-alok.a.tiwari@oracle.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 16 Jun 2025 16:25:15 -0700
X-Gm-Features: AX0GCFtBgVnzSUEF1LVDmR3nbbQD73Cyw36WOSVGWFYNzVaqpDiAniKUKs5Wawg
Message-ID: <CAHS8izOCsjM0rLRvF7jq7eUNiFQDLS4OLt_AHN9D9ncPVZS5bw@mail.gmail.com>
Subject: Re: [PATCH 1/2] gve: Fix various typos and improve code comments
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: pabeni@redhat.com, kuba@kernel.org, jeroendb@google.com, 
	hramamurthy@google.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, netdev@vger.kernel.org, bcf@google.com, 
	linux-kernel@vger.kernel.org, ziweixiao@google.com, joshwash@google.com, 
	willemb@google.com, pkaligineedi@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 15, 2025 at 10:45=E2=80=AFPM Alok Tiwari <alok.a.tiwari@oracle.=
com> wrote:
>
> - Correct spelling and improves the clarity of comments
>    "confiugration" -> "configuration"
>    "spilt" -> "split"
>    "It if is 0" -> "If it is 0"
>    "DQ" -> "DQO" (correct abbreviation)
> - Clarify BIT(0) flag usage in gve_get_priv_flags()
> - Replaced hardcoded array size with GVE_NUM_PTYPES
>   for clarity and maintainability.
>
> These changes are purely cosmetic and do not affect functionality.
>
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Reviewed to make sure changes are indeed cosmetic and don't affect
functionality, and the spell fixes are indeed correct. So, FWIW,

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
