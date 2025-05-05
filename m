Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFFB7D3F4
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 06:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746425229; cv=none; b=RbFcRzIBpVWrYKJBIDCmVmtfi5uE/q6Lc6gkEUQ/NIAnZsrT+Nh9gPsi/1DD2LZB2I4/J/KrosevGXZimVyLb4n/RTWnuVH6K4FdHTUecGtG0ZDozxYqDmgFww/fhfLn3TAK2Y9aFNg4RRWRoo7L1d+1G6ouDgdlxWK8mjcTOFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746425229; c=relaxed/simple;
	bh=r97ODS01jVS5UqiDBxvN4knjSEmTW/O5p+2kvMl3Ugw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jf9XFlkQt03opLjSOpORS6LPfiKGbKkhh1uV/PqKWP8LspVhoBptq47CfmJQtretaVFlH1XflBoBFXHWhA0GQWjgI1dDomxwWV63Fkx2W6ykuc8LmmnuF4WQ/aE5Lz36UyDolss/33uMe8jXcUN7RK9hwr98h7MpK5DYQEK/N5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNgoWXTx; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNgoWXTx"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5499614d3d2so2759258e87.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 23:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746425225; x=1747030025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B8V9Ps7jbE8jnuxPOFs9R/dg2Of18jnvqrS5Md17ya8=;
        b=ZNgoWXTxj/7lpcaU6Dod03BsJPGQZ30uolGr5ay7jCjCvEgHxLuOy0J7q47PJIyEIm
         XnjtbXJ0YsMVU9/1eb0rRFdKxFBft4hPvD6m74thXOj+fvi62xotAYeqDzy2PNrPjVxO
         o95s6BWhLvMsXGy+7hYGHgKvJT/zen3zr0qj3lg/8TZKlRqgjTgdcF1ZzI1jwffZpGfX
         f5GVzob5O8Ee8l5LLTzm9WY3zCVHU+lYvAHt1d3UnCTzceNTOSY7vfPcCuWmY1ZO6nQe
         5UA8XOO3zIBxT+FdZK/NTkpxji+lHwB88mShjnNcoa619WIE/zH/JkpvbguZnBEWZ/iK
         W/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746425225; x=1747030025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B8V9Ps7jbE8jnuxPOFs9R/dg2Of18jnvqrS5Md17ya8=;
        b=TMdIkAHaAiv5LNGX6shYQXReNrdMVJQ55dRvFKTPLtkgLtRnqX/Ebhuqk1/TVh/ZkZ
         sR++APYJ757Syev9khG8LJu5sQYxOekdsfZMvuY5f39AkLZfQKbvSAcdccaAZ7e6MhNY
         xIDZk9NchREooyM71Wk/6IkGwf1z3c1dJM7OXf7QupADJpqcFzFvs5CpDXnhC95/o8DW
         4gIPmNC7wfiP/rvVCSVQTjbApXkT0hxxjlqL3u1ZYbj0EDGLQIz3xQj9mmkBDowL6UdM
         SDZplcdPn+QVB5n+ESlnhHHz/eDBF/nKInXZ+VumyENmn/KMtumQItxDkywg/5teXXh5
         Y+AQ==
X-Forwarded-Encrypted: i=1; AJvYcCX614AGWZZ8GRUZIpDRUjaAB+W3gS0WZ86vgNGwnPlwi6aC8vyw1zvbsYyith5wVeyomTi76bM/Nr8Tgnc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn6HsjxJcJDKa80IadRbSFnE9eRqk5JMU42OXR/hNCwohW10MD
	YrUnNSXin6ynTXSHzwHlAYFE0rfGo+NLKC0TFOsIWBUg2e0mu1FY
X-Gm-Gg: ASbGncvS3fVkkM09AgaBqAM9vV0/fmXa7SV2ZsyEhK2UTeLmviqphxGelsTaFp1NxwZ
	AfUfRj1z7+pWRX5vjcfoQYFDtUdrkqmfRMI1mREpSMLg36vfGJleOYQg7S85t7E9DffbaQICTYq
	Pt/ShnguZ1UaAqX2Jaa2YnmH3x/h0o8y6RntvD0PaJbKMqh6hBusWtO57md2q9fvI1ddK4oob1w
	Q1flAz3zMwh3DjLL+H1qUpEGAdyrWwrclWYQyKfiR8xjl61CPLpFP/DxABXbMb539a6PTi1G6Cd
	hCEIdOGqhfl/avXLnte6LAe8/oO1QVt6FW/dFINLvkBVUU1JJ5AFGMHlTcR/kV10DNq2e3lf5G6
	2WOqvPNfAfuj/pH463/B1/g==
X-Google-Smtp-Source: AGHT+IEXgScT+SssJhKZFpa5RXpCB5kBlcWBgYhkA0StnKa71bD6adtx3oWN3VX9qxU3sGniNQHo/Q==
X-Received: by 2002:a05:6512:3c82:b0:545:381:70a with SMTP id 2adb3069b0e04-54f9efbe839mr1449032e87.15.1746425225242;
        Sun, 04 May 2025 23:07:05 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f6efbsm1599163e87.256.2025.05.04.23.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 23:07:04 -0700 (PDT)
Message-ID: <54f3b79a-38d2-4760-ba1a-125172142255@gmail.com>
Date: Mon, 5 May 2025 09:07:03 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator: bd718x7: Ensure SNVS power state is used as
 requested
To: Esben Haabendal <esben@geanix.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20250501-bd718x7-snvs-reset-v1-1-1fcc7088200e@geanix.com>
 <j3M49vfoxys9iFGLs2PwAULHoQsSQsHAKmaT1D2QCwyjUJNzjxXKESFYkXasW3_3owOakk-tXosNLIgfnMC6vQ==@protonmail.internalid>
 <52221c62-689c-44d2-b65d-07a5301090b3@gmail.com> <87tt638q7t.fsf@geanix.com>
 <6JY6cJAFrLw-8XD2zgLh0lxzqzEVtz-49qgct8PAirT1ik1BU1glEyOJJg8lgYnivBWFz1vi7-faSRX_yCgmrQ==@protonmail.internalid>
 <2996270f-d03e-45f7-9b6b-c5675c39515b@gmail.com> <87ikmi82ut.fsf@geanix.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <87ikmi82ut.fsf@geanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/05/2025 12:23, Esben Haabendal wrote:
> 
> What do you think, should we leave it in the current state, or can we
> figure out a way to allow the driver to actively change the watchdog
> reset to go to SNVS power state?

I can't really think of a safe way other than adding a new property.

The IC is oldish, and AFACS, quite widely used. People seem to have 
found a way to make it work without (in-tree) feature for changing the 
reset target to the SNVS. I wouldn't try to implement this unless we 
have a use-case really requiring it. So, I'd suggest you to do it in 
boot. Still, if you have a valid case for this to be done in the driver 
- then I have no reason to object adding a new binding + support in the 
driver.

Yours,
	-- Matti
