Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFF028B4E6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513210; cv=none; b=odbghJO1loGjs5RH4Wouc4+8z3mISTTfSRMChxbKjU2tXCCaxiNgJS5s1/HqeSBCL2zx6gDJRD5LeOc6uEsIZ7YqWvQX34Rk3WPfn9eFzib1klOg2wnxi4O1q+EUFhR1IYS5vF8hydznkZswt5tFnw2+Kp1gWA7n3XYifC87tqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513210; c=relaxed/simple;
	bh=4V0OJvZhwo9CryL3WO0sn+dGrmqATcnugSsQq/wzqHI=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KmtQ9QDvKbyKBCFlt9OMXx0lc+79tMJyKpWhIS6IvhmlmHN60/hFi2hC59ss3gO2/VCmbKeelCj++4lXX/dTO9352+i/JY741/KrN615Bs4omMoxEf54DdzNGfmgkfwQ+2nejQ/VoTTYLwHpeYR34ZB3bCySm+CdekbqsLyF09I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info; spf=pass smtp.mailfrom=jacekk.info; dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b=CLolI0gI; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacekk.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b="CLolI0gI"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so2024896a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk.info; s=g2024; t=1745513206; x=1746118006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WhDyBzYENMDRP2Qu4icH/WALzGg0heRjnQ9LBasVOtE=;
        b=CLolI0gIEadwLL1pK4YC7/sGG28KZj6rHmLsTTSgXzfaavBGuJf9SoI6pncIkU0okN
         CfSCsQfOxVaE74s8fU+xbgokpLQRzv2c/hkRCURtU55dLp1BQt2tBHBOhIMcPlpm5w4i
         NWScyYCBp4XjumDzFVK71/kvR0p0kX1K4JLwBXkB1FzMnPx2xXNhQsQVru5iv+xklCuV
         v1Tv1aE7g9WUrH5TUA1hBXX3ILWZod9bSGjZW7Q2m/ojXYoDPgUapT63zCeRpIQGoRHG
         0VVc9InRIBrXH05Xzcf3Mjj+3zc6CeFxLlw3+Tp9vcHA8+EMMxfhfmYKHBnWClXaESv+
         352w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513206; x=1746118006;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WhDyBzYENMDRP2Qu4icH/WALzGg0heRjnQ9LBasVOtE=;
        b=JBEIH9TiPdbEt/el+m9D2707bFLAdfa0mPfHTtlLaDjrG5PybdFLfnzqlMMZSs9413
         JMU2vX0ua5OrkoJsjjktFqBh7AP13hu06ffO1LvUV9hWrTJwC9clfrFSed/llNaID3Sp
         fzAApEVXSMHt5FtFzdY1qK/3dQf/7GCzZfd6cyEO23Mi7wxyfEYRXQcgMdGXTHcfOfRp
         TVsntT4dkLigt7c0TOM991v3B7EtKT3DVruaptwThYuIoosAYyQ3ryoPKscngmPnoxcJ
         m12Oz1texkUHmQmM09thBHL8NtPcXQtHE53GlNnnR5+I036s8NY60vJ2q1/hCWyt0mej
         +SJw==
X-Forwarded-Encrypted: i=1; AJvYcCUQpI8qCgETnj7CMIR0Qz6xD1cM3yntJ/fhKXbAhe3cddiVMrTN0AWT++zp0XofXEOapfcJpcX6NuARN/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzC4ZZQ04jPaZzqss5u/IAdc/6RVaVtWTAP67lo0qIAAi2tdSv
	x9payzlIWwAqNUES72s2PcKEhIisBB17NpvPY0RwV2GhOg+UBvKp+h1ZwrwhUw==
X-Gm-Gg: ASbGncuIX3xiNr+/7napHlHoUv6c+8oW6jq0qnwbYVEwOwaE4IiHS12p4qxFITzn/Ha
	gc8YeqSDCJfg8cN8W6whvMutT4xpGxjBGk63FRG3ObTIyvmznjQuFsj+oup+mzCHp8UfXzzCtpL
	F2Soa9lL7Rfpfa2XoNZEY5HswvY2IqCZYh4MjQ1R/mC/I0A/5KbRtS8uoSjmR3gKC37zLs8Ig2j
	0G0CRAmUVUgpM/Ep53Z+Nih9RJCePEz5Jgaq1m4I++9Eu7x3m8HQcys/oO0CmLw1SHxSjex3Xc4
	XljC4KLvEL0YmJRTxr2IMk2hD7bmNQPETm3Xwh+Zqv0u+EyeyQ==
X-Google-Smtp-Source: AGHT+IHTYRGYL0LPgs+SLCq7Lwnmm7pESM7YoTIQRAUYPS5PaefisCf4m3nGAns1jOX8rlFzOE1U5w==
X-Received: by 2002:a05:6402:40d1:b0:5f6:20c4:3b0e with SMTP id 4fb4d7f45d1cf-5f6fabcda66mr75949a12.8.1745513206448;
        Thu, 24 Apr 2025 09:46:46 -0700 (PDT)
Received: from [10.2.1.132] ([194.53.194.238])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f6ed416c66sm1370042a12.60.2025.04.24.09.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:46:46 -0700 (PDT)
From: Jacek Kowalski <jacek@jacekk.info>
X-Google-Original-From: Jacek Kowalski <Jacek@jacekk.info>
Message-ID: <dc357533-f7e3-49fc-9a27-4554eb46fd43@jacekk.info>
Date: Thu, 24 Apr 2025 18:46:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] e1000e: disregard NVM checksum on tgp when valid checksum
 mask is not set
To: Simon Horman <horms@kernel.org>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <5555d3bd-44f6-45c1-9413-c29fe28e79eb@jacekk.info>
 <20250424162444.GH3042781@horms.kernel.org>
Content-Language: en-US
In-Reply-To: <20250424162444.GH3042781@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> Fixes: 4051f68318ca9 ("e1000e: Do not take care about recovery NVM
>> checksum")
> 
> I think that while the commit cited above relates to this problem, 
> this bug actually dates back to the patch I'm citing immediately 
> below. And I think we should cite that commit here. IOW, I'm 
> suggesting:
> 
> Fixes: fb776f5d57ee ("e1000e: Add support for Tiger Lake")

I had my doubts when choosing a commit for the "Fixes" tag, but since
my setup would most likely work up until 4051f68318ca9, I selected it
specifically.

On my laptop NVM write attempt does (temporarily) fix a checksum
and makes driver loading possible. Only after 4051f68318ca9, which
disabled this code path (because it broke someone else's setup), I'd
be unable to use my network adapter anymore.

-- 
Best regards,
   Jacek Kowalski
