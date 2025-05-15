Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7AE12A177;
	Thu, 15 May 2025 15:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324009; cv=none; b=Cs2omyt2PHVqELPH6vlShFLqfWw0dkqVy1XXhMQO8Q/lkiGDat/Ee38i2m5L0s9TA6HZg5AMp2AS1ABTGlPI1T0ZHUNYGl1ycCW1iosdI7owttcipQcVQ8L2bUYYGjmHov9lEQCIF+AUyPvD0p5iXBZQBHjq/GQnh2qAAdz9txc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324009; c=relaxed/simple;
	bh=SUEKNm9uRa4lUy1fcLGEByG18LLT8O3tbtOZ0DsbLy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qLcefpjz/eiuloLpkn9AC9g8k9z0APmZRvqbrbvp5BSIlE13Kr+RVqGT4vpaFxXzusbmNc/XNHTPuvfH8sZwILUdHRbq4WHp30cFqPExuwfmYVwbpCTO1cSaHXE9Y2IzQXJRazLyZsJyO0f3hox98hSBqD6xVZo5UNUCCdur0LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6PWtJPl; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6PWtJPl"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-550d6e7c563so1274955e87.3;
        Thu, 15 May 2025 08:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747324005; x=1747928805; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iefSatW6oFGrk0hCOerOc6+Pe+Fjn+g47KmLI+MHu+s=;
        b=G6PWtJPlU823fAA/GAy4CZ/KXmBJo+efVvgzPIlB1TN7vnyQ76aoOpLqeYHeXdbaq2
         CmaJNMKkbZmWbsgnbNsl1CV7ydm1SMWzFsyM0wl35+rjOCj3EfeiXs3OHivjxCeeOkk9
         4qtfyOjACr57pGBvB3IX/fhMYXJ6ymSYO4ppulHa5/tprLY5QtcqtgH3ToPl7ZMUGlOf
         Ub1pP3N8FHVCnE+egdmjY7bG0hnruLdcY0V0Vn8sALwMdDO8yaJa67sen+zSrr+a0z8A
         eMMfSNvmpya6OGvvAi2IlzBgBUpMnuhyt3YYfVLMEYNoGehRQgQtaLzrTIlqfO0kVTcv
         LKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747324005; x=1747928805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iefSatW6oFGrk0hCOerOc6+Pe+Fjn+g47KmLI+MHu+s=;
        b=XOt2BbdZLeuTNjKaxC4P1q1iaRjxGSrIWq0/JWvW3DXqUkhgSHOoMgx3diBwElTrdR
         JoUfDU4x1Aqu/djy9yk7zzxCPrOTkdAapfXmPXVY36AXVjWiVTJwGfvi7EM6XFhgZF9P
         AkHaEphzfxmdCsEA6JtSRyd2Up6/+qMYe1wOs8ttqxKQSVxKPC7sGdFK7+Hk+Zg2LXvI
         El5xtxXiBe4C/zsqDq9O6aEegxBFAgfP7AmDlohcBRY3iNRK5n6KGGHSgnEhpe0Z7v9u
         XlvShIFegKYj936Lndmn37Do3mM7Sb7FUJQqb0V5bopzQ04ydorSbTA2LSuKQ4sEtVIe
         CguQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwB+FiTeiGWrjhLy+tVL77eQDWWK+IqVSRK8gFVu5y3svgrVoQVXSpHh1Ivy/RmHX222xsfSHhATKS@vger.kernel.org, AJvYcCWCDaYcVXeJqQUjkTZrlhxnuCQRIIvl7VrEqGwAhrjGxRZjQixOigbSMtn/iWDARTHpdny0xoX5WzDa8l5c@vger.kernel.org
X-Gm-Message-State: AOJu0YzmEhdAPVSoGGKcBM5bdqUYikhp4tx0N9fYm35JOhCRYm0yxFTW
	4tIjTq/0NG2bgW8A5/pGNat6tho044yip4v62gkNFOxVLsiO5QwN
X-Gm-Gg: ASbGncv51nUaTXe1Ap60Xk6s7p1B3+3PxnTXwQmKX2iDTVdCjOVCWFSsYMntNd4cuu0
	Kt7y9ZjTMtmLKHnETTrRKqRZDVfebM3D4OceJ+Og3y46wbx1j92uNtNuH71We76ddoPaMdLEXXr
	u6yQ3wsxZS+HjpYB1crOmU68QfbRDYq0TryaNj74oo64I0nOiV6Rk2qt29vsW9vkxzzAdh4oquz
	GkUhfEeBjwotmiR8EixnJsEGiAQ8lK/j8O0DVW1mrAd6+geFQaoc2LfAiL4Kxay77EueSxQiOXB
	awYSkk6XBnnNzUXHZHdJVqGVQlJZmYVNW/NRP7HhWq+Ud0Ct28LkG3RxcybSnjxVhec+AGe2SaP
	Famv26wnOVHPrSi88rH6F7emt8x47OvbWM+HO
X-Google-Smtp-Source: AGHT+IEVKM7oG9wZtg8KET+lsroz9mMvLkh8FdUs5mQMfI0T7TH03Y4MtAKf9+PYXbfxDliE50H8dA==
X-Received: by 2002:a05:6512:6099:b0:545:6fa:bf5f with SMTP id 2adb3069b0e04-550d5f7a8aamr3118415e87.2.1747324005372;
        Thu, 15 May 2025 08:46:45 -0700 (PDT)
Received: from [192.168.50.244] (83.11.178.15.ipv4.supernova.orange.pl. [83.11.178.15])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e704041csm699e87.254.2025.05.15.08.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:46:45 -0700 (PDT)
Message-ID: <6fd5ad47-8f01-43a4-aa92-e067c25ff195@gmail.com>
Date: Thu, 15 May 2025 17:46:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/9] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
To: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-4-e4cf638169a4@gmail.com>
 <20250509140957.GD2492385@google.com>
 <aCRZzwW0w8oVWLUp@finisterre.sirena.org.uk>
 <20250515071357.GD2936510@google.com>
 <aCWfre2-n_PSuhxR@finisterre.sirena.org.uk>
 <20250515092000.GF2936510@google.com>
 <aCW0822BVpfKV2NL@finisterre.sirena.org.uk>
 <8beeddcf-1dc7-4af8-b287-4c896852b258@gmail.com>
 <aCXQUu97HL_yrH89@finisterre.sirena.org.uk>
 <20250515131321.GG2936510@google.com>
Content-Language: en-US
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20250515131321.GG2936510@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/15/25 15:13, Lee Jones wrote:
> On Thu, 15 May 2025, Mark Brown wrote:
> 
>> On Thu, May 15, 2025 at 01:28:15PM +0200, Artur Weber wrote:
>>> On 5/15/25 11:33, Mark Brown wrote:
>>>> On Thu, May 15, 2025 at 10:20:00AM +0100, Lee Jones wrote:
>>
>>>>> I can go with 2 in this case.  Applying in dribs-and-drabs as Acks come
>>>>> in would be sub-optimal and would likely end up in a mess.
>>
>>>> Well, then just going a head and applying them on a branch with a tag
>>>> seems easier than delaying then.
>>
>>> I can split the patchset into two parts (one for MFD, one for regulator)
>>> if it helps.
>>
>> There's still a dependency on the MFD bits whatever happens.
> 
> Right.  That won't help since you need to describe the deps.  Submitting
> them as a set was the correct thing to do.
> 

OK then. I submitted a new version, v9, with the style nitpick
addressed:

https://lore.kernel.org/lkml/20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com/

Best regards
Artur
