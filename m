Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA0718DB24
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 22:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748989790; cv=none; b=L2yrSOUtIbIS0S++bH7BD8jpOjPkV7p/ItFBCC6Ek3e+Mbz/t9+UdLS18QQiil6CEWlTKL7172ID8mG9cqpwGROyggpZ6F+EFuwmJfAkrTdUPdE24rfx2/98sJGNJ0TVP1jb+jqYUAyfn+CSI936yWVlGUhsbj9ao189Oq2YsEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748989790; c=relaxed/simple;
	bh=obx6t0Iq9Fqb+Yk4q/piTYUchNh3FoDpcFQeglz4Wnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YheVO9pJypXZlXXS019rQK5/kP2RcgNe2tJy72hHRRGyr8p5c6qbPdFBH4Ds/226o+cKfdR+EaLqLlBwAfzmtsadvAJfAKn2ylYct6vwaINZoJK6rRNQl9AfsjAiAK7WKDRNdMgrdhUe6/VIfAi4BskspYm60Q38Z2NneHpfJv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wKleiVnZ; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wKleiVnZ"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-87df8fa1c6aso3238130241.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 15:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748989787; x=1749594587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKVaKjXJurHA9ZAekYKiRbyeQwPJnSI/h2fCa1bHxCw=;
        b=wKleiVnZE3cPUlNd8Zg272RbE+9K7dJO9gLl9/S4pfyQsf+mbEiqimU2eejlVQHnSv
         0ASGq+Qhm+CBWTjaoX2GDs2GmPur0wCpKO5BBfakRbU4w4v7DYJrDJsUWxdmtG33eeAl
         /AjBOH1tUzO/dvBZuOjd/6v1RLcyrDazPwo4ZkHeiIi4gJnbRHbkVtjxJJN0+dgAdi5F
         FNT885YYAyxD02AozzezOMk+lNu5uYAq19ri2Fzk1+ZvC5pqcEvTBTPBlWrIX36j254j
         jYZFqVFJzhT7rdN3IG7tMe0yTN8C7Eaw1oR566gtHaycqnlLHTkRWqpr+Kjchl6PO7F9
         25Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748989787; x=1749594587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKVaKjXJurHA9ZAekYKiRbyeQwPJnSI/h2fCa1bHxCw=;
        b=RIipeC3ZCrABqOhgQPuRAldbxbuhZcY3rjOsBzan7ZvfWo54PfJ+WsJfPVRWrXva35
         lH8KRQ+UrXd0OiGHYois8RAM5ffQjkAebXhjRz9h77AwBr3psDwDcufCFFmpWsDpjjRu
         Fs6z4r41y1IeuSTFFbE0uZ7kMaETp3QEWslXiPOLFL3I3kwMpQcxS3Dxh3652RQj/3Eu
         qDWbbCSbwUBAd8ryBAz1Ms8ihJxS6CNVtioSbKfR23mULGS9YOWK3wIibmN60soSyOXI
         +zJz7OLQTlBmJvKZKM/mSB2U0RXnDGRP6jfmYcvy861UCzTWjcyOKoHPz33TFcXDHkuc
         GC9w==
X-Forwarded-Encrypted: i=1; AJvYcCW7m0y9KY4oLlBSJ6GpoPfaKqhR5A66BcNQtW+65/T4VM3AfQVS+WOgibWgRFjjhuviCMrCVPkZvImtXNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrOxpcUcQN50gtuPzb0KQCvCbmFi+jjRvhjvk8q8r1kug4Q8ME
	KZhGQFnkRNXnuGwtYm5DIc5FSQcWD03B8m2CSIc494j+MFAg3nV6azqnunuJ8Y/oP5PdS3jMUmc
	MjEQHISbLWsVFYJvdhPEZJeEKD1VS03ZX1/BcmsUp
X-Gm-Gg: ASbGncta78goRXKTwNCA7Dqeick14bnzfPdINS1TqX7kLZPlf4IglhIScoR9ESOmha6
	e/qT2oXIhKqi9QWFvm94NsP0fPDZPSZooDbp9LYTijNkeUQwnuFDCEmbpwiGfd7qt+Nhhgkggm5
	lsH3xMiHj1hmcbhM9c+ZsNRrT2wrdT50hpjVEDiSvKD09VzWSiZaU/H4mV5uVDspfHMpC4mUC1x
	w==
X-Google-Smtp-Source: AGHT+IE1tHJ6ImcX1sMkuaqX3ipjnfleszUjJzXakmrAq8/3s08WHgfz64NjDqS1QJpEocJDC7pgBF/VLgAORoIVvEw=
X-Received: by 2002:a05:6102:1481:b0:4e2:91ce:8cad with SMTP id
 ada2fe7eead31-4e746f83a08mr252818137.24.1748989787010; Tue, 03 Jun 2025
 15:29:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521222725.3895192-1-blakejones@google.com>
 <20250521222725.3895192-3-blakejones@google.com> <aD9Xxhwqpm8BDeKe@google.com>
 <CAP_z_Cj_8uTBGzaoFmi1f956dXi1qDnF4kqc49MSn0jDHYFfxg@mail.gmail.com>
 <aD9sxuFwwxwHGzNi@google.com> <CAP_z_Cg+mPpdzxg-d+VV5J9t7vTTNXQmKLdnfuNETm1H40OA+g@mail.gmail.com>
 <aD9yte49C_BM5oA9@google.com>
In-Reply-To: <aD9yte49C_BM5oA9@google.com>
From: Blake Jones <blakejones@google.com>
Date: Tue, 3 Jun 2025 15:29:35 -0700
X-Gm-Features: AX0GCFsJchr322pvzUFRGDLm7UM_vm0tFyi9bmhjl2ify06b_OVX6aiJN88-0Ck
Message-ID: <CAP_z_Cg0ZCfvEFpJpvhuRcUkjV_paCODw2J61D3YQMm7dg0aGg@mail.gmail.com>
Subject: Re: [PATCH 2/3] perf: collect BPF metadata from existing BPF programs
To: Namhyung Kim <namhyung@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
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

On Tue, Jun 3, 2025 at 3:10=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> w=
rote:
> > Hmmm. Is that documented and tested anywhere? Offhand it sounds like an
> > implementation detail that I wouldn't feel great about depending on -
> > certainly not without a strong guarantee that it wouldn't change.
>
> Good point.  Maybe BPF folks have some idea?
>
> Anyway the current code generates them together in a function.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/k=
ernel/events/core.c?h=3Dv6.15#n9825

It certainly does, yeah. But I don't want to have that become another
instance of https://www.hyrumslaw.com/.

> > Can you say more about why the duplicated records concern you?
>
> More data means more chance to lost something.  I don't expect this is
> gonna be a practical concern but in general we should pursue less data.

That makes sense. In this case, it will only show up for BPF programs that
define "bpf_metadata_" variables (which is already an opt-in action), and
the number of variables a given program defines is likely to be quite small=
.
So I think the cost of the marginal increase in data generated is outweighe=
d
by the usability and reliability benefits of being able to match these even=
ts
1:1 with the KSYMBOL events. If this proves to be a problem in practice,
it can be revisited.

Blake
