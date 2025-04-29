Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E367B3E1
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935366; cv=none; b=qFD8lkwPay37Vgz6AM448+jLqWf5p+E3Fgch5h7u2TAXH2ZVMEgX1ALs0Lg1K7wVQ9nvR2CBfa6/BSO+0pBdUqdAeu1My1vEIrNzqjZkLBydik1pDdLCFm58g2ac8jwqm3NyctciNEgS+Jxh2kIZtrgScV+8S+amX6Qp7akYnTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935366; c=relaxed/simple;
	bh=4GXtgi1v8JuErjxQo2o+cI5MeI9D4HSR617YBuzu94c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ftc4kBtN67YbeCjdSHpv87eh1Ta9BuJ44mbwhc/bjvogzvllXnmGeLqq9HKVgLTbexTUJ3cum0R3cViBkYtvhWIRSleqOvZQc5Lxnj7ipn9QE/qAy/QX8cTxUXR2AUBO9BRckCzcns5hdqpPwvzDZjQiGvp+sOzr6BRg0z8HbQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J8mqqb6K; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J8mqqb6K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745935362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bzOJ3l0iCtkEByccE0Wwh9YboIMqWbLM9kNzswJiyvY=;
	b=J8mqqb6KQrDYtMbe84XoKakJCsJtyRcGTqLlDhT9sfc1qQulT1X27Y8bAY5eil76pUItbp
	+VWbBNyxqFrEGwQorBSrWI+jY9TvfpaSy7YCsfYTXaGCEQcOyptGsV1NS1TmM8dIwSYT5A
	ujIUphHb56Rr8Hhw57VhcnprjcdXlwQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-3UV7uGpTMKq1QY6LmxTe3g-1; Tue, 29 Apr 2025 10:02:41 -0400
X-MC-Unique: 3UV7uGpTMKq1QY6LmxTe3g-1
X-Mimecast-MFC-AGG-ID: 3UV7uGpTMKq1QY6LmxTe3g_1745935360
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ceeaf1524so24810415e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745935360; x=1746540160;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bzOJ3l0iCtkEByccE0Wwh9YboIMqWbLM9kNzswJiyvY=;
        b=NCCEhHfHt1RVyotEtpkGQ9n6mYLpVjoIhus9FRflHFHVhXLyNOlbqrX6lTGT5wyY6Y
         8WoEKNjOMP53zVyl52Q/a07QSuskrlCeluX71mDbNVwObu3QDWPIkFbfHo76SQOLhASz
         kOOl4F65Vpq1nxiPrv0J2gywkt+PZfuIyL3ecY7ZXWkZvAKuV+U6Zk5WeA3Yo/1aiV7/
         Z+pGwl7Cotcy9zF8cY1UUXP6JV7PboJbOk2Qz+bc4p0k2P6hbpCbWclFF9SdL0+63XnO
         LurOIHftBjz6NpGyGptpD8PaiX5curoOne0aS9CHA1AWTwnJvT0rbPl88BYKKYTh/zN1
         hxhA==
X-Forwarded-Encrypted: i=1; AJvYcCWrgO072AyDxKBnLUTU3Gqw8crvJq5a6pRykXi63H0qbCIXljp2sQXdC948wYNeRU5vZ9sctFqnuakOezY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp2ICoSZg19Pn8ZT5GPyWGGbXmQCMOUwcnBcXNIOMM5TJq9coG
	w5XM2EQYoAZjkuIqvjtd7U43JBVKac8GSSNggxTNwfrqtveB/qSdtjy2ORtSVQyx5LIkwFWEAHZ
	ueSjwcRJlt30rjvNxPCGl3E+lgluqgxChm15Nr+Qy0h7Y/oB1OWSDemhm5GCHNA==
X-Gm-Gg: ASbGncuvF33KGz6zU+qMENRw+8YtqpciOeCJcbRsZfYko3jyaXiFdKj6qkU5LLx3TgL
	LDdU4NKZBFH6vtDSOVRW38+gZm0ElsCncniCHXjJdStqwhtj7GQ2PuYtG2yT9HGK/6qlKbvDWRB
	sXkUTKm7mZ0TUOrj7W4QnvkgWoS+ka3TJ6i0XrmPG5h98FIXcH7pmUp1VcgNR8uArpt86fB/C1A
	ajF8RAkWwE10vmNb0wSiqYxu8HRlH9kQul/WMFbQYugn/P2Si4dkeDRabciUnhYCMuRRz/tSya8
	hIRAncS3QtTxSdlvPpQw7F1QGb3yISgDx3Vw54lgYmtGpPccN39sfjDIm1oa5vfp3xExN9GuwC+
	vDIF9zon15rdBZNxRvqyuVc0z9CkSkRtnl/6BC5c=
X-Received: by 2002:a7b:cb88:0:b0:43b:baf7:76e4 with SMTP id 5b1f17b1804b1-441acaa8d6amr25497185e9.1.1745935359616;
        Tue, 29 Apr 2025 07:02:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtb1hfCeBhNCaf5Q8KYXBK4Ot+ZsbBCrlpMl6OdBbsZss6ffFPJKvwhbpJMn1zaVkt4lWmDQ==
X-Received: by 2002:a7b:cb88:0:b0:43b:baf7:76e4 with SMTP id 5b1f17b1804b1-441acaa8d6amr25496065e9.1.1745935358778;
        Tue, 29 Apr 2025 07:02:38 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73b:fa00:8909:2d07:8909:6a5a? (p200300cbc73bfa0089092d0789096a5a.dip0.t-ipconnect.de. [2003:cb:c73b:fa00:8909:2d07:8909:6a5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a2386sm193971675e9.14.2025.04.29.07.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 07:02:38 -0700 (PDT)
Message-ID: <306922f6-f21d-4973-bff5-425f3211d5b9@redhat.com>
Date: Tue, 29 Apr 2025 16:02:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Optimize mprotect for large folios
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
 anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <6ac365cf-da48-4791-b56d-62335519efdf@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <6ac365cf-da48-4791-b56d-62335519efdf@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.04.25 13:03, Lorenzo Stoakes wrote:
> -cc namit@vmware.com

Yes, Nadav is no longer working for VMWare.

.mailmap should already include the correct mapping to the gmail address 
AFAIKS?

-- 
Cheers,

David / dhildenb

