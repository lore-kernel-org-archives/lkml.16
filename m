Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4754A4B1E71
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 05:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747287164; cv=none; b=hBTIZIgExu0NsI6/fj8ejZKXsohGR2a9GOoxF66lKiyTh+L4krwMJIfIcUAb3BxvInn6Ig5yOOiHZWJ8Td+5uAnYp421YKeScnG6GwFc6mR31blcG8Bgotgk+V65UKfQb4hqyIYpAQcMpIPFx96ihGvql2BD3K2M0zT8lrXdO8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747287164; c=relaxed/simple;
	bh=nL/AwWb0UIVn64Fvbx3EViIj2Wlcd9QM/9GrTWRiGjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=McJoW1k1UxSbLYy2v7X2LtMkMWosl2uDcY0rJX+ZscV+5y8LZlZ4Iiiehwr2MQVJ0Da/XwSpCa2sX6vc84hkkXYsS4h59PzZIZEh1sU/+68QmxqAzFl0drj/X9iVTfwG/MvfClypxl9pMLNr2x6LeUCYXp2Y0RKKkANE/Uw/xv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=h8EHCKq6; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="h8EHCKq6"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22e423394feso634835ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 22:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747287162; x=1747891962; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nL/AwWb0UIVn64Fvbx3EViIj2Wlcd9QM/9GrTWRiGjg=;
        b=h8EHCKq64dp+VIOgF4qN2Pyr8kfD1Q7Kz2J6PssqXmCucr79gwd+3XG76bD11LIG1o
         eyGSyM7wlB0UofiH342LLqreElQibsTmqoZhNP2C08ZTceT9iRDs4lfr+EQL/xLowai0
         ktjf4n0B3BDSZ3+G8kLKwUMlm/WVNcI3g94GM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747287162; x=1747891962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nL/AwWb0UIVn64Fvbx3EViIj2Wlcd9QM/9GrTWRiGjg=;
        b=fH/oHMvQ08tyFjuXC/GIFgyZ6t9pPAMuH/DcRQQAeQiUgGuid8Yqr/qxsWzxxNGl1s
         xbFlI2YdBJ1pD9+cme/k3JKd65WnqiUkDUpsyrPlEYpGiz/ywA0Vdi4MiETmqtCSipp/
         AN1o0+IE3f0RMt4G9j5TG8oOq9/Lf4v5e9YjgGPlLw1cKQ0DlC6H6YIrcVLSwP33dS0/
         EWecjeEl2A0xH+5+sXLTCWuVTssfGMCGbga4IPhKS4+zT4Rf9TYShxlzn8ruqZBBwgxu
         RYT2oqz6D6amCnoOh9IECMX7hGx2HgjPhV8iQLvIaXKodE9TIqk6r3RES//K1REevGP5
         lNDw==
X-Forwarded-Encrypted: i=1; AJvYcCVp2vPBywtFcvcWVscwPCuRK5fD0tdPShE+7mhuubZHOArcmo52gQb7h1r3gnuntLfXUjmxzX4CPBYWbSI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs4XfLAjjtVjBsCu6BiH8LwNMpcrN8tl4qRvn2i9hrcQjpKTCH
	WsCewKW85PSSFQtxmrMraA4Itei2z3RV9SdtePapFAHvGKR88nDLpZ9Zfl+VXzIMbfqFTZuqP9d
	dEcxxKmxNYFR416xoqdj30/MVebBSSC6mBB9S
X-Gm-Gg: ASbGncuSti2llmtFoPgTxVyiQKk/gc1lcGC39VGna0BSP1wj+6okrp+YiUlItvXbaNU
	a2GMy4cbQHp9EAPz5jQZtrHkjxQ1g1AUZ/s9lcunepcGx3UzOIh50k3+KO+kcoIUxOY5Zly6j2K
	TGzot1xrWnD2qoec43f7ZlcEVHwT65Et0fKQ==
X-Google-Smtp-Source: AGHT+IHjXkpLBXt/bMjg33+WVFUaSd/5/LoxdlrGFWxzaSd7+0wnULTfmZFBOauHFUUZpvdpHd7H5RsAXugeCLqIBsQ=
X-Received: by 2002:a17:903:1a6f:b0:224:1001:6777 with SMTP id
 d9443c01a7336-231980e406fmr34818825ad.4.1747287162486; Wed, 14 May 2025
 22:32:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515050759.1016697-1-noltari@gmail.com>
In-Reply-To: <20250515050759.1016697-1-noltari@gmail.com>
From: David Regan <dregan@broadcom.com>
Date: Wed, 14 May 2025 22:32:31 -0700
X-Gm-Features: AX0GCFuBzuM5yglHwu4fr8itEusd5BhutkEYpX6HMBXs1GZE0IJlKKeEKb2lfPc
Message-ID: <CAA_RMS5ntpk6Lhqgv5OD5HQQ2X3bnaZCC64+ZuDHivLA6VBw=A@mail.gmail.com>
Subject: Re: [PATCH v4] mtd: rawnand: brcmnand: legacy exec_op implementation
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Regan <dregan@broadcom.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, bcm-kernel-feedback-list@broadcom.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, rafal@milecki.pl, 
	computersforpeace@gmail.com, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Dan Beygelman <dan.beygelman@broadcom.com>, William Zhang <william.zhang@broadcom.com>, 
	frieder.schrempf@kontron.de, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>, kdasu.kdev@gmail.com, 
	JaimeLiao <jaimeliao.tw@gmail.com>, Adam Borowski <kilobyte@angband.pl>, jonas.gorski@gmail.com, 
	dgcbueu@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 10:08=E2=80=AFPM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
>
> Commit 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
> removed legacy interface functions, breaking < v5.0 controllers support.
> In order to fix older controllers we need to add an alternative exec_op
> implementation which doesn't rely on low level registers.
>
> Fixes: 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>

Thank you =C3=81lvaro

Reviewed-by: David Regan <dregan@broadcom.com>
