Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E0B289824
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746634176; cv=none; b=N97tC96ZOubwGJhIVohOMHb0QEMF4LRBY9+EpJdWOfYebqU8rn/Rcbc+wg5FA+5zkR5iBELafXoARGTXTjiC+B0M6ZP8hfpFCaeI2lUb3En1uRyHeNegGHPs4oopa6MK2/zKHSoO0/94RbGTrKqYZwuDMt8Lj/+X5HhqIaSRWWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746634176; c=relaxed/simple;
	bh=a9auzZSL5Kq/PdECtuk7WTXM/HrGNFDZL7se90kWKNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qsBW/nKxu5KCZ+QlPBz4tegJHTIGlzvWB3+3fmP1rqTxK+82jQ/oi0OwTAt71UhDECzKy8M2Cc785qQxslfU5/YZ7rqafK4oKU2ciXVfd3V9D3yFF0TJO/z/QRF0RkUMGCTidYW3sX9iul3yc7qtlLKHbX5jvdqDC6kCvtPnk1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfRogJFH; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfRogJFH"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad1a87d93f7so691779966b.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 09:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746634172; x=1747238972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fIjEVj0DEgX91fXHT09wKDzBRPLgzhUHI19sZdE1aQM=;
        b=bfRogJFH9cdF2W4feY82j7fEzRWMMVgk44K6WcNOBi3c8kfZYT5TBBQz5YiZJo3xm4
         JLSfJv3F99OETvfsDHpDtv1O11I5Kr1zxGVQON3cFnwTWUS25csc5z35Fuv5xdQ/LR8A
         RzQ372m47TJlhF6svBkhPn0GvWYTuTGIaYgpe9zIvrB8plazd9SMJxZZyGRSOusLGGXe
         J/hdwovblTgaLAr6rvKKFsh6QVckc7kNlB5CEJhiBFhQb92Du4e2ex2XWuqh9oC6Dh1P
         Pny/1US8dS3cIi+pBMAsZCGw/N4/0o8iPW/veNtdGuoOyYMQ05+jmEakg9gYHsmJPOwr
         UPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746634172; x=1747238972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fIjEVj0DEgX91fXHT09wKDzBRPLgzhUHI19sZdE1aQM=;
        b=waYeRSZ3LJnKByhqqD4/701O+c9lu6n/+RvUDwg6M/8cLJ9duKbAGhYwC5JJBDF74j
         j4Waw588SntlcmSzfHnObbD62CwgVnEPTHda4x/QmusfDuJslZRRs5sshpuV3z/0BGUg
         URudRKLUz1ystgobgZUlFMnSzMlKy7rMOEUNIlYdAhoi0LfLKWbNGfdEeSHPla3o1b/R
         P7dD+07r0fDsuNdkBVic55zINMJogKlsepe0eczoz6UmCJglZChhx0f+lPXH9sTKs9qA
         0lcZb4mNLEybcP0IpXrIA8j9ZlHqOoL2t5ubJQoH7RSKYr0piI8fbLlxTG0+YUG/3v+t
         1ccg==
X-Forwarded-Encrypted: i=1; AJvYcCUVKm8ZHPuieP4cWHflate5gjf9JTJfvo9a5XnUuFzbRSSRyIbyJ070hyV9lMnxjI0DF5PSzZdlBflseno=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvOsuKxu/vlnbvWd1tEZA61f8aFe/UQ1oSCpWcZ0/sLo31ntmU
	ZBuepJTBnpGCIUuMazHkHVjLL0KIA4jfaRJwDyo4UPZE3B/vApQr
X-Gm-Gg: ASbGncsfa5uC1tE0zOyFFcoFlUIOnA1be4t2nyIssccqTC3OFAr4LXnKQLb78nQl+1e
	cnnh+ZNrYT9yyQNoXqb6+OsneC1p/2Vi+oRlmYGlVYKg9hsuoMYR+7aEEat7t5Mh1p8qopfS0W5
	Ju1J2LcXAU+xSqmMr/FTZWLxDSJXoCWWr8uvtBBQ0K5I/f1zxdr/32QaBy9/825I4tOW4q6M3Qr
	65QO8+a32Be3yR9GRD7gwhYtk9H4MhTxjpuH9gQELLbmuIJ2LNiV8cJDPvk4KhCyf57R2K/oY6f
	SlLq6DkqrmbGZyJcxhb8jqmku15iE4e9wH3yc197L7isHHxPx4ZGzqxHMR9UJunprXqMGefYFRe
	DRFpAccTUZPzlMw==
