Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B260247283
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748423379; cv=none; b=RmNxEVLLB1aNhhGI5pn+9UswVeH6KVgAsq5/iH+L5T9Klo3Q2IbVaK46RFyKWbuBQXYY9TWSHXnrbBd6ZD0/rB9YE2osRZ/xDqMR7/VJ/mSO9xUXKPRJf982B7ocYQ239L3OIUBBGrRD7Ybb95z+Svhi4MUMYaUPUUXBKL3I7t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748423379; c=relaxed/simple;
	bh=eaZNI22j514NOTuL5YNsiQQHcPGm+KwlO2UZuSEedCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZLn7PkhmJ/on5vOh2PhZil6CKbgp7v8LSmUR7R4adxzXbFwV0IB+gJL5ghdM1RIsc0ZKI2UyYUKq78qAxCrjNiAjwYakJ39PTURBAZ/t/r64isvmBvOW9hZaWnII85mursvjbjlktaKl2JIRqJRHNnzzPowpAKHHhvEBzKoVPPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bHyEwZ6X; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bHyEwZ6X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748423377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3O3V+YBB8M7I1+j2oOnnuqTbUPyASRos/wIVAbMl2TY=;
	b=bHyEwZ6Xwsv1hf6l63RY09DyOrpExnaNKSucF+znlO7WKlN1ICcOQpQvzeKhDIYnIJhxEe
	fxkoNbGX7bVdYKCCdjSYImosErkXrj3cyyLHmbZem4bx0h5oatKlQTtZP82qCMFgqMJtcq
	qEk7fZKGTsqesIKMHTCe3NNoLyb6vQs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-cXxSPZfMPwKWcXB7ps5bLg-1; Wed, 28 May 2025 05:09:35 -0400
X-MC-Unique: cXxSPZfMPwKWcXB7ps5bLg-1
X-Mimecast-MFC-AGG-ID: cXxSPZfMPwKWcXB7ps5bLg_1748423374
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a3696a0d3aso1905763f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 02:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748423374; x=1749028174;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3O3V+YBB8M7I1+j2oOnnuqTbUPyASRos/wIVAbMl2TY=;
        b=pQpnKe00gJpIfESPx0EuBCAhDC3xnq6zij4fdTm2grxw36bOxj5sbFtsPWqdWrAURy
         uSsOlYabx1J9XE6Y/w0nH4AJ+L9+Gx6tjeT/5ZAzAI3bM3iXGabk01L3xmnhCSFjHg27
         OGa2+pafYcTWxduAgT+T+pCy7WIxAFkS6R1Nk1pozFSr+1+FeV5rAmiU9rBL5WzeHavg
         31RKh2tWrzZxNbydpWfN10UqfDb7+SNiCiarh/ogJMwKEGWixHLHeD2UhapgsCExt3TT
         dfc/hldfFizItFcvEqO04gEHP8HB9ByqR2Sb5Jho1YprEfqf1Q8Et/ze4FvQ7B1SJ8Cv
         Zlpg==
X-Forwarded-Encrypted: i=1; AJvYcCWPjoGvkWofrShwImLevFPEO5BxU4BUAdcOWHAT50Aeg3JaiyM6QAm7M8+vDRe77Rq5sy5xRrAj9GAa95A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw28THKeMbFj/DpyvEPbcKZyb8IIfcmVJ3z7YdonBdJgszNv3d/
	Fc36KMs1XxJkYS3eDg6+xywqWeNUL1frhJ0RLAJI8IjVXde5bwJlQzlt2W/l95B+dg7gZxVEYrG
	DiJpqab9Dnu2bpK85SXy8CPcnNnC4JgX56rWeVnjJ3ss89QraQqwHNHA+FhqO13q9eQ==
X-Gm-Gg: ASbGncsfB/TJvb8AiCAmzxbcP2ewpVzqckawlAEzTO7kXeh98mPw4ohX3seOD5c77WS
	qP8w161r7VihAcpYxrYZGkz2QO1I7R6vfqFw9WyudovwqKfmx3vT0NS3x4tXIr6ikCW2XCAbCzs
	xoQmU5LgbhmJ4iLHBl7GkG2p6xS9BXxyPQ/DSh1aTxvKKa678zWczGEMevxUCLWZk5HwX5xEQzO
	ukNVzoENv6dTgsVEyATICSzr8pDShCGiLc06c0YYbUz0R2x2OJa27YVMTeGk7ETOhzJ8y53xQRi
	H+z3TwdgG9o=
