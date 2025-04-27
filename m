Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9421AA1E0
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 22:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745791405; cv=none; b=eK3WAbrOhFeIKjY3i6KsMCgH0zIUok9s7u3oDXiJzSt57dKFRAgS/z5tcZflFy61z7BGN83z2wU2+ux5E1O/KeJ8MqRgxobc/ddVvSH9u51u1HLZyBfB1QERO0WNUFlLKgxlXWI7F1+NILXRMyVcbXYELyl941eQAuNBzr1xhaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745791405; c=relaxed/simple;
	bh=wbWIQsG0TRi0Z69jTSR/6qQLHNml0VY3lWNXqp2lK74=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZOf4838mED9SpygpD43KCF1ncRQkjbLaIm94em6mFDw5+WUo/EExfZEKSG8RGvMzoCiTkRJ48F7qa2BJk8nx6jabLjvRHZOanns0XsMk/L2CpJqfbLZ3DLKdRQNmtZXycMPFJVHyN8M3IVNPckTUtGrLtUdcZ2nK09MDS1cq1ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=sVwmnSMN; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="sVwmnSMN"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-8647e143f28so19146039f.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 15:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1745791401; x=1746396201; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iNCX7jQ7H/so529jI/n/le9Q7aHsjoCS5ZZgId6Z/yc=;
        b=sVwmnSMNmyED1KlmSA2O2DWYL8qBOCeqgKjDwG/OM9DL+OrHdi71+vlXzHK1nD5iOs
         drFkHPc1+rteWEpTwrr4PLAKeG5ZigLa0HlG0GFRqhK1KyJjDETw00+BBIb0EzEBLf/x
         Ki+11mHqM8UbB7jEoXU3bp34bqe8kXU7RVoKTC6gAKIEF+zpzj4k+lH/RxZhvXKqU2LI
         QVg49wGGroz/WJShJUKOXNJoF+NFLWI2JDc5DVEUofYoITUmRokB1NRzISFXZZcTRtO1
         Nnoc0nloexBbEO58XkkXjef00iOw/qVKoKiJdihFXCt3uBoiuyErOtYmJFdenGATURYn
         HqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745791401; x=1746396201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iNCX7jQ7H/so529jI/n/le9Q7aHsjoCS5ZZgId6Z/yc=;
        b=TXy9WREMLKX59ft01IzCrSzbkqEDojD3HS3OGEqmIoD3wGO+q7XU7fVjdnqRz8mn30
         51QDDlxw4Rb1T9i76Xc4ugrgqUDe3/QXzOrDYT4T9jZkocOCE51GDC441nAw2J3lhdb9
         Ed7jSdmVRG+uAj9C9lt/+yEfVF3X7P9Cr4EqUa0wU+33Dky3m4MHJZELAKrFUS94OucX
         ZdZzl7HYa+vWEpQs8TTSSDGkdiztsczWHAo6TC1P4BlszVFnC46T7xshnwKbW7XAg72A
         2sPIJO6vjkyBuYWTj88zdklgVLKkHtIjFUFidIT39NMOYB3hjXxVYYs5JFO044VlriUB
         1IvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+VQ//kj1651GJLERAKMpGoT3udxDAB5IZEZU+vUjSwh2YMili4nDJ/Ilu8rOOk0D0q2D3y9FP0OblXQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiHb7joWRnQ47eQ5DUtSYHTkdOQ6KDVYWnNSq/dtdBA7RJ4BI5
	mq2k0ubDA6KQA6yJhBYZ0XnrfMh+N6d1t6uz540HDNj3NQdSKVt5emC0W7XTOCg=
X-Gm-Gg: ASbGnct59/Ty5MeZ0apcopFvaPtBJIBZfvo5vouA/fbNeQSn5T05cns00Q/2gHRpMM1
	gGN7pHWUMb4cCwqzZflLdvxIF/v3k28tJk0ZAjRg1rxj3vtcXTDdxGbbeinTR55KUiEnzC3T1aH
	gfKP2k4AAaQ61XYJ+FYMrvTfA+ZLXiDQk73na5Op5Tyo+A4N+D3TYkveKnNFs/vZOrR9mD0ktg9
	fiUjZYoVZu0jSp/1D1O2o6QZ5zxdHE5BhjebhHBXC3PQmJKkGVgtlwtj15WJus4ZgN69XSf3Aq/
	dpzTJb9XINhHi5KnoFPxEd2S2DMiRiIEnPmEWw==
X-Google-Smtp-Source: AGHT+IH8E48JkKAwtfL07JN1fQUrwgYyFUebyUWasSyzEypQDtEo25xd4qLu7SAT4RR9O351jR9ePQ==
X-Received: by 2002:a05:6602:4915:b0:864:677e:ddae with SMTP id ca18e2360f4ac-864677f0f9fmr543606539f.6.1745791400964;
        Sun, 27 Apr 2025 15:03:20 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f824b84a22sm1919686173.92.2025.04.27.15.03.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 15:03:20 -0700 (PDT)
Message-ID: <fb3add67-c469-483e-ac51-e53dea7df360@kernel.dk>
Date: Sun, 27 Apr 2025 16:03:19 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] block: rnbd: add .release to rnbd_dev_ktype
To: Salah Triki <salah.triki@gmail.com>,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
References: <aA5Rzse_xM5JWjgg@pc>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <aA5Rzse_xM5JWjgg@pc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/27/25 9:48 AM, Salah Triki wrote:
> Every ktype must provides a .release function that will be called after
> the last kobject_put.

This commit needs:

1) A description of the problem. There's just a vague statement in
   there.
2) A Fixes tag

-- 
Jens Axboe