X-Google-Smtp-Source: AGHT+IGIMCIP/zJlWIR0g6snp1hXwheU1vJJVVQPLxWqkovc2gx1xdJ/MjalJ0Y2FNbr/emoAUdqqg==
X-Received: by 2002:a17:907:a641:b0:ace:c5de:24cc with SMTP id a640c23a62f3a-ad1e8d9c678mr353455666b.60.1746634171909;
        Wed, 07 May 2025 09:09:31 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:14f7:eab6:23d5:4cab? ([2620:10d:c092:500::7:6396])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891f3c6bsm922430666b.82.2025.05.07.09.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 09:09:31 -0700 (PDT)
Message-ID: <279d29ad-cbd6-4a0e-b904-0a19326334d1@gmail.com>
Date: Wed, 7 May 2025 17:09:30 +0100
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
 <96eccc48-b632-40b7-9797-1b0780ea59cd@gmail.com>
 <8E3EC5A4-4387-4839-926F-3655188C20F4@nvidia.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <8E3EC5A4-4387-4839-926F-3655188C20F4@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 07/05/2025 16:57, Zi Yan wrote:
> On 7 May 2025, at 11:12, Usama Arif wrote:
> 
>> On 07/05/2025 15:57, Zi Yan wrote:
>>> +Yafang, who is also looking at changing THP config at cgroup/container level.
>>>
>>> On 7 May 2025, at 10:00, Usama Arif wrote:
>>>
>>>> Allowing override of global THP policy per process allows workloads
>>>> that have shown to benefit from hugepages to do so, without regressing
>>>> workloads that wouldn't benefit. This will allow such types of
>>>> workloads to be run/stacked on the same machine.
>>>>
>>>> It also helps in rolling out hugepages in hyperscaler configurations
>>>> for workloads that benefit from them, where a single THP policy is
>>>> likely to be used across the entire fleet, and prctl will help override it.
>>>>
>>>> An advantage of doing it via prctl vs creating a cgroup specific
>>>> option (like /sys/fs/cgroup/test/memory.transparent_hugepage.enabled) is
>>>> that this will work even when there are no cgroups present, and my
>>>> understanding is there is a strong preference of cgroups controls being
>>>> hierarchical which usually means them having a numerical value.
>>>
>>> Hi Usama,
>>>
>>> Do you mind giving an example on how to change THP policy for a set of
>>> processes running in a container (under a cgroup)?
>>
>> Hi Zi,
>>
>> In our case, we create the processes in the cgroup via systemd. The way we will enable THP=always
>> for processes in a cgroup is in the same way we enable KSM for the cgroup.
>> The change in systemd would be very similar to the line in [1], where we would set prctl PR_SET_THP_ALWAYS
>> in exec-invoke.
>> This is at the start of the process, but you would already know at the start of the process
>> whether you want THP=always for it or not.
>>
>> [1] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4ade7c6ab7be29a/src/core/exec-invoke.c#L5045
> 
> You also need to add a new systemd.directives, e.g., MemoryTHP, to
> pass the THP enablement or disablement info from a systemd config file.
> And if you find those processes do not benefit from using THPs,
> you can just change the new "MemoryTHP" config and restart the processes.
> 
> Am I getting it? Thanks.
> 

Yes, thats right. They would exactly the same as what we (Meta) do
for KSM. So have MemoryTHP similar to MemroryKSM [1] and if MemoryTHP is set,
the ExecContext->memory_thp would be set similar to memory_ksm [2], and when
that is set, the prctl will be called at exec_invoke of the process [3].

The systemd changes should be quite simple to do.

