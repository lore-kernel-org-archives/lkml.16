Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59CE2AD25
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 00:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748046943; cv=none; b=Hgt1wbF4bslH4cDYv9mw8U5BN9bk5yPFL7SURoPh6MI+el815vPxLGm9NmzLUYxU3yd6F6PjYMfffAQmDENpZLtIf4cfC8XjcbeSaYnWSM3pI32gDV3zO9Ykn642pY3DQjlSk/4ecjK46truIrglGxgvcEQ72Ky7ELf7FOC7+GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748046943; c=relaxed/simple;
	bh=zYGyIK9NVY/25bRw2E3+fN76lGbRzZz30IN/ZoYMvIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hUxKVbpNjReyz7ModBVqosXl3//yRkyZaac1b9zyE+TybhAnNR/QYVMd9r+EilW3rQADBNoRPrlsZfrEs6g10zZOMydiyV+72CS3wnJ6UE5oXIJIPGRMFz2sumPKihbAVFko3OSn70kMO1UO8pLspvaF92eDdnlmrYMLLQThVKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y8zr+2VT; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y8zr+2VT"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad1d1f57a01so65988366b.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748046940; x=1748651740; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0myy5A0H8CZ/tHTIcBrkkpPXZ1U3g2SY6VD7SEMtej0=;
        b=y8zr+2VTlK356YLRKIx/I4w4EB7+dxnZ+tpQSgZlJNJ3w5DyfNzWMFaGc7x+FoZgvA
         y1WxQNfkHpgilOjV5p0O1nyfPSFo1WmVKUxTkpiVsAAL0uBzA7E3d3/9Olx9mPwr+lbP
         Tz0QzrpQ2I1vvFZo3zCi8FGEG7BtWJ+DCmIn5F7OBIetgxu9OMDdk/MQXL4Ggh1YcsmY
         c/WMrxA6F1QVSzSHSz3G5URRTFWp64rg4Jp7HV6nk7r0BgRuqPoyGQb1EiGFe6qf28jN
         oLyfAKz1GSaiDIF6f9kxUQyT3dSll7k9IRbn6VMuPmlJa79zmIj/FoZA6vBBrPq+0Uvc
         YfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748046940; x=1748651740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0myy5A0H8CZ/tHTIcBrkkpPXZ1U3g2SY6VD7SEMtej0=;
        b=JF/EICJAOevq7Od9Z+55p9hG/irv90q0dL7nKWITmHA9IFNjWF2jHDav7+vE8EbBxx
         5YLWpw4ReUK7lpWu3uDUNvUBwHorr6vLL7sGb59wte2GBSfDJq9pBpm/ZAnHeJf32/Cp
         Wtf7Ud4raQ7JW7Cq35VU2FymXx2Xoj/86Bof0IAW7YHZvwlp+XfwZnyZgJKcdaPqkkyM
         NpqZYvdQJiuCgx/xgz4OM9LTUlmao9uwWNFKajSgGRGaibZznzi+gaORVaphF6t77BDv
         xhop9TZq8/FF0HKym6IyAmPYQm/2rly2NN0iITP0GeKc0L0ZbbCW5rQkmY6C5H1NNoxQ
         E6wA==
X-Forwarded-Encrypted: i=1; AJvYcCXcJRVc4n3t1pSVaEkL0UdAb6KBHsGfa2UYgPBw9QySLUt5jcApCbqImB2YWw/79WYztqFMPnlS8wWIg5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlnmB5yBzKp5JRZ0rn4tL01Wfu6iYyhGbdCzmKOh4vqzbm+zHA
	hC3GhKjesgbgEbN2Bu4tD4y+2cjUEPgEsbA/ycXoeXtZCJpMW288rCFCjWQRmxSFCBJS4TK+vye
	Dnoivpn5NdHH70NqshGwgOqeK7V6/k6FmtWIe/cc=
X-Gm-Gg: ASbGncuwZ56dY7/ixMQzPjedjF+IppaFisyG0IYEWhh82J/oOxqvcGMfbKfQoPXZci3
	PmGTbytlKffkCbtklm1ySRKxpVMtR3C/pI9gKcd48xkGJ+E9xBY0qI1v/Zu4+TKs8rxq5Bjf1yB
	iCFjjrJpGVuhkD8afzJE8kXPAEDeP2eSZP/vjA+AG//mLyA9wXbDg=
