Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D103FB1B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774006; cv=none; b=mrYigC2fIOkZZyAX4ndNXTL+/9ssqiFrXyt3eHa+HDlsceJ5tnkvSsnacUAUIqaq9Ux3Fkgb4wENWiMchQ7JyCm0fCTr+08LPT/axKpnAxgPw0OI1dBAGO1BqCqUIZqAuhxbpvSGhdcX66p0GrBRUw/GxQXbdjv1gOig+HmCPxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774006; c=relaxed/simple;
	bh=oK4zhMVvpVBXg8QRx4FZyNgS/UDlJgYCSR7WfGsCgNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JzDOnA7wwssBkAEzFsLni7WYytvcYZmoUpxHwGUQv1S7u5Sc4vFSe6YrFw12LM8t1gmi7OQRu7OxNUCIQpGi9e0KTx2q7z2cV3YrNxDDocBcBR02bFzevn6C0MihucE49tlwm9L+RI0Ai6TVFcvjEzli1tcz3GCnXtCzOb+1Vhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SGFDZW7A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SGFDZW7A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750774003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FlQqDCzzkR8Q/dh9t/C+sS1tdaGImydBI9fHj1Di4J8=;
	b=SGFDZW7Ao+AZRquaCSWMyzNBfW03152XvQEcXBt0kQ7k78e/ixRPpY93yOJVZi1MA1S0vP
	KpOeLx2YzL3trDTi9oOf43GrQ8no9fyevIVLjKiiJHrI1VK1Gjm8wENUyMFZDEZk7O1hkV
	5BpABtc98tXjuT2m8TLiCMLZa2+n8Lc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-ZtVduQ92Myq0FFZZ12xSig-1; Tue, 24 Jun 2025 10:06:41 -0400
X-MC-Unique: ZtVduQ92Myq0FFZZ12xSig-1
X-Mimecast-MFC-AGG-ID: ZtVduQ92Myq0FFZZ12xSig_1750774000
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450d290d542so3517585e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750774000; x=1751378800;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlQqDCzzkR8Q/dh9t/C+sS1tdaGImydBI9fHj1Di4J8=;
        b=Ys2Qk0V4LC2btnIxn4//ploirRoummm2+Ay84M4PFpXOKCKOgkWs/mVfuntCVXQ8WR
         FswqKdhQaNki6xKxD0+Xd5Gahyt5M+1CJFdSn+Ez2h26gY5sRJjE9b97baQzyfcasOxG
         wLux20zpHpZZu4GHddYx+9HvtuHxfQ5St/p+yqMfXXjUdBMI3jBjATMiUOIjqTBK0X0p
         8Pibafv/AQWKsSbAXxhV3PEEM0y8cLCzL7lVg1AAMob9Nj7m2f6fuHVgutEnUEB+x22r
         8eUEwAWNZzUSWkBkpnxGHSoP9JlHfdkGOwt2BARVrl/fGutrcThglCOk2zXj27fqCE+H
         1SSw==
X-Forwarded-Encrypted: i=1; AJvYcCXX3lwqSujcALVTGWW5npl+SHCDEAUi1HrWG7EEqTnUStxpflShb9J7BF94NgGeriLn3ihr0OTuboWv/G0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNrqfTEGoJjs6Gs/E//R5gPRQ9W1L85QrQa1gSpEobppwBEcxh
	Lp0tzl8KU5OvZwQEosF5qIWR8nZUkUWW7fczkVzKYr5Ic7yguE30YjXk7VdnkNUyMEfepbmmshz
	YzWGuOtpu3PCE4RYTn41z1X6UZ6hHNWSZI97eTFlPQnb3STS8qVL26j/YvF3QUTyakg==
X-Gm-Gg: ASbGncum7DLwrE184q+yNq804dj8C72j42GR9MnJ+NGmfVPZ7XYYQTQZehWcYTtFhWb
	nhilAECZIpKI6S0gNXZNFvmdaclw2SPlJFGFyJDDQv03r827bwIwRSrckzs/OZINhCGA8ZMnmGN
	0K7/DLN+kg+hn9X/lWkhFtzuqGT4QywazCuGDLmrQCCp2ZkpGxBg7oyE5LAecFi3Xo/BP813o8g
	WbapmjDQpJ3KMIrbl1AAMxYOOmM2/Jfr0lTl/FjnuwLwEa6ylNEWnQ5sL0k6AUY2IT1KBlmtnBu
	fiwuzcFo7NOCnFeATsnZdoE71jdepCwdr0eHaHYAtoVktDef21tuo34=
X-Received: by 2002:a05:600c:3b15:b0:453:84a:8cf1 with SMTP id 5b1f17b1804b1-453656bab9bmr138890075e9.33.1750773998283;
        Tue, 24 Jun 2025 07:06:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEctki2bkk/GnxsrTCuex5cCQSKjV+lRTLjrQarp3XGvl4qos2HAC4hPykSyB+Fpv3Deb/dbw==
X-Received: by 2002:a05:600c:3b15:b0:453:84a:8cf1 with SMTP id 5b1f17b1804b1-453656bab9bmr138889625e9.33.1750773997874;
        Tue, 24 Jun 2025 07:06:37 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd589sm143520925e9.26.2025.06.24.07.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 07:06:37 -0700 (PDT)
Message-ID: <50eb8b8b-cea3-45f8-96d0-45ab88e10909@redhat.com>
Date: Tue, 24 Jun 2025 16:06:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] mm, madvise: use standard madvise locking in
 madvise_set_anon_name()
To: Vlastimil Babka <vbabka@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Colin Cross <ccross@google.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250624-anon_name_cleanup-v2-0-600075462a11@suse.cz>
 <20250624-anon_name_cleanup-v2-4-600075462a11@suse.cz>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250624-anon_name_cleanup-v2-4-600075462a11@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.06.25 15:03, Vlastimil Babka wrote:
> Use madvise_lock()/madvise_unlock() in madvise_set_anon_name() in the
> same way as in do_madvise(). This narrows the lock scope a bit and
> reuses existing functionality. get_lock_mode() already picks the correct
> MADVISE_MMAP_WRITE_LOCK mode for __MADV_SET_ANON_VMA_NAME so we can just
> remove the explicit assignment.
> 
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

