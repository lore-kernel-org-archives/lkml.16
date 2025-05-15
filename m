Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65443295DB8
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747300807; cv=none; b=Mvp2E51l0iBt7aK7PIPC29cOp8WACRUoqUzlx3m1RtboGv//pejuYjALg5g1lMyb7X/DxL72++lSh5OlIrhO877botXdt3DAekMkF1Kb3En8WSMWYZd/NnapwUKKQGmYaTTn9i2J9pyJdSpkAGhuCw/S+FGJ9WSCvGdsiUW+G20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747300807; c=relaxed/simple;
	bh=AMvDqQYGnDnGb/sl2sVntr4FQ/Pvxle3go/Gh6vbtZo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=pbSZvypGcH3OjyrCwmJU0ypXGWsyZTEMEvdMExT5euD9C+lNMtY8CCm020jcLu/1KNvN5RNIRgWwXXKgadflmLjUe/tV8X/zWin9481OS9VBUt5+/MU77QR7wx5wLZb4D01I8x3bVnLbAIs6cgPPiIoJhsioXKRExGHd4DK/OBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FjYhesQM; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FjYhesQM"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a064a3e143so304096f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 02:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747300804; x=1747905604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x2lMP2sWq3+4XRD9R5jQk8nu8eG7GVwKsI/4ygBP9qA=;
        b=FjYhesQMn/Z5Y7c8sL8r3NBxstvMIZyWfs8aP1qg631WOd7Ch/wulDb0roLXsNVzuB
         olisVbJXVbHwCZ3551FuPUonlFAu4WosMAc71RFUWvynIDMiYiOqHgMQhYqIzd94f5vD
         3OZbpA0h5louGMNsvOypikHWVzNeXcg0joLYw/5LBE6vsVGp586b8Uu+YDoj3n94743f
         1zDVrIf21hwhz7BoYQ2lTF4a/hz5OIldrZ11Q07BZ2y3X1sU82atzTbmUvuM5e6i83TX
         Y9dDY0R8V2006gTUQeyvZuxgcyVyGCuq8wia6OtizAPABYMnrU++brtIPxmg0FrtEvFw
         HWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747300804; x=1747905604;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x2lMP2sWq3+4XRD9R5jQk8nu8eG7GVwKsI/4ygBP9qA=;
        b=Bh0Ib/Kbl/8D7BMyqLFjd72zi5FewBPqHCx1PIUXbp0xzBEaljfEccC3GydRLZQLWZ
         af/uaJXnX2fZOyN7MkfQBticHXtwmKftdqlTXRytoVBmQJTZM+o3AkUc3XJjSrc1Vt0T
         v2eRpI5lJE1OrV3gcOF81I+B/P/R6+BY7osgiOplMRNpk0PvSIkK2FbjjbBDNU6JW+yB
         volI9K8e05MjKI7PdKo3XiVnx0P8pE1YJSVdwLMhTPNb/LWFNzgzQrGtGeJUP5YbHHMC
         meE9KUt8XosPv3Er95ZqQcokDJkqYSsbFTQCYPB7HGViID5+JcgSU9ycZsPYnh3BfL6u
         AUrQ==
X-Gm-Message-State: AOJu0YyVB/dQgKlxXkqaF25mgHWkWF/pNZ1OB8S4Xi+I33R7QscMDZUe
	hEUwmcnbDxo4YQ9xvzcfah1T7optb2OvQmHtTOSV5vb79DGEN85/g6dHKpMWGGOCB1/GjeCKibF
	0pSkM+Q==
X-Gm-Gg: ASbGncsUZXUOeGpEDgCEomqvKBP5FzW1bDMfch0hzOcqo9n9aGYQESnoPANIFm9kkeb
	E2VzRty8CCyh+QiEbFoJJkkL5ZfTgs24+ZlgYZgDh+bBuxbHvji1a82YqElgp/HcI3ayVabI6AC
	ImMgfYfA7i8kKzSDOIWNFy12og+g8niOHpL5o7TvI54PO8MUhbzgrrt2KY9PesOJtz+9XQfJhtp
	U8oTEMiMRSu1NLxh/YRSLFNArX3UXqFLsSzOM66+MeCrCA3X+JZTf1Ysz506s16OUT2NPen8o8v
	zK9cG1eISGdsiTRVbd7O4fJkrIn04MQi0sYJfsqph0kGcYijPCV1QQduQGugC4R+NUT7L1bLyhG
	1PR1nYSLWmCht
X-Google-Smtp-Source: AGHT+IEROeBcQLXaeEtKAeBz3Fs2jZereQNJ6BQ+vtNCHT5Y13IsuxKCN1ufBhmMDuFZWcOb5S2qTA==
X-Received: by 2002:a5d:584c:0:b0:391:3aab:a7d0 with SMTP id ffacd0b85a97d-3a3496a66cfmr5384359f8f.19.1747300803712;
        Thu, 15 May 2025 02:20:03 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde6bsm22420509f8f.13.2025.05.15.02.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 02:20:03 -0700 (PDT)
Message-ID: <ba3ff719-ce60-4c0f-a215-fa332b614b82@linaro.org>
Date: Thu, 15 May 2025 11:20:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: error trying to fetch the clockevents tree
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250429082047.4af75695@canb.auug.org.au>
 <db7fce1c-c051-41d9-9cf1-ef015b0f7fb4@linaro.org>
Content-Language: en-US
In-Reply-To: <db7fce1c-c051-41d9-9cf1-ef015b0f7fb4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Stephen,


On 4/29/25 00:35, Daniel Lezcano wrote:
> On 29/04/2025 00:20, Stephen Rothwell wrote:
>> Hi all,
>>
>> Fetching the clockevents tree produces this error:
>>
>> fatal: unable to access 'https://git.linaro.org/people/daniel.lezcano/ 
>> linux.git/': The requested URL returned error: 503
> 
> Seems like there is some issues with the servers recently.
> 
> Could you please disable the tree while I migrate it to kernel.org ?

I had no time yet to migrate the git tree to kernel.org but the servers 
seem to work correctly now.

Is it possible to enable back the tree so its content gets some round in 
linux-next before the PR ?

Thanks

   -- Daniel

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
