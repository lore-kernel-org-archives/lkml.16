Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7926136A
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 00:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745109108; cv=none; b=skMTLH4gGjHZcylvF/AW3xI56T552HFxAm5MsZihM+Pr7hCSwn5o8GzuCiDUr6OJMBDAkeKIAvp95tnH873YdCkvJzYrLIiJ3X/nFib22hPUrweJhciHo5cZiYjjwiMggzDZE4W1cmfElQG0gcUBkzyOPlsnHaQwVoRf2Z3a2WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745109108; c=relaxed/simple;
	bh=t2bUeDF0C4BrIq4nQJddgy/7oBtAv3a3RWQqjgt8epc=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SnDvrMkxA0BH4LpuXcsx9jdDCMqRQ1qAOsz+m0BTcAEKNfnMid5n+3fHUGjTn4XlOsqp/BntS2RC+Neujc6aOCrkbcY1KZdxWTeuZ4ISpAX8sLEbkgqN+Uj5Q2EqGULcdH8TMW4tr6Xhiy88VIJblIYaJ1MEvNdP2sMb1BezT4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ug1ib6UZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ug1ib6UZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745109105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dgEWx6bqfsYcNIZ2nRjRSHhDwyAXgwASsQ5jmGYZ/+8=;
	b=Ug1ib6UZPrDZt49xw4cSQLcY9nuYpIeyHDj1ewRlwA03RrpTeG8suOwUP65xg+fK8CB+Tr
	aPUhdsTirJRoPMKrUNRXOJRRhhKFVwI/wB2HOw0rZY4PbiXQ0uTpaDp7midcK1GYHQW1bM
	EZA5mm866w9+nOTNWO+Na5+X3H4DxL8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-A7aJne0GPXCxijhHPTDacA-1; Sat, 19 Apr 2025 20:31:44 -0400
X-MC-Unique: A7aJne0GPXCxijhHPTDacA-1
X-Mimecast-MFC-AGG-ID: A7aJne0GPXCxijhHPTDacA_1745109103
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c544d2c34fso392920885a.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 17:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745109103; x=1745713903;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dgEWx6bqfsYcNIZ2nRjRSHhDwyAXgwASsQ5jmGYZ/+8=;
        b=OOwULT2VRb1lnbSrma7C0ZhWS7k07hQH5+E+x9D+kILSvVgSCFb4fh/kWWxrBDGZk2
         7ikO8rirjkUdh+lANFqyceoTSkN4/2D1qR6tqOb1dxV8/NsfZ5Kv3xxtxMNHvGMHKdnp
         sPRGJrIvGVDqev245UfGLnYlpUjWxrEggQT5/ZyJTBbwgSyllJBLokq+7CEX7axqu13t
         5ENgixO0OaGNsiIg200F8F06P004dGkzdvoTj5g+sAsipF/9F0dRrKFTuYwPvKErBzOD
         lyLgURojq3O3uA8b+ZeH3d9Tfo3Ud2zpKFsO6VUops+DySUKd7cDCryedrb/ZCbNEpcv
         gooA==
X-Forwarded-Encrypted: i=1; AJvYcCVuBWPtojbXMh+tw8heC8NPm+eVSzuVXiZQgVXfu9+//S5L12mu3Fs+Q2tSo0odv2VTakVAWnpQKvowYR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlzR5V2qu3mYhcooCpU6zhtOeBW77YHATqbs8212fyoX7GZxQs
	9Vc62ygHpvu/31HcasqBBIexTh3r7j9+uwoV/axc3afXs7RyEEECP3e5oNtnU3mum/d0HTw5VKm
	GCtXCAoB1U1ygB1rnyBzmQJa4TNYJ2LsBnIjqWJ3E/zmPunSyTrRaZy+Ve+9Erg==
X-Gm-Gg: ASbGnct8AeHEEQYZGCeWpO0iRvsABhV99c+YBihR9pwy/dhkL4S7KugWwkUhFrhzPSi
	ZuVvD0hMEX2TglclRjSMx1Pps1QFMaLEf2ldH4iCNKnwkKn5rpwcpeF2b9OQDbCkUq+g5y7XSa8
	Y6d3XQ6rErG+qE0wOEwfZ6W4LqFswhgiIoLT8XVlr0WRHcpwikpLsIHl9WKIfHWDFfb3mqHHc2H
	MKFaH80LmV45ydjH+ZnbDh6toAemC5NmgBat/yzMPbN4cN2jfg+2MmlU7xL1NVTRdCbKmscCR/7
	V6e1nXGDaUKc624684lb9LVFA/6npzSxrwwW1XnQ8Jhf0joxsg==
X-Received: by 2002:a05:620a:2482:b0:7c5:4454:6b05 with SMTP id af79cd13be357-7c92804d3e6mr1365215185a.57.1745109103695;
        Sat, 19 Apr 2025 17:31:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3CW4OI4+0M83k8AsYGQ4HxOMj60YbZOnkxwdYcny3UUeUE0axskyJtzAkSfGwP8v9qyUOJA==
X-Received: by 2002:a05:620a:2482:b0:7c5:4454:6b05 with SMTP id af79cd13be357-7c92804d3e6mr1365213585a.57.1745109103442;
        Sat, 19 Apr 2025 17:31:43 -0700 (PDT)
Received: from [192.168.130.170] (67-212-218-66.static.pfnllc.net. [67.212.218.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b4da22sm258243385a.66.2025.04.19.17.31.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Apr 2025 17:31:42 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <532fe761-4907-4f4b-b98d-566453301399@redhat.com>
Date: Sat, 19 Apr 2025 20:31:41 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] vmscan,cgroup: apply mems_effective to reclaim
To: Gregory Price <gourry@gourry.net>, linux-mm@kvack.org
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-team@meta.com, hannes@cmpxchg.org, mhocko@kernel.org,
 roman.gushchin@linux.dev, shakeel.butt@linux.dev, muchun.song@linux.dev,
 tj@kernel.org, mkoutny@suse.com, akpm@linux-foundation.org
References: <20250419053824.1601470-1-gourry@gourry.net>
 <20250419053824.1601470-3-gourry@gourry.net>
Content-Language: en-US
In-Reply-To: <20250419053824.1601470-3-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/19/25 1:38 AM, Gregory Price wrote:
> diff --git a/include/linux/cpuset.h b/include/linux/cpuset.h
> index 893a4c340d48..c64b4a174456 100644
> --- a/include/linux/cpuset.h
> +++ b/include/linux/cpuset.h
> @@ -171,6 +171,7 @@ static inline void set_mems_allowed(nodemask_t nodemask)
>   	task_unlock(current);
>   }
>   
> +extern bool cpuset_node_allowed(struct cgroup *cgroup, int nid);
>   #else /* !CONFIG_CPUSETS */
>   
>   static inline bool cpusets_enabled(void) { return false; }
> @@ -282,6 +283,10 @@ static inline bool read_mems_allowed_retry(unsigned int seq)
>   	return false;
>   }
>   
> +static inline bool cpuset_node_allowed(struct cgroup *cgroup, int nid)
> +{
> +	return false;
> +}
>   #endif /* !CONFIG_CPUSETS */

I suppose we should return true in the !CONFIG_CPUSETS case.

Other than that, the patch looks good to me.

Cheers,
Longman

