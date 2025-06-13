Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AAA2E11D6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825578; cv=none; b=nFN/rdrqN2dR9vRnBJtidDbJCohYmoq0jnwG+6/0I9f9DJ5gTNl40bhnHa2UYzpBnodNtcR0DwzZShtrWhSibULnBVxDod0cpfAXGBncWIJSXNp51C+oW9OJc94jq/C6O9nsMCWcmz6gzeeaHSufV9YfNBCciGcyZ7RIYPZM2qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825578; c=relaxed/simple;
	bh=ZbKhU05MnoIZBZhzps916zJZlgNf679kYic7pz3MSxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTLauqntpCyjCPCZwIefuC2E7G7W2KY9QtLT01Sq/dkgVWC+DLMxXbydKGNPSHzx5B3yhYBxvohd4DzH7emsOCCJYHzqYE7x1p3niYJrrtopg4u/Oq1H9HfzuFyjX8C4GVSYmBsgIJvcm33akwEr2esZAUVz+ZJ+VenJuGnBJWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzT5a35A; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzT5a35A"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-451d6ade159so19029765e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749825575; x=1750430375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m89hPAjm7JVQxnf6x1SHOwhqzRUcSRlsNcgb9WG4NP4=;
        b=bzT5a35AdB/deRjWTDLFO/1/4o+Wy0mxvbNflnmCxJ9c2Jt66v3cR7j97AzYIugw0j
         vr+ZWwEB1x2prYpbxt3vZhfscn7ObiNHoFIh0Gcs0iJp6WIcR4CG73DLZXrI2bR8AYFc
         WLrPD1oyQXPH9WRzkPebSSmtryCgkf2vioAtZHvGlQYAxIy4ajek4HsZ56pqwsZ8KNbe
         gKaw5clUzgt2vTGXQ6gFmZGAxAvKhmJRojd1LmZHdL2LNYlclMC9UPz2scAjofAbXnTh
         LowDkajDswjI6fS2ytj8zuGmsqgnz4DjELGADKDfGhztko6qWziy4SXrbFFYREMsxdlX
         tdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749825575; x=1750430375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m89hPAjm7JVQxnf6x1SHOwhqzRUcSRlsNcgb9WG4NP4=;
        b=pNUO/8HDJy2XlSBkmwWUYCO4ylo1Bpo12NAjqTSC3S88etD4qvnoeP2rPkr6/0Jcp+
         vKfFTLQgsBSPyKt/RKcrPNxHwNPubguTQc4okO1C+GXKvq+q1XaChd5XGF0EbCndChwq
         S4ZEsiFtWluNz4PVRQsEWbp4NBaETZZmAFGhqktZWXN/nbjnpDlkQHa9TZop/Wrfb/WN
         oLxdb7PaDjom/SF7M29aMz1IJnRbsiws5eq8l3bBkluXQ6F84Eh8HwQX3AZSDcXXWmVt
         MteVmCLzPT1heeTZf35lQ6mCDae+hCPPag0a0jzlmwhOkw4R5t9+OCHeE5zzIfihMTbr
         qQdg==
X-Forwarded-Encrypted: i=1; AJvYcCXTAcLdpxyJ+A7+C3ROF/FRcTrB0ZVpEfbZnbn0suD9euwDcb6+9Pc8Z7jV8CQBR0uaG9JMXrKlTAImSYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT9YBkAG5PqlN7PS/cTXBhl+mXfDk+cIa+fT2X8Gk44drtPW3R
	VHJQPsC9Hw4+j7z0TnGvLcsnwpjmxj16zquOouu7ImurTauiOh7HxxjV
