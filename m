Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABCA1EBFFA
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 16:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738255284; cv=none; b=OAWOusFm5ha+Z5uxUlb9SEWkuSnD1o9ns0J9bl+n8Yb8jqZtZqPML1vysot7vRqKqOBpqfI9m0wqqMlBOEFLc65KMjgyvkMw1gE/ocpLhDMgn1Y/H4K7c31al5M40i0bVa73iFJFKuqoiFH1hKpchD3uOnOL/nZqtE+dPDSIHqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738255284; c=relaxed/simple;
	bh=ZItmoUSrezmWaSrGmd9zJrY5IS4u22ZGs81RzNgZe6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=it0qJii0PXyWu3JSrVmeetZ0fI/feTz+UY4aNge1zLStLRbJ/ILell/4TeTm9I52V//ie9z/4YdZGliF1yqpkrCKXUNIWyS+qgyqKls4unQbYE54eqIbAM4Ph4J/SdgjkSvBxqa7dNZdUIaicIajCxV3Hozhs/cTxkJnkOAs38w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VXt9AWy6; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VXt9AWy6"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3ce82195aa0so167895ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 08:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738255281; x=1738860081; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wMQsnr2uFsr4X07RVHYhMP0NI/4Zw3OWxDmZwurf3E=;
        b=VXt9AWy6oBtcWbVCs7XTs92lBWYmCeiVCKzSRYHZGhkrHvnqLuvt6GBJPRLr4jeUME
         BXjqoUQ3vnZZSEKc+/Nol0Ex4ISULcsnReBOcoU5q3jjxy40IhiupdZ9vzoUlvQC1gz4
         sjFdl8l5lxxdAoQuSkSFJ2myIAUlQxTRKgegstZmPGsN4xVtbH/8DDvlgrUPcR2fSnxk
         GqrvOWqmFbLbjk8R6H2KuM6i7s06ao6J6ID4TPyZ2IMeEyo1yXf0tQoV72Guqk+Lm+oO
         FciEK+D41Bz5Ad/D+w4ZJhKTJWzA7nQPQ+DpaZVQZvw27BYIXanLbJEXMK+QLYY30zFF
         Ub6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738255281; x=1738860081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4wMQsnr2uFsr4X07RVHYhMP0NI/4Zw3OWxDmZwurf3E=;
        b=MOyC99JJN+fB8mWTanv8veBUq/l3BspjeT7hECygQJlsz6Z4e4JbIwE2tz2cwWzJru
         kwWSTEDxIxB3aBoyDxFF8qttuxYbZWjVCB+xLFDResl5xv0l+3I0jfdhSZvdHH0MSCoz
         AXZtPCx5fJNnhX5Ht+vgx0IiC2vplBDeC0FRiNu3VqgrSWYmkKpCljurC1U2FniPdFSu
         LGHSwYXfq4ENiQS7m2qTPENgyVHFj4TvZkeqtXVnTDf47syhhXU3LwMDEWIOr2xCc6s4
         S1i+YHZi6VG8SBzcaLXOsXxNRn7hiv8sMZlzNzRZy9IC2lyEuDq4skjyxnqPzB3szLXQ
         8Lzw==
X-Forwarded-Encrypted: i=1; AJvYcCXFVH7Ihqeq0MDg44BjhAkZLyOdiPAt9jTEJEXbCYBbq56mbs2tCzoXnGwWLXdzo8t5UFojJXzR7ZAxmlg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxukA92E65b75apX1G36H/WKGbgb16D/QyeQ1h54+1mfxFrjVqH
	i+s/a9nxa6s4kvvKue5UNCeuRPNWOp6GoGHOGSbLrqmdM8CWsalHhOy34M5DGw5MAlaRCOkY1ly
	rOBHy2uOqsjHCKpxQD53fcU3CopWcsTg/zL8Q
X-Gm-Gg: ASbGncvQKzCZlBodvoP/178zzzbcyV+6xsB7WXoRv60Z37H16xwVyW/L/6ev7YGcfwv
	0H5I7nSCXxDjDixTOW0dy6m73RBghKXAM4tcACKtohiMqOhOzGn2R509NXDrV6gpgxpFG5hcTaf
	soFHDNTl752mbBSLfi+O4QmP4f
X-Google-Smtp-Source: AGHT+IHegSarmb1U3KGrFXHDklrdcsFlO22m5Npd0XXTwOoca3eq99QXVlSOsp+at1UZC5VcBm7cVZDYKgl4hTWBIO8=
X-Received: by 2002:a05:6e02:12c7:b0:3ce:79c5:56e0 with SMTP id
 e9e14a558f8ab-3d00a937efemr2968265ab.9.1738255281292; Thu, 30 Jan 2025
 08:41:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128043739.256305-1-irogers@google.com> <838b1fe1a3a303db5b050c787160a77a96e24ca5.camel@intel.com>
