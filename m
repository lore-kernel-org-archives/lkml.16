Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24E3296153
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534080; cv=none; b=F6xIxhZOnRvwYChQO0iy1Ra9AKPkivJOzYcQh0x+CzXlWGcCqRiKfI8JMbNvJwIUSWXacIG3zQDUTtnpiL96WhILCqA7rL06TtiUQ9C3o4ugZknUr0nfAM60r1ooZejaVZQGwu14o3FgflpVuLSaU8kwQBaktRkPjCIWClXYBi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534080; c=relaxed/simple;
	bh=jd8PZiCrYkC0YVPPZncWVQb9IVU48UrHUjj/QKfS9oc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ExEjAcUhbfnbIol0y3CME2NbU/sJn2Q5YDERahy7wvvbCthUMkGlgG8fnTzXIrkq1OThnUiibrWdAj9fqeXM9/nHoVTpP1nCBI/8FEChgP/gO6jYgPC3ue8qGxsU4gv+PQ8sJDPXm6F3SNlDKAgBsPulBV9IvbF89IgtRxQTiCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YUramh1g; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YUramh1g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751534077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/ss5Fk/zIHi1NMo28tkoRuxLdqKHsGk9x5F/u4LxilY=;
	b=YUramh1geYr/OIL4vSuzyDjIm6fPgbxL+n0Jugo1RcDLawNfRjwUd0vYCyL1566JrwKW4w
	13K9unXjdw6sKmt0PJjOSOhSfNe4C7yXBY5bffhGaVVsiDvv59aWpVe9RVnSU5LwI3a1El
	+ZbRdMiUyrj54PsQ2VlZWAza4nEoFtc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-hQFZ5wpiPZifSMjnLa8jmg-1; Thu, 03 Jul 2025 05:14:35 -0400
X-MC-Unique: hQFZ5wpiPZifSMjnLa8jmg-1
X-Mimecast-MFC-AGG-ID: hQFZ5wpiPZifSMjnLa8jmg_1751534075
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ade57fec429so410929566b.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 02:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751534074; x=1752138874;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/ss5Fk/zIHi1NMo28tkoRuxLdqKHsGk9x5F/u4LxilY=;
        b=oWjiJZr0w58wyffj9pnFntKN21MzjCpdgYMDZ3gQN/aiLq13zg9Amt/wwvUUjXBTQq
         K4aZuFtcAm8Xlp+tH2mHdby0wUwN9r56EPBPqiV4W1G2v1xc2+tNVN7QawRJNzC5Pk5r
         dpp/YcQwPkz9OmigoIH+HXZJisg6LzKZX4N9UpOWkADLVsQoUbAcDEPAiUXphrB1wkXD
         1MB5JD6sP7Ns9pkyCR80NR5RvTdtWYX0tDqJZapB7eYHqJM3ui/DxRJlHlKXZKRjtTBn
         0r62i6Y5H/YZrNDmU0irYbCkWYWdyIf/ezOdztjdsljruvU9L55DOcmfg/1v7R/TrWI0
         ZLrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtsKfFPT9E4DofvtnSo8nP4RveaGaIc84/r10Ip9OSTdtyilH26gE5OWqnRRIpdyLhkdRm7zraloXqh4M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw+MelxcYRdedJOk2NxUTCiMUjcZM1UFKKj2UL5e86WhvGiKOr
	9MWfIzr90w9EsPb2X/gpiwsWvM8I85tcqkoff/fcQzM43Zu7suszHlFHy/J9CEqtkJ2hBIvPzux
	ghrmaFMtBZ1R1vp1XKHeWl75emm66KzoYdqSKKWjeQVl1NwjpV6BPfEPkh0s97trjWw==