X-Received: by 2002:a5d:5f93:0:b0:3a4:dc77:5789 with SMTP id ffacd0b85a97d-3a4dc7759bdmr8989965f8f.10.1748423374024;
        Wed, 28 May 2025 02:09:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuVB49DNuCMZCD9ZgAV1EUkM+z/1OmkaF2/KqRplm9wSye2rAwg1/YAa3nrHj+Rb8/4fGOJA==
X-Received: by 2002:a5d:5f93:0:b0:3a4:dc77:5789 with SMTP id ffacd0b85a97d-3a4dc7759bdmr8989934f8f.10.1748423373482;
        Wed, 28 May 2025 02:09:33 -0700 (PDT)
Received: from [10.43.17.53] ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4507253bbe8sm11514425e9.7.2025.05.28.02.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 02:09:33 -0700 (PDT)
Message-ID: <c8bb97cc-68b6-44f1-a4f4-b0ebc42a7f92@redhat.com>
Date: Wed, 28 May 2025 11:09:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bpf: Specify access type of bpf_sysctl_get_name args
To: Yonghong Song <yonghong.song@linux.dev>, bpf@vger.kernel.org
Cc: Martin KaFai Lau <martin.lau@linux.dev>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, linux-kernel@vger.kernel.org,
 Eduard Zingerman <eddyz87@gmail.com>
References: <20250527165412.533335-1-jmarchan@redhat.com>
 <7aed6949-1076-4c8f-8939-35b47072d431@linux.dev>
