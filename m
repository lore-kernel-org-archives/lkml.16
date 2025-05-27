Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22BF2356C4
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748346856; cv=none; b=dEtvJXKSZiFoli1XOkiU0nyDctreAgnM7g4Dlecwx5+K4D/xz+wLjWI+aNa7uCJ5LFKpWLXA6arkzyuInkuUkvqPIkcpLS+A9hVGt/szhDU1p8XGVi+DMxD2WgGrRnVIt0+J+VFTp4ipjuy92QgD7Jw884DLV5MK4h0yT0hc1eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748346856; c=relaxed/simple;
	bh=PJ6soXTmDT3YZ0f42M1DkP7vVxsdSiOpE2I2xmRdYq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tgP5Tqxh4t5J4mik71AAUZQCS1ZVTZYhwMZz5KRKwjVfh1EKv/+BWe3uWa0Bd+zppmqMy+VmumYu0MO+emhcM3g+dKbtcmhhJH970LkQR1a2dxK2ZpCf5nnuv2LnT08Czv7DEs26y0YmrNGgQn6HFtikYU1LyhH3qmA9X3PERLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geotab.com; spf=pass smtp.mailfrom=geotab.com; dkim=pass (2048-bit key) header.d=geotab.com header.i=@geotab.com header.b=mylwXSrm; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geotab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geotab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geotab.com header.i=@geotab.com header.b="mylwXSrm"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-85b38fb692fso42732339f.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 04:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=geotab.com; s=google; t=1748346854; x=1748951654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJ6soXTmDT3YZ0f42M1DkP7vVxsdSiOpE2I2xmRdYq8=;
        b=mylwXSrmvX1pNFbF7wpOm8fJnId6kGvzXC93/8ud+/fkidNhjXGPqXhRlm1kkavnaG
         11EFnHTFkdwE2Y6c5djdTNWsDt0jBeP4lHE8B9fZUilx5ReeuNrCFYNOwloXUgrqJhhb
         VFdWo8PfmejtkjpPnMRhfNIeZR2CfPEsrB3/fCsOsIVsiCHJD75+sQKjHb/KcVuj7el3
         75SDrFnW+hgvlRE+7WyD1N7Apt6twkrTveIGqzC/Vu4b2T0S7UNBSsff8FxAO6WuaHrC
         ED+y7AtnUf253wNOwene4ljdAfxOHb+qlZzj29wnLznliaORNg65MhU2tseCtCFxryq5
         fY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748346854; x=1748951654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJ6soXTmDT3YZ0f42M1DkP7vVxsdSiOpE2I2xmRdYq8=;
        b=KssKvbGbrU8qp5NDhzHPz36OIoeibmPWKy/1nG5vgO3SBk/g6mQwsJFzMWhZVLaUJ0
         VjTwD/dTKLvipMUZje55X8HJgMjoY6X3lAEqXWtbGmLy3ZccN67XsbU3+juC61TeQ2vt
         9VFMJt3LY4K8kMMqepagV+uvRiadBqmlQMb+HTV3dvYUVjgpHmqojdlbzOTL6K6aWlBl
         X+7Leud9AW4d/OpuVfxbpPeJpEYxF9zWUu8PDWN9gZOe8qnKG546aHGZRFaZq+0/X/7b
         CdmIEm4HY3AK0Fr3ObNeBC4GsIDQzu2+OoFOF5yXyKX7ITELsWwlA49kuWm/P04MwMjO
         W00w==
X-Forwarded-Encrypted: i=1; AJvYcCWi1UFFgF7CMdtCosVhZ6P2FbWLXVZ0VRVHI2/j6HvX9akT2fX4ERXMzT7b4uYijfQmVOeRWVgpu8+/ToY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAt0kLNESzoMEZH5znQuvr1kxAemTY5exXScpCMPwVGZPhFZVK
	+0Mxq9dHL1yBuBcc6lnkpb/4ttIG7zsoC3lSfhknGnKn9ETsiH8x21zVFxecDcWoEgJNn/9dHZ6
	BVkvs3Cu6EPMIwh3N+sIOIfMWGwrfG1uAN4RRcQbh2w==
X-Gm-Gg: ASbGncv92OF23UwTftBdJItaUf5PN6PI7vYF20QsFuxAQzHWcJOML7ASsUzucnCONnj
	g1AqOBIVTmzD6mFguSQgdzhccSPGs1AGSZEj6L1wbWvN7IcN5OOj75zC/s1zICRPyX5lX8/tLOX
	w4DQqDb1+n9pFi+4FKJTBkkQVQI6mw3qzG
X-Google-Smtp-Source: AGHT+IHesfHStYNK+RKnXcpNq0TgXDBWVZ4JQF+Ro/XEGUcvOTT1IJlVJKYa4IT7lXXEAwmx8MsCDzRmQWcsqjvUR8E=
X-Received: by 2002:a05:6e02:2513:b0:3dc:79fa:ed5b with SMTP id
 e9e14a558f8ab-3dc9b6884fbmr100866225ab.11.1748346853755; Tue, 27 May 2025
 04:54:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523-ubx-m9-v3-1-6fa4ef5b7d4a@geotab.com> <dfd63c64-184e-4e48-9344-a3db0612036b@kernel.org>
 <20250527-ubiquitous-super-bison-babfac@kuoka>
In-Reply-To: <20250527-ubiquitous-super-bison-babfac@kuoka>
From: Alejandro Enrique <alejandroe1@geotab.com>
Date: Tue, 27 May 2025 13:54:02 +0200
X-Gm-Features: AX0GCFvruvCSIpHvq0-b0fqRI9Afm8E-s8eNbMN3vbyOYO0UHqm6wji_D6aB4HQ
Message-ID: <CAN=L63qT6_kVrSJudv8iecmSit1CveZzFEU-2T7Tdpw_aiM4mQ@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: gnss: add u-blox,neo-9m compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 8:27=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, May 23, 2025 at 01:52:06PM GMT, Krzysztof Kozlowski wrote:
> > On 23/05/2025 13:19, Alejandro Enrique via B4 Relay wrote:
> > > From: Alejandro Enrique <alejandroe1@geotab.com>
> > >
> > > Add compatible for u-blox NEO-9M GPS module.
> > >
> > > Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
> > > ---
> > > This series just add the compatible string for u-blox NEO-9M module,
> > > using neo-m8 as fallback. I have tested the driver with such a module
> > > and it is working fine.
> > > ---
> >
> > I assume there is a user somewhere?
>
> This question is still valid.
>
> Best regards,
> Krzysztof
>

Yes, I am using it in a board I am working on.
