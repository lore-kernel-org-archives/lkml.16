Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E5823AB87
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561863; cv=none; b=Q9iePeMrGLRA4tOWo15hf272EAJAE+a04welE/fx/AFcCdruQs8bx//+X494oWiJcIXaURrIlNMdIlu3VEnAXDP/EJvI3aZ6F0UT3To4LQ/KAGOWyVnoPdExPLctsOLLgCOMTa4gl4UOy8RRAQSz92xNEPKoeeR3Uu2flIY/DTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561863; c=relaxed/simple;
	bh=Y1fgPzUv8h39dp69/WUYYxokEIXB93jM3/yMqGkqEEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OysGB76cQsBadKJObRrokx55ZZHCXoKPaoTjMedkoHNHzg8VqAbgiYtoIA8BjLzo9+at6upap1aY1192R7KytXlIS4D4IRCVEqIHGLFvbs3dV9ZwNMJavcftdpmt6KDp2es+11G+ngyXtBNilew1M9GIT8hLA4c99MjkdW5huyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gyCLN0r6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gyCLN0r6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749561860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=O56+Bk5TTeN4jh9BZRlx3XR/3UjST+pbt1ppyD+2/rA=;
	b=gyCLN0r6kscrSU2b2mBVP+AP/RuDhjq9oxPf3VfBayLB9+yJJrRTuTZvFuUVp55mbiVCoc
	b2qD7ezvE2BPPq3DGOQtrmz9iKmnBG6/l8N5A0WVOI6AZxKceU1NGkboTXrAKUUi6fRDBz
	4r0rGjn5ET+28h1xSqqryddPGEeuQak=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-2wimTlyXOCa8sLRO9Js0HQ-1; Tue, 10 Jun 2025 09:24:19 -0400
X-MC-Unique: 2wimTlyXOCa8sLRO9Js0HQ-1
X-Mimecast-MFC-AGG-ID: 2wimTlyXOCa8sLRO9Js0HQ_1749561858
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a503f28b09so2637677f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561858; x=1750166658;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O56+Bk5TTeN4jh9BZRlx3XR/3UjST+pbt1ppyD+2/rA=;
        b=QjHRJMjm5/8C9xKzJp9eVhkFbKTZMMfOV8CaYHOCY3eIIbo/jlmLnq7BpGcygItZWv
         m1sjvhiOln5HRYFtJvxkOv624CXgugstejckHOzjFj+QMF3ViGuKbi8SkSQZab7cir1q
         0JnE4FXTIbQyjqCi67eFM5vrQjBDwdohZfUj2eE4gwYPk6unPshS6Idk4JlLb44tWGXL
         tKxIkLpCJ39UTx7A3l7vReRmkuVOCZNsddmp2g23P46qqbh9M+BbHVFsZ70w3V5CvsJR
         4BQMtwZ+btjKzO69a66hM4nE9MCXC11lX5wCrvtHVRoWUpsYeN0cG43J6MZskgN13CZS
         In0w==
X-Forwarded-Encrypted: i=1; AJvYcCV5DMiBMgzmixLTQ3Y8RBS+dz9tIRWFuvDuDvKP7HGeL7X7wfTTXv2qizlrulc92pp5eYZFBIau9xIpKco=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeubPlifN+zXW8PwhbQbH6ofpkbGy9bmqsSY8Rp3je9ORvcUI3
	ycicgv+zzPr0bMxS9HK4UzPpwx0o1ssNLG2vS+ith0mfG8fvJA4fjbp5Cp3v9YJvnjONs8ST2t2
	KRho6od8fSI/Wil5PZbUANPIKsF4lCzCk5DAt1OqwTov08EzDgq56ulfZg8gTcXND+g==
X-Gm-Gg: ASbGncv8tzsAyrrj0R94m1yZRl7WNcj6TS/hjY2zBwAQ9FnyjryTN5X9PP90cRl28bC
	4x+/Kh2zQsKT8PuQeUavsunZHrIKIy8CyZ0SoI3M1UhuOEOaQEwvPqBRURhNDDD8nWSUvnSUGi/
	zwtSBvudCb9Q+0HZfNP71E3D0T0z55BT5EcJDYR8DsV6n2iGJN24WP+LmXsdQGnWS4zeAQkkEB9
	/yDjyGgRfhQU3Z9rmeMwwWWdKqhFD16NbEd1Gf3NEnCcpoCyV0Pn4muSzMmS7TxNbPwXlSFpMGA
	hwoPy+GSCBpSW6z31BioeHzG2oCdSWu75RYG3t4WH5wLrFnz2aihops=
X-Received: by 2002:a05:6000:26c9:b0:3a4:d038:cb9b with SMTP id ffacd0b85a97d-3a5513ed8d4mr3093462f8f.7.1749561858162;
        Tue, 10 Jun 2025 06:24:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIjG8T8Ag3R7QOLa5ItFg/2QHHk64OEOfrvBwlSgh1cnBAwjRxZQ7gmQotkGG7aevOtcg6rQ==
X-Received: by 2002:a05:6000:26c9:b0:3a4:d038:cb9b with SMTP id ffacd0b85a97d-3a5513ed8d4mr3093434f8f.7.1749561857709;
        Tue, 10 Jun 2025 06:24:17 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm12244725f8f.74.2025.06.10.06.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 06:24:17 -0700 (PDT)
Message-ID: <970e1b84-7f47-4a51-ad99-4df9026b8f7d@redhat.com>
Date: Tue, 10 Jun 2025 15:24:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: Allow lockless kernel pagetable walking
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 suzuki.poulose@arm.com, steven.price@arm.com, gshan@redhat.com,
 linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com,
 ryan.roberts@arm.com, anshuman.khandual@arm.com
References: <20250610114401.7097-1-dev.jain@arm.com>
 <20250610114401.7097-2-dev.jain@arm.com>
 <db04bd02-0090-4aff-bb2e-0d1e023757a5@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <db04bd02-0090-4aff-bb2e-0d1e023757a5@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.06.25 14:07, Lorenzo Stoakes wrote:
> OK so I think the best solution here is to just update check_ops_valid(), which
> was kind of sucky anyway (we check everywhere but walk_page_range_mm() to
> enforce the install pte thing).
> 
> Let's do something like:
> 
> #define OPS_MAY_INSTALL_PTE	(1<<0)
> #define OPS_MAY_AVOID_LOCK	(1<<1)
> 
> and update check_ops_valid() to take a flags or maybe 'capabilities' field.
> 
> Then check based on this e.g.:
> 
> if (ops->install_pte && !(capabilities & OPS_MAY_INSTALL_PTE))
> 	return false;
> 
> if (ops->walk_lock == PGWALK_NOLOCK && !(capabilities & OPS_MAY_AVOID_LOCK))
> 	return false;
> 

Hm. I mean, we really only want to allow this lockless check for 
walk_kernel_page_table_range(), right?

Having a walk_kernel_page_table_range_lockeless() might (or might not) 
be better, to really only special-case this specific path.

So, I am wondering if we should further start splitting the 
kernel-page-table walker up from the mm walker, at least on the "entry" 
function for now.

-- 
Cheers,

David / dhildenb

