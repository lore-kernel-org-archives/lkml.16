Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625ADDF49
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 14:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743776080; cv=none; b=j/06eu7LL7sKjI92z50SIPgY1R6b6ie51MdAu+kj5Jph6trD9p/EWnIiujguPD5H58ubz6DSNPCboYf1f8+zTVZ/VAyI9b3+8EWL6zVuNjj0CC87I3qcbiK21qFiHTBSAnej4RPnszBhLcZMIaETb4LebKuJOz3IhTKhNQ4hEDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743776080; c=relaxed/simple;
	bh=896IC+2u7psRCNxXn+2Xqx6Yid0M4chcEiS+WNqRqbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UGnrJgms5PCqrdBEBDJ8mYXRQ69fhtOz8uUSNbUnfCuAsDWumwxbGyK4rfmNH9YZLrC7Rm4D8f1EUpiUzXANB366lN2r6EbB9VoTTQl878MldrqW90eS/XfoPnDEQNctrRd5ltSiDIoAnoB7+l4nJ6C41bJVRv9z68yP4MOtxYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fH17SiGr; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fH17SiGr"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e673822f76so3591360a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 07:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743776077; x=1744380877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gJpivSxjSc/9rXX0LmnOIvI4oFeb6WE+LHnA/zK4Y68=;
        b=fH17SiGrEMaEkV4v3w8VpIJ5lKRTOVGUX/bFigla8l4RF6mUv2Ngm/jiKtQ6U8+0Fy
         TMu/Dgll9KonfwDgtJGe7SV5kvry9lyP2kWBFye7XAlNoF8i0wZBvK0iNTcvxV0dY6Ui
         82S73sabjdzUH+v9DH7L36v9xwan1Tocd1BndOBTcCyoZn+cvpT7H3jH8RWUG5c7gK1j
         bdmPA5ClvklPTjxEfte2IZXINIVyTasRgmH8AEVGHsp5MFuEkNVlUI6yVX31lO3uQB5H
         qNfZuYAc9T4YcSmeH2eFNVzMN/ONy6YgEDEimUqpU6gltIyyPr0VBx3xnMpGTmLlEcHq
         JtAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743776077; x=1744380877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gJpivSxjSc/9rXX0LmnOIvI4oFeb6WE+LHnA/zK4Y68=;
        b=LHCDFRw6CkerEai4RazfmhJEJ8fZs0BN6RvgjEFnnqIxsOBsQxTNh+ik+uaiJqHEDv
         NaKfqH5nCJj3XgLEcZ3nHQ2iaPyt4l+z9Z05WgD1u1YxVaKgPr1rFApEL2d6cmCkBSmN
         vOsBgaF+fylbKHa722i3ANih1yWQZD85SInDDP/kk3QWCDZVFq3VeqhSb5EzD1PxARab
         wHWdUrtlYiI9JJN7bDcRCpqKGvxxMSnivDjuwPoD+EIkJKexHjf6KYCFYmpuJ90zFtdX
         iTvznCrvb9/omxzSlkFhJPozojiqK7IpwmFj+AxAkI/q0CG5gE8VqVjqw/TJx5caG8lq
         Sn+w==
X-Forwarded-Encrypted: i=1; AJvYcCUmLz0t+xj7UPikBJ4VL79d4/IljROm9L8O4l12qps3z33+zd+2uh1zywIQ5b6w4dBDbwI7ijCv1y/FM8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzwIDwgXKkYw5qy89Dn+5d/M2qCxphf7KbXHIJgqZtKLxZcHt6
	xE+N8NGrVkYP8ZRc/yRtuQ0VVtrOF3Y7dXbmS0Vchq3QxMeKZnu6
X-Gm-Gg: ASbGncunA6I5ZI8Dnl/+4nzPE49s2e7ZxNQrJY69IKBaKfj3Vyy/Aehxqct4DDQPwHu
	2F54knluP5eX54ZlFwo0QW87DneLmbE1TE2o7li/VDk3Aypsv70GeLxn+NVTclHW45C9nTeqW4x
	gpmQHaHFfG5YMW0vZ2GFqBABzpxlR6HzBDDVUwzO7g3LC8Ry2zCmOhv6+wy2sb8b0gquBgweKJD
	FMuwYFyoW/ze4sQKg135LLabHIKZ8eXOju6wNjecIG1yKPXm5xo9wmYn/RJs/tDyfIo4maTzNSp
	IWKE7NxZ8X03Hqb3RxJchYlK/gY2hcTppiKj8QWI6mXJtQ==
