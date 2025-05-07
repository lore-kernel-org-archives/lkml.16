Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F032628A1FD
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 14:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746627100; cv=none; b=H97UK439zJXV/A1Q0slN3/jZgSv5pgtXypeQ1ZDPPAZykngCkL6pTofaniKbBTKtyBzEarsCJSOzg8271fIpjCwncXH2rOIz4tDA1WnL3rbue7uJWB017DyrNm9SwVZCMUSUrltgOHBlhcG2oy1hLi5CzaABPvlni9gZPvl3FKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746627100; c=relaxed/simple;
	bh=3SOOQfF2JKHZmEoRqtYoAy8369hkoCjgbrAUAp8RKaA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XlXIQMX18CXv7RJSHLE0G4R3ocnO6JjrlYpKPHWTcGg2CqvsMmipucxtTlIqrvN4K7fJx9AV6DpAspFkbtukClF0Kh0exNUlNZprOYnf6V8GgJzOjc/9sm+SHIFVBc7sxdkIbTAhRoZNCyxoOTPzsMxNUkGAw3HEsKsctJBrxCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3pozz7c; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3pozz7c"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6f2c45ecaffso66675156d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 07:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746627098; x=1747231898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HnjZkBRVEGg6RMQCwW+FP47UVOcstV38TzY2od/qixs=;
        b=Z3pozz7cCsepOy/h1dj/WXpclbV43CXIlB4jKaaXFdWp3F6sI6VNofVoNcmi9GNr0a
         1BYZc6lFV88k26+wgKVqvkK3ogtC+hTGs9PfqbBL86vKMEpHGDbtwF3z2FJDlWNpxlFe
         Ro+5u5QRKs1a/H2RDJzYv6QTpjRuv2YOADPlcOrIuEYt0o+m/MWIFNKUzF8m9FCp7qGE
         O6fdCcvTDyFYwFrVVojsXnpfOCXrfy6xPxMbblo+t517uBZqe4zTNtlXjyaytGu1+r6H
         PSgx1XSjJHqBFEVgz37Oo2qMaBdABky2L+//FqCL207gKPkMRnf+8+62E3I4svJLgoOV
         gaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746627098; x=1747231898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HnjZkBRVEGg6RMQCwW+FP47UVOcstV38TzY2od/qixs=;
        b=frSvtWqiZaRKurXKAMTza4nCT+aBaM3X857sBdYbEFglGrBYF0ywJgpNb9SGA90k+j
         NyKn0sUmhweLmgRmfq/ZPIkLHRr9ph4d43tflu64yvff4qGvjxNa51Y4avCNgZ96KlBw
         DX6WL4D8puM9oZhs016JwEN6M20JHHXTwI8XiKGIdSANfYgwN2l/ZP54UMf6VoSRToxK
         yFnpOdOpcM9TnZSpJCGFAY51Pf/AKQ1efYgSJ7akKYFIekQcXXyq4wNl6d0OsQBmnVsd
         kztnDg6/oCS0/3865oibhXWX9sVFbWoWW2EE39KrqTVqYFlPr24A/Ezkx8+KBTlqLlBu
         lhvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU13htRiUWclW7RgUVKt7VIf78YvgT4MEsRmzfJ1ZRXAmfYBaQX1eCjYLeewyNl+nFyLA0dKDM9ONBvKbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDCYPb28MGZe9ufsSgANUwjxOpTzVxNMcdJgDzmZkeWsrdIE+/
	Aa4i9gw3yJ8AHu8ZWJB/3ZrVS6PYEHsITh7RYDBl2uwjuCnHpm64
X-Gm-Gg: ASbGnctppUAckfS5rWa0WoWIGsc18JKGGXona5lHuMW1Z08DjC5nI7pMnp4xng+pCzo
	bzxoc9Flaf9lbfuJSw+gGl3pCSQhnUpfJr0gY+uFnmXKoD5GWbp5HJjIgy2XUQOICV7D812XBJO
	1oh4+a+VMUd9vfBU+BhIG7sBSoIMGwnY9l7R5wHzsxVzTEDTxoEv2r+curB8sIxU4vpvaaEFgjO
	1CBT4Af3ltr/U8hzbhtFg1wqA7V7WLfKU2qdzicX4rvlMmkFw8RFk3ACm5HRCrwdUPDG3fKhhes
	etAaNvIXiyc55htdTTHV7YYB1NRovnaH8/O8hdQqVrgBmmWV
