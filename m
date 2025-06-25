Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B53267721
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750866160; cv=none; b=p+9rjKnYxE+Zb/cVtcSWFJQNeudVSdLgBFFcpV3ufzn3ku7c2aG+J7eswSfQN0ryzLIvOJfL6lcJf6UVFtqluScLtwZByjfYb1yzHrcTt0mlvZw1OhQkSlsoZHSGEFc/9lBS9VSum4X8U2ioKsCfob9wWjnP2qkqwkRbW06iq58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750866160; c=relaxed/simple;
	bh=k189GjQ/+6ewuw3rREvir1vGFkEF0RMAsoMbsA8wDYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Pga57/TYVOwKsVmoo1/sM19OUKry9Pq7r7c7JJGI14CdM8xmztoGbOU4RmRnvVWXYdV33EZ++MqfmD7nMS3icKniBOsMMkgR3WgIXUfj/xdn0QhBOnDIUmEZ54IVJzJ2LIegzP8J1N8sTxfIqbeq3t/gVR0bK1EEg1ewdvlLz0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BBObjZMV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BBObjZMV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750866155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=B3iqSsBsPp6drlWzu6Ws1a2bKJ4CuIocvt5EldyW6J0=;
	b=BBObjZMVMhk416WlNBW3SqxY7m+iDTyPLY/wjAKYMsZIGsp+lbxxjpaz1szL0W/CRm7HJN
	Dq1rmU/i+8FtapOWQRy4cAjkHUPvZawwqAuWRWT9dNepC7DVqmZRTLZFLEv9y5OEVR27OL
	24Msf58N0ysxRQDyZ+ZjytYnj9HSa5Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-muvMLEPeOgy7EAp7jytyQQ-1; Wed, 25 Jun 2025 11:42:34 -0400
X-MC-Unique: muvMLEPeOgy7EAp7jytyQQ-1
X-Mimecast-MFC-AGG-ID: muvMLEPeOgy7EAp7jytyQQ_1750866153
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45359bfe631so9794345e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750866153; x=1751470953;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3iqSsBsPp6drlWzu6Ws1a2bKJ4CuIocvt5EldyW6J0=;
        b=NqlRkb4iJW8s1VjSvqLwqzlzjQR0h8mCdfNdHjCPTOlbOaYUXFVq3p/sUO//dG5VHl
         c4ggoURDHieSaDlCk7Jo8MikqbGjSobfGe6wc8XNLPQkoApYTwBkxxfv/hQa9ywbqZsi
         LeDT9l5CPQx+ayL07gOFZmh2iok/Vp2/gsvXu3HyZ8UbpyaHe9p+TcNhQ4Dp0bXeRpet
         C31HkKOiILTjzDJACThMxHTlnC0tO+McU5AO59nSbXn2fvKOS+KYdDTCdIasWN1caVMx
         PhAghFXRhXjXbNl+2Rh3UsDcKSNCGjpkPr6PJddVmjgqNGs0ukc6y+xgmwydiSXhNCuX
         qLPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTdlSLz0FSmQQXCR3Xkrbb9JJ7qaM2tQeYC/Y2KAv9rCi2KwL3vp2HuIpu+uYWSD9LYbooqroTSQkkcK8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yylt1UzXYMN15Pk17rug7Nma6Hu0LkXsTdJt5nEzJUFWL0erZq7
	6OObQ0sjRltbzVq9/t4OodvurIvrIeALADckdkv5XmaK5+SKtMobdFLqojiaMVBefXlwsJ8V8r/
	g12/VsRILIP3VHUggwbB/CtjvcXNT7/BhFAjAXbOGSCnxzVQ4rvyPiQUUAQFUqoxBAA==
X-Gm-Gg: ASbGncvIxP9dkY5E29brYzKAgxseOz8kvVdHyuFfxuW/oJg3jhyVFhtHsYqLneu4SBG
	vwhJpTXvRdr3cDFM8pgYZQAEy7xGozGe7EJnHpBB2XCYa5BzDKUolZ86u1JI756ifK852FygyOA
	enc4fbM5qkyx57sdElEc1yHZHUDHsSoJ0lilmtFbb7E7EQQhybdTiTBw0UohMniEZ2FkfQFqet9
	51tSAW2G89rpHRfkMcr8GURLZkWFEbTy/XfUE47yho/dAMhiQWhv4XTyUArXXeBWcg8+22xjnwr
	fgryxvtqZdDQdTIIe+FJilF8z2Y3i6I+0aztgs0enWQ/tj+kbA0G4yx4wOd18PGLr/NuDwBCZNV
	k+ZaqGFNbXNciJ8yC+oMkVDHvrc6ROl3joJF7g2M+g4el
X-Received: by 2002:a05:600c:a07:b0:453:6424:48a2 with SMTP id 5b1f17b1804b1-45381ab0482mr38563885e9.10.1750866152839;
        Wed, 25 Jun 2025 08:42:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHR5g2IxgPUMS2neGXiPrv1p0KYziAZ5jgdrYuhuFvBuEr6gtBPRkqPB6PBShAzdaU2h5xwmA==
