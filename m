Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5321A2630
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 17:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746205299; cv=none; b=R4DL3aAiM9gIBrrfReLucTn2TDkW409fEc6rTC51aCJVjNkVNCQCn9MmvdHApuxwOJN+QyBDPqCvL3qE+yRwzTAqQIGwlQ3CH5leFWn93RrH6yl5A4395P2LTG68s5Ne83JoK1SPyWlMRxvYiDc5s0E2ba/cQizGRQA5s5Wld8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746205299; c=relaxed/simple;
	bh=BFtyWDFTN1QrKrJxpIvshxuClJ86Y3W8VsyPYHB3IwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dbervhPrdDcr2ssqI9ZnXvNp8Lq5wTdbHIBFJ64gbjz/J6hDY5gGXRHl0uLRrPsphJ3cNYDvJGLalq44ue5l2AICN4RCdTc2MS8kbbkkALLwpD0bZUegnBYjNb0mzWFi6524F1lpnVYYvsMy6KaTis2Bv1W5mpjlzbzfNmjtLrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com; spf=pass smtp.mailfrom=isovalent.com; dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b=BOAVdmnX; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isovalent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b="BOAVdmnX"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f62ef3c383so4056069a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 10:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1746205296; x=1746810096; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFtyWDFTN1QrKrJxpIvshxuClJ86Y3W8VsyPYHB3IwI=;
        b=BOAVdmnXJDta2bWmJmyXLuQhiUNwzMGnxt8izmUyAPJnor4WJSH9GfzSD1B8jJuDGe
         4YI7oQS33bVziyf2IZ1xna4tzmkygTzRmnAn/xnrys8YucolLboIOMdRc8SE1EhRRdog
         xX+d3oKLxBDF4Q/010173dkiyFbXuX8LwGdNa8oXeV6fQF0gC+Sfto6DdeUt8tyYLfdN
         kZcm7bw5kITiHajMfWxTFkbG5r6ZNlfXidNZWkL1sNzCEe9Dvx+LAZIT4n5R+GRUzoai
         59Y28KF0cTWXt7Sp9HREB3TSEkTajsGPWKDKZWTjHhFzxdgMCRq3AYLzD/ZO9y4E5a2j
         ki8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746205296; x=1746810096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BFtyWDFTN1QrKrJxpIvshxuClJ86Y3W8VsyPYHB3IwI=;
        b=HOwuJT0iKLIUOU5HbmCf48ZUMIIcCzWfZgr2BEVvfV44H7Ma87tS3ZAOQm/zlMCOcv
         5BRZdthNTFE6VVYuixX/CQYwpfWPzOxzSa3G27Iv5yvwe8zUFdqFzuutUOmt+lhFJFLS
         qhe5mecYHpMU9kkYJl2OP02MbTG6YOTeXRILwnT0/lBwUb3VhavAA816POa0SHoc4Rbw
         D3JECIE8Vnd2hVvf2+p7X1xKnYMwLXAKPpN1H4kAV9J9p9ABM44i95juoF4ni1ZNuEQ2
         H9ALj/6IHPLyzsluS6b3HQZy/MCo+2Fx310h/Hp1ejJqHtUrOjAngbP53RueNpLR/+S/
         iXAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4nduT+VPnj6dv1IxKuMQ7BHuPpE4gQjJfj6zou1txKDjapto+Ya62UCzBSp8L8svor8F9LPX0pJTNxAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkRl8AxObWO/8nmrR/tms7FSMeVdL4DjF5orYy3y4V97yewTid
	hiAS3X9C4dM2QYK06WnGoylwVWx91nv8jGiMis+sHR4vn7M/9k6Ggohkj16WBxVLTFnR91Ih4Lp
	2L5HvuIAABPfN12w4GyTz1BzVMBuD51t+YUyWuGI4QgdNi07q
X-Gm-Gg: ASbGncvn6pixpZ1SaZ6f+9GKjXlCqxwYqjhXHoUm0yCx6K5fwElySyPvngopJUIX/T6
	jfiaHYRfUqgNkW1dQuCQCoGVWI7ZfHi/I68hwmXQjaAu0cJVN2NhwFd5jqr+gc2+eBBtzd4k28Z
	Zm9sA4K9NsQR5WXWdzY7iocR9ZlREbogrTaIk=
X-Google-Smtp-Source: AGHT+IFtImagR6Lqfgo7XIZ1wWl2+tLkZnQp/pTB1oR1k0UzDInmGHhqpcROEep6B+1QLhfQbASn6A2YAzPAFuoWbdA=
X-Received: by 2002:a05:6000:402b:b0:39c:e0e:b27a with SMTP id
 ffacd0b85a97d-3a099ad70dfmr2371455f8f.23.1746204815370; Fri, 02 May 2025
 09:53:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502-vmlinux-mmap-v2-0-95c271434519@isovalent.com> <20250502-vmlinux-mmap-v2-1-95c271434519@isovalent.com>
In-Reply-To: <20250502-vmlinux-mmap-v2-1-95c271434519@isovalent.com>
From: Lorenz Bauer <lmb@isovalent.com>
Date: Fri, 2 May 2025 17:53:24 +0100
X-Gm-Features: ATxdqUEmdXYDqO_tQ1hPoaj8fCjwznGA5fXIlAwLRODgYtT6LMxPzFPPx9AIs8I
Message-ID: <CAN+4W8i0CB+gYcBNyWUxAA+=89Q+nMFopxKUF3nt1+y5ATaNyg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/3] btf: allow mmap of vmlinux btf
To: Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 11:20=E2=80=AFAM Lorenz Bauer <lmb@isovalent.com> wr=
ote:
>
> User space needs access to kernel BTF for many modern features of BPF.
> Right now each process needs to read the BTF blob either in pieces or
> as a whole. Allow mmaping the sysfs file so that processes can directly
> access the memory allocated for it in the kernel.

I just realised that there is also code which exposes module BTF via
sysfs, which my code currently doesn't handle. I'll send a v3.
