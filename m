Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31441C2335;
	Fri,  6 Jun 2025 07:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749193429; cv=none; b=N+6NeEGxavKO/U23+94ggicYfeZeUWhk5lNzItddwiKZ1Hp60P8L7SZuit+fpF+IRAEmr6FzHwwjiIb7XuwhGUP60ieIryGt2s5UBmFoFSV5h9993eGhLdu9GrO0JYHCxa1Ldx6rcICCGNf1pta+sreJR7ctn2g2nW9w/469pUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749193429; c=relaxed/simple;
	bh=+t8nyFXhbkZnOjq8PogUNmGpTnMslub0IohHtzrxenk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PAOtx2zIo5lAggSdXKOwQ9KO5OQs5ETbFeZheMfon/0S5Ph4OFqZSu+eCJ4JoooUOxeB256JwhhxpLqap7etne4Q8eidEsJX4wCSoZGCYyGwtr+6Pfkv6GLz97Enq9xcMKojxcMDtxBamFkp/dRPXUMpR2Zz9dSVjusQ32mgJSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJlXrhv9; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJlXrhv9"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-60eefb805a4so349291eaf.2;
        Fri, 06 Jun 2025 00:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749193427; x=1749798227; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+t8nyFXhbkZnOjq8PogUNmGpTnMslub0IohHtzrxenk=;
        b=IJlXrhv9Fpr3igE57295siSmwtLzorv6/SmuOxtWpCRsOcVtRok89/nq9QvFfWTF7l
         PVgZxuKULnkM07I/2J+K5s8ZJK+LKlWicB8kQcoEHpf7M7nomI9qUjFLOR1MOmyfnf3p
         e/nUs83st/DAS8WxqNp4JG0rDbNWyZhddazFR7l5KG/rATrGUVIub5p0ZNZQ6rhqT4x/
         aXbPTfTmcf9OfWi/zC6QQ6XqcB+v8lSjUbX/FVap/KfZcX3uhjEipIyNq7YcukofGqx1
         7wnAW0hjDNegfWFXZmwcmza/gf7fKHONMzgLnCHWBJEOk6gUfHGd3tM46MA5jeRQnhcQ
         WbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749193427; x=1749798227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+t8nyFXhbkZnOjq8PogUNmGpTnMslub0IohHtzrxenk=;
        b=u2OUcrX2+Cge592xkauEMBPZikxbGN9FcQjFWnZXcfwVsu6X6bu6mXcDjJSODyB6/N
         8V4rF4w2iZEziUHKlFESIgy2zx07yb+AvaXrvvRVVXJ2KWIr7s8hCqyxcfoHT3YwdfVs
         kv2jFe4oLtJUh52oUm5p1F+MoemlIAfzdyyEVGfe8ts2Lr6cLvIO8L/9zr2MXF7ExHJf
         BkzjQ+4mjl88jLwlOmbfNgICeSy2sk0igBctgQohszV5dzbYGNoWEPQRXSHsfWuJrhuX
         dGaYdLtiqs4oE3hgVT+jtPk5xJvgNKYIIdZEX/HMbROQo/hVCbow7D91hUoL53r8F8z6
         mqyg==
X-Forwarded-Encrypted: i=1; AJvYcCWqBhBlmfijdcT3Q1v/itVpR+i54G2MrVyJwKIUwR8z74mdsF++5IIbVARBJNa499qi+dz1X+uZPRd9sA==@vger.kernel.org, AJvYcCXzoDzgG9d3S593AWbdRi13yw8aCpu9Sk8oZQ7TcY8OVCEotF0pnhqnlAgBAiyeUbBHX0QRcDdN/D5e6yiu@vger.kernel.org
X-Gm-Message-State: AOJu0YxgQt7IZvoTC+YUdYScQmfAB47YadAmIBBSAtsfExDRpRAGibyX
	pQY+GbscxWxq3PltJkQetZAuZiAjbeXfG6R9baoB4P/guu7Q0TB41wroAVe6NuhwG5z/bsFuHNY
	ZDwovrT47HyXvkFAiILymc6Za5bgwEKc=
