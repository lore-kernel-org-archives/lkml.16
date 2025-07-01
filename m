Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6B827C172
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 17:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751389877; cv=none; b=C271IJboqd44d4K0pm9mEPFvcNrbR+3rrTB3GZxX2g8LVlAUeMAcCHZ4BTX7mWSUTGozZ9tXFXwFI3hgJXNcormI8ILZpnvCVRHx/pgu3x/hnL7SKWJhbKTjWSi6PvC52RTaxlGwUQiqtA+Q7kI+UIxDpf6SWkwA0jrWoKROV+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751389877; c=relaxed/simple;
	bh=iH0TDbe8VNWwvdmFqK8APOT2xukPLMWBMeyUf5tfGg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b/jw5vG8ZVzB48CFO4cUrb+1m/vOk4mbM9aAX47I7WPZzsLR4L1bp+N3XqlB+XTLj4w2FFn6GLxEoJCHuctwqPnFIyB9gtDzmwJFCl4Oy2xDj7xC2tp60kA4kAUKoJ1gfzQqskOUq8pCuOIZYAO8AMHXeiX15Yj+u6GhHlXUUzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MGdmuOlR; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MGdmuOlR"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-875dd57d63bso247236639f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 10:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751389875; x=1751994675; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I+wX+K4f2/MFAj/Jdnu+2FqfSGpN09EzrvZCmNS2CqY=;
        b=MGdmuOlRV2A1/zuFbhcTdWXDeqacwusDIJb9eMw2wM1EyEQIAYPykxCeXY6UN9OQmw
         52GnFhzTMA8JvvgEBWBohPwqCCxlvQnFWAwGuZNecaOdXw0Bn3puT5wKq04J8aoacYNk
         Gykl1uQqKnNZB0j0rcmcBNggqHNHaBU8Qxeh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751389875; x=1751994675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I+wX+K4f2/MFAj/Jdnu+2FqfSGpN09EzrvZCmNS2CqY=;
        b=S4fcSkNPZfC7yyBelg+9bEXX37nX2ENELa45TzJkfMxsQYarnFll57UwSl2AuZfeKb
         dz2JgqwWI1ZndDN4Vqh0PrahT+Hzam1HuPOwK8n0emiUZvT4GZArp2C6BqabIHIDPFzM
         B0O1O6u0xoJxNdzImcktKWdsfFI7EW+hLLwYJzyC6bIfWsm4LLs4M1qn7pYip52bBSXp
         m+w4ZSIcDDZ6tBi1an3hOrB6OyLiBYVbHLx1bVUaCHi06Hk/O7E98Jk0E5fqKwfh6VuK
         ExI6Fm7d2hDuC4btfcs6AQ75mDgGQAy/gF2UfcJfUj2tzXULjWKYNZgxCeoB62GxtAuG
         Xylw==
X-Forwarded-Encrypted: i=1; AJvYcCV1hui9hS7V12phQ+3XEiSlGcICMsGYTGjiCGCcSmYKLUuA0xN+M5hUlyIaUrBgzGhHeuhmWEiC+WAznA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEUOzi2q1ulN3CjxmMGzeWRAx4n2fQ2EhB7PJJWE6snKUh1nNS
	D2W5XRYSnsSscfZ/1v28ge5MMynR49N6nrkgdoCX9iyOrmj9+OLoWZpkGK1gkbD/Gio=
X-Gm-Gg: ASbGncvJxEsnEC989YL9lK1jnsZ9j6C33vGMhrVAAEu0BzP3NQGjIE0VdGaYVWEGgtO
	rGhagQnfrU4Cib5FzAjZ63USnVY+ISo7s1ObZwuiGi8vF+8aXaVX+c1ofCz2B6MfWeFnSwdDERA
	wmWqT3F1jh7h2Zu8g/FPTKyu56FBod4GBwBbfXQLJXtgJScCGxX92zG27eCA0b4SUxQC62u69Ms
	m1xaDH3dIEc3ndr+FjB8LgiO7MHtVAnapdATv9Zr45FA+/hdz8hrKl2kebLiFRLfOB9x96X7GLo
	yxLh/s1EYbjhAONXs1pzBZJusyrihU6eRgLGErs/n10SjDgxV8sdL01AhZ3U3gT8N4aCVfx7kA=
	=
X-Google-Smtp-Source: AGHT+IGWgeEaEK/0GkLqXIvblpd+mixokpaJEx481G3pNqH6IXmxkbQDpSGr13gQ+qGaEdVblqLgqA==
X-Received: by 2002:a05:6602:4142:b0:85e:73da:c56a with SMTP id ca18e2360f4ac-876b90cab8bmr546249039f.3.1751389874133;
        Tue, 01 Jul 2025 10:11:14 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50204a8c2eesm2557194173.94.2025.07.01.10.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 10:11:13 -0700 (PDT)
Message-ID: <2ad5a6e4-23b6-41c1-a2c9-3190e9bd256d@linuxfoundation.org>
Date: Tue, 1 Jul 2025 11:11:12 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpupower: Improve Python binding's Makefile
To: "John B. Wyatt IV" <jwyatt@redhat.com>, Thomas Renninger <trenn@suse.com>
Cc: linux-pm@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 John Kacur <jkacur@redhat.com>, "John B. Wyatt IV"
 <sageofredondo@gmail.com>, Thorsten Leemhuis <linux@leemhuis.info>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250624204105.457971-1-jwyatt@redhat.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250624204105.457971-1-jwyatt@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/25 14:41, John B. Wyatt IV wrote:
> Add a few build variables to make it easier for distributions to
> package the bindings. Allow current variables to be overwritten by
> environment variables that are passed to make.
> 
> CCing Thorsten Leemhuis <linux@leemhuis.info>.
> 
> Signed-off-by: John B. Wyatt IV <jwyatt@redhat.com>
> Signed-off-by: John B. Wyatt IV <sageofredondo@gmail.com>
> ---
>   tools/power/cpupower/bindings/python/Makefile | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 

Thank you. Applied to git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux cpupower

Will include this in my next PR to Rafael.

thanks,
-- Shuah
