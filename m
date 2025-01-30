Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CA5196DB1
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 20:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738269575; cv=none; b=No4FrmpAGjsHYjyoMUPUWLLqi0gEr8nc6dfnCi40dl8RPOtWmHKOWWKb00wIdssDdk2ph+oqZzPTV3vhfSS8LqOneN/grTKNHj4pzkt1wjXxDkP5uoFe7xqgxIwQDDlSY95DdbmNns6VQrDI34gQ3pjryPb17Ocm5Z0MJq6qhy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738269575; c=relaxed/simple;
	bh=Zjc/ukGYviU6e9aVM8L8Zjtty0hNQpOZXKBc9NxwJp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RRWfg6nN6xRJMZVLTAHufbFi1iq3vxa+Rqq0lfP58u9J4Y0okv8qDw1ix5VzFJ37MlxSr0Jzpllep+F+8vTwPVlY8TOK21bIf40K88DuHuk02K2gB66IdsZbN3MVE79diTytrcW0xlp7bYeZ4LPO3Xt559XyDhHVxj1cP1u3i8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bCNu2G3x; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bCNu2G3x"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaec61d0f65so90570966b.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 12:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738269572; x=1738874372; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zjc/ukGYviU6e9aVM8L8Zjtty0hNQpOZXKBc9NxwJp0=;
        b=bCNu2G3xtBTaB9c5N9vtPo/9JNZsYdyMy8UaOKvc1CBds3Z6VWCbtsxYZU5oR5hJRi
         5qhbVMsmSfmECg6DKZrvEyenSQUYhqmC3uzU6UKwtn/U9/+jjSo5Hh2VFwuB0d/Rbcb8
         uX7EbZf3NksmpwfTBTv3Fncda/jRmu6oIRYut7pGXDXdN+EFW8YdqRGPwJtDmSB8CIDw
         bw+c9CBLAZcvDE1QQBwm873t1QEgwtuQ5lU5WZ8LKdCWbty4BND5WFTOiAw04HabVUzA
         bHTgH8Au+WT+sUxbKlVWlFuOcFSVo0ZRcp4vYAn3P9dapSHOHigl94Xq4ewHiZZX8RfH
         v3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738269572; x=1738874372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zjc/ukGYviU6e9aVM8L8Zjtty0hNQpOZXKBc9NxwJp0=;
        b=bQ66Yy2V6Ofr5T4DESp1YhDZ9rUS0oU1xERzeIgqRWI02EUNXqEOsXMpctuEzihpIA
         H+np6zOQe3mRcU1iCvMz817gVaxvBXIi+rgg9BD5DZZ1D7mwimenyQ/y9MKJd5E0cX5R
         5IA+wMawwMTqliuLAptVy0GefoEqOKTo/AWFqhLkVhxS2yqjsvjW7AvezERuhS92ojRZ
         67rp+Fh1oF4PFxuNd38g43bsv1/VgFow33mYeQarVtdiOeq02EJf+sV/Ifzi+mnqbZoY
         LUGX+GDxObqJvxIwSu9TJwoejZVeDsS8M6PdrQr1FcOEjb3fw3hTFiFK8gafQ/NWPZb6
         Hx5w==
X-Forwarded-Encrypted: i=1; AJvYcCURiNOuG9e+6vjp/wemceNnoJ2wLjadNGFcaAUoncBz5HALvttheBj7TrdNVkQFncYHugYkMymfKNlDihk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeEv+sxV5+VQVr5oHtbLKODbMOCKFM7lmY/J2kdEPYxqIJm9hi
	tvLlS8cLioBppC78VjnjgKO2vnEHo+RIcSwTplRv0hXnDQKXU1pu1WfElMbCG2fbt/PRIEKltbh
	q394UFRlu1DFfnkTk+4T2kf2lc3TeCKvs4Ali
X-Gm-Gg: ASbGncvugQ40cRTgIJuazwuuLuaoTBokLgKb8zOazgjNrcZjx+1wU138R8y2SqE0kh1
	KTa6l6gCaOgVteK80h+m2hMNgzRB1LiwoCpPFis3Qr4SD/g8kFLCJAGxxE75WjBcKK8H4I7+Puh
	friJMJC0ZGSmHGpzGKqgfXOUEXsvwXrg==
X-Google-Smtp-Source: AGHT+IGrgFfO/K+h4P6zJOggzHtL/MGdhzkU7jyuReGUYiXkVzMuxOLtpvutFaZEw44utsgnrxP3JQA41Hof3U2VRwU=
X-Received: by 2002:a17:906:f74a:b0:ab6:d688:257c with SMTP id
 a640c23a62f3a-ab6d68826e5mr639571966b.43.1738269571901; Thu, 30 Jan 2025
 12:39:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130100050.1868208-1-kirill.shutemov@linux.intel.com> <20250130100050.1868208-12-kirill.shutemov@linux.intel.com>
In-Reply-To: <20250130100050.1868208-12-kirill.shutemov@linux.intel.com>
From: Yu Zhao <yuzhao@google.com>
Date: Thu, 30 Jan 2025 13:38:55 -0700
X-Gm-Features: AWEUYZk2YQUyps1dQbKiaYF6w_rV2K1IgcShMby4WAMvmMJrPU_zLRbp4lsvUNA
Message-ID: <CAOUHufa9VWCsVyAdgtdJ-5cgCUkot+tdD9huU1NAAmDSKzi6tQ@mail.gmail.com>
Subject: Re: [PATCHv3 11/11] mm: Rename PG_dropbehind to PG_reclaim
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jens Axboe <axboe@kernel.dk>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Andi Shyti <andi.shyti@linux.intel.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Christian Brauner <brauner@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Carpenter <dan.carpenter@linaro.org>, 
	David Airlie <airlied@gmail.com>, David Hildenbrand <david@redhat.com>, Hao Ge <gehao@kylinos.cn>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Josef Bacik <josef@toxicpanda.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Nhat Pham <nphamcs@gmail.com>, 
	Oscar Salvador <osalvador@suse.de>, Ran Xiaokai <ran.xiaokai@zte.com.cn>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, 
	Steven Rostedt <rostedt@goodmis.org>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Yosry Ahmed <yosryahmed@google.com>, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 3:01=E2=80=AFAM Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> Now as PG_reclaim is gone, its name can be reclaimed for better
> use :)
>
> Rename PG_dropbehind to PG_reclaim and rename all helpers around it.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

Acked-by: Yu Zhao <yuzhao@google.com>
