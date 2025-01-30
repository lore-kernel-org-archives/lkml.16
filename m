Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1EFC2FB
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 07:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738222394; cv=none; b=Q1SBtY5JLaOPlNW303/s0upEc+QCJT0r7yQJVghQWO6F2aK26QPAEdanVuu5HHiChTo7Q5NNUq9RPnsQ+z+xwjnNKdFMtbopczbMQ1yAk6a9Kt2ZgN2F3oK3iJpod1Fzj0lNBHu9wDfw4alWPHka10s41RGZclK59feI3afu1b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738222394; c=relaxed/simple;
	bh=1fowZ9KXYCBdJgkV7K9T6CXDCAJHWY5gHPO2bk3Qsl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btTK/54fhBcU+v1m0WSZ4F1rSEVspmznvzdIYl0mg8Y3hZ2IeZG0g0yagdyPhiKvX9ZipD1VNB5tjrBBBcSv2wedGnHSUmj3M03VgcXkwTbUm1Gs8y88vyzEABu2Ahsx+NDRzfG/8RwFhrfmrNW6rdFlBTKK0dR6Hyh/zLz48p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ahmdGzq8; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ahmdGzq8"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-215740b7fb8so93645ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 23:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738222392; x=1738827192; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DLCh+tatBBGoG+KXA63+7xQMMZDdLguhv+Isvay7xM0=;
        b=ahmdGzq8WpHcWt3y7i5tBQrtqs+LL4DsfYdmkMJdQs+sFluHxf8ExOcTWgPb2yhhyp
         UOR/BmFv9ryKT0qnDRE6+bfBHy2MW/4DBKLZpAuFFlwbIAIDrMJYLIgjSsnuGvoLCM9X
         evcyXWwmdMKLa8Wd8/w7+5CIqI/5PVoeUaDKXVn4zzellH4e21A5d2GN0UjVHBCva8MA
         t32bD3W6Rf6K7OTAGcEVUWeRIm5UL0orxDReFgGV0tEOkbkEUsJCsVo3Uc/ys6clLYGW
         CsKdVdj0PFsfLYDGaxMNxiJjHHOSGQOfjTkPFyBkB2FPje25SZQWJL9TDsr+lsCvdXSd
         3yQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738222392; x=1738827192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DLCh+tatBBGoG+KXA63+7xQMMZDdLguhv+Isvay7xM0=;
        b=cFOQ7hQsUg5UTTew33tIyQ6s+RsQqNqbdMRs8RX9h0mVIctJ2STPDMGk7OU0PwOLzO
         aBaVgRjQkSaGVd3+L9TzHAO8tD7Kle+BvpKH/FDnV1iNSeNdOFmgraiD/Jbh/gDtaY4X
         2QiaXqKNBqqb+yorhuqe3vJw4FdlSEd1NYriPJpv7UtI3AJ7VrjKb2jXSGSK2cDO/gCY
         I6JA2vlAzwpV5uNw3GxjhEnyKWeqDgPmgH2z3cCNRayhnQCD5ZTiQ2XPurwL0pkHJg82
         9mVsvDAsEQCZwIXZGkskF0TIGWJ58ZZ/fuD77PX+7CCNHm7PEoF9/8EXUMxlM0Rrx1FN
         Ykgw==
X-Forwarded-Encrypted: i=1; AJvYcCVPFJcplw1DHuIYWl1iH8WZqZroXlfTtStFVqq8GlnEOYBtXib7tEYl4K/w1TSj89wUuk97DjJGPqWftW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIGz3Xnj94mZoVgXTWvpuwVIEeP2HpQJ0SmC8qote8ZXJFMA3W
	dheOxMRouZ2rMHHDuEE00vXPV1pvi8OicQiB7GVhe13jk+s9r3c8aHaQTOs3Iw==
X-Gm-Gg: ASbGncvra1FDwQNLJwP1Cq2TnRAqWtrVAnM6h0AQoger/Ms1tjVgiutqLWIRji9RAoe
	7t+ZVVlMdE0HAV8zKPnM6VI3kN5Pf/xrw4Q48Nlnh4PRAO01A7qYpANXrVPE0JXilZKHD48W5Iq
	lAVjPoIabLkw75SGRVSDrz1NFFrcFEYSORhIoT51Z8SIwavsqRwAs1G0gLHRzfy/tzDXU4FCz9m
	oTxGDcaBnr9iUBEfFGBP5OYn7yTG76mM1ghGdT5u04EydvP9Wwt7Q0zajKr86NIMyzEobqoepP/
	GKQkoh4AmR6q/GgrzsKQMmbFkAFoU9LrbcRS8YFPALvk5T5nX48=
