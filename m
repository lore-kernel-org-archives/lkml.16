Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B5F13D89D
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 20:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738269304; cv=none; b=ApCKmB6T+miumPSIlIywb40E0bonDxElkACFhlXnZ52OagtH+C13kbW4rNsSb7XaHusvTUu+bq9YpkJItAIbzHWPuXL6dDLRobbcCBOdmf7Tqr+EFyG5Uyg2pPX44qb+dP284F2LAJqRJCKC82ZOV0HrZyxq5AfkaaNqaC2yynw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738269304; c=relaxed/simple;
	bh=i90LZEJP39KZzuaancmUFtDGdMy9w3zyTcWopQWmg60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tZ7UehKNnIyPOxJEtHNKODhmjGFmAofz+RS1e/oep8NMyyWZHIV0YThsNuiQXFsT4wzQOz5vxJvVx/0SJTbH+x05QR1Vg/GLMbPkX/17MG0cXl9U1eQw0b0ypRMk8O3J3+WTRRZIQ2fCf7MVyB58V5H6WG9Q9ddBypvXD5UBFVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C0SDAGsb; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C0SDAGsb"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab2aea81cd8so233156966b.2
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 12:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738269301; x=1738874101; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i90LZEJP39KZzuaancmUFtDGdMy9w3zyTcWopQWmg60=;
        b=C0SDAGsb6aoxiIDl26VA28h6nEEWfzLSputwGsqgRGp/0q5KH4/B0nVzCAlLlQ45kA
         mN27ySAI//VFOz0+FNnTkUwbQNNdOLZIO6f+58MDqB9qvURN4cxEQp2//QNJaPcdosWn
         Oyqt3gMx+3wQRAy6cyLn5M3n8YAYPO3wycteGkxICxwACC+EIEBdpHR1x83ZE4mO0BCM
         nDKq7N8vxhABhZTuLruzsQZSlTOtuMhffpkL7orZXpr+0Q2FWb8vs8M6uQPkI4yLzfuC
         YrnebunTh0M+I3HUOy8VP31rUceAu8O1dyrmzNa8T/HrvgJT5IZ+pgQZrrrPT9y9Z2zU
         xQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738269301; x=1738874101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i90LZEJP39KZzuaancmUFtDGdMy9w3zyTcWopQWmg60=;
        b=o9mEaQ3YLUD3xZ2x9MKEyh2t9lwmV8RIMT26rvP9v0FB0livBtwuhd+Dhaz7xOpu/p
         xlNzLk3K9AiZTVtdJUIpB7bDNaPJgQuD1DmMYfGp3EMQS4CneqCjfrwG1CiE9HxlhP7k
         z0A52k+ss6hC7oXzExUD3TWoXEGROBC+W0qvLfy1rWWJpXAPOXtj2Q/bFej1YXc1EXzI
         shPdjI+zCtAPEvlsuPP2QJ71Knu2sCvXyWDVg70mx/9b2Ifg6StANSunMcKAVgGiohtY
         611rZG7DYy4Tvjjmm8Xv7HpV+qFrJYzKnf/ucZ2K4PI7kDXvFDMKpw3D7l0uMNbFQLYg
         NIog==
X-Forwarded-Encrypted: i=1; AJvYcCVuLHBBLDonaEGVXajoCeWjK/DnvPfl3Pf4GharF7aazoX9XVJ03snzI59KpE/tX08B9+tIbAZQzTLRTDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyczb+nFjFtqShZW30JkHnedeIpYPWeWt48Cf/+Dyny4J65eQwC
	Mu+baR1sEtjTwF61DDPzjHwNdyHZyzUED2TqWo2PgvYSp7PznHlTBDo2FXZPeYSRaR1/CtUgXCP
	UEMX1vUFq4fqYvs2rKstBQqObAiSCYzn7AXgc
X-Gm-Gg: ASbGncuNPlm1zRWsn0vsOiUmUUQUqnDwx1SDLI+AEkFdoQE2w1uiuzkJiWPS2s70Wbf
	3wf55taauHozpQA+K8MjVltDZBH55bm7XC52UKyINtc77u8/rvLNvgcP7ai78xiEROJOb4ITNzj
	BDP3eFgYREWSAMyEsnY2vp8R2dGUhoHw==
X-Google-Smtp-Source: AGHT+IGECMPAgyniOqYNB21R66I8EdMyOHzZpuuSW7CxtAKNGfo7YHvttie355d+QCVHN1qEbYdE+9qUUvFsylnBIlM=
X-Received: by 2002:a17:907:1c0e:b0:aab:8ca7:43df with SMTP id
 a640c23a62f3a-ab6cfe11fa5mr941990066b.39.1738269300801; Thu, 30 Jan 2025
 12:35:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130100050.1868208-1-kirill.shutemov@linux.intel.com> <20250130100050.1868208-6-kirill.shutemov@linux.intel.com>
In-Reply-To: <20250130100050.1868208-6-kirill.shutemov@linux.intel.com>
From: Yu Zhao <yuzhao@google.com>
Date: Thu, 30 Jan 2025 13:34:24 -0700
X-Gm-Features: AWEUYZl3-5-D2vyBu6SH4C2leVIlg1PIhkFjDOkk3Xxy6Plb6I0iqOiSPQjOIdU
Message-ID: <CAOUHufbZAp9jJb7AA_LF2sS9TbN-T4ssSrp2GbqWSAbf5rUCVg@mail.gmail.com>
Subject: Re: [PATCHv3 05/11] mm/truncate: Use folio_set_dropbehind() instead
 of deactivate_file_folio()
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
> The recently introduced PG_dropbehind allows for freeing folios
> immediately after writeback. Unlike PG_reclaim, it does not need vmscan
> to be involved to get the folio freed.
>
> The new flag allows to replace whole deactivate_file_folio() machinery
> with simple folio_set_dropbehind().
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

Acked-by: Yu Zhao <yuzhao@google.com>
