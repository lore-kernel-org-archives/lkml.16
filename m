Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F141925FA07
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 06:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751610876; cv=none; b=qHa6IEH2FDPG4LPyuq11vBX9Zf8mWOhNE/NgeaUAaCZ8qgfwdPjIGJ8JtzMasPZEPlLuqCUAebMiD3zcwwyRaxra6wx5ZTamjgcuHeAdGcAGNwKUZUEqU1OxJ/Kr0tPIH1PBerSmYu9nSKyflkb/jXfW7Ouvtvns5hhsSpYQy5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751610876; c=relaxed/simple;
	bh=PTKBM2MvrI8xS/gZxGuOqlh0CiAi+CbOJZQao5izSfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZGTJXlncQ2DbxGDkQFm5XeustqwJVX3sg699ordyjr7ElBCzRuFfJI6cqi5/QCEbUeHEXmUZ7sITbdmltgaWJbKX0+cZ3BAYzqeEx98IDV/UFKqW3JfcuzQBA0tVA8a3sxXoC7IURxOGGYyC8dtf8QlzDXWg++Rfr7BLbxU0AIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PLnk89DL; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PLnk89DL"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-235e1d710d8so9318135ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 23:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751610874; x=1752215674; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTKBM2MvrI8xS/gZxGuOqlh0CiAi+CbOJZQao5izSfA=;
        b=PLnk89DLV2wzXjBXQKppXMTmIz2d0bt2iE1vLrVf3/h0OubtPiPjFRFXV0v2OVp/5O
         HS71DCcxNdnT414uh6MzeVPk+kdMRjgp7Pq2vdC/+5cH2kc0TMaj7NwWpeX/YyGkdUFp
         3KSHCee5uxBDTflDjVDujGe5ql6WbFyBKwlo7hQ+771U4ULthpDTLVZhDsxC1jNK8Kim
         FZpKQmgw3dRIq+w8mjR1vKVczqHNzaVtpvAw9ixLhNn3gDIaFuYEa0Ph1Ur2jPhsE4/P
         WBDJvUzVzdPj5OahDWKEucG4gi/DMh40fUenEvQ7ZYBHSVC7z/zbgljIkR3b4yFVdozW
         4RAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751610874; x=1752215674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTKBM2MvrI8xS/gZxGuOqlh0CiAi+CbOJZQao5izSfA=;
        b=oBpQeO/8fhzMXNPGJLZ9uasCu37hVzdPDtNXvew0KlC9/lzMZj8i8KyY9Dw3P94NPl
         PNjuD+AXSYdY6Hcvb7oqQ+gciBga3AeUwHCfrYWsWF/8rkepumBVNfEYIxYvI4aqlbJE
         VmqEF4ntWprijo3WfFQAuwnFcsWJqoLPPeh1Q26Ycog+kz8z9CoUul4KM0hAMCKeK1Ix
         a08eE+aqEML0lzQUhQTCDSJkXlD2Uf4ER+VoG6iAG9mK7w1aQ/b1aVPPQ255vJHAr4YT
         TGzTA9wZ99whWBKBCvTS2hpQw8uXVwr265P2TSuVhGX8OVv3JAX8rRaRLAv7bYXIoyZb
         BrLg==
X-Gm-Message-State: AOJu0YyXdPLzsGSUkHE9lUHjiCuCf4RSEjCO7gLNxfTlQFr0ZMlWn48P
	Y5JUJMAw4OW04WopivgCKVbydjpcr82WE6bICwI9YyeRk5qNOPJDASagg6V9ddIVB682NGy2/ZI
	AJU8U8JEtjuwgh4LLQqCCXiX18oVIlrjbBU0R1qlh
X-Gm-Gg: ASbGnct0rZWN8gtfac8a6S4IKn5t/MvFLHyHytOVziJHl/xuYZkccOaGPtex0VLOPmT
	uIe4rpC3Wd18GI/xtrtL3CpZnYFH0Uzfqmmg7zs5PN+UjWm89WIMHaKhnXdK4YKlRA+ZiUrlJ7M
	KUakIkhLXpg/JJs8WAuK265NEGxHACVWwqbyjrbQ1bI3z2fVbS7hlhcj7/pQw8Ya3Z0lDWg6OYs
	IXn+oQ2sNZ9
X-Google-Smtp-Source: AGHT+IF50sojtWR/OHPQMe85A3Y2TrVSryTmAauaim7cZvshqBAfhpF5HZ/qYp0qxljY2BWLM1DeSs2ZS45GPo5dygY=
X-Received: by 2002:a17:902:cccc:b0:23c:77fd:1b84 with SMTP id
 d9443c01a7336-23c8604cc5dmr22078985ad.5.1751610874238; Thu, 03 Jul 2025
 23:34:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703222314.309967-1-aleksandr.mikhalitsyn@canonical.com> <20250703222314.309967-5-aleksandr.mikhalitsyn@canonical.com>
In-Reply-To: <20250703222314.309967-5-aleksandr.mikhalitsyn@canonical.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 3 Jul 2025 23:34:22 -0700
X-Gm-Features: Ac12FXz_V0IavjK1yk2oE3zt4iZsFaoFQ3pX3o8C0VokIhE8gtYLdtlpy1uvvaw
Message-ID: <CAAVpQUAmwFsu3PCpvK2y7Ty82X=HhK2z+U4AqnU1YQposrP0Cw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 4/7] af_unix/scm: fix whitespace errors
To: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Leon Romanovsky <leon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, 
	Lennart Poettering <mzxreary@0pointer.de>, Luca Boccassi <bluca@debian.org>, 
	David Rheinsberg <david@readahead.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 3:23=E2=80=AFPM Alexander Mikhalitsyn
<aleksandr.mikhalitsyn@canonical.com> wrote:
>
> Fix whitespace/formatting errors.
>
> Cc: linux-kernel@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Simon Horman <horms@kernel.org>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Cc: Lennart Poettering <mzxreary@0pointer.de>
> Cc: Luca Boccassi <bluca@debian.org>
> Cc: David Rheinsberg <david@readahead.eu>
> Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com=
>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