X-Gm-Gg: ASbGnctN9G0xByrcvuSj6o8VDVkWwry2gx1FwvcOrHHD0n2q8nuKfKz8JI9tadLtS3E
	2GRlhouYSP2BHnIawhMkwBKSo9G9GI7rzzV2YpAeD0ab7bxZmQO18Kz1T32+A8TwNmGDTP1oLOZ
	kxR7KKtXW4JnPRmRqa2gKLH3cL0CbG8gl+7EJ6nx2aPg==
X-Google-Smtp-Source: AGHT+IGlLabyThzSeqYMlNHv20wA1II+mVIoLCdAPVSiaLGXvMH7P7mfv8u9CX+Vb8T93FWYRw3sqml41XcsV4pgZoQ=
X-Received: by 2002:a05:6820:8c1:b0:60e:d9a3:dc32 with SMTP id
 006d021491bc7-60f3cef153cmr1136958eaf.4.1749193426701; Fri, 06 Jun 2025
 00:03:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com>
 <3f5feb87-330c-4342-88a1-d5076538a86d@roeck-us.net> <3401727c-ad93-42df-8130-413eda41ab3a@roeck-us.net>
In-Reply-To: <3401727c-ad93-42df-8130-413eda41ab3a@roeck-us.net>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Fri, 6 Jun 2025 15:03:34 +0800
X-Gm-Features: AX0GCFvMmpIHumCzGzvB3zmLEKid9CPhshqnMkw_DscjH3mld0W5o7UCfRZe7mA
Message-ID: <CALbr=LYe3p9GW2Z_RUxKG+w2Q1wfWGRW=dRLoTraS7qJ7imdgw@mail.gmail.com>
Subject: Re: [BUG] hwmon: Widespread TOCTOU vulnerabilities in the hwmon subsystem
To: Guenter Roeck <linux@roeck-us.net>
Cc: vt8231@hiddenengine.co.uk, steve.glendinning@shawell.net, 
	jdelvare@suse.com, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com
Content-Type: text/plain; charset="UTF-8"

> On Thu, Jun 05, 2025 at 07:33:24AM -0700, Guenter Roeck wrote:
> > >
> > > I would like to discuss these issues further and collaborate on the
> > > best way to address them comprehensively.
> > >
> >
> > I'd suggest to start submitting patches, with the goal of minimizing
> > the scope of changes. Sometimes that may mean expanding the scope of
> > locks, sometimes it may mean converting macros to functions. When
> > converting to functions, it doesn't have to be inline functions: I'd
> > leave that up to the compiler to decide. None of that code is performance
> > critical.
> >
> Actualy, that makes me wonder if it would make sense to introduce
> subsystem-level locking. We could introduce a lock in struct
> hwmon_device_attribute and lock it whenever a show or store function
> executes in drivers/hwmon/hwmon.c. That would only help for drivers
> using the _with_info API, but it would simplify driver code a lot.
> Any thoughts on that ?

Hi Guenter,

Thanks for your quick and insightful feedback!

I agree with your suggestion. Adding a note to
Documentation/hwmon/submitting-patches.rst about avoiding calculations
in macros is also a great idea to prevent this class of bugs in the
future.

Regarding your thoughts on subsystem-level locking, it sounds like a
promising approach to simplify the drivers using the _with_info API.
As you mentioned, some drivers don't use this API, so they would still
require manual fixes.

For the subsystem-level lock itself, I was wondering if a read-write
semaphore might be more appropriate than a standard mutex. This would
prevent a single show operation from blocking other concurrent reads.
I'm not entirely sure about all the implications, but it might be
worth considering to maintain read performance.

Thanks again for your guidance.

Best regards,
Gui-Dong Han
