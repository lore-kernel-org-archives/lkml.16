Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C403825B694;
	Tue, 24 Jun 2025 22:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750806001; cv=none; b=st3Y0dwHuQSUq5Z4m9qo5/ed3/7HmntwGq+yxV2Q/bZQu183JcBf52f2WB6QY1Il+47yQnLW7lvSmYjbv3Dhh3crLdQGuDM4XOKgnwzipnxUpRaR64mw74y5kEnOljBJH2p4aRF+ufrn4n726P8YOkhD6R5472+r8uvgku5kUWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750806001; c=relaxed/simple;
	bh=7/US3/hOe3MKrQn5WUvnQUA0/V0tiJPmUQtaPkGQNLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fauXJoSgu8o5AuuT6LFT85IskpUVxc/lH5AO/x7rDOcq71yjh10/36/m3SPWQFp3uEthjREDYElcVbYibrkgRumGDBdYiEmZnV+eO+2GlaBVIOgxOXFiurYyuBUagfkqnh6BcNSZ8PLvmlui20X+K2WEcNKq0TYwAEEwwx3smWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SUUc1Afi; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUUc1Afi"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-40af40aeef6so334763b6e.3;
        Tue, 24 Jun 2025 15:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750805999; x=1751410799; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7/US3/hOe3MKrQn5WUvnQUA0/V0tiJPmUQtaPkGQNLo=;
        b=SUUc1AfidZ46u2dNYADRn5K+J6stWkaYvA5SIWc6tf8Rvh4gYU2PBlzDTGnlbm6+VR
         RDoXigCEvRYybzzO2pS+47yiD4dhdIN9kh5WZH+EZZQkZudKZ5xFnXJ8vGgTxv8yQPSM
         +LlSe5lEtxiJ53c2GFpRx9S2CBuxVTgSwHSJBFx8KSK4S/rJfchx46eAh4nKJNJw/vm2
         kGZ97Z9I1l5cv67r7IsQXJpG2HY/v+qS2CBHT49vISIqx7bRdNnimaNcLDMsh2+ft+7Y
         xCnW7peEVG6gWoxq7OxLvRni+qfT4vsv6zItnFKoy1PTHLjzOPa7XDxN/8R8Nu4TI0ho
         jT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750805999; x=1751410799;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7/US3/hOe3MKrQn5WUvnQUA0/V0tiJPmUQtaPkGQNLo=;
        b=E4zINNtnLS6EusIc7RzNuWLOqImraHfiqG0zNKE7uqqClMmeHSAD+utJBfjt8vGBUo
         LoB7bJJJcbUO08rH8LWIBkyKHl6UvqKPN7azgslYPU67/3lQlteBRZaQ+9XpZHQik0vU
         uvPGXfYkfSnbj1aRl8tWxMeqS/sTVMtDdkvmrYI6jWFLHTFHZWH36gxi0t4pWk4kv7q0
         creZaSCHCFAbKDIYybKX9MsuAa6ADCchTZPaQ3k8sOEOEUbwjvZjmWi/J96L/hOUnC1Z
         41CzgyUugDwH7jq1c7DUxgmtEHfCk9PPnB8ayrEKvCIMqcQkVlCUKLF1n/XB2C68AXBw
         AirA==
X-Forwarded-Encrypted: i=1; AJvYcCUeMa5iYjBX+FY2XkIdhrsBYhaA/pTVodU+0ng1roYUlTY2ugDYKgJPoXJK48JtbFd9B03XbdaRxTY=@vger.kernel.org, AJvYcCV1Zz5JKYGWb0h3ovOCsO6X9Zq4I6XJkfvTNlrV3zOVJbWPjefh+znjp4FMAzgkZITO6I1Zj4TRmGua7USQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywck0ylX9oFNu9CeMpPYW9/fzwYRpbaNNrBgQTY9GCPFPlqycwJ
	hUyHEMsN6eVgvE/R6iId4LXWyNT/Q9SQsKIEZ0QN+wBv/S2o4xyiTaSo
