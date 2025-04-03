Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC7224FC18
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691677; cv=none; b=O1VupFsqnRgz82YHe8euWYu8uWommdY3BKfeoUEvQmzxROXnd0mBfmfryb6NDKy/F2+ZQ+fvmskcxS396RAO9tOeNhGSP25/IMPQsdSXl14KDT1OudnYuvK6vU3td7K4p+mXhwZtdE0gjWlMpEQK5LiVlPdAZpvBqdPfJmxw8q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691677; c=relaxed/simple;
	bh=ABgkSigqgRbiV+wQF2eknXngoR52yEiVHtTujJMWlB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=to0rBFWhBEePt6u6RB1R3ssZ0TnGtp8XnX3bfwiqnfGpHsvbKbdMuQyDQKHa3k259RTIcTqPUL7zQWFBEL9qB34FA54u5YB19/H3XdS6O3KvRwzzigGQACXz56VstXaGI1S0IbLpiehwWdb8QgP3ETYoUnL7gEqKJRdaGluCYj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IdNegSbA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IdNegSbA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743691673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=aM15Vi2vzv+p8sYhBFI6+x/h105/aYJ+yBHmuHfaTpg=;
	b=IdNegSbA2nNMfQWX9ofdNK88lLyvEgpy7lk6l7BUrVE2ZNW8Ad7xzxHbh4OM6oe/r4k9t7
	PiLtHQ9LRTunUKHQcT5Et9K/pQrT6u4xEjRe1ujEa0rhgtmJ5gowHYFPljIUZYuaz8BcMj
	jxpCPLVfQU8fnAZvvRXi67o0HIjx/00=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-OSb-UDxSM_irFtwJFusVxg-1; Thu, 03 Apr 2025 10:47:50 -0400
X-MC-Unique: OSb-UDxSM_irFtwJFusVxg-1
X-Mimecast-MFC-AGG-ID: OSb-UDxSM_irFtwJFusVxg_1743691669
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39141ffa913so538818f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743691669; x=1744296469;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aM15Vi2vzv+p8sYhBFI6+x/h105/aYJ+yBHmuHfaTpg=;
        b=boQMkoc4xak/l0aZ/CsY/5x/MymZwr1u4xeS6vXJYYQzJMOiEqPS4vGnJ94O/OB2ES
         UDQ93p/bflXBFAIpKpz8PMxajDZ2u6iMHU+3NubBwfy84bEY/MZ4cWfqDggrxSP2/Bx+
         k8navI6aBVoomQVmUOpJDSvTlYAwATRb8NNUEwdAuxr2IcBpIkoP7j+ceSzu0u6ERZ2q
         XsAVN64TTI/yOa0EJwwwUwpn962PgeZXmSLacYjPFD/TaeFOa9KoFHWX6kkdlGWShjHT
         AGDK4QgCXR0vyROmyecKZ1BvEuciDKLz2v/AwQjL4vHAitjJxwqODucO0TDqJDn9SZna
         yc6g==
X-Gm-Message-State: AOJu0Yxp+Qb+REEAzC62E6LVBVcZRF1oAwTur1xnbd7RqUKuWCmIu8So
	5KmGbTPV3mpvGcb5WuxsZTuF+bwShHWxJjLSunQDPYFfvpyladBukE0N2n0Y71NXiuhUKIRLNo4
	Mub8gAFmapE1xxnHZErnXPI3zCOv3QSDJTvglF7JP4dnlsLfzGaKWux8Pojtj9Q==
X-Gm-Gg: ASbGncu7Azxp3dAxxNP54Ke//gdLyiv7a6C7xErHVO6GsadSP7uPwEbC/FVvpR2jroX
	QDUylhLILrgIrmKsWnNrcMjrDe56jZ81aLwFAABmHsYfhlsQMILvb8KrKrsTrIY1zaCieNtX0J+
	uiw1wqr/kRe/lq4TDVajXhoZNTy7NQsTTZ4Hmw6em4umWLlnHranlUm7rApyhSIL/NoGFR5sfts
	me5hIgj/7S6je5POK1MBtDrEErPncF3rl987RlpUr33AYMxkBiaOclC55/Lg2CyWrZ1ssgvObGd
	gJK7xFy68QSReqXIwkn4Jq8Cc9tFQgrpl0uj6ZpT9wGJhlaXEpwRYF9rdqNV34CYK79nEV8gn0B
	mqrWyEShGyd6/GAjR9kwxoxIFX1TE9EllfXqq6g9B5nU=
X-Received: by 2002:a5d:6d84:0:b0:39b:fa24:9519 with SMTP id ffacd0b85a97d-39c12117ddemr17615907f8f.35.1743691669378;
        Thu, 03 Apr 2025 07:47:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYKHQ/Wc9ranLZEvT0X1ZDkAdj3XVdLPFrkaDCBJBgCCHC92BBis8nzkShUKSJ6VLdkYz3mA==
X-Received: by 2002:a5d:6d84:0:b0:39b:fa24:9519 with SMTP id ffacd0b85a97d-39c12117ddemr17615866f8f.35.1743691669022;
        Thu, 03 Apr 2025 07:47:49 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70a:7b00:54a7:eb96:63bc:ccf4? (p200300cbc70a7b0054a7eb9663bcccf4.dip0.t-ipconnect.de. [2003:cb:c70a:7b00:54a7:eb96:63bc:ccf4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226ee4sm2023973f8f.93.2025.04.03.07.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 07:47:48 -0700 (PDT)
Message-ID: <02a4ae57-ae97-42b7-86ba-78963bafed43@redhat.com>
Date: Thu, 3 Apr 2025 16:47:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in
 copy_page_range()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 xingwei lee <xrivendell7@gmail.com>, yuxin wang <wang1315768607@163.com>,
 Marius Fleischer <fleischermarius@gmail.com>, Ingo Molnar
 <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Xu <peterx@redhat.com>
References: <20250325191951.471185-1-david@redhat.com>
 <7b6f57b5-c99f-4be7-b89c-1db06788d2b5@redhat.com>
 <18b18a90-9850-4015-8038-35e2e083ece5@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <18b18a90-9850-4015-8038-35e2e083ece5@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.04.25 14:32, Lorenzo Stoakes wrote:
> For the whole thing with this fix-patch:
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 

So, we already have now

commit dc84bc2aba85a1508f04a936f9f9a15f64ebfb31
Author: David Hildenbrand <david@redhat.com>
Date:   Fri Mar 21 12:23:23 2025 +0100

     x86/mm/pat: Fix VM_PAT handling when fork() fails in copy_page_range()
     
So I'll only send a fixup (but will likely keep rc vs. ret unchanged for that).

-- 
Cheers,

David / dhildenb

