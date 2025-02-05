Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3E720FAA0
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 04:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738730146; cv=none; b=Hn/lVmNzd6uG+H7u67sSvZpU7bbz2cqfJ0b7pG/rPwTU+LRA7STonBEaHvNgFWSPxwEqbXUQr5zXcNwZlKyegXlPe/+hq9zJ8YRfUUJ/Au8tNs/E3VvA1NNOomQpq+fV9BBo1f29dzNCpActmbmX6+fD8UnnssINRyDcDh26Q4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738730146; c=relaxed/simple;
	bh=D2nc3f11JUrmao1Ehpaxl4jeDlOVm96uFA0pBbXk9Go=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=rhAy6Y8pHBpsJSj6pWGLSNO5U78oIOhLcH5sCOyPlKPunzLXqDpB+kLPw5nMOrU3r8LkO9GjHHbc3EwhZj3s7SQdzNVc/7h13uzQxsxDV4IGXzW1XSl6TJfDL3JxrtJwbXOwP5x0+9pNNOHR/ckKDunqud23+fhs2s/amFTBskE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=telus.net; spf=pass smtp.mailfrom=telus.net; dkim=pass (2048-bit key) header.d=telus.net header.i=@telus.net header.b=OZJ2m0RB; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=telus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=telus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=telus.net header.i=@telus.net header.b="OZJ2m0RB"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so8416861a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 20:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=telus.net; s=google; t=1738730143; x=1739334943; darn=vger.kernel.org;
        h=content-language:thread-index:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=o0i7GnKV2tM1XKrg7ybPY0GD/aYFraHmPjzLGFtdcJA=;
        b=OZJ2m0RBMvZ0DwSte1L8CVMtdfeRTMYIVcxEKfequ5Ew70DSEWzVB1XrCEfFWQVvjw
         iI+ePU7z4XkYCEyVqqnKIUyGdjH/MKyScVdQQmN2wDKmWuSDBkBClWBipRxywK82e0nx
         G9N/SZ4hWIl3auoYhKT+7igo/TIKzraiFjGP5qLL5W9+sPtAJMug0QHBVw3HCGFmgj6a
         dZyFtASvX8Nwq8MxwLHKCs+i+qJ6CrBcPkAAUyhEnqsx4w0g5Au9yZ81Xww0WmU31D7Y
         K6wATyl4w6eojqsRA2Wg03+aNlk/prBeshiRsiWohjtqJTFqxjJNnnwrYP1ONIg7jT/I
         m48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738730143; x=1739334943;
        h=content-language:thread-index:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o0i7GnKV2tM1XKrg7ybPY0GD/aYFraHmPjzLGFtdcJA=;
        b=V9f1rz3Y2kIuB/cKCMb72O5FsuNGuDl+zXxzyTjpfAT6qfFaGjKBp0mQrh/WgfzmqL
         daCMMBVKITVwg4nWleaPAbolCKuBsnOcqcYyf/fkHkiimbGmGPA7viM9FBoYE64ppZmF
         BulUHuNLSZ2pDeX06nYnACjK5ZBvqzp61gTrY30LsdYhpSsfIIga1pv6si1WoLBm7mtv
         CAbDBgMhKMFyg3thJLXBvkhRyIZVKhF8d8MZH9UkJLp/S62qv/yqzHJ91pVHWY7m7OSF
         Aduc6GQ8pwrQIQdkck1kbe40bFA9t9dQEp/RAUcbEcfoXnlki+4CNq49St8Y3axJI0Hu
         zaGw==
X-Forwarded-Encrypted: i=1; AJvYcCVqFPBncUdqRINSpFSR/sWhClI3bdSm47EbsJJUAo29DRaZ6RqYM7fJNaS96fcSauObbnoA0TslgZYnpYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHZvb0zsmd0+mAEvoBTW59UJzES66DxFu4208PMrgszI65bVSW
	wa3ICFY1AGgScMKSig6l8r+eIOLRySiNmkLMqVRGfXpgp2h1Wm2sRvYvk7iz/14=
X-Gm-Gg: ASbGnctD7EkaspE+QdOpPNwLLYq7gH4kuYsReVs9rJi86+tbXFZQPwqoMgA5m+8Jd4l
	JDWkzV83WvBafOIQqVhKoMN0FuVkJnf2AsiDp4rmjhgUPBj3a5rzYDnAntHB96LiQFyRfloYSVJ
	lsomzhz2MYWenGaJEeI8ybPkRwyiheRB9kzHqNX17EveGLLIE1D/JJtrWq3EuRIx6Eiec2jo27F
	nLiDQFxlEoh5yp/WvIweZu42amZhWE50+XZ/IU6ybXwFGp3KLbbePGsvqj6sJQAaswrYWWjZeDA
	elZ59rDxxqsRQxxyETuge3iK7Ie72uHEDi6qyC5bPxuKN2GA4pUTGknj
