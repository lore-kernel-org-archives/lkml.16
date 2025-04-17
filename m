Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5841DE4FC
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744867800; cv=none; b=neu150SSAmlz8IrMeh61KwA5G4580BmvcVUrimfruxWReQPzYCAs9QQ7aT/u8hs5yxMwWG2awg5pvtSWnM0eP651esPmc8rOpozmXBpHvEgIhrK/u8RyztkZRuyr74JnLjynal2DFhvwaMGq5/Oq7lGN/ybSYtbsPoRIXBRVuO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744867800; c=relaxed/simple;
	bh=TEUTdEEXTmy8ALJVhENgaSqDviDpkYjUlBkULiXDmpY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TZ1gxEQfvOCJGd6BynnivfklozZ5Qe+ZNqIRgDEnf1HaMnQJKstQz8ysfRcpZq9vLbX2YH8mDOQ4ZX5cxXfDZTpgdbq+5ANMffnk+9z6iU3z7YMZNMbYSdV64u/gROq1QVEg9r894lVBYMtmxmxxSH0W3ce67OXbZI3Ee+/KA4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t4QUFk4Z; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t4QUFk4Z"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso446552b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744867798; x=1745472598; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K2/0NuQSzNOebXOyA98ZePT7hD/9RuG1jjaeZ69P3hY=;
        b=t4QUFk4ZS3g5ItE+QDoKTJSz2it5OBo1++YQyi3DJ7BjfTS8ml1Vv8N2hzYlkxXB5g
         CR+ipxjoDgYFm2edpJGs4ZN2aq6K6Ll21rqp4kyrLSqhTdn0KCIkK5iI4pa7al3RRV5q
         BpKY9hH5vMUuWbY2CoSRGYVEsjcEMVHuw9YXJFO5oo/oclv+ueAXIhO3wiuB81KJIyvk
         Ecy2KKpKiZnt60PRJADrrTdC5khTJABmiBfhL/Qfy/JQTaUwQVIX/W7Acq7fZXVgUaYg
         nDmwOLue+LmasxfQhLkBYGYQBWVJfqgIvX7gUBS9V70Ao0Ajp5a5+NLbb0mRbCXZtT6n
         O3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744867798; x=1745472598;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K2/0NuQSzNOebXOyA98ZePT7hD/9RuG1jjaeZ69P3hY=;
        b=Eq7cw+hd+23sWXezT8rJEDyOPr0TPvuFF5PwUvaQoqzGiBMYDuG95hk4Nc+vuQd8e0
         2ITmjkkB13mW1xprNZiNo8aDn7WgFRJc0krlE1yB4Q9h+RJ31mCgjeA83TkXxy9CE6Dl
         I2NCfYLMdtco8aCNxJWa+9gUpDdhHyARJ3nTtDGXsH7UW0Up4HAxkQs3nROpqJFYD30+
         KeG8H0ERFrYNgPrlE+uUyNbv8Xq04z/o6uqwvLz4e7MjLoTV+RS6ovaDysfU8HkgXKqP
         IBRKaDavAngfMIoywWCusTT5uJSfFkpzT6KLJ1Ov4TAonzBO0ERVW7bx1cu1qNSzbJJK
         lVIw==
X-Forwarded-Encrypted: i=1; AJvYcCWFFo3wjcb9cH3lInVBxdw+CdCScDs5wpWtrNEX6zlsgRlBnx20XI1QNq2y/NI4rmRnvdOZPNtYllWnvGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ2Hagvs0yUx23+YBM0a8JVIV+AegbDKtatpV3L7el98jFWNfT
	EHJWdYDh7aBHDpP8FSTTiTIQxh1bwxdEVMPPSitMm5alz7c3XXdDcuYBp2bdcw==
X-Gm-Gg: ASbGncuTv8f2vDt4LZNYmHNovPAIcyZpNQmZB+nkK61sv2guK9+vb2DPkhk8IN+QiSO
	cJVOWMJfVUizOkjrsMX8REjR3r4Osaw+kS3i5T+M9kRI51kOfESRKP8TyeOtr20kpDRtaLG834G
	TzFmSjNdrJQoPX7wCvJPq7088CRxESELekibAbcIRcb+1riV2l4IK2j1Tw4PelNHjaIsTitpbEr
	7Af3QTVs1BQcCa8VbREOjdAvz80aT57ux3rAzLsz5WV11XbV0y4QBgvWSpzQRi5wfl2aV4qBdNc
	oZCc3hFh98zNqQgGB6rTswR/nnir3ZijEaC6cTWwOlq9CmgDG28PK9AmmU4Fs2AslqCJ3lINMII
	3w5LEJl9VJVojjuq53cbCOKqc
X-Google-Smtp-Source: AGHT+IEqPmJ2V0Q5TenmE86WICH2IRs1S6rt1lUDyy3mX17Qt4m9speStiJo+O/DmW1SnrqjigDtJw==
X-Received: by 2002:a05:6a00:180f:b0:736:6d4d:ffa6 with SMTP id d2e1a72fcca58-73c267e1deamr6189297b3a.15.1744867798384;
        Wed, 16 Apr 2025 22:29:58 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230e32dsm11452046b3a.150.2025.04.16.22.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 22:29:57 -0700 (PDT)
Date: Wed, 16 Apr 2025 22:29:56 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Zi Yan <ziy@nvidia.com>
cc: Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org, 
    akpm@linux-foundation.org, willy@infradead.org, linmiaohe@huawei.com, 
    hughd@google.com, revest@google.com, david@redhat.com, 
    kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
    Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
Subject: Re: [PATCH] mm/huge_memory: fix dereferencing invalid pmd migration
 entry
In-Reply-To: <C055C822-0CE9-4455-9849-7242F31515EB@nvidia.com>
Message-ID: <95e543dd-6b93-9507-d383-1ae91e2e6640@google.com>
References: <20250414072737.1698513-1-gavinguo@igalia.com> <A049A15F-1287-4943-8EE4-833CEEC4F988@nvidia.com> <83629774-981b-44cb-a106-d549f1a43db9@igalia.com> <C055C822-0CE9-4455-9849-7242F31515EB@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Apr 2025, Zi Yan wrote:
> 
> Anyway, we need to figure out why both THP migration and deferred_split_scan()
> hold the THP lock first, which sounds impossible to me. Or some other execution
> interleaving is happening.

I think perhaps you're missing that an anon_vma lookup points to a
location which may contain the folio of interest, but might instead
contain another folio: and weeding out those other folios is precisely
what the "folio != pmd_folio((*pmd)" check (and the "risk of replacing
the wrong folio" comment a few lines above it) is for.

The "BUG: unable to handle page fault" comes about because that other
folio might actually be being migrated at this time, so we encounter
a PMD migration entry instead of a valid PMD entry.  But if it's the
folio we're looking for, our folio lock excludes a racing migration,
so it would never be a PMD migration entry for our folio.

Hugh
