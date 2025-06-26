Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA4325B30F;
	Thu, 26 Jun 2025 08:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750925185; cv=none; b=DcIFC15XreGD4cQgM1wCyXqOARvaOEYfgAJhLs7ur2YHIZabmTtnSxG0jNVVY/oiDv9iNWKOfof++qVi5bT+3vnJ8SoS+xHhHcMmD2IQ+QL/fg8yKvKzbTI8BQM0Ja1ToYFGSMt2qFLVWZRWW/R7U0fK5Z2s+Af7tsgfKytkBEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750925185; c=relaxed/simple;
	bh=xhnpuilzuzpPd6cI51i2HOiB+MDWT7q/4XnyimdleT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lNuZpulceAVfEakw6SZS8YL+YunEsLByOFDXQh2DrZG/r770ESUV2PfZBRf5UCuNDlIamXZPrcm8tO94vIUP7cahytVQUUvVPskQfvAY6z3p0hIuvfZGecWfCpqW7PHd5kPOdqRrNmMR9CwT0qtmzWGR/I58eZuh3QIPYNEO9wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANRwvLTl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANRwvLTl"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45362642f3bso1022635e9.2;
        Thu, 26 Jun 2025 01:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750925182; x=1751529982; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DC64y/H2oFnVNlImH6ayGBQaIfLwd9fO3/4UWP+gwOA=;
        b=ANRwvLTlcOe2/t3FSAgKIXvNmjpyMUNAaovf7wXh/eSNvRrthTJ4xyAR2YX0WD+yqO
         O743SAM1LsA6YIZ3nww5vXSJSspsjXRZvHnlt2TQ5MKkM/Vl4uotuF/UfDS9gVMwyMPp
         9iwmCv3b6bEwNKfQhDsbU/kSxXtkOB9Bu/qP0w/TFnqovX9TZbHXfXW+NG8cyPQCmaRD
         zck5xN0J8xJyA2pMOdwqORcl+rN3PsANShQWlLllraaN8plecll/3g8rIny8xMltoHKU
         9XP8u4DK9MHEX+MQH7/1tBlHvgKQUcXxaCv7fix0HzMZCmJCm9Ci3qd2augGIB+5VwhM
         iXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750925182; x=1751529982;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DC64y/H2oFnVNlImH6ayGBQaIfLwd9fO3/4UWP+gwOA=;
        b=bOGeeMuJMt5PjJDu/RFNBwu0OxowktSPwMSQF7VV/2e6854cmaTxDOfowFTLVq0FSd
         sOjVykGl73bYh3TY3T5ZPEpZdNj9JG9Fo+FkJpyeAbuucDPHPInC8vzkgmHLZkUIGUW6
         kKaNw1GpNmigu8ErkbNxd/J0pReqWjsUUSXVagSmyBJUYh+EpYkRvxUB3RUTVjPv4mV/
         dALdYo6NypXWZKfgdDdl1aM9YCxIz3cRKB+BoD3agE2FEhqakkHHMv1Prkz2rF22dmRq
         qhP6+Q85QDJef3+gEg60LOw4kuT1joQWa+0QhWP52xFYmOjBqRYY53aFkfoHGs2OiFa2
         Zudw==
X-Forwarded-Encrypted: i=1; AJvYcCUuuLogou/TFTYgxYzdbV3AP1UofHty55DCyURdh1ynhqMvUDV1/FMvs4mUCSkuyDRpx94MDPGvLQg=@vger.kernel.org, AJvYcCW23a31/VhQwvjDVwC5p01KqM/kdTvYq29voE5dB1bRytau4o+fAPH2R8++pePDjuqDGFMpfDwrGWGvm73z@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt++2aMWMWeVR9/QhxpLjjXAhNHEmTCE3SkCrG0QDgx7nPedK9
	iM73G4TzUQq/FqSx2fQ5LkQmGmrfcUP7/E+Su5HOESx2hsj3VEefZiwZmBuDXdw=
X-Gm-Gg: ASbGncuI7j5ROkdH4XsuK1qc7XfnY5Y8f66ZV6VDeAgU/JT7odU39L3V2lA2XC5SI+E
	I8gkMlzznDLCxSvItkWE/AQFjBQmd1INvjLHL+c+E2IH+moFg/Kf7HBZOruTtmQ+6gsE30vXux7
	9u6jTuXS/VniSm1BvmQbtbkQy0d/gOCur9iqA+WMBhegN10kJEVrLWHibypuFb+oE88gRgbKMoF
	XlzN2hWC5dmtHXyf5YFMZaVMFMZ5lyPghAJfP/RhypGzBCTY3eTcNKjsYLMymRJqmgGOYVDbYhB
	OPyR/1SVi2TrcUWbAUHrlKPGed1evqu/DnNl7Soh29k0RBB0ZXNtZRNcRDW7m8y3aIPAvrfB8vK
	RfXFSVBDaQ0q5s8v6Q/TbY13fH/U=
X-Google-Smtp-Source: AGHT+IFkLolt71evoXr5YSCGL+e4CJZLyipwcJOrMl+ydsN1P/MteMAs/EDIQzLoqeSKNkbQWAOU5w==
X-Received: by 2002:a05:6000:2910:b0:3a3:6a3f:bc61 with SMTP id ffacd0b85a97d-3a6ed630c25mr2107451f8f.7.1750925181879;
        Thu, 26 Jun 2025 01:06:21 -0700 (PDT)
Received: from localhost (233.red-88-28-13.dynamicip.rima-tde.net. [88.28.13.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f2670sm6583882f8f.49.2025.06.26.01.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 01:06:21 -0700 (PDT)
Message-ID: <f2d39a21-bbeb-40b7-9759-b50308e4e382@gmail.com>
Date: Thu, 26 Jun 2025 10:06:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] MAINTAINERS: standardize git.kernel.org URLs
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, DOC ML <linux-doc@vger.kernel.org>,
 KERNEL ML <linux-kernel@vger.kernel.org>
References: <20250625142017.237949-1-xose.vazquez@gmail.com>
 <2025062654-lubricant-lettuce-3405@gregkh>
Content-Language: en-US, en-GB, es-ES
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
In-Reply-To: <2025062654-lubricant-lettuce-3405@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/25 9:38 AM, Greg Kroah-Hartman wrote:

> On Wed, Jun 25, 2025 at 04:20:16PM +0200, Xose Vazquez Perez wrote:
>> replace https: with git:, delete trailing /, and identify repos as "git"
> 
> This bypasses the mirror systems in place with the https: protocol,
> please do not do this without a lot of justification and agreement of
> the hosting providers involved as they will have a large increase in
> resources if this were to change.
> 
> Have you asked them if this is ok to change?  What is wrong with the
> current urls listed here?

To be *consistent* with the rest of the entries:

$ grep git.kernel.org MAINTAINERS | sed 's#://#:// #' | awk '{print $3}' | sort | uniq -c | sort -n
       1 git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git
      22 https://
     380 git://

But if https is preferer, a reverse patch can be done: git -> https