X-Google-Smtp-Source: AGHT+IEx3NL6Eik+ychf6Kbh7ukJviC5f6VHJ0vVfCGb6wfOY6FaToj3HZSjylOnWePqMiVgwLatWg==
X-Received: by 2002:a05:6a00:3a19:b0:728:b601:86df with SMTP id d2e1a72fcca58-7303511c20fmr1933950b3a.10.1738730140950;
        Tue, 04 Feb 2025 20:35:40 -0800 (PST)
Received: from DougS18 (s66-183-142-209.bc.hsia.telus.net. [66.183.142.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631be61sm11774723b3a.19.2025.02.04.20.35.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Feb 2025 20:35:40 -0800 (PST)
From: "Doug Smythies" <dsmythies@telus.net>
To: "'Vlastimil Babka'" <vbabka@suse.cz>,
	"'Andrew Morton'" <akpm@linux-foundation.org>
Cc: "'Michael Matz'" <matz@suse.de>,
	"'Gabriel Krisman Bertazi'" <gabriel@krisman.be>,
	"'Matthias Bodenbinder'" <matthias@bodenbinder.de>,
	"'Lorenzo Stoakes'" <lorenzo.stoakes@oracle.com>,
	"'Yang Shi'" <yang@os.amperecomputing.com>,
	<linux-kernel@vger.kernel.org>,
	"Doug Smythies" <dsmythies@telus.net>
References: <019401db769f$961e7e20$c25b7a60$@telus.net> <8f84691b-4b48-46da-9c47-e1f41bd503e1@suse.cz>
In-Reply-To: <8f84691b-4b48-46da-9c47-e1f41bd503e1@suse.cz>
Subject: RE: REGRESSION BISECTED mm, mmap: limit THP alignment of anonymous mappings to PMD-aligned sizes
Date: Tue, 4 Feb 2025 20:35:44 -0800
Message-ID: <006801db7787$6ba88c60$42f9a520$@telus.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGbbLw3ETZQMoAhshCewrgzRiltpAFpZrO4s6zmikA=
Content-Language: en-ca

Hi, and thank you for your reply.

On 2024.02.04 03:04 Vlastimil Babka wrote:
On 2/4/25 01:56, Doug Smythies wrote:
>> Hello,
>> 
>> Note: The CC list is a guess, and I am not on the two vger.kernel.org lists.
>> 
>> After observing a 30% reduction in the ebizzy benchmark performance, I bisected the kernel and got:
>> 
>> doug@s19:~/kernel/linux$ git bisect bad
>> d4148aeab412432bf928f311eca8a2ba52bb05df is the first bad commit
>> commit d4148aeab412432bf928f311eca8a2ba52bb05df
>> Author: Vlastimil Babka <vbabka@suse.cz>
>> Date:   Thu Oct 24 17:12:29 2024 +0200
>> 
>>     mm, mmap: limit THP alignment of anonymous mappings to PMD-aligned sizes
>
> Thanks for the report. That commit fixed regressions of other workloads, but
> since it's tweaking a heuristic related to THPs that can have both positive
> and negative consequences, it's not surprising to see that another workload
> can regress.

Yes, I had read the related emails and thought that might be the response.

> Since that commit is implicated, there should have been a matching
> improvement for this workload in 6.7 thanks to commit efa7df3e3bb5 ?

Yes, I also reverted efa7df3e3bb5, but must have made a mistake
in my testing yesterday, because re-testing today
I got the same reduction in performance.

> I guess one option to proceed would be to check what kind of mappings ebizzy
> creates for its performance sensitive operations, and see if they e.g. were
> backed by THPs before d4148aeab41 and now they aren't. Maybe some simple
> adjustment to ebizzy's allocations is possible to achieve the better
> performance always and not rely on this particular heuristic.

I'm not going to modify ebizzy, because I don't really care.
I was just reporting what I thought was a regression was all.

>> As a double check I reverted the commit, on top of kernel 6.14-rc1.
>> I had to manually revert it, due to other changes since then.
>> The previous performance of the benchmark was restored.
>> 
>> I actually use the sleeping-ebizzy benchmark [1].
>> I use it for idle governor testing because it has yielded interesting results in the past.
>> And sweep over a range of sleep times. Example graphs attached.
>> 
>> Legend (regression average is over interval range from 400 to 3600 uSec):
>> 
>> teo611: kernel 6.11, teo idle governor. Reference.
>> teo614: kernel 6.14-rc1, teo idle governor. Regression 25.7%
>> teo612: kernel 6.12, teo idle governor. Regression 24.4%
>> teo613: kernel 6.13, teo idle governor. Regression 25.1%
>> teo614-revert: kernel 6.14-rc1, with this patch reverted, teo idle governor. No regression, 1.4%
>> menu: kernel 6.14-rc1, menu idle governor. Regression 26.4% 

Kernel 6.14 with both d4148aeab41 and efa7df3e3bb5 reverted: Throughput reduced by 26.0%
 
>> Example command:
>> ./ebizzy -m -S 20 -t 128 -a 1 -i 400
>>  
>> My processor: Intel(R) Core(TM) i5-10600K CPU @ 4.10GHz
>> Distro: Ubuntu 24.04, server, no desktop GUI.
>> 
>> [1] https://github.com/pratiksampat/sleeping-ebizzy
>> 
>> Doug Smythies


