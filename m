Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29731C5D53
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 20:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748896001; cv=none; b=UHRkpw021R+kSu8IbrGYpWzkAt/slr3rRUsYkEx9zP9lBp+Kxr1NJkPD0dVaRWaRCziLmt8ibhLAB6ltoz0te++KMxTCynEuA1u+pf9Xyh5pIqgzPLIyY0gBcJrZls1uJWq020FHPVu5fqisF6KUy4DgBVHcf6G9sFQF6TAJgIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748896001; c=relaxed/simple;
	bh=yy6FlNOUYO7QcVohlDl63YNljgD7fgJqb1/vYLpHNbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ASeLdkN/kl6CKB46pCBa8ICacIf+Z9NLYyApbvU0keoPt3blU4Ho0Nll5w/VjINQGmIK3u2yYtFTjWW76j52guOJv47C1v+hJcSbTLm6f3s6YIgIDem6fuecKhmz2EMFzE7ZSqtKVX/lXqxXEjQlLGvYEGh64UfIIOJlaWSt8qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SIzoSI9a; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SIzoSI9a"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4e45cfc3a26so3433628137.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 13:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748895999; x=1749500799; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yy6FlNOUYO7QcVohlDl63YNljgD7fgJqb1/vYLpHNbc=;
        b=SIzoSI9arx77Bd5NUipcjN+TBznDBDve/hCpg/rxAQnhlnxXpx/v6apG8NA30CWk5a
         UiIwg2pDXu1dn7n/hKB038zMr2J0vFBsn8ZhvlYc2RBZcsOIXfhWMsLGjtTLqBGu5qgZ
         DkHjOITZOpFnXgFGk2C8QrSIt7XgNTHqQVfyP8dbyxnF8ujDQvN4dJMLKXyHMd2p59Xx
         5p+tPNYNPABIvS6BaiJnsHWP35mGY1kChB9Rp0vhUBLjZt+RhlaJ3gXBuBnyVY4DYtaj
         wNp4Sv3Zh/OWSxvpyj+3tgtSHqFESc6imAUtkyz51vfSOhcMhiQuMnhXSQQeASYLQctK
         KDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748895999; x=1749500799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yy6FlNOUYO7QcVohlDl63YNljgD7fgJqb1/vYLpHNbc=;
        b=OHLSgG1n4S9jQOjZ+hePIMuz633tEN86r849kdJVoP3ORrpKRQyqe/ALlu9c6lq5KW
         ILllEpK4UYVy87E13vP8+580e6z/zX+0xwyydqHg6rhWQZL+4/vepf/lv5XXvINWq6+1
         qr2cIq/pYSrJVFF8rGqbSWkzAtbA6o8VJODIDS+6350RjMwNYqnK+ptw0br9h3dW/0pJ
         ZVkA39tzk89Obl+VQUEnbbvwUioAbH+TQd/nVHnSrnR9om4Bez/ec/K0glVXYVDSJYLH
         S913/PaB1tkyS+q6ybynjnh9vh7Fgn7dSxCbjZcmObe3Ut/atxuTJW9lpZQR8nHOdiRJ
         OEeA==
X-Forwarded-Encrypted: i=1; AJvYcCWSQJcghewR9tXuM69l+glxkPKwoIZ32j0EvuX6Y23F3Bc2HBs7ReBQM0jjLGaGh9yGRTgMxZIRb+JFlV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpJeO9pBNc09RIIzCsQAFvOQ1VHejTif/BezUb/imw0YC7+hsO
	rlIzCfTAgVPxNvzltFJ6vIWuBpf322giQlV91sci/wbvIs3TG+TvVlMpSkTpXfADUDlajWsyWBo
	gcQWFDyx/ZNpPWTX88LG272/Mx29LTnmmieiI4mya
X-Gm-Gg: ASbGnctfcLL/idnVvxZaWJvku7ftnqotI0K3nYWDrekzfM7s/DraiYMktBEzelb2oIO
	8K7qtHjNPabf8LcScRiNGcy7pcYVjTdHAGs/e7B7cr4YZHJ2mb5iYpAeyeNNotco5R4xFfBhaeU
	hwEl9gswqXTi0b0XoaySpQ+lQLIkG1cb55zRhKARMKDAM=
X-Google-Smtp-Source: AGHT+IGWzCL964d3NZSve0TxcZHhGFSpPRKvBMtmB7owRY1nMGw6YLoDv2x/qshMKaW9Ilmep03btfWt0apKbdl0NnU=
X-Received: by 2002:a67:c996:0:b0:4e5:8d83:c50e with SMTP id
 ada2fe7eead31-4e7323d69camr1055701137.10.1748895998531; Mon, 02 Jun 2025
 13:26:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250531072031.2263491-1-blakejones@google.com>
 <CAADnVQJv_FVciT9LC+W=sVtWAt9oXeAACzmTHzyqY-2svi4ugA@mail.gmail.com>
 <CAP-5=fWADfh9WNXgUOhXYW5hZWk-FZL1oJTdaDgq8Hqr8_Fd0g@mail.gmail.com> <CAADnVQKeJUdvJ7tKhpdatL-A5zDi9DXKFun8fwM2e7Bynd5FDg@mail.gmail.com>
In-Reply-To: <CAADnVQKeJUdvJ7tKhpdatL-A5zDi9DXKFun8fwM2e7Bynd5FDg@mail.gmail.com>
From: Blake Jones <blakejones@google.com>
Date: Mon, 2 Jun 2025 13:26:27 -0700
X-Gm-Features: AX0GCFsv3gLe9smTQKIVsHtNCsx9xZ7FvMOlC239kYUGSq4OKs22Zv_ih_8j8Os
Message-ID: <CAP_z_CheNtGsrC0Rfuj=uPZUBjjNU2+3Hp4uXHmeMnfPhyMk7g@mail.gmail.com>
Subject: Re: [PATCH] libbpf: add support for printing BTF character arrays as strings
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Ian Rogers <irogers@google.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Namhyung Kim <namhyung@kernel.org>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 11:39=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> > If no suitable libbpf is detected then the build will error out. I
> > guess if feature-libbpf is present but not feature-libbpf-strings then
> > we'll need a perf #define so that the string feature won't cause
> > perf's build to fail.
>
> Yes. Something like this.
> It will also allow libbpf and perf patches to land in parallel.

Ah, so I could test the perf changes using this libbpf, even though
it wouldn't be present in the same source tree until they're merged?
That's great - if I have to do a bit more work to reduce the overall
merge latency I'm happy to do that.

Blake
