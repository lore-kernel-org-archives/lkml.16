Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9321525D903;
	Tue, 20 May 2025 07:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727208; cv=none; b=XBkcy2Gq41jsjcU1E+p1F1q6yasFphMRU8VxdaL4afvAVStSkhA4GlhHKA7sFTMk8KCqjrmQS5jV79Ie+SiZfn1TqcKSwRqxsaudy+bln3RDSf6/NeMoOaLc8CKeEYtjhud1j5IBzsDbNxJWFk+wQJKpd5lln2EySmdUgE7ZKkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727208; c=relaxed/simple;
	bh=Uj8Rwakl4pLf0tsocthLUZvspNbUbQEhu4sA5WtSpXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pd5+yW2HUgCIQ/1CKBs1T09RKtNgMJrnPrbhoaw/Ia71UBHnFkBT9xXzaPEmxkvf13vgka4bAeJJJ0IZGuzyPLgwQ/ROeK+vytlPeBbmtREp4BmjbXEefSsqjzo7GW8gK9BKcfegsbms0ZSkwIeGbpfDQglKNOS/RCt/Bkx854E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T958uu23; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T958uu23"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43edb40f357so43268605e9.0;
        Tue, 20 May 2025 00:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747727205; x=1748332005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kNW4TkZeeCWjVhfm3ciOcqqdFTSooWxtjz/3RSnGwxY=;
        b=T958uu23LbDdb0fHvy/7+n/Oxs2r4v7YNbglnrD40K48XKs1Zg+dlhPlrShKCihCp+
         BjWRFeZpWrHRpd/QJ5fO9acfDCs0/I0SLSLobOpY+Pb6Ja4fIuBecZknqeSdSASaxo4+
         D7l4hwENSCGMKWM+sB1ZcAn+HsXqv5chM12LKvVvXPfyKatLzsME9sUnNRMkzDrLKayu
         3lvMbJFCQmbM7MegrYHgDHHcxgk8/w2CcmkzPXQzlQd1Q/RAsT5shKgquuGdKewgsrWl
         JwH+XpIuUkZ1kEsfiScGs8JtdWGZXmtwlCrxo7qWCAhIrTMA0ZfU3eEnok6GmzkwxNTZ
         UMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747727205; x=1748332005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kNW4TkZeeCWjVhfm3ciOcqqdFTSooWxtjz/3RSnGwxY=;
        b=nypqqqfSnzrlbQQKKOgnRvsvZ28UCXT30qE62rh0611askY4AJgmGryfHG7MsGh0VW
         tljONxFC6LsyN8ilsaz5YzrpomWuVGMkfFHRNOieOaylF1EQ6z7yd2F731WQDt/ta7wS
         gHyykN4ruUeMA9WErwVj89ba9gLzyd0huEYjCclt8OWLrVjL6Rs9/ZqwjPzEz/343B6H
         dhC4w7ZuqPE5FLFEPN6J3jwfSV8el9yedSnUIaL56XBGVKRfx/1Nh3a169EBFg/cI0ta
         2NdIaWjPT8R8YjNQGLKp/dNVFXzFZbA4azPt4Fnn/V1JTDJXD0zhyGmzUqIPjVEoID5Y
         eI+g==
X-Forwarded-Encrypted: i=1; AJvYcCVqklhejoVCMgI9Mj8nX/5R1b6phXpExlQt79AKwiSmRhq6AkdY6hL9ppB1p+XAaFMLYqdOTIrz+jBkvKUJ@vger.kernel.org, AJvYcCVy0yhVUbR5JB/4FIP57mDtMKNMFFkQB8YPBCizRB/THjIboG55NWZiQ/6wJmkf524T7nrSEW7Bnss=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYY30am0IHDfEOg/yCcPibqGKGbSEht1IAhE2MWrFq2+7wYLql
	TAHKcQD4L550Qjw7QEYDNFNf2Y2tz+dQcMkdp/Ccf22Qbv/Wn6hBV+5u
X-Gm-Gg: ASbGncuVvjSW0HqO3eaC6V6QcoHMCAKQ7l0eUptjg+Z4ncZA6ZS9/YdAvDY1pS5NBFX
	NoDlZrwJurzLBL+MBFlnzfaTQw7tHAo0+mgHFX1C1r1iYxbJ9zX2aKaSm9QZwFmOtM+CYMjlFi3
	8vTaaXP6nPxgD3QMeW2blHxrpp74mYnlE2W9Jr0jytZ59dQ6SiBtSZY2GFuZeeDAqSCrIvrVqTk
	xxrwmo9BZRK0AQvbWbXoT/5e8uvSo2tIrAviFEVWiXNJ+x94YateMOe/4zdnvgCr4mZ1Dw9y+ci
	aLQ1BYLkl3ZJ5Lp9im2QZrBuGXp7b/7m5kdwk2qUAhhd6gxAqT9XZymQmx0D5HPevIEAFgAi5l3
	PoKiegTqfFUUgtdVIlP1YkZOPbmZUnY3CXjmMXeZ5F5BxBlw=
X-Google-Smtp-Source: AGHT+IF8qsc5CYbAWGnRPK7fRwL+lFMrtVNDi5wG2ebFMGS6Hcg1rf3LwqtwHzrmlMrxIiK7BoWi1w==
X-Received: by 2002:a05:6000:230a:b0:3a3:64d2:cee2 with SMTP id ffacd0b85a97d-3a364d2d10dmr10450177f8f.45.1747727204669;
        Tue, 20 May 2025 00:46:44 -0700 (PDT)
Received: from ?IPV6:2a02:6b6f:e750:f900:146f:2c4f:d96e:4241? ([2a02:6b6f:e750:f900:146f:2c4f:d96e:4241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d230sm15195365f8f.4.2025.05.20.00.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:46:44 -0700 (PDT)
Message-ID: <28c0a856-c828-4521-bddc-45ee038d0fa7@gmail.com>
Date: Tue, 20 May 2025 08:46:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] prctl: introduce PR_SET/GET_THP_POLICY
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
 linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 riel@surriel.com, ziy@nvidia.com, laoar.shao@gmail.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, vbabka@suse.cz, jannh@google.com,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250519223307.3601786-1-usamaarif642@gmail.com>
 <562293c3-fe6f-448c-a5d7-affb1d622c7d@lucifer.local>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <562293c3-fe6f-448c-a5d7-affb1d622c7d@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 20/05/2025 06:14, Lorenzo Stoakes wrote:
> NACK the whole series.
> 
> Usama - I explicitly said make this an RFC, so we can see what this
> approach _looks like_ to further examine it, to which you agreed. And now
> you've sent it non-RFC. That's not acceptable.
> 
> If you agree to something in review, it's not then optional as to whether
> you do it.

It was a bit late yesterday and I completely forgot to change --subject-prefix="PATCH v3" 
to --subject-prefix="RFC v3". Mistakes happen and I apologize.

I agreed to make it RFC and had full intention of doing that.
Would you like me to resend it with the RFC tag?

Thanks,
Usama
