Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63658199E9D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 12:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749301087; cv=none; b=hbni4bWQmjUtJtsIpeACRzTtGScDIV/lSeyi/OesEEq0DtDl8AreeGt8iZzjDGTMAm5TQk8gvotiFSuiSmhiDBfFATTjp7YYq58mhERNxKmUIs6caW0y7NbDFKVUjMHw9TxByvmnp0euDcfhIEYjfEoRve9Log7yPZX1rI7cT2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749301087; c=relaxed/simple;
	bh=V4cryWcS+Nj3c10ZcXrTgRlQMw2t7rBwE5/Fuk6/am0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iKCknXQZvUd46+5lJw0W7YId0AWjetmN1bgp0C+adSzDe1LvkJEdovjr9mjgXXt2VJE5slLS3ZjE7D6xDOFCZlGlbv7HIY/NtnjPwoXLQOyOCnCAtz83ya0C5DTgMEpIYSXZFa6y/UNzmXN8y4+Qa+DiDUAV4cgUUOaGqPO88bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dr5fNeFO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dr5fNeFO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749301085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nUlpd1tc6ViQoEOVd98R/NTIIePNhea6XdH/630s6S4=;
	b=Dr5fNeFOe3/FV84z6D/Y3p1fhuvB7T4cEx7+txR2kdhqxH4ln1/FqLfOwvJTMpVCphaLRV
	u1BVIi55JMSBgAR4vzLn7emjgZeomQS0+yCAyjFP9K9bk4SO6tqTC2Hivkzcw+TunCt/Mt
	+z5xRGob/9/1wk1XEpp08dr/KwKgisg=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-0Wt5SV03PYup0o4YZogTEg-1; Sat, 07 Jun 2025 08:58:03 -0400
X-MC-Unique: 0Wt5SV03PYup0o4YZogTEg-1
X-Mimecast-MFC-AGG-ID: 0Wt5SV03PYup0o4YZogTEg_1749301083
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7071dd5df15so43058527b3.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 05:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749301083; x=1749905883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUlpd1tc6ViQoEOVd98R/NTIIePNhea6XdH/630s6S4=;
        b=t06/TAA7eAGIo02ZAoWgc/ThurlYp4A7qbeQiSc9SHEuEFGFO7u7ehNkcgvEqbKExQ
         scQLPEPOYdsGrulx7rn8fhzNNhubqk3XIEmVZpaGeJdDO1pXdhOAxfPKBfOBo66IqoOg
         k0yC0tuq/LGcHjm62zKfFcuhwpt8zuGEs4Cc083PKotgSvCPgdGKK6jr5VdGCc5LBw/2
         bLpdN4kKmfb8cCbkpq0bstJIYYYzXR3BM4YnJs9D4A2qwX5bU6glxxwUnfQsSPjMKwJb
         baOI57BrYBoZKSjg8WdJK9cQnuTBQpeTHFc3lzc6OWEweGoLZNPOIVlljGqxLLNhkiJo
         qm3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJs4euLUtQUzpeYYS0TwI6VW90QEwmbXortdFUQEEqGR7K1AXhsinzxoVgUWN32nJSA8o+kaCpkW8E998=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDBwCfw6q5w0bjNdQfjznR3GxiY93X2smPClAHJHvgFWOTxAII
	HK59rY6VWcf3bYbHlDFgNeVWDWe5Zgv3SB8VaWM+yby19+zYYCjUaA2HKf4D7NQJLOzwHPzRACK
	eIWN1B31jpezjXq+qS3FpZfIdvNMX0GH5PvARuzl/MNCCXJEWwG+2DruR01Q+bib9sb2pwUvkcq
	1Cj2B6BTc3czK5gCvfzGJJv+TeJtxh+KQw7QnipxqE
X-Gm-Gg: ASbGncsgM9E+Hxk3pUqX8XT3PRwScm9C+5R87b8UtYl1F1CdXO2afj2lpeML/dz+x9a
	WvKPVgMkZlaa6RTwmeJE3htrnUZMYL+N7Z6EWvwXXmFPzmUu5u2+oQpy7GeGZhjoJiJGIwpY8ss
	rodPxnmA==
X-Received: by 2002:a05:690c:64ca:b0:703:b3b8:1ca1 with SMTP id 00721157ae682-710f762d3d7mr95493837b3.5.1749301083322;
        Sat, 07 Jun 2025 05:58:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzPMOgCNk3VE9SsfKXmuZM+nB+7y+ADlZL68LpA3zUBsqHZyGJebHmJUwK+oL+gqMhq7Kjom+gmPFEsKAmSD0=
X-Received: by 2002:a05:690c:64ca:b0:703:b3b8:1ca1 with SMTP id
 00721157ae682-710f762d3d7mr95493637b3.5.1749301083000; Sat, 07 Jun 2025
 05:58:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515032226.128900-1-npache@redhat.com> <20250515032226.128900-13-npache@redhat.com>
 <bc8f72f3-01d9-43db-a632-1f4b9a1d5276@arm.com>
In-Reply-To: <bc8f72f3-01d9-43db-a632-1f4b9a1d5276@arm.com>
From: Nico Pache <npache@redhat.com>
Date: Sat, 7 Jun 2025 06:57:36 -0600
X-Gm-Features: AX0GCFt-sIirhVY_s3fqNEN_w8JX_uHJd6OXJSEG9XOqi8-7-ivm0tpji4jWrKU
Message-ID: <CAA1CXcDOEdJRvZMu2Fyy4wsdy8k8nj4c45s4JanO9HzyJgyXOw@mail.gmail.com>
Subject: Re: [PATCH v7 12/12] Documentation: mm: update the admin guide for
 mTHP collapse
To: Dev Jain <dev.jain@arm.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	david@redhat.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, ryan.roberts@arm.com, 
	corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, baohua@kernel.org, 
	willy@infradead.org, peterx@redhat.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org, 
	Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 7, 2025 at 12:45=E2=80=AFAM Dev Jain <dev.jain@arm.com> wrote:
>
>
> On 15/05/25 8:52 am, Nico Pache wrote:
>
> Now that we can collapse to mTHPs lets update the admin guide to
> reflect these changes and provide proper guidence on how to utilize it.
>
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Signed-off-by: Nico Pache <npache@redhat.com>
> ---
>  Documentation/admin-guide/mm/transhuge.rst | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/a=
dmin-guide/mm/transhuge.rst
> index dff8d5985f0f..5c63fe51b3ad 100644
> --- a/Documentation/admin-guide/mm/transhuge.rst
> +++ b/Documentation/admin-guide/mm/transhuge.rst
>
>
> We need to modify/remove the following paragraph:
>
> khugepaged currently only searches for opportunities to collapse to
> PMD-sized THP and no attempt is made to collapse to other THP
> sizes.
On this version this is currently still true, but once I add Baolin's
patch it will not be true. Thanks for the reminder :)

-- Nico

