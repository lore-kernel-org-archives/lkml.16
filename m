Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AED1EF0B9
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749194492; cv=none; b=ei3UMbGzWppeOAsyrlrqhFB+ELj00h+NTv23kwbyJMSbj1+vbeGw+mwucqHV7g2Vn2xl2bkF60rz68geIZv7+2muLS0UFbyi0wr9+PceK6hAQgyoraW9DI8d3okWkN4avWhDKe/2Lx7Tnfpxo6SebaKud172R68VcOzpDjVUA6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749194492; c=relaxed/simple;
	bh=W6aqRYw57nLIh05HMsthjwLVSomTwVgGhQrbgMrbbRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AzOpwBQwre27aoFOm5Ry2Ih8vzA0GWMfvnU39IMWinLtsHe7PJfmxW77wYVr45xpOMPB2HFyKqBdu1Lslrsm2p9iwc7jSRvqZxTYIEwjD+tZ2AWI3ti3zyBoRFzfCnAJSoRS4DuKe8tzdXjO+Nm+2NBAbRGW72iYM+xgRyjL2vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R4Llq0le; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R4Llq0le"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749194490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nWO+Jnfr7sb3bO+bv1vixTUde8+oHiFJjcUZ4U1xv+k=;
	b=R4Llq0leWmfVB0OMdehEOH0VrekW14qqpZc8Ro9CzSDkzALMk4cJWQOZUNTA+57VyMgFkL
	thU+Vl22wrx7rgMsls9jOtOFKOb/oDCm68RmiQxpTCSs2+9UpVpkqQUpr5GHF6vNLNVALq
	O2QmkBaO+VyqfuX45eLrwjJCa8dQGBI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-RNfBnJ-WPpe--FEFVKHBBQ-1; Fri, 06 Jun 2025 03:21:28 -0400
X-MC-Unique: RNfBnJ-WPpe--FEFVKHBBQ-1
X-Mimecast-MFC-AGG-ID: RNfBnJ-WPpe--FEFVKHBBQ_1749194487
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451ac1b43c4so10359815e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 00:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749194487; x=1749799287;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nWO+Jnfr7sb3bO+bv1vixTUde8+oHiFJjcUZ4U1xv+k=;
        b=QrkV+YwzOc30QyciVqQovgzogCyuGEt9Ln8VbzCQ8/lQYvVsWFVst7qvS4SMwj1sU2
         wTu09Tg6zMC3ZtGy77Ea2eIFRyQjFCTlH7GvemHaJQ3hIxdEXnGZFxi5GU9LEl1cj9Ma
         MDmoUelQwm2yeDX02AXf5J+rN6bE5duhay+lk03YIbZ2al1KRJeY9Ih2BT7G7YL+u0nH
         F8WG1aupFIIdjeCYhMx1s2IGwK7oXOtgZkHvf9Sq9Rk1krVa1l++cxfzFCIcv7a5ID03
         im7OE6tsyLBkaCyPeEmzQQkjHbgXyOKFuG4t7iCvDXvPuu78KZSwMZ6F7F6rhsSvichn
         nNQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkFslFdBwYiaKTQD7i3iNuuEBJSLeDP2PIOpiV3MjKy16p8R6c5wVL9tTDGCRkBsPlRvACIYhdmZudYwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhPI8OxP+hDYT694sre1Ko6zx2XLSZX/3ZSXEZLPbWwXjuJPO5
	NkjM7jkv6T4UyqIgKbUmjK+rIgQDlB8Luk9qmd+xHoFKP+CGXN+y5W6XXW/ovBd0/7YJSn5HNGI
	flMWSNQSVW0x89QUARNjRJpAExd69QV1sVsKWvssJh3bGDErJKnIJg31vyNNZeGXQbw==
X-Gm-Gg: ASbGncs3fe4A6soFGe/zl8JBS9g09yfopDcY7ROpbFskJDOLlv9LHtOatEDa7YIleDu
	BG5shUvCzMjPCZVNKbwx+LDxtG60Wz0cHjCWIG/1OBB9JinCJl1hvNnI1yaIYKto6pVuvL5HD92
	pcPSjugrCiiui9AsOcuXM9Ujl0g9TolspAmuj8xG4CqZ0BZN+3h5uOYu8j6e9sH8bGuq2Fdz5GG
	hKa6ys2e5OdI0qqBqwLV0VuNuKPg0qqcAm1w6lNMpgIHlvOxBpIIMUJoLiRn3QHy0GUis//ugbL
	/mQUnyR8clCq1X35Q+ZVj8FokcbbKezoL0SPomD2EiVQaKIs9iI/AA==
X-Received: by 2002:a05:600c:8b08:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-4520141635bmr28557345e9.10.1749194487390;
        Fri, 06 Jun 2025 00:21:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYGBLqLhHoU0eSEvvhOEsyyfoB3fkvfxp6wTH1B94salkTHS+ANrxUABh7PLpFIFo0O5+fUA==
X-Received: by 2002:a05:600c:8b08:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-4520141635bmr28556955e9.10.1749194486956;
        Fri, 06 Jun 2025 00:21:26 -0700 (PDT)
Received: from [192.168.3.141] (p57a1a6a5.dip0.t-ipconnect.de. [87.161.166.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730c7459sm11770115e9.34.2025.06.06.00.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 00:21:26 -0700 (PDT)
Message-ID: <8b68e7f0-46b8-4814-99a2-02f0044cda9c@redhat.com>
Date: Fri, 6 Jun 2025 09:21:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] gup: optimize longterm pin_user_pages() for large
 folio
To: lizhe.67@bytedance.com, akpm@linux-foundation.org, jgg@ziepe.ca,
 jhubbard@nvidia.com, peterx@redhat.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, muchun.song@linux.dev,
 dev.jain@arm.com
References: <20250606023742.58344-1-lizhe.67@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250606023742.58344-1-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>    * Returns the number of collected folios. Return value is always >= 0.
>    */
> @@ -2324,16 +2349,12 @@ static void collect_longterm_unpinnable_folios(
>   		struct list_head *movable_folio_list,
>   		struct pages_or_folios *pofs)
>   {
> -	struct folio *prev_folio = NULL;
>   	bool drain_allow = true;
> -	unsigned long i;
> -
> -	for (i = 0; i < pofs->nr_entries; i++) {
> -		struct folio *folio = pofs_get_folio(pofs, i);
> +	struct folio *folio;
> +	long i = 0;
>   
> -		if (folio == prev_folio)
> -			continue;
> -		prev_folio = folio;
> +	for (folio = pofs_get_folio(pofs, i); folio;
> +		 folio = pofs_next_folio(folio, pofs, &i)) {

Nit: indentation is still off?

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

