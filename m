Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDE01F4CA0
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 13:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748266429; cv=none; b=moNp4mpFjVlpvd04od62gxJ+9a5L/VdHwW3AQ/8ye2fOGqAdTHEmwLUPjn8i7+jctCdvRoG0omLmF9sLpwG50CB8yW4EOKTeEiwD1XaA8wkY04+dbgZ0rwLeMV2hol8pRHS4z3zcp3fH8qkegBMLImZ1hnWs37njv2aMcyDW2S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748266429; c=relaxed/simple;
	bh=A8fmznURX1n8UuX8vAiXaHe8kQPHukzK0ZrRJHSw/tQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f2Ti5fqtR/ZsUViwIAkpBaw3x0DS6GqvGNrk1ilITn7fR79fnck8xdwrH3wevNs8BPPQhfTsupMMXn3aXo0lllKxM+xiiYaORf+clYLEtUH9N5wZmV4sXwoFThRjm/coaHY+F7h1gii0AqvJ/GCPCTqxxN74kCs3V5kzn5/Cg0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K1VU1xrd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K1VU1xrd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748266426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=e/ZbNKbmzdOuA2BE8qqB2oEd5yfh65ElK8U26s2nr6c=;
	b=K1VU1xrdXO3Ik6ykOlBW4KTdTmXFUBu8THXSW1bKcLD4W+SilDclrY0UCsFLyw7PMbFjqB
	wFMjcdSPcOYfn/MTWkgkX4U8ghlIhjfGclIbUXP0Da6CCcCGaTAnrT7xk5GErYxbh3TeqQ
	WNiLLargkWkXFOwZ9rYZj21rII57Fx8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-uvvbWtuRPYWHSl9sbpGgRQ-1; Mon, 26 May 2025 09:33:45 -0400
X-MC-Unique: uvvbWtuRPYWHSl9sbpGgRQ-1
X-Mimecast-MFC-AGG-ID: uvvbWtuRPYWHSl9sbpGgRQ_1748266424
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-442ffaa7dbeso16850445e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 06:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748266424; x=1748871224;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e/ZbNKbmzdOuA2BE8qqB2oEd5yfh65ElK8U26s2nr6c=;
        b=hI/T9glgpxJfNr4y6I7H4QbMFKy8jdwiCj83tG3t+F5oKfXhsM9/0qUchP1GFqdTzm
         prr7DsEg1e0t+m6weM6L8TcUZvYirq42MSKImsuFwGGz/HTSzlGN21VkoFwDdsQS6Sy9
         PAFrztLvKhq4yDcSVDizfwctHlcdsWa6LpUd4lHmjpvmrz5ACOomHHCc7srr33uad/h0
         fE8SSR4bpdM7IDCcjiPVTCn2ZLC+2NhlbHGoqLpIqiFqeVUcOaBWsiPMEaDt92vnTzYs
         vnMk4WZqtbkzk/T/uchWvMUZPnLQrrp/apwkDGiuXj7e0YlMhAOHyf6WKrJmbtd0dSxD
         bwSg==
X-Forwarded-Encrypted: i=1; AJvYcCVPJYGeecptekxjhfjcLQrSrdu8H+IM7zU2d0ibXFTXjgDCu5wZhCHxncLFuis6sSvN7HIcZ42Yc4Ibm90=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBvdVKlGmZYnN9z2tkbLxlmnSoWc6Ggg2x+BKpEzxuXDV/k+Mo
	fXSiLizopolF8j+GCA3vlJFj0Oi8nDQnWgF8nicoGGxaJH5A/zydz3dcKZM3y/LuAGV5MP93Yq8
	cTaCEpLlwezUVrPSpb7zrFvHQ4TsJZxEgJvG0ZpHp/LDKJvyl9N/8KKxDez5GMo4tTA==
X-Gm-Gg: ASbGnctajsrtUczXk3jASCuXRJW1exDITcqAZjO/xShxvmxe7m2AL1bNRzGvPmMTKE7
	T1jKWB13EdfVJ7LV1RKqueb33kgKuAItGUz8ZMKiw9jZsP97bzxiflAnUGzvSCscRUKpARBte6C
	LKX7g7xIY2ojosmQLjsOou+zc0ku292EW4OmQV5CZQzL54mTtLxiUJRAs4E4G0uKldPf7hU5KF5
	MRQUN+FEq2auQcqclpHErLIkSBCpryhhG3TKgMY5EIHPYkSqsHIB8U4e03/iu1cnfjCTfPtPXCA
	IoRcn2GKEkIoHknNhj6GVlexXO1Bjmf8/iSKyWRAhudF3gmuPWEDsSkneZkyOROlFU+jEc6+SIq
	ArZw3L48fMQKnhPRxI6ZISVMHOFYN/DRSvYN8+mY=
