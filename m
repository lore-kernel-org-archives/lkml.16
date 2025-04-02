Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75495139D0A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743612852; cv=none; b=NH1BeWHn7WLsvRaJJOigNEWLeLASSpFUMLB1gMVw/aKnNiAFrzGqSOy1AcZ6i4oauFIWbGRxw1Tuie4r+GziTUcPwHNjI+4z0N4OkCMTndfv4nhDEuWZcGQ2yD7Spaov6WOeWciZ78u1wP+kA8MTMbOvpRkSlyxlJGdQTmJ/Ts4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743612852; c=relaxed/simple;
	bh=tle6duRwPEEC/Ha2cZUoR+2UZyDqi9zAHSt0TfUBxHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SxZk3LFuH2s//zbtOsSprkFletzn0Wo3+cAyspXLSsQnrFuQPVCAuvsoK871bUsYKKSxuZFT1m1IUBQTSchtASwu6HgaOeL3L9ZJCpGdkk87slcHmrmtetYQYbGim8px879PXwKa1cfpvVnDzV+Swbc0mhqLUDBkzo+U2pG1lGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pGjGoVBV; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pGjGoVBV"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2263428c8baso223635ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 09:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743612848; x=1744217648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqjKQl11kZjyZ0aXwFqo8Ho/IO+qXomdqflXA7OMXxs=;
        b=pGjGoVBVTzpNMKfz54TFElTYGGDnI3xP+IAfOhXweVr9L4cF98q/brLPUtbo6+6meI
         GoWwRFqsl5QrtXQpsOQuJvl45AvMJihS9HW0i1Hyv14+tbh0nXD3a1EpH4HL3nptyKP/
         VwSupniuQb6t18SGGVnNoEvuzclNjkNRQJerQdsL+JZM6zv5mb9yKDCPkjlE8H0jgZYU
         rDuRG96mZ27zywyeLjM7bTleg+GKD3u1SMs7et3oVs/khRKdD2IckvsOCUFKgJd5pIO3
         2rzaKnsGE3tPm9HNOai0Fm2evbAzNs18NMwInpjwxSPOBeyto6MCmqBwBD3RW4mT3ARq
         d7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743612848; x=1744217648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqjKQl11kZjyZ0aXwFqo8Ho/IO+qXomdqflXA7OMXxs=;
        b=g5XMRa/KxEflKNSdvCHOmhhQGn4+pkDy8uyVkvoVTwmjxtfwUBtbys4sA18pM3Hkmu
         /y2PuBWgKuPmJNN729vBIV29AefpjJnzimo8xTBvs792LWpuStLHFIk3gCtdSVEaTgjb
         OnCqnlfw9pfDE8/jGhN98NdYsNN9Njv1RViSG7jBI6QKPoF/ntrgsp/VCPzXstIFaly8
         YVZBu56d6TbQ3OtmPR5TFMO9hG328ZLbURLgMms8lyJsR14fmEK/f09ZrYq5Pzg1uGOl
         qhAsStFMeQK7VU4Sqpu+dRePFogxim5Xi3psutjVkMx93Yq8zeXaDSCenyOYZ5oxgn9T
         oKUg==
X-Forwarded-Encrypted: i=1; AJvYcCWqjXtxLYp/F/K/uBtuqru2HvnBR8Deb2Ml5KdGq6phsrDg9pX0C/SivDPezrdXkc4Jxpx/T5ctHAoyEHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxhZ28sky2YEWkBtq9WBUGw+aEB1EovlZghsypOBCoyjVrxPzt
	f/5J5LU2JgDUwHhNvQ0qjy9MSiCoAmManpxQ6pHDbKc/Ez9VSLWYfv6sxAtbktsGjL5+aMZqdyA
	M7YHfGL/C1Y+d1MemnL5etGW4ouCDLX+qiyKd
X-Gm-Gg: ASbGnctIbK4Ue/6RWXEZVniKQ4vsiDzMJhOTysN5M9nAhVFpJ4mTXLNGDXlbtAD6Z2e
	AEW7shgdz16rzPoOE5I5oH22kCg7qOkM0KUf0glPfxbE+D500W6bxa2QN48/GAn8X//VGhKBCUv
	2cCgcajUxKXGzWkr2+LezHCvluq6jsrSLGsrQQYzxZIvyy9Mf9rurVJQ==
X-Google-Smtp-Source: AGHT+IHMGTEKbDZlRb6V2dq3HbsnXrTWGUpjKL9SDibSI62p5nEhvEuTU3gR331+Azc4os47D0y4V10nwFQkKnpcJc4=
X-Received: by 2002:a17:903:244a:b0:215:8723:42d1 with SMTP id
 d9443c01a7336-22969dca593mr3833475ad.10.1743612848273; Wed, 02 Apr 2025
 09:54:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401182347.3422199-1-irogers@google.com> <20250401182347.3422199-10-irogers@google.com>
 <20250402143541.GM115840@e132581.arm.com> <CAP-5=fVqax8cxdZ4HLBP4AMxL6jADfYNrORC97T6F23mjf3N1w@mail.gmail.com>
 <20250402163807.GP115840@e132581.arm.com>
