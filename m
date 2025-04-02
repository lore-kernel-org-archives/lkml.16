Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D166F30F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 14:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743602661; cv=none; b=KMoubFoeIolG3kw4GR6LI9HWk0I0QnWcGkYwf/48/H4shNngu9fZz3DTdALfqrklRdDhXboyczUeH8ULO7pzeqyjYxewEsyDoceU0zZfCdMgvGTkQxD/R3vKCYOTGr7Yn1mT14/vOXG/7peP2XywAiN3O+Pme2opxofmg8r9Pvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743602661; c=relaxed/simple;
	bh=uFEjKwdxbPlbJmE5E8ERJ13H/lAAQ/MzQCZknKm8wKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VjK9vOlVZELZKYB4i0dLk3S+/oPa4lPJGOLwIjfZirEFq7+QqQOWNXf9kksBK5FOQerZc0YEsQD415n+4Aex7TuE8ZD1C2XTi0cUBD2S/7AEeV7tAyAWS4L/AT2bkeQrOukCbtTlWNNHMZnT5nbpr9wosA4tJRWEaV53bbu38Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=VWa+BuGR; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="VWa+BuGR"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43690d4605dso46646535e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 07:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743602658; x=1744207458; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gTnvP+/lcGF/XHNdmqVIxU/QtDmThtiaFzpgnQirqGg=;
        b=VWa+BuGRggc2CnW3jExw/TE3nJaWZW+eDC0QTdbVSKYL8QLTUdpa9Zpint8njYOCX1
         aCGUggKQfL1RCVZU0qzxzXtZcqbwaJ1BMXCqyc1WVd9wqk3MBhNx35rLvFOL/pVJGgbR
         YniYhTPcEwrAAM1oRkrEZcDMyy7UpRfkWh4q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743602658; x=1744207458;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTnvP+/lcGF/XHNdmqVIxU/QtDmThtiaFzpgnQirqGg=;
        b=pMXxDXZr9M6PwvCFrGv0KmIup5YuiHz5b3i4e+SKWA2j9iVhtLUfDaeZYm/DvzXQHv
         bnajaz7Q6FLAstIxT+D2M3alOzPfeoZ7B+Pqv0irLonJYR/mSxHViBSgWP/NNE4R4vrN
         wQKbnGKYmZMI/PIWdWK4aCgOHyvcqMd0naWvTY9TLBJteaaeMTzCtPGDDodZvhdOP1ol
         PSwPVNhPypnc/jFDrYj7D3mclLprS9MkbslBbX1C3TdFSfDEevbGYzoNHMiOYuDF8+p8
         ggCfe7B+a1k2j3NuCgx0/vgucszXHV2rEpvDtYnpQrr7zB+r/C6ONMHTAK6JGpdpY87j
         fHyg==
X-Forwarded-Encrypted: i=1; AJvYcCWmvnrPvloX4DGKQrmExpdsVGDnfEkf+NS/SZxVEZYph6dUjLpL4P1D1Pw7Z6SyO6QoDrVFOAfBfTLIUWc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGxnRKuchvJpRFvFPwl5mOxPvPcT1guhgG1ZlCl7r4W0pWyF20
	nwLrUUrF9S59FQPk1oJlAOXBVFwn7uygGqY70DCK1DWgzspdXhq44waYef9/CmHXT+4d5itt2Yx
	GH5Q=
X-Gm-Gg: ASbGnctVza5/PuXOMqsSm4ODef6oXBC73O/HFjMoPPQSSsWtJlgutqt9prIR+2xKCHz
	loKkek22jvGoi4k3hyOylV2k/l7LiXzzhjgtSJTllhRXAJvegL0OryHu04esUeHRyvyS5GpFJIo
	m+7pRYlb/wkIp6T4g33hT8DWNXP4Qb1d6xr8WxCiq/4TEd7xaZd4pj8nhpM2mZel3611cek0hhO
	0MpJ7eMfwdU9fQxz0iU1Zxdx2rsyfHTwA0pH433n0sv0o/NehpTrG7ZoJTVYoCBHHPa8vUXVMpa
	UgIrdd/VGds3C7ympnD7eqZ6uIAoJaXWcyFM3V7td+DZTCaazezMXhDxD86FjJwlW52IBVt/seo
	eBZQBbj6MrQqkJZUsC6jC
X-Google-Smtp-Source: AGHT+IETsRUhmGqCi3w3dEttiniMj20HNAwZN7wS+pY+ColWsHwcgaT45jB01SQDnVQ3FMuAEHbuaA==
X-Received: by 2002:a05:600c:22c1:b0:43c:f61e:6ea8 with SMTP id 5b1f17b1804b1-43dd692392cmr126357805e9.2.1743602658085;
        Wed, 02 Apr 2025 07:04:18 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea8d16d35sm39099805e9.0.2025.04.02.07.04.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 07:04:17 -0700 (PDT)
Message-ID: <c49c5573-893a-4352-8437-d2d9b7af5327@citrix.com>
Date: Wed, 2 Apr 2025 15:04:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: x86/idle: Remove barriers for X86_BUG_CLFLUSH_MONITOR
To: Dave Hansen <dave.hansen@intel.com>, LKML <linux-kernel@vger.kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
References: <20250402091017.1249019-1-andrew.cooper3@citrix.com>
 <eeca95c5-5724-4205-8449-644d91eafd48@intel.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <eeca95c5-5724-4205-8449-644d91eafd48@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/04/2025 3:01 pm, Dave Hansen wrote:
> On 4/2/25 02:10, Andrew Cooper wrote:
>> i.e. The SDM was incorrect at the time, and barriers should not have been
>> inserted.  Double checking the original AAI65 errata (not available from
>> intel.com any more) shows no mention of barriers either.
> There's a near copy-and-paste of that code here:
>
>> static __cpuidle void mwait_idle(void)
>> {
>>         if (!current_set_polling_and_test()) {
>>                 if (this_cpu_has(X86_BUG_CLFLUSH_MONITOR)) {
>>                         mb(); /* quirk */
>>                         clflush((void *)&current_thread_info()->flags);
>>                         mb(); /* quirk */
>>                 }
> Any reason it can't get the same treatment?

Oh, yes that should get the same treatment.  (Sorry, too may cross-ports
between Xen and Linux trying to untangle this mess).

I'll submit a v2.

~Andrew
