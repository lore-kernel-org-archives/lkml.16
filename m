Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8D51A4F3C
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 08:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746866780; cv=none; b=QQKNu8op7RP9k0bn3se29r161jB0J187S1C60AYMDmjV7caVdU8o90uXhDPpxMwp+UDMsh0b9nVJ3fJbcV2RCFgd7LoZhszTdk/I7yZbAL2/zgphy9hyZzsGBhndB9U32DFiKa7yvDDnQ4MH2k/RGC5IrbX6tGPcaNp4ikF5z04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746866780; c=relaxed/simple;
	bh=o1pRI5vghrc9QBHHiwbOKz3WHumfxVOKzsoipEvVuQc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=n100eqr6c/jkP96XcJsa/ba0vR62WzMOul2Nk1XfqDBZEahEs0VF5Fg7DXj0l8rRU2fC+wEks/hO/mRX7WW1Zj+6tKiuQNynHFgmuAENTeiwTWMUXJ45OiXjoWvMT6g+d2WjiMk49HpBEcbvhOObhdUBvBToLHthhHsXCXcX8GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OgJFOXIs; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OgJFOXIs"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso17107565e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 01:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746866777; x=1747471577; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1pRI5vghrc9QBHHiwbOKz3WHumfxVOKzsoipEvVuQc=;
        b=OgJFOXIssdhI4fn1Fcw4dIU7l2Wu03Icf7miQt6d2bW1ws35PNb7Ttx3TkQr4ctFc4
         QRcnayNsdqDsaNL1B6sDU9RNU4MQiC0iZxG0v4Jr1Rz/JvCMEtoeTaDJtnea+hjVbT/f
         MKWE3oUroz+u3hxOX02k0tqeKi9ypMOcDih1OhBT/Jdm/J8v3lfNR4OJO9JqpR9n1opA
         RTgDfnxiWznDtHjAPyQ//2MMDhYX5Rm7QbGhWpPXrY8j9rgFLiGrb6I4phjOSJh2qiB1
         OHodYPfH3nsg0rSVf6s5rdPrGK4OLLQa+AYlpsau7jcpgttJxmu1DeCzcsR4rGuhYp0n
         RBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746866777; x=1747471577;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o1pRI5vghrc9QBHHiwbOKz3WHumfxVOKzsoipEvVuQc=;
        b=JstmhPjfeNukcSWhDr7LXt+V4vDhEnhqWVzM+Ec7l4IS5fB3OTRLJxmDDtQfFJeIq3
         MhN504skru4C1F0bgcsJqWmqq8OJmpkc1/jyH3wW9MC9Aq/gXL57r7qGgsFsZft7pixT
         7ZiZ2O/U9jejn0XhgqLuY0stZENf/Nu8DPXdfkycjtOlQ6lOhOUgvZZWciulg0TxZjbj
         lNynvPACImjO961CqtOau41YsFepMLjpDJNw451lsnzhsqPiUOt4dPF19O7SfMveKemV
         1TfS156kXKX9bY+l92lPG4oTCg407mf81sqmSS5+wzrmt3I5ntYexN/eCfG7WMm11YLG
         ruKA==
X-Gm-Message-State: AOJu0Yx8ZTcfyPaRfCcO9yadncAi/PMo2azxWcOY8pjMSElQdxSu8VSi
	Nsl63VrZNhtbYlq2VCKZTANgDQHbCkWUoNkyS7kcWdW/vlSTr1NpjLZ1AA==
X-Gm-Gg: ASbGncuiaZwRrp2JJd5dhAsUfgAs9ff2BmCD9soNwAuy16payZ+JLLiK6LOVYSz33Ql
	W1Ghxv9tGry7wiE97Hs4GJumVUI9VP9gTsRsCmyVRApke7T7mvdR2/jlFeHwmSmOnBFkRG1TEgA
	oh4CUcmmHPZ0END8TQ4t/4G7ymaU/fB25gXpk3B+1CE/TRuOyMWCSrIWCOYjLBGY4sfozfHEJxa
	JAJ9q0Oyjgc7aJiHamhSZ78n8/7derWj3IpX9Yl12trh+coOXTSoCUewehko10wY+I7nr/Noi77
	glVemjLF2y6SogycZ/+EJB0cgv+GxfTDs9I3z5kgZfymh81sw4taWJu2VZOtIvgT2DWMRLLK+5k
	0euKKhVjc1TaIf7U/yGSTuabM8y/vPx8a43FNE1SHe+U3HIEVZPkG/gG8TMx9kGB/YO9Nr5DjRJ
	PbPS+7Gx1BNgAg
X-Google-Smtp-Source: AGHT+IGwz17sfIpZC/eVpvHXuBMU43mOVKJTN+oVAMZ101Y52KMUKuvcu6Wi/dGWErGdZPVoBy+UYA==
X-Received: by 2002:a05:600c:3483:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-442d6d44b23mr54411455e9.14.1746866776789;
        Sat, 10 May 2025 01:46:16 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f3a:400:c49c:ed91:96e5:222b? (p200300ea8f3a0400c49ced9196e5222b.dip0.t-ipconnect.de. [2003:ea:8f3a:400:c49c:ed91:96e5:222b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f58ebd43sm5947801f8f.37.2025.05.10.01.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 May 2025 01:46:16 -0700 (PDT)
Message-ID: <4f405d9b-460c-49f7-91b2-d147d9818369@gmail.com>
Date: Sat, 10 May 2025 10:46:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ingo Molnar <mingo@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Documentation of locking needs when working with lists?
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Even though lists are used everywhere, I was surprised not being able to find
documentation about which operations need locking, and which ones are safe
lock-less.

My case:
I have a list where the only operation is adding entries.
It's clear that adding entries has to be serialized.
Question is whether a list_for_each_entry is safe lock-less.

Looking at the code I *think* it's safe, under the precondition that
reading/writing pointers is atomic.

Any hint or documentation link would be appreciated. Thanks!