In-Reply-To: <838b1fe1a3a303db5b050c787160a77a96e24ca5.camel@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 30 Jan 2025 08:41:10 -0800
X-Gm-Features: AWEUYZlJujF0yaOuFA97YCYQLB0Ium46iyXmBFSU8I0VYjLgXLTi1shfvJbmM54
Message-ID: <CAP-5=fXSupL7xLgpRmey=VpG1azcxQ9851-WRtFMO72ny+Ni-A@mail.gmail.com>
Subject: Re: [PATCH v2] perf test: Skip Intel TPEBS under hypervisor
To: "Falcon, Thomas" <thomas.falcon@intel.com>
Cc: "james.clark@linaro.org" <james.clark@linaro.org>, 
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, 
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "acme@kernel.org" <acme@kernel.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, 
	"Hunter, Adrian" <adrian.hunter@intel.com>, "namhyung@kernel.org" <namhyung@kernel.org>, 
	"jolsa@kernel.org" <jolsa@kernel.org>, "kan.liang@linux.intel.com" <kan.liang@linux.intel.com>, 
	"Wang, Weilin" <weilin.wang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 9:57=E2=80=AFAM Falcon, Thomas <thomas.falcon@intel=
.com> wrote:
>
> On Mon, 2025-01-27 at 20:37 -0800, Ian Rogers wrote:
> > Intel TPEBS test skips on non-Intel CPUs. On Intel CPUs under a
> > hypervisor the cache-misses event may not be present. Skip the test
> > under this condition.
> >
> > Refactor the output code to be placed in a file so that on a signal
> > the file can be dumped. This was necessary to catch the issue above
> > as
> > the failing perf record command would fail without output.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
>
> Hi, sorry, but I'm unable to apply this patch to perf-tools or perf-
> tools-next? What repository should I use to test this?

Hi Tom,

sorry for this. I'll rebase/squash Google's patches [1] for this test
and resend as v2. I hadn't realized how much was missing when sending
this.

Thanks,
Ian

[1] https://github.com/googleprodkernel/linux-perf/commits/google_tools_mas=
ter/tools/perf/tests/shell/test_stat_intel_tpebs.sh

> Thanks,
> Tom
>
> > ---
> > v2: Fix lost :R and use :p with record as it is ignored by perf stat.
> > ---
> >  .../perf/tests/shell/test_stat_intel_tpebs.sh | 36 +++++++++++------
> > --
> >  1 file changed, 22 insertions(+), 14 deletions(-)
> >
> > diff --git a/tools/perf/tests/shell/test_stat_intel_tpebs.sh
> > b/tools/perf/tests/shell/test_stat_intel_tpebs.sh
> > index 695dcb93bb5e..a330ecdb7ba5 100755
> > --- a/tools/perf/tests/shell/test_stat_intel_tpebs.sh
> > +++ b/tools/perf/tests/shell/test_stat_intel_tpebs.sh
> > @@ -20,31 +20,39 @@ then
> >    exit 2
> >  fi
> >
> > +stat_output=3D$(mktemp /tmp/__perf_stat_tpebs_output.XXXXX)
> > +
> >  cleanup() {
> > +  rm -rf "${stat_output}"
> >    trap - EXIT TERM INT
> >  }
> >
> >  trap_cleanup() {
> >    echo "Unexpected signal in ${FUNCNAME[1]}"
> > +  cat "${stat_output}"
> >    cleanup
> >    exit 1
> >  }
> >  trap trap_cleanup EXIT TERM INT
> >
> > -# Use this event for testing because it should exist in all
> > platforms
> > -event=3Dcache-misses:R
> > -
> > -# Hybrid platforms output like "cpu_atom/cache-misses/R", rather
> > than as above
> > -alt_name=3D/cache-misses/R
> > +# Event to be used in tests
> > +event=3Dcache-misses
> >
> > -# Without this cmd option, default value or zero is returned
> > -#echo "Testing without --record-tpebs"
> > -#result=3D$(perf stat -e "$event" true 2>&1)
> > -#[[ "$result" =3D~ $event || "$result" =3D~ $alt_name ]] || exit 1
> > +if ! perf record -e "${event}:p" -a -o /dev/null sleep 0.01 >
> > "${stat_output}" 2>&1
> > +then
> > +  echo "Missing ${event} support"
> > +  cleanup
> > +  exit 2
> > +fi
> >
> >  test_with_record_tpebs() {
> >    echo "Testing with --record-tpebs"
> > -  result=3D$(perf stat -e "$event" --record-tpebs -a sleep 0.01 2>&1)
> > +  if ! perf stat -e "${event}:R" --record-tpebs -a sleep 0.01 >
> > "${stat_output}" 2>&1
> > +  then
> > +    echo "Testing with --record-tpebs [Failed perf stat]"
> > +    cat "${stat_output}"
> > +    exit 1
> > +  fi
> >
> >    # Expected output:
> >    # $ perf stat --record-tpebs -e cache-misses:R -a sleep 0.01
> > @@ -57,16 +65,16 @@ test_with_record_tpebs() {
> >    #                  0      cache-misses:R
> >    #
> >    #        0.013963299 seconds time elapsed
> > -  if [[ ! "$result" =3D~ "perf record" ]]
> > +  if ! grep "perf record" "${stat_output}"
> >    then
> >      echo "Testing with --record-tpebs [Failed missing perf record]"
> > -    echo "$result"
> > +    cat "${stat_output}"
> >      exit 1
> >    fi
> > -  if [[ ! "$result" =3D~ $event && ! "$result" =3D~ $alt_name ]]
> > +  if ! grep "${event}:R" "${stat_output}" && ! grep "/${event}/R"
> > "${stat_output}"
> >    then
> >      echo "Testing with --record-tpebs [Failed missing event name]"
> > -    echo "$result"
> > +    cat "${stat_output}"
> >      exit 1
> >    fi
> >    echo "Testing with --record-tpebs [Success]"
>
