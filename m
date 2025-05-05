Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7926128C86F
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 23:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487809; cv=none; b=bir4fO9QN9OFnSQ6S7NdUUhNH8QYjl2rm+Jp8jPRMmPCav3n76b+fMkTD7mr9oidRWRdnaUHTZw9EoM1iytoX+ocRD5yNcFc+5pwJ2dgYUJgCVQR2FnB2w6kRiUKpNigvYaxE7utyWTNsUSfqpy/epbB8IVHY1MysfZbmCXkEBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487809; c=relaxed/simple;
	bh=Z9EL2AmRSSi1CFpKFRtGl/iUg7FQoO1nMOq7Ho2Xk+s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TqqJ8hvsKBoN49UbSHbCUSYRcNzUPr3x76uPP4XSippGJ/fVJBUEOJ7vbpfiQwPEJe8F+ZGui34ZM1OdXf0YcKTBNJevLD8a4XEp9ypMsGXNoW9QBU84kBc5S31N+bRHoiMZfVtZgDUDlq4+gbF4NP7D6SE9KZsmCQ3clUNfCo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=intelfx.name; spf=pass smtp.mailfrom=intelfx.name; dkim=pass (1024-bit key) header.d=intelfx.name header.i=@intelfx.name header.b=dHPQHa8L; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=intelfx.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intelfx.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=intelfx.name header.i=@intelfx.name header.b="dHPQHa8L"
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso7462907a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 16:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google; t=1746487804; x=1747092604; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7EeTWe2vOY9sfTUd+uEiP0EKhNqq6tm4RMFETZhCTuA=;
        b=dHPQHa8LKYK6uTyLDRU87YyPifgJs/IDF/cWgPtGlLdJgpUh2irGJPykdncYPUSH1k
         9BhI6MzvCw0YIHREknNdZp8GvBrqQoHw8DJ4EsVIvXrF3Z96ui+oOn+EI6EzU9zqYFG+
         C63xgMlBtXZSJwZMjqGM7MttWVRaD2mslsNWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487804; x=1747092604;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7EeTWe2vOY9sfTUd+uEiP0EKhNqq6tm4RMFETZhCTuA=;
        b=Ffm8MZQFFbOdA/0vlfHiht9qJU82hhULmVAN4gK0oeVJy6EmC2Cp3S5vCyc1EnDIHW
         wKoLL1/kMIhIxgb3xtMPbdF9CoJiRAymo/mblEJGLbE9MQGbD1MEFd7r0D0W/amXTjEJ
         vMUzQoINia1zt+1xs9sLQqpBQ5h9keEy++H/B6fLhgEbdqhWAN+lA1RunPd11uoJy/Ri
         qbFyxYreegaP659n2w5SnUJ7hA9Cl8Z4TF0xDTGXSfLqS7dgfL7p4/OM5kjwohScqoao
         aBxgMgOUJb0p23eKsTyajJ7NBLpM/GssVrjM7ps39zaEk15SfAbYe6wNw6H2WUw9jy/6
         fFKw==
X-Forwarded-Encrypted: i=1; AJvYcCUnYvNegNMZJF7zjHjicSieeFNLNPHt+8Obh6GL/kVX6Y/IDIMshhrSPqClm1Xybc+44Tsrk8EIcLAXpQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdGccfVj5cnX9DPcXahI8e0OllGh9ikOxY2+Gltf8ec5KF5U0l
	DZsKmfGZjLjDGv9W/GYagYG9F8rPHEGuvv8mKer7wM7UN0VG7GMTIV8l38U8KjU=
X-Gm-Gg: ASbGnctlc8YE0XOZlXEpLeVN9TrX03oGMjzOAqPdvrogFTM34nWypIcLkSs4K28QfgB
	4kYN91d66R+sWfqQvt8eLJwh+CKPEixSLQ72xCCz8mriZwur6NSaYzH5SvE8lYUfcM41BGcf0Kb
	w0MJ4DHHRwr71roQJ8jO26Lq4WTwUoO0DvJaULTxdKuQbqNKBRYe9HCH7Loq1AvhSSIVoWAD2oW
	Ia2lzoAk5CFFrlF5aotGTkIbT9Epf4Tk6+mrHJPDjxBPvOBbxiXJU24Ro1TFCeK4kenDTue4/wj
	VaD2uysSKcRhbjcRKW3DIhDFTGN2S21a9gE2Zk08gg7UWo4eziu2m1y7BS7wtO8rLsr+kNk0U3L
	Zzjqp43vl7x6c5KnVuoGp
X-Google-Smtp-Source: AGHT+IEIBEY87wJBYO9p8Dng2HG4EwyPw5fqzeX7ufKZxdMeozQDVcOD6O/19cWw9AkxLLXqHNpBwg==
X-Received: by 2002:a17:907:7ea5:b0:acf:c80d:ad81 with SMTP id a640c23a62f3a-ad1d46a9ae2mr72197666b.39.1746487804347;
        Mon, 05 May 2025 16:30:04 -0700 (PDT)
Received: from [192.168.100.9] (188-169-240-93.dsl.utg.ge. [188.169.240.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1895090a1sm575604866b.137.2025.05.05.16.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:30:03 -0700 (PDT)
Message-ID: <9b1d18baf8d6839630073058a3b33c31d1b4649f.camel@intelfx.name>
Subject: Re: [PATCH 12/15] x86/kconfig/64: Enable popular kernel debugging
 options in the defconfig
From: Ivan Shapovalov <intelfx@intelfx.name>
To: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>, Linus Torvalds	
 <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
 Borislav Petkov	 <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Ard
 Biesheuvel	 <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, David
 Woodhouse	 <dwmw@amazon.co.uk>, Masahiro Yamada
 <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Date: Tue, 06 May 2025 03:30:01 +0400
In-Reply-To: <20250505110946.1095363-13-mingo@kernel.org>
References: <20250505110946.1095363-1-mingo@kernel.org>
	 <20250505110946.1095363-13-mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On 2025-05-05 at 13:09 +0200, Ingo Molnar wrote:
>=20
>  - CONFIG_DEBUG_LIST=3Dy:
>=20
>      Fedora/RHEL have it enabled, while Ubuntu has it disabled.

(Please forgive my potential ignorance.)

If I'm guessing right, the point of CONFIG_DEBUG_LIST being enabled
everywhere is probably more about hardening than debugging, and given
that since 6.6 we have a CONFIG_LIST_HARDENED[1], wouldn't it make more
sense to use that instead?

Or is the point here to exactly follow the typical distro config,
without regard to whether it's actually the optimal thing to do?

[1]: https://lore.kernel.org/all/20230811151847.1594958-3-elver@google.com/

--=20
Ivan Shapovalov / intelfx /