From: Jerome Marchand <jmarchan@redhat.com>
Content-Language: en-US
In-Reply-To: <7aed6949-1076-4c8f-8939-35b47072d431@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/05/2025 21:56, Yonghong Song wrote:
> 
> 
> On 5/27/25 9:54 AM, Jerome Marchand wrote:
>> The second argument of bpf_sysctl_get_name() helper is a pointer to a
>> buffer that is being written to. However that isn't specify in the
>> prototype.
>>
>> Until commit 37cce22dbd51a ("bpf: verifier: Refactor helper access
>> type tracking"), all helper accesses were considered as a possible
>> write access by the verifier, so no big harm was done. However, since
>> then, the verifier might make wrong asssumption about the content of
>> that address which might lead it to make faulty optimizations (such as
>> removing code that was wrongly labeled dead). This is what happens in
> 
> Could you give more detailed example about the above statement?
> 
>    the verifier might make wrong asssumption about the content of
>    that address which might lead it to make faulty optimizations (such as
>    removing code that was wrongly labeled dead)

To be clear, I don't mean that the verifier does anything wrong in this
case. It makes a wrong assumption because it was fed wrong information
by the helper prototype. Here is the output of the verifier with commit
37cce22dbd51a:

func#0 @0
Live regs before insn:
   0: .1........ (bf) r7 = r10
   1: .1.....7.. (07) r7 += -8
   2: .1.....7.. (b7) r0 = 0
   3: 01.....7.. (7b) *(u64 *)(r7 +0) = r0
   4: .1.....7.. (bf) r2 = r7
   5: .12....7.. (b7) r3 = 8
   6: .123...7.. (b7) r4 = 1
   7: .1234..7.. (85) call bpf_sysctl_get_name#101
   8: 0......7.. (55) if r0 != 0x7 goto pc+6
   9: .......7.. (18) r8 = 0x6d656d5f706374
  11: .......78. (79) r9 = *(u64 *)(r7 +0)
  12: ........89 (5d) if r8 != r9 goto pc+2
  13: .......... (b7) r0 = 1
  14: 0......... (05) goto pc+1
  15: .......... (b7) r0 = 0
  16: 0......... (95) exit
0: R1=ctx() R10=fp0
0: (bf) r7 = r10                      ; R7_w=fp0 R10=fp0
1: (07) r7 += -8                      ; R7_w=fp-8
2: (b7) r0 = 0                        ; R0_w=0
3: (7b) *(u64 *)(r7 +0) = r0          ; R0_w=0 R7_w=fp-8 fp-8_w=0
4: (bf) r2 = r7                       ; R2_w=fp-8 R7_w=fp-8
5: (b7) r3 = 8                        ; R3_w=8
6: (b7) r4 = 1                        ; R4_w=1
7: (85) call bpf_sysctl_get_name#101
mark_precise: frame0: last_idx 7 first_idx 0 subseq_idx -1
mark_precise: frame0: regs=r3 stack= before 6: (b7) r4 = 1
mark_precise: frame0: regs=r3 stack= before 5: (b7) r3 = 8
8: R0_w=scalar()
8: (55) if r0 != 0x7 goto pc+6        ; R0_w=7
9: (18) r8 = 0x6d656d5f706374         ; R8_w=0x6d656d5f706374
11: (79) r9 = *(u64 *)(r7 +0)         ; R7=fp-8 R9=0 fp-8=0
12: (5d) if r8 != r9 goto pc+2
mark_precise: frame0: last_idx 12 first_idx 12 subseq_idx -1
mark_precise: frame0: parent state regs=r8 stack=:  R0_w=7 R7_w=fp-8 R8_rw=P0x6d656d5f706374 R9_rw=0 R10=fp0 fp-8_w=0
mark_precise: frame0: last_idx 11 first_idx 0 subseq_idx 12
mark_precise: frame0: regs=r8 stack= before 11: (79) r9 = *(u64 *)(r7 +0)
mark_precise: frame0: regs=r8 stack= before 9: (18) r8 = 0x6d656d5f706374
mark_precise: frame0: last_idx 12 first_idx 12 subseq_idx -1
mark_precise: frame0: parent state regs=r9 stack=:  R0_w=7 R7_w=fp-8 R8_rw=P0x6d656d5f706374 R9_rw=P0 R10=fp0 fp-8_w=0
mark_precise: frame0: last_idx 11 first_idx 0 subseq_idx 12
mark_precise: frame0: regs=r9 stack= before 11: (79) r9 = *(u64 *)(r7 +0)
mark_precise: frame0: regs= stack=-8 before 9: (18) r8 = 0x6d656d5f706374
mark_precise: frame0: regs= stack=-8 before 8: (55) if r0 != 0x7 goto pc+6
mark_precise: frame0: regs= stack=-8 before 7: (85) call bpf_sysctl_get_name#101
mark_precise: frame0: regs= stack=-8 before 6: (b7) r4 = 1
mark_precise: frame0: regs= stack=-8 before 5: (b7) r3 = 8
mark_precise: frame0: regs= stack=-8 before 4: (bf) r2 = r7
mark_precise: frame0: regs= stack=-8 before 3: (7b) *(u64 *)(r7 +0) = r0
mark_precise: frame0: regs=r0 stack= before 2: (b7) r0 = 0
12: R8=0x6d656d5f706374 R9=0
15: (b7) r0 = 0                       ; R0_w=0
16: (95) exit
mark_precise: frame0: last_idx 16 first_idx 12 subseq_idx -1
mark_precise: frame0: regs=r0 stack= before 15: (b7) r0 = 0

from 8 to 15: R0_w=scalar() R7_w=fp-8 R10=fp0 fp-8_w=0
15: R0_w=scalar() R7_w=fp-8 R10=fp0 fp-8_w=0
15: (b7) r0 = 0                       ; R0_w=0
16: (95) exit
mark_precise: frame0: last_idx 16 first_idx 0 subseq_idx -1
mark_precise: frame0: regs=r0 stack= before 15: (b7) r0 = 0
processed 16 insns (limit 1000000) max_states_per_insn 0 total_states 1 peak_states 1 mark_read 1

At line 11, it still assume that fp-8=0, despite the call to
bpf_sysctl_get_name. Because of that, it assumes that the first branch
of the conditional jump at line 12 is never taken an the program always
return 0 (access denied).

For comparison, here's the verifier output when commit 37cce22dbd51a is
reverted:

func#0 @0
Live regs before insn:
   0: .1........ (bf) r7 = r10
   1: .1.....7.. (07) r7 += -8
   2: .1.....7.. (b7) r0 = 0
   3: 01.....7.. (7b) *(u64 *)(r7 +0) = r0
   4: .1.....7.. (bf) r2 = r7
   5: .12....7.. (b7) r3 = 8
   6: .123...7.. (b7) r4 = 1
   7: .1234..7.. (85) call bpf_sysctl_get_name#101
   8: 0......7.. (55) if r0 != 0x7 goto pc+6
   9: .......7.. (18) r8 = 0x6d656d5f706374
  11: .......78. (79) r9 = *(u64 *)(r7 +0)
  12: ........89 (5d) if r8 != r9 goto pc+2
  13: .......... (b7) r0 = 1
  14: 0......... (05) goto pc+1
  15: .......... (b7) r0 = 0
  16: 0......... (95) exit
0: R1=ctx() R10=fp0
0: (bf) r7 = r10                      ; R7_w=fp0 R10=fp0
1: (07) r7 += -8                      ; R7_w=fp-8
2: (b7) r0 = 0                        ; R0_w=0
3: (7b) *(u64 *)(r7 +0) = r0          ; R0_w=0 R7_w=fp-8 fp-8_w=0
4: (bf) r2 = r7                       ; R2_w=fp-8 R7_w=fp-8
5: (b7) r3 = 8                        ; R3_w=8
6: (b7) r4 = 1                        ; R4_w=1
7: (85) call bpf_sysctl_get_name#101
mark_precise: frame0: last_idx 7 first_idx 0 subseq_idx -1
mark_precise: frame0: regs=r3 stack= before 6: (b7) r4 = 1
mark_precise: frame0: regs=r3 stack= before 5: (b7) r3 = 8
8: R0_w=scalar()
8: (55) if r0 != 0x7 goto pc+6        ; R0_w=7
9: (18) r8 = 0x6d656d5f706374         ; R8_w=0x6d656d5f706374
11: (79) r9 = *(u64 *)(r7 +0)         ; R7=fp-8 R9=scalar() fp-8=mmmmmmmm
12: (5d) if r8 != r9 goto pc+2        ; R8=0x6d656d5f706374 R9=0x6d656d5f706374
13: (b7) r0 = 1                       ; R0_w=1
14: (05) goto pc+1
16: (95) exit
mark_precise: frame0: last_idx 16 first_idx 12 subseq_idx -1
mark_precise: frame0: regs=r0 stack= before 14: (05) goto pc+1
mark_precise: frame0: regs=r0 stack= before 13: (b7) r0 = 1

from 12 to 15: R0=7 R7=fp-8 R8=0x6d656d5f706374 R9=scalar() R10=fp0 fp-8=mmmmmmmm
15: R0=7 R7=fp-8 R8=0x6d656d5f706374 R9=scalar() R10=fp0 fp-8=mmmmmmmm
15: (b7) r0 = 0                       ; R0_w=0
16: (95) exit
mark_precise: frame0: last_idx 16 first_idx 12 subseq_idx -1
mark_precise: frame0: regs=r0 stack= before 15: (b7) r0 = 0

from 8 to 15: R0_w=scalar() R7_w=fp-8 R10=fp0 fp-8_w=mmmmmmmm
15: R0_w=scalar() R7_w=fp-8 R10=fp0 fp-8_w=mmmmmmmm
15: (b7) r0 = 0                       ; R0_w=0
16: (95) exit
mark_precise: frame0: last_idx 16 first_idx 0 subseq_idx -1
mark_precise: frame0: regs=r0 stack= before 15: (b7) r0 = 0
processed 19 insns (limit 1000000) max_states_per_insn 0 total_states 1 peak_states 1 mark_read 1

> 
> This patch actually may cause a behavior change.
> 
> Without this patch, typically the whole buffer will be initialized
> to 0 and then the helper itself will copy bytes until seeing a '\0'.
> 
> With this patch, bpf prog does not need to initialize the buffer.
> Inside the helper, the copied bytes may not cover the whole buffer.

If that's an issue, it could be easily fixed by replacing
ARG_PTR_TO_UNINIT_MEM by ARG_PTR_TO_MEM | MEM_WRITE.
I don't know what the original intention was when bpf_sysctl_get_name()
was introduced, but almost all helpers use ARG_PTR_TO_UNINIT_MEM for
such a case.

Jerome

> 
>> test_sysctl selftest to the tests related to sysctl_get_name.
>>
>> Correctly mark the second argument of bpf_sysctl_get_name() as
>> ARG_PTR_TO_UNINIT_MEM.
>>
>> Signed-off-by: Jerome Marchand <jmarchan@redhat.com>
>> ---
>>   kernel/bpf/cgroup.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/kernel/bpf/cgroup.c b/kernel/bpf/cgroup.c
>> index 84f58f3d028a3..09c02a592d24a 100644
>> --- a/kernel/bpf/cgroup.c
>> +++ b/kernel/bpf/cgroup.c
>> @@ -2104,7 +2104,7 @@ static const struct bpf_func_proto 
>> bpf_sysctl_get_name_proto = {
>>       .gpl_only    = false,
>>       .ret_type    = RET_INTEGER,
>>       .arg1_type    = ARG_PTR_TO_CTX,
>> -    .arg2_type    = ARG_PTR_TO_MEM,
>> +    .arg2_type    = ARG_PTR_TO_UNINIT_MEM,
>>       .arg3_type    = ARG_CONST_SIZE,
>>       .arg4_type    = ARG_ANYTHING,
>>   };
> 
> 

