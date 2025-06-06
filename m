Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4EB323D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 19:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749239949; cv=none; b=tcuk1KWHn85WAjQo9PizbdU79U5bSBkRsx6eo7oqzBywxYqkK9w0Hyyp9SFT2zRU5PFfNraevz6Q6dUx1uhbNR/1oZHeiwHDrx8fVwXHypmkFQiEQjiO11m0x3t9veuxEpDxNLdcjeDxUuiD7wy95RDvc0fqsbRdos+INN/O/oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749239949; c=relaxed/simple;
	bh=SdvZDvnjYLWzJUWJ438rov/PLt522izsObi6Xc7FM9c=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=nhhW7keyIPrZT6qBrAKOvAFrVyO5fAq28hogjtFC6zFW8DSe5uSDRKW0u5F8aAJEXwg/CH5fkDzIa46ITnqOTQSt3Ot+P8pUYS4UogX3japqlPbyMFHE5US8P6oB1eYjcPLhOEHvykDhIhJtAns0Vf5xZhZjq3Iol3vc1IHRSwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLFOGh4x; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLFOGh4x"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so19305695e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 12:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749239945; x=1749844745; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SdvZDvnjYLWzJUWJ438rov/PLt522izsObi6Xc7FM9c=;
        b=nLFOGh4xpz1e1DVoAsUrQLbvxRq5vv/Ziec8oBOByxfpTbXfhAax1A2AZSA7dtt024
         4YQJm9PwNcvrF8oa7s+nDDVnYYj7c9qjH4+fl+JI5CgFz2Gy4aLL9/9yQt5mHTnNYklR
         oFwTOb07LLOngX9HFwLyFW4DzPzvm6Gw1e0FTAaIEt4PPHKwBsDjFRy+5y+BQPZEMcx9
         sYtnTNugmDk8SI6N9FQWY8ftO/l6sBA3Vx1sb3slkmVZm/7dNg1UIE5Be1aek0ZXSSMc
         YOgQy7SvTrZp8KzJDcgnPiEVGUE0FLhjVlwxKpT3IVIvBXJVGyRUoweqhmcISOANf7fJ
         wBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749239945; x=1749844745;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SdvZDvnjYLWzJUWJ438rov/PLt522izsObi6Xc7FM9c=;
        b=mJrViLRdbDQrl1sJNtHLVcDQ6N4gHJQ2+OQfOFbc2As9/csTbe0JuCRgDzoE91C1TB
         rrC/jcwTTtzaSgNVjUM6YqGZpRk5Iz3nT4V8Ivdq8DKgALSTxIJKGIva7tSRU/NBcYiP
         kKlQewE6xwlPYaiH5/j25RYpqCDDpVu6p8z36gIEUd1NSauPKV76eSbm92IVH7skYR7P
         Qtlrh7TttZ8e00DTpmr32XiI4MFfjEEwy11RKMTT28SmU1zUW6iuYFCfAb120xMVDbz6
         RnO+3LKyLhofb0+q7xwGtruC95+tUfu3FwJjNRf/2rfxINSg1TtH8mv+JkSpzm4K8p26
         TE6w==
X-Gm-Message-State: AOJu0Ywh4J3jaUE/9XCDINSS94zMa9TuPzy6+xsq69qBTTywBfuj0QHO
	m07X5krh0x5af85LGc2+Jp9cDsIz9FyiBGleMdYVV0SX4gyPiSxdQeVf
X-Gm-Gg: ASbGncuV+PY5aXmd02sVkMLPKmFfgePuNMN6zLdjW8USLTZyyh/6FPvYfIV7Ou37dH3
	mzuIbl39kA//p2pyMomVfksMwTu53uJ17PaDwwqS+wQ7nB4KPM9u7+qhFYH7fpzZ2WM1ihWOOa3
	htPr6/hCzQeBbcKzWQSXlQfIWTljnkxAOx4kxcMDM0z4todzAyjA5eVSN35tyUBMzG4CzpPcxls
	zIAZnVfV7Rp7RO1UjG4eaIRBG+kJ2QDhpb8lN53mycHr9f9hx7GXpCAumPX0xFMxirST3PytzMj
	XHE0vcTdbSrpgHUCWxN3ChwYrqtFAYvF/4JyAha7V6DvQx/FrhhWkokn9XeZakCusw==
X-Google-Smtp-Source: AGHT+IFctWpLLDZPu7WnOKQ7pi+H0ICZkrWxRtTuLiHch4LOJT5YR7T8y68hpRDawg25UX5nAYZf3A==
X-Received: by 2002:a05:600c:8b43:b0:43d:fa59:af97 with SMTP id 5b1f17b1804b1-45201427c5amr44870465e9.32.1749239944871;
        Fri, 06 Jun 2025 12:59:04 -0700 (PDT)
Received: from smtpclient.apple ([5.29.20.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244d10asm2780741f8f.67.2025.06.06.12.59.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Jun 2025 12:59:04 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [RFC PATCH v3 5/7] x86/mm: Introduce Remote Action Request
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <842d430e0df97933914c8f743e7ee226eccb3d3a.camel@surriel.com>
Date: Fri, 6 Jun 2025 22:58:52 +0300
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kernel-team@meta.com,
 Dave Hansen <dave.hansen@linux.intel.com>,
 luto@kernel.org,
 peterz@infradead.org,
 Borislav Petkov <bp@alien8.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Yu-cheng Yu <yu-cheng.yu@intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B951662D-F565-4A48-B909-76BAB5D04A9A@gmail.com>
References: <20250605163544.3852565-1-riel@surriel.com>
 <20250605163544.3852565-6-riel@surriel.com>
 <9290E368-A0E1-4429-B14C-9AEF8DC71672@gmail.com>
 <2666b165d262a3bad73a3a4d886fa6d16bced03c.camel@surriel.com>
 <51570690-D1B2-48EE-96EE-5C90B93C7067@gmail.com>
 <842d430e0df97933914c8f743e7ee226eccb3d3a.camel@surriel.com>
To: Rik van Riel <riel@surriel.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)


> On 6 Jun 2025, at 3:03, Rik van Riel <riel@surriel.com> wrote:
>=20
> On Fri, 2025-06-06 at 01:45 +0300, Nadav Amit wrote:
>=20
>>=20
>> So you may want to do some initial checks on the BSP as for
>> whether RAR is supported and what rar_max_payloads is (e.g., in
>> bsp_init_intel() ). And then on each AP, in something like=20
>> init_intel() you=E2=80=99d call setup_clear_cpu_cap() to disable RAR =
if any
>> CPU's max_payloads is different than the BSP.
>=20
> Grabbing the value of rar_max_payloads from early_init_intel()
> might make sense, since it is supposed to be a system-wide
> value, and not a per CPU thing.
>=20
> That seems like it would solve data race issues?
>=20

early_init_intel() is called from init_intel() so it
would be called both for the BSP and the APs; IOW, it won=E2=80=99t =
solve
the race.

Looking again at the code, I think that you should be able to assume
this data is the same on all cores and move the X86_FEATURE_RAR enabling
and rar_max_payloads setting into intel_detect_tlb() which appears
both to be the most logical place to put it and only runs on the BSP.

