Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212BC3595D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 00:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743467910; cv=none; b=LlB5CubW5BwWRZxgXtq03bGEUTM0VuqaugC4+nwSDApCnfmKLItOt0xWfjGn4PPcquOKLx2aBE7MsU8AfRPq2aWO2gr2I6Jlb1qpIolTdlyHeRsXotzlk0oEkGWXfIj1dhkeZ7WLm32sDgEBexD+7NghFA+gTxm5oDH3QTDPArI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743467910; c=relaxed/simple;
	bh=EI1mPvdCbyYHIwBWxdtH54j+BVCkqp7WsbZyJafCRLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hdUB/FtA2B+WwAFMfQUk2dCf0IKGLMNFFM+ez8aBkBH9bggK5ZB9M/YHkSkJrioqXMqP+41s3HE/wAfv6HQHDan4rgilzGNSz8ed3xYCmeokIoKQa05ZkYvslPycPFjYGCCSIOAQbrjrr7UClyMd0QK8Pwu65M3sBr88nD9w03A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EzVH6IZ2; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EzVH6IZ2"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab78e6edb99so719520066b.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 17:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743467906; x=1744072706; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jmYjDTtlr4FUxPBxvb78kyKW+ePiRCaB/F3Y0k4Lqp4=;
        b=EzVH6IZ2LFseLQ1GenFe6kL5zJB1MMxJGCq5PZ8swGYBihGo+wpLuFB/XOTAiXyeqC
         zJWjGdffcoC1qoIkTzxj90+slwWnC4o/aBijPfR4dyNXGYAerpiPXUBv1/0sYu0cp6kK
         22ACkMHnBCt26ERKWoDdWDAO8ZxakQHwaS6HE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743467906; x=1744072706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmYjDTtlr4FUxPBxvb78kyKW+ePiRCaB/F3Y0k4Lqp4=;
        b=nX8X/OnmG8p7eZBaseGGqZOHxI4hNjVvAJMf+BBUhMcW8jZCLXJrB/W5fIwHGOLkBv
         jrT0lEP2Bd0L09S1l4DG0YcjqR7Xh+2C8JyG9CvdoCGZX8HdPTX6fWIdYDYCPfyk6JkE
         59pQX8xxnaNVLxXZ63v9DE1oi8IFqZwA+uS3CJU/vsvm8/SyVb6VY9lJxkxv9eyk4Jy4
         4Q0Wm3s1DnduerIb+CYp4YcXGt0Bac/ywhAVK5whs7kprgtJXZ3irUEbV2wlu4MlUorC
         69YNzZup9VebFcEOJcpqGFnzre5jiwtpIQBZxXpcDcF/k4ZLmSSdggws3Yx+0CVIgNkP
         VaNQ==
X-Gm-Message-State: AOJu0YwCWHsb0ap3SRyMlbLfMD1NnapwfdL/6ehG8d35FE1whi/DwN5s
	KUSW/zK698umAW/5L904hUQzn3G2Z1Ra/rzMrtSV77DEWzK7rZD1p+RXZ34b9+Op4cjXCptnZb4
	tOgQ=
X-Gm-Gg: ASbGnctIUTOmtRqZRh5rhBMLXslMAXrXW/B7KD3L4z8ayR7zQeHxMgg7jJaNg0yNJL9
	XyGdv8QNp3ejKYRxoJ8+1XobSsUVNfSVdNOAWfY5+zerfCpa4q4Pqp+h2vJvFqixwa7vZXNDuA1
	GEFNDtD9gJws0zXfUi+jh8ybV4ak35V4br0jEnMDoiEk95Pf9UJLUPqy6HJDPesDmrWqt0oO2IB
	gEHP0BlPf9OhIYY9UnFSxdsKbP63QtoyYphVBS2U7lQzy8L6oSI4nvGWSSmXViszrxbUN191Xh8
	kIr9Cfn9eRxBmjxDD6nbugmgQIHH9IRxJaOfJ37yDjguHGljFuCMd/8Rnp/wqDvHLzac02d0fHf
	SHJvC2Q/4NsiVDcO/qU4=
