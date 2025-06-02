Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5BF229B0F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875814; cv=none; b=XRNS7qFyYQVYv7EjlOujMXk27IQdaZz6Vaxt1R9Cs9okUXxtNvZwpAQ253R89Yy/EGFJcBivNmz3vHGcr08XouWWo+1VtSE4GW2HYPABCnnLg0aHwYcqc+4TogQOVBPDOPWz8O10R0B2E9bOmzYlHSq3TFjW2A1ECQHNOktpKiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875814; c=relaxed/simple;
	bh=/k34t8/LgG3e90OZL0CSvO9793DF4usolPFi4z0B+1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LkrLWFGiTMGzfi6WTks28P2IK9mHTQGyRDpICFHjVm2IZHtG4JfY7CPRHX10p5IXI/wWN/5AKcX9Tp5CuK4TqSOJISGAnRYETFW/4Zvmrc5303ayotY0vl32Z6a0ssx0sctwDt84+G86awhn5uDInEl5x/dzpXG1YKUCuAdO+pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ge8rPTDu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ge8rPTDu"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d7b50815so10873605e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 07:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748875800; x=1749480600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SlAsh3le3ggT/tu+yH+s6lq1YGTZTIUJn8dr1gsBRy8=;
        b=Ge8rPTDucn9eI4tnGTfXxF5B8Xxug5Z00y4KmZDju0DWlN2wQOn8+S+WJEN601hOI7
         KMtkSIye/oX3yEeVLbCvKG6wJHufLexDobZoSkMkOFb0X9BySU8E1/RJENl3SdoiDts9
         Tr9ZDG1ZQZoo85rTWjstIThwMlaFczuKMwEKFcY6jGIoU4VH6xZiHBuPgcztHqgQPvQ+
         z9o3elZmfs0oexxkpfR6ZClT99LxzrBKvcW1K97GgfT7w49bIS0CqmvyAYt/w3z8l6DZ
         0jG5u+lAwYTndc56icBdW06n6Js0M+4oas/GCy9EMTcVLTTAQFqWarLVg2ats4sGPyBP
         2RcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748875800; x=1749480600;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SlAsh3le3ggT/tu+yH+s6lq1YGTZTIUJn8dr1gsBRy8=;
        b=f6awPquguVd7mGPX1qXiLtWqJXkElMXKsT9TJXd0iu+/bnoQkIW9v90jMTnLYFHWb+
         XtDALicH26bSPmsGZav122hPG8WG5/ha6LQW1g9i9oFyLZU0UWwtWJMRa6yuACPB1CNZ
         BBboWmSYT/smqvlzxb+R+SVHIJSmwpulmQeZc/6oUERnPN1ZE7/tUKYby73rlF3m5vAx
         vZzHuaEh6VxA1i+Bo3UPiOa67MFTxK2TRBV1IZvHaopD94uCfTDN/buLbw0RTdYs6Rrx
         kVxXwC7IPAtIkVRGfUAorGwvQtM3jmcRMZdp/ZG4Pe9Xzp1jU9PAI9/4iArgLT2Xqrit
         XONA==
X-Forwarded-Encrypted: i=1; AJvYcCXAblrYBGCtwh2rCrFbYF17X0cQsk8AevikGNvj+LBzto6Vtr8/j90iLeLX/sUFHxLvtSojIVIxdRp6sHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZM9Tcx3DAsz/NnacXw4Ar/4ErTx2OVwdbz8H9AT/7hBjCcGf2
	c/Z0Q0HPcGHdVw9h7TCkqPyrHAyLRIKLkQLrGpPpEL+rW6Y90NvRsgCMMrBtSkglqbw=
X-Gm-Gg: ASbGnctfwVPLDQ1XPbwtGCRnUAhgiRvSm/klFevj1wZGxybiy5OB2zqWW2m9xykwf16
	Qfe4C3dyt1ec0Mf9DdGmhCBKGie0Vrn38gOSL0E2lt2S1XrHbSxotxy/kb1mEZcufbsKzPZNSg0
	H88BIGSmP9z7fCTsR7OXAFaFRgXELLkF8YdYpabelGB7SF1O/r6bMrPrcmvEgobvpXE1AMQw6Rj
	YFbDVmqn421oUHi7XbuhSaa1ZkL845aTUgRjASelJVSOOH4p1IaJEn3JRmDseushgYxlWbnc63C
	9u04/DVwNRAoNojn7qEyPze9I+iFzXzAasBQOjPcgRfvn0tc4zGFw9Gn
X-Google-Smtp-Source: AGHT+IFQK93TMTE0Kgf4LsIvoEssGfm44/b8as+fTwEYo2CX0SMamB736DaZr8HWCAdSJh6AZQMbMA==
X-Received: by 2002:a05:6000:4313:b0:3a3:6a9a:5ebf with SMTP id ffacd0b85a97d-3a4f89a8a5emr9586734f8f.20.1748875800233;
        Mon, 02 Jun 2025 07:50:00 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c82csm15231679f8f.30.2025.06.02.07.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 07:49:59 -0700 (PDT)
Message-ID: <539bfd54-47cf-48e1-b627-635c7efc44a8@suse.com>
Date: Mon, 2 Jun 2025 17:49:58 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/32] x86/boot/e820: Make sure e820_search_gap() finds
 all gaps
To: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Kees Cook <keescook@chromium.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 David Woodhouse <dwmw@amazon.co.uk>
References: <20250515120549.2820541-1-mingo@kernel.org>
 <20250515120549.2820541-29-mingo@kernel.org>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20250515120549.2820541-29-mingo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/15/25 15:05, Ingo Molnar wrote:
> The current implementation of e820_search_gap() searches gaps
> in a reverse search from MAX_GAP_END back to 0, contrary to
> what its main comment claims:
> 
>      * Search for a gap in the E820 memory space from 0 to MAX_GAP_END (4GB).
> 
> But gaps can not only be beyond E820 RAM ranges, they can be below
> them as well. For example this function will not find the proper
> PCI gap for simplified memory map layouts that have a single RAM
> range that crosses the 4GB boundary.
> 
> Rework the function to have a proper forward search of
> E820 table entries.
> 
> This makes the code somewhat bigger:
> 
>     text       data        bss        dec        hex    filename
>     7613      44072          0      51685       c9e5    e820.o.before
>     7645      44072          0      51717       ca05    e820.o.after
> 
> but it now both implements what it claims to do, and is more
> straightforward to read.
> 
> ( This also allows 'idx' to be the regular u32 again, not an 'int'
>    underflowing to -1. )
> 
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: Arnd Bergmann <arnd@kernel.org>
> Cc: David Woodhouse <dwmw@amazon.co.uk>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   arch/x86/kernel/e820.c | 59 +++++++++++++++++++++++++++++++++++---------------
>   1 file changed, 41 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
> index 0d7e9794cd52..5260ce6ad466 100644
> --- a/arch/x86/kernel/e820.c
> +++ b/arch/x86/kernel/e820.c
> @@ -666,30 +666,52 @@ __init static void e820__update_table_kexec(void)
>    */
>   __init static int e820_search_gap(unsigned long *max_gap_start, unsigned long *max_gap_size)
>   {


Also it's not really searching for 'a gap' but rather it searched for a 
specific gap - one larger than the passed max_gap_size. So I wonder if 
find_gap would be a more apt name, given that you have a specific 
criterion you are searching against, the gap size. If you think I'm 
reading too much into it then it's fine to disregard this.


nit: Also this function ought to return boolean.

<snip>
