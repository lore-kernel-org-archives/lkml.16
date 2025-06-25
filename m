Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2217C1FDA97
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750837797; cv=none; b=oEJs8QpT7Ohrh+5isDIpfSX6hfs5f7/fanqKd8zz7FBidK8zR3/vEgh+2Y42/U5FIWX6vpwmoXWIDxwTP8O6B3r4bSLdL5oqiiMAx3JoRvzB7DuVY0BXi0e/liebXRWScnrYEj91sBOGP0RSMPZgWHuGv9RpbOBQxtaRh84Cazw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750837797; c=relaxed/simple;
	bh=U058TmucW467CIPGTQLYVjSvi8CBhMEqd8iQnAXc4cA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RhUyivfMm4oeGBmlz1+hTTMACCeNHqeoasm7PR0EQcRBmSdG+ADRNsAbdLK2oJBQ6+qchgOUlsaxWKmExUb5n10bNVMMjvNBjFfHNUG0HCF9+66pVpwzvw+cNHUdG6eJmQ02pSxp6aQDdhfSF235Gs6CmeEPliAqYd7YslO2ybc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MdiNYN6V; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MdiNYN6V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750837794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kGixZPpzPv4BsuRWQBg8fJueLXpVSyx8vOiBNyCMzic=;
	b=MdiNYN6VFvNIJA7Nle0mfn55eP729YSOJv/24BOLtCJlM1p/aX80Na0pCno26ZA7WhxcjO
	whoOF+sFdoYn+zCVT2Zy7zulodZ+lS7FtaunABic232upXzDyGlxsSTlbXvMqCXvIXsr3P
	TGTufCeS0bnjGW7k9FmCOvo2jQHgtHE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-Ye57RNlzMtubSP-L564_kg-1; Wed, 25 Jun 2025 03:49:51 -0400
X-MC-Unique: Ye57RNlzMtubSP-L564_kg-1
X-Mimecast-MFC-AGG-ID: Ye57RNlzMtubSP-L564_kg_1750837790
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4537f56ab74so7810665e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 00:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750837790; x=1751442590;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kGixZPpzPv4BsuRWQBg8fJueLXpVSyx8vOiBNyCMzic=;
        b=mdjCPmbG17UdULqs9W4tW1jrgf122dvlIJQy7i7IuWhoezUz0tT27hmMvHanBKakfb
         RYr3wwAfKc33RPeiTdQLQKg+/EV7V2rgO+Nf61MzNL9WsKGeF96sLImoyEmi/1z/LfOi
         6ocqKQCMx1vVYc/ZcoRyPXNb0Y90bcBYpEmSJC6v4uDiHkn/fODsDnPbYkQ3x2ORk8Kz
         vEgVHjUMrvJvEV7BBhz5IgBA+o+CpOyPqQCayEE53Fn6zy+CbhxFHkIZrJvq5BzNWqRQ
         TXTpd68Q4uaDBCShZeJfdjPSdiqfpiOiL3npyYsGq/NCZ4ax2L3MsidEJUsxsLvGVz3I
         qPUA==
X-Forwarded-Encrypted: i=1; AJvYcCU0qi9Q4FgES9Ko8pk86NeImGRl+KUJS/xzuZTTwYZ42LaIUgvAUtIkpndTqrzdzEN7DOM4XaBz+cY6CkY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4wb5ynNhGG93pGLLFIbHHq8kfoum+NHFJi80w8IWvxT6fpYZR
	qd1vgMMADJc6BxC3Mx5E2uzyx+N2mzRAuu11Y0pkplRubFRvCzJPO3oxmmcy4oC1MLLqYpgAsUV
	nuqSUt868CfUXdTl5DBriwJenZngZxF9u2MJvqRPgtxqbRyYrxybYazNAnHCGVYMQLA==
X-Gm-Gg: ASbGncuynb9c/P4evTE2TxvW+KrRxe/5nRxaWRfBRkA+9zAi4PeRFCNoHjbKQW7JNl8
	UdGLbsNrFu8ggN4kL4HU5KNANboedNjIcZO7r7kCAWukxTVTGGIxJ9dwXYA10e8d5BWA7JYIGbA
	56KLgY03uQsX/IRzmBDSYHHkUiNtTB+2AUZaFRzs9AZtR3EXJnSLluTUXN8MWn4YGMWyCvPkKPK
	0CF6vPghragb57bcH/s5mW3rUcy5OXqz8X3Ux9X21olOj9tzpJ2dcA0BTCA7pm+sEJ3iyhB7NFc
	7wbDbvaq2lU2Jv0aCnz9DUNDSL/yAc1p9ykBOZ6++9qrmAp8QPhOxNjZ3IOA+fxOkuUy5qxEYtu
	55NRYsSxuduwgcVWHb97G9jsBJX9BKzo4louRQj70t9G7
X-Received: by 2002:a05:600c:3b8f:b0:442:ccfa:18c with SMTP id 5b1f17b1804b1-45381af708cmr13362895e9.32.1750837790463;
        Wed, 25 Jun 2025 00:49:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlE7eMqdpvJZlkMClhWV+KDKQOyxwsPw8BHKNGpQg+xhjl6vjSuny+eoH7e6E2dweacOpbnA==
X-Received: by 2002:a05:600c:3b8f:b0:442:ccfa:18c with SMTP id 5b1f17b1804b1-45381af708cmr13362625e9.32.1750837790086;
        Wed, 25 Jun 2025 00:49:50 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80fed75sm3939229f8f.66.2025.06.25.00.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 00:49:49 -0700 (PDT)
Message-ID: <6bda0de6-1ade-40c9-aa52-16bc02d98bee@redhat.com>
Date: Wed, 25 Jun 2025 09:49:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 ziy@nvidia.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 zokeefe@google.com, shy828301@gmail.com, usamaarif642@gmail.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
 <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
 <9cb94544-f65a-4394-b1e2-bfb226ead31c@redhat.com>
 <db757c1f-8666-4a73-ab57-cce83059e95d@lucifer.local>
 <8691d74b-67ee-4e26-81ac-f6bf1725361e@redhat.com>
 <3b6db0c3-aef3-4a21-a154-6aafd639dbc7@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <3b6db0c3-aef3-4a21-a154-6aafd639dbc7@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.06.25 09:42, Lorenzo Stoakes wrote:
> On Wed, Jun 25, 2025 at 09:36:53AM +0200, David Hildenbrand wrote:
>> On 25.06.25 09:30, Lorenzo Stoakes wrote:
>>> I _guarantee_ you that's what nearly everybody except a handful of people will
>>> expect.
>>
>> I know, See my other mail, the problem is rather if there is no somebody
>> relying on never+MADV_COLLAPSE from doing the MADV_COLLAPSE-documented
>> thing.
>>
>> It's a mess.
> 
> Well now we have an almost philosophical debate - we have different sets of
> users, 99% of whom believe the uAPI is X, and 1% of whom believe it is Y.
> 
> Now what is the uAPI? What is 'breaking userspace'? :)

Yeah, that's why I mentioned that I think we broke "something" when we 
changed the semantics. But that breakage probably only affects real 
corner cases (debugging, customer workarounds).

I think the whole use case of using MADV_COLLAPSE to completely control 
THP allocation in a system is otherwise pretty hard to achieve, if there 
is no other way to tame THP allocation through page faults+khugepaged.

Mess.

-- 
Cheers,

David / dhildenb

