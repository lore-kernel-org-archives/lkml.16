Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA108299529
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 21:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746047332; cv=none; b=IiZDvwvXSxHOlwv+yyoJAfGjHdBzKk1NJS8E0xjKV/GXxJhIHNovX8MZA7QNyNia69VRfLKaIOikc/rsIC5goq7hzw3inyb5JPrshdqRgdf/EIdGDqsuIO56xjUg8uWqwB8fFosqY3uJ+JAP2tF4HDe1Hfm2hzDn8LJpSAlcsGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746047332; c=relaxed/simple;
	bh=djpEQyCHfl49AqXNde2dVSelRlJvQDi/2boy0o/34YE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V4PmtuIhka3F6pb29pZ5NdUNQeEO/ymbFuxLuKsPABJNFl8XXIlfPsTe7QzJChY0WRnaGZFfy0fCtJg0j9BMNapOSDlyohUCRiPgVbGP5gzz/hkzsi7p0dQqyzBZlQd+P3aWo4QywHrXhsypaOnhqLo2wcYYlKuk90BnzyljCEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N9c5HTEq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N9c5HTEq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746047329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zivfWyNlrPG9L8bV6ILZM8QQWLlmYfH2OI8xtHwsDYA=;
	b=N9c5HTEqtEznulmY2v1sf0IEMbtWdT4MdCyVdYUwHt2i0FiYiiRD98ScictM+pXCV9sQlh
	GUlbmIE5V0TDEpQVr6A3bRDHEulaCmzWeF34BTQASsmPs9+VpU3GapSImg/KyVpFOWuBDL
	vCUanx+dju1hX+LtwOUzhHgVpMEM0Vc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-4oZmB8FOMw-8Z6AUlPSIWg-1; Wed, 30 Apr 2025 17:08:48 -0400
X-MC-Unique: 4oZmB8FOMw-8Z6AUlPSIWg-1
X-Mimecast-MFC-AGG-ID: 4oZmB8FOMw-8Z6AUlPSIWg_1746047327
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43eed325461so1091545e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746047327; x=1746652127;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zivfWyNlrPG9L8bV6ILZM8QQWLlmYfH2OI8xtHwsDYA=;
        b=nBtHO1nUl0VtfcMTvfNY0WmqN9OeVrjBvVrXEcxiKCsswiw7kL7D0QWwJ/sgys/8K0
         5GpUMu7KxZ7XZu5Eblox7AjwAeINWw1V9YXXXc2LLUkjMP+mUX+QtyBWkvzvcTI1kG5D
         c3r3OLKk/BC04SH55XBSkxGQm/55sXw6ztcAnEzf/g0FeMN15SKmhgz5So7QYj1YoqMi
         vd8G3T0BHq1/qr7wtBblZQsk+7F9w0QbUoqgg9CbfTDEGgKkKAIltW14fGmwQISu45WC
         yuA7/75Qt+/3XennphGyAk4zitSf0p7mn7nAHHK79pEGarMap7qzirYEV1KpLnzo674J
         Kv3g==
X-Forwarded-Encrypted: i=1; AJvYcCUBM3bA5sHMyGROxTUBN8mgaKgrGaiCV9wWl+l+YEYu9TeOiScbby7EHdJp3Qh5r0mjmYF66Qi3bPTM3Tc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbGyOEqeJVkhab67AYmqTWTFpAKswQCalZJhe4LrWZT6SQT5yM
	rutMEFhlHruWLQn6vgmO9SuDocDnha3uWWsh5Pv/EsNN/krQH3z+0T7BaxtoZ3P54B9deZ7V3q8
	6P/GBsufgL8YBQj0nyAdkEkyyuv4A7VS77PDNfnTIuPSdEAHGGc9FvByO3MnHwA==
X-Gm-Gg: ASbGnctmAeqQeBsuH9sR9wbKFoOQEq9gSNK63YueeJZUuvFMendscjm7bM+x7xQqmph
	+pFZFjeyP3qfa/1uvsVHvnaNxvAMXzb+Dv1y7Fbi3LMRsjbSno93Gt/SRgRFOarNWhm9xcXP5OX
	eDRL4t81DcwixmdGl94frvSeQOpTXJ9aQwQ1yvJ0wO1CE4ZWtqpg996cvF7uIk7bN54f+ancqGj
	xTv/vGscKg9SEoAg4k/d9Ct4yG15PTZQqQTFW7Bzi+nlcpVq7iKatgDY6O6HROQ9ZXlEz9+3B6D
	B4VmJWVs5VfEsLrTeX43Yih70x3P2LAlOs80IDvbkQf0R4mKOG4BmdTfLkV4qdF+ztswts9oHY0
	iAoIdrxuukiM5YdgeWbfaf/3lIYO/vXnSnfZ2Wps=
X-Received: by 2002:a05:600c:348f:b0:43d:53c:1ad6 with SMTP id 5b1f17b1804b1-441b268b895mr33349915e9.26.1746047326794;
        Wed, 30 Apr 2025 14:08:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2f0+HkEz4Uo33Hw3JPFkBBMMlgPMy0LoULhoOPwOo2pF6os8H6HmYyJy1+xhQYEFMMEFIlg==
X-Received: by 2002:a05:600c:348f:b0:43d:53c:1ad6 with SMTP id 5b1f17b1804b1-441b268b895mr33349775e9.26.1746047326420;
        Wed, 30 Apr 2025 14:08:46 -0700 (PDT)
Received: from ?IPV6:2003:cb:c745:a500:7f54:d66b:cf40:8ee9? (p200300cbc745a5007f54d66bcf408ee9.dip0.t-ipconnect.de. [2003:cb:c745:a500:7f54:d66b:cf40:8ee9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b28718sm37053035e9.36.2025.04.30.14.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 14:08:46 -0700 (PDT)
Message-ID: <16140962-0a11-4674-8799-a83a13e2aaad@redhat.com>
Date: Wed, 30 Apr 2025 23:08:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] f2fs: drop usage of folio_index
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>,
 Chris Li <chrisl@kernel.org>, Yosry Ahmed <yosryahmed@google.com>,
 "Huang, Ying" <ying.huang@linux.alibaba.com>, Nhat Pham <nphamcs@gmail.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-kernel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250430181052.55698-1-ryncsn@gmail.com>
 <20250430181052.55698-4-ryncsn@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250430181052.55698-4-ryncsn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.04.25 20:10, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> folio_index is only needed for mixed usage of page cache and swap
> cache, for pure page cache usage, the caller can just use
> folio->index instead.
> 
> It can't be a swap cache folio here.  Swap mapping may only call into fs
> through `swap_rw` but f2fs does not use that method for swap.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> Cc: Jaegeuk Kim <jaegeuk@kernel.org> (maintainer:F2FS FILE SYSTEM)
> Cc: Chao Yu <chao@kernel.org> (maintainer:F2FS FILE SYSTEM)
> Cc: linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM)
> Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

