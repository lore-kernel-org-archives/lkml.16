Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3C61B4F2C
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747036539; cv=none; b=d1p2VDTF1xpNDQiwOV340eE4Mc8dlozoSgTc5uNZT2vBOBUVSFS/08/eY8nHRZXlF0L1TfblnQ43cq8cHmWjuCiJjfjdpxx7G0QLBGSLGAnGW1q/Cq64HNVYMOl89RWlZqNR6mJveWonbLb5iCKnAavNjAT2RaSpTqGz6YmPegQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747036539; c=relaxed/simple;
	bh=fJUgR/HLPO8JTzFAGV7CY/CYAAOXd9eka4BQQxF7ZXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJNOMMzQ8k6FB51kfFHDQfX58uMm/O40eOKn2elpPe5X+DKDoPlliZ/QH8WVch4JnJsoS8st4WY8iCgh1vBw68h+NOgFQQjwf5H9/QGmTAoK+yuunVmznKOlSKZQhwrhDJ6oLEKfNh7/2K8zwThCwrP8cdk8FocKO4OeNhMyY8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BAfku5qV; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BAfku5qV"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad2440926adso207718966b.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 00:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747036535; x=1747641335; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JOp5HvPXRqWLEWDc84tE16c57ZRsArDaDk9r+zf7A7M=;
        b=BAfku5qVwobApjASLco57SmOlDotKSgCsJUeWbKykXk9IEZa4FziFFsI4rhMbHa81t
         F7BM0eeo4gGS972J0wMT9zQ/UtBabujAOfC+c4wmLgOZZKTno6q0uFpTUoUwNZ0eXZe6
         o50q36o+xm0KTVTIr6lgHsiqJdtpve6cxPzAhs/wljRRq7v1a2iV77CjwDI7ZF0bqXJv
         MNbZpIVwsXeABEAhYXj4QY4x3Vj3KQ8E4sbLll+BE+iklRZaLIRf7gW5c8qdJw0TFrq3
         WJFvZ+c1Hyl5sGq5RrRz94RimvkEmH0vM7555LEHGaD5kFrq7bDLUqYNsDMC0Roa2F/o
         r4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747036535; x=1747641335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOp5HvPXRqWLEWDc84tE16c57ZRsArDaDk9r+zf7A7M=;
        b=uPAA9IQ4kZIDVl3/Nz/o4qxtWOTOF3TRIgr8kK322P82kvxWL/u8eV0MHVfNUkQilC
         7J7ifv//MyUuE9r9bUFB8RlhRJPg9eU7x2Q2B0xBNS8t380b3UMtlpggT3uw3rs8Uv5e
         Suoh6hOVtpc6+jVqQGCodbi7+Sxe4+0eYqRxRRR7MRoMmxcrX6+9Vt8ifMbAeY6yFzVj
         SIHTe13gYTbO7Zd8b5V2U6zpKeUgsFgJjE9LkMgXVBflZN32NSWe6jSWq2TccpIZgofh
         r9skNPCl3A8WLSdHmCDgGkjqPBo5v8LNGOlwxSYFq2FyjaR8di2Jg0Xy62REwWi8lxsI
         w4lA==
X-Forwarded-Encrypted: i=1; AJvYcCUM+pgCJUiS4efqLtfS34ZTuHSCmGZ9kOIKO5c7/qarB+XDj/HVWt7ZFCf96ogY4ikfShQWYn9s8euYSTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvUXeIt+1Z5u5EP1yuJEYixTwIUAQ4eA0bunUE5PC+mZquexVc
	EdIzPArA9GR6MLuD9inaArCAA9gWozHamdG+3OLT3+/nFuiKZZoKfc2XBE3reu8=
X-Gm-Gg: ASbGncuLSs0VkkbqyhvN+k2PkqOaAtm3B0yJG6rzkpi32p/Y7w1BOIqEOwOevB03nUN
	FyRKaaFSMc3TqCZ5XhCnS/VNMcjfR/TDoRYfMwIVFS20UIzKOJ6zugUC3ikZtcd0pi47LYGrw0D
	qbN/jxP3TT+E1uLb3zokMEjMywbmK67JOgz/tj0EDbSB+ZLjFFpF+sE685MJaTxbSdfEZLFPtOz
	q49V+lLL7xOo22IfbzW5KwJb31b59NhjoM8pbOjsyvueXneNV7Eiw5boLlNpev16I7kxVRESNEG
	Py/tZ+GZdLSBHOqYyQSueH4HE4chcAT/cJpqmygbhUWVRo+E9ns2nEHIqA1xOMlv
X-Google-Smtp-Source: AGHT+IFvoDlinLNh3mDfJ+hepM4FmTJpo2xjwMxO9D3tZ//HeBDx+B1skyuS2ATpup+T2haCVi/tYw==
X-Received: by 2002:a17:907:8749:b0:ad2:d13:3c4d with SMTP id a640c23a62f3a-ad218e36fa5mr1110787566b.1.1747036535387;
        Mon, 12 May 2025 00:55:35 -0700 (PDT)
Received: from localhost (109-81-86-251.rct.o2.cz. [109.81.86.251])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad21934d4d0sm577088366b.73.2025.05.12.00.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 00:55:35 -0700 (PDT)
Date: Mon, 12 May 2025 09:55:34 +0200
From: Michal Hocko <mhocko@suse.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH] MAINTAINERS: add kernel/fork.c to relevant sections
Message-ID: <aCGpdr_6GXqmRNaU@tiehlicka>
References: <20250508152825.151889-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508152825.151889-1-lorenzo.stoakes@oracle.com>

On Thu 08-05-25 16:28:25, Lorenzo Stoakes wrote:
> Currently kernel/fork.c both contains absolutely key logic relating to a
> number of kernel subsystems and also has absolutely no assignment in
> MAINTAINERS.
> 
> Correct this by placing this file in relevant sections - mm core, exec,
> scheduler and pidfd so people know who to contact when making changes here.
> 
> scripts/get_maintainers.pl can perfectly well handle a file being in
> multiple sections, so this functions correctly.
> 
> Intent is that we keep putting changes to kernel/fork.c through Andrew's
> tree.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Acked-by: Michal Hocko <mhocko@suse.com>
Thanks!
-- 
Michal Hocko
SUSE Labs
