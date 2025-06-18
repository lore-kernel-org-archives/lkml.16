Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE5C2EAD1A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750256208; cv=none; b=ltANDcUuVxnnQRkHBpbk56X5KQqvuYp8KY/1Msltzy05rBwW2PqcrjqHmVBamBVESCGaidCIh2Eal6nIX4XtEfYUCob7IoCsQddljQYvbZj/NcaU98+/YR8UhX72kRpC4MTfd3hJkPBd/dQx5rqZwqRrzwMvscEwXSUbxeWrqTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750256208; c=relaxed/simple;
	bh=SZDsANUEYc3VEP7ESBzjA/Sa7ufHOwvO4id/mlmSuoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PMcONDSZCTKIcVFnp9awxBItTQ9Wwy7u9v7Y/jdgDTxZzj15kYP+DgkdjlwXt7pLdv4PHeMXsSAIfXe/Ysi1Q53d9Keb5gQzfsqNNs1W9wGpm1oI+JrbiVO9vrzuQvmGz10Tzq9sjjUySadBT3hNW3x2QoFxWvSkZphPj+bmGU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jz5AU4Id; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jz5AU4Id"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750256205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pnakAuqpVv27gL/eIRgTWHQ86Cmzoypd6ut3J9M5fpg=;
	b=Jz5AU4IdUSuTCjWOC+w17s+gK/lIFXzJrd4WsInCEwofyn4MOzqYGwRTaQSo6BD4G2PXb2
	O/eR3Ksv/BTlDDBdfGC/EAY+PqU73nbX6+hOmgpSXKWyq6ayAmsc/9ximLRo8uBt8eKkL2
	SzzwYX2DXUottlYlFWXWt05fRFInOV0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-OExi4vkGMPOusGgKTNj0Qg-1; Wed, 18 Jun 2025 10:16:44 -0400
X-MC-Unique: OExi4vkGMPOusGgKTNj0Qg-1
X-Mimecast-MFC-AGG-ID: OExi4vkGMPOusGgKTNj0Qg_1750256203
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-452ff9e054eso36552485e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750256203; x=1750861003;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pnakAuqpVv27gL/eIRgTWHQ86Cmzoypd6ut3J9M5fpg=;
        b=RaWQXhTJy1qYAUNmx7zbulw97zr1L+Xnr7RoVGjbRz9TyPrIChjMrznfAHqBzaj1Gt
         YgcsbODcGSHg+mAnJ9fP6FS9MY30+qO2vr+jolOUyme0yTCI1+JFsCO8QXLF8JnzQapA
         FhPWRTvQ804uY27jEPwrugaem5jpco/jxcmiOCZZvJCDGOtDG8jPmbEEm/Kv3fhhOMbK
         p3WVkH8/WXVFreXPE6RsY2v0uScwxyQxd/lIz5oXrLZBuA/VFUc3hsN2UvPW0NdevOnH
         x/bwRrX2INNw+J43x/eB2K82V/SR/EcMCKSf7EdiUEIKVlSqGCLZZo+RszjE/93X8LFf
         1OUg==
X-Forwarded-Encrypted: i=1; AJvYcCVga4JEwN2gXGOFIMGXtU6znT91jhMgosF3XWqIijT4yFv8NYc/i2RmsR2rrUCl4X1KFD/c+oBnFfYOxe4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZhzC5oavFFiTtJuN5KAvqO+1YHNkR8VsA9hYxz9MgruLKRe8u
	EdKutPiMQDI6XGjinPkKRRKmkqZgwTiE0tLLoUZdjZRuUHG8phq1KedcFaMyzzJYdB9H7aOdeka
	3SWOXZShdXibGGWnyBkS4bjcUVYf0u/06kt+MHY8MzHUHITzfVUd68dmuQfrTq3NJBQ==
X-Gm-Gg: ASbGncv/TzStDZUOp4VFZKr5pMznlx5dedipvhhlFj8Xb/yHeuCETyYBwWAUd6pjHLm
	Afbk/beW7o2U7LhgiFQkcZ/1SXJ1U57V72yzvtE4/4C3VMv9ry0TLp11GkuweBPPATBxq4Xjbai
	/CzMPke2bBAy6ddLGi+JSxmwK8fTmplnNdP/Ny0jBTuvWdRFoB5hdcLj6fJNqNNONQ3ANIlACrn
	GMv79mX+sIllC9E8Mb/3R32Xqo+itnT6YfPdi7VPPeEe29zQtr6dIoF4ZUBgVEcn5nAqibhaDpb
	XKis8lDxuZ95DUrHtG13gFXz/hA+j3tNMwx8IUmacdJV4HLJbN2IPcZPVyc9VLPWSKZs+OBJfjC
	F+N92Irc5RlnIkHHXCvA1MMsyDgmdT6wPAbaswfzeW6uOP1E=
X-Received: by 2002:a05:600c:528f:b0:450:d3b9:a5fc with SMTP id 5b1f17b1804b1-4533cab1b53mr150306135e9.27.1750256202660;
        Wed, 18 Jun 2025 07:16:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/v9PZpGSZVIsOYlGFsJLgfp6SxTdjtuIyU5QFN7m91Aku2o1fdMeD+2hrNFzALMqWrkamYw==
X-Received: by 2002:a05:600c:528f:b0:450:d3b9:a5fc with SMTP id 5b1f17b1804b1-4533cab1b53mr150305725e9.27.1750256202270;
        Wed, 18 Jun 2025 07:16:42 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:2400:4052:3b5:fff9:4ed0? (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e14fc98sm215582455e9.29.2025.06.18.07.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 07:16:41 -0700 (PDT)
Message-ID: <b9446db0-0aa2-478d-b5e4-a4eaf2c53e90@redhat.com>
Date: Wed, 18 Jun 2025 16:16:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add missing files to mm page alloc section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Vlastimil Babka <vbabka@suse.cz>,
 Suren Baghdasaryan <surenb@google.com>, Brendan Jackman
 <jackmanb@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250618105953.67630-1-lorenzo.stoakes@oracle.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250618105953.67630-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.06.25 12:59, Lorenzo Stoakes wrote:
> There are a number of files within memory management which appear to be
> most suitably placed within the page allocation section of MAINTAINERS and
> are otherwise unassigned, so place these there.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: Vlastimil Babka <vbabka@suse.cz>
> Acked-by: Brendan Jackman <jackmanb@google.com>
> ---
> 
> RFC:
> https://lore.kernel.org/all/20250616202425.563581-1-lorenzo.stoakes@oracle.com/
> 

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

