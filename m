Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FE72ED15B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 10:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751538482; cv=none; b=Qvom5/kIMgpupGpN2zCHwlI+U20ADbrz6FgsgJbA39nWErlBKuhyQ4VqY4dwDbuumVHUD+j98gqbp3XqRQDlC1mnujNvbcMl4bEG46DnC1UH0I4IiB5xgBhZXGOnmNWvyXj0mLXHnp/mSIB/l5rjqplNL9wn1KyQ6VzwX0wZhBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751538482; c=relaxed/simple;
	bh=Vd/uqzKHQD/JhOyhhE5UNHdt60KiHkdTU4ai+BQ8KUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D39oG5yMogk3CglKF8L1jeL08oza83EDiXuZawIcxAkRfLNPpHfcGks2UY1gpDxIDv3c71Q8J77z+svtqW5kWob2yfvL+1XKJ2s3Hcje3YSqyaXnnwXghXgdJO6FWDOPgEqIDA+2ZkKl+NtG7OaJkcq8vMEYmxol6vZVvRV3Rag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MzicwRSu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MzicwRSu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751538479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KweAxO9X1ydH2zSi0gHOQdMmBGyk8VXrJktfpgZZZcw=;
	b=MzicwRSuNrjiRLIKIGqDx5GukXMlml+uALD84vSJ22CEEHk0AJSejiNS0ap01jHy2n23Pu
	H5fuqqpZ5UPBD1VwfOcvnozy7CkOO6hrpw85xTrqLKmsEgpEvMXua+035xGPZ0kSRDanyY
	zWDTcBIXS+3B0AJuxRZyK9IZdZgQ2T0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-LZ0aws-BNLqNx1hurZgfww-1; Thu, 03 Jul 2025 06:27:58 -0400
X-MC-Unique: LZ0aws-BNLqNx1hurZgfww-1
X-Mimecast-MFC-AGG-ID: LZ0aws-BNLqNx1hurZgfww_1751538477
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4535ee06160so41943015e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 03:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751538477; x=1752143277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KweAxO9X1ydH2zSi0gHOQdMmBGyk8VXrJktfpgZZZcw=;
        b=Bk8Eq7svSdJrODkV+M03FJkJk1TqO/q1/tESa0CQ28IukphJF/ASmrV6VAmd/NnPUq
         FKkPFLbyd53yQoLFfF2aFhR6OI+E2PJA9do4C1XqS3GKrZLlLAr/L8eeDYUQGqckC6OL
         b0P0tb9PcPWli7g1rwjpuOign/8dfRzeocElQc+fjxq6jUx0ZtBOVex1fU0K+DAyq2wq
         HbskXsHlC9uBEdoJHzqkft9HMobGEOw5gRQ/DA6TCi9dqE5+1bWzxXobcXqnZ5nRp6Gy
         WUuct0F3/8eExXl+aoZJvHTnMqQfcukFJWCdZCWdsxL2kdaNY99OdODjUAu+EJF+pjCh
         WZOA==
X-Forwarded-Encrypted: i=1; AJvYcCUnhcseQ0B4bseS0c61RHrhSZJZ9zGGkBpOUJGMz1NikzGGRYLiN6dWfZNk5i4rhRMmAA6y/duy62svkho=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUvJv0AwKzM+Kkfhh0ryyk+X2xYl8qUkwCDREssCT984aV/0DB
	WrhW+ftO004kGfPi3jKSPNBXKw004TYMNsyPeWE79YzJTem8qr2kn+qn3IgQIAjvrpyRc7VngwJ
	JoeaVPcfs38sXPoHUooaPx3532kty0hqYjshX6AKkMwr38RvenldVTY2wmIc6YPIwCw==
X-Gm-Gg: ASbGnctQzpmPPeGEonvH5RA+6xH6V0qyLusdENvKruDf488jILc6gpDWg3j9susvQSl
	CYkcLdVwwIKQlPOClnTxHqyD11NkWB8fxuRHoJrIhAQqQYFe95Wf4QaKfkUpliV33rbq0qy6HSA
	0iFKf5XBG+5zNtJk7cnrwZs5tZlnK5Si26OYjgRhpIrJhzryeyT5lgTCaDAWnq/Y2d3aogh+1tM
	NWaQbFRGbA+5GiT0AqNKUmvibZefXTsei+VIlbqU9itnAGOZE2UrzbzS0RBpNzFUsFAAPXIBZ7g
	a9HYLdu7xMot1StLB1KtzFIeK+XcCQz7PX1+eMYh6dKN2jmMtkO0WvnkdKe+LHeck0Y=
X-Received: by 2002:a05:600c:8b68:b0:453:2066:4a26 with SMTP id 5b1f17b1804b1-454a9c9ea30mr37310255e9.16.1751538476822;
        Thu, 03 Jul 2025 03:27:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhEtUC06vqPeBFU+gz9F16qvcD6gBqNVKKefyqfB1TtM5DvQhTjkFUHnSqAxNRPZeSLSfSag==
X-Received: by 2002:a05:600c:8b68:b0:453:2066:4a26 with SMTP id 5b1f17b1804b1-454a9c9ea30mr37309875e9.16.1751538476382;
        Thu, 03 Jul 2025 03:27:56 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:270a:b10:5fbf:faa5:ef2b:6314? ([2a0d:3344:270a:b10:5fbf:faa5:ef2b:6314])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9beb22asm22670945e9.36.2025.07.03.03.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 03:27:55 -0700 (PDT)
Message-ID: <faca1b8e-bd39-4501-a380-24246a8234d6@redhat.com>
Date: Thu, 3 Jul 2025 12:27:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V2 0/3] ptp: Provide support for auxiliary clocks for
 PTP_SYS_OFFSET_EXTENDED
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Christopher Hall <christopher.s.hall@intel.com>,
 John Stultz <jstultz@google.com>, Frederic Weisbecker <frederic@kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Miroslav Lichvar <mlichvar@redhat.com>,
 Werner Abt <werner.abt@meinberg-usa.com>,
 David Woodhouse <dwmw2@infradead.org>, Stephen Boyd <sboyd@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Kurt Kanzenbach <kurt@linutronix.de>, Nam Cao <namcao@linutronix.de>,
 Antoine Tenart <atenart@kernel.org>
References: <20250701130923.579834908@linutronix.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250701130923.579834908@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/1/25 3:26 PM, Thomas Gleixner wrote:
> This is a follow up to the V1 series, which can be found here:
> 
>      https://lore.kernel.org/all/20250626124327.667087805@linutronix.de
> 
> to address the merge logistics problem, which I created myself.
> 
> Changes vs. V1:
> 
>     - Make patch 1, which provides the timestamping function temporarily
>       define CLOCK_AUX* if undefined so that it can be merged independently,
> 
>     - Add a missing check for CONFIG_POSIX_AUX_CLOCK in the PTP IOCTL
> 
>     - Picked up tags
> 
> Merge logistics if agreed on:
> 
>     1) Patch #1 is applied to the tip tree on top of plain v6.16-rc1 and
>        tagged
> 
>     2) That tag is merged into tip:timers/ptp and the temporary CLOCK_AUX
>        define is removed in a subsequent commit
> 
>     3) Network folks merge the tag and apply patches #2 + #3
> 
> So the only fallout from this are the extra merges in both trees and the
> cleanup commit in the tip tree. But that way there are no dependencies and
> no duplicate commits with different SHAs.
> 
> Thoughts?

I'm sorry for the latency here; the plan works for me! I'll wait for the
tag reference.

Could you please drop a notice here when such tag will be available?

Thanks,

Paolo