X-Google-Smtp-Source: AGHT+IGYFZ6hC6z+EMlRHDaAsc1nJkG1Dn0GIlwrkPAX2XGuhXzB86i3AOaT7LapHOq2itz/98t/vg==
X-Received: by 2002:a17:907:d86:b0:ac6:f97f:a010 with SMTP id a640c23a62f3a-ac7d6cbd8c2mr264719066b.12.1743776076350;
        Fri, 04 Apr 2025 07:14:36 -0700 (PDT)
Received: from [192.168.1.100] ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe9868asm261013266b.41.2025.04.04.07.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 07:14:35 -0700 (PDT)
Message-ID: <1640cf43-8125-a562-91f9-9b306b863dc7@gmail.com>
Date: Fri, 4 Apr 2025 16:14:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] x86/idle: Remove MFENCEs for X86_BUG_CLFLUSH_MONITOR
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 LKML <linux-kernel@vger.kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
References: <20250402172458.1378112-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Uros Bizjak <ubizjak@gmail.com>
In-Reply-To: <20250402172458.1378112-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2. 04. 25 19:24, Andrew Cooper wrote:
> Commit 7e98b7192046 ("x86, idle: Use static_cpu_has() for CLFLUSH
> workaround, add barriers") adds barriers, justified with:
> 
>    ... and add memory barriers around it since the documentation is explicit
>    that CLFLUSH is only ordered with respect to MFENCE.
> 
> This also triggered the same adjustment in commit
> f8e617f45829 ("sched/idle/x86: Optimize unnecessary mwait_idle() resched
> IPIs") during development, although it failed to get the static_cpu_has_bug()
> treatment.
> 
> X86_BUG_CLFLUSH_MONITOR (a.k.a the AAI65 errata) is specific to Intel CPUs,
> and the SDM currently states:
> 
>    Executions of the CLFLUSH instruction are ordered with respect to each
>    other and with respect to writes, locked read-modify-write instructions,
>    and fence instructions[1].
> 
> With footnote 1 reading:
> 
>    Earlier versions of this manual specified that executions of the CLFLUSH
>    instruction were ordered only by the MFENCE instruction.  All processors
>    implementing the CLFLUSH instruction also order it relative to the other
>    operations enumerated above.
> 
> i.e. The SDM was incorrect at the time, and barriers should not have been
> inserted.  Double checking the original AAI65 errata (not available from
> intel.com any more) shows no mention of barriers either.
> 
> Note: If this were a general codepath, the MFENCEs would be needed, because
>        AMD CPUs of the same vintage do sport otherwise-unordered CLFLUSHs.
> 
> Furthermore, use a plain alternative, rather than static_cpu_has_bug() and/or
> no optimisation.  The workaround is a single instruction.
> 
> Use an explicit %rax pointer rather than a general memory operand, because
> MONITOR takes the pointer implicitly in the same way.
> 
> Link: https://web.archive.org/web/20090219054841/http://download.intel.com/design/xeon/specupdt/32033601.pdf
> Fixes: 7e98b7192046 ("x86, idle: Use static_cpu_has() for CLFLUSH workaround, add barriers")
> Fixes: f8e617f45829 ("sched/idle/x86: Optimize unnecessary mwait_idle() resched IPIs")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Thomas Gleixner <tglx@linutronix.de>
> CC: Ingo Molnar <mingo@redhat.com>
> CC: Borislav Petkov <bp@alien8.de>
> CC: Dave Hansen <dave.hansen@linux.intel.com>
> CC: x86@kernel.org
> CC: "H. Peter Anvin" <hpa@zytor.com>
> CC: linux-kernel@vger.kernel.org
> 
> v2:
>   * Fix the same pattern in mwait_idle() too
>   * Expand on why we're not using a general memory operand.
> ---
>   arch/x86/include/asm/mwait.h | 11 +++++------
>   arch/x86/kernel/process.c    | 10 ++++------
>   2 files changed, 9 insertions(+), 12 deletions(-)

There is another instance of the same sequence in arch/x86/kernel/smpboot.c:

		/*
		 * The CLFLUSH is a workaround for erratum AAI65 for
		 * the Xeon 7400 series.  It's not clear it is actually
		 * needed, but it should be harmless in either case.
		 * The WBINVD is insufficient due to the spurious-wakeup
		 * case where we return around the loop.
		 */
		mb();
		clflush(md);
		mb();
		__monitor(md, 0, 0);
		mb();
		__mwait(eax_hint, 0);

Should this also be converted to the new sequence?

Uros.
