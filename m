Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61A021519B
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 04:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738731506; cv=none; b=TRSHGLule4+71H+jMb+OPC6eMclrgz+HNh2Nj/fEIn0HhzkJw4YBRsWjtzOtgN95NWt9J52lll9JOxz2z5Hxua31x/b7KiTvoe5ehY2iFBc9WRYs0nzatg5ohCGY36K1hkgx8w7mWajIFKNs60/QSZxROlb6jg91SFIZmLXqvCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738731506; c=relaxed/simple;
	bh=9WFzx6J/v5Plw43RdCEUd6Vhg328nO/Nojg4b0wrzWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lWxSpSBmGPU9KQGMPcETZrjD3cuUIEmY+7GF84rK62AMCHttkHZpjSbkVFrufCoBrkTE/3/5dzmpH0hT+0+kq9J+0ZdSoweTVdgslfvJgOtoiqU/KzakcbMk/stS6zJhzYaQ4gZjWyKskz/88ZCgblTPkBOXIMcCHcE6jTSwGMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eHpxrkyj; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eHpxrkyj"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d04b70fe79so131335ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 20:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738731504; x=1739336304; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4hCTtW+UNQasE56z17WAMyt4tEPi3GvC0a1WQoJPkA=;
        b=eHpxrkyj4ExAp0uiYiEpnRnXThXcWccjcOpC8bA9Fa6xEcZwgMv5+FS3o9hF9ngeiW
         5iJiRFvXNAh/yRnNwjsD25OBuakS7kA5Mp+MkpAV2Hxs/w55TLBBf0joMAcw6BF3gG44
         T9vghv2yg3COWmfyYa6hDVh/tfHzTPDIOROvULULcWz2PGE5K0hPli+XrcSPt33+S804
         DXCTfZfF4n3sgyrwQrXuG0sOY1PWhUWjYrlwgGwDehnvQSbcZTW8p0Whib/B+D0sTCYs
         wUVuB1DUHyW9judx2Lg5xayE5pUE3lw4u8KAW7d96QkZeDCIcB7Ljt16Pc7JYdSqPmn5
         FxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738731504; x=1739336304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4hCTtW+UNQasE56z17WAMyt4tEPi3GvC0a1WQoJPkA=;
        b=SI8Orj0nPFgv3zhpeTiUi5i4ZoFryQ2BuXObwI8d58QpCwK2bGJMWTsJTSL7ytywW/
         K+KHn1uZzBfiMDaY/edwgicXdK83uomU5NG6ggk+DrihIJob46tDDHjBQ6qOLuMymQ30
         lG8PrR5tQ/OuDZokWOjyR8gC27wnuU7YOS6rW3utxQECjvKN+Sjcwnrt/tHCbZfsYxzw
         IqusgRphsM6nuVrfsseA/sCMDESERcwQByPqjS8fAa9dbg5xgjsB6oUDFbHyV3KFEv+H
         duPYV7tz18rt0MldJaYmmo4aeZKtP8s1ay4tLsk493ltJcNTeN8Afq3Jec9x4Tj2eabS
         n3Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWONp23mRr4WHBjQBaMyle5rScg5SIWWmp1kxe7sVXulCSfMkrIH1Uhp5hjA+i/siBW96/6d11U63ZdP7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpgxqL5Xdng8Z0Kq1y/Z7zi8B3mPoK8NrPbm4qQecDK1xy11Up
	vuOEH/1eIehbPkTFqcxc3z5m57nJP7Pr/IwR7zf/dHmpiB4EiQ2C0M6DnJ1XzsF0Os2CDONceOu
	kNZhC54dM2GYR+FNvoh6e0Iyj275Ld+ccVkmS
X-Gm-Gg: ASbGnctsntE/uGoxEhiGLM0VoV6tlahC7carGuWEI8gpYob3CDYm1qeaz5s4WPX2FgZ
	lRBTPzIDlGfp4oBVQ13E6Qfdtuj5izdZQKWnJ/ZVcHZdcbpMmf72fE7ONvhy4SsSM44L6EXxFPw
	==
X-Google-Smtp-Source: AGHT+IF7DCtlwiws+AUFDCWEi3ZzJPfywo536Jiu42HJH2ResZCuFJd3GpfNEGoINBVZsPY6DKofge8JxcTbg6yh2Rk=
X-Received: by 2002:a05:6e02:1a01:b0:3cf:fcc5:793c with SMTP id
 e9e14a558f8ab-3d03fbedef4mr6698925ab.16.1738731503647; Tue, 04 Feb 2025
 20:58:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204213259.127939-1-irogers@google.com> <CAP-5=fXpuND+kNe16CJMETkMOW+__eQpB8No0ra5gyEcfqCCKQ@mail.gmail.com>
 <d44036481022c27d83ce0faf8c7f77042baedb34.camel@intel.com>
