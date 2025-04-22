Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8DD28F94D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745335134; cv=none; b=Oq/zP5BE71lyAXzy4bgleJpWb0YW0RqFf2cC2y2iUYbTAQq18K/q1S6sEYzjYN24y7KwcLqX5K2PNFxOz1rlVJQbjSdxJFTPXogL8QG1KBXHYoc/O5bgBCx6O9MUTgAPN298jfYY13+KL4b3EKWfROTvCY/aQ4RY3YQQv1J5L68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745335134; c=relaxed/simple;
	bh=7j6EW7fZaub0rthh35jZxhjeeDwrYjO7t+5lGAG3594=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ie6ZnKuu+upWUB/9u+YdlheGOLz5T+2LE5cnCQ6gUEWApmse3xvKJEaFkRThXhaNsjrTyRX8NIOOGpBwLSvAM+ZAILiy+x5shriEnbaqIAbSWIBOBZA3wAo4q6Qxs2XYbxjDqgVlFrOHA17oSVx24OkdUBncEnP/D2jUMSADWn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OucOM6Go; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OucOM6Go"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745335128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+G9Cy5Doy+79S4Imbry+Il93p84CW35Nb4NlHcxcntU=;
	b=OucOM6GoPlYWJRZ5PJqUtQsv1D+mqE82Q7NhJWMfqzZh3omDfL7Rp5ZO/7h8PDxLO4+21E
	K+gil0LmnrD8NKQ2OTBu1RYakr18sh6gQeB/gX+4maFOwitOvZsISamCSGKqvNyVRTwu4K
	3K1Ted1e65ogH5+MI7hZMsBLmrVpYTg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-v7wzYn2zOLCzI1GUKbSLYQ-1; Tue, 22 Apr 2025 11:18:46 -0400
X-MC-Unique: v7wzYn2zOLCzI1GUKbSLYQ-1
X-Mimecast-MFC-AGG-ID: v7wzYn2zOLCzI1GUKbSLYQ_1745335126
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d734da1a3so25162675e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745335125; x=1745939925;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+G9Cy5Doy+79S4Imbry+Il93p84CW35Nb4NlHcxcntU=;
        b=BZ5GDNRCsiVOlhdXovvg2Amx+H+Wqn48KchWSHt3jwwiZjPa79oFWPoiL98b7yO4BM
         Idwg5QubfecrPq/AktS3uU6XpBH2rQ/cKen52oURP/N/dT6HEnD6k2KNCPwh9Rz28Poq
         yi/atdgGYd/m8sxunC7AcokMyas4Q+v1qZROgYsOqnJOdU966c60yWS6SHDqasF2zvlM
         rJR7LrjVmDkFs+XIxO0KHVcyEVaam5mvKfjBJlvxL57xIbiRqyz4R3TkR1uhQlnCXT2c
         BIWjK9ac+ISSlUELffi3hmQm+SWkcj/age/PqD8m0Lf8Y424pD7iFSzsFoyCvRaLfMGx
         S3rg==
X-Forwarded-Encrypted: i=1; AJvYcCW8nG/Lt5D8JnDpgowErLg/mJ9FEflWxJTJ4UQ6UyncK5nAnj+L9jafSo9YrBWERE0NSG3xmn4MkPSLNBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWTro0+H3GojsuDniU4SlqPwmJXcjzga5RPR6uXY8wD0WdSnC0
	04k9N/hmFM/ibrHWxrodRDWmVgSmauTr8YnseoMDvSl0I5mD7biiFZN2LYBjD9DAaeQUR+FUC3S
	obAikWWfYqmAr1MQk6KcUw3+I2ZyXiXuHlocEPiSJiIF2bLiEhqvkZ6v+Qdd34w==
X-Gm-Gg: ASbGnct79XGC94s54Qh2YjKfWMRhKk82CnHZrw7T4mXWf22Mrk+u9jixBjDiZkRKAoI
	AzNYLUi5yG/D46XYcd+joKvoLr1FUn6O/7Wgopn8iIhwqSHlu9sEpK3pSOp41rPVL2Qm+35Pu2y
	IfzYZZ088JT2ykiIO59sPsdtSQ21ANfKhK2j439DTa/zRtPtGKoZ9VEjAdSOTGIcHH8RmYmPuGE
	XOL4ogzz8FaxpIOwQi3gKqD4uvTedEqV/HURsLQZDRFLL522r3vOnzf6vIcQVL3bgSnPBa+kBEb
	s8JUWOietNZhKYtejR1JmNv+hBStW71YRxWVdAaXAsOfmzkKiEa6dmoT9EnZ+AJ8iaNJOy7USFG
	+nXDlfJscLgZ9Fo1svsAWkDAxWrwe1boUsFI8
X-Received: by 2002:a05:600c:5110:b0:43c:fded:9654 with SMTP id 5b1f17b1804b1-4406aba7088mr133655525e9.19.1745335125620;
        Tue, 22 Apr 2025 08:18:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMryMb7OCN5dZWHmN4IAH0EUIubtU3a+AQxU/uTieg3Jy0zIfW4bAMlDO7kljQWcQfzvnQKA==
X-Received: by 2002:a05:600c:5110:b0:43c:fded:9654 with SMTP id 5b1f17b1804b1-4406aba7088mr133655215e9.19.1745335125271;
        Tue, 22 Apr 2025 08:18:45 -0700 (PDT)
Received: from ?IPV6:2003:cb:c731:8700:3969:7786:322:9641? (p200300cbc73187003969778603229641.dip0.t-ipconnect.de. [2003:cb:c731:8700:3969:7786:322:9641])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43315esm15353186f8f.26.2025.04.22.08.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 08:18:44 -0700 (PDT)
Message-ID: <d2a1009f-d55a-4282-95cb-6efffc008186@redhat.com>
Date: Tue, 22 Apr 2025 17:18:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/2] mm: add folio_migration_expected_refs() as inline
 function
To: Shivank Garg <shivankg@amd.com>, shaggy@kernel.org,
 akpm@linux-foundation.org
Cc: willy@infradead.org, wangkefeng.wang@huawei.com, jane.chu@oracle.com,
 ziy@nvidia.com, donettom@linux.ibm.com, apopple@nvidia.com,
 jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com
References: <20250422114000.15003-1-shivankg@amd.com>
 <20250422114000.15003-2-shivankg@amd.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250422114000.15003-2-shivankg@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.04.25 13:40, Shivank Garg wrote:
> Rename the previously static folio_expected_refs() to clarify its
> purpose and scope, making it an inline function
> folio_migration_expected_refs() to calculate expected folio references
> during migration. The function is only suitable for folios unmapped from
> page tables.
> 
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> ---

Thanks!

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