X-Gm-Gg: ASbGncuPWhiDqUVYJkSqnn4F/gpdg6tVMKIUWhARSAq+BYS6hw0vlAOdQCMP1ws8OHn
	RzIhme+hkHVFU8yRQeItpcwg6UW9J6sDjo6szWyCiD7HYy+MdyzKXVpQcPZGuG5IVa868XJ89HG
	s8ux1gkMSEXBp0sxn4S7/mXniOuLwgaLswPGjP9x9WtfcrMF0Pf370ILMx1s+GsUFeyVpJw0xEu
	Ht9cbXWv8+hbVMx0kE34V8xTuk81q+KG29gzKEB2WsUKIJAGcaDb+eR7Zjid/QuSSUeuXYrQr/G
	8sm1LwDmsX/JwC9Xjy2iC4eus4e/xOO/dzfYc7JqNkC2K/a3aHmIfGdy/iOJ3RYCNx1yGjk4M8j
	y0Q1qtuqsVtcKllBj1vOB9fr1Y/THIhGkGkQW2M/l1xb0IMUBfYvhT9bwHCwEfu4=
X-Google-Smtp-Source: AGHT+IE3cnDdikM1AS84OGv/BitJnwFCLU24i9ehxYAYk5ogEgW+SPifLAYY1v91a2wdyvVXu8YIAQ==
X-Received: by 2002:a05:600c:3d97:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-45334b07fe9mr34281505e9.33.1749825574403;
        Fri, 13 Jun 2025 07:39:34 -0700 (PDT)
Received: from ?IPV6:2a02:6b6f:e750:f900:146f:2c4f:d96e:4241? ([2a02:6b6f:e750:f900:146f:2c4f:d96e:4241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c2d2sm56899625e9.1.2025.06.13.07.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 07:39:34 -0700 (PDT)
Message-ID: <657181dc-09b3-4f1e-b9aa-ed1d77826e8f@gmail.com>
Date: Fri, 13 Jun 2025 15:39:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hughd@google.com, david@redhat.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, ziy@nvidia.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <cb6d3f39-e0a2-4618-b36d-fff8724bf619@gmail.com>
 <6d0e65f8-b12d-4ce1-a996-ebb053b9b0c5@lucifer.local>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <6d0e65f8-b12d-4ce1-a996-ebb053b9b0c5@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 13/06/2025 15:29, Lorenzo Stoakes wrote:
> On Fri, Jun 13, 2025 at 03:23:19PM +0100, Usama Arif wrote:
>>
>>
>> On 05/06/2025 09:00, Baolin Wang wrote:
>>> As we discussed in the previous thread [1], the MADV_COLLAPSE will ignore
>>> the system-wide anon/shmem THP sysfs settings, which means that even though
>>> we have disabled the anon/shmem THP configuration, MADV_COLLAPSE will still
>>> attempt to collapse into a anon/shmem THP. This violates the rule we have
>>> agreed upon: never means never. This patch set will address this issue.
>>
>> Hi Baolin,
>>
>> I know never means never, but I also thought that the per-size toggles had
>> priority over the system ones. This was discussed in [1] as well.
>>
>> My understanding with these patches is that if we have:
>>
>> [root@vm4 vmuser]# cat /sys/kernel/mm/transparent_hugepage/enabled
>> always madvise [never]
>> [root@vm4 vmuser]# cat /sys/kernel/mm/transparent_hugepage/hugepages-2048kB/enabled
>> always inherit [madvise] never
>>
>> Than without these patches we get a hugepage when we do MADV_HUGEPAGE, but with
>> these we won't get a hugepage anymore eventhough hugepages-2048kB/enabled is set
>> to madvise?
> 
> This isn't correct, madvise at a specific pagesize will still be permitted for
> MADV_COLLAPSE.
> 
> In current contender for this patch:
> 
> /* Strictly mask requested anonymous orders according to sysfs settings. */
> static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
>                 unsigned long tva_flags, unsigned long orders)
> {
>         const unsigned long always = READ_ONCE(huge_anon_orders_always);
>         const unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
>         const unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);;
>         const unsigned long never = ~(always | madvise | inherit);
> 
> Note that madvise is considered here.
> 

Ah ok, Thanks for clearing that! I was reviewing the original patch in [1] but I
see this version in the replies.

I wish this function was simpler :) or maybe its me that takes so much time
to figure out if the order will be set or not by the end of the function.

[1] https://lore.kernel.org/all/8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com/

Thanks!
Usama
