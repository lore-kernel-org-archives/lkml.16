Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC16A2F4311
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749793992; cv=none; b=AONBvllJPb1M0BYmbJ/KPEyC39NBp+VhnqaB8IOv8VfAKmCrFfbArrUJhrZhlAQHZDcRur+YW4nGr5mslWscLnE1zjglXNQs5cx6FjJ3QGNik9LEq0bAiQBugk84Yy232pTDdFDA8g/l9JdkzhHu0HkBJmxc61apUqc9Vlvik9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749793992; c=relaxed/simple;
	bh=E84jZASd9VrkCktkUiz5jFkq3GE3aTxqEKWj2Lca2r0=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XdUi4X3KJTlfBTOY38XWUqGLyhrYXo4AOHGL0MxvihgSD4lULEKkegDeRgNEtaPBWEbzLc6n/sggcEo/qC4WifwhVUmVsxUH4HNt9Sh47k+SKIVklMTUPI7hj82QrXOObuEOCZAJ740rrRXouLahiuc+LujftKp/NjBC55Wmlos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i1L9T31P; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i1L9T31P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749793988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uRM/XkwtDFJU3Fu5AOGF8vxNu/ZWgeclRQ0HOKH7F88=;
	b=i1L9T31PkjNTjTQo//g0+zx6N1EmIoBWaoBU9VtnKr/ZJvdxLqTQj07gTh/Yg72oil2LSf
	GqVci+rrB8UE9aMl97IZo9Io98nRNG8DuyFB0PQJgES8qnMUCnuynEee+tkNqJ3Y808BR5
	Oy0jmfFZaOETfRl+AOj1+Y7gm6CbPIE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-HHU6Kyd0Nr21A-YugRzm_w-1; Fri, 13 Jun 2025 01:53:07 -0400
X-MC-Unique: HHU6Kyd0Nr21A-YugRzm_w-1
X-Mimecast-MFC-AGG-ID: HHU6Kyd0Nr21A-YugRzm_w_1749793987
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fab979413fso35878336d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 22:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749793986; x=1750398786;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uRM/XkwtDFJU3Fu5AOGF8vxNu/ZWgeclRQ0HOKH7F88=;
        b=pZsf+o6k6l69cxalNaskCoG+57hGdMoyYbWI6ySL4jL47PJkFClM5+3O95XVWgXrep
         X7/TrfIqWc4/edwV4TOpQX80cBLixIkIbFeXM74RxXeVQTEFbvNqb27FC66jp2qVYKUQ
         4diBYpwWONCkZ8GLnHg7EWfAZASoP8U+BBKivj8XSM3GaIy4vx4jzVamwmx9qMvHySVt
         3p6BYMPRdAS7KKyTj7VkDGDfmiAMzwcap30IDQYqJTwFMSxMtfSKHO5s1YrqGjX8Swpu
         gPFDAF2cE09LyPxz9Tt2xAEL0PnB1+3OkNbZ5K5HVvLX8J6aGVuOg16ClYLbITGl6aAg
         MfGA==
X-Gm-Message-State: AOJu0Yy2bCJ/75Hj+GRi9fJQkiSi1svfHvKLDrhti0ywpIy+VenAlLZU
	1XkkD4HFpnBZyiBGIoVhWDtPCEc2eZErK3ouG6Aob7apNNwdRiaSJtbTDMwNqDx48n5iWSVja8T
	LyLNno31TdNdGNkd7TPbdHaTsZxrb+PxiPErqVl6eqpyHIJe8vGUqYZY5tRPUGV75yDUmtkfmPK
	9d
