Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493761B043C
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 17:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746899843; cv=none; b=oUAr2mwHxkYGFjj23QavBStK47SU8ccVU13msyi6DA2kRC5X3ebIyz9flgYUUPsteA64hvUc8Mt3C174B2EAXCzy7XmHEUbEe9t5DmUKov+9WqMvlLAlZ5njwwXNb63RGtFxWXaMuPThlhjz6BAJcSSjRPxTDGlcaDda+SjfMjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746899843; c=relaxed/simple;
	bh=WjgGUfr6X08qxQK3zfVrb3aTo/x2kOH4Dzdn/sVCI8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uoOTuRplzAL2Xa5N1ektQJ9rsuUWTD3EcaDsMPjyNqHxbiHWRZM6cxvI11qb7D05YJq4Y31k2CR7vKGK8zGResntxHsowuLg2C6QmCKEZP6UCCkyYkultjbabjPkFYMDQg394cwKG2s4QQ9NGfHyqvn1hYFWj5B/HERs40+38Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a42M2fwj; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a42M2fwj"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54d98aa5981so4982464e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 10:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746899839; x=1747504639; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjgGUfr6X08qxQK3zfVrb3aTo/x2kOH4Dzdn/sVCI8Y=;
        b=a42M2fwjO7jggns9B/kIVIC39zfwxk023gX7SsN02ebietWCjA8+ip6ffcvqJKqq7E
         0/aX0jztyEQyFmtaMfVYCAK08uGowJXfQBXzTulQNQXqr15BmfDRVcZxl12bNcgFeREA
         iKNFqMeWUpZ0qPcPBKkyfcyyxN/dEOWkTjw597zLyGYsaNxJ5988MAVrzOD06qy+pt/P
         6PETy89olOmrHsUGv14Sk7PKowS20n6JKxBYGEFPIaPRld/oguencRcBG0xLvqh9mFXw
         9z5nnIZiD7HEfX/zHoFreLSTNCDvz1KKmYU/bZPFvFIAU+eHteGfFtuiDX+dB5AABpEn
         fX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746899839; x=1747504639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WjgGUfr6X08qxQK3zfVrb3aTo/x2kOH4Dzdn/sVCI8Y=;
        b=DFDHTTcuK0C0DwYG6G6ujTpoQdCZ+TPs7E0FPNptBHocidZ/vOA1ylK2M/4IG5YEj4
         Ao82/7jx0U2b1zcP0nJef/kBiGP4YkyHcgwWX2um3P0WK5N2oAIHQkgqJFtCzC21YXM2
         XyAaJaGox4TuqQqOfw+uv+G2KtCDIURxkFPeSrg21vaXCgUwn0boEVdgmoF/PekiBkcg
         +BGWnn3//2JH/UluMpgxOOlbiGtgFf1Ku4gcaak2gjINUsUCtc+K9H+Wm4NjYj7WzWyk
         cW7Nkqk8xs/4uhJsM3VC4GrzFNo5MVb5Ib9yJi41v6Pld/sBl1t5wlP0gTkxg2guzI30
         mmQg==
X-Forwarded-Encrypted: i=1; AJvYcCWbLukDM/k/iWAVbhahi6lUfZuR5MKPZWiElzCNY5UhQL3Rq+H+wkHyl90pB12l5ASH/4bfV5QuQIq3NNM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3rfCoCvZulw1FjsYB1Ymp1Pfiqcke5LG/sjwpEm7ZKjc8EXDn
	zTTjxjxhEJAfgqrSfxwkHW2hHFO7h1w1E4nf3288JR6pvP7Ut7pIxlHynEiy6KM8zH8mWYvGtWO
	RZAGwxn1K04eI8Y78V8TkOFVYUhM=
X-Gm-Gg: ASbGnctv0ZzOAdSygHhfnknvJKN59S/D69sb41QflUFngQj7dlOCH6r2DbHbRK32a5U
	hBnkbBhR6zhpScjCwlKRk6DA0GkuJnt3HkBbF1xzuHLmGgWg8km7IXlJTS8oLyOHKlXkrfNLjbB
	gn2RS+pINs2TqtjohUpg0MkjWeEhAuOaxs3Iq54R4wsfZELsEP5TgfZheXFIvbU1oS
X-Google-Smtp-Source: AGHT+IF3Z7tQbN2UvUVUBVdgIrJ9vuxONRjESM/OBLUWaAOZrCvSkzujqqR6dmG4HVeFUAwt4imd8+AAeDimdibevQg=
X-Received: by 2002:a05:651c:30c6:b0:30c:7a7:e874 with SMTP id
 38308e7fff4ca-326c4569ba6mr34455471fa.11.1746899838943; Sat, 10 May 2025
 10:57:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250510011806.13470-1-benato.denis96@gmail.com> <20250510011806.13470-2-benato.denis96@gmail.com>
In-Reply-To: <20250510011806.13470-2-benato.denis96@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 10 May 2025 14:57:07 -0300
X-Gm-Features: AX0GCFu_Mc34XZBVrE6yFFGghE4cYWVtNs10oUnBiwd7enOu-iz8bicOZ1AybT8
Message-ID: <CAOMZO5A1oRcUuNVcr_kcKz0SZqGc-AHzLR+__gRQEaV__xKbsw@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: imx_v4_v5_defconfig: define CONFIG_ARCH_NXP
To: Denis Benato <benato.denis96@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 10:18=E2=80=AFPM Denis Benato <benato.denis96@gmail.=
com> wrote:
>
> Define CONFIG_ARCH_NXP so that CONFIG_ARCH_MXC won't be disabled
> as it depends on CONFIG_ARCH_NXP.

This is not correct.

$ make imx_v4_v5_defconfig
#
# configuration written to .config
#
$ cat .config | grep CONFIG_ARCH_MXC
CONFIG_ARCH_MXC=3Dy

CONFIG_ARCH_NXP is an arm64 option.
