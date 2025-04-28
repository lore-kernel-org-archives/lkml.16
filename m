Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDFE1DEFD2
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745824950; cv=none; b=GZxl/FPioINtgovi+d2RdILmPCF5TsGECvd5yu6Fr/EI4X+LKkfpkwWv9JZ/V6EE2jP1HGGdqfb+PJC737UNp7oYXrw4yEI3uYeSFDLfuicYZTnCgaEc+b8VHFtiW/E7W4MKxRLMRQ5I2k7ha/YppjwzuPtbDJAW3PIOeTkjFfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745824950; c=relaxed/simple;
	bh=b4XVx6LXFnjdbdnPpPVLu9ECdC5JUQoGf0I4qPvbxpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bgpGFN+oKeP4Cdm5xGyepGhXyK0P39gY3YKfey4C50xzTA98vO8/XnVCoWMgbrp6+Q4kqqcQzEg5xgnGdwluQWOxrMQ4prFboEuTH/wXQZQrbedCBf0s3z8Tz3ZKBGwa636muyNBBADt0YxAQZcMzDmScra235PHIuIiLCY1bVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bLDbJYY+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bLDbJYY+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745824947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2WagxI0lm5850i8YJmTk1tz5+SCUNljPXPbXKayjZfA=;
	b=bLDbJYY+ko+2v7fYD/DtbmCyZSTXGkQ11wtx0q8mSxf9OwabS5b+BkFXtC+UbymXA2I91M
	N75EYu9fIwY1dfNPlFz5ZjkG9x8TyfND9HLPvNPXkVmjhk7ZIr9JZWIzR/s/ebSEjEzoez
	fZfUwDAGNJl0rNoPHTeVjlPCXlX7rPQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-0e8MeTwsNjqXNb-keS4Prw-1; Mon, 28 Apr 2025 03:22:25 -0400
X-MC-Unique: 0e8MeTwsNjqXNb-keS4Prw-1
X-Mimecast-MFC-AGG-ID: 0e8MeTwsNjqXNb-keS4Prw_1745824944
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912e4e2033so1296760f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 00:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745824944; x=1746429744;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2WagxI0lm5850i8YJmTk1tz5+SCUNljPXPbXKayjZfA=;
        b=Kpqv3seNFrlM/uaXsZrM1x12L54sJnYuiOwXxB5BIKXclHKTwWzi9fypNtOPRG2iab
         bLl+YzVSF69OqpfsPIj8TE3PJNW6ntw2QqNISM2be6vyG8BXIWVbnTCmW4IgM3U7yWTa
         ABF1xJhCUa+I2Qr9feWfBdbVkdSpUevU9RfsJYzbZLJWZe7EJQOcTaMnTf4P0OaA9Odc
         r9YIn1GEEd5wvMfnrTwsM6mlxlZgmTqk8iRoTHdtOgGduPoyflM0nekMp6EYFscJ9M9i
         pUQwCcj9vE2edHwF011TOoLddyNe7Schd4ZZIKdNee+7jkxeVshtSXRc7hcipGNSRMED
         fI4Q==
X-Gm-Message-State: AOJu0YyOk55phtuLNplOcz3hEo+DjaK7zFjriiICydQxeULzYFn1YiOy
	KhH7PKpBDI8vnkmShiWGsPz22ljkvt2tz0nJudGzdGXqsCim73povfHu7wUfy8MXlXC4+xE28gR
	RjlGkPmy7gotzW/NVaag9uh3XGNXBUIGjslMgr7T7WJZw5KPQqgIp4DC+CgrdOw==
X-Gm-Gg: ASbGncuL9sZLQOkmOuBOifvWE8AYdK0+4QCXLi+ae+gz+pyHVmT7sjQAb8jxPj9b1db
	wJhcRvLL4eFRXpMt346ktkww4Vli16eQpz0JBroFCIp0FyE8MsIA6awatdqgPt39PXmmONWCxCO
	KFNIehPlti/P9JR4/4ZTPIeYeH5dXR/wE2winqHW4u993Tcoy7scCWZ33LmBCege+2+tsm+HpFv
	S5TCxx8oK0Zl3jXJVs3mzCmsEVQkr/6WEx/QRoPZgq35ATAiFZIMCuQ+xmQu8WcDEtsB4m59P+c
	zQfke8Sw6wveYhwHUxN845NDfOEVuzxOcKWhdoZPmxDRGHE85FOE+sp/ZN/OSsza9kyWmI1BELB
	NjxD6I1RqaR019QRnVcPhiCxJVcbtaS5pQHhFYrs=
X-Received: by 2002:a05:6000:2483:b0:39c:13fd:ea9c with SMTP id ffacd0b85a97d-3a07ab85d86mr5953202f8f.47.1745824944383;
        Mon, 28 Apr 2025 00:22:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfcukaxgvLgOuhmwV2DYrBQgPbDitOQP2Pp1L/RjGE6IH9qQGZC6eyHnpeeAlYeZiIjgq6RQ==
X-Received: by 2002:a05:6000:2483:b0:39c:13fd:ea9c with SMTP id ffacd0b85a97d-3a07ab85d86mr5953175f8f.47.1745824944084;
        Mon, 28 Apr 2025 00:22:24 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea? (p200300cbc72fea002f00e7e58875a0ea.dip0.t-ipconnect.de. [2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e47307sm10347511f8f.65.2025.04.28.00.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 00:22:23 -0700 (PDT)
Message-ID: <4e8a3948-2689-4b7a-afb7-03f4ebebc6b6@redhat.com>
Date: Mon, 28 Apr 2025 09:22:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mm/numa: remove unnecessary local variable in
 alloc_node_data()
To: Ye Liu <ye.liu@linux.dev>, akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rppt@kernel.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, harry.yoo@oracle.com,
 riel@surriel.com, vbabka@suse.cz, liuye@kylinos.cn
References: <20250427100442.958352-1-ye.liu@linux.dev>
 <20250427100442.958352-4-ye.liu@linux.dev>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250427100442.958352-4-ye.liu@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.04.25 12:04, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> The temporary local variable 'nd' is redundant. Directly assign the
> virtual address to node_data[nid] to simplify the code.
> 
> No functional change.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

