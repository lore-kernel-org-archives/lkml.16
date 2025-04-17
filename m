Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB55617A30E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 04:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744862992; cv=none; b=XQi0YmYA1A1y4LjFhRtgUK23aHR82yP4tQIPJ039Y7VpkcSs/jQxKA8JbeeSp13f/5Ta27O+09u6Debbfd1Y5opN8ZspMj8zLdpj7kSrPcdEEaJxw1j4v/CJu9mhByK49VtrMU3g8N7wj00t5FlNu6QDvwz6zawE+25f8s5NB04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744862992; c=relaxed/simple;
	bh=0APB4Z7PYCEtdumoOideDwwUmDkWYhwO6Nq5BUWshck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qqm8yo4gZ8g0RtSuk6PmnLnUZTHakASG7LKkUYA8CBojKjaAJ22dbhvRvJMREkJma8rHef4sgr0r8nwPzz+qxJd7w0J5/tAE2I6TSI5QnguMILJNFU8TeFir0gy0euFM2zZfQf4Peb7cGuW9DBL/k9Nqt6qkc2pFxjSnGEx/x+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=U02x39it; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="U02x39it"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43f106a3591so508975e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 21:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744862988; x=1745467788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CmAAgAw+8wjItsnoM1fz7uxksvdaBuvdDr29jpNBkgE=;
        b=U02x39itdBwGp2v6UjknjdhtvHqzk05z8NJH9aqvbay66x2nNXkKwlDwcjgQB2TyDD
         oLubZBlH05bt4R/qOsdcJ4UVnW/tUyaeWdJIWZtiv8R6KwvZU/LC0xsZXx9+RsBj96M/
         ISKdiLy19E6J0tnZSKwwGtCUzpnVyy8QDBoYiBL3P9Nw4hrTLsTCF123nU1QOOXQgO/i
         aCCdG1DDHz8/zIywndiMwftq3Tira8qHvG1y2oouSz0NGZmBsTNrcik7ikLkFbk7Oqi0
         LZaOOqsLTrNIW+wxC8+L6BZckLemgE8wQJaKJIis0khwmLUMufO+LWpEig8Nb+w4J5lC
         C3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744862988; x=1745467788;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CmAAgAw+8wjItsnoM1fz7uxksvdaBuvdDr29jpNBkgE=;
        b=AwHQo4XNQE+oMucpxN4BnZE+MZrBC87ZmyBZAoZM7yUgyNaW6gx6mbL7C/Es9Odixp
         lsMOsVmkqKWEP+/cPfFzVdbXyfeX9go67Fv7OVhYIlyDa4+QkbQYs5TqRuuF2F0eOpJ1
         NrPgCHVpJkh2OE0Qvjfqz0LK3HeHpAzl+NreWlgsY1a+gi8v6aQDOqwTBCIgl8RV4WBl
         CiMtJNN7/bS7oyUdWAym5wB17sDDRXT5jyk9lvo3KTl8hS6x9HkWkp5lrmCvta70vnFE
         SSnvmAoIc7KEiNm+vPwu/nmU85MEwPYo+Y39oNvQ6MDbo/R4iX262d42A1jjIseXi/2f
         TL6A==
X-Forwarded-Encrypted: i=1; AJvYcCXK2+Dbkqn/90n5jlEFXQYmuEzaf0wMPa23pJEftK9XID8tnWIhYPS5ASZI+FRihoRBvuwFT6yU4zEF3ik=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAzE1ZhvUsBe9oqddyJRS39OWbP7HVHIoB6J5Ke5CPrzSCwLH3
	9g+LWm7ep7vN3jPVLao8vSdlY/TFC064laqbwYyEsRFTvqujv30fMVZPbtpgSvg=
X-Gm-Gg: ASbGnctLZrUSFyv44gLBPfb27L8gD/5nfY7aHm5GnUUozww/eoaV3Gye0Xv4BqFoe3Z
	FnPeY3T4fw9zEkhojx0A+cKcVfcPHH/0EKk+EujIOTwgGPsWbhzhypBK29TYckbKeOY2AYXBlFm
	mj/jdqp0IsC8CeplC28uJz0k+iuYUiWg0Z6Kq78J+wtDCU4YdLs1KMOdIMlVTnScLUYw/8YRfwI
	zGdAltK4wsdknWHe85AylEm2BZOmvC5P+WIshBT9m8aNZfWCNq4JntzIuakRMbPUZtBUcx6VTSX
	TzPMWRxFEKMlWgVvQA/hHLRx2yT+HmMoPJpoUstpuyM3/2E=
X-Google-Smtp-Source: AGHT+IF/J6KQSYubSxQVK5CyK3J6aeW5I1HGlC0IkrD8ovhYxzyitf5uwoYd2f5CHRYfTlmeYJxVZQ==
X-Received: by 2002:a05:6000:220d:b0:385:de67:229e with SMTP id ffacd0b85a97d-39ee8ff518dmr502594f8f.11.1744862988085;
        Wed, 16 Apr 2025 21:09:48 -0700 (PDT)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230db00sm11666687b3a.130.2025.04.16.21.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 21:09:47 -0700 (PDT)
Message-ID: <9ad1e16b-8537-4161-84a6-6f2b4b37dc1f@suse.com>
Date: Thu, 17 Apr 2025 12:09:44 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/1] ocfs2: fix discontig allocating issue
To: joseph.qi@linux.alibaba.com
Cc: ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
 gautham.ananthakrishna@oracle.com
References: <20250414060125.19938-1-heming.zhao@suse.com>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <20250414060125.19938-1-heming.zhao@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Joseph,

ping...
I see the previous patch was dropped by Andrew, but this v2 patch
is still pending for reviewing.

- Heming

On 4/14/25 14:01, Heming Zhao wrote:
> When running ocfs2-test, I found the same issue [1] regarding
> discontiguous extent allocation. The previous patch [1]'s commit
> is incorrect, and the fix code is insufficient, so I am sending
> this patch.
> 
> PS, there is an ocfs2-test PR [2] pending for review.
> 
> [1]:
> https://lore.kernel.org/ocfs2-devel/1f3049dc-5536-4a27-8768-b264be062f7c@linux.alibaba.com/T/#t
> 
> [2]:
> https://github.com/markfasheh/ocfs2-test/pull/21
> 
> ---
> v1 -> v2.
> - we will recall patch [1], so this patch merges some codes of patch [1].
> - polish the 'if' condition in function ocfs2_search_chain().
> 
> ---
> Heming Zhao (1):
>    ocfs2: fix the issue with discontiguous allocation in the
>      global_bitmap
> 
>   fs/ocfs2/suballoc.c | 38 ++++++++++++++++++++++++++++++++------
>   fs/ocfs2/suballoc.h |  1 +
>   2 files changed, 33 insertions(+), 6 deletions(-)
> 

