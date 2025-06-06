Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95B92356BD
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 21:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749246769; cv=none; b=oNDKxWiNs7v19ZN/nqvJX90AKU2txZk2a0PKAJdJwVvauiVxNYxAuXHosNx+87T2ZkkogaknJ2mcqsZDufX0j2sfcrvyvjvQN29JA9ZcU7O13xosRv61RJ6FnT0DJ+YrgfUGPr/7QdYH/zSKVGgmxCUf3xxHtwciG/48daokhLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749246769; c=relaxed/simple;
	bh=l//H4CXt+bskKG2N3+2XmPtVrEWbNc6XBDNRfmVrGOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/vz9YdgfbE57Hir3QOk1PaJ0SbRl0kBRyerZ+EyvK/L7OoRTHk5W2YQ/AzqoFBboFoFRoM2tF+o/OFi+Zh8tmh2u7nfDfXN8GUhLjr27qtD5EWn3ZV+2q7mThJCsXiRN5SF7nBZXCsP3QkBLblQ/jdemrn85VOyatXxKcQbH5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lTrVgI4w; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lTrVgI4w"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4e5adc977ecso755787137.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 14:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749246766; x=1749851566; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l//H4CXt+bskKG2N3+2XmPtVrEWbNc6XBDNRfmVrGOo=;
        b=lTrVgI4wzvuUXLOZHwG7/u7NGOS5eUK+l6zChz83b5Q7W5BopTn9HbnNgGouRuWgTF
         VI0e3skEbgiTM4awmZmWy+jRu3f4qsOM+fA9KJ65csvL9VeJman6+KFJ0mYevqemmqZQ
         dSPR6N3MYrunmx+mTsBTb4BwmTgKOFQ6TpEw1RarWb7qVyqQ+cJXuSnipr+S3uvcC3wt
         p8v13mkj/74XycEYeuuNouLTJjahAlcY+vNRamVRBXOl5attSqIwUS008uN6x3yeq1A0
         tC1BqBQH8F5uRICW/qhAR0xBRHdJaSrPgsp5C5qNQkMXZWBQ9mnIUmVrIHLPL02X2HE1
         oOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749246766; x=1749851566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l//H4CXt+bskKG2N3+2XmPtVrEWbNc6XBDNRfmVrGOo=;
        b=Td5vc7jc4c9qEu+d6jghMa++Jj2loRCdhxd6wT8xj5iR3RvD8KeoH0LlPacyeznN4d
         B7Tqt25KFNiOzs3A1oddF4vH+rG9eQaAZNLJm6d+w7INLsyDB+81/mZZ4BMhjuocMD8K
         JhFFGKbUsKZtSOJYbLQg75KIHTwfl0R+HrjiFb9TDzWPEnvwnTMVdC11UC9rfSDzCMgJ
         HSGJeVd1m0lCDiMhprbCs+75QN/DFqUNpZ7yiWKA9cXThj6cIbh3L7GlS8KY1BSonzqH
         IDitWFCBJsj0vibS0Weyd8Kto0HveMotY2pBvRrHZXFhRxFZgThPiXp+frYgZO4iGidp
         pDuw==
X-Forwarded-Encrypted: i=1; AJvYcCVzW39i51nz6NiTWk5h0qLTFLYPKdYNtmVVInfYqqq/FO26TmJ18+8rnT6aWLF0sqLZaACftc4qjH3CKw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaRFUPiFUfw5bKEaXEfTXXagzlVvm0vr6GeX+eXivRs2GhcZQB
	7mgDxyynpCGW82qtrKFpEbTLfLgazxM0enbjaHvhSNrsw/5CwTRVnEU6YSJKOQBBRaSCrm1vaMR
	GKlDfxBt85sz0G16eDS3mvUd4xn9LhsJ6oMAbgrJx
X-Gm-Gg: ASbGncu6DUwzuJX50RXHcbyiTibORg75UBaqDdp+CZLwvabJ3xYThKxehf9Fyx29f7G
	URj87gEbaJdbjTEqi6o/T/h2xdRiVJ1DZh3BgTETqHKu04MUgYGbOl4MoNLJvaiWH/snpp8iOL9
	xTyVUVowGTzTut6rCNeVZKMKAAXQP/0YJNznOvYopuZqQ=
X-Google-Smtp-Source: AGHT+IH/uUnR2u3HG85mG/PwMPK9b4y20VMsqQ6oo3Gz0Rox33uSS86jPNEYvvAu+MxbM01PnkSiGPg9CCug2O0pLuo=
X-Received: by 2002:a05:6102:458a:b0:4e5:93f5:e834 with SMTP id
 ada2fe7eead31-4e772ade074mr5976100137.24.1749246766424; Fri, 06 Jun 2025
 14:52:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605233934.1881839-1-blakejones@google.com>
 <20250605233934.1881839-2-blakejones@google.com> <aEM71LulKhuEinN6@google.com>
In-Reply-To: <aEM71LulKhuEinN6@google.com>
From: Blake Jones <blakejones@google.com>
Date: Fri, 6 Jun 2025 14:52:35 -0700
X-Gm-Features: AX0GCFusIWvcqKPEJqwjiD87wt-amDm46BQj8HstpaaK8zau_M5bUw3G9ghSJsE
Message-ID: <CAP_z_CgXv1+XA2pLzx999SAXUedcAqZJTZESLmVFd0mCR3go2w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] perf: detect support for libbpf's emit_strings option
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Tomas Glozar <tglozar@redhat.com>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Guilherme Amadio <amadio@gentoo.org>, Yang Jihong <yangjihong@bytedance.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Chun-Tse Shao <ctshao@google.com>, 
	Aditya Gupta <adityag@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Zhongqiu Han <quic_zhonhan@quicinc.com>, Andi Kleen <ak@linux.intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Yujie Liu <yujie.liu@intel.com>, 
	Graham Woodward <graham.woodward@arm.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Ben Gainey <ben.gainey@arm.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Namhyung,

On Fri, Jun 6, 2025 at 12:04=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
> Please check out tmp.perf-tools-next branch which made some changes in
> the area.

Done - v3 is synced with that branch. I'll send that out now.

Blake
