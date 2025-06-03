Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3FCBA34
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 18:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748975813; cv=none; b=JEDbAuqVY9wTsbtXOalQMsNbbAXqHOJNARTSkK2HLHWbWagRBfCETJnHpxS+U2tjqrvl7W5CvJwoz0DGEnlYiYXOKFZvIV2niBcmtuE0tzvU3HyuQztHn0MzjpuY4G0QdCc66d3pNgGuMPakwH9dP/L4RXZPKs4+FpAmJA738pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748975813; c=relaxed/simple;
	bh=4LWPpsQCFsV2Ez6SwVV0Xkw9P6OqWEXrgNYorJqhk28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R5Zo2iVGa6MAWxVRdQ075azP8EU0XJGyGtOxwdvCPXoi7NYuPmhFv99ZH/T5l9RhIk3p8irHU1MJZnn6Do/1VH/xhZcEUaHcQZ3p17lojwogvBscWApaug42cQXCLOaUQ6pSj9hRdmk+umYoolFDNwTCqNRvpQviNzlRxvjinBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cx398UtL; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cx398UtL"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6000791e832so1611a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 11:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748975810; x=1749580610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LWPpsQCFsV2Ez6SwVV0Xkw9P6OqWEXrgNYorJqhk28=;
        b=Cx398UtLKR6jY23N7OkTHlA/+/RI+spVVTQrPjAF7A9usS4UTphe9/1FTZNbIp+Gpb
         YHmdGCkIgiDOKAl0yRTVhEf4NJE+L3uV8IC67On4X0bpqaQ9KRwfAG9GlJCw9invMsp/
         8t5pecnQXol86y8g0uqieFpvQAUfvLpaIu+iby/7YGMp68eQARCL7CZSo9Dxmz7nRmGJ
         KXuEIh10B+4j/7lFU2+l067lOfENN3inWu9vXIwd7e04vewHkVgvJz3k3Jp/X99HD9sb
         KbQ0jIubOJKHtSd4GAMOaxHwu+1cvcCcdX1yWtBv/IU0LqU6vr+dJYDBvenBbhOymbK7
         BerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748975810; x=1749580610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LWPpsQCFsV2Ez6SwVV0Xkw9P6OqWEXrgNYorJqhk28=;
        b=CknzCPHUwEeGzOTjbLXgzMmKkATG3oSt4UWz3xi2Fedf4qP7TlVpyl5I2OwQAksQlj
         s1NAbmlb1G6nMDXerYIWmq/y6GAYwTXxxSUTJo8KZn6/Lcf4w//ITkYDh2cc6Boepas0
         +wo8z8yHQDp3CQMBtVkh2ps9CIXRk7hLjNEgjLAA6m2WQqQ3QKiXuP+Ef9mEb0v9ZKny
         H1Y7z8ujvvzAyUjyslLkUouLobbxDlKs0eBcWfWpJv7GIciKwnZzAq2a2/GWX6rTW+DN
         ITOiSjH4YXUWGLtjvM7w4wGKwDw0AitZf6BOMR6rqNS6Ll3Xsg87OysbYJnvJ47QJ1IX
         0+Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXOt3J1nmaQbYs2JPP84r4fYEDUwhLRyqDY4SeHCccEhuJn86dMYV3HrtGhOVmgTMcNbfaP+MjYKJcV5lc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO49Pz6m2sZTs7N2jP0q8kUrkr2Yc7cqTFhd2VHXNxfEBma4+3
	+ypnHALUAlqW3faCFBSz66w4y3YZZ/yYISn5ifqnVOefGxqC8u2z7mZDr2tyfZS1mYHv4MBaHC7
	hXUw7F77JOxN7Jj7YelFV9GohRhQKulTnSqBswIGU
X-Gm-Gg: ASbGncvTMHY4WWEuoykQhow4TQbBBJw22z/SIS7Ry2uT/SxDNaayq0pmlslTtBH3J5S
	gTUx8YxQqBiZHz7varWjxxz/z+lOYWkuJlsUVBpJCh01p1Z514lFZUm7nxww/ZyaTOPHemlnDeM
	GvClrqKjHM/npIZ5bF998SLC9U+ubNuvLlg7zzdPbgxF81axxNrlRMFC2cdk6rpkLLeoo+Rpmie
	QrHFaOA
X-Google-Smtp-Source: AGHT+IGUjNIfNKkJvJxhDkcKmt6M2XDy1Zqe3h4hEjImdinzMRBauy7k4TcXPoEfdt7FexX4FqT2gfwsrZ2hazxos5o=
X-Received: by 2002:a05:6402:174f:b0:602:3bf:ce73 with SMTP id
 4fb4d7f45d1cf-606e80b8d4amr4929a12.1.1748975809756; Tue, 03 Jun 2025 11:36:49
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602210710.106159-1-lorenzo.stoakes@oracle.com>
 <CAG48ez3DCwDdA1UfzonFzradrYq5VmhwLGgqMXNq6k68tr+w6Q@mail.gmail.com> <f08104bc-8ef2-4f6d-8d23-e5a087595a40@lucifer.local>
In-Reply-To: <f08104bc-8ef2-4f6d-8d23-e5a087595a40@lucifer.local>
From: Jann Horn <jannh@google.com>
Date: Tue, 3 Jun 2025 20:36:13 +0200
X-Gm-Features: AX0GCFuBBAO2PAXs-lVLk6mYc2WXvqPy4BatY5BO3b03KdmWhPbCsmTQkGQ00QY
Message-ID: <CAG48ez22QsH5NcE8+-_ofA185j1AiBFZNsaik338pjNr8kC-gw@mail.gmail.com>
Subject: Re: [PATCH] docs/mm: expand vma doc to highlight pte freeing, non-vma traversal
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Qi Zheng <zhengqi.arch@bytedance.com>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 12:45=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> On Tue, Jun 03, 2025 at 12:25:36AM +0200, Jann Horn wrote:
> > The one way in which I think this is currently kinda yolo/broken is
> > that vmap_try_huge_pud() can end up freeing page tables via
> > pud_free_pmd_page(), while holding no MM locks AFAICS, so that could
> > race with the ptdump debug logic such that ptdump walks into freed
> > page tables?
>
> But those mappings would be kernel mappings? How could ptdump walk into
> those?

/sys/kernel/debug/page_tables/kernel dumps kernel page tables. And I
think /sys/kernel/debug/page_tables/current_kernel dumps page tables
for the entire address space including both userspace and kernel.

> > (I think we should take all the vma locks in that ptdump code and get
> > rid of this weird exception instead of documenting it.)
>
> We really need to be sure that there aren't some weird architectures doin=
g
> weird things or circumstances where this is meaningful.
>
> I mean people went to great lengths to make this possible, I find it hard
> to believe there aren't some _weird_ real world use cases.

FWIW, looking through the git logs for the x86 version of it, it seems
to mainly be used by developers of arch-specific code trying to
debug/validate kernel behavior.
