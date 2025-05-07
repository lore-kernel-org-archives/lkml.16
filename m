Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4099328A1C6
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746630730; cv=none; b=HyRFvjLpJppX08XiDRj2rOcMOhJmtPWjjJYVkpXnnkOVly/ygwxYOrSWUgLBWwoksNXqtyeMxOoUJHcB2ng4VJRGvyCZPe8uUfmI1GVJ+BnueViu2s4TQkqf9hbFMcrW1aGm3IpbT5wcmhPBGXYuuDCjKnUUVoi/wCWIxJ2WKqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746630730; c=relaxed/simple;
	bh=Dtinz5HD7qn3T28I+sAHojW0w6H4+eMaW0H8Eo6Dr1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ahZ2f/3j5Lg1aE3kw16+VGx6xmH5vWrHHD/tFzM9fSePkJMtX4QFlThVhVqxCfOF5AKh8k6bqXA6xJ8wBFBlfLp5ZBLww9uKoLvm8kC5yqliZFJsN8d/Q6dVJzhVLp69JdIIUNykVbKr3cjQg3GsAsLlvzHL+nLKzVW6E/6xg3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pj7/hqpi; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pj7/hqpi"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so10699212a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 08:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746630726; x=1747235526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=phVaMalRtUk1F/w1Ce4FEueMLSRuW8rkNqtSAq9Dvac=;
        b=Pj7/hqpiTCORQC5g4F2HWjxJWfoO8V9FzbSLTiWiKwWE6XKA7DFHBO27TVNmnQfs83
         Y7y+uBE49btNCS4j03T6B2XTKtROfj6z9QzY2Z2IUx4/8CQ82r4ArAsTiZwSXA3N0Wgx
         oaWkeWfhr5+XnHLNrDRzIF/BqWoJTq/UcRrWSa1IpslfPwsgIWcfbCxfMh38I+KAOZ3r
         EIwqv48zMfcKVD7caPa+I/AnIsJRocNtgcsyxIDRXxVtJmoi3olCJJ7kQ2Pm8yPgjJZ2
         cD+9bOXZUHTIw/dQWh82BIV5DC2INE3yQy0d+i7sLR9RQ1E7ntE+6/V2tTxnKoVkMqAo
         4n7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746630726; x=1747235526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=phVaMalRtUk1F/w1Ce4FEueMLSRuW8rkNqtSAq9Dvac=;
        b=oFBMZzgJ8wAjbtSPUbdhDxr/EBlFSkaj3CA8pmgHbHLuQ1ec1U61liEDYj/iEC18ho
         58iCfY2MzTYNM+tofKcjZZAksMPHEmARs7nUHF3/IUegxYqVaZaLeVP0OgzGA8n/aYX8
         wfkelhkVibeRCCA4YVY+dEEAatXmZLqYDs9C4y/91CExlNaqtrgkI5e2cMr3Cone3gIi
         ChTVlyVbkW9USCxSfFtTs6Q3mrdiOjr+SwaG9KSZ4HMSHPy2BnDT5x68pgMb6/FgJBBa
         y6VP810RSxR2iM425bzNjsixYf6sfESvzTu81oF7toscC1jNL09Zp1nZd3AjEOe/GbHu
         5W/A==
X-Forwarded-Encrypted: i=1; AJvYcCXrJJ0TE5AKQK0iCePQJH6mKyWvfv/UrD1dH52Km1+IapxsKrNRVTQQm3LFSp3WwnFq/fZR1E+RkK9RX0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyknT5vc5cstA06zjd+1PgJ+7+ilJQMukBJbHG0xKipNUqHv/Q5
	g7UltuWIo6cVqKLPrZz1VWejRUKQdouv3MyFi9CpWboOZT9ocaNj
