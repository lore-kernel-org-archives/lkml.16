Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D006D1D54FA
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 17:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748279875; cv=none; b=Tcx/IEohzZcoLYpw9FU2Xt+RmJ3FzUT8z0k5cLhTiTdg77pk60i8wIySHbAe97mxhVyZaehAk6t8HDt5euGloUL9A5To6TDlhzfuE2edy3UbmUOEcU6Td0wm7JFkNgRMsR1BK+Lhmhlt1iq1wysrOa/KwazlYcuhABmJCyYr2WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748279875; c=relaxed/simple;
	bh=RnmWbZUjLNFQ6UPxsJPc17G1ca8dfohnftqcjERnUVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l0tpjJwk51MX/y8KjE5MwzIHJNtIpo0gkhuyFcrDvWaoEarDPZ3foBKhhNaQwhkvU6JaNtl9zP9VMDHrYb9ueXEXxO5B22stSDRDXMWKxVcplxG/QJ+/cPYF/wEjPO6E7OhIKxPhp9LdqoVviO6LO0vfEAjTx/zVzXz2HqEVzsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XUuXljH3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XUuXljH3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748279872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=N8TDaK9uBXZUW3XXXfrG3Ug+WZzSKko+ZOGBgacitkY=;
	b=XUuXljH3Q0tURRrDkBzXgwfEvY/sViuPJpS+ARkTBQ6S4mCbilXQs+XtNVRvnFc0NsPqhV
	WbEsrWN4DJ5xe7mV3P39VnRgjagmpt1/M5FyQg53pjezXZU1uVfXqmi2XqW+Wd/9c8zpLn
	oj9/SLICTIHciJQD8lO0dT9PtIc1D6U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-9JBQIkQZOWyR1Mkus-6Pmw-1; Mon, 26 May 2025 13:17:51 -0400
X-MC-Unique: 9JBQIkQZOWyR1Mkus-6Pmw-1
X-Mimecast-MFC-AGG-ID: 9JBQIkQZOWyR1Mkus-6Pmw_1748279870
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4dcfc375aso585524f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 10:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748279870; x=1748884670;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N8TDaK9uBXZUW3XXXfrG3Ug+WZzSKko+ZOGBgacitkY=;
        b=F8tU3pUbxcaNu2CnBAiH7jKIcgDViZlKTQ1x9lgSSefxLenBSA9Zp+6FO6+treNunu
         KjsYrVsXktOvxKBOVBuZhue5FC09itDNKZ5LsKCHYt3cZYQKG9MzNjUSkGAPXf4DVrwi
         UmvO4pj3Cw9R6RYGGWzHAwVz+gy92HoMhQumxTFLmegZleIJs1qWkbtCWeVlxTCZzgBA
         7wRSm12YPEI7IalBkpCib35T7eapnLcQ3ic7Jaw4lqtxf18O448Sl/h8OTiyzUSJ0j1A
         KgOhSSDtGY+ZHJmrPiucK+6n9w2CkcvA86TuvkqorPaMDqjQBAduDGWf5lWW9/UPjMLX
         4Oiw==
X-Forwarded-Encrypted: i=1; AJvYcCWp+THcYRP9uorZeuSM2ujvBdgqmrXv1HWR6p1ajpD+MX/OwecC7H00MLGBSPTmkGu1QwiivDEejIDMeRE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEB12IU042MaQbc7oLGqrT1t5a2xG1uG53/FyuqCeAsCk3wXY8
	yHvvd7BIvIc0mQSNTPCfkMroyoEiCecvMHdzHgZ1QeyZAkLTi+nJaQQJxZQO0dyIxdKirEnWNs8
	HEyL9lTnfSHRf6nOWwAH6uR+KGixtgHYOqsNGyuNl1pI22QH2m0xz2JWlk+7iNwq/nw==
X-Gm-Gg: ASbGncsUZ49U//zNJdT9MHbpgO+MMmj4aFFea0sUb8Lvcsg4mgoXLujKzsiSbdEsVRD
	Ha1g4HCUDJ6z5PHc8N5zoSnmft1Odx6OW2INF04u3iuFMkwBhVlLmg+lsZ3xocOM/5cTjkpfY98
	l+inNl52G3IjArIc5JOOx0pC+M+cveXHjJmzFEWoiVI53mtKI1ZKixFKS7yGLhrhrRbigXUVIGx
	jC35uwZbD4cyqrUNoKRaGQFlfycJRKl5CxqBu+Vli+8l7eWqPg0CQ6YfRoSyxsUmCXEMYvz+9uI
	jVbjSpCyAMKKAD2GafZYpAPQOwlOoIiTUx4drDiE1Dk0fxcvYusM4hhuJRovdqiLk/Gw8gIpTeY
	BZoFQlNKjTPBgwby+dqCeib24y1WyzJNQUkd62p8=
X-Received: by 2002:a05:6000:2507:b0:3a4:dc32:6cba with SMTP id ffacd0b85a97d-3a4dc326effmr2931250f8f.4.1748279870005;
        Mon, 26 May 2025 10:17:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/8MepRyYsY8Naj9dTGK3E2XahE9Z6zajZHBReowbde8nns/JUmGt3bFIhv3WrNuNUPFUiVQ==
X-Received: by 2002:a05:6000:2507:b0:3a4:dc32:6cba with SMTP id ffacd0b85a97d-3a4dc326effmr2931234f8f.4.1748279869658;
        Mon, 26 May 2025 10:17:49 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:6500:e1c1:8216:4c25:efe4? (p200300d82f196500e1c182164c25efe4.dip0.t-ipconnect.de. [2003:d8:2f19:6500:e1c1:8216:4c25:efe4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4ce65342fsm7602044f8f.6.2025.05.26.10.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 10:17:49 -0700 (PDT)
Message-ID: <5c0850ec-9407-49e8-ada6-e8967d676ddf@redhat.com>
Date: Mon, 26 May 2025 19:17:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] drivers/base/node: Rename __register_one_node() to
 register_one_node()
To: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Nilay Shroff
 <nilay@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <bc754a238aa91fa36be463985ccde66aac7055e7.1748270306.git.donettom@linux.ibm.com>
 <6a2bd4deee8a9274e0d3dafe965c0119b2191b7d.1748270306.git.donettom@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <6a2bd4deee8a9274e0d3dafe965c0119b2191b7d.1748270306.git.donettom@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.05.25 16:50, Donet Tom wrote:
> The register_one_node() function was a simple wrapper around
> __register_one_node(). To simplify the code, register_one_node()
> has been removed, and __register_one_node() has been renamed to
> register_one_node().
> 
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