X-Gm-Gg: ASbGncvdunJkpDXMhSocl0ymCJ8VklAlHZ8PTNHrB7Reg/ZFMaIhRsnjfF7JUXSCyYP
	G0heZr8z2B8bASj/99eK9wi5rWR/U5c5ORi3blJavL8o4SU2dWieqWFmuPXBpisLXeFQ8NT6WSf
	BCuLsHzDgOViEAqE45OEQJR5C3bXdD5XsE6GynYo1LwbRw77iYHSdZ3DVHZNZMDsaEo2ZQQNcKw
	tF7VpCBrxsy5R1Gfv/YIbGI+lN1laoz7CTIWifoLDq8lomskEjAt2h9uFYl91K30g8DwjGdAQoC
	vN8Zj/B7+Ajx7ZsLUeLPFLHHwYmH/3LmFIwn
X-Received: by 2002:a05:6602:4181:b0:875:28e5:92e5 with SMTP id ca18e2360f4ac-875d3d4c8a2mr208128039f.13.1749793975515;
        Thu, 12 Jun 2025 22:52:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfT3vZmyWBhXW9Py11Ri5qfbIXpcGOdhc8T4lJJRvwqujl2GDwJOVyYUgmO+X3YgxyQOhGaQ==
X-Received: by 2002:a05:6e02:1786:b0:3dc:7660:9ed9 with SMTP id e9e14a558f8ab-3de00a267c9mr18607045ab.0.1749793964593;
        Thu, 12 Jun 2025 22:52:44 -0700 (PDT)
Received: from [192.168.21.4] ([216.228.39.50])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50149c85ef9sm155867173.119.2025.06.12.22.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 22:52:43 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <7a006014-bf6e-4480-bd61-b0333c74e3a4@redhat.com>
Date: Fri, 13 Jun 2025 01:52:43 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] locking/rwsem: use OWNER_NONSPINNABLE directly instead of
 OWNER_SPINNABLE
To: alexjlzheng@gmail.com, peterz@infradead.org, will@kernel.org,
 boqun.feng@gmail.com
Cc: linux-kernel@vger.kernel.org, Jinliang Zheng <alexjlzheng@tencent.com>
References: <20250610130158.4876-1-alexjlzheng@tencent.com>
Content-Language: en-US
In-Reply-To: <20250610130158.4876-1-alexjlzheng@tencent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/10/25 9:01 AM, alexjlzheng@gmail.com wrote:
> From: Jinliang Zheng <alexjlzheng@tencent.com>
>
> After commit 7d43f1ce9dd0 ("locking/rwsem: Enable time-based spinning on
> reader-owned rwsem"), OWNER_SPINNABLE contains all possible values except
> OWNER_NONSPINNABLE, namely OWNER_NULL | OWNER_WRITER | OWNER_READER.
>
> Therefore, it is better to use OWNER_NONSPINNABLE directly to determine
> whether to exit optimistic spin.
>
> And, remove useless OWNER_SPINNABLE to simplify the code.
>
> Signed-off-by: Jinliang Zheng <alexjlzheng@tencent.com>
> ---
>   kernel/locking/rwsem.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
> index 2ddb827e3bea..8572dba95af4 100644
> --- a/kernel/locking/rwsem.c
> +++ b/kernel/locking/rwsem.c
> @@ -727,8 +727,6 @@ static inline bool rwsem_can_spin_on_owner(struct rw_semaphore *sem)
>   	return ret;
>   }
>   
> -#define OWNER_SPINNABLE		(OWNER_NULL | OWNER_WRITER | OWNER_READER)
> -
>   static inline enum owner_state
>   rwsem_owner_state(struct task_struct *owner, unsigned long flags)
>   {
> @@ -835,7 +833,7 @@ static bool rwsem_optimistic_spin(struct rw_semaphore *sem)
>   		enum owner_state owner_state;
>   
>   		owner_state = rwsem_spin_on_owner(sem);
> -		if (!(owner_state & OWNER_SPINNABLE))
> +		if (owner_state == OWNER_NONSPINNABLE)
>   			break;
>   
>   		/*

Right, OWNER_SPINNABLE is no longer needed after commit 7d43f1ce9dd0.

Acked-by: Waiman Long <longman@redhat.com>

