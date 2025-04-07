Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D18221703
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049433; cv=none; b=PnNkv7vZYmzn8hOf07sufeuFDv5u+P9B3jWPwalgdzb8X1u2mJ0cAoTjmNfMTghmBUC2qxOy/SqWdGYB/awPlYtus1/7apSagA+EVG5rmAqM81+S+Zu3nXewzv3IGL7NsHhx0ETtsPfIs5nNF95q+pxNVor9NxaeH6QsKDJSbx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049433; c=relaxed/simple;
	bh=v9npP5qbKRifiCIf9b7irGIXhNLkL7PO9tLewH6PPVY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oOeWLiQyHPIBtD6kDjUCSnyhp5ei3YAlSDWfLvyjFGWGpyiu8sshwtKmG3g16f3eW+58Lwc4ZTE2elr2JHIsI3SB602crHKH8FXaALhUYd2pqW/Bw6ZsWD7s9NSlPd8xaasBic/L5TzpKsCOhBL+NyIuTSYIf4A85T4tl7sfRPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5Q+9D4r; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5Q+9D4r"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43690d4605dso31856525e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 11:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744049430; x=1744654230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2jy8IatPgSK7yiHP9LyAJS3rO34x8/Nplf/sO52+c8=;
        b=g5Q+9D4rDRCwARJ/i/u/XG+JzBQnY32OlcNWplUnQAXiI833NrkrhuwTDOtmhpEO1B
         VGxjq5z3zPqTZoSLoYQlvDOnTtLfgYNNHmLqtFzn+HjrkZmTEHtSUBgIgGXgUYpBmCwz
         Mm3+lJUp5m7PUNDieFPL5DM0lk6ehur2r52dfJQj/UnPv+EjY6UFqlRlRYVdKHHg4Cyn
         nX/6iRgGLyDb/81jCmUkduEKhHTEA/hM2zwA/5SNMGYHrgffu7VJTns28z0SSo+lFDIZ
         hE3T+WZ+d6jRRPspQbkyQvsrtxJwnz0NGkv/pE2ZrGX/44yRFFWF3e6JPabuLvVE7iOL
         Ssjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744049430; x=1744654230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2jy8IatPgSK7yiHP9LyAJS3rO34x8/Nplf/sO52+c8=;
        b=Ubh8odFBw34DRjSibyLy/WK4nNjn2Ad4EoKGHtI9RWZpitmQrFbbIkqccm4eDkZZth
         fS0QFtQRlQl2Dq1dEBB4hU2VRsUfhD18CE/29CGoZd7eqHuCIe4/00yTMRwznyOjwmsx
         /PLaQ2obU57Shm4J/SbWVt8Fvu4pUpM59a+vv9RkwhH+/9dxxSfUVl8NwqMZExP9iU0G
         OsfTVDaXpe07VdKzuCp9awd3cDcanHzfddxdAD6X9aZSvFZcp1GFVF3poNlJwYYs5vr4
         Xue9yGW3zge/DDeNksepAy8Jwb1gxykLFKrdj23q69WsnsPAPWU3KfLhDCQfQ/zCyKj/
         24Wg==
X-Forwarded-Encrypted: i=1; AJvYcCX+SB0euszbI1oED+2b1JJuFoH0uu3tr+bMDOVYkK8f83lnG+pJZtkSYm13kqzAqvCemgwuXt7bJZ7hZoE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv4fTzFyCMfpYl1jDWrO+APH//fJGO24JGmVaAUzmXguBpM/Co
	0bZCqeJT46T/OVjpevNSTaa5kWuna+901H9GD+ygw/jnv/dEeDCXdpnysw==
X-Gm-Gg: ASbGnctImGVBqE/fsYzBw7I1U24u0ThKi65Mwiq+Z1QO+sRcN2wXnAxLv72MaIt1shq
	gFdgl7g3anb4JT3/mjqtQEqKHersScOHCj2bbmzo8KwJIGrW7YUHkUa1Xq8svhwpZxKuKnTCZNc
	BV5iWlJOeyBq+REDqYrLnNgkGPQbUJ/Gq3/kG28U/BnpJ6NSvew1B/jfF6RFzTGVQ/STBd47oCf
	VCkyrv0lZTVbOvXinzW66EqYGxkBylTlT+g+Z/4Nr+9Tyb3l5n7NopAzPwFjpMbhvZow4qaY1RL
	flpG2HAHJMiXNjEG3t6l5WELDVHZHYz58Vl+SD8AMzc447SXOLsPCw7jiq+8VTZRRGclarUBhpU
	2b+rORT0=
X-Google-Smtp-Source: AGHT+IHaegiIWGdjPbnxhlEDw1k6oGNTFiTAtEH0eFypa2jskzJXuIGn2vVlNXDffixeGV1f7yuI3w==
X-Received: by 2002:a05:6000:4021:b0:391:2df9:772d with SMTP id ffacd0b85a97d-39cb3596914mr11334861f8f.13.1744049429775;
        Mon, 07 Apr 2025 11:10:29 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm12959981f8f.77.2025.04.07.11.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 11:10:29 -0700 (PDT)
Date: Mon, 7 Apr 2025 19:10:27 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Kevin Koster <lkml@ombertech.com>
Cc: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Oerg866 <oerg866@googlemail.com>, linux-kernel@vger.kernel.org, Ingo Molnar
 <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86/microcode: Fix crashes on early 486 CPUs due to
 usage of 'cpuid'.
Message-ID: <20250407191027.54494cec@pumpkin>
In-Reply-To: <20250408002150.8955343f4e2f2ac31b4663e8@ombertech.com>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com>
	<20250405130306.ca9822c1f27db119cc973603@ombertech.com>
	<20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local>
	<20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com>
	<20250406174633.2c581923c145687476191753@ombertech.com>
	<20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local>
	<20250407095848.7933a358c9f450fe03fb8234@ombertech.com>
	<20250407102927.GAZ_OpBw5hJ2QTFsKz@fat_crate.local>
	<20250408002150.8955343f4e2f2ac31b4663e8@ombertech.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 8 Apr 2025 00:21:50 +1000
Kevin Koster <lkml@ombertech.com> wrote:

...
> > > and I'm not much better, writing this now on a Pentium 1.  
> > 
> > Lemme guess: this is your main machine you use for daily work?  
> 
> For email/news every morning, then a (newer) laptop afterwards.

Buy yourself a raspberry pi.

	David
