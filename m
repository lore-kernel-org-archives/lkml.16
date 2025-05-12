Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19EB1E503C
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747061554; cv=none; b=NMLCrfkniwZvyFnbcPq1sk3dGBQc9qDYtDtAIlq0PKT3qkXX4VEu75jtslZiUfdrFT4WQCH/L8GHKnCD8y1Tr3ipOUyL+eXCO3ZiQyw62yHeLCbhmowtO9d3YuTJQTdYlIrAg3d7pKycaeU4JJ5jVo2woi+tjRBcpOhaZeHkfxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747061554; c=relaxed/simple;
	bh=YxitOD7J5I/UtmC0dH1Zgo6JjFI+JvFFNRDPbpGHmgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GF40JfcZsBT62U5LU3w0X+/FPXdgreSjudU+LM4xNw4JT1Akn3nXPt7vTFWxZPYevE5zu8FSoFZegNsWihp66Ad36TTGR/EiAkdbd8y+K3CRM+j7W8YaQ6f6geN9izEsJQbFOg2MOsrl2vE/XbkpctYBxGYT0df4Ln697kctWa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=C+kdhAh6; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="C+kdhAh6"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5fbee322ddaso8488478a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747061551; x=1747666351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sL36AD5JIr2gOBFJxdoW/HqoISwrQ7JPwgG6VNc1uf0=;
        b=C+kdhAh69DteB2BlK49StjkovVk5QGefpdiIDMppJH8Roh88hmkOLxPnR2DFzMTA49
         px7Zge4kUxF1RoVICBL5j8NHQJAs6CpfCFF3r+fCpcrjp0YdQcZwNbgzLA07AACn8b6G
         FT2bJSDP9JhssTniyiEShJ0+sBG+2wsGV8OwUsnnR8pM3k1GbXXjLs323ZTRvdZJTVpi
         LYMkPqQ+4n/851xe2A47BY/MEZ+wcGNctxvI9pDXiJuYYxKK7yC0Pm5y/esfaeoAshbt
         7VKFudT42eWaQhoI0x32XIDpW41zCvmYDEJfya8i5mu4WD/bqry2FSZQD07rtiAsSMVR
         qyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061551; x=1747666351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sL36AD5JIr2gOBFJxdoW/HqoISwrQ7JPwgG6VNc1uf0=;
        b=mAZXKlRwsPo30F1C+nhRmm42EPgNNu+D5H8rhaqh47hUbKZHIx6v80adhlw3wHsG9B
         9k8Ao5zEOZTu0vUIX/ScTs3ch5V4zchjMRIP4+dEOsmQeGYXoIMQnWnz+5eWE8VzTVz5
         NutkqUinaoBP89cSgUVahiQI+T2bPxCoxJarGliOXdGMpttfyEwLxPjkQoBhyfEMHP9p
         1K808Wt71S8VcHnrWG9P3gjO+Ssh53vRBK+SeNbDj6C7Owh52oapS/QJ2ywccGg44FoZ
         KBgdQj3NcbQazaXnDnBvRqKb2cq+ls23Zr1/zWYOIjJVni7SsZB3hzHfOpj9ZgOtObRo
         Z1xg==
X-Forwarded-Encrypted: i=1; AJvYcCUz7PZrLr4jGp7oL8CN+J0rT6kOjExESxfwW+suNfOO610lfAfOH/jXbj32xknY93yG/G1eO0jAd6hyx2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG3rBpzuhrlcTyC8OxmTl3b6CDQoG7QSvXb4vW8rBaSaiiY8Fy
	fhx2+oOhEpl1+Tg2JKEnhKiJocPtWaGBQ5ELXNsxsEyUHq66GDd7PnaRmE2/ahs=
X-Gm-Gg: ASbGncsz8UcRHg/uFqImvIuJD/OxeVbBGgYN6YuCiMcnC7Va/036cwt9qss/7E2HiyD
	ULdQrbPUSxJaiJRwj7a7d23J2dS7RL6BWZvPP1lhklGznBrNfGtAKnjzS7GNTDn/edt1U668Hqy
	HoBB54OFGj5SPxoyo07Jq96KCfpToVuaZh1fKFgyuUmcde3/2x6QjKMsk2yvpSo/4HS9rkdK2+z
	g0WdwQFxlQchnyMpJQ9sO8ZbLy62dHvI9O13eVewryBFhBx/43UhGiqCFoPTc9yEYAsAaS1NC+d
	xHveUsTgeBJbDuH9/J1e5SgQAvgAQpu3yZBUZSRJ5myCdn0WTl4EGA==
X-Google-Smtp-Source: AGHT+IE/pkPyU+0I7L6tAz+2K5JYCY+Yzm4eb6rt65pfdv4WcrCBgFVGHp5u/6We4LlRpbOxpUQzww==
X-Received: by 2002:a05:6402:510d:b0:5ee:497:89fc with SMTP id 4fb4d7f45d1cf-5fca081ad13mr11822462a12.33.1747061550973;
        Mon, 12 May 2025 07:52:30 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fd0142152bsm3717001a12.19.2025.05.12.07.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 07:52:30 -0700 (PDT)
Message-ID: <66feb171-f528-44e8-990a-ad0c85fa52fd@suse.com>
Date: Mon, 12 May 2025 16:52:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] modpost: Create modalias for builtin modules
To: Alexey Gladkov <legion@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <cover.1745591072.git.legion@kernel.org>
 <20250509164237.2886508-5-legion@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250509164237.2886508-5-legion@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/9/25 18:42, Alexey Gladkov wrote:
> For some modules, modalias is generated using the modpost utility and
> the section is added to the module file.
> 
> When a module is added inside vmlinux, modpost does not generate
> modalias for such modules and the information is lost.
> 
> As a result kmod (which uses modules.builtin.modinfo in userspace)
> cannot determine that modalias is handled by a builtin kernel module.
> 
> $ cat /sys/devices/pci0000:00/0000:00:14.0/modalias
> pci:v00008086d0000A36Dsv00001043sd00008694bc0Csc03i30
> 
> $ modinfo xhci_pci
> name:           xhci_pci
> filename:       (builtin)
> license:        GPL
> file:           drivers/usb/host/xhci-pci
> description:    xHCI PCI Host Controller Driver
> 
> Missing modalias "pci:v*d*sv*sd*bc0Csc03i30*" which will be generated by
> modpost if the module is built separately.
> 
> To fix this it is necessary to generate the same modalias for vmlinux as
> for the individual modules. Fortunately '.vmlinux.export.o' is already
> generated from which '.modinfo' can be extracted in the same way as for
> vmlinux.o.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Alexey Gladkov <legion@kernel.org>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr
