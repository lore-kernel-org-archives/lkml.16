Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9053288C9A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 18:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745433892; cv=none; b=JFlWUAcOfjS8vFdNSHlMhf+wJkOlkOT+DGXgPoBRfSFeoCZePtmcaVNcxQ5lfqpkvroG688yuPEMoJiNza7XemkbTJCmUqBGrEklROS84KPRe7F6p+NYLetaV/IDc2EDa1Bo5CxRBk3CglIWycBRQsfN1+Ad2HtXMRyfTf5dTE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745433892; c=relaxed/simple;
	bh=C8Vy0QjWrcwscWvUeewG3k/22VJUo67jEM+Dw8FZWfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGY/+C/3NIzR/zvgVY4VldLzEQFKFJ4T1TgBXah6oy4F82iKVq35U7Ln2Zx1mkkmLB797pNGYaXhmGO5gb0Dx6aG8GITzn/pm5EWNoFrIEQsyiQOzfyXSTyKu77E31EMfFrkVTesDRBkIGBy7bpub5Pkk6Nt5yGHLMUlYUJ1t5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PICXdsfl; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PICXdsfl"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22928d629faso1611855ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745433890; x=1746038690; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dyuD9/sJAUbk/RnjGg0DeufQJHAxdMe3Ujkj8v1B1G8=;
        b=PICXdsflgT0BWtC/wy2HnVBs7qQH6EuC91V5mX9kav1QK2XDNRHZrFO77mACMbp3IL
         woFJHXYmB1YPwVmG8nx8fDdjm4fRAH4l7dsdFq0H2CtLo2GJp5sN+xTkSW1wXrZXjHUa
         kp75v7SAe9UFBTkeCSndZLeWY5+jKUQOOnnqCdxBaySKkRZ5CYQgZVR5hX+S8lh9Ymcu
         3rcUdF7O4AIvdY9QW412SFM2y6piVhgPMeBq2LCqShnBCxc2QNLs1N+tTQLqY6p7LLlY
         DLJNsOgzu2l8fcRf4CrP4BWv8hBs0Q+8lMHx/+8uQ/1E5R372EdrjhlROKAIxHKRLfR1
         Qcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745433890; x=1746038690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyuD9/sJAUbk/RnjGg0DeufQJHAxdMe3Ujkj8v1B1G8=;
        b=BkgE+0LZPeD0aUYOSH53H+ia1K0M3uUaeZdDdZ14ZXqmqKr6gzt2iyAEgKgVhS55qW
         iVNf+L9CEgtjyk6PxRCeLtBQS+tqtgX5d6KN2RLv++GY7+dTwTWK+VrH/+YeVsGe6DN1
         HsN1wTHLpli3xbYCvq5/PA/3RV1xK9WyLGQ5/eLLFu3qt40knWGbXCHr3Gy1OBaOVl5m
         3FM/0QYtG0m4az0uDoKoVKnIpe9lg0xghOrv8adUA4MBI7cDvd5xzyfFQJa2mkd/rc3O
         TVANUzBvWzNOcF3I0jgrwaov/PpaV0jFoGPzAJbZwt3rxQNyoBgrF1qV5y7dwihd0NSm
         H0sA==
X-Forwarded-Encrypted: i=1; AJvYcCX9BfDUdpTBwlJT5z2aSzlCoXOQJv+cu9QeBa0ckPbi23n3dNy721+CGpq1ksWfMN3wNSZ6ElV4xyhbo5c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Q+jQLMNzbuYDknNFh5Ww2hJdr8zw0O/ahpn9F6+z3Nu2vTpu
	U9d4j8lsjfF4zpY72M4hiZQLVbkcmwV4iUzsbF21lG6sjjPjyN50
X-Gm-Gg: ASbGncvYr+PUsZLjXNe9tkdZWWRwuopusDhGOnsf6lDfcDv51SrmKHmqEHgoqWeAwKd
	M/xuBTgDkBCnGtOCFTU2ThKxaisNavsceInJdf/Ex+4kOM7DnfWONZx9EmErn78xW/0gRAyUm3f
	BYKo4JXZyiX/PmCurUp33q2v1mwvd7I9k4zEcqg2RRDQy7chuj9FEpt0pIoEIeLvbnJAv6iCJIj
	rMCZpCZNgrSRFyfebeoISPkazjvKKx8+dwEs5sVVLIC2iGLXsFVQIOtzxKUmaBbOrhdNDpO/SuK
	sSn8fe9DOXdEH9jEy46UktGmHOdxLY8RhsI+60aE22GCI+bPON8=
X-Google-Smtp-Source: AGHT+IHehkEM0GpRg5zfuUpHGpY51Oz35KQoy2mf8GVVVNyjw21DRg3BRF5CuxGd2alCupb+hBqELw==
X-Received: by 2002:a17:903:247:b0:220:da88:2009 with SMTP id d9443c01a7336-22c53619eb5mr285278835ad.45.1745433889820;
        Wed, 23 Apr 2025 11:44:49 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db13a3e63sm9433123a12.29.2025.04.23.11.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 11:44:49 -0700 (PDT)
Date: Wed, 23 Apr 2025 14:44:47 -0400
From: Yury Norov <yury.norov@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Marc Zyngier <maz@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Luo Jie <quic_luoj@quicinc.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, linux-kernel@vger.kernel.org,
	cocci@inria.fr, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, quic_kkumarcs@quicinc.com,
	quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
	quic_suruchia@quicinc.com, quic_pavir@quicinc.com
Subject: Re: [PATCH v3 0/6] Add FIELD_MODIFY() helper
Message-ID: <aAk1H0Msi3lMKNR9@yury>
References: <20250417-field_modify-v3-0-6f7992aafcb7@quicinc.com>
 <86sem7jb5t.wl-maz@kernel.org>
 <0c97c659-bd28-45e0-8537-d9be2637cb22@lunn.ch>
 <86mscek7h3.wl-maz@kernel.org>
 <aAJq9mGswYsnAOS8@yury>
 <aAkm79R8f5Vf6TLh@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAkm79R8f5Vf6TLh@shell.armlinux.org.uk>

On Wed, Apr 23, 2025 at 06:44:15PM +0100, Russell King (Oracle) wrote:
> On Fri, Apr 18, 2025 at 11:08:38AM -0400, Yury Norov wrote:
> > The _replace_bits() functions return fixed-width values, and intended
> > for: "manipulating bitfields both in host- and fixed-endian", as the
> > very first line in the commit message says.
> > 
> > Those using _replace_bits() for something else abuse the API, and
> > should switch to FIELD_MODIFY().
> 
> Sorry, but please explain this statement, because it means nothing to
> me.
> 
> FIELD_MODIFY() replaces bits in host endian. _replace_bits() also
> replaces bits, but has a wider range of which encompass FIELD_MODIFY().
> 
> I see nothing that precludes using using _replace_bits() with
> bitfields.
> 
> I see nothing that would differentiate the behaviour, other than maybe
> religous ideals about C functions vs macros or upper vs lower case.

Interesting, never heard about religious ideals in C.
 
> Please explain why you think there's a difference between the two
> because I really can't see any reason not to use one over the other
> apart from asthetics.

I explained that in subtread for 4/6 in this series. Shortly it's
about compiler's ability to catch various errors, like overflows,
and (not unlikely) generated code quality.
