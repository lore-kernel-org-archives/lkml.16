Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21A11A238A;
	Wed, 30 Apr 2025 14:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746023495; cv=none; b=sPaDNLxfVN66ukauV3OiP4p2tPO+3AawvUK13Iwa8MnDvETSvJAzRZOhZv9v1RaSbv4+0k7hl//CHTKf/NVncFSe86z87ixbdqBo6sFs3vByfzdZi1hHwxLGzrfAUg3LJSz7NwQHXSgAv7mRIbRdPKouL7FqFhAI3wrLnPg2/wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746023495; c=relaxed/simple;
	bh=qIxqLkrLmqPsSQR6NTihzgmUq9naVQcd/zkTATyty5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HYZC4UaGyIcZlwGsRI6IQ5VJnJJyvmAcA+6Hv51uOQYSmVlMyHoAucB85tP9GqFwr2n797qwSboXqexRkFCnF+M2E5GyHqV8NdPv+f3LNeNgVyTXTMq0R3GAHte7s4jtfjY/8cASf2MGB5WLLDflYvdq4V3pRzvE1VaDhKeSgNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c54f67db99so131824885a.1;
        Wed, 30 Apr 2025 07:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746023491; x=1746628291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAEfON3QY41MEIN8lhv3eCjTSDUHFTJ0lIZRgiRgkZQ=;
        b=f0qtpecdUZlgOvI/nqdUO+ZUNssAFQLhepjN8JN06941YDl+vyTwziyqkIpWwPthkJ
         UuEYvlcABTkln3C5SeM825IhrgDNz/l3WEzJnk1ftWJvGfu6BUZWLRlSRDgya1Kc6S4a
         +dgC2BwXk0KS/07VXN0XFpqmNZjj4BdE/uAMGxgfm9Jdc964lG7pKAQsPdRZDEWdnLgW
         GhVFuzfPgWHPbacJ//Uw2ZPYwodgLUoQaImcVvCV98FvoPD+iC0b2GmZeY4Lhn5qll7E
         HOWpIcL/9w15FpHNvSDJ+PXIx7rKHJ20x3lH15rTYQIWNDVOUchUIBvnPtJEmh6NBYed
         MJjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1aWR4oqNFPLQQu5JSO+9cr48R+piwZiI8aBiVu+6IJxaSA+IBf4w252a4JxpiOuyX2UF/ay5/kNk6@vger.kernel.org, AJvYcCWzdAJhPS/oq7SY0FsklDhZnzUx3az1kuTL95nTuma/cpZPuSheePGir2cdhMIfCbmX8yO2OdkUGs71XLEk@vger.kernel.org
X-Gm-Message-State: AOJu0YzQkgtksuj8BhwgOVrZrbLoyikrknT2KJeSi2G/R0EEcp6pzsrp
	5UkkMI6/gzPRmf0i32h85k0Ij/ucKDTVnmcEQk+sml2hSrLpNytEFge4PlyJ
X-Gm-Gg: ASbGnctAOISrLFUiSqOEjJlBmwoUiSKpbQ1mu+F98caAXt+gww0dpDDpC0qP88CGloa
	ovtPe7HzOEGvycnoA21vvNHBUsLBXRmzW2cM2mxYnw64nOaWY/4+vEFepoxHOiU0qaJjtzeRDdE
	VtrruhYge4lPfUvvOJ4Zf4m817MEVERBT8lAMU2Ayj3jM7H+2vt2xscItvskyE1bnGzg9wTK9YM
	LYvwn8hRERboiqHPkHXal4/OxG9vayXL09lPa8SrUbJwULeMDHe/W7UFvz+wUCjVcp/flKjAkgR
	a5C5aJZx36B18LpxBar+g4Q8kjTQTn2y4eNbXVjglf+nyfG8WLa46CP97GPNNXuMeAJ1tYvJJ2N
	AlpsAV6g=