X-Gm-Gg: ASbGncvKI2lkXdApTn9oV9v0p3VqMT8yyz246WFh0kUHGe610l4wR6ZCgQVUfF86hie
	b2/z3cGTveBwa2C3tqa052jGYPlOkHmdT0KjzbU2lshxNsFfsvK1dmtH2JDSgkOwvL9b1InAXqm
	eN82zQRziZE8AyNv3xXrcsFqu5cT0ouygpBwzO3ZvpwEIlLPWn5FSfcup2GCdFNJ5Eg7nHndeVx
	bThXdtC6YoWpUmlyhNfXekMAHImx61LZzPCfD+baJZig59Y+jniqMI1CMemE3m94pL0iWefTmeM
	TuPW94RstTFqliqK3IF+uGB0fsmTQeHDW4Ef7Ke9Cr5lSxiQW7Oxv0sh/foCvjN37/ohvMEUyE8
	iYOOfbTXpVusRCFLtx30=
X-Google-Smtp-Source: AGHT+IHcUBa+Rs4pkTmWUIiYUBQNNXDI9hmy1bvM1LVySE4mxULGdi4P6Qz2kTYMolzufjjvwBx7ww==
X-Received: by 2002:a05:6402:524b:b0:5fb:1f36:f101 with SMTP id 4fb4d7f45d1cf-5fbe9f485c8mr2850023a12.23.1746630726000;
        Wed, 07 May 2025 08:12:06 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:14f7:eab6:23d5:4cab? ([2620:10d:c092:500::7:6396])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fbfdfff331sm417360a12.56.2025.05.07.08.12.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 08:12:05 -0700 (PDT)
Message-ID: <96eccc48-b632-40b7-9797-1b0780ea59cd@gmail.com>
Date: Wed, 7 May 2025 16:12:04 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] prctl: allow overriding system THP policy to always
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
 linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 riel@surriel.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 linux-kernel@vger.kernel.org, kernel-team@meta.com,
 Yafang Shao <laoar.shao@gmail.com>
References: <20250507141132.2773275-1-usamaarif642@gmail.com>
 <293530AA-1AB7-4FA0-AF40-3A8464DC0198@nvidia.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <293530AA-1AB7-4FA0-AF40-3A8464DC0198@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 07/05/2025 15:57, Zi Yan wrote:
> +Yafang, who is also looking at changing THP config at cgroup/container level.
> 
> On 7 May 2025, at 10:00, Usama Arif wrote:
> 
>> Allowing override of global THP policy per process allows workloads
>> that have shown to benefit from hugepages to do so, without regressing
>> workloads that wouldn't benefit. This will allow such types of
>> workloads to be run/stacked on the same machine.
>>
>> It also helps in rolling out hugepages in hyperscaler configurations
>> for workloads that benefit from them, where a single THP policy is
>> likely to be used across the entire fleet, and prctl will help override it.
>>
>> An advantage of doing it via prctl vs creating a cgroup specific
>> option (like /sys/fs/cgroup/test/memory.transparent_hugepage.enabled) is
>> that this will work even when there are no cgroups present, and my
>> understanding is there is a strong preference of cgroups controls being
>> hierarchical which usually means them having a numerical value.
> 
> Hi Usama,
> 
> Do you mind giving an example on how to change THP policy for a set of
> processes running in a container (under a cgroup)?

Hi Zi,

In our case, we create the processes in the cgroup via systemd. The way we will enable THP=always
for processes in a cgroup is in the same way we enable KSM for the cgroup.
The change in systemd would be very similar to the line in [1], where we would set prctl PR_SET_THP_ALWAYS
in exec-invoke.
This is at the start of the process, but you would already know at the start of the process
whether you want THP=always for it or not.

[1] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4ade7c6ab7be29a/src/core/exec-invoke.c#L5045

Thanks,
Usama