X-Received: by 2002:a05:6000:4203:b0:3a3:632d:4ca1 with SMTP id ffacd0b85a97d-3a4cb453e4amr6362423f8f.17.1748266424240;
        Mon, 26 May 2025 06:33:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IED5IeJ6U8tyXx4ffH33iUWwnBgWaOkIRxwlpRHvEokrL3ixLv7g/M9YBuKj7Dr8oahZCxLuQ==
X-Received: by 2002:a05:6000:4203:b0:3a3:632d:4ca1 with SMTP id ffacd0b85a97d-3a4cb453e4amr6362398f8f.17.1748266423821;
        Mon, 26 May 2025 06:33:43 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:6500:e1c1:8216:4c25:efe4? (p200300d82f196500e1c182164c25efe4.dip0.t-ipconnect.de. [2003:d8:2f19:6500:e1c1:8216:4c25:efe4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d15523a9sm5779598f8f.72.2025.05.26.06.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 06:33:43 -0700 (PDT)
Message-ID: <5a7b6fa0-db23-4973-8ee4-bd82a4306dba@redhat.com>
Date: Mon, 26 May 2025 15:33:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] mm: prevent KSM from completely breaking VMA
 merging
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Stefan Roesch <shr@devkernel.io>
References: <cover.1747844463.git.lorenzo.stoakes@oracle.com>
 <6057647abfceb672fa932ad7fb1b5b69bdab0fc7.1747844463.git.lorenzo.stoakes@oracle.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <6057647abfceb672fa932ad7fb1b5b69bdab0fc7.1747844463.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.05.25 20:20, Lorenzo Stoakes wrote:
> If a user wishes to enable KSM mergeability for an entire process and all
> fork/exec'd processes that come after it, they use the prctl()
> PR_SET_MEMORY_MERGE operation.
> 
> This defaults all newly mapped VMAs to have the VM_MERGEABLE VMA flag set
> (in order to indicate they are KSM mergeable), as well as setting this flag
> for all existing VMAs.
> 
> However it also entirely and completely breaks VMA merging for the process
> and all forked (and fork/exec'd) processes.
> 
> This is because when a new mapping is proposed, the flags specified will
> never have VM_MERGEABLE set. However all adjacent VMAs will already have
> VM_MERGEABLE set, rendering VMAs unmergeable by default.
> 
> To work around this, we try to set the VM_MERGEABLE flag prior to
> attempting a merge. In the case of brk() this can always be done.
> 
> However on mmap() things are more complicated - while KSM is not supported
> for file-backed mappings, it is supported for MAP_PRIVATE file-backed
> mappings.
> 
> And these mappings may have deprecated .mmap() callbacks specified which
> could, in theory, adjust flags and thus KSM eligiblity.
> 
> This is unlikely to cause an issue on merge, as any adjacent file-backed
> mappings would already have the same post-.mmap() callback attributes, and
> thus would naturally not be merged.
> 
> But for the purposes of establishing a VMA as KSM-eligible (as well as
> initially scanning the VMA), this is potentially very problematic.
> 
> So we check to determine whether this at all possible. If not, we set
> VM_MERGEABLE prior to the merge attempt on mmap(), otherwise we retain the
> previous behaviour.
> 
> When .mmap_prepare() is more widely used, we can remove this precaution.
> 
> While this doesn't quite cover all cases, it covers a great many (all
> anonymous memory, for instance), meaning we should already see a
> significant improvement in VMA mergeability.
> 
> Since, when it comes to file-backed mappings (other than shmem) we are
> really only interested in MAP_PRIVATE mappings which have an available anon
> page by default. Therefore, the VM_SPECIAL restriction makes less sense for
> KSM.
> 
> In a future series we therefore intend to remove this limitation, which
> ought to simplify this implementation. However it makes sense to defer
> doing so until a later stage so we can first address this mergeability
> issue.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Fixes: d7597f59d1d3 ("mm: add new api to enable ksm per process") # please no backport!
> Reviewed-by: Chengming Zhou <chengming.zhou@linux.dev>


Acked-by: David Hildenbrand <david@redhat.com>


-- 
Cheers,

David / dhildenb

