Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A065194C86
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744703609; cv=none; b=rREVA+nHi0Of78xU+haZaariAf2+jnX7hcKTvxw+ujC1t2nC1JUcohUc8UakxkVlmibjtoYW3mBPCJwdkNQ9ntXNAzMDhDU0Xmphlzc+JQEs6HtBD2h48FGVKVjv7AGNoBnIbZUpo3oh43MqmJtxCoWO+Pj0DYsURLjdcrs4/W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744703609; c=relaxed/simple;
	bh=4K3kFwS9hUyXM4FTt1c2JnYRLkatUVXzahiE1vTKZTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oYa7T28HcnvOsrttaPqcujO+hChs29CQF0QSWsmw+Kqs+Dx5GOuo/mtVgtpRrORNFksan9u/fGaWJZ5bf6+qJBW9mUjBMafJ+GObKhxGkg7/iApJigp5SAhfFQxmwIHN0vB9N8ZBfFk1TM1nNRoxlZKm5+ERvkM/mV5Jm6EruAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QUFMHhjH; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QUFMHhjH"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c2688619bso3372401f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744703605; x=1745308405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ro9pHSpJkoRpN2e8zw9hSOtN+i7rv9c4imw6NOQfm94=;
        b=QUFMHhjH8kRpbWunp5GKvYvqPL4+AfjeieEb1sorNHNHKaWoKKT4NUe7qkNULJ54j0
         KOGYVZM7Tol4m9TA5JyvDHMiosNPygmHQgomJuI/gQSc1HLjEZCg4OsvA+CwZV/lei0M
         u+0aoSNz6r8BVLGDw8nNDNM8aXUWcg6rVNxzk0yQ2WZ5h43k4XIc3suXmq0hvuDRFz6B
         slsalKKsa4UzIsmxgTv/pd32EaXbtONJesqkD9w+GVWH0BvK8HtELsAINcgTtgkTgEf6
         TPML1u2I4w+zgu0Ou6n7UU6IoyppWKi+z+HinQY7Vrr8OWIWGR5I7/fZ2h8bu+mwCd/k
         FmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744703605; x=1745308405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ro9pHSpJkoRpN2e8zw9hSOtN+i7rv9c4imw6NOQfm94=;
        b=vFECELQJEs4fZhCN1DMFXL1rsGqgLNPvAdmeiLbtJXnQwtCPj30bwLKKzWRtLYEmly
         G+WfJIRi3fVhMPfjYAgEArwJGvjSuIHn2bXp9KalkK6b75mE22lVsySftCSi9pa8Plj+
         QCRn+qEYMstXhAhhzdFcQ9aznyTMWB1xGrAY1P84gTOy7vETRcKBEZdKYqKxQI5taPcH
         2JaTpedDna2dSoRM9/DH743tt2GKPMDW4FUJvIMjNTocmb8N3ZEz64JejswdPK3pI0F5
         nYZqVP7Bdh05DDwzNs52CQupZs0xrnW8YwhhZ+li01E/PlfVDeP6mSyUlQ1D1dAljozr
         m04g==
X-Forwarded-Encrypted: i=1; AJvYcCWJgn+Up84Yp/DpGxPu3iZRWDvdv/ynylnJn5EyNsQ9bY2QdI0bEaZ4mj48uxyZaSPvr+dHQtstrb0TjmE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxChbXoDWkd4hL+XreheONHdGS9nzliEfqtoqLhIei+yh4xBtWi
	evyRc2n8gfcHW7KCegIJcrUyZs6KlxNAu1IvlniupOJOqjPrnL7cLIteC1EMJjk=
X-Gm-Gg: ASbGncsqrns91OCBd8aC0tIzEFSp1BAb3m0qMnHKsQZ6xl0au6k15NVQZAIOuhoho9P
	pKfB2FmYjOji8E9pQ40YNHivC20m9xo/UBPr5sZy+Se1IBTlUuoQdv2TizzvKRtmvwISHalpMx2
	OrmS3whXkEGI/Qxp0hNDAb/XcW129NcbO++C/K2pHuw6HsqPDG7CQ0Kguap9a6X9D2SXgvUKt0d
	ehwCCHdjEOkbDNF1F6gFR8u/itiA0gXguYzs0Bm5a3/LouDPaaoHFkQeNjv6Hsy7/yuaZNlXCKs
	IqTHosZ6j2+1Ch4oqqeltzNBudkzzM7bYEqjJ9SFM0vDtwLDl2I2JFfUr7TAsY6Fn6exfIgGd3g
	zmOKIntQ=
X-Google-Smtp-Source: AGHT+IHwM+oeH60tYH2OAqa4ttZvCY3BIBINaIjjhkGQM9HX/tC100BQkh1JLZkmS7w4Ha9sT45VRQ==
X-Received: by 2002:a05:6000:381:b0:394:d0c3:da5e with SMTP id ffacd0b85a97d-39eaaecdb15mr10666721f8f.47.1744703605584;
        Tue, 15 Apr 2025 00:53:25 -0700 (PDT)
Received: from ?IPV6:2001:a61:1347:dc01:8d18:6d08:b5ca:6f00? ([2001:a61:1347:dc01:8d18:6d08:b5ca:6f00])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf447914sm13317740f8f.97.2025.04.15.00.53.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 00:53:25 -0700 (PDT)
Message-ID: <522b3049-8e7f-41d4-a811-3385992a4d46@suse.com>
Date: Tue, 15 Apr 2025 09:53:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: core: warn if a GFP zone flag is passed to
 hcd_buffer_alloc()
To: Petr Tesarik <ptesarik@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250320154733.392410-1-ptesarik@suse.com>
 <20250325134000.575794-1-ptesarik@suse.com>
 <2025041110-starch-abroad-5311@gregkh> <20250414090216.596ebd11@mordecai>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250414090216.596ebd11@mordecai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.04.25 09:02, Petr Tesarik wrote:

Hi,
  
> That's the point. AFAICS there are _no_ in-tree callers that would pass
> GFP_DMA or GFP_DMA32 to hcd_buffer_alloc(), directly or indirectly. But
> nobody should be tempted to add the flag, because I cannot imagine how
> that would ever be the right thing to do.

You do not dream about putting USB onto PCMCIA over Thunderbolt?

> I can change it back to mem_flags &= ~GFP_ZONEMASK to fix it silently;
> I simply thought that driver authors may appreciate a warning that
> they're trying to do something silly.

People rarely appreciate warnings. I think we should limit them
to cases where something goes wrong or something unexpected happens.

> Whatever works for you, but please keep in mind that there seems to be
> agreement among mm people that DMA and DMA32 zones should be removed
> from the kernel eventually.

Well, if somebody finds a legitimate use case for these flags, the mm
people should deal with it. They are likelier to find a good solution than
all driver writers being forced into finding individual solutions.

	Regards
		Oliver