> 
> Yafang mentioned that the prctl approach would require restarting all running
> services[1] and other inflexiblities, so he proposed to use BPF to change THP
> policy[2]. I wonder if Yafang's issues also apply to your case and if you
> have a solution to them.
> 
> Thanks.
> 
> [1] https://lore.kernel.org/linux-mm/CALOAHbCXMi2GaZdHJaNLXxGsJf-hkDTrztsQiceaBcJ8d8p3cA@mail.gmail.com/
> [2] https://lore.kernel.org/linux-mm/20250429024139.34365-1-laoar.shao@gmail.com/
>>
>>
>> The output and code of test program is below:
>>
>> [root@vm4 vmuser]# echo madvise > /sys/kernel/mm/transparent_hugepage/enabled
>> [root@vm4 vmuser]# echo inherit > /sys/kernel/mm/transparent_hugepage/hugepages-2048kB/enabled
>> [root@vm4 vmuser]# ./a.out
>> Default THP setting:
>> THP is not set to 'always'.
>> PR_SET_THP_ALWAYS = 1
>> THP is set to 'always'.
>> PR_SET_THP_ALWAYS = 0
>> THP is not set to 'always'.
>>
>>
>> #include <stdio.h>
>> #include <stdlib.h>
>> #include <string.h>
>> #include <unistd.h>
>> #include <sys/mman.h>
>> #include <sys/prctl.h>
>>
>> #define PR_SET_THP_ALWAYS 78
>> #define SIZE 12 * (2 * 1024 * 1024) // 24 MB
>>
>> void check_smaps(void) {
>>     FILE *file = fopen("/proc/self/smaps", "r");
>>     if (!file) {
>>         perror("fopen");
>>         return;
>>     }
>>
>>     char line[256];
>>     int is_hugepage = 0;
>>     while (fgets(line, sizeof(line), file)) {
>>         // if (strstr(line, "AnonHugePages:"))
>>         //     printf("%s\n", line);
>>         if (strstr(line, "AnonHugePages:") && strstr(line, "24576 kB"))
>> {
>>             // printf("%s\n", line);
>>             is_hugepage = 1;
>>             break;
>>         }
>>     }
>>     fclose(file);
>>     if (is_hugepage) {
>>         printf("THP is set to 'always'.\n");
>>     } else {
>>         printf("THP is not set to 'always'.\n");
>>     }
>> }
>>
>> void test_mmap_thp(void) {
>>     char *buffer = (char *)mmap(NULL, SIZE, PROT_READ | PROT_WRITE,
>>                                 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>>     if (buffer == MAP_FAILED) {
>>         perror("mmap");
>>         return;
>>     }
>>     // Touch the memory to ensure it's allocated
>>     memset(buffer, 0, SIZE);
>>     check_smaps();
>>     munmap(buffer, SIZE);
>> }
>>
>> int main() {
>>     printf("Default THP setting: \n");
>>     test_mmap_thp();
>>     printf("PR_SET_THP_ALWAYS = 1 \n");
>>     prctl(PR_SET_THP_ALWAYS, 1, NULL, NULL, NULL);
>>     test_mmap_thp();
>>     printf("PR_SET_THP_ALWAYS = 0 \n");
>>     prctl(PR_SET_THP_ALWAYS, 0, NULL, NULL, NULL);
>>     test_mmap_thp();
>>
>>     return 0;
>> }
>>
>>
>> Usama Arif (1):
>>   prctl: allow overriding system THP policy to always per process
>>
>>  include/linux/huge_mm.h                          |  3 ++-
>>  include/linux/mm_types.h                         |  7 ++-----
>>  include/uapi/linux/prctl.h                       |  3 +++
>>  kernel/sys.c                                     | 16 ++++++++++++++++
>>  tools/include/uapi/linux/prctl.h                 |  3 +++
>>  .../perf/trace/beauty/include/uapi/linux/prctl.h |  3 +++
>>  6 files changed, 29 insertions(+), 6 deletions(-)
>>
>> -- 
>> 2.47.1
> 
> 
> --
> Best Regards,
> Yan, Zi