[1] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4ade7c6ab7be29a/man/systemd.exec.xml#L1978 
[2] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4ade7c6ab7be29a/src/core/dbus-execute.c#L2151
[3] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4ade7c6ab7be29a/src/core/exec-invoke.c#L5045
>>>
>>> Yafang mentioned that the prctl approach would require restarting all running
>>> services[1] and other inflexiblities, so he proposed to use BPF to change THP
>>> policy[2]. I wonder if Yafang's issues also apply to your case and if you
>>> have a solution to them.
>>>
>>> Thanks.
>>>
>>> [1] https://lore.kernel.org/linux-mm/CALOAHbCXMi2GaZdHJaNLXxGsJf-hkDTrztsQiceaBcJ8d8p3cA@mail.gmail.com/
>>> [2] https://lore.kernel.org/linux-mm/20250429024139.34365-1-laoar.shao@gmail.com/
>>>>
>>>>
>>>> The output and code of test program is below:
>>>>
>>>> [root@vm4 vmuser]# echo madvise > /sys/kernel/mm/transparent_hugepage/enabled
>>>> [root@vm4 vmuser]# echo inherit > /sys/kernel/mm/transparent_hugepage/hugepages-2048kB/enabled
>>>> [root@vm4 vmuser]# ./a.out
>>>> Default THP setting:
>>>> THP is not set to 'always'.
>>>> PR_SET_THP_ALWAYS = 1
>>>> THP is set to 'always'.
>>>> PR_SET_THP_ALWAYS = 0
>>>> THP is not set to 'always'.
>>>>
>>>>
>>>> #include <stdio.h>
>>>> #include <stdlib.h>
>>>> #include <string.h>
>>>> #include <unistd.h>
>>>> #include <sys/mman.h>
>>>> #include <sys/prctl.h>
>>>>
>>>> #define PR_SET_THP_ALWAYS 78
>>>> #define SIZE 12 * (2 * 1024 * 1024) // 24 MB
>>>>
>>>> void check_smaps(void) {
>>>>     FILE *file = fopen("/proc/self/smaps", "r");
>>>>     if (!file) {
>>>>         perror("fopen");
>>>>         return;
>>>>     }
>>>>
>>>>     char line[256];
>>>>     int is_hugepage = 0;
>>>>     while (fgets(line, sizeof(line), file)) {
>>>>         // if (strstr(line, "AnonHugePages:"))
>>>>         //     printf("%s\n", line);
>>>>         if (strstr(line, "AnonHugePages:") && strstr(line, "24576 kB"))
>>>> {
>>>>             // printf("%s\n", line);
>>>>             is_hugepage = 1;
>>>>             break;
>>>>         }
>>>>     }
>>>>     fclose(file);
>>>>     if (is_hugepage) {
>>>>         printf("THP is set to 'always'.\n");
>>>>     } else {
>>>>         printf("THP is not set to 'always'.\n");
>>>>     }
>>>> }
>>>>
>>>> void test_mmap_thp(void) {
>>>>     char *buffer = (char *)mmap(NULL, SIZE, PROT_READ | PROT_WRITE,
>>>>                                 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>>>>     if (buffer == MAP_FAILED) {
>>>>         perror("mmap");
>>>>         return;
>>>>     }
>>>>     // Touch the memory to ensure it's allocated
>>>>     memset(buffer, 0, SIZE);
>>>>     check_smaps();
>>>>     munmap(buffer, SIZE);
>>>> }
>>>>
>>>> int main() {
>>>>     printf("Default THP setting: \n");
>>>>     test_mmap_thp();
>>>>     printf("PR_SET_THP_ALWAYS = 1 \n");
>>>>     prctl(PR_SET_THP_ALWAYS, 1, NULL, NULL, NULL);
>>>>     test_mmap_thp();
>>>>     printf("PR_SET_THP_ALWAYS = 0 \n");
>>>>     prctl(PR_SET_THP_ALWAYS, 0, NULL, NULL, NULL);
>>>>     test_mmap_thp();
>>>>
>>>>     return 0;
>>>> }
>>>>
>>>>
>>>> Usama Arif (1):
>>>>   prctl: allow overriding system THP policy to always per process
>>>>
>>>>  include/linux/huge_mm.h                          |  3 ++-
>>>>  include/linux/mm_types.h                         |  7 ++-----
>>>>  include/uapi/linux/prctl.h                       |  3 +++
>>>>  kernel/sys.c                                     | 16 ++++++++++++++++
>>>>  tools/include/uapi/linux/prctl.h                 |  3 +++
>>>>  .../perf/trace/beauty/include/uapi/linux/prctl.h |  3 +++
>>>>  6 files changed, 29 insertions(+), 6 deletions(-)
>>>>
>>>> -- 
>>>> 2.47.1
>>>
>>>
>>> --
>>> Best Regards,
>>> Yan, Zi
> 
> 
> --
> Best Regards,
> Yan, Zi

