Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C626C43AA9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751638903; cv=none; b=CpDT8s3vjEuNwraQxOOC19+uu3D9gpl12oIqll+najXPvg9oSZEDljC07SXb0qSC179yj/gOT7pCgRIKOnKCzrAW6XB23n9tusv+hFAJy/MTCwIIz0rhj50mVhy51GdqofpXM9qhFIp4Do19WBbRH/J1pYzQCbu93S30Vjj3vaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751638903; c=relaxed/simple;
	bh=7a+ss5z2H1PACvQvOzGjL42rkbRSa3BKTjFx3IT1474=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJ/sYasJtkse0j0bwnbVbNVwrw1Y4BIPamh0nvjz4TNuYgIs72Wf+80kk+pNKOewSQYCTdTxFoxSmdw6S/qvwiBr1zSpQNfyGx8dTtQdL1gQ8jHZwWUjp+1SXfL0Y12QY4oYLaC6crAwYlQnRtguWK0NIJfdQNb/sMEpdjgMosU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V08qVKZA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V08qVKZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751638901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=P3nUdgGFNjpsPhESYpIfcTM9v3h7I05W5rObH4a7I48=;
	b=V08qVKZA55Nc2M0LthaBHzOhQ+SBtnWIplswxJibvIYjlawK7bOxDaDHKCoDBTq/e+Qoxb
	r/Tm1sh1m4xQg5eOdQYgs4FP+Grwex7CrJS4V06iBOG4dwK6AMoILwlhqiaUVT+RqFxNZ7
	aPpV+IYa4SWuzB27aDqbUX+yLEAb+YQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-vGzjAUlhNEKhicil605IqQ-1; Fri, 04 Jul 2025 10:21:39 -0400
X-MC-Unique: vGzjAUlhNEKhicil605IqQ-1
X-Mimecast-MFC-AGG-ID: vGzjAUlhNEKhicil605IqQ_1751638898
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4539b44e7b1so6673775e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 07:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751638898; x=1752243698;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P3nUdgGFNjpsPhESYpIfcTM9v3h7I05W5rObH4a7I48=;
        b=Bp2CTTFw3e23cIkvixIq6x6DlOSir0c3RnvNppwEIGLkQDtIeg0OezfSfvnjSviZrT
         Kp3iSZMhVSUr5GFQSCZat7MBhg/W8tw6gEOl0ItLL/FDeAuCNuA6fzg1W0vp0yS90G5x
         B8CC8ddQoDiOi3eSF22mzUsG13a6R4GM09BKAsG2NDzltm6tdiHl3r+MlT0rHM8cR75/
         kwslmPt5HJj7Q2v0g9fmgOIp5MCqrhqRs6gjUufXXrZcF6wTpeBcFvXQdzKokJpGpZ+i
         4aQ986IRaU3JXsUIbXuvHMZcsj0HV2dZLz01dwXCol7uKwfnzWWDeSzfsas1+j2eXDq/
         43Wg==
X-Forwarded-Encrypted: i=1; AJvYcCW6nQ6CblGrJ8mYb8SOmItUWYxZJXRxciBl4SjqUZXr3oYWnQPIvJJWL0jRB0JdtJumU0kBZUta7FhLZuI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwoxzvZ7ghh+mo7c/K/gQq/AQPGb8wXO5x+QlOMj8jlw6NWTN4
	4UuP2bjmDC6U1YbOuhgjYazqhtq7A6nZPNjDFBwlSnvxAbxqFc9akO2kvqROdEwdIuYOENY6ILc
	gHXnzyx3qrZdeQO4l/gVBWGUjjYq8y+axaCV6Ho7FQ3kySi79ZXpHNrQ7oKWgCY9WqA==
X-Gm-Gg: ASbGncv2u7he6Gjn6E6jR1ELH3tX1DoK2bDMvj0lBZGZ1M49ehERnmVpTYIUBICDQPn
	5pSTRYJCuJridWQc5Dwfw4ChDmu8jRjt3CJImD6uQ1YfCSajbhyK+ooBVY9YP49BhDy1CmRRe6q
	O06QiAICqJKGlSnYeKg60lU+XOfKpCQczFhFVLp5C3OM8jEqcFoqoK89UIkCau1FfyOIRkL6iJi
	6pNqcvx6m3jfnnJEgmphQDpnyPoscmHePUulAprEH5KPoWSM/w3HHl9t7N8ZhBjx59tsSSvqiNz
	+P7u8QiQES7itDOOspD5GwhI4Eh3GTR8GGUXUGC1LQIAgANckmKrIcyKSOPzhCX0zL3toWR8jtD
	kkHf+K5uMudH66sSljBcVX4IS+Z06/4OS0GQVcR1DvBBU3Yo=
X-Received: by 2002:a05:600c:1c06:b0:450:d3b9:4ba4 with SMTP id 5b1f17b1804b1-454b4e682ebmr26571095e9.2.1751638898216;
        Fri, 04 Jul 2025 07:21:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDZLMWK3HYBpmt+8sbxwueuEJnFFCLUQgPluCGpWHMDuYeWcKYhaynSXYVQXR2rHmS6MDjxw==
X-Received: by 2002:a05:600c:1c06:b0:450:d3b9:4ba4 with SMTP id 5b1f17b1804b1-454b4e682ebmr26570805e9.2.1751638897730;
        Fri, 04 Jul 2025 07:21:37 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:5500:988:23f9:faa0:7232? (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bde35dsm56185495e9.30.2025.07.04.07.21.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 07:21:37 -0700 (PDT)
Message-ID: <28f5369c-3643-4338-9307-570dedadbd44@redhat.com>
Date: Fri, 4 Jul 2025 16:21:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/cma: Use str_plural() in
 cma_declare_contiguous_multi()
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250630132318.41339-2-thorsten.blum@linux.dev>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250630132318.41339-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.06.25 15:23, Thorsten Blum wrote:
> Use the string choice helper function str_plural() to simplify the code
> and to fix the following Coccinelle/coccicheck warning reported by
> string_choices.cocci:
> 
>    opportunity for str_plural(nr)
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