X-Google-Smtp-Source: AGHT+IGOBiMqbW7/jq+8ao9PyJePkk+4KEiaG09S4ScTUvKLwV04pUWdqRRhQmk1hZAqwySURErGpg==
X-Received: by 2002:a17:907:7292:b0:ac7:31d5:20de with SMTP id a640c23a62f3a-ac738c11723mr794515666b.50.1743467906073;
        Mon, 31 Mar 2025 17:38:26 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7196e954csm698167666b.171.2025.03.31.17.38.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 17:38:24 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac25d2b2354so804913566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 17:38:23 -0700 (PDT)
X-Received: by 2002:a17:907:9491:b0:ac3:84d5:a911 with SMTP id
 a640c23a62f3a-ac738a3fb45mr1010426866b.28.1743467902999; Mon, 31 Mar 2025
 17:38:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331143426.947281958@goodmis.org> <20250331143532.459810712@goodmis.org>
 <CAHk-=whUOfVucfJRt7E0AH+GV41ELmS4wJqxHDnui6Giddfkzw@mail.gmail.com>
 <20250331133906.48e115f5@gandalf.local.home> <CAHk-=wi5pLoe3szxLREQGGJuWU0w_POK9Sv6717UH3b7OvvfjQ@mail.gmail.com>
 <20250331165801.715aba48@gandalf.local.home> <CAHk-=whRNxdkLC6Z91g-_RbrRsUo6K6+nvRWqccjsOycwUe_JQ@mail.gmail.com>
 <20250331194251.02a4c238@gandalf.local.home> <CAHk-=wiDQpOeXi_GjKB7Mrh93Zbd__4k+FF_vJd+-prbaacEug@mail.gmail.com>
 <20250331203014.5108200c@gandalf.local.home>
In-Reply-To: <20250331203014.5108200c@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 Mar 2025 17:38:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0wQb+CbUk2GY0CeVuTQvq67-oYR0nL8wGgySia3ce7g@mail.gmail.com>
X-Gm-Features: AQ5f1JqkcRUTrAOWfRx6dOFz_CgrRYBalx1pwXYdM-tsf3km_onhfKZdgX2Gx8Y
Message-ID: <CAHk-=wg0wQb+CbUk2GY0CeVuTQvq67-oYR0nL8wGgySia3ce7g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tracing: ring-buffer: Have the ring buffer code do
 the vmap of physical memory
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vincent Donnefort <vdonnefort@google.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-hardening@vger.kernel.org, 
	Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Mar 2025 at 17:29, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> > Of course, I would expect the same to be true of the page/folio cases,
> > so I don't think using flush_cache_range() should be any worse, but I
> > *could* imagine that it's bad in a different way ;)
>
> At least we can say we covered those other archs, and if a bug is reported,
> then all that would need to be fixed is the flush_cache_range()
> implementation ;-)

Well, there's also the whole "is it I$ or D$" question.

I think flush_cache_range() is basically expected to do both, and you
don't care about the I$ side (and I$ coherency issues are a *lot* more
common than D$ coherency issues are - while D$ coherency is happily
the common situation, the I$ not being coherent is actually the
default, and x86 - and s390? - is unusual in this area).

So maybe powerpc people will be unhappy about flush_cache_range()
because it does the "look out for I$" thing too.

There's a flush_dcache_range() thing too, but I don't see a single use
of that function in generic code, so I suspect that one is currently
purely for architecture-specific drivers and doesn't work in egneral.

So *this* is the kind of "bad in a different way" I could imagine:
things that probably should be cleaned up and be available to generic
code, but very few people have cared, and so they are used in ad-hoc
places and haven't been sufficiently generalized and cleaned up.

           Linus
