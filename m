Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2130C1E6DCF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 23:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743203311; cv=none; b=FA45/TKJOCNLLMpVk/2DZVJ39z9Xv4vRbwr4hi5Cd8APv702kw6Cgs5NRoxzONJTSaIFqhyduZ6+8o1kVp/8BsdtCLZAhterURAu5XrKYNAn+AB4lhkx5dL0j8kIivtRe1XCM1+HeqbzXPuQ7ekFXT92pmh8OrSOGRboNDoxMfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743203311; c=relaxed/simple;
	bh=6OTSMjwfOD26EolJV2LssxJnD/6mI73Gc34GQ+4e+3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mnla06hnwZflSdgYfHpSUQf4A+H4QRiofBBzaLoh14gQ3A1lEJtQ/wm2l8d5KqqzAx6N4Vmxs9PNH+9kaHBdFHKWqXuLDMDkApzFNXU7sCAQ5cN2dR2naxWRzS+5WwhQqUJ/9AuEuOGBoQXEpt9pmGaErEg6foDQp+NdVPURMk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KHsUxg4Z; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KHsUxg4Z"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3cf880d90bdso10364395ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 16:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743203308; x=1743808108; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FbB4yJ6F+USSpCKga3bcSTeyR/Rd99H8ZrgamvSh+v4=;
        b=KHsUxg4ZPguGpyDbD3wQUhVPkyVIDZfF/SWvmEpG+K3vjRIV5Aupy1z4xHvWbVDvK5
         9nc1M8gmfHEJRxTZitAyGw2d5ce2fTqAm5Z/30nkkcMdXf3nVPM1/m6qKKjAgVypo2ml
         d1pdauMftC7YsSY70A3Tf/mj23l0CSDqcNKI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743203308; x=1743808108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FbB4yJ6F+USSpCKga3bcSTeyR/Rd99H8ZrgamvSh+v4=;
        b=N3IIRC30HbI+X29C6pMPNT+Qd80LXUQPcqsFuInmFddswlfV0UMHe48q5I+goQHFam
         cVDCtpubYk+3YZquTU1THqs967cND1YqJ24x4KWutCksc35q9pM8L5TM/0CAkJhSISYF
         /VubaIzqOBZUGrVFCihKSIgLJ22gGCoWXCw6nh7W4iMIU/FEgBjYkgwBLrEZPvFCVjlT
         IfckXK99SzBqcMUoikmSPBpa7E4+lWkLHHryYHZqAYxL0100rKuZ9dN2/cUNB5mmN307
         pdS6Ln5O9SdufrMjDlCeW1piZJq8w4p0qFXlNiaVOy53EYHmY+GcuF23bu2Say9I16+c
         WC0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+bQRiay/85cYW0yjUgIxFomyo43IkfUFN7CbydMPzdTunDPjC5EjLuczUPc5/kozJDpBZzlKzuatH/PE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkozbTmbbKchwMWod/9wLK8KuYELPzwlFdOBlXFYtsqdz9A0+/
	AcWCrootiHCE8DGt4ov1jt4u+XMIN7Hr9NpLxkxLGojZHQWjP02+QiBvB9Bl+WY=
X-Gm-Gg: ASbGncuR0zHw8dWJWKXYTawkvXCHGBwBeYJ4Nem0V7NWCkj2tUP9O5gY583Bk/Dtdfw
	hnKKUtBPrBbLmGV7CCW3LrVwAGs1EWZEjxXTgXvjDg6PlxEvdqv7rcD94OdDifBKt3Mn2UH+KVv
	rVwvJhiMRoxpZQQAfDOXTLkOLAV351nCVNNipkTChFOT1Nexe0KVS8Bm3ghLH/HfeWNbC6/oRas
	5mzzjupBvxoWF0A3RLfWJTMu7ZqEOXot3Idm98u0ND3mDuN8jex/wZoF1BzClIIGe0y1v8nCv3E
	9y+VPZQji2AdOL1QtjreSAtqYdRIlw9ayxn1IWUV1EwfKwWNqvWPE+I=
X-Google-Smtp-Source: AGHT+IFUySP8TeYFdXm2DTXfPzjGy2dg3a2uSfxvpKOITK7L3F3BtfTwZ8RalSAqFZ31DjT7hhwcbw==
X-Received: by 2002:a05:6e02:2493:b0:3d3:fbf9:194b with SMTP id e9e14a558f8ab-3d5e07e230amr16274035ab.0.1743203308013;
        Fri, 28 Mar 2025 16:08:28 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5ae2636sm7123385ab.46.2025.03.28.16.08.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 16:08:27 -0700 (PDT)
Message-ID: <75ea2dcf-0ba3-4076-9a54-6b39e4e72a3d@linuxfoundation.org>
Date: Fri, 28 Mar 2025 17:08:26 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/16] selftests: vDSO: parse_vdso: Use UAPI headers
 instead of libc headers
To: Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah Khan
 <shuah@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>, Eric Biederman <ebiederm@xmission.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andy Lutomirski <luto@kernel.org>, Willy Tarreau <w@1wt.eu>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 llvm@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20250226-parse_vdso-nolibc-v2-0-28e14e031ed8@linutronix.de>
 <20250226-parse_vdso-nolibc-v2-12-28e14e031ed8@linutronix.de>
 <af553c62-ca2f-4956-932c-dd6e3a126f58@sirena.org.uk>
 <c7bea938-ee3b-477e-9ed0-db29ca02a538@sirena.org.uk>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <c7bea938-ee3b-477e-9ed0-db29ca02a538@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/26/25 07:02, Mark Brown wrote:
> On Thu, Mar 20, 2025 at 01:23:47PM +0000, Mark Brown wrote:
>> On Wed, Feb 26, 2025 at 12:44:51PM +0100, Thomas Weißschuh wrote:
>>> To allow the usage of parse_vdso.c together with a limited libc like
>>> nolibc, use the kernels own elf.h and auxvec.h headers.
> 
>> The vDSO selftests currently fail build for at least arm64 in -next:
> 
> ...
> 
>> a bisect points at this patch, it looks like that's due to the switch to
>> use TOOLS_INCLUDES but I didn't dig into the specifics.
> 
> This bug is now in mainline.  A fix was posted by Thomas the day after
> the original report:
> 
>     https://lore.kernel.org/r/20250321-uapi-consistency-v1-1-439070118dc0@linutronix.de
> 
> but it has apparently slipped through the cracks.

If this is going through tip

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

Otherwise, I can send this up

thanks,
-- Shuah


