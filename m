Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53971FDA9B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 21:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745529754; cv=none; b=EIF1tBVaGCfIBNwCpR5NVUNuQURi5p4H3wxNAFCnrOyHc1IsesrPzhRpQpKOXobPPV0075fGOFR62ChTZIc6bott9EY86hcFHzhSGxk8/jmoDHQ84Ar+Lwp2ennHAskVgyZAWOGi66BWWRsx12cjuMNj06/Md3eh7CHroBrnTis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745529754; c=relaxed/simple;
	bh=muWdmC64EuR3Qi20vp8Fpd95KItuifO84lMIAK8Tp8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P3urtJT09k5C4MejKM2ylFhzbpPy7dF5AyEqsV15kjX/kxLVO33Yo3lGa7/WGY7jX9ywbdjfmAovf3ZfwvYyiwgCpK62uq59XUII6ec1E3fuYsdhloWTGoY5+pYdRzllhyqhlkRqB2QwJ14TvL2FEJv62Ov8FzdivIFg2HCn7Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eTmcujpt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eTmcujpt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745529751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=d9YviV4Z/8/bRYnSiKAoF3XUKGpSI2ebxPC5ZsuRIKs=;
	b=eTmcujptD4XQIg0k7ebdCugpwrSugdOPFr9dQX/FefE7z/6NpOxkK0kOYhWrs4O9rZAnsn
	dVMYndJODZp9kw02l1GkyYY3stvltwMwkwov7utMqlQaxo7lQKEgcMtbzVeq5WhB/QX9LV
	/Bc93RRpDUcK3MTiw/+QxKl36iVZ7Bc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-02prn3MQP1iZpWnhbcxe2w-1; Thu, 24 Apr 2025 17:22:30 -0400
X-MC-Unique: 02prn3MQP1iZpWnhbcxe2w-1
X-Mimecast-MFC-AGG-ID: 02prn3MQP1iZpWnhbcxe2w_1745529749
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso8475815e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745529749; x=1746134549;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d9YviV4Z/8/bRYnSiKAoF3XUKGpSI2ebxPC5ZsuRIKs=;
        b=uLN1QzCLpNiSD4bJSFaXpSDj3QR2f0EHPQ+eNmudlkTOGG0tnS4xUEV8r7rrtg6AbM
         huy5FYyQnE5MP5WkbzQpsjC5pySCI/ZpPxFHFS06lii5a+vmhoaXBP/WOLejFdg6NZ8t
         XjBUUjBJco1kUcx7TIlZPIXpyZeNx6aFGPPe0D7SkSzYf4UDdpPVpvo/5t9MoIdrhmgL
         4RTyykEQ7HWcpcpcbhHV5Hj7yHPM5vVfIDzUfOb8xuL2DxV4JWZx+vTSZreAiszcXLOC
         rJCotx3gr/7Zzo8ykpeiBhQ/vIioo2HtvR2BgUtvaPiPMKq29HWwo8WzusokR7ZsN8Ie
         GhVw==
X-Forwarded-Encrypted: i=1; AJvYcCUlP6Nkbus+ElGxvIajZhcirt7OwCWEWxq/ZJTYXd8xLSmqspUk4fbYikuSNiabz0UykRDs3OwbWusRN6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB1+1rwLHHKe40zHlVSgsaHFtRJC0IgZh5Ollw59/FWir6vTIp
	tzCL4IxNsQYalCufYuoIM5C+50GTceCMZM1REB0txTwQ+EBqvwR/Hwa4ND+dvtwQHiScZZYHaMe
	SpSucU43viNHNFrQ7zgEA/mgVJSSX6/zfJaw/ZZ+JwPFqzVjinsNNNeG7grkVkA==
X-Gm-Gg: ASbGncuwzM04Cqd5VpZvy8jyHELg6S/Ogwma3hDg2n+U0lcWeWSqzgtn/kIf2qaptPp
	VsW7WJ5s7RAhjgbOEWsy6Pfu/EaZUzng3ek6b9b9raGSgcpB/cGIyI2pq9BeOg6Zc2LTHYjrmuN
	DdMZzGFhKS18XWtzpGsuAX6+Ao9GJilMFZ4O6hZ+MCO6LKTWFEg0iAbhi4O6xL4hasrev2+2SvY
	VF8VraMIAeHQhG6u81PDCHv/3eHYNvKcc0AKBejKiRl8YEpCVnL4+Jau6BG/zYPIETEDaFs0g1Y
	r93png6T8RHf93aypHzNSiTsma0y9ueLgXFFNVx5XnUwpLd817S904X18Ncn3Vdw3GJfNnBRJ/0
	h/Nri7PyIPesidUXtAisvXe0WAztjTTGNbLBa
X-Received: by 2002:a05:600c:350e:b0:43c:efed:732c with SMTP id 5b1f17b1804b1-440a31bf0damr5091245e9.28.1745529748754;
        Thu, 24 Apr 2025 14:22:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlWPsh8zoKaShSLYXX86IuGQxpDTTvCW3Irk3N6jV77sYjou8SjQL624Zhmy+ZfO4KrX7qCQ==
X-Received: by 2002:a05:600c:350e:b0:43c:efed:732c with SMTP id 5b1f17b1804b1-440a31bf0damr5091195e9.28.1745529748356;
        Thu, 24 Apr 2025 14:22:28 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74e:ff00:f734:227:6936:cdab? (p200300cbc74eff00f73402276936cdab.dip0.t-ipconnect.de. [2003:cb:c74e:ff00:f734:227:6936:cdab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5311403sm2029595e9.23.2025.04.24.14.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 14:22:27 -0700 (PDT)
Message-ID: <8ff17bd8-5cdd-49cd-ba71-b60abc1c99f6@redhat.com>
Date: Thu, 24 Apr 2025 23:22:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] mm: perform VMA allocation, freeing, duplication in
 mm
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Kees Cook <kees@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1745528282.git.lorenzo.stoakes@oracle.com>
 <0f848d59f3eea3dd0c0cdc3920644222c40cffe6.1745528282.git.lorenzo.stoakes@oracle.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <0f848d59f3eea3dd0c0cdc3920644222c40cffe6.1745528282.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.04.25 23:15, Lorenzo Stoakes wrote:
> Right now these are performed in kernel/fork.c which is odd and a violation
> of separation of concerns, as well as preventing us from integrating this
> and related logic into userland VMA testing going forward, and perhaps more
> importantly - enabling us to, in a subsequent commit, make VMA
> allocation/freeing a purely internal mm operation.
> 
> There is a fly in the ointment - nommu - mmap.c is not compiled if
> CONFIG_MMU is not set, and there is no sensible place to put these outside
> of that, so we are put in the position of having to duplication some logic
> here.
> 
> This isn't ideal, but since nommu is a niche use-case, already duplicates a
> great deal of mmu logic by its nature and we can eliminate code that is not
> applicable to nommu, it seems a worthwhile trade-off.
> 
> The intent is to move all this logic to vma.c in a subsequent commit,
> rendering VMA allocation, freeing and duplication mm-internal-only and
> userland testable.

I'm pretty sure you tried it, but what's the big blocker to have patch 
#3 first, so we can avoid the temporary move of the code to mmap.c ?

-- 
Cheers,

David / dhildenb

