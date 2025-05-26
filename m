Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209551DFE12
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 12:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748263180; cv=none; b=BYQqWhy5yrAU9e3eKF3HqLoqhHJFzsAqIKLGRCTuSmPffSiRx+HOdP7o8YmIUp1rqEBKVOPSo5J3ByUMM+w8HZEXOb2uBfRNaoZGOX/tJHcJQ+WIVCCu/WipgpgHQWkzyvNOHSziPPJmclVSPngfR0TNlMaaBbKuqfjGFlIgAZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748263180; c=relaxed/simple;
	bh=HwWjoyW0FLcKWJAW8HxTn/3hfoUkUOGOBDjOXlkO1Hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hLBzwBFDkN1nQoUeEXyj2akzoEdw4Op/wSfjrij8MpZjpwcp7jtC8Oxp55cnwHP2glRps3ffJUTYU5a0m3psUqwGwGDHco0K8ILE5BKnaxf0gnWas0M+V7rTXqJ93N8Vp/LAQT1teQrSHhoNBwunRhR/QFiKJaXIYSSsyUk+Pwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J3QFMR/X; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J3QFMR/X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748263177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=f+MJ+rD4wu541gsfva4/MFHxHhJlGS+dtYhFcOT6l88=;
	b=J3QFMR/Xtx/FBOobewBePLcPB53+Y/4rDDbMLX63vaWv6KOaDdsDECooLqn5l0STaYSxTR
	IML+bp5n4dQv6NMAE3KTGD9v2bNhH2MSV82A8XUuz6asdtT89IDlt3YeA1w08cn47BP0jl
	U0e1kJYu+3htlmvBBQ/TUTg+AcngzHU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-XF5BucsYMCWyT_pKmwqcnA-1; Mon, 26 May 2025 08:39:35 -0400
X-MC-Unique: XF5BucsYMCWyT_pKmwqcnA-1
X-Mimecast-MFC-AGG-ID: XF5BucsYMCWyT_pKmwqcnA_1748263174
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a362939f61so593206f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 05:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748263174; x=1748867974;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f+MJ+rD4wu541gsfva4/MFHxHhJlGS+dtYhFcOT6l88=;
        b=baE5EB76z0VyTCIszbIijHBVCm/WRoeRKrGm/TBgm0KhDiYOApAFxU/Papg8d1AO7k
         2zdtgaErzSNsymgV0HhM5oc2+q5tHglHtCavmZmTKdjOnfMEfkdm9CPDpsryvu4UiiVd
         cGbKFCQ5PlIlT6B27+WlvsDRZtTPqwzz6YSwHk0nD6jYYao4EUZBux2Q2qo0Kz871MgS
         9cvQFELob3DEktt3BDLaEvqKtt41Ab7ZWIRsaApyjAXZOp3UgmpTMAt22kWBgo7vmj7w
         9HFgXn4PlGcWAzsoa+4LGvrKcho9JNt/IlVUiIeJGATv1+t0MZ0RL5WqXGVcnuH8Abab
         S8aA==
X-Forwarded-Encrypted: i=1; AJvYcCUIaCXnXBU/i4YdIXjZ0plHXNdGwiZkLPCgCAesaAemOivz0/ViVSyUDs+0oYgdep1P3La6L0wRBhuF8Gc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw55Qq7FGPd1UHdyTQYzN/yPyWF6jRTLyv4VYDkrZQZ6lu28Ycx
	VoelS6d5B0mL2WtOh4T2Cd1KhQkUk/YDoEZsaPV3XrW8Be34KU/yqwF8rgEEeZ6hIbIvdz6SMv1
	xqRzZJDaHMwEjKp3rsfGvwEa3vU2ANol05RhbUzuYOL7ExHb1VZL6MoDWBLDl9Ve/ww==
X-Gm-Gg: ASbGncvsXYioatCYBKd/sosaCZ6BAsAt1q6KfwZJBexkdM53977tP2otUPy48o1nbcS
	OSi77CObbkGGmpMfFaMa791lU434gEge0KV9B/uTYv33MKlvk/4Qf1Hu54xwaNtv0XWsOsfuD6V
	RD6BQnnRWOwLPZ2ZubejXxiW5soD0L5IIZQ/+yTh8GhNDlmfhW6Sk4OcmQMy4cYZC5GrPdbKdF3
	CrGS5rzk0ohD+1hIPaO+q7ZxPwr/JtNRw/DRuc3ngEcF1uayPOFYj2qnhfXj9RTDGNoybvVozsr
	i50nVxv1i6L3j43UqOuMrTtcUIbuebbfBxVC6PAazPXE5kBftYu2RGq1ftsCDNmlphV+yF7M5zt
	YodPj3q023ks1gHTMvh746qhX+/xd5TFiMer61D8=
