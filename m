Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A91B132103
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 11:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750332686; cv=none; b=tGudFVpPslxlmIpO7kIQD9TcvrPBkiamXKa12qDRXH5mfpWGGw8RNrz7OelvLkVTRvmByKW/hIPLENDn0A2wHgqEC1UBBD4peRyYPJYpLMZv1dr3gqj3GuNEAvAKpVg6VnTzDDL1kL90ErMLRRFS08wzGTRi6Te3Ka9UtKlhLMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750332686; c=relaxed/simple;
	bh=5ehJkgAbyggEQYCYMmY956XgyfrGZO0hGxlzMuYgDhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cubzo6HMFVbK8gQc+T4WDsyy3z0LVFpwmvoOBkv1vFsKzDyXN7BxjZ+6cRS3kspqdIEHbvV6XdbFzGrhCKO+S8yPYmpJT+U2e+2JCIO3DW8ERoowrr6Pek0SKLyxWs8KHfZLohxacHZ69dwLiesAjQRbASp5XZJkZgbhy/O2aM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=ekoSSl9u; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="ekoSSl9u"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso389819f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 04:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750332683; x=1750937483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5ehJkgAbyggEQYCYMmY956XgyfrGZO0hGxlzMuYgDhw=;
        b=ekoSSl9uiBgAKJXAdjMY63+MwYLxbFbt3fzAj8C/1OzIhe8d23QiL4oQRdvC94Lpng
         3LVS8N6Wq7mQWzy2Nv46DPHvlKSY5mglyA9s25q9QAEnxQr4UwdLH3FHj/UaMcr2lZZm
         hQUeQlO0jhK6SthanAWoEYqxdwdQnGFl727RU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750332683; x=1750937483;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ehJkgAbyggEQYCYMmY956XgyfrGZO0hGxlzMuYgDhw=;
        b=dmXYE+uAF8R4DP6VMII3po1XeSGb89h7ugxwCaWEu3s97pbkP1BXj91bhA8FX/oJWq
         OW8RWGwixcErnhTraM+e2eJnxH4Opcj3EHB4xY+gH6YByQMX3tLFyX56zMS6//p/dlMW
         AAxICTPPCXAz219wf/BLl1CtQx8PdS63sy35HBhOIypq5X170JTR8Ooc3DvZCO5q3ptG
         MUTrSx3KrqyIO5hRMNUMxtB0aWlAdP693lMNHKBiIzOhu4U6ezTx8i9/XB/2G8fXI8wi
         U0sexAkolqvBes8FitV2ABuRoKrCZeAnqHASWjwepyEWv9QT5Dsfrh2dP6oG98JmNQhN
         sX7A==
X-Forwarded-Encrypted: i=1; AJvYcCXgT5U8NdKF/00B7Nv4iPthU7EOzz9g9nqq1KiUryh57ix4siljm7VMsrAZiqx1/qhJJml9aUsdrGnWaq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT37pgxceHsp4aEQy1e1Isr14gphvwYulv3qZXe9k6zZ7aQ1We
	DDIMG+c4OJ9PlosEgfBEIb6Fxu6xgoeHFD5ogxV+fYFqHTrgP1JK5mvzxm8V935P6u4=
X-Gm-Gg: ASbGncuxq1Izif84ESrNJjRc4xVU2YD8fadD1bVPMqF9KE7GAgHPw3Fp5qkxi1oZfHZ
	NAzunBIrvXHC5FAe2yPETAWu5Fg11BEIUQHaLHFih/1IayKr6khPTI6Kbz5qOQQ1mQcDaKOr04d
	RzK0h8KsWMt2Crmq21IEOKZ6UzOZ7j4ei2DHK+17QDbRI8wIY4J/0lOB3ikVosTm4H/aMmYqgzh
	p/Uk41fEFdopIoxkGGxQdEg61cM/PWOVve59IAPA5YkBXyX7vQKLE9+FJuzctCfCEI9l306KdmJ
	SdOkkZIuQrpP6IEiOpEXeER0fwtdtoqFoW6D2I5xd7aaEdNbP/bsQI6d+wa/nkLTPE4C1JXZYNM
	8khGEvI1HTvR6cKpmDtLqJjswWyLXmy112LHXHQ==
X-Google-Smtp-Source: AGHT+IGxkwun+ifyV59KufsXNv7Ckg+d7lxDOQOaYgTNfK2qaTapjjfUwlMwJunAE7mrRblG2Psqvg==
X-Received: by 2002:a05:6000:144d:b0:3a1:fe77:9e1d with SMTP id ffacd0b85a97d-3a5723a3aebmr18322608f8f.16.1750332683232;
        Thu, 19 Jun 2025 04:31:23 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b74313sm19471221f8f.96.2025.06.19.04.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 04:31:22 -0700 (PDT)
Message-ID: <2c24aca9-5e67-4c0f-b890-92a0ad8e1975@citrix.com>
Date: Thu, 19 Jun 2025 12:31:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen PV dom0 "tried to execute NX-protected page" when running
 nested in KVM - 6.15 regression
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org
References: <aFPzXVl1pn1LtwoJ@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aFPzXVl1pn1LtwoJ@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/06/2025 12:24 pm, Marek Marczykowski-Górecki wrote:
> Hi,
>
> With Linux 6.15.2 I got a crash like below. It worked fine with Linux
> 6.14.11. Furthermore, the failure seems to be hardware-dependent. It
> happens when running on Intel Core i9-13900H, but does not happen when
> running on Intel Xeon E5-2620v4 (in both cases QEMU uses -cpu host).

Yes, it's a known regression in Linux's ITS / CVE-2024-28956 patches.

https://lore.kernel.org/lkml/20250603111446.2609381-1-rppt@kernel.org/

It's hardware-dependent because so is Indirect Target Selection.

~Andrew
