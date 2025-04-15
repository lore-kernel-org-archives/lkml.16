Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E062798F1;
	Tue, 15 Apr 2025 06:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744700070; cv=none; b=hCI/8lpNDXVTvC/xlqCcsfbhyNbrE2CSu51EkrK1sdFvfw46jmmyolEy4TZ2jdn9C5mas2+3JJQ/5fiEiYjCD0V8nOlAH6wnMGIEzy9dXRGiQyFmqGlH2RyZY3MjV/eizR/6+EKTLu1+h1SGVI5hycYUJPvgZ1wh3fbSXa/2IrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744700070; c=relaxed/simple;
	bh=k9OqEDY3JEcssGMHTHMMKW2DIA2hSwtYUS+Auc8BG6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gTu9JKTKqm++BC0bnTFgy9jEpb30VDYua6ScdHK744Tnuvrm8h65StY+AneTzeEsgLzUaMuRQGfW1S25UvcrYRro94AwOS8pVuJ7+lxbcZlCL/L/xNM687UplSXNen5IH3vB6vSFdc6zCnCe7d9I844uKDyiLc/Gg9ByjFYKA/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YeAcuRnD; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YeAcuRnD"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-301cda78d48so4758292a91.0;
        Mon, 14 Apr 2025 23:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744700068; x=1745304868; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9OqEDY3JEcssGMHTHMMKW2DIA2hSwtYUS+Auc8BG6o=;
        b=YeAcuRnDeuqTfqDHy7y9FkPQheLIJEGKQS8j98CJ1BPZfU2KqG0gBod7R1xCgilx2G
         2dM9G6PxPHifdrSII+lS+JcAu15c2uzBgRWD5zfQf/m0m+DuFDE6CjZ8QsZxhfwslg+J
         iSWKLLK1KDOO0VXHbJnsF4yI4tz+3fGLlQBZ7CqNabDbW+7xuybj48ZE+HvUwc8gOD6U
         IANmDiyQz+fViWJAMl1OqtfD1K3IKqZW2d6TA1M2jkFd7MssSOkOmUx3EO2PyOSANE3Q
         HAKs9r3G1fIlNGrT8klw5vgrrzXYIrlMPkLmNgYkSPIJGNOKci00Ptv3kbVI7ca2cDh4
         o7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744700068; x=1745304868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k9OqEDY3JEcssGMHTHMMKW2DIA2hSwtYUS+Auc8BG6o=;
        b=PTG833+8M2EWXpW8Ewd6vG1rG2YGrujxrbMuatF/9+iES5aLzFwhu9Y5pYOVlLoWvo
         a89+/H/2j4kZMYeQwq4P1sWHUFKRrby0xHyz93TAABHvMJ04P/Ma3HmDXeq5nf85vex1
         yJgJUyMHTZbswkjbw2+gCnyb/hd79CHjzPxqatNjFNonJZBKSJAAArYh2Vp7BBf05kQX
         7kR0wFbWYvN0qOlYzLwsii+3JcHs5fUKqsZ2wOFWDm83kHLuhwJEA5ZoDizVIeoGFaXa
         /7wCAvFApDOH8KeUiN7st35Rgn8qltF+Q8iivuXCmevCJdumfrRmUsV7keNfg/rA17Xb
         Lcug==
X-Forwarded-Encrypted: i=1; AJvYcCVzs1ku5CKVu5XyrUrAC7aImaTZwbnk3IKil55946Y/DjXPBL6FBBtM0S5GGtI0x/kHVT6AcFvrxwKOSmrT@vger.kernel.org, AJvYcCXTIBZHJveIUji0nzwqzjDhneCON06e99vAd5AX0BItdDzovVcQLMMdboBdHR6u5R/yP1b5AGmYTJao@vger.kernel.org
X-Gm-Message-State: AOJu0YxPCV5a38xP1PpHlE3sh6dxs9NQBjh7irFNJ/2yS48847Vc8ZJo
	dC0xuiKqwCdORLjb79pyi78+IvBtOu3F1bHjbs9iLal9Y/j4I6uMtQM9hY6lm8D+U6ONtJnaS5p
	H19LafQwcGLCXyEj+6K58tjNY2rtzivFYVhHotQ==
X-Gm-Gg: ASbGnctTtvglAvOCSIT2ADG2w0oYxASXlozLn3Wz5Hvjcs2405Hb8nSEvuKeveQIQPf
	3iU2vdfR12OYKNI4Hn27JkcQC8+uGlYNAUvvJ0thk2o2i7z+YwZbTJaMV0FT+PaGk0fCyKWduS1
	1D5C3+mFoeCueCLfavkA==
X-Google-Smtp-Source: AGHT+IGsWWhYe9e4mWSJsic/j7kKIeW7DfXwjL4Jb4i7m9zXmuDIJPuuX3HEnkVvhnsbqUdqK2dIfJphOjrZOmuAgmI=
X-Received: by 2002:a17:90b:2811:b0:2ee:c291:765a with SMTP id
 98e67ed59e1d1-30823639c94mr21764256a91.8.1744700068456; Mon, 14 Apr 2025
 23:54:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414123827.428339-1-ivitro@gmail.com> <20250414123827.428339-3-ivitro@gmail.com>
In-Reply-To: <20250414123827.428339-3-ivitro@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 15 Apr 2025 09:56:14 +0300
X-Gm-Features: ATxdqUGxqJNdcd-JZaoJQzqSGgpBMKry2SLqzTD77e0YfcWpcDRWqQ9RF6-oALY
Message-ID: <CAEnQRZBt7mgi2ep8j5U=8DWA+KfO_nGfczXrSxAy_HaSeGNTMA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add Toradex SMARC iMX8MP
To: Vitor Soares <ivitro@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vitor Soares <vitor.soares@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 3:39=E2=80=AFPM Vitor Soares <ivitro@gmail.com> wro=
te:
>
> From: Vitor Soares <vitor.soares@toradex.com>
>
> Add DT support for Toradex SMARC iMX8MP SoM and Toradex SMARC Development
> carrier board.
>
> Link: https://www.toradex.com/computer-on-modules/smarc-arm-family/nxp-im=
x-8m-plus
> Link: https://www.toradex.com/products/carrier-board/smarc-development-bo=
ard-kit
> Co-developed-by: Hiago De Franco <hiago.franco@toradex.com>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>

Audio part looks good to me.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