X-Received: by 2002:a05:600c:a07:b0:453:6424:48a2 with SMTP id 5b1f17b1804b1-45381ab0482mr38563665e9.10.1750866152437;
        Wed, 25 Jun 2025 08:42:32 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f2526sm1970526f8f.52.2025.06.25.08.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 08:42:31 -0700 (PDT)
Message-ID: <bff12005-4957-417a-a54f-2a5a327720f2@redhat.com>
Date: Wed, 25 Jun 2025 17:42:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix do_pages_stat to use compat_uptr_t
To: Christoph Berg <myon@debian.org>,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 "open list:MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION"
 <linux-mm@kvack.org>, open list <linux-kernel@vger.kernel.org>
References: <aFrBhyHQFffJ4xgX@msg.df7cb.de>
 <d42cc185-b774-4d5e-9a51-0581dd5f3962@arm.com>
 <aFwUnu7ObizycCZ8@msg.df7cb.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aFwUnu7ObizycCZ8@msg.df7cb.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.06.25 17:24, Christoph Berg wrote:

Subject should start with "mm/migrate:"

> For arrays with more than 16 entries, the old code would incorrectly
> advance the pages pointer by 16 words instead of 16 compat_uptr_t.
> 
> Signed-off-by: Christoph Berg <myon@debian.org>
> Suggested-by: Bertrand Drouvot <bertranddrouvot.pg@gmail.com>

Likely we want a

Fixes:

and then this is probably "Reported-by:" paired with a "Closes:" link
to any such report.

But I'm wondering how long this has already been like that. :)

> ---
>   mm/migrate.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 8cf0f9c9599..542c81ec3ed 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -2444,7 +2444,13 @@ static int do_pages_stat(struct mm_struct *mm, unsigned long nr_pages,
>   		if (copy_to_user(status, chunk_status, chunk_nr * sizeof(*status)))
>   			break;
>   
> -		pages += chunk_nr;
> +		if (in_compat_syscall()) {
> +			compat_uptr_t __user *pages32 = (compat_uptr_t __user *)pages;
> +
> +			pages32 += chunk_nr;
> +			pages = (const void __user * __user *) pages32;
> +		} else
> +			pages += chunk_nr;
>   		status += chunk_nr;
>   		nr_pages -= chunk_nr;
>   	}

Something a bit more elegant might be:

diff --git a/mm/migrate.c b/mm/migrate.c
index ea8c74d996592..fc99448771041 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2398,6 +2398,7 @@ static void do_pages_stat_array(struct mm_struct *mm, unsigned long nr_pages,
  
  static int get_compat_pages_array(const void __user *chunk_pages[],
                                   const void __user * __user *pages,
+                                 unsigned long chunk_offs,
                                   unsigned long chunk_nr)
  {
         compat_uptr_t __user *pages32 = (compat_uptr_t __user *)pages;
@@ -2405,7 +2406,7 @@ static int get_compat_pages_array(const void __user *chunk_pages[],
         int i;
  
         for (i = 0; i < chunk_nr; i++) {
-               if (get_user(p, pages32 + i))
+               if (get_user(p, pages32 + i + chunk_offs))
                         return -EFAULT;
                 chunk_pages[i] = compat_ptr(p);
         }
@@ -2424,13 +2425,14 @@ static int do_pages_stat(struct mm_struct *mm, unsigned long nr_pages,
  #define DO_PAGES_STAT_CHUNK_NR 16UL
         const void __user *chunk_pages[DO_PAGES_STAT_CHUNK_NR];
         int chunk_status[DO_PAGES_STAT_CHUNK_NR];
+       unsigned long chunk_offs = 0;
  
         while (nr_pages) {
                 unsigned long chunk_nr = min(nr_pages, DO_PAGES_STAT_CHUNK_NR);
  
                 if (in_compat_syscall()) {
                         if (get_compat_pages_array(chunk_pages, pages,
-                                                  chunk_nr))
+                                                  chunk_offs, chunk_nr))
                                 break;
                 } else {
                         if (copy_from_user(chunk_pages, pages,
@@ -2440,11 +2442,11 @@ static int do_pages_stat(struct mm_struct *mm, unsigned long nr_pages,
  
                 do_pages_stat_array(mm, chunk_nr, chunk_pages, chunk_status);
  
-               if (copy_to_user(status, chunk_status, chunk_nr * sizeof(*status)))
+               if (copy_to_user(status + chunk_offs, chunk_status,
+                                chunk_nr * sizeof(*status)))
                         break;
  
-               pages += chunk_nr;
-               status += chunk_nr;
+               chunk_offs += chunk_nr;
                 nr_pages -= chunk_nr;
         }
         return nr_pages ? -EFAULT : 0;

(untested, of course)


-- 
Cheers,

David / dhildenb

