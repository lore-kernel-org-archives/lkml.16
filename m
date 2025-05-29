Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139C61552E0
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 00:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748480326; cv=none; b=SvCDod7lk4GhVPQW/Ky0maEVq/JzrZD+Q7lGYzmh07EdT+hRbzXJoJapy5nWqyoFNrZ1rfnmfanZ+T2udcDv52E++Llm2+Xg39owkaMzWQxSVTaxqKoRRxaSXeRP2ktBMRnF0mPlIBVJtfVOZI5qXl/oZ2MHsHqb2SAmX2W8Kes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748480326; c=relaxed/simple;
	bh=3LJcOgM16Q1j+9Th1SFZvDmY147GM4KkX2rAr1YfKhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DKHu9H0ocet4LExlSML5qv1kgYFkXK2RAMVRzRiDo1ExSnX6n+aNv2XEFUv89Uelk6HMR7LuPmOpdFtiFYb1ruV0ZJWYVUm3A3MyVCJZtWtCBW8a+mOKDKo8+AyzS02kE6hApFc/fm9T+JIc+hIjuFm3LWNctV0BN58BW6xyr/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V8SAI7VF; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V8SAI7VF"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e45dae6c8cso239850137.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748480324; x=1749085124; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LJcOgM16Q1j+9Th1SFZvDmY147GM4KkX2rAr1YfKhQ=;
        b=V8SAI7VFlPtkPbyc1dL1gjfXp12iNxY/O7nkWcdeSjTl/YcfVPiLQpk9HH1R1gB/lS
         Wkbf6qRz1mKeF9Ddi8zlrJYonyniXGkF72XVGahic1jKgOtMGVN+pOD6OpfxEJ3sssDE
         1x48JlAdlty5tUZm0WeBJvGiZAkxYVmxuY9ZrnUQRtbVfSU7rZbnqJQUcEYQ3toZA4Fl
         S711KAzkr+GfJTlcbDTzhAETuRin8N1BV53/sSrAHqR0WlmB9bpfcb2pQgByJ2MXQyik
         Xp1/07GlEGJ18BMp6lzx+Yn8RWSmmc2HUI8Eko/50s7M74snfEUrFegh+STKT869tRqh
         3DrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748480324; x=1749085124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3LJcOgM16Q1j+9Th1SFZvDmY147GM4KkX2rAr1YfKhQ=;
        b=a6qfTunVwNVM3a/3IyK+E6HAt62xNENpvsCLQlMMvPqSe5DaqYAsbSzSxj69zM88Ur
         +ZrbcrWFYY8R/WYbflay33jFa/+HlqzfvKCpCplrF29Ul58wHJFQ5JN/lYypC1Mf41g+
         uoctAvpH8VjqMr5W3Xqg/S93i9f0XIcSlg4oI45vJY3I4m/r4Y0lzFdGbLEhj/ngJvZ1
         37YCpfUIAUTwJ8CYH1MStI+8D2T73vTsChwq5JozBU8oEkSr76Ne5uR1cJ1wOCbRUoDi
         GNghbLfiK8Qpw3UNu3MJ7gxHTm9e1wvMBetAiAzc2GGd44LIghyEfjlJCzKNMdQ38vdj
         Qccg==
X-Forwarded-Encrypted: i=1; AJvYcCXpEoFZoSf1jmyEgC0AVE5NJ33WHVBAQhbCU8+K4ntOW8yvCtIxmnXvvOLLPHuzpUaFnOZLimU/C2dBvJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4RZSLoERUpEavjDCmwtGmCZxlXXb7qJ8u4vBagjS0CasXqe/d
	pkiQj5hQCw9Jy+nUDLFzIWV60antdnbWbvvmt3NUaNwfpfGAJ0b1DykbSrwNSaRrjPFNlEcj5rv
	eUYrkGHistFs7lDJuS03ZwSXH3mzyFlsZqZzvKqQ+
X-Gm-Gg: ASbGncunWM3LxK6zAORemgpy6EovNsu7LpsyCefD+lav19WAGnsgfKCuh3KrrpSfXwH
	VzaOooY3kO5r9jEH7SnNbauC+b7uAxjdZ5n6ilcwdKCszogKdZYhFvROqbH0RX0lsI6Efmej+s6
	shKHIBYTbDkwGF0q4FJ30F4GzGG9lQWwxXXe3o9oiQCXA=
X-Google-Smtp-Source: AGHT+IGwx4Uty5er2IzIySgycdil2fOJygTTHKMBF3mM9M6iD5H+JXzX07+IWyvy/kC9EeuCYaOM6quQ4vt7XbW+weA=
X-Received: by 2002:a05:6102:2927:b0:4e5:a309:85da with SMTP id
 ada2fe7eead31-4e5a3098731mr3876448137.7.1748480323519; Wed, 28 May 2025
 17:58:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521222725.3895192-1-blakejones@google.com>
 <20250521222725.3895192-2-blakejones@google.com> <aC9iF4_eASPkPxXd@x1> <CAP_z_Cg_vH1+BAm87U4gYQ0hDRGtHkkYb2DHtTRSd_QNvg3ZLQ@mail.gmail.com>
In-Reply-To: <CAP_z_Cg_vH1+BAm87U4gYQ0hDRGtHkkYb2DHtTRSd_QNvg3ZLQ@mail.gmail.com>
From: Blake Jones <blakejones@google.com>
Date: Wed, 28 May 2025 17:58:32 -0700
X-Gm-Features: AX0GCFusfVzOe8iNeRt_7LeEPUEcrg67_QANaTma6IA3CsaAZ6gVZ8V4ecXjgtQ
Message-ID: <CAP_z_ChErhmooT5rhyXH8L-Ltkz3xdJ7PG20UKDpn9usMUgqTA@mail.gmail.com>
Subject: Re: [PATCH 1/3] perf: add support for printing BTF character arrays
 as strings
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Chun-Tse Shao <ctshao@google.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	James Clark <james.clark@linaro.org>, Charlie Jenkins <charlie@rivosinc.com>, 
	Andi Kleen <ak@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, Leo Yan <leo.yan@arm.com>, 
	Yujie Liu <yujie.liu@intel.com>, Graham Woodward <graham.woodward@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Ben Gainey <ben.gainey@arm.com>, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnaldo,

On Thu, May 22, 2025 at 11:19=E2=80=AFAM Blake Jones <blakejones@google.com=
> wrote:
> On Thu, May 22, 2025 at 1:42=E2=80=AFPM Arnaldo Carvalho de Melo
> <acme@kernel.org> wrote:
> > I'll test this but unsure if this part should go thru the perf tool
> > tree, perhaps should go, together with some test case, via the libbpf
> > tree?
>
> Thanks for taking a look at this. I'd appreciate your guidance here - I
> sent it here because the other two patches in my patch set depend on this
> one.

Do you think this can be merged through the perf tree, or should I separate
this patch and send it though the BPF tree first?
