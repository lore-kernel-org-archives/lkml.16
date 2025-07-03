Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03B222D78F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751541072; cv=none; b=NBG6wTWYlIn/tLs+FaNtdkaYlgBc+JAvw6aJ/ErhIP/0I5KRvYpNAStHkYvwgC04fGB74nMQT66G7CkMS6JL888+AFcMvTHzkSF+Bhx+H/yZDU1Qg0QVakDeLR5GZ5F7HyQWHY5SKrJOAI11P4zKzS4f40EICcXhlISIgorOyak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751541072; c=relaxed/simple;
	bh=vWopf8X84Xqvue/Ns7F+Q9BZl2+qxJS+VN4rYuWUB14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ItQJx1RIf6mLF5SngYHz1tv4eKpFa6KMGdS87Q06xZhqYx+wLqNMHNtXG3+4tpiYEWBxu/QG+J2BEz3eCY8jvqL8smXkYbask8IwaziXpfzFxnv5LwESV8b2UPPjS2i6rPZKFkOAz61+QG9INihqFk/TxBrL3W+rPiCo5QDrrzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NPEgGaHo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NPEgGaHo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751541066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dqWDM8HuRe6WVtvPOwNZVJu5PlIdXiHOHa67ROduVYc=;
	b=NPEgGaHoBKSRaRSI9prUCLhLColpm71bCCHrv9BYmsXghr/zEGuwvTy8uKGjieIqS6jZgM
	7mo9TxAJlBn8qoq1P13fW7FEXR3cRRmYKAkw816hfK2S241oMSfb64lld+jJpnw9LK7VSW
	daiU6ViPTtAwpbXk3OP9vnOBStXd0iQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360--DLKCMnHPa2qoSQy7184ag-1; Thu, 03 Jul 2025 07:11:04 -0400
X-MC-Unique: -DLKCMnHPa2qoSQy7184ag-1
X-Mimecast-MFC-AGG-ID: -DLKCMnHPa2qoSQy7184ag_1751541064
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ae0c11adcd2so396097866b.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 04:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751541063; x=1752145863;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dqWDM8HuRe6WVtvPOwNZVJu5PlIdXiHOHa67ROduVYc=;
        b=sRy1cIA44R7jczNrWacHLntG0EGsADsNkvqmJ1dxFJUB8sjWGPX03uEag+oXW1ojqD
         D9oQsLJnVQHqLqTN9wVLcKQwQImhUsC4XHf92pRJoF4YTAOIEda92/gosYDAKxcjrYSv
         Zy1ByTyoLtqcHHyvU3trXcU1R2I/k/prNUOGb5++0ZMBnLd/3SxuyvDb7oN3TbRPTlDo
         0NiBvdk16ZPwqG5gZqLw59aYB4wcxhKFIlpTO5dl7MEaQKfwTtlAeiXB+E1FjsSxsF/U
         b/iTcWzfL8ZNh+Tev9GfvxvgRkua3dFw/l8rBGZFBhDdl8U3rTVYFQpO5Y9nV07tXH2j
         wXJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj0a91EHC99jNAuoD8P8IJWxQ6RZiu6ePxudmfPz9V29vJQraG1JwRWfPu1fKe8fnSZa5SdgWM0TPnPHw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxttPZUuTCcHDZsZrOCoNAB05cKkD8peH2NmaB2uX/5tyl3O3og
	N9CoDz31iROGHGfnwI0aR9+oZM5KYuWgvzHd2hNtDxcF0gziHin/uR2xTZvlDbWhZ7+rv2uJFTT
	FW8BWp2GotL6XUfGwHAUxZNdv5bGD/dqY56D8NJKP/0pL9mVSr+GYZXzR7071SrijSxbdsQMEbq
	Ak
X-Gm-Gg: ASbGncuseJSXEgFZsoRZG7jx86AqMIdBiNIacbxcOc0Xx9h537maxxIKF0k8FYEZFLV
	IS4ASHQFuozJ0MQmdOURAmco2Ecd0Nsz5jwdasl7SiJChkhe+1QBlj2UIiYCFQZlwqq0WX+VY+E
	Ocgtvf2avfZzuNeNBYyL6Ad8wEEYoyj8wZsfxmmXuNy9PHo6KPM8kuVn2YMh9R5bRGjn2KKEBxS
	dKpr/BTLC7ArVfR35ypdGlATKhV9AnlWa7Yx+77cFjmpR0h8qAifDIGoLeA3/KfhYGgmvjpwSNQ
	AhlfgFkabnrJx3jrGaSaud0838PCHby63p018eYQ8bpD
X-Received: by 2002:a17:906:448:b0:ae0:c539:b866 with SMTP id a640c23a62f3a-ae3c2c1fca2mr487614866b.41.1751541063493;
        Thu, 03 Jul 2025 04:11:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO9CYhgq3MN8e/Xq4P5GSegfdv/eD2fCMxOQufipBZUS/FuGcOzvNe85m74Gf91f+9ngukZw==
X-Received: by 2002:a17:906:448:b0:ae0:c539:b866 with SMTP id a640c23a62f3a-ae3c2c1fca2mr487611966b.41.1751541062930;
        Thu, 03 Jul 2025 04:11:02 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c011desm1250140166b.101.2025.07.03.04.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 04:11:02 -0700 (PDT)
Message-ID: <1833a057-9219-417c-935b-a1956a066813@redhat.com>
Date: Thu, 3 Jul 2025 13:11:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] cma: move __cma_declare_contiguous_nid() before its
 usage
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Oscar Salvador <osalvador@suse.de>, Pratyush Yadav <ptyadav@amazon.de>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250702173605.2198924-1-rppt@kernel.org>
 <20250702173605.2198924-2-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250702173605.2198924-2-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.07.25 19:36, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> and kill static declaration
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