X-Gm-Gg: ASbGnctZaeSizHqcu2VudQIPJvkmYrkWuCo/W08QVSCViF0nrfgGMrYDZJkdcsAIMbg
	s4g9m86EUHad8m6jqMnS4/qeYcFnDscfqwEAuHuzG/87pL7i+tc5CnV5Lcj/+vdxuOQhu9bi/Qx
	yQD1uCgt9uDI+VzczXvhKwcOAitzbw1Ln8abJbDHaWRIQ2yFDYXIV7QrMGnBfr4QpDZqUtBCewN
	vOoEkfATiyyKggBQELUBdfEyXG+Zu+s9NriyNrX9mjkZqR94cII+FSTmr9eHge6GlWXkKfF4gBh
	R3VkpzwPLb+wX97r0GYrngtEsxRaWSRom4TxEGzXDzi4+Tat2eCBOX+08SpmXSTDSRYqDIeB69x
	6tNa5Vz9nAm5DbxT0YKu6p0VOHwTKEI3uMyo3Bt4p0UcVUiLiQA==
X-Google-Smtp-Source: AGHT+IGumR6Thi440aLY1PbspbMuhexp5u8uO14MM/J9kQzS9WC3a5teHUfRMYxPe1CiQ+0oCv0Eag==
X-Received: by 2002:a05:6870:1c6:b0:2d6:109d:2598 with SMTP id 586e51a60fabf-2efb2136ddemr710013fac.5.1750805998586;
        Tue, 24 Jun 2025 15:59:58 -0700 (PDT)
Received: from ?IPV6:2603:8080:7400:36da:f36b:6513:fc98:48c4? ([2603:8080:7400:36da:f36b:6513:fc98:48c4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efaf488114sm186835fac.14.2025.06.24.15.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 15:59:58 -0700 (PDT)
Message-ID: <250eb150-ef18-4e62-9791-f2ec4801cd39@gmail.com>
Date: Tue, 24 Jun 2025 17:59:56 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] Documentation: typography refresh
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Vegard Nossum <vegard.nossum@oracle.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>,
 Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik
 <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stanislav Fomichev <sdf@google.com>, David Vernet <void@manifault.com>,
 Miguel Ojeda <ojeda@kernel.org>, James Seo <james@equiv.tech>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20250619042318.17325-2-bagasdotme@gmail.com>
 <75f99fce-affa-4acc-afeb-2a9f70a6d907@oracle.com>
 <aFjNA1TkBiHXNKPD@archie.me>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <aFjNA1TkBiHXNKPD@archie.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 6/22/25 22:41, Bagas Sanjaya wrote:
> On Sun, Jun 22, 2025 at 10:58:08AM +0200, Vegard Nossum wrote:
>> Hi,
>>
>> Could you share (links to) screenshots of the new look?
> These are in a tracker issue on my fork [1].
>
> Thanks.
>
> [1]: https://github.com/bagasme/linux/issues/1
>

Thanks for the patch and for sharing screenshots, Bagas!

I'll be honest -- I was initially skeptical about the value of changing
fonts. But I do see how the updated typography improves readability and
feels friendlier overall. It follows modern web design trends like
Wikipedia’s; but I do wonder if we’re trading off some of the "personality"
of rough/challenging aura that fits kernel dev. Your new version feels a
bit less hacky/unique. Anyway, font preferences are subjective, e.g., I've
seen people run terminals with white backgrounds!

What I’m more concerned about is that if we merge this, someone else might
want to tweak another part of the UX next week simply because it “looks
better” to them. We've to draw a line on what kind of UX changes we’re open
to. From my side:

Nacked-by: Carlos Bilbao <carlos.bilbao@kernel.org>

Still, I really appreciate the effort you put into this, and I agree that
readability matters, especially for long docs like ours.

Thanks,
Carlos