X-Google-Smtp-Source: AGHT+IHXnXsgDbuVB1IheDenFexQWApWvejADQQuydjcAU3Wv7fModFTvBwmdyZzbgd/Eb6skqaYig==
X-Received: by 2002:a05:620a:280d:b0:7ca:c6e0:669d with SMTP id af79cd13be357-7cac7b40895mr448034385a.22.1746023491011;
        Wed, 30 Apr 2025 07:31:31 -0700 (PDT)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958cbd048sm856298785a.43.2025.04.30.07.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 07:31:30 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c54f67db99so131816185a.1;
        Wed, 30 Apr 2025 07:31:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVBp32HdOt7BIN+JBjUPRiFho2GUja4yflsSHd0X46d/cmGnLsTp+tJzgbNOetROpfz3OV2xzmsaXmu@vger.kernel.org, AJvYcCVnD6e7GiHP7fbg+iVTVNzImQwNdKZ4te8RARNlwSbiIhgRkfLkO5DE5e9Hll4LgZg3noWGYiXy+D5A3bi3@vger.kernel.org
X-Received: by 2002:a05:620a:1990:b0:7c9:222a:d858 with SMTP id
 af79cd13be357-7cac7ab085amr489037085a.10.1746023490075; Wed, 30 Apr 2025
 07:31:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b1990c97-8751-4964-a3e8-9598f4cfac2a@beagleboard.org> <20250430160944.7740d5e9@bootlin.com>
In-Reply-To: <20250430160944.7740d5e9@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Apr 2025 16:31:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXoNk3cFm10dJNMK19Ym2RWZ_hyRpDXRZ_gjPAPZpAuVQ@mail.gmail.com>
X-Gm-Features: ATxdqUG1wAs_cKaEH0_mVx4aThxHb8GBnTIWTn-vglOuBRMgC8tbjtqH0Mvo6Do
Message-ID: <CAMuHMdXoNk3cFm10dJNMK19Ym2RWZ_hyRpDXRZ_gjPAPZpAuVQ@mail.gmail.com>
Subject: Re: [Discussion] Global vs Local devicetree overlays for addon board
 + connector setups
To: Herve Codina <herve.codina@bootlin.com>
Cc: Ayush Singh <ayush@beagleboard.org>, xypron.glpk@gmx.de, 
	Jason Kridner <jkridner@beagleboard.org>, Deepak Khatri <lorforlinux@beagleboard.org>, 
	Dhruva Gole <d-gole@ti.com>, Robert Nelson <robertcnelson@beagleboard.org>, Andrew Davis <afd@ti.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Gibson <david@gibson.dropbear.id.au>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Pantelis Antoniou <pantelis.antoniou@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Wed, 30 Apr 2025 at 16:09, Herve Codina <herve.codina@bootlin.com> wrote=
:
> On Wed, 30 Apr 2025 17:37:33 +0530
> Ayush Singh <ayush@beagleboard.org> wrote:
>
> ...
>
> > 1. __symbols__ based approach [3]
> >
> >
> > This was originally proposed by Andre Davis [3]. It defines an overlay
> > with just special names in `__symbols__`, which is used along with an
> > overlay for the addon-board, which makes use of the node names defined
> > in the connector `__symbols__` overlay. Please take a look at the
> > original patch series since it provides a working example of how it can
> > be used [3].
> >
>
> The __symbols__ based approach needs 2 overlays to handle the case where
> 2 connectors (A and B) are present an you want to connect a board describ=
ed
> by a single overlay.
>
> The first overlay applied "adapts" the __symbols__ node for the connector
> where the board is connected (for instance connector A) in order to have
> the symbols used by the overlay describing the board resolved to the
> correct symbols.
>
> I think this open race conditions when the overlay is applied by the kern=
el
> itself. Indeed, we need to perform 2 steps in an atomic way:
>   1) Adapt symbols
>   2) Applied board overlay

I think that can be solved by not applying them in two steps, but by
in-memory merging of the symbol and board overlays first, and applying
the result.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