X-Google-Smtp-Source: AGHT+IGtAQyWP4E3jsq2fUXxPPBesuF/fheiJwtNQUCgGQWBzEClyXLLlz+nAdz/kOBuE6N6Xda0bw==
X-Received: by 2002:a17:902:740c:b0:21d:dd8f:6e09 with SMTP id d9443c01a7336-21de36189ecmr1296665ad.1.1738222392075;
        Wed, 29 Jan 2025 23:33:12 -0800 (PST)
Received: from google.com (55.131.16.34.bc.googleusercontent.com. [34.16.131.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de33000e0sm7571625ad.167.2025.01.29.23.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 23:33:11 -0800 (PST)
Date: Thu, 30 Jan 2025 07:33:07 +0000
From: Peilin Ye <yepeilin@google.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf <bpf@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	bpf@ietf.org, Xu Kuohai <xukuohai@huaweicloud.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	David Vernet <void@manifault.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Quentin Monnet <qmo@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>,
	Neel Natu <neelnatu@google.com>,
	Benjamin Segall <bsegall@google.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Yingchi Long <longyingchi24s@ict.ac.cn>
Subject: Re: [PATCH bpf-next v1 8/8] bpf, docs: Update instruction-set.rst
 for load-acquire and store-release instructions
Message-ID: <Z5srM--fdH_JAgYT@google.com>
References: <cover.1737763916.git.yepeilin@google.com>
 <e2072e24a6773b346f2a71c80b6a28d5b98e6194.1737763916.git.yepeilin@google.com>
 <CAADnVQ+hi3918DUyA7bs4Va9NdNqXJg-R4A45n_MHGTikYaOSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQ+hi3918DUyA7bs4Va9NdNqXJg-R4A45n_MHGTikYaOSA@mail.gmail.com>

+Cc: Yingchi Long

On Wed, Jan 29, 2025 at 04:44:02PM -0800, Alexei Starovoitov wrote:
> On Fri, Jan 24, 2025 at 6:19 PM Peilin Ye <yepeilin@google.com> wrote:
> > +Atomic load and store operations
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +To encode an atomic load or store operation, the lowest 8 bits of the 'imm'
> > +field are divided as follows::
> > +
> > +  +-+-+-+-+-+-+-+-+
> > +  | type  | order |
> > +  +-+-+-+-+-+-+-+-+
> > +
> > +**type**
> > +  The operation type is one of:
> > +
> > +.. table:: Atomic load and store operation types
> > +
> > +  ============  =====  ============
> > +  type          value  description
> > +  ============  =====  ============
> > +  ATOMIC_LOAD   0x1    atomic load
> > +  ATOMIC_STORE  0x2    atomic store
> > +  ============  =====  ============
> > +
> > +**order**
> > +  The memory order is one of:
> > +
> > +.. table:: Memory orders
> > +
> > +  =======  =====  =======================
> > +  order    value  description
> > +  =======  =====  =======================
> > +  RELAXED  0x0    relaxed
> > +  ACQUIRE  0x1    acquire
> > +  RELEASE  0x2    release
> > +  ACQ_REL  0x3    acquire and release
> > +  SEQ_CST  0x4    sequentially consistent
> > +  =======  =====  =======================
> 
> I understand that this is inspired by C,
> but what are the chances this will map meaningfully to hw?
> What JITs suppose to do with all other combinations ?

For context, those memorder flags were added after a discussion about
the SEQ_CST case on GitHub [1].

Do you anticipate we'll ever need BPF atomic seq_cst load/store
instructions?

If yes, I think we either:

  (a) add more flags to imm<4-7>: maybe LOAD_SEQ_CST (0x3) and
      STORE_SEQ_CST (0x6); need to skip OR (0x4) and AND (0x5) used by
      RMW atomics
  (b) specify memorder in imm<0-3>

I chose (b) for fewer "What would be a good numerical value so that RMW
atomics won't need to use it in imm<4-7>?" questions to answer.

If we're having dedicated fields for memorder, I think it's better to
define all possible values once and for all, just so that e.g. 0x2 will
always mean RELEASE in a memorder field.  Initially I defined all six of
them [2], then Yonghong suggested dropping CONSUME [3].

[1] https://github.com/llvm/llvm-project/pull/108636#discussion_r1817555681
[2] https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2023/n4950.pdf#page=1817
[3] https://github.com/llvm/llvm-project/pull/108636#discussion_r1819380536

Thanks,
Peilin Ye

