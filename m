Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FDE1487F6
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 21:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748984452; cv=none; b=aFIqrQnjqbmuLBr6sBAA8t5s9s9sPXJB+nVyQ7WDkdI0qJab5K2v/FgRturvYfqAk4RQY+ohPHtxDcd5wx2Pyz2KD1hOyURXEcBsKgVrpDTUJ0tQaZsY6OHlBqXda5Lb+f9wzwPz9aZgTGtHLnWddcXfjK8s963Xd+zOzTp9xHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748984452; c=relaxed/simple;
	bh=UkVpdqJHMPRKWwzgkIoCA2s+FvvyPiw9dxao/ZWsUgM=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YRn5JVhFfxSKLH2M5pBvtYEkj8XOShoXSsOlGwpMYgno60XVZRgTMf7PNgFZkTvXxZV6hO9asY8Xz40CB9ZfaaVI16i3ryha1mNZ0GZ/54bsa4rJdZfwyjnokSP5a9IUfb92GXtOL9NZlvXkBtHQXTY4/XbEJM5L+eLAS/zofwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info; spf=pass smtp.mailfrom=jacekk.info; dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b=gr1fRDzQ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacekk.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b="gr1fRDzQ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad572ba1347so889457366b.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 14:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk.info; s=g2024; t=1748984448; x=1749589248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+PKgRqE/agxHfUSUWE1ZX+G/aaQhrQ+OflgKrEMgMlM=;
        b=gr1fRDzQD4csOlBG01ID5UNTv7/+iCWDoPaebrtnO7NYNsL+e68Qtl8PpKd0y1KGrx
         AcfL3DdrjFRhb2LCFVuSBCfb7sZxtDxgEGPt1O5vIOl2ckJU7epXDWOnQ3OvUmkT+D1D
         U7XqGGphwvZxsHIl6DyBdMnfs8ScanOH2p+3Ic8numiVxBRqlRD4gpNAge/cji8FfbQR
         8htza4u2Mhpw1yW7fh+8nwSlNlqT0j8mCL9c1e215m7rl2ZHYjbHaoKljMxqO0vfqi85
         gzBj8pGpSRjtVVnj/br8gbL2GvKwGlT7g090SXSQoiHkRQk/TDPKPeayxtO9YYJhpjIB
         g6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748984448; x=1749589248;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+PKgRqE/agxHfUSUWE1ZX+G/aaQhrQ+OflgKrEMgMlM=;
        b=df01yIifg64bJGD/eS5t1ysQ86SOFJVfA3D1oTVw/Jjyfhq/pGLh2PFFOXPwnTdeEb
         6yT9iR8t4N99yJBXnrjXPPEIxDdvLdz9qFsnimzRqW+tnpzn3KIy0YZPXmoSgmifQMDp
         PM4NAkwwtZxy/olxATJ+qYxKDFxEUbgnyqur5223hF//CtI1IHOTBYnGiw6VwQK+SJz/
         Qd+w7pZh6JUjK9WX8bvE5bC4kJ+vUQp2IULp0JBmbHU5okaCExnEPkWvK9ofMZwbzUJm
         wEQfoisIGTn+HrZpuOQ2eM/0olzeBcaSgMhJHfkHgs8nZHXrNQAAIlg24PiqT+Ailxfs
         bvUA==
X-Forwarded-Encrypted: i=1; AJvYcCVBgjipcs5OZRAV8FlwkIW1EfiGET2T8sJdpklF7YfUaSnQ+ODNy3LIUCuaSO/lvSMX/a057aU6wgLvJXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvXeTuvNXMwFNQLNGRXSrXeiWI9Ocexz+IpnYS1a3YfuMHEd2v
	PPBqIOl9JERJATTFgrNhDb5+SHrcSUSp0kDr+4iqtRP3nB5s3jAZYf2u5GT8gfDSRg==
X-Gm-Gg: ASbGnctlcbaU3ylMeT02NGrFpVmGyR5kzeyN74jZ9/+haH0u04Qu+rcVUCnaJUQzbz0
	XYAWA43+BymNWVaK/ZnsprwumBYU41NQ1y9nU7wT6mqAEPQkdJBaaI28NGwxsvgO2AiirgJNqF5
	eRmklobe7kc7L0HMOPQ/jowOJ06RCXCi6gIm1KcZKTfqhKwcw8tyBGYaiXXBxdHMBXg0BqT35cH
	xx28KUSZTIaWlLPanpnRFBvD6qJGjKHDiUALwAhzTgjfwlBpEY/h45sRSq+gySvW76kUwy9KRIB
	WjhmIOE56QH81so/khuIZsgBDEQbU4oRSAdiwpf+W3/pm8rlaw==
X-Google-Smtp-Source: AGHT+IFE/zq55kKCpFNUP8s47xQ1VlVxdxq1nZI5gpd41ZgPDjMuxiJo036Y0yIPNM78hWufsGJ+cQ==
X-Received: by 2002:a17:907:6d0f:b0:acb:b900:2bca with SMTP id a640c23a62f3a-addf8a92b51mr10123066b.0.1748984448317;
        Tue, 03 Jun 2025 14:00:48 -0700 (PDT)
Received: from [10.2.1.100] ([194.53.194.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad3d7ebsm1002032566b.159.2025.06.03.14.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 14:00:47 -0700 (PDT)
From: Jacek Kowalski <jacek@jacekk.info>
X-Google-Original-From: Jacek Kowalski <Jacek@jacekk.info>
Message-ID: <c0ece81e-6fee-41bb-96c9-eef36b09af37@jacekk.info>
Date: Tue, 3 Jun 2025 23:00:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-wired-lan] [PATCH] e1000e: disregard NVM checksum on tgp
 when valid checksum mask is not set
To: "Lifshits, Vitaly" <vitaly.lifshits@intel.com>, Vlad URSU <vlad@ursu.me>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <5555d3bd-44f6-45c1-9413-c29fe28e79eb@jacekk.info>
 <23bb365c-9d96-487f-84cc-2ca1235a97bb@ursu.me>
 <03216908-6675-4487-a7e1-4a42d169c401@intel.com>
 <47b2fe98-da85-4cef-9668-51c36ac66ce5@ursu.me>
 <8adbc5a0-782d-4a07-93d7-c64ae0e3d805@intel.com>
 <20f39efe-ba5b-44b2-bfe6-b4ca17d6b0c1@ursu.me>
 <1e92a26e-1fb9-44bb-86df-8007cf9ee711@intel.com>
Content-Language: en-US
In-Reply-To: <1e92a26e-1fb9-44bb-86df-8007cf9ee711@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>> If no update is available, perhaps we can consider ignoring the 
>>> checksum on TGP systems if one of the following conditions is met:
>>> 1. SW compatibility bit is not set (current Jacek's approach)
>>> 2. The checksum word at offset 0x3F retains its factory default value 
>>> of 0xFFFF.
>>
>> I am already on the latest firmware. I have also tried downgrading to 
>> earlier versions and they have the same problem.
> 
> Ok, so in this case I think that we should go with option 2.
> 
> Jacek - can you please add this check to your patch?

Yes, I'll prepare v2 by the end of this week.

-- 
Best regards,
   Jacek Kowalski