X-Gm-Gg: ASbGnctiN8S2a6x8wtdrRC8DueGp/KZzjiJGqcNEE4Bm2BbGFoH5X889J6FRwI+3Cvj
	EG9OturTVNvGLzukfqGavUIT2P8Cr9PKk3wiVuDeyGP0iTeIOwb3F1mXj6HBXK6ttphn262ij5y
	1lpWrS9+JMWClSZf7EXVEkanRiKFltS6wjMZFHK5Ap6V6NPAWJiw8/X9BGeXHtnaF3ACEAgzlAv
	zyXVNOYdDhman9c1BH/J0ZUu1O/d7giW2NXqFaA9a5sce1Yh4jK3qAcj23QZrXDLaKbt0p37mXK
	/acWudz30FRBBA6o2d9BmGcclPncCdlEAK5AD10SsQSg
X-Received: by 2002:a17:907:3e0b:b0:adb:23e0:9297 with SMTP id a640c23a62f3a-ae3c2ba7d8cmr561174766b.17.1751534074265;
        Thu, 03 Jul 2025 02:14:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpv9LLbFCl3ldcEsWln7WTKCU1DiUBATTPI77bVMl/fb93gfbskiteVDBruFDaEeHqi8rF/A==
X-Received: by 2002:a17:907:3e0b:b0:adb:23e0:9297 with SMTP id a640c23a62f3a-ae3c2ba7d8cmr561170766b.17.1751534073622;
        Thu, 03 Jul 2025 02:14:33 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8292076csm10063057a12.32.2025.07.03.02.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 02:14:33 -0700 (PDT)
Message-ID: <42c0135a-dbd9-47e1-9b9e-c36c147a2315@redhat.com>
Date: Thu, 3 Jul 2025 11:14:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] selftests/mm: Fix child process exit codes in
 ksm_functional_tests
To: Donet Tom <donettom@linux.ibm.com>,
 Aboorva Devarajan <aboorvad@linux.ibm.com>, akpm@linux-foundation.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, shuah@kernel.org,
 pfalcato@suse.de, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, ritesh.list@gmail.com
References: <20250703060656.54345-1-aboorvad@linux.ibm.com>
 <20250703060656.54345-6-aboorvad@linux.ibm.com>
 <9586f8ff-3b34-4613-853b-0c808fcbb9d2@redhat.com>
 <7b78974b-6841-4280-89c1-01bd835d4f27@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <7b78974b-6841-4280-89c1-01bd835d4f27@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03.07.25 10:51, Donet Tom wrote:
