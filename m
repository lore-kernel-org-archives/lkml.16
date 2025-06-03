Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD981422DD
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 16:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748966444; cv=none; b=KXmm+QA9LdutImAOozS1c6C4jMRZaVKiy/PAr5A6Kax+614QibSDf/6/A4t057eBJ/8AYIYEFgkPcLQDPVTY6M+f8MXhmBIGNkwpcuzVgEGn3MYeXqPkFopirEqtec05j5VpVvyYtIMUrb27MmBalnUWLyVRMvoCIFSMSW51jPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748966444; c=relaxed/simple;
	bh=LwikQnd4kY/l2HC04fd0aJDXqyM8NbE8MR+VnfBiwPA=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oiZKhDWfaOwPvVJlVWMCZpLXb8XeXdP/OM9XOOjLopQxWdzpxO0r7J4nsfkHKZtvwIpmC+IrFHXGWiNEow9G+bnrHtfRoTNkm83rFruFu3+lv8oBaa9DheDUyPnjmZ71MGKXmO4tO5FJ0t9qrM4OW2Biq7tAagWzVOKQ6HIn39M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GSdT58mZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GSdT58mZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748966440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MLjRagl6AMKFVVOCSkMlOIgXvGzRvhYyu3bWH5FnVWI=;
	b=GSdT58mZCUaMaVE3NlOqJtCMatHAEFHLFjbevGD5ngCVFhNG6r7e8cv3/2J2q7uoYIKZLR
	0TdeyI89kn/By+K2sUZOlpKRKQ9jDDGv5g8ZBMkjHk5UP8LywDU6dozJibQ3/9DybezZza
	A13ubU6dktOmDfQzkArbWDxcgPN4M7c=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-Ve3UE_euPWmfYBMy0YK2Tg-1; Tue, 03 Jun 2025 12:00:39 -0400
X-MC-Unique: Ve3UE_euPWmfYBMy0YK2Tg-1
X-Mimecast-MFC-AGG-ID: Ve3UE_euPWmfYBMy0YK2Tg_1748966439
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a589edc51aso54500321cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 09:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748966438; x=1749571238;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MLjRagl6AMKFVVOCSkMlOIgXvGzRvhYyu3bWH5FnVWI=;
        b=wWPLrGXSbRmOCh6lsrtszndU0R0qifgNGVFkJ974v30K07fvNMEr/DYGNF4lB0QjSl
         /Fgvm4S2jMK0dzDm9AHFeWbLe2z+LHMtZnesVAQ4x2EQwCtw38T4B6dsQV6Egiab8uL9
         MPmY0Ioh46RX/qh13060dOqH9G9yzVeRVd6Jrk1FcKEH9dZ/RWlDpTYZo2nqgMY32Iam
         F3ffemHM5I/YN6l0LUD8Pmln68T60qlEioCJ1WBXyKJmdWfQEHdthP7xIYwS1A9FrBi8
         zofnjU4BaalgdsG/7k3GHnifFbAmfHHThqpK/018915zWnkGTQ1gmE/O0WShzcWCGixM
         uZbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXImkCdpgjwERzSbU7pxDPmbiErNpdeGnDVBmokpFHdObFViYPH3VgjH3AECRxceEo4YITHPflzu00OXHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPCNs8JkbAc9RBsINpZPXtVx7Kl7yC1HDVUf4eJDRO1mSzyqbx
	3cg+iTimSU474rLj+FmSA6ApSFdbaMinLq7pEdQpLCl1Ap9iqgRcpzVR6HCG1gzDn+NAUpTorU4
	JWRf87Ad/T0afvaJr4MHPpDYahl9ZHYLUG/Hgrz6Ly5nkY2iQp1Tsu14GSyx7zT/qlm8lKqKbv5
	Nd