In-Reply-To: <d44036481022c27d83ce0faf8c7f77042baedb34.camel@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 4 Feb 2025 20:58:12 -0800
X-Gm-Features: AWEUYZnSgAq-mLU5zO-rhdGZGS5UNLRNVu_ntvMGNswSGB_r4g5_i1RrsiHp-8w
Message-ID: <CAP-5=fV8EcxVZR0Be6wb57_VvssE9FYFBTmbd415CqmidGWT7g@mail.gmail.com>
Subject: Re: [PATCH v4 00/23] Intel vendor events and TMA 5.01 metrics
To: "Falcon, Thomas" <thomas.falcon@intel.com>
Cc: "Baker, Edward" <edward.baker@intel.com>, 
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, 
	"Biggers, Caleb" <caleb.biggers@intel.com>, "mpetlan@redhat.com" <mpetlan@redhat.com>, 
	"Taylor, Perry" <perry.taylor@intel.com>, "Hunter, Adrian" <adrian.hunter@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, 
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 
	"kan.liang@linux.intel.com" <kan.liang@linux.intel.com>, 
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "Alt, Samantha" <samantha.alt@intel.com>, 
	"mark.rutland@arm.com" <mark.rutland@arm.com>, "Wang, Weilin" <weilin.wang@intel.com>, 
	"acme@kernel.org" <acme@kernel.org>, "afaerber@suse.de" <afaerber@suse.de>, 
	"jolsa@kernel.org" <jolsa@kernel.org>, "namhyung@kernel.org" <namhyung@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 8:28=E2=80=AFPM Falcon, Thomas <thomas.falcon@intel.=
com> wrote:
>
> On Tue, 2025-02-04 at 13:35 -0800, Ian Rogers wrote:
> > On Tue, Feb 4, 2025 at 1:33=E2=80=AFPM Ian Rogers <irogers@google.com> =
wrote:
> > >
> > > Update the Intel vendor events to the latest.
> > > Update the metrics to TMA 5.01.
> > > Add Arrowlake and Clearwaterforest support.
> > > Add metrics for LNL and GNR.
> > > Address IIO uncore issue spotted on EMR, GRR, GNR, SPR and SRF.
> > >
> > > The perf json was generated using the script:
> > > https://github.com/intel/perfmon/blob/main/scripts/create_perf_json.p=
y
> > > with the generated json being in:
> > > https://github.com/intel/perfmon/tree/main/scripts/perf
> > >
> > > Thanks to Perry Taylor <perry.taylor@intel.com>, Caleb Biggers
> > > <caleb.biggers@intel.com>, Edward Baker <edward.baker@intel.com>
> > > and
> > > Weilin Wang <weilin.wang@intel.com> for helping get this patch
> > > series
> > > together.
> > >
> > > v4: Fix TSC events on hybrid mistakenly specifying the core PMU
> > >     inhibiting the use of the msr PMU.
> > > v3: Fixes for hybrid metrics that were missing PMU. Update to the
> > >     latest events.
> > > v2: Fix hybrid and Co-authored-by tag issues reported by
> > >     Arnaldo. Updates to Lunarlake and Meteorlake events. Addition
> > > of
> > >     Clearwaterforest.
> >
> > Sorry, forgot to add Thomas again.
> > https://lore.kernel.org/lkml/20250204213259.127939-1-irogers@google.com=
/
>
> Hi, I'm seeing some warnings like this and the all metrics test is
> skipped:
>
> Testing tma_info_inst_mix_iparith
> FP issues
> Cannot resolve IDs for tma_info_inst_mix_iparith:
> cpu_core@INST_RETIRED.ANY@ / (cpu_core@FP_ARITH_INST_RETIRED.SCALAR@ +
> cpu_core@FP_ARITH_INST_RETIRED.VECTOR@)
> Testing tma_info_inst_mix_iparith_avx128
> FP issues
> Cannot resolve IDs for tma_info_inst_mix_iparith_avx128:
> cpu_core@INST_RETIRED.ANY@ /
> (cpu_core@FP_ARITH_INST_RETIRED.128B_PACKED_DOUBLE@ +
> cpu_core@FP_ARITH_INST_RETIRED.128B_PACKED_SINGLE@)
> Testing tma_info_inst_mix_iparith_avx256
> FP issues
> Cannot resolve IDs for tma_info_inst_mix_iparith_avx256:
> cpu_core@INST_RETIRED.ANY@ /
> (cpu_core@FP_ARITH_INST_RETIRED.256B_PACKED_DOUBLE@ +
> cpu_core@FP_ARITH_INST_RETIRED.256B_PACKED_SINGLE@)
> Testing tma_info_inst_mix_iparith_scalar_dp
> FP issues
> Cannot resolve IDs for tma_info_inst_mix_iparith_scalar_dp:
> cpu_core@INST_RETIRED.ANY@ /
> cpu_core@FP_ARITH_INST_RETIRED.SCALAR_DOUBLE@
> Testing tma_info_inst_mix_iparith_scalar_sp
> FP issues
> Cannot resolve IDs for tma_info_inst_mix_iparith_scalar_sp:
> cpu_core@INST_RETIRED.ANY@ /
> cpu_core@FP_ARITH_INST_RETIRED.SCALAR_SINGLE@

Thanks Tom, we've gone from a fail to skip - so progress! I think it
actually isn't something to worry about. These metrics are measuring
vector and floating point things. We run a workload, when testing the
metrics, that doesn't have floating point and vector operations. This
causes issues with metrics for these instructions as the counters
don't count anything. Because of this I added some logic to just skip
when we see these failures:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/tests/shell/stat_all_metrics.sh?h=3Dperf-tools-next#n51
but a better fix would be to have a workload with FP and AMX operations.

You could test these metrics work manually, by running something like:
$ perf stat -M tma_info_inst_mix_iparith <benchmark>
where <benchmark> would need to contain FP or AMX instructions.

Thanks,
Ian
