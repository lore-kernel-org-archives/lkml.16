Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBC31E9B30
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 20:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747168574; cv=none; b=enK4VhFcFu0KCEGsDwxrkq4i49yT7c2HnQqa2le83kmgoOsZOir09AU2RX+cTrGLGPtZurBM8oprwlWZLYSiYf9VH5VTaJfQQW/EV6jYnPDZB2LWM2V+pH8X2wJLaiCUsex7XNI3ZSLka30P9xfuqRNx0JTxku+Nc2yOf/bsLiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747168574; c=relaxed/simple;
	bh=5LLRBHA4RbQdiR5KNtH8yV15ZdswH3CB9WS90/GuQhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ejQZ2qHX4SHhvvBBfv58J/43wxMsMFnwYquK1aEKlkAQ9pn005i21rMtVmgBvrPzzGwvOmVmqiz90OHutmEDurImb2opG8xxkzQ/HwmpJEN4v+a40nMJPSSKuknGztNrlbEDcxxbIRxzsbrsS0BuWHzDTU3xybbg8o4MIK4ANMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=UdGKgdcu; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="UdGKgdcu"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-8647a81e683so149602539f.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747168571; x=1747773371; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vQAC3le+BCYy2YLab53jAJm9W1rrEw9K9lEKqtin1Pk=;
        b=UdGKgdcunwZ/zuEY61GV4LNkLq0ELW5aCgjrXOK4SPNZtF7TJ/Y5pja4oBlbbahJJc
         3rJGBcUDMADfTzrVjqQ0Vjr/ZV/kIx8aT7Pp3ey5kmwJ2/LESTpyD7QQNKIv6ZCdhfGK
         jrusSUhWs0Fnok6+gwZatKS35CLwotvtjeZ3AQ5eb7Qp0xQq5Ub02cjLQ5rWVTqCIzmB
         cNwOgec7nCIvvzTBipPquSNYfTVOZsYC6xfcIxnTMHfTHomZBa2njToGH5T2z7vjFe9v
         9GolDCzW0793noRi+iA5DKdDmht9LeEhP/t5cDkx2XOw5svxXcooSns0t6m//drjMtc+
         Umhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747168571; x=1747773371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vQAC3le+BCYy2YLab53jAJm9W1rrEw9K9lEKqtin1Pk=;
        b=hpXJPw4cDdmKp1qmSOGs7hNh/SpBEDl4F83KjleUDGqgv97VA8jDYC2i+ZrAc6fsuR
         JoQcx2TbSLstI7T7Y6myxwJusTrGsG5C73ThIymPdfUN/ebthoSpmg4A0omOSbIqxqjr
         73LKatsyehFL5GIhZW1Nlf7W6whXEsRoCR1dn4EGll05Pa2ZqhWqJmlSbqQ4YmL2RuSU
         MmABM/WbbYO3FNGaEhqiIVqikIu5n0j9xSBbAQluPJZzRCE5/dSBUOleK3eQzenPJEbA
         6zJdxmaD0WfGtjX2X+kO65XsVJJbxCcZ3mDnbT3Arbb5t0yF8Q67KDnfylE7PrJUCPOb
         xp0A==
X-Forwarded-Encrypted: i=1; AJvYcCXWHbITpBYsUksSMarDQWOoqMt8ZP5ZIexdHTZgV7QuSPuvBGSE9/c8s1WD+06A4+wLKfEkud5DZVbndBA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7WXg0vTnxtLJESZicSY4G3Rx+d1qel3tMrXt+7AC9VIAd5my7
	KKYYuvuSTLVBTzpFWRRugHC5sH+OzMfNgDiLCBgu8zUEGzNLYPRnbvITtrJ8TRY=
X-Gm-Gg: ASbGncur5i8V5wdK5E68bHI6LgW3p01aaPdOzvyqFYC582VZJ55K2QLHA2uOUtN55jr
	C5mUyqJRED2CBL5vyn1cehjSdqN3gAKy1NgWaVOT7hjqRBLK52XMkBN/5ypMz30b86DtG+1rz3Y
	fvNZZLOiE6IvYeufaPuuE75qnA50NiuTVcT5shhoBlB4407gbgSRBF5cYRx+xxEXpQmUCvO9me3
	lm1IaQ1uqAkC5vd4a2IuC9aje2r4e5sqmZrdRay39ItJ5eVOSE79B95f+4YMrB6Pupq6yhx4RB1
	r3n8Bf4aYU0G82jDCMgu33Oa4rrJDu1UbP9dTEkrJE+3/4e+eSrB0NsH7CK/18jqtj8JVfRtm/j
	yKk6hDoYAG2liEXM=
X-Google-Smtp-Source: AGHT+IGmcYzrawJPrdx830TjmfHvKcMCTm3YWEkQZLVMVtIRd+wF9lEoF07B//54gt57mIaMgWnBSQ==
X-Received: by 2002:a05:6602:6ccd:b0:867:237f:381e with SMTP id ca18e2360f4ac-86a08db2c12mr94293839f.2.1747168570986;
        Tue, 13 May 2025 13:36:10 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa22524b94sm2255602173.63.2025.05.13.13.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 13:36:10 -0700 (PDT)
Message-ID: <62b44c17-442f-425b-bf9a-56c9d4eb2468@riscstar.com>
Date: Tue, 13 May 2025 15:36:09 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/6] reset: spacemit: define three more CCUs
To: Yixun Lan <dlan@gentoo.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, heylenay@4d2.org,
 inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250512183212.3465963-1-elder@riscstar.com>
 <20250512183212.3465963-6-elder@riscstar.com>
 <ecf46fa3116690b85f51539edf7f6a47c612fca5.camel@pengutronix.de>
 <20250513201208-GYA518096@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250513201208-GYA518096@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/25 3:12 PM, Yixun Lan wrote:
> Hi Philipp,
> 
> On 11:21 Tue 13 May     , Philipp Zabel wrote:
>> On Mo, 2025-05-12 at 13:32 -0500, Alex Elder wrote:
>>> Three more CCUs on the SpacemiT K1 SoC implement only resets, not clocks.
>>> Define these resets so they can be used.
>>>
>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>> ---
>>>   drivers/clk/spacemit/ccu-k1.c    | 24 +++++++++++++++
>>>   drivers/reset/reset-spacemit.c   | 51 ++++++++++++++++++++++++++++++++
>>>   include/soc/spacemit/k1-syscon.h | 30 +++++++++++++++++++
>>
>> Could you split this into clk: and reset: parts? The reset changes are
>>
> Do you have suggestion how we should merge the patch series in future?
> What I can think of
> 1) take patch 1, 2, 3 via clock tree, and provide an immutable tag
> 2) pull the tag, and take all driver/reset via reset tree, and provide an immutable tag back?
> 3) take the split part of drivers/clock/ in this one via clock tree

I discussed this with Philipp privately this morning.

This series builds on the clock code, which was accepted for this
release.

If I separate the clock from the reset code into two parts, we
still have two header files that have updates, shared by both,
so those headers need to be pulled in first.

I think the easiest thing to do--if Stephen is OK with it--is
to have the entire series go through the clock tree for this
cycle.  It avoids any need for coordination and will just
get things right.  I think there might be a trivial merge
conflict, and I'll call attention to that when I send the
patches.

I will explain all this in my cover page for v10 of the series,
which will have all the signoffs.  Philipp said he will give
his ACK.  We'll then see what Stephen decides to do.

					-Alex


> 
>> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>>
>> regards
>> Philipp
>>
> 

