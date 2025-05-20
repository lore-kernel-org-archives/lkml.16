Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D9F2750FD
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747761814; cv=none; b=ZioVkU84o0dG792OZKRCyCZZWYqD0AgoypPpdp+Upz5p2iuchsEgcfTdDqBy5uKW4EZWEKcZRQqHo/c596lJSNFYGIPPjEZw6dTXsB95aqJT4ebOMarqbWTT6cTlMPfKud+S5tzMUaQ+xBSuMM7dNksKh6XHP0t+PlV37osDZck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747761814; c=relaxed/simple;
	bh=NRca4Y6qu8nkewkPpvHf2xhhqHItqPfzv6QrsEkL/MU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QsctdBqV7SP2EhPtAQnt/7KhBpwYS6pFl1XQesna2zqUVk0GxrD0bmWsJ+rXxxN4fnq3ktCejeuexuSvLKvCUi6riWFg23bp+b/5U2J9QCdyOROp3NufB3ijJjUC+QgcwBnXRVqlFvzLEzKC7SaHkM1xFeR62T8nrG6ec3CDx9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pY4/4ioT; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pY4/4ioT"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a3798794d3so916740f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747761810; x=1748366610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/sRfxl2+2t5SPJHNc4iAAcwkRcbLLz8+Z7hZmgE/IE=;
        b=pY4/4ioTyYfgvso78Rx5Wd3sIt93kiHeTvngs+e/X8o0nJ6zc4lUrHgyw3lTkWc8wf
         ppcRp51srN+adNYLMiXFx8ts07fzQP6BpSnv+1CwL+YIXJvp1/TZnAhitJQrVgoZrvsC
         ABTkGFp3oY8AtiSPN3LuGk0Gb9Q9mSzzpFGPfVV051zX67aJryT6Ah2paRqzG9G+R34z
         YDfFSNlgcuAxOAQkHz/2jSRzz72FQuUGPLtGGv8y2HkiWbrgo403/B8SqpDAp/bvIYRI
         c3j26fhMlXH2a6PoyVtBMNSKP7jPOYJh/Lj0am7w6KFO0rs80tDaQmOa0iGopmCG4yJt
         86Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747761810; x=1748366610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/sRfxl2+2t5SPJHNc4iAAcwkRcbLLz8+Z7hZmgE/IE=;
        b=J/X7EWYrFuEyR8frkyFh90rSm9/XTPB8NtqRfZAYZyRKhQjdbi0k8FgRLtVEVcRLe3
         BUcH9iAluhorYWUrSBDZAKPjInSfrn0XCR0xyAbwHcRd8aC6y+MS9byZOW7X1Rip6qZw
         Uh6g3aKzcMSqR55mCoxlB6iKuD01mwYID8RmZhOMrs8goUWeceiXq6cLeh+yj7L4Y8R5
         ExVk2qii25yxS8CCP0cwfrQDEAnUmC10MChhpGTU9W9W3XYgBYh4/NHOlyVsBdIv3jPE
         pPsvDM1tTRtq8s1pBWS9UbAx4RGwIba1svFTQ5RKqqyusEp0KQCytDCr1Tmv96gLWrhe
         SAtQ==
X-Gm-Message-State: AOJu0Yy91g2od95zdxXsYoc8S8azy7DyWJT+XGE9P7PDDcqm1wZj17Sk
	Be6scdVVUK2YjLkdPlaobRZoFmMLTcZvcs/lSiZdG84iXyiEKnVJTqEbJWsx8SD16YQ=
X-Gm-Gg: ASbGncuzqB+kM6PsoBEi/QAxkEJgHmKSt/afU2V9mIF+o+YNfw6RJsI3Cple3BTDduM
	5soK9IULE7T+U7h0LtIr+nl/oyUwIN326rOpc7+DZfxt/OyXT0vWW8o8TSLxxGl2M0IVSgGf8z1
	XLgE8jOl7PeWa23vEjtxUCC2o0uFufsbYY9G6JhFqZGtTKC7lO9t327TddllPBaMuwUaZXVSIR1
	RPTI0P/GMkiQ0mlzP5Nph65ULTxbXdrJ6AMNybGG9IQycfW8h3a5Nz8c1sfPnVI5oAPKtVDZ2UC
	wlMBIae/N+eQ+U7fDh9OaWjGd07X3ICI9f0pyUtMltdOdgg9nipltjlom0kqiLjyT9twFrFL7NB
	gBTq7EBsoiSI2a3sz7giN/XnWnw==
X-Google-Smtp-Source: AGHT+IGwCCZ8Sg9DBlCN84G63Xe7YsdRmlSqvWxSOiYJVHsSz0HNbKBDVzoRJjBywJlpUwr+vVAOYw==
X-Received: by 2002:a05:6000:18a7:b0:3a3:6af1:cc92 with SMTP id ffacd0b85a97d-3a36af1cdafmr10489267f8f.7.1747761809843;
        Tue, 20 May 2025 10:23:29 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a35ca62b10sm16831581f8f.45.2025.05.20.10.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 10:23:29 -0700 (PDT)
Message-ID: <3f2c15b3-1daa-4386-a6a1-1d05c33d58d8@linaro.org>
Date: Tue, 20 May 2025 19:23:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: error trying to fetch the clockevents tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250429082047.4af75695@canb.auug.org.au>
 <db7fce1c-c051-41d9-9cf1-ef015b0f7fb4@linaro.org>
 <ba3ff719-ce60-4c0f-a215-fa332b614b82@linaro.org>
 <20250515221042.7471ffc9@canb.auug.org.au>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250515221042.7471ffc9@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Stephen,

On 15/05/2025 14:10, Stephen Rothwell wrote:
> Hi Daniel,
> 
> On Thu, 15 May 2025 11:20:01 +0200 Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>>
>> I had no time yet to migrate the git tree to kernel.org but the
>> servers seem to work correctly now.
>>
>> Is it possible to enable back the tree so its content gets some round
>> in linux-next before the PR ?
> 
> Restored from tomorrow.
> 
> Just to make sure - this is still
> 
> https://git.linaro.org/people/daniel.lezcano/linux.git#timers/drivers/next

I migrated the repo to kernel.org:

https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano/linux.git#imers/drivers/next

Is it possible to update?

Thanks in advance

   -- Daniel


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