X-Received: by 2002:a05:6000:40cf:b0:3a1:fc6d:971c with SMTP id ffacd0b85a97d-3a4cb46d689mr7142470f8f.21.1748263174395;
        Mon, 26 May 2025 05:39:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1po2j4G0EELTJLR9OfyHDXwqrHi2hqTZt/UpJrGsdNEjYSlXMb4yTeqcWOg0KCEOMbZAJSA==
X-Received: by 2002:a05:6000:40cf:b0:3a1:fc6d:971c with SMTP id ffacd0b85a97d-3a4cb46d689mr7142443f8f.21.1748263173991;
        Mon, 26 May 2025 05:39:33 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:6500:e1c1:8216:4c25:efe4? (p200300d82f196500e1c182164c25efe4.dip0.t-ipconnect.de. [2003:d8:2f19:6500:e1c1:8216:4c25:efe4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4c868745esm8880176f8f.30.2025.05.26.05.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 05:39:33 -0700 (PDT)
Message-ID: <5abe8b0c-2354-4107-9004-ccf86cf90d25@redhat.com>
Date: Mon, 26 May 2025 14:39:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG]userfaultfd_move fails to move a folio when swap-in occurs
 concurrently with swap-out
To: Barry Song <21cnbao@gmail.com>, Peter Xu <peterx@redhat.com>,
 Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra
 <lokeshgidra@google.com>, Andrea Arcangeli <aarcange@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-MM <linux-mm@kvack.org>,
 Kairui Song <ryncsn@gmail.com>, LKML <linux-kernel@vger.kernel.org>
References: <CAGsJ_4zMNaNjRXbtDD6xYfDhckcDCnTvv+4-yB1xpuYcur=fyw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAGsJ_4zMNaNjRXbtDD6xYfDhckcDCnTvv+4-yB1xpuYcur=fyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.05.25 01:23, Barry Song wrote:
> Hi All,

Hi!

> 
> I'm encountering another bug that can be easily reproduced using the small
> program below[1], which performs swap-out and swap-in in parallel.
> 
> The issue occurs when a folio is being swapped out while it is accessed
> concurrently. In this case, do_swap_page() handles the access. However,
> because the folio is under writeback, do_swap_page() completely removes
> its exclusive attribute.
> 
> do_swap_page:
>                 } else if (exclusive && folio_test_writeback(folio) &&
>                            data_race(si->flags & SWP_STABLE_WRITES)) {
>                          ...
>                          exclusive = false;
> 
> As a result, userfaultfd_move() will return -EBUSY, even though the
> folio is not shared and is in fact exclusively owned.
> 
>                          folio = vm_normal_folio(src_vma, src_addr,
> orig_src_pte);
>                          if (!folio || !PageAnonExclusive(&folio->page)) {
>                                  spin_unlock(src_ptl);
> +                               pr_err("%s %d folio:%lx exclusive:%d
> swapcache:%d\n",
> +                                       __func__, __LINE__, folio,
> PageAnonExclusive(&folio->page),
> +                                       folio_test_swapcache(folio));
>                                  err = -EBUSY;
>                                  goto out;
>                          }
> 
> I understand that shared folios should not be moved. However, in this
> case, the folio is not shared, yet its exclusive flag is not set.
> 
> Therefore, I believe PageAnonExclusive is not a reliable indicator of
> whether a folio is truly exclusive to a process.

It is. The flag *not* being set is not a reliable indicator whether it 
is really shared. ;)

The reason why we have this PAE workaround (dropping the flag) in place 
is because the page must not be written to (SWP_STABLE_WRITES). CoW 
reuse is not possible.

uffd moving that page -- and in that same process setting it writable, 
see move_present_pte()->pte_mkwrite() -- would be very bad.

> 
> The kernel log output is shown below:
> [   23.009516] move_pages_pte 1285 folio:fffffdffc01bba40 exclusive:0
> swapcache:1
> 
> I'm still struggling to find a real fix; it seems quite challenging.

PAE tells you that you can immediately write to that page without going 
through CoW. However, here, CoW is required.

> Please let me know if you have any ideas. In any case It seems
> userspace should fall back to userfaultfd_copy.

We could try detecting whether the page is now exclusive, to reset PAE. 
That will only be possible after writeback completed, so it adds 
complexity without being able to move the page in all cases (during 
writeback).

Letting userspace deal with that in these rate scenarios is 
significantly easier.

-- 
Cheers,

David / dhildenb

