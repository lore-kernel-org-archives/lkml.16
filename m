Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F1A101DE
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 21:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748123290; cv=none; b=WQk3FQCMbo9BNKuwxdQFL5RTSguKPz3ufApTiAsgeoI+3aMhVUulrBaMxsc/3oTIUTBotNrfT+w9PqNSp7HXvxEXE4hh7VbqZsBThsXE7U4bkDWrXgwdXTd2ql9YSpeJxaggmyKydotFBoRb91YySBPGndS2ii/VvOyqbg0Z70s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748123290; c=relaxed/simple;
	bh=I6FxPXazGEzkzRC/RtofabQVJhiiEdkVWKblQhydB9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VYfsZ2puFod45kDGo/hhGWNiW3HCyRAbQc08/BQhowEYzXTNgrA8Tx5enBjBkkuQw0kUz2fQxtXHhxzvgE94/mInW2r1KGOZUeyRPsJlr4RTBmKm5WLVo3xQIZ4NQYT5yWMRtmO15keLiNxrITuabWlH7YLpR6Nl7TF4N7W3jUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=etBlUJpm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="etBlUJpm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748123288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=w2rWzS+AsuB1F3ghmFsRObn9HTI/ZiLDh2V5adXL99k=;
	b=etBlUJpmWAOrGzxiNgrAiRdr9PygZLqWSj3szzuFiSf1L+/TmvruZHuF4MCMAPDAXWDnHp
	e5Qei/HDgEzulldS4qiDxlT/ts3CuFtR7zgHmVhcwQS+AZ2CzGoySlRq3rSAz1rU/UWo6I
	BDElUZJ6NwliplIdYsI0yPptLrQZrYQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-oGLZP08wM0q-xGB1any-bQ-1; Sat, 24 May 2025 17:48:06 -0400
X-MC-Unique: oGLZP08wM0q-xGB1any-bQ-1
X-Mimecast-MFC-AGG-ID: oGLZP08wM0q-xGB1any-bQ_1748123285
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a35989e5b2so715404f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 14:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748123285; x=1748728085;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w2rWzS+AsuB1F3ghmFsRObn9HTI/ZiLDh2V5adXL99k=;
        b=cYuu/H9ag8HL4MbGwZOpnDgPlgednBL2Uwfaryey8YQkhFMArOaZDzPYsb+eo80L+a
         YjOxJJC+8hSd/t7sKihj+hwZAYTd+ojg3D8Oq1/EMIjXTaYvLu8a2lQ5JkE3WFTOukRf
         xcBon7a/drC5d+3KHDNBGupH5SUmXBm6gjqtybgOaODAFa8V/S4NILd4399a992PlJ8x
         E+aBDKFgz85qu2KHaxk0ZqJNrheMAOltiuxUC2V2p31nv0XKBqBEwiUZ2LyvkLwVJzJ+
         1/DHWr1CkRg/m1zQ1rY6V9T2mdLASVXsY2m02qFqkgPOLpkM2fIPwm9hNJsyf0jdDetz
         h4Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVMNWLrSvNyMYIh8ZXzHFheS7cJXuZCk78LwRtGtkty/fT3i3dgDesMuIenL+It/7R5UFx024Xs7fpUnZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfjTKEdt3tl26vjLIWPS/hkOoqv3TncN15i/9u0hrOKm+i9HaZ
	qGPW+cAVshnVpztTwPc7YMYlrPbPlV3jJOElUMkqHsDLmuLE6lUhvN0dFO+kQeucsHr4el4bOql
	08HPeMHyJJkbZegdtTj2eLQFAphDtp2vVYZXOdTLFTFWs64SOCr2F5uwwhBDbPtd3nQ==
X-Gm-Gg: ASbGncv6wlrV3pWL6elSkdypVxeooQv+AWPGC5XZHMCC+3iuVjxUbKz4FeQPwWKUadx
	nJI8dNmgYzBMATmHYj13T1VuptMVeL4wVxKPp3NkV/Iu0fnNL9GVDqp3r7FzG94Mkpe5ZcDTcxw
	l2dqtTCFxXcngwYhqmd4zWvdx1kCwEu7NVgwML4dRGQo005+NCJbz9kPyv7Xog2MSS7qlqa8ef5
	8u3UpibpC4M8Q2ZlMEaGgYIgJJPWDTNDMrvXABI63ddCr6yKKIYvWxwNJpq3CibdKGN8VOSXVzY
	fbdyHWqH9Cq8oUeD14yZPItdCgvfbBvpcKiYfmiTuy//48Ds0C9scdv9bmUJZ2+Unq2Mv8V2pdL
	yQRoVJy7EF80dbY+QdFPWJ2l0k+x+0dYtiwHWKnk=
X-Received: by 2002:a05:6000:2281:b0:3a3:73dd:92c7 with SMTP id ffacd0b85a97d-3a4cb4613fcmr2690387f8f.4.1748123285386;
        Sat, 24 May 2025 14:48:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeglW2LJADKwUjYH86RDbbHLscEbEcy50DpGg57dr9bAGB70VYMaoCw8dPnWiK6HZbBwFpaQ==
X-Received: by 2002:a05:6000:2281:b0:3a3:73dd:92c7 with SMTP id ffacd0b85a97d-3a4cb4613fcmr2690368f8f.4.1748123285033;
        Sat, 24 May 2025 14:48:05 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f38:b600:7d6d:5e38:70ec:12c6? (p200300d82f38b6007d6d5e3870ec12c6.dip0.t-ipconnect.de. [2003:d8:2f38:b600:7d6d:5e38:70ec:12c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d4a3csm193343385e9.22.2025.05.24.14.48.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 May 2025 14:48:03 -0700 (PDT)
Message-ID: <5815d9ed-e59f-4129-b20b-a0c07a2cf874@redhat.com>
Date: Sat, 24 May 2025 23:48:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] mm/khugepaged: fix race with folio split/free
 using temporary reference
To: Shivank Garg <shivankg@amd.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, fengwei.yin@intel.com,
 bharata@amd.com, syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
References: <20250523091432.17588-1-shivankg@amd.com>
 <20250523091432.17588-2-shivankg@amd.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250523091432.17588-2-shivankg@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.05.25 11:14, Shivank Garg wrote:
> hpage_collapse_scan_file() calls folio_expected_ref_count(), which in turn
> calls folio_mapcount(). folio_mapcount() checks folio_test_large() before
> proceeding to folio_large_mapcount(), but there is a race window where the
> folio may get split/freed between these checks, triggering:
> 
>    VM_WARN_ON_FOLIO(!folio_test_large(folio), folio)
> 
> Take a temporary reference to the folio in hpage_collapse_scan_file().
> This stabilizes the folio during refcount check and prevents incorrect
> large folio detection due to concurrent split/free.
> 
> Fixes: 05c5323b2a34 ("mm: track mapcount of large folios in single value")
> Reported-by: syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6828470d.a70a0220.38f255.000c.GAE@google.com
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> ---
> V1: https://lore.kernel.org/linux-mm/20250522093452.6379-1-shivankg@amd.com
> ---

Assuming we have this as patch #1:

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

