Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC6923AE7C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750692538; cv=none; b=pbd2lQId6lJMXQWqpdDIMKjp3HVHD8JOmkoVfRhexdoPIr4S1Dsqfd4C+EGVh/yYnsnqo7RBg+/tYBLjrTcaGXLxG2NU+9VfIU7159cb0uSYI/0tNmHfPwamps+4NCAhml1cxD6XhnKG3L+VaOjd6GJcf9ssSCULuKDG7adVoPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750692538; c=relaxed/simple;
	bh=MfDYeQcJOe90f6wz9oiP8/+iHCBz+y5IZ+q5WUd+7u0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ntmovtcq8T6eOth1x3M4pv74WfsVhLQoDeg2tIA/cyVBZ1BaybVNxIo8PIJ0xC/sC+PI7QnwMR7ErWYQ0sf31X+pJuZnAtIvepDxA40UhyGQUHAPUX5ys5CMuMSlEy473W+73l7BwEhCG1BECLa6p7V/T0oNaM9q2IpREVzzkHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y989ZLFL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y989ZLFL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750692536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jIKvaSiBVFiBvy2jszdXc9pYCeSx9OZ4mF5dVfnlYek=;
	b=Y989ZLFL5MKZQVmHDm8RCyWMku7Ncpl7m5kdApgvoqt0HkZQT+rQFFe8u8qqSCIRexteyS
	qfRE53W4PmOpI77jdSM2aCL9EaYjf20fSoA8VP8jgUhR1a+W+mADU4CbBkMU6ehatQuJMc
	ECiXgFD8RGWjFz3ve8Ehflsf3+yQyRg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-a3UhfE-GOt2O6-VnZ87dFA-1; Mon, 23 Jun 2025 11:28:54 -0400
X-MC-Unique: a3UhfE-GOt2O6-VnZ87dFA-1
X-Mimecast-MFC-AGG-ID: a3UhfE-GOt2O6-VnZ87dFA_1750692532
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4fac7fa27so1643433f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750692532; x=1751297332;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jIKvaSiBVFiBvy2jszdXc9pYCeSx9OZ4mF5dVfnlYek=;
        b=sAtSMWyyQVlRKhuhueDLhJjJw+iT8A0CmNvmkz3rAO71F7fTMGrk7/5o21ZXiVzWOT
         C01rTWwyrrpWVMUH6NGcljeYrrpvNshJ4Gm96rH7SSr6+Gz+szNnNJcl3GHZO3aWj/xX
         glYysiQpLm4pC1SPk86DjohIV9PGy1f5grcMgRTPjPZtq8kpKwVye0289BCVFOR2RD5C
         z1dSl6Vah6N1kPkiqJ6k00jM6jvt0+sue5nIYE8MtyJJWdEIeyMvijCs7sd7CH5eR0xv
         DauHEcwlokdsDmUdHGknuheiMzkc70XF+JK+timsJQ+L1jdMrFbRxTFWogfWbFzkXevJ
         pYmQ==
X-Gm-Message-State: AOJu0Yzr0YTdwLOI465woXeJ2T66pFF88fuwUspBjELk5Y8QvQMfNIrE
	UmnAVNIwWHC0sBK5Pm1SbyCfqsgkELd+PYqFkvSLl4/oANN9N9kmPO7wAxhk3RZkq31X2g+D5p1
	R9umArohKSDlUidFiqMHSfPVZAevs6tqO2Fmthq95229v/ttE/RIPCZkS2xpReN6slQ==
X-Gm-Gg: ASbGncuTPNRtK8VFNdqbhVpXAUtWa/7C2MY3pDvgWXnN4hBVT1hdAINELG0H854Fv9K
	hoCE+sDnUzfarPRgRfCl2+iJIbJtv7ozaBfhCycMgaistuQPn/nGXiXCPgOZ0+b9cAdVTE+Fmve
	KTYlS5UrHeQX2XEJNgDYst7uiuN9HQKbVajdy3TjCSsF0m39j1uG27pJY3bVViVDArgr7ERw6aX
	+bfQkJSlnQZn/iNqQT9TElFO4akX8eOLykpSd/+ZBysJWIraeUbjDWGSQUwQ20J1K2SCza+jfOj
	uomk6mF/EmIkX3/Vg6JaheutgKKMpFCgYyVukN8WRnVcjiQuqYaONfyiIV6sPktaAFxEVTLHuQg
	MdFN/893bNo1mm9/9DS3sv4yWfEruoZrJg7aMUr1JTm1HTW7c6g==
X-Received: by 2002:a5d:5f8c:0:b0:3a4:eda1:6c39 with SMTP id ffacd0b85a97d-3a6d12db6dbmr12088898f8f.13.1750692532552;
        Mon, 23 Jun 2025 08:28:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQjA/gAAUo+aZLlUKrA8C3Zh2fK8LfywBbwiGTnqOXqbPvg4WYECzDiK4SRJTthJcREutq7A==
X-Received: by 2002:a5d:5f8c:0:b0:3a4:eda1:6c39 with SMTP id ffacd0b85a97d-3a6d12db6dbmr12088866f8f.13.1750692532054;
        Mon, 23 Jun 2025 08:28:52 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1193792sm9837820f8f.97.2025.06.23.08.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 08:28:51 -0700 (PDT)
Message-ID: <b0e47950-9fcb-4fb8-8bf4-c4a3c69387af@redhat.com>
Date: Mon, 23 Jun 2025 17:28:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 05/29] mm/balloon_compaction: make PageOffline sticky
To: Zi Yan <ziy@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Minchan Kim <minchan@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, Miaohe Lin
 <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>,
 Harry Yoo <harry.yoo@oracle.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Shakeel Butt <shakeel.butt@linux.dev>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-6-david@redhat.com>
 <D114CF56-016B-4140-97A0-42163727EB6C@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <D114CF56-016B-4140-97A0-42163727EB6C@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.06.25 20:50, Zi Yan wrote:
> On 18 Jun 2025, at 13:39, David Hildenbrand wrote:
> 
>> Let the buddy handle clearing the type.
> 
> The below might be more precise? Since page type is cleared
> before the page reaches buddy code.
> 
> Let the free page routine handle clearing the type.

"Let the page freeing code handle clearing the page type."

?

Thanks!

-- 
Cheers,

David / dhildenb

