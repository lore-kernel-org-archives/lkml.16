Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552832222C9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746050602; cv=none; b=C3PkOrsGz68uRfm4SVjXYluhJbtqmB94IcAs/cz4KtA67VNTmoctRnmnexxXiQNLPJmREvJ/YdmUfRWTVuAaD9//0VXMsVYVwt2fEvgeN3UTONZKaptnOEdncftvOKd6SoU6slzPFRHIQjUWS6hAqv0qshpqcKuGrh/GlB926TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746050602; c=relaxed/simple;
	bh=carmFchbB3h6+n0MrYXOugZ7YhuAaQxUxJVlaqD2wNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CsGiV/MkiWq41UTIRBz4GFFEs2bMZCU6bvNHAewhX4CJeJEYOpTjmIt0dr/XLETyQ1mIUF9357Gfgz0aB33xiHHGmcQ7ijpp+Xx3Qym8+ag2kjEz1WJG89RffVKlgFAA57XVTBtaL3Ni3+6QZy6eCWLw5mErzd5VGtANg6XR3pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=J/wjIEWL; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="J/wjIEWL"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b074d908e56so261235a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1746050597; x=1746655397; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2YWN51GbRiePbmSrLsK3YdrUKa8WqlcywHQ98t4q0ho=;
        b=J/wjIEWLQNEMcTWT/OH935StgK+VGN/KO0RL29VwV/LNvBtPtRlEoyfwl+8CKZpJDB
         mCyBrDNMespXAcj6Uo4qPZLUxD9pNcEUtdTI7LH2j1gWlG6CoHijIOU80u7QI3zxkiT8
         sIUtuxykwreXcm1oSC9GKHZy2RnnFCni1ggZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746050597; x=1746655397;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YWN51GbRiePbmSrLsK3YdrUKa8WqlcywHQ98t4q0ho=;
        b=qD29ZaLUI+zg499M+uhNUVvl3HoaiRw/+nbq37X2jlSo/cESM6FlSxavDYTdQnF/AX
         m2jRxTS9cukmKdqh7+Gzliu9la4yYLuOFa9toNNtyBE4qKt9unNCKpAbU5qKFdLNOBR3
         ro6yQohUV9gizGIF3jwXzaSlx06m0nGNgWfDSCFqtI01REWcqryKuy2D7ExzhXRlCsEJ
         IodNN1A4esGYSv5nrCmZqrrO+iFlPy8MzX9y/gRqCznJPVdZQqADzTfCIl3G4y6zLSg5
         VrzdVcfcCXzmyWjVlEU8q03zt7TSG1vM1PQJVN9btIF0xBqNKzJf8f/ykDQFbIs7Ka4n
         urLQ==
X-Gm-Message-State: AOJu0YyPLU8ZJkG2dquPr2Sz4wbPO4SyN0/tDWjFP4xxIxqXW6fY501c
	uDe4MSBnFcp2khszm+WQ3WUrAoO3pL0dv59REEETC9rPVjvdZeIywU96nYNOYMtPWByVh7BqaYU
	hqmtv3RzIh+vBk2xdFiLoQjb8cnqnOCcvKP+n8i9rcYQo/Y+IE3JuQJd5fm++5nzI1g3LYIPvXr
	S6W1M5QsMIe9e0NEJ1H6l781mtmdArc2mcVWXcUaWIoBbIpZhpev62
X-Gm-Gg: ASbGncvVDWVrIr3Q73JmcCitdjjwYdzf2PG+ns3FDMQk+/PmUbWXDkUFPY9ArPcSDfb
	P//HwkfInD1OmJ4fGXrgZfa1Zfzw3H6BcOngUTrZYM6KEtIIbeEeMYvverBahEGxYdK9IcuaSWu
	1nFK5VazIl3T1IQV4EKE/2AKXaMnQrwACSffRVi12s3ypNi6L74LcBeVt7fLeczSTAZS6WjLZY4
	Rl0DVUwY8qsVpEr2jLhe3W8+x99KkwOJ+pBDm8ClOaVvBkbPF7FJH2kqMhbyBbQuJqQity9aizF
	SWfyW07FtxflywNT3xrmhIcJ5Mj9eocpzrtnloNzywzPTyQYyZpqe/7mOOryQu6FBwJ+LSU/2TJ
	NjlFVWAxwz29aBjmxbxDpzjwX8rQ=
X-Google-Smtp-Source: AGHT+IFpLzmAWQyi3yHhSLx4NQ7vfkHaDuiqhdSemTCGHQcKg8Di7BJKaapB4H2wF946DpWxN1pZbA==
X-Received: by 2002:a17:90b:2e41:b0:2ee:af31:a7bd with SMTP id 98e67ed59e1d1-30a343ce7ddmr6267761a91.5.1746050597312;
        Wed, 30 Apr 2025 15:03:17 -0700 (PDT)
Received: from [10.66.194.199] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34826677sm2210052a91.40.2025.04.30.15.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 15:03:16 -0700 (PDT)
Message-ID: <2fe44a46-cd13-47a8-8873-56292028b165@broadcom.com>
Date: Wed, 30 Apr 2025 15:03:15 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: update Alexey Makhalov's email address
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux.dev, x86@kernel.org
Cc: gregkh@linuxfoundation.org, bp@alien8.de, ajay.kaher@broadcom.com,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <20250318004031.2703923-1-alexey.makhalov@broadcom.com>
Content-Language: en-US
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
Autocrypt: addr=alexey.makhalov@broadcom.com; keydata=
 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 EuY0
In-Reply-To: <20250318004031.2703923-1-alexey.makhalov@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Borislav,

I see this patch didn't get a traction.
Can you to merge this fix in x86 tree, please?

Thanks,
--Alexey

On 3/17/25 5:40 PM, Alexey Makhalov wrote:
> Fix a typo in an email address.
> 
> Cc: stable@vger.kernel.org
> Reported-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> Closes: https://lore.kernel.org/all/20240925-rational-succinct-vulture-cca9fb@lemur/T/
> Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
> ---
>   MAINTAINERS | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c9763412a508..c2eb78c1ab75 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17945,7 +17945,7 @@ F:	include/uapi/linux/ppdev.h
>   PARAVIRT_OPS INTERFACE
>   M:	Juergen Gross <jgross@suse.com>
>   R:	Ajay Kaher <ajay.kaher@broadcom.com>
> -R:	Alexey Makhalov <alexey.amakhalov@broadcom.com>
> +R:	Alexey Makhalov <alexey.makhalov@broadcom.com>
>   R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
>   L:	virtualization@lists.linux.dev
>   L:	x86@kernel.org
> @@ -25341,7 +25341,7 @@ F:	drivers/misc/vmw_balloon.c
>   
>   VMWARE HYPERVISOR INTERFACE
>   M:	Ajay Kaher <ajay.kaher@broadcom.com>
> -M:	Alexey Makhalov <alexey.amakhalov@broadcom.com>
> +M:	Alexey Makhalov <alexey.makhalov@broadcom.com>
>   R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
>   L:	virtualization@lists.linux.dev
>   L:	x86@kernel.org
> @@ -25369,7 +25369,7 @@ F:	drivers/scsi/vmw_pvscsi.h
>   VMWARE VIRTUAL PTP CLOCK DRIVER
>   M:	Nick Shi <nick.shi@broadcom.com>
>   R:	Ajay Kaher <ajay.kaher@broadcom.com>
> -R:	Alexey Makhalov <alexey.amakhalov@broadcom.com>
> +R:	Alexey Makhalov <alexey.makhalov@broadcom.com>
>   R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
>   L:	netdev@vger.kernel.org
>   S:	Supported

