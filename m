Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F43E21C188
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750279476; cv=none; b=GEhZstETuwr1ym93+DPP0lZJsv3cPTnV5E2a4hScLJgdXN77mVSVns6u8zit/2fqgGpir5thR/oeoYRyprKJbW2xaAvF5mUu2yWZIVeAoZsztq5lm+BijmNXOvZCfww5LQ/PoV9v+UigVSAXpsm4B69vG1UJtoXOaxDoqhrntSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750279476; c=relaxed/simple;
	bh=A5V77MHGHxoltQ9oWQNW08wwJlpbGRsTMYBy4qGK4RU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E06Mn6M2lRvGc/L81bHIU+vlsyqdiDZHdlYbIp/+4O5V2WtK8GnCef4/SaqAsN5s5JjmFzpa3uGaEmMWcAHzgwCwv5jDKGEmsINPsdrhi2e4T7sEFeSETts4IrHyALtpViWrSpbp69KEPUyo3e2gDncy09x4aP67aL0T/HSMdFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AY1XhNaW; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AY1XhNaW"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-8760d31bd35so754839f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750279474; x=1750884274; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Ako2fd6NKJ2bP6NpCy5kPqjwnh1toCTc4fAZAJEcDU=;
        b=AY1XhNaWuQwWdpKSLvQcIueK6FNokFmknlm91FFd3DBoinj0SGleoshhpPClXqi+vS
         XQlIYccEx3eD4V6dE/J2wxr+gjQzXEVEwELObGreW4vQphyefDA0Cu/tkrI8pdkY157b
         A5gJvMNsttfuL0dRppQsD7aa5FJGdzorV3hR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750279474; x=1750884274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ako2fd6NKJ2bP6NpCy5kPqjwnh1toCTc4fAZAJEcDU=;
        b=eB17LnXDLTfj0VUUccsUi4n0XAlsVnkluU/5115IoE8GI8SUo+LK8sivMMXVPdegi8
         8BNyjg4pue227PgzMK1hXnBi1S7XPWVMJnM8LQH8tyfX9r3woEgnfBE4cM8kegQqnOaM
         RNFLMWKRP1A/mnTa+CnBTOcQB79lNINJNF6/8I81crJspoeucAZAChWUGi6ZvHiOiW4j
         JE+huE6sNNV884iRBhkOTCmX4kY5ORMdWJhQ8lprsnGpj537+kPoZO3vzBNglgS43BlF
         A/h2kIwANZIGqls3zR6CcEgP7KWTYUxwjyNbSgdue1t2E12TwQ2NiSbdogUWHqqbam46
         9QKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX+WYmLy8OvFYhn25UPFZgECqpX7/6IkFnOuJIE5XV5pgU8dIId2rCz5OJGyX9+fG4k/xOkJPi2bEajR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSVdfi/WzD3d0dgTB/twAeAq0t2FmqflOjIfydmdTkECHwnYsJ
	Rd8+tNpvSCyhewVkTzRM7HPqgjnNj2o9V7fSqY8j+dAhe2BIglT2Oe4IbYo/2xn3v/c=
X-Gm-Gg: ASbGncufncqAw1ostq637KPXajgG8Tp1njAx/x45yo6YrekrgbmRpzELujjCq8+siD7
	pdUUWFUObRUUOKncZC6xyll0/BZugvNeZ2A9vNNNt06rqqRm6suJyeWBYWN3g8P0SKl1Fm9LZFJ
	0kq2izKZILEcqsLmNpmlu3BAlRd6ATrepJvvR0uguwGxFtCrBwLPTW44h5mgiCuObcw5SPNOyqI
	2jeOEOKfBcBEfF7jQe+SCLEGLs4DI8C/Iapj63cSy1xDZm3PIFpG77ylj5+0iJr8KTynyADVdlq
	BqUPt2Dbu3jGtm+F7ze9Fs2a5CcOMLpQKBtNu3zt15gO8gJbpuhhYdj5rKKbyXvoF3P3vtJEYQ=
	=
X-Google-Smtp-Source: AGHT+IGBjo9SKc7leBQCMa8Hw77h+nyuKDNR2sMTMdtJdYEON8VxYPtAlm1helcS8akEtiF6cPaOoQ==
X-Received: by 2002:a05:6602:1612:b0:861:6f49:626 with SMTP id ca18e2360f4ac-875ded13886mr2529017139f.6.1750279474117;
        Wed, 18 Jun 2025 13:44:34 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-875d582dec6sm278667939f.33.2025.06.18.13.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 13:44:33 -0700 (PDT)
Message-ID: <34f6b974-7fb1-444a-861a-4bdb458eca53@linuxfoundation.org>
Date: Wed, 18 Jun 2025 14:44:32 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: ABI: Fix "diasble" to "disable"
To: Sumanth Gavini <sumanth.gavini@yahoo.com>
Cc: arjan@linux.intel.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux@dominikbrodowski.net, rjw@rjwysocki.net, stern@rowland.harvard.edu
References: <20250523220238.455718-1-sumanth.gavini@yahoo.com>
 <20250611215306.2989590-1-sumanth.gavini@yahoo.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250611215306.2989590-1-sumanth.gavini@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/11/25 15:53, Sumanth Gavini wrote:
> Hi Shuah,
> 
> Just following up on my patch submitted on 2025-05-23 22:02  with subject "[[PATCH v2] docs: ABI: Fix "diasble" to "disable"]".
> 
> Original message: https://lore.kernel.org/all/20250523220238.455718-1-sumanth.gavini@yahoo.com/

> Would you have any feedback on this change? I'd be happy to address any comments or concerns.
> 
> Thank you for your time and consideration.
> 

Sumanth,

I am not the maintainer for this. Hope you have the right
people on the thread to review and accept the patch.

thanks,
-- Shuah