X-Gm-Gg: ASbGncvybhEdpv5JVI6+4mhIV4ep91Vv9vuIhWCHaT5lZMs88UC3rrf8jtjumJGv2hw
	JUyuyGAmtvmnutVnV2+BKnNuSqB855Uqd+Y1mI1H076+g8eEmwqrR/tke9QUqF0dh7yZITycnhP
	YWrSAS0MY5WIIDfYK28pUEFltPB17209PCbg/gybP69qFDvWp0G2GOQW+IToTcuCW8EpEYBYfQc
	gDhRzDKSq0XyO9v7ktX2lYs5H6M6o/BnnSZj9pbphWOLOW8EQtKfIBvSJFgPEM2JgFiyD3eMbX6
	9lZMOf1calZA1ZL7tnsG1jIuLt/vsu1V0tm1ANmTXxZlh3fG0gMm/Gq+FuGrrIVz3TAR
X-Received: by 2002:a05:622a:2307:b0:4a3:800d:2a8d with SMTP id d75a77b69052e-4a4aed7b83fmr231758831cf.52.1748966438239;
        Tue, 03 Jun 2025 09:00:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyNPlYI9vv9aBoaciBPavw0ylOELOzAGIXwsphdlhsbgeTU4HmYtbe5S6CfG3haCA6LskpDQ==
X-Received: by 2002:a05:622a:2307:b0:4a3:800d:2a8d with SMTP id d75a77b69052e-4a4aed7b83fmr231758041cf.52.1748966437730;
        Tue, 03 Jun 2025 09:00:37 -0700 (PDT)
Received: from ?IPV6:2601:408:c101:1d00:6621:a07c:fed4:cbba? ([2601:408:c101:1d00:6621:a07c:fed4:cbba])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435a81f24sm75276101cf.75.2025.06.03.09.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 09:00:37 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <0a90b2f6-78f4-45e7-bc10-e625f984a757@redhat.com>
Date: Tue, 3 Jun 2025 12:00:35 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cgroup: Drop sock_cgroup_classid() dummy implementation
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>
References: <20250603154528.807949-1-mkoutny@suse.com>
Content-Language: en-US
In-Reply-To: <20250603154528.807949-1-mkoutny@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/3/25 11:45 AM, Michal Koutný wrote:
> The semantic of returning 0 is unclear when !CONFIG_CGROUP_NET_CLASSID.
> Since there are no callers of sock_cgroup_classid() with that config
> anymore we can undefine the helper at all and enforce all (future)
> callers to handle cases when !CONFIG_CGROUP_NET_CLASSID.

That statement is correct with the current upstream kernel.

Reviewed-by: Waiman Long <longman@redhat.com>

> Signed-off-by: Michal Koutný <mkoutny@suse.com>
> Link: https://lore.kernel.org/r/Z_52r_v9-3JUzDT7@calendula/
> Acked-by: Tejun Heo <tj@kernel.org>
> ---
>   include/linux/cgroup-defs.h | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/include/linux/cgroup-defs.h b/include/linux/cgroup-defs.h
> index e61687d5e496d..cd7f093e34cd7 100644
> --- a/include/linux/cgroup-defs.h
> +++ b/include/linux/cgroup-defs.h
> @@ -898,14 +898,12 @@ static inline u16 sock_cgroup_prioidx(const struct sock_cgroup_data *skcd)
>   #endif
>   }
>   
> +#ifdef CONFIG_CGROUP_NET_CLASSID
>   static inline u32 sock_cgroup_classid(const struct sock_cgroup_data *skcd)
>   {
> -#ifdef CONFIG_CGROUP_NET_CLASSID
>   	return READ_ONCE(skcd->classid);
> -#else
> -	return 0;
> -#endif
>   }
> +#endif
>   
>   static inline void sock_cgroup_set_prioidx(struct sock_cgroup_data *skcd,
>   					   u16 prioidx)
> @@ -915,13 +913,13 @@ static inline void sock_cgroup_set_prioidx(struct sock_cgroup_data *skcd,
>   #endif
>   }
>   
> +#ifdef CONFIG_CGROUP_NET_CLASSID
>   static inline void sock_cgroup_set_classid(struct sock_cgroup_data *skcd,
>   					   u32 classid)
>   {
> -#ifdef CONFIG_CGROUP_NET_CLASSID
>   	WRITE_ONCE(skcd->classid, classid);
> -#endif
>   }
> +#endif
>   
>   #else	/* CONFIG_SOCK_CGROUP_DATA */
>   
>
> base-commit: cd2e103d57e5615f9bb027d772f93b9efd567224

