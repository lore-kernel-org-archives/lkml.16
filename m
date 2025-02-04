Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5302421323A
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 18:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738692864; cv=none; b=A3f/oJ8UzwjKORRD8gZt2YUC09q1TxNvYF05Y4ozwXZ2Ac5skBBmn7FFXNpD2Osl/0zc6CO087d1JXwVfjv+Qi2FPHctkhKXVz3UmSoi6Db8hgkGvx0oB7CSNnIoPBAIq+LCQhaKbNIuzXNGMzxC14lrB6uko0qZRQutFBshecg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738692864; c=relaxed/simple;
	bh=hnCyUxNPspxILeKTH+nIkMmS/BlUT3xra+gnnJkUAR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kwtVy6zQsu0FHcb7QfPHslwGCrhVCEmzGr922/FqesB5cFlHQTTAQFZw+05W7kdJiE7ZbjHj++Q/7KmXDXp5Uh0BNtgMVGtQ/tG7fbsUu0us+hY6mLuQ1iD7TVPqSo8I02U29CjfzUHlgD4yZV8dyHQs+MdXGxO/SPedqOGzhbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L7rEHWNU; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L7rEHWNU"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-467896541e1so352681cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 10:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738692862; x=1739297662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NT8D/ASvroySCOIUqc+sWLUBAVfNqfn5SXuV0Op8oME=;
        b=L7rEHWNUGBDtrC9JzFnxjxMH6sXCTLuxVZFMRYb2G4X9XtN1RSB4qz4FgXTu/kVe9B
         0asDAPPIoUQ/G/ERe+MsXslxeW1M+jTPfuiQejJWNdZrzivMiLYNUPtAquVxZ+x9CfWg
         NwF2GeGth+b99DvYP67x7zR8d7ynLEZP1Q76o/9rhZ5x1CeuFxvMZoB1v8VJS83vudLb
         x2qS7cfUhLKqr0zvc9s6dpcrV9/hXRn89gqwRRmGcJimACNTHb4ADqBZfHj+icJQla2i
         9xAQHRU4gk6ylPtl8nk8umjG952AI9rjx+xWirj8ejHy8sw5Gop5bbNq6dQo0HcefMsq
         bvww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738692862; x=1739297662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NT8D/ASvroySCOIUqc+sWLUBAVfNqfn5SXuV0Op8oME=;
        b=lrR8ZExkt4Xh62Kcw82Hb5bKQcwiINFssOt7ZuRtFhuNdftF/e6qG+F6Q+ThixaFH+
         nrbOHUVM+BMkfGXsH7CWjCPeF7Ty146zUsuALNg81mNYKp01jo/96kGghBacXbtT9vbI
         e0ZOKyc98Dbid7rH+p0Q3OLPOUfibtLFhb2E8SOMEEtXhaxjHyCFzO4AFPAv3q9RT8r+
         mhwvVdGzOHOglCX7J4VUgg4ep6h/LHKTg8PcY5G7Yva+UIi35Y3K4/BoRXdN2ox5IejQ
         i7w6yFg2ozaBnqFkjtkfHod9sbWCKcF2V8j700/BdQS77lZiSR3fs8JzSLm5va6fSmlD
         pYlA==
X-Forwarded-Encrypted: i=1; AJvYcCU/peRe44cIUnE3THs5qbKcwleqprOrmzhWcDRnjI+8iWL3KDH5cpizXi7ZUx71vb/fgcfTS293xfua+Ok=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtT2sv8vbyU7b/267Qipc0HoSMhnZZ9/6iaK+DFbpQUiw5rsAa
	8Z6vuo3KIRTW/6HYA2jq5fbYI/sYSppkTOHhgxLfk6+3nIaFh2LhFFq3iM9N9d2Gfw7uGdMPGuE
	Cf1vNpt6J1EooGb/ZS6lmfjGXPlKf2z55saID
X-Gm-Gg: ASbGncutYaZM1Ka1qYak3sApYW0HyW85Yqe26N80GPgnu5UzF3EIZ/4fybuPz0GoY/z
	nDyPtwnfWeJnOXxsKnC1FEfk0uxmWCpVqCIMkUCdeObE0eyhOWywNHPNqjfBW7gf+nBXNSgpWL+
	U2r7Q+a07cYMx5JvcknPKjbFS1gq0=
X-Google-Smtp-Source: AGHT+IEa8EF3C+YHh8oZA7uFjt7+K2oPsJl2Mr0RZipOfR+N7UZXzleg+vqdkoHPNT/b3Uym/WPIFDlXOM7/ddZ2/GQ=
X-Received: by 2002:ac8:58c2:0:b0:465:c590:ed18 with SMTP id
 d75a77b69052e-4701ab47861mr3818331cf.9.1738692861900; Tue, 04 Feb 2025
 10:14:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201231803.2661189-1-surenb@google.com> <20250201231803.2661189-3-surenb@google.com>
 <uz6j7wba2gk2wfn6foxs7v3wqdi5kwqnbolcdp3g7kzkw53a56@t7cyo3nyp2oa>
In-Reply-To: <uz6j7wba2gk2wfn6foxs7v3wqdi5kwqnbolcdp3g7kzkw53a56@t7cyo3nyp2oa>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 4 Feb 2025 10:14:10 -0800
X-Gm-Features: AWEUYZlMAX96jgJPDOCW65ebrkqnWSx56hEvpAm8q11zGEvqTSZ7NeWFSDeqdLs
Message-ID: <CAJuCfpF8qyEA9sfh9-kkiNdPVCJegD7affA3HJeUtgTeqxW-aQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] alloc_tag: uninline code gated by
 mem_alloc_profiling_key in page allocator
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, vbabka@suse.cz, 
	rostedt@goodmis.org, peterz@infradead.org, yuzhao@google.com, 
	minchan@google.com, souravpanda@google.com, pasha.tatashin@soleen.com, 
	00107082@163.com, quic_zhenhuah@quicinc.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 4:47=E2=80=AFPM Shakeel Butt <shakeel.butt@linux.dev=
> wrote:
>
> On Sat, Feb 01, 2025 at 03:18:02PM -0800, Suren Baghdasaryan wrote:
> > When a sizable code section is protected by a disabled static key, that
> > code gets into the instruction cache even though it's not executed and
> > consumes the cache, increasing cache misses. This can be remedied by
> > moving such code into a separate uninlined function.
> > On a Pixel6 phone, page allocation profiling overhead measured with
> > CONFIG_MEM_ALLOC_PROFILING=3Dy and profiling disabled is:
> >
> >              baseline             modified
> > Big core     4.93%                1.53%
> > Medium core  4.39%                1.41%
> > Little core  1.02%                0.36%
> >
> > This improvement comes at the expense of the configuration when profili=
ng
> > gets enabled, since there is now an additional function call. The overh=
ead
> > from this additional call on Pixel6 is:
> >
> > Big core     0.24%
> > Middle core  0.63%
> > Little core  1.1%
> >
> > However this is negligible when compared with the overall overhead of t=
he
> > memory allocation profiling when it is enabled.
> > On x86 this patch does not make noticeable difference because the overh=
ead
> > with mem_alloc_profiling_key disabled is much lower (under 1%) to start
> > with, so any improvement is less visible and hard to distinguish from t=
he
> > noise. The overhead from additional call when profiling is enabled is a=
lso
> > within noise levels.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
> Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
>
> One question: Is there any plan to enable MEM_ALLOC_PROFILING by default
> in future?

It's left up to each distribution. In Android Common Kernel we are
enabling it with CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT=3Dn and
allow vendors to enable it using kernel command line parameters.

>
