Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832EF1F03EA
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747121496; cv=none; b=rqi0h3T9/qypgXF4hmLu1P1sJ74CY9yr0a7QhOzr5OPUPxhxnYB48tK47YigHLSpt2ud3BhChikW95h0SzUq51iIiyB8exIOzbXWtWf54VKuNVTvsLAZONl5vre9+QUyeMdqW7LD7lUqNf1xQF2LY4Bsqcj9NvCVmqbrRt1TzA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747121496; c=relaxed/simple;
	bh=9odgTkdLCas6jYuMTaJIc0B6Y2SJdn8562yIGJ420z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KQqNIujmXaBWK3wJXhMkXEdlcir0MsP6oYWMeSQBwIzEiZPBB+/UM3nUBv02bWaj8ZymHh74kc6DNVB40PPrfwjfVwy83L3o9jVVU0KddtFpj8j7oVUUK1rGBoUTTog+wkPL4P/xkDlyXH8c925QZ1gJsDNKtTT7J3UPKmFmQeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=au352SAD; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="au352SAD"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5f4d0da2d2cso10036017a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 00:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747121493; x=1747726293; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pmyTnoNmo8CKChb6T5xGX5uYcPPcN5SMIuL2HmFELKk=;
        b=au352SADxvJQEUsjrHbyA60katGPMe/fM4mgU5c5vezLBAUhLXf2+sJETBo1Ut5CIO
         UKBKZnRgESoGOR/jpbWg3Qa32eMGJXvl3xMmaKE6uuacco0d8tc4mSN3ie6ZSlUoKOsF
         SXvCYN7QMyBj+7E+64C9iskwprYwbeAdId1JC1zdqzLhIRQvL2G+x39NcL2epJbWj9UV
         opf3qyCxyEjYLyTUNmhcDXZrEUv7z3kJtTbOWqSO5jV/HZMODc8gE48V+DJIs1XqDISn
         ncStnTWEsW/1NcuhRwN03dSsox7E4wQl52kgYtZY93eoaz+lIl20FFyNW9h9v+KYkOS+
         /NGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747121493; x=1747726293;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pmyTnoNmo8CKChb6T5xGX5uYcPPcN5SMIuL2HmFELKk=;
        b=wCnHLbWpTXEvLc6QVsxnL0g9zPorKPKYkEIF1ITpRRkfwPS5WC/1h2iCjvYwyXYFoz
         xAAUmdWBTG6NvOYEFr3F3DdFIr/O6iWWJUOU9iHMf3wPuopd6r1Pd/67VQ2xleIm4hY5
         721+96HVh1LAKPFyCumv7QrEdIy9vJ5WNYroFwjN5YgYYglEmR0TY1z/jRN4Ugtp1zlU
         e/JlqDfcgoUIzjuKJKQX5wFnNSmdE0Tv7E2lXhSk4KHTaf7Qy9Elh/fUH+7hECq6xRYF
         pMyfZS/llqecZt7AMfWELHcq+YFk3dFwbYGjcZ2pXGhenZBuovG1hzT1qiw4jHRB1F8E
         AN5w==
X-Gm-Message-State: AOJu0YzKS9Z0WYI8hMWFus/OrpWOi9bfGd6Ety9WW5ulnBW2iynXo/Pn
	D7ZAVAilbudbnwnrcI40LPqgikRF9weAIg3f2+qseklLtooyMk5OheAnO282Ts0=
X-Gm-Gg: ASbGnctr7y3U0TuILAhdHvGSGURwQDjgVvKE9ybMAM3XWr0W7np51IsATlNuN0mjhV/
	W83QEIAvOVqYLBi3KP1IkT9KFFtAeR/SQvnFUdbx4fwQg7FN+StlzU9+F3Pgd4AAgPPCe9ra3MI
	kr43W5gD66n2+pezWzxP+nHcUQGgCZdkQqYpurfQd4yLDeKSn5yYT0BWtULtYCHXeQikfd1FLWW
	t6nMMfRnVrfddvddCblzmmm/XmvgtziP7r1Yjq1PBmvSLEB1seSUqVOLrghc6zTPMREsV6D6hpw
	I8xMolGCv7HnS+6HUF2nKmcUQf9gQx12f5xoZsVnmyDtsVrUQyQ+ECKI5kY=
X-Google-Smtp-Source: AGHT+IHYo5ZWNOMKOctGcx3IT4yhd2NNp54tPQ3YePoiduR8lNWblfaka6Ofu9rG8GuCsbQdjLrzOg==
X-Received: by 2002:a05:6402:510d:b0:5fa:8737:387d with SMTP id 4fb4d7f45d1cf-5fca0759af7mr13997390a12.10.1747121492381;
        Tue, 13 May 2025 00:31:32 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d73fdd0sm6880355a12.81.2025.05.13.00.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 00:31:31 -0700 (PDT)
Message-ID: <899031a3-6946-4cca-b2e7-a6caa9f840c6@tuxon.dev>
Date: Tue, 13 May 2025 10:31:30 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the at91 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250513072951.192e1213@canb.auug.org.au>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250513072951.192e1213@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Stephen,

On 13.05.2025 00:29, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   7f0132d21261 ("ARM: dts: microchip: sama7g54_curiosity: Add fixed-partitions for spi-nor flash")
> 
> is missing a Signed-off-by from its committer.
> 

I fixed it. Thank you for reporting!

Claudiu