In-Reply-To: <20250402163807.GP115840@e132581.arm.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 2 Apr 2025 09:53:57 -0700
X-Gm-Features: AQ5f1Jrx_PpgbdF0w_CjiN8USfw20TRsMymiExqPxSfc7wkhTf_DN_Bd6IZx4Mo
Message-ID: <CAP-5=fVJkJ39_qx2T9ZHn-fdxjECP_2G+cyfRRAjLvZZt5vz2A@mail.gmail.com>
Subject: Re: [PATCH v1 09/48] perf tests: Silence -Wshorten-64-to-32 warnings
To: Leo Yan <leo.yan@arm.com>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Yicong Yang <yangyicong@hisilicon.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Kyle Meyer <kyle.meyer@hpe.com>, Ben Gainey <ben.gainey@arm.com>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, 
	Aditya Gupta <adityag@linux.ibm.com>, Eder Zulian <ezulian@redhat.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Kuan-Wei Chiu <visitorckw@gmail.com>, 
	He Zhe <zhe.he@windriver.com>, Dirk Gouders <dirk@gouders.net>, 
	Brian Geffon <bgeffon@google.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Howard Chu <howardchu95@gmail.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Colin Ian King <colin.i.king@gmail.com>, Dominique Martinet <asmadeus@codewreck.org>, 
	Jann Horn <jannh@google.com>, Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Yang Jihong <yangjihong@bytedance.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andi Kleen <ak@linux.intel.com>, Graham Woodward <graham.woodward@arm.com>, 
	Ilkka Koskinen <ilkka@os.amperecomputing.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Hao Ge <gehao@kylinos.cn>, Tengda Wu <wutengda@huaweicloud.com>, 
	Gabriele Monaco <gmonaco@redhat.com>, Chun-Tse Shao <ctshao@google.com>, 
	Casey Chen <cachen@purestorage.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Li Huafei <lihuafei1@huawei.com>, "Steinar H. Gunderson" <sesse@google.com>, Levi Yun <yeoreum.yun@arm.com>, 
	Weilin Wang <weilin.wang@intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, Andrew Kreimer <algonell@gmail.com>, 
	=?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, 
	Steve Clevenger <scclevenger@os.amperecomputing.com>, Zixian Cai <fzczx123@gmail.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Yujie Liu <yujie.liu@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 9:38=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Hi Ian,
>
> On Wed, Apr 02, 2025 at 08:42:58AM -0700, Ian Rogers wrote:
>
> [...]
>
> > On Wed, Apr 2, 2025 at 7:35=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
> > >
> > > On Tue, Apr 01, 2025 at 11:23:07AM -0700, Ian Rogers wrote:
> > >
> > > [...]
> > >
> > > > @@ -478,13 +478,14 @@ static int __cmd_test(struct test_suite **sui=
tes, int argc, const char *argv[],
> > > >       int err =3D 0;
> > > >
> > > >       for (struct test_suite **t =3D suites; *t; t++) {
> > > > -             int i, len =3D strlen(test_description(*t, -1));
> > > > +             int i;
> > > > +             int len =3D (int)strlen(test_description(*t, -1));
> > >
> > > Thanks for huge polish.
> > >
> > > Just a concern from me.  Throughout this patch, the methodology is no=
t
> > > consistent.  Some changes update variable types which is fine for me.
> > >
> > > But the case above it simply cast size_t to int.  Should we update th=
e
> > > variable type as 'size_t' at here?
> >
> > Thanks Leo, I played around with it, but don't mind if someone wants
> > to do it a different way. I was trying to make the changes minimal.
> > The problem typically with size_t is we then use the value, for
> > example, as a printf size modifier and need to introduce lots of casts
> > back to being an int.
>
> This conclusion is not quite right, see:
> https://stackoverflow.com/questions/2524611/how-can-one-print-a-size-t-va=
riable-portably-using-the-printf-family
>
> > When this isn't too great I've done it, but in
> > this case I think keeping the int, the lack of casts but a cast here
> > to capture that we expect test descriptions to fit in the size of an
> > int is the least worst option.
>
> I would say in another way.  After we enabled a compiler warning
> option, this will give us a chance to improve code by dismissing
> the warnings (and avoid potential bugs).
>
> If we use casts just to silence warnings, we also lose the opportunity
> to improve code quality.  The changes in this series that fix type
> mismatches are good, but I think the use of casts is not particularly
> helpful - we're simply switching from implicit compiler casts to
> explicit ones.

Right, but I think changing function parameters, return types would
turn into an epic refactor and the patch series is already unwieldy.
With the casts we can see the behavior is deliberate but that's not to
say it couldn't be better. With the warnings gone it allows
-Wshorten-64-to-32 to find the truly errant 64 to 32 bit implicit
casts. Anyway, I don't have time to do such a larger refactor so
somebody else is going to need to pick that up. I did refactor the
cases where I thought it mattered more, but as you say that does lead
to a feeling of inconsistency in the series.

Thanks,
Ian

> Thanks,
> Leo