> Hi David
> 
> On 7/3/25 2:03 PM, David Hildenbrand wrote:
>> On 03.07.25 08:06, Aboorva Devarajan wrote:
>>> In ksm_functional_tests, test_child_ksm() returned negative values
>>> to indicate errors. However, when passed to exit(), these were
>>> interpreted as large unsigned values (e.g, -2 became 254), leading to
>>> incorrect handling in the parent process. As a result, some tests
>>> appeared to be skipped or silently failed.
>>>
>>> This patch changes test_child_ksm() to return positive error codes
>>> (1, 2, 3) and updates test_child_ksm_err() to interpret them correctly.
>>> This ensures the parent accurately detects and reports child process
>>> failures.
>>>
>>> --------------
>>> Before patch:
>>> --------------
>>> - [RUN] test_unmerge
>>> ok 1 Pages were unmerged
>>> ...
>>> - [RUN] test_prctl_fork
>>> - No pages got merged
>>> - [RUN] test_prctl_fork_exec
>>> ok 7 PR_SET_MEMORY_MERGE value is inherited
>>> ...
>>> Bail out! 1 out of 8 tests failed
>>> - Planned tests != run tests (9 != 8)
>>> - Totals: pass:7 fail:1 xfail:0 xpass:0 skip:0 error:0
>>>
>>> --------------
>>> After patch:
>>> --------------
>>> - [RUN] test_unmerge
>>> ok 1 Pages were unmerged
>>> ...
>>> - [RUN] test_prctl_fork
>>> - No pages got merged
>>> not ok 7 Merge in child failed
>>> - [RUN] test_prctl_fork_exec
>>> ok 8 PR_SET_MEMORY_MERGE value is inherited
>>> ...
>>> Bail out! 2 out of 9 tests failed
>>> - Totals: pass:7 fail:2 xfail:0 xpass:0 skip:0 error:0
>>>
>>> Fixes: 6c47de3be3a0 ("selftest/mm: ksm_functional_tests: extend test
>>> case for ksm fork/exec")
>>> Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
>>
>> BTW, when I run the test, I get this weird output
>>
>> TAP version 13
>> 1..9
>> # [RUN] test_unmerge
>> ok 1 Pages were unmerged
>> # [RUN] test_unmerge_zero_pages
>> ok 2 KSM zero pages were unmerged
>> # [RUN] test_unmerge_discarded
>> ok 3 Pages were unmerged
>> # [RUN] test_unmerge_uffd_wp
>> ok 4 Pages were unmerged
>> # [RUN] test_prot_none
>> ok 5 Pages were unmerged
>> # [RUN] test_prctl
>> ok 6 Setting/clearing PR_SET_MEMORY_MERGE works
>> # [RUN] test_prctl_fork
>> ok 7 PR_SET_MEMORY_MERGE value is inherited
>> # [RUN] test_prctl_fork_exec
>>
>> ^ where is the test?
>>
>> # [RUN] test_prctl_unmerge
>> ok 8 Pages were unmerged
>> # Planned tests != run tests (9 != 8)
>> # Totals: pass:8 fail:0 xfail:0 xpass:0 skip:0 error:0
>>
>> ^ what?
>>
>> ok 8 PR_SET_MEMORY_MERGE value is inherited
>> # [RUN] test_prctl_unmerge
>> ok 9 Pages were unmerged
>> # Totals: pass:9 fail:0 xfail:0 xpass:0 skip:0 error:0
>>
>> ^ huh, what now?
>>
> 
> The problem with the exec test is that it uses its own binary to exec.
> 
>           } else if (child_pid == 0) {
>                   char *prg_name = "./ksm_functional_tests";
>                   char *argv_for_program[] = { prg_name,
> FORK_EXEC_CHILD_PRG_NAME, NULL };
> 
>                   execv(prg_name, argv_for_program);
>                   return;
>           }
 > > So we should run it on the same directory where the binary present.

So, I assume the execv fails. We should handle that, and figure out why 
it fails.

diff --git a/tools/testing/selftests/mm/ksm_functional_tests.c 
b/tools/testing/selftests/mm/ksm_functional_tests.c
index d8bd1911dfc0a..0ddbb390df33b 100644
--- a/tools/testing/selftests/mm/ksm_functional_tests.c
+++ b/tools/testing/selftests/mm/ksm_functional_tests.c
@@ -527,6 +527,8 @@ static void test_child_ksm_err(int status)
                 ksft_test_result_fail("Merge in child failed\n");
         else if (status == -3)
                 ksft_test_result_skip("Merge in child skipped\n");
+       else if (status == 4)
+               ksft_test_result_fail("Binary not found\n");
  }

  /* Verify that prctl ksm flag is inherited. */
@@ -598,7 +600,7 @@ static void test_prctl_fork_exec(void)
                 char *argv_for_program[] = { prg_name, 
FORK_EXEC_CHILD_PRG_NAME };

                 execv(prg_name, argv_for_program);
-               return;
+               exit(4);
         }

         if (waitpid(child_pid, &status, 0) > 0) {

results in

TAP version 13
1..9
# [RUN] test_unmerge
ok 1 Pages were unmerged
# [RUN] test_unmerge_zero_pages
ok 2 KSM zero pages were unmerged
# [RUN] test_unmerge_discarded
ok 3 Pages were unmerged
# [RUN] test_unmerge_uffd_wp
ok 4 Pages were unmerged
# [RUN] test_prot_none
ok 5 Pages were unmerged
# [RUN] test_prctl
ok 6 Setting/clearing PR_SET_MEMORY_MERGE works
# [RUN] test_prctl_fork
ok 7 PR_SET_MEMORY_MERGE value is inherited
# [RUN] test_prctl_fork_exec
not ok 8 Binary not found
# [RUN] test_prctl_unmerge
ok 9 Pages were unmerged
Bail out! 1 out of 9 tests failed
# Totals: pass:8 fail:1 xfail:0 xpass:0 skip:0 error:0


-- 
Cheers,

David / dhildenb

