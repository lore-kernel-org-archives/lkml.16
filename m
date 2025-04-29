Received: from mail-oa1-f67.google.com (mail-oa1-f67.google.com [209.85.160.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF93218845
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745963268; cv=none; b=H7Lym6QAeK9oB9OqM+E6s+/9lmcOHiq5I1ZDT5O55qRCA40CfGaHWluDMVJtJVDmmpBsuoiKSnu7SyoeacNhpkLjAnDTuNlGdU8ZI223MyHPNRIWrDZtSG8D0oyi0dyqvQYvIu30E1VwCmGpj4e3bteUs3iaZQFkI+WzcUeDcsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745963268; c=relaxed/simple;
	bh=60HC5hl084HV4sAOk0rkV79U5WuEgMld2i2WU275q9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iuK/2zRKvm/c7RJw56k6DZwEHuw8j5NU1NmhsWyPKQSTqX3s/jNnx9ml5bPZQNA7Wqub//QsoDNIcnLELIYnuNOhWXogQG6kBF80nW1fk1xfKh28h5gkigJvbkHYJaToIHoxOq4PGHh3wet3Vv+Fe4zV1uV/v1gWBbOGTAu7OpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu; spf=pass smtp.mailfrom=vt.edu; dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b=bLd9qiQj; arc=none smtp.client-ip=209.85.160.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vt.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b="bLd9qiQj"
Received: by mail-oa1-f67.google.com with SMTP id 586e51a60fabf-2d4cefac09dso3383119fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20230601.gappssmtp.com; s=20230601; t=1745963266; x=1746568066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tSWrqsC9GfGsHtl4CWY3xltKXxokb1XJ2kwgO66HPZY=;
        b=bLd9qiQjpVep7phXNFVd7YiPu1XOeqz0eF1yw8lAKCC+vvNEhKBSLL6TH4VIzbJ2Q2
         sjX6zo4G4y4BrhgOOvt1By9eeUHYclOqKZHAaUmyX3+jzqu/4VPwyjA2PZYk74DXRKhN
         Ke720NeJVhkFaOmvhlBmNGPECXVcdrKOvfVvTc4AWWQWa6liApRsqkQOqXoMIKe2fIsw
         6Y6Ussl1Yq9zp9NDVPDIFtGLiNxNHVwPYq15OwJDDIZBjec287uw+NVR4Y3zuN1y4ztu
         SjBSwWMPsORIK8GrNo4FBYm03ASb0zBkulmHHV9y0z6UtI8uDUZZ+si7A+e4gvhnSbhO
         1fMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745963266; x=1746568066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tSWrqsC9GfGsHtl4CWY3xltKXxokb1XJ2kwgO66HPZY=;
        b=fu8t01NpM0yX4gqblIQdpOYlvXf6+urSQFvRoCdNkKyf8+6jh0P4h1hI5OC5jhAciI
         dUDA6rs7MyRhRSE4wXSo2x9pulKnPfLuGzhkV7as+or+Ladi73sqlsmGsWa5J2Y/o3xo
         H6Nn1bVtAQNSA6FU8D4Mrqy+i3Lso9iR8rvvxHGi12GX+Nip9Ca7l5WPdQbvsPMiiamE
         SWSIRNaKzvISHRC5Sjed/EY/qvlhNqyigFgPD5lOghPAyKJETWEC2i3XFmh0Cm50GL84
         tE4ZAxUBNEkr5bK9mphusvt38wfyyCDfVkUXwVERmrpgdwAn/YHnX9m/jvlb2cOmG0Q0
         X6Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWVu4XiONZMH3I8pLUt/9GUY8E1oI4Fsrn3jq6bkhumnBhnQYheuq0qIxcMI6yZq2iBXdX47Srs8mmxbmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB0rm3f+yP/aj8SKUOL55d4ep0bSRKXuU0N7P8XWhQ7ZiOxEa9
	Y2mMWpOgfu1QkxnDL35QIojRNTvXMB4sWIrvucl6wtCCLKx4b2ulQ3KjrICW4p0=
X-Gm-Gg: ASbGncvwaVIZaD1aoBSkQ3adr3qQvDWNSuTL9ZLKnWXasCYhBrZRwjbDJpiSv1QQ2h8
	TSnVTkgVIDI03XcAUhd1a7xfM1woY/CDUHMm8Eq8Wv//prT/r+Yxc/KSklBviP1qMhSeZDujw3p
	1C/MPhr34EWctJ+N8Bcqct70XVRjB3bAQU9W6aqXexeryFot0X6fp8yQ/rpqtAcohIcuJF+3zKK
	57kdsm2OKhD6oIUsbhW1uawcKFWCVcscklwTNG8HEKdv0ZjRR+IM67cNBkVoCiYeXNZNgadsBmY
	74Gfn0xcJW30o5i4LGtQ1pDeNS7KqwD0anB4GqkiPHq66jOO4eVTE3Lore7h89zjlAqrSo2p3Hc
	H68X+o6M=
X-Google-Smtp-Source: AGHT+IGokKX79prC++GTKkCLJs2GivzGD/e0wkcCPTDvZNHacdckEDJVBuObcGp5UlJ46GtNpb0VKA==
X-Received: by 2002:a05:6870:4790:b0:2bc:9787:affe with SMTP id 586e51a60fabf-2da69ee28ecmr433077fac.10.1745963265701;
        Tue, 29 Apr 2025 14:47:45 -0700 (PDT)
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e? ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2da6e4f19easm26098fac.38.2025.04.29.14.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 14:47:44 -0700 (PDT)
Message-ID: <96516ac6-777a-469a-b5d3-9897a0e40de5@vt.edu>
Date: Tue, 29 Apr 2025 15:17:33 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Reduce CPU consumption after panic
To: Andrew Morton <akpm@linux-foundation.org>, carlos.bilbao@kernel.org
Cc: tglx@linutronix.de, seanjc@google.com, jan.glauber@gmail.com,
 pmladek@suse.com, jani.nikula@intel.com, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, takakura@valinux.co.jp,
 john.ogness@linutronix.de, x86@kernel.org
References: <20250429150638.1446781-1-carlos.bilbao@kernel.org>
 <20250429133941.063544bb4731df0ef802440c@linux-foundation.org>
Content-Language: en-US
From: Carlos Bilbao <bilbao@vt.edu>
In-Reply-To: <20250429133941.063544bb4731df0ef802440c@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hey Andrew,

On 4/29/25 15:39, Andrew Morton wrote:
> (cc more x86 people)
> 
> On Tue, 29 Apr 2025 10:06:36 -0500 carlos.bilbao@kernel.org wrote:
> 
>> From: Carlos Bilbao <carlos.bilbao@kernel.org>
>>
>> Provide a priority-based mechanism to set the behavior of the kernel at
>> the post-panic stage -- the current default is a waste of CPU except for
>> cases with console that generate insightful output.
>>
>> In v1 cover letter [1], I illustrated the potential to reduce unnecessary
>> CPU resources with an experiment with VMs, reducing more than 70% of CPU
>> usage. The main delta of v2 [2] was that, instead of a weak function that
>> archs can overwrite, we provided a flexible priority-based mechanism
>> (following suggestions by Sean Christopherson), panic_set_handling().
>>
> 
> An effect of this is that the blinky light will never again occur on
> any x86, I think?  I don't know what might the effects of changing such
> longstanding behavior.

Yep, someone pointed this out before. I don't think it's super relevant? 

Also, in the second patch, I added a check to see that there's no console
output left to be flushed.


> 
> Also, why was the `priority' feature added?  It has no effect in this
> patchset.
> 

This was done to allow for flexibility, for example, if panic devices
wish to override the default panic behavior. Other benefits of such
flexibility (as opposed to, for example, a weak function that archs can
override) were outlined by Sean here:

https://lore.kernel.org/lkml/20250326151204.67898-1-carlos.bilbao@kernel.org/T/#m93704ff5cb32ade8b8187764aab56403bbd2b331

Thanks,
Carlos
