Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13CC1553A3;
	Sun,  6 Jul 2025 16:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751818485; cv=none; b=QdqlLxXJmmLr3NL9zEKRNzVSKc2c5lawPVlXkqTwc5KWOf1bCrSZBvjQmQ6ymsbmObaW4PJQbsfHWGN+FvOxWt/UfK/hLCKfyeS7jitNgPa7pFqaiutGMQvt+wR3WEP6MBZ7QSJ3CRSy/FrVe4NUCPfxWgBFQjwS15Skln1Rf7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751818485; c=relaxed/simple;
	bh=laTGGfAaAvImciOaO7fNMFckl7ixOBbXVKugeiv59kY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mgtc+ci4M+GnhUFe4wT5KbLRKK0CZhYHfdhXxGB242XJ0ZlQs6P0XKpy6Sd2S4YVka5aqF3f3srntkY/znXE4NiiE2hZmVSLPVl3azQdPocBgx38ARRCTKtsKOg16hGikXnZXjie1l8/mtI1AcBvWsJsHpHN2GnYVPNDGcov2lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UhaJLCd1; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UhaJLCd1"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-73a44512c8aso628972a34.0;
        Sun, 06 Jul 2025 09:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751818483; x=1752423283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tow9CQhi9sUBVbyo0yxEMa0Gy/ddOaj9tdySQPgAbL8=;
        b=UhaJLCd1mGnJRFu6WLWC9shvzpCWxG5mJBC4MAo96ZtkDYxZpJlauv4zokkUlQ8PHP
         1mMhPgmtOSMfwrG0PkBr82hsthLU21YeDlaC24WjAE0+JNHFh5AqzVj9z12ufqCCNmj5
         n8BsOnbLkyToy6zZ6dH27KY1ut4g9s35j+SPBxvApgrKDf9Uvv/0LGW4CHWiKfZjcRWs
         iyedkMOxk4OEtpL2oyPhWJ0cxbRmqT9OKdxDdMM0r0X+M+cIGHW4jJGIYoWICccn1EzE
         mM1uQw45bpvPg0zQN3qn7EbKCXvJdTqqYvkkWHQOjfd3BL0J7xSXSNp7E6TPvsSOW4F9
         ygUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751818483; x=1752423283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tow9CQhi9sUBVbyo0yxEMa0Gy/ddOaj9tdySQPgAbL8=;
        b=ZaarpQ72s0stGlpSslbV4VHzpHICAidXz1cm++nNV4BoM19hZ9myRm3pDZd8HXpdXB
         wC+ST/ZZMuco/XqVHyHUN0FeQlb7QLPefAA/uLoFlc5Tgfjj8okSm+o8NWcXZoeXiwQF
         cIgjl/XX9b88tsupp1eVpVOHlsDgN4BBEV2yO1kwz6ERJ7TxqFhj9GhZMffCweMw+xcg
         Fbl6zBeORBMkGOV9xdmb/Saqw1fyoYDj248O+WpnT5PDUv/2rdBssErpKBcTSvfc4F1D
         vHIjcnREuGy9g8+AbpAb4CAeBkFw4obq4QKoJZJo5UXR7AVSN4ebR97yJ/vaPodMI0r1
         rMwA==
X-Forwarded-Encrypted: i=1; AJvYcCUgTidf+uAoazVu9bhJeZnovz6jKQzebiRSHhxRPfF5spiP9n5S/XRbSZK0XreS+RAMAgdjWkZZFzW9XWBG@vger.kernel.org, AJvYcCV5hsyeLdqC+QgyMFlRto8yL3hkfYiCwF1+9R1rxvs/33/5bfAd/o0Atnjh5FOzRNFMD0BgLt3cUhg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmW24CkOzI74EXq0z1zzKystrXj+8Xk1WN3VXzvkXwXSf5jc20
	74nfu2pwH5yhSzwYpB+0BOkiluXu2FaKt4ZsB53If04i7Zs8MeEBxIZI
X-Gm-Gg: ASbGncs80cujHIcbOf69O3LmphwcXcIK99lNJbVWNSGrixvBdx8I+9haSDA0STIqaSa
	vz0izntSLes895utt57TyoG1RYhYfr4/R1yef8G8LKWtZsVJT96q1egm2t+SXznEasdRvETXSxN
	ow6GDdm0EYf/qe9r3McQ7s+nqTdiLGAu76ixpjWL561cVt/a/+9J6mJyT+AB/ofl51jYZKFrP9j
	9cLTM/GrsCVEgIYqhOexvzrhwKl4L9CsMY5p1pHIXnB3YoQLIqESbXnnrya5I2VE9CjONZ2/3yz
	8IU64g5+OpnlVhdJkUd5oAZNm8wQJIgcN//snt96Aphj2fAIiibJ/lOral3YpDd+WQD5SspBUg/
	CQV7tW2sqIRVd37FI5XTON3becAV8ORoW8gh2CDzGas78iaCCa420qTs3Lthh
X-Google-Smtp-Source: AGHT+IGa60gYFXb3W9RG+HjHAcoPPiV4LZvBTo8M0JPJ2v+kXJVQ0Fk5avb5r6vRBD4KySYrywK88A==
X-Received: by 2002:a05:6830:800a:b0:73c:c4c0:7f46 with SMTP id 46e09a7af769-73cc4c082f1mr806157a34.21.1751818482919;
        Sun, 06 Jul 2025 09:14:42 -0700 (PDT)
Received: from ?IPV6:2603:8080:7400:36da:b492:b6dc:5573:e1d2? ([2603:8080:7400:36da:b492:b6dc:5573:e1d2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73c9f753ee3sm1233539a34.24.2025.07.06.09.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 09:14:42 -0700 (PDT)
Message-ID: <6eb6a85b-8991-4874-abc1-6c247b2c8050@gmail.com>
Date: Sun, 6 Jul 2025 11:14:39 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] Documentation: typography refresh
To: Jonathan Corbet <corbet@lwn.net>, Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Vegard Nossum <vegard.nossum@oracle.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
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
 <aFjNA1TkBiHXNKPD@archie.me> <250eb150-ef18-4e62-9791-f2ec4801cd39@gmail.com>
 <fb2d7547-dd6e-4f6a-978f-b92ae2eb20cb@gmail.com>
 <CAOc0haLSQVO9RexsMDRJ9zx=TPOi5yC6ADX4VLSbFvi1bhP_iw@mail.gmail.com>
 <87ikk8kf61.fsf@trenco.lwn.net>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <87ikk8kf61.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 7/3/25 18:50, Jonathan Corbet wrote:
> Carlos Bilbao <carlos.bilbao.osdev@gmail.com> writes:
>
>> Some, we can talk about it, I’d personally like to see a small flag
>> displayed to the left of the language options at the top button.
> If I understand you correctly, that's dangerous territory...flags and
> languages are fraught with all kinds of disagreement and discord.  The
> conventional wisdom is to avoid the use of flags to represent
> languages.


Fair, thanks!


>
> Thanks,
>
> jon


Carlos

