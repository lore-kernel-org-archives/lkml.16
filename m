Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D67E20FAB9
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748025987; cv=none; b=vBaLFze9Z3uVMTIXoVLCHUEBL2wq/ddJFPR6TY2VeSe7xyXnWmn+F+s7mmN0YH+BzsF3exoB9RKQA1NJ86U3jufBN65w/moFTT/jIRP8nv10PnSakokAZQeH9Q4wSewkGPagVgNzUC/2ptJK/+yAx9CtuUjTxg1ZYwRF37J4Mnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748025987; c=relaxed/simple;
	bh=dZpgjJTi0MJt9iTrmqEP3ZYL1GmqOyNKh5PQfgkUMis=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EG/RFsT4+V2WNtp8JL9qqI0bobpMayP/Gf7hbIuWRh3I1Zf3fBWl1U2EieIM/SRApz/wh0iIskXCl3WbGp8qm7kH4LB6iNeUiNJrCR7pUUtssg2LVHUm+o2+zse8jAxRt2XyfQknrIp9Jy5kBXKZR+LcdrqKBED7ScDG7NPBtj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GkRVW71b; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GkRVW71b"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-85e46f5c50fso12824139f.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 11:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748025985; x=1748630785; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sx1YiNkbzCH8yAAqTlThmCo4ScduhJ4fEOgmS9RLqNE=;
        b=GkRVW71bjWtpYybLOSUi/B/TGhIUO/esgtd753AQFVj/cm0l2C2xDtzfz7kfU5FW4K
         3tYYSlokmEJHaAXb4brP4lX7G+Aj1mWuB7iPAr/4MnoK+jTwLjKZ0qLYM4TVtwH8IXtx
         EsguG+fnxNClsp+3nXXqBDlIliPYo1VaeohNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748025985; x=1748630785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sx1YiNkbzCH8yAAqTlThmCo4ScduhJ4fEOgmS9RLqNE=;
        b=tIdckUNhVjxUZseg/xn6yVfLDravLXiVAJ2QzHuMD7BPpjlHvDvq1SbfSy8bzHqiPG
         RX2RVg5rNM3Z3PNQsCyD8rFAAC6PE+SVfyqSeB5EsAqkMWm5OCItR0D7tlDA3oafHtrO
         lIU1OJWaYOfadSrrt5frtNraDNIOz3vn21uXVqcOSMmAu6+yw2uUVt1MsPLa9e78MLgy
         ZxEp+QqTcRo2Hgo7SmcHQx/t4jGpKiQf3ULI8C4q52nw+dguANgvsnSskHGfKynTBYyu
         apHMJmuzjAT5/ezLkzm+2PV3N9gcSRAqGDVo/gORcgvdQFrEtvuJdt5x1PNPRGbpaNst
         t56g==
X-Forwarded-Encrypted: i=1; AJvYcCXayePKMvWfg7/Yr9Gd//3BsQ9MdRTD38v4NvdvPZjtYA4eJFo/mS8GzKUiGERUqV+ib3dGRFVP/Ovt9kA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxof8crzXghv57fZZ5+3IRXTmura8nImJavnmRWFLoWzcSkUsH
	wkS5yo3NIOle+DSpr8LHkP2p+695GbZRuDE6xWWEuhYOuCyMpsGz08dcMz0tc5dak54=
X-Gm-Gg: ASbGncvedLzhSWwXNffDiitq4lQQZNijMw/fME66h0+tvkrk7uTlTm2dQtvVSEYx7Iu
	8JS7JW93GoOABCmsnm/D1lQ9fDm5rk2vN3fIqp1niw4NZEfkE1a6OOR8fBSvPZJKvQpCUQ+4Ywq
	YDCy7Y6fqRGlvx8pEQ6PiRCOYgMcGJWjvoUovnPPrxLYvvrAmbGQxzULYjY4oTTTglhqabRBcEp
	CfTGHIixL2mSIQg+GjAHKFRZ6xeYgZuJWxFRK2ppskn0UnFVp6CDU3NmJQ40iQX6N/6TS9dJl0Y
	Naqf/RbGsvjnNl6miRQl1IyeZeqsdHqbeHeL/kDnZFWM2mQMQlTUFpH+c9qDDA==
X-Google-Smtp-Source: AGHT+IGDOo5oijcYfP+wjUEk9FHyzN59Q1kmzheuHARtrPQ6h1ULMxF03dEGfdM26oxYajyQMiejvQ==
X-Received: by 2002:a05:6602:4896:b0:864:657e:caec with SMTP id ca18e2360f4ac-86cbb88d3f7mr47292839f.10.1748025985178;
        Fri, 23 May 2025 11:46:25 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc38a5besm3684310173.13.2025.05.23.11.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 11:46:24 -0700 (PDT)
Message-ID: <bd22525a-dd4c-47b0-8cd0-52c0e8c64ca6@linuxfoundation.org>
Date: Fri, 23 May 2025 12:46:24 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kselftest: x86: Improve MOV SS test result message
To: Brigham Campbell <me@brighamcampbell.com>,
 linux-kernel-mentees@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
 "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)"
 <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250523073220.112238-2-me@brighamcampbell.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250523073220.112238-2-me@brighamcampbell.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/23/25 01:32, Brigham Campbell wrote:
> Apparently, this test completes successfully when it completes execution
> without either causing a kernel panic or being killed by the kernel.
> This new test result message is more descriptive and grammatically
> correct.
> 

The change log description usually is in imperative - e.g:

"Change test result message to be more descriptive and grammatically
correct.."


> There are no changes in v2. I'm resending this patch because I addressed
> it to the wrong email for Shuah.

Version change information goes under the --- after the Signed-off-by

> 
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>   tools/testing/selftests/x86/mov_ss_trap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/x86/mov_ss_trap.c b/tools/testing/selftests/x86/mov_ss_trap.c
> index f22cb6b382f9..d80033c0d7eb 100644
> --- a/tools/testing/selftests/x86/mov_ss_trap.c
> +++ b/tools/testing/selftests/x86/mov_ss_trap.c
> @@ -269,6 +269,6 @@ int main()
>   			);
>   	}
>   
> -	printf("[OK]\tI aten't dead\n");
> +	printf("[OK]\tkernel handled MOV SS without crashing test\n");
>   	return 0;
>   }

thanks,
-- Shuah