X-Google-Smtp-Source: AGHT+IG6yf1DLKd9RBqBzhmjs+vsqWMxZMxsOyEVpIx2HZ0YwcmkSl4odD1JjuxgVA3Jl74sl+M1Ug==
X-Received: by 2002:a05:6214:226a:b0:6e4:4011:9df7 with SMTP id 6a1803df08f44-6f542a1dcf7mr48827996d6.16.1746627097378;
        Wed, 07 May 2025 07:11:37 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:7::])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f542780ecfsm14100776d6.86.2025.05.07.07.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:11:37 -0700 (PDT)
From: Usama Arif <usamaarif642@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@redhat.com,
	linux-mm@kvack.org
Cc: hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	riel@surriel.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	Usama Arif <usamaarif642@gmail.com>
Subject: [PATCH 0/1] prctl: allow overriding system THP policy to always
Date: Wed,  7 May 2025 15:00:33 +0100
Message-ID: <20250507141132.2773275-1-usamaarif642@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allowing override of global THP policy per process allows workloads
that have shown to benefit from hugepages to do so, without regressing
workloads that wouldn't benefit. This will allow such types of
workloads to be run/stacked on the same machine.

It also helps in rolling out hugepages in hyperscaler configurations
for workloads that benefit from them, where a single THP policy is
likely to be used across the entire fleet, and prctl will help override it.

An advantage of doing it via prctl vs creating a cgroup specific
option (like /sys/fs/cgroup/test/memory.transparent_hugepage.enabled) is
that this will work even when there are no cgroups present, and my
understanding is there is a strong preference of cgroups controls being
hierarchical which usually means them having a numerical value.


The output and code of test program is below:

[root@vm4 vmuser]# echo madvise > /sys/kernel/mm/transparent_hugepage/enabled
[root@vm4 vmuser]# echo inherit > /sys/kernel/mm/transparent_hugepage/hugepages-2048kB/enabled
[root@vm4 vmuser]# ./a.out
Default THP setting:
THP is not set to 'always'.
PR_SET_THP_ALWAYS = 1
THP is set to 'always'.
PR_SET_THP_ALWAYS = 0
THP is not set to 'always'.


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/prctl.h>

#define PR_SET_THP_ALWAYS 78
#define SIZE 12 * (2 * 1024 * 1024) // 24 MB

void check_smaps(void) {
    FILE *file = fopen("/proc/self/smaps", "r");
    if (!file) {
        perror("fopen");
        return;
    }

    char line[256];
    int is_hugepage = 0;
    while (fgets(line, sizeof(line), file)) {
        // if (strstr(line, "AnonHugePages:"))
        //     printf("%s\n", line);
        if (strstr(line, "AnonHugePages:") && strstr(line, "24576 kB"))
{
            // printf("%s\n", line);
            is_hugepage = 1;
            break;
        }
    }
    fclose(file);
    if (is_hugepage) {
        printf("THP is set to 'always'.\n");
    } else {
        printf("THP is not set to 'always'.\n");
    }
}

void test_mmap_thp(void) {
    char *buffer = (char *)mmap(NULL, SIZE, PROT_READ | PROT_WRITE,
                                MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if (buffer == MAP_FAILED) {
        perror("mmap");
        return;
    }
    // Touch the memory to ensure it's allocated
    memset(buffer, 0, SIZE);
    check_smaps();
    munmap(buffer, SIZE);
}

int main() {
    printf("Default THP setting: \n");
    test_mmap_thp();
    printf("PR_SET_THP_ALWAYS = 1 \n");
    prctl(PR_SET_THP_ALWAYS, 1, NULL, NULL, NULL);
    test_mmap_thp();
    printf("PR_SET_THP_ALWAYS = 0 \n");
    prctl(PR_SET_THP_ALWAYS, 0, NULL, NULL, NULL);
    test_mmap_thp();

    return 0;
}


Usama Arif (1):
  prctl: allow overriding system THP policy to always per process

 include/linux/huge_mm.h                          |  3 ++-
 include/linux/mm_types.h                         |  7 ++-----
 include/uapi/linux/prctl.h                       |  3 +++
 kernel/sys.c                                     | 16 ++++++++++++++++
 tools/include/uapi/linux/prctl.h                 |  3 +++
 .../perf/trace/beauty/include/uapi/linux/prctl.h |  3 +++
 6 files changed, 29 insertions(+), 6 deletions(-)

-- 
2.47.1