X-Google-Smtp-Source: AGHT+IH19xqd0tlHmy23sQkbaDTtvVOEjv+V8a3crAU7xcBuKeF+Hm0/MGHLQd7t1JJNK4xgTN2tD4Kxp7eJLOcQxfY=
X-Received: by 2002:a17:907:96a8:b0:ad2:3f1f:7970 with SMTP id
 a640c23a62f3a-ad85b0b290dmr101017666b.2.1748046939805; Fri, 23 May 2025
 17:35:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGG=3QU5Yi2AfHS_poi8SgmatedRg-X8Ct74FOCJUc9iJNPnhg@mail.gmail.com>
 <2f6201d1-4e18-43ab-aadd-27643d57dab6@infradead.org> <CAGG=3QXQkJ6n0J1gZcgxfEb68NWN2y200ZCuxxDtqPRgWPci=A@mail.gmail.com>
 <998f5987-12ea-4bdc-b86a-35b904a34acf@infradead.org>
In-Reply-To: <998f5987-12ea-4bdc-b86a-35b904a34acf@infradead.org>
From: Bill Wendling <morbo@google.com>
Date: Fri, 23 May 2025 17:35:23 -0700
X-Gm-Features: AX0GCFuR50JfWgLwPLNRmXhPGcsCUrEnP4cdjht7KlfTFEqM79_KuWvZq2WljCs
Message-ID: <CAGG=3QVa6BgdtRknf3zY3tkguC1=FcMvNvz3fM8Ngywp0g_aRg@mail.gmail.com>
Subject: Re: [PATCH] kconfig: check for a NULL pointer before access
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 4:48=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
> On 5/23/25 3:56 PM, Bill Wendling wrote:
> > On Thu, May 22, 2025 at 5:16=E2=80=AFPM Randy Dunlap <rdunlap@infradead=
.org> wrote:
> >>
> >> Hi,
> >>
> >> On 5/22/25 5:07 PM, Bill Wendling wrote:
> >>> The call to 'prop_get_symbol' may return NULL in some cases. The if-t=
hen
> >>> statement accesses the returned value without checking if it's
> >>> non-NULL. After inlining, the compiler may treat the conditional as
> >>> 'undefined behavior', which the compiler may take the opportunity to =
do
> >>> whatever it wants with the UB path. This patch simply adds a check to
> >>> ensure that 'def_sym' is non-NULL to avoid this behavior.
> >>>
> >>> Signed-off-by: Bill Wendling <morbo@google.com>
> >>> ---
> >>> Cc: Masahiro Yamada <masahiroy@kernel.org>
> >>> Cc: linux-kbuild@vger.kernel.org
> >>> Cc: linux-kernel@vger.kernel.org
> >>> ---
> >>>  scripts/kconfig/symbol.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> >>> index d57f8cbba291..9c5068225328 100644
> >>> --- a/scripts/kconfig/symbol.c
> >>> +++ b/scripts/kconfig/symbol.c
> >>> @@ -272,7 +272,7 @@ struct symbol *sym_choice_default(struct menu *ch=
oice)
> >>>   if (prop->visible.tri =3D=3D no)
> >>>   continue;
> >>>   def_sym =3D prop_get_symbol(prop);
> >>> - if (def_sym->visible !=3D no)
> >>> + if (def_sym && def_sym->visible !=3D no)
> >>>   return def_sym;
> >>>   }
> >>>
> >>
> >> The patch is missing the source file's indentation.
> >> (spaces/tabs are lost)
> >>
> > Crud! My mailer borked. I sent v2 and it looks to have kept the whitesp=
aces.
>
> I don't think v2 worked either.
> See  https://lore.kernel.org/linux-kbuild/CAGG=3D3QXQkJ6n0J1gZcgxfEb68NWN=
2y200ZCuxxDtqPRgWPci=3DA@mail.gmail.com/T/#mf64c7afd19235d3dee4e572f96ff769=
36f921c6e
>
Goddamnit! I'll try again...

-bw
