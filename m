Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC882066F7
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746446252; cv=none; b=GIua5pHT2Lwzl57zFKeR9DoCaZ+YRSkVZM2z2lqeGonN7RxaktA+NXzDkcGxluO4QSX7JVwt5fqmeNL6gsvdrdGU8G7vDX1s0JqcmMl5c9+sGtNgLiSMsptkaQESqdTcgcdzEoKurvvU4LQ3MyoEHotsq8g9b+7SA1GMdwiIGSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746446252; c=relaxed/simple;
	bh=qySfuoPl9wV07OnVIwdvGpKvtcyDus4i0vcs8YMKyZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O1MLRxrJsX3flUg7KJ9VS5PCLWJCnxAD19lLAN3nygGpMD+z0pG4ms6rggK6k46G7d6aSic9vGZRbOWB3We1rv4f7rVwycs7JyfV9vTss/b1WDqfKEiSlezjWsgPu13Isi7L1ntwtxHgcXVizb42N9N7nLRYDRXHXq1txvAoqSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=O7S0bVWS; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="O7S0bVWS"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so6372486a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 04:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746446249; x=1747051049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kMKaPde6OkE/AtVUsHGGgX212tPSCHNNuxA10fp7Sb0=;
        b=O7S0bVWS8cwnbONviLMaVDXCjDn0VnD9jXBhxRTbZcAttsAkOQ3BOdNYGR8wDl3UHi
         aCa8VsRTjfKdupB9IkKeBECkrk9KvQ0hXSU+0Z4EUooxZArSjez3dwVGFiVPY/ZIumow
         3G4oRRiP5B+mcuUDKkf9GVtEUg3eTA3303e/6HpZRYKHqRFFBTZ+sf+yGRfXRPNRiPh9
         VR2iDuwIVi+KDfJtPL90rLLcrqQlHdgW4a2Oj6wYWrvZgNP1c+pl4Wtz/K9Ts49AcH6I
         FauBby6+Oh99CQonL/4H1CyFFZpWOAXAotMQ6/kauZxZG4YR9TjVlO3TGwqm3iPYY4Hi
         VojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746446249; x=1747051049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kMKaPde6OkE/AtVUsHGGgX212tPSCHNNuxA10fp7Sb0=;
        b=CxK+qN6PKzqzM3TMNMjQ10MCraBzLPfgQLJw1kaDI3ZCKXFxAYujTtlzrtv0FgwXBp
         qqyzYd+jAMDI4h8G07z5nWDIGksT3t5L3ZPElpSdpFB1BPkpNksFur6AOCwXiTwIvUeC
         hWTgmvSftYJOWyktZ6QkikN8e21cxlpmXizKFUtFP2bRP1S5x1s5WESNvX3fNJx28+ri
         8YG0U69IO3aYJgWuMTzClcGYSGIXr8qMOmOYVbssRj51zabNXu6h/uYoK/wfvMrsdN2X
         yyQNlR4qzEfkP+IAv4hECa+1lc/OBwgyGH3xIODCu6tY8L0HZ9aFRVc6VSIMRNvROshA
         Bskg==
X-Forwarded-Encrypted: i=1; AJvYcCWacwl0mY7daARGRpqaGordXwxO/v3R32gC6B/mPxbx9rC1NCbcOpqQIRLuype4jL/9QhuRYHfkCJ9dpwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSQauNOJymxAtwfkUIn6DVanC4486ZnPWNKpf7lJUNChzIN3I+
	7xM+auIhlX9QM+jqwlwMmpVGH4k3FA74rijVo/ccnH8jzJ2TVCYAQwNCewqLS/4=
X-Gm-Gg: ASbGncsoK0rpyBY0drIhkq+YbrcLmh+qSlR2zJTrwIKt2DdtXic+Ux/FS6P0aTAmYf8
	k1w5VuxbzHGc5mK52+RhLPxioetrdGtO0GZT1j4MOFQ6GhT/qWcIZf/4ThCBelMSY/x1u1Qe9QI
	7g8zDwzWsx3ZFf2+QsYhn7ITVNoY1svTC179v+AfF55dYF/llzb7Td0BastILNyONvtaV+uPef3
	m+NQUnl3xEKGkvv9tW3x7iWXLO7KDR4nMv6wapy4dK5M+DLatDF6Lpi9fpB67vxnSmSXvTpw4T9
	AJYmGvk4LInMOUVgR0QcGMkD81HB2skzHtCoqtSCFZ4=
X-Google-Smtp-Source: AGHT+IFiyeoBtX6BSQ4FfqUekWlXlO5jzJ6Ey3HdmksDyNABdshCZwf6dxx6rks8EwQBNJy4ucHIFg==
X-Received: by 2002:a17:906:c115:b0:ac7:cfcb:c3e3 with SMTP id a640c23a62f3a-ad1a4acc6c3mr639033466b.45.1746446248779;
        Mon, 05 May 2025 04:57:28 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891478fasm482865566b.26.2025.05.05.04.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 04:57:28 -0700 (PDT)
Message-ID: <0aa0c9b8-2d6a-48e8-9a57-df2583f26d14@suse.com>
Date: Mon, 5 May 2025 13:57:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] gendwarfksyms: Add a kABI rule to override byte_size
 attributes
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@samsung.com>,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250430214049.2658716-6-samitolvanen@google.com>
 <20250430214049.2658716-8-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250430214049.2658716-8-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/30/25 23:40, Sami Tolvanen wrote:
> A data structure can be partially opaque to modules if its
> allocation is handled by the core kernel, and modules only need
> to access some of its members. In this situation, it's possible
> to append new members to the structure without breaking the ABI,
> as long as the layout for the original members remains unchanged.
> For example, consider the following struct:
> 
>   struct s {
>           unsigned long a;
>           void *p;
>   };
> 
> gendwarfksyms --stable --dump-dies produces the following type
> expansion:
> 
>   variable structure_type s {
>     member base_type long unsigned int byte_size(8) encoding(7) a
>       data_member_location(0) ,
>     member pointer_type {
>       base_type void
>     } byte_size(8) p data_member_location(8)
>   } byte_size(16)
> 
> To append new members, we can use the KABI_IGNORE() macro to
> hide them from gendwarfksyms --stable:
> 
>   struct s {
>           /* old members with unchanged layout */
>           unsigned long a;
>           void *p;
> 
>           /* new members not accessed by modules */
>           KABI_IGNORE(0, unsigned long n);
>   };
> 
> However, we can't hide the fact that adding new members changes
> the struct size, as seen in the updated type string:
> 
>   variable structure_type s {
>     member base_type long unsigned int byte_size(8) encoding(7) a
>       data_member_location(0) ,
>     member pointer_type {
>       base_type void
>     } byte_size(8) p data_member_location(8)
>   } byte_size(24)
> 
> In order to support this use case, add a kABI rule that makes it
> possible to override the byte_size attribute for types:
> 
>   /*
>    * struct s allocation is handled by the kernel, so
>    * appending new members without changing the original
>    * layout won't break the ABI.
>    */
>   KABI_BYTE_SIZE(s, 16);
> 
> This results in a type string that's unchanged from the original
> and therefore, won't change versions for symbols that reference
> the changed structure.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr
