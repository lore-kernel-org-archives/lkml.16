Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53A4171E49
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 18:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743703964; cv=none; b=GYGRXj4bNhBSCxK2LeIwXT2AdhXyCUjTvb5XrJg6SGBEd6/hZwSTzgB/hjlE4kF8jchi/q6zeYcn2UGrpiyum0ETTKo5ZCqH3OvxggL/GzDWI+TKcTFPV23vj+S4Ks+HCfknPSGExqYm9D+izeN8jkJkwICL/w+4H2jOvgHKX8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743703964; c=relaxed/simple;
	bh=xqmZIdIHJa6CMtzPsjIfg+cOQUO+/dCkkINkrtFyZow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DkhGV4/W6zHvR2i9rroP4csFhLAgfLLCVmToQQ7VVpjgOppn5GpwpoKMEqQSQplqos4cAZQk44FDlhVMfzZJZ+RPE94fN3T9RNJSnjH1mUpKxWIv6/HU2a2Wg3t77DbeA67HlFZknzuf98+GvLWoYMXRpbrrBNg9iISvvOktWck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yCUEgSKq; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yCUEgSKq"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2263428c8baso22225ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 11:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743703962; x=1744308762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aLP0XLlIdOnfz+6gWQTE3JCu4R0hFMgWBr7Hokz1iU=;
        b=yCUEgSKqd0FLu3O4PGsatMDtm1gXabrYIpnZpbJTrlj4MN7xILJcEik4WG/0RXYWDC
         Od+u03UuDCQLfWlrsTG5X+3+frTmgkoT60/4OnyBkJbi4GOstQiMd46PpyAyTC8+t+lZ
         56SAv/OUDTbw4Yyv3gPd212o8aKf9Rpr/C50ITjWNaA+fZLVU5Asg3BxLenYSFDoBaT8
         p/s2Oz8jh74FFIJaIbAP3iZNdujrlXahIKIZx+F3LtYL89IAGtrO47nnWieavk1JnTBO
         HBmWuo4wuu469MoMWQh+XzZpv3nRZ8e65ufp9bHDWEaOr0fQpEblHg/tAKX3JWLcNg3d
         iFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743703962; x=1744308762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9aLP0XLlIdOnfz+6gWQTE3JCu4R0hFMgWBr7Hokz1iU=;
        b=qJ51byZdRuYJiiWwT034/MAVvW5OXTuyBeebGfL6d/1QBu4UWmy+HRpeqCMj0Bexgz
         oe84RsbVYkjuZn/1mUSvPhsy1nZHRWcJz7EavUi21L2YFXZ17aucCKTsnVko2NLTgTyO
         krWVWIy6S8k8p1BcjmwvyLzcDJNcOe7OsBqcIxkkOzCTITbzd+Tf7O29G5/fMOZHf6TJ
         JgKTGwbJ1mB/mnXwDYdVKPyZiedNHZy+oBJpjubFLElRv9PcXGNFS2ivXzukeR+4hz8O
         IDxJukE38uaKtPJ4X5/5cKYDM9HLaOOLSsBvNv1p4uR7cnr/AiSrvwJZ9lQvZ1ZMwHnO
         JU2g==
X-Forwarded-Encrypted: i=1; AJvYcCUBQ74dQo1IzTEB1WPn6ehnRdNUWEOUR9g0X03xbJrul4QfxV8HXNxNmqnTjrcmvY+wzRX983UbqXsnKl0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+sLV49CdCzL5T7hcyA8IqC4ClxQfTXCovdgUHseyxl2zr9ENB
	L1o/Ygn7LEkHaz7gdGZZTZHmbqQuJB7Lpn9hQnY+yT4Gk+p3m9VzGFq267onLUaOZjTcJzxFgJO
	AcprJccKVzR0PnVFjCQxPlhSnq2So7VS81SHk
X-Gm-Gg: ASbGncuefH/+LkxQwKxWGNI95VhpmR4pqKbvlUtVEx1jKBRUQGdidNhudsIe4fsvnXs
	1g6QcFolXqMNJVg8kuEB3c0G7fw/ljs4FTBm+lwyovD6lZGlq0oOoJZif1MW/ujMWoHPs9So941
	heCS5ZvqMCnw23H/SDRutHnLR20s0p5ntaYRfnGn9hQFBecKjpqE6pNqSU1+4qgGo=
X-Google-Smtp-Source: AGHT+IFmS4SSl/bqVH8xj8Ga3H3gxrU9ep4gALw80cbCtv3Re7uJHItC77oB0uDI52Su41KeNV8B0zO5PSa27BbQYG4=
X-Received: by 2002:a17:902:b117:b0:223:5696:44f5 with SMTP id
 d9443c01a7336-22a89ea9b2amr232425ad.12.1743703961391; Thu, 03 Apr 2025
 11:12:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401182347.3422199-1-irogers@google.com> <20250401182347.3422199-3-irogers@google.com>
 <Z-6WY4a6RV1bEbNU@thinkpad> <Z-6aoJ3ohVHPsF0A@thinkpad> <CAP-5=fU6E1_8Vzki1dVyb8hDEYOXaSNSrJJkR6AOU8xqvknT8w@mail.gmail.com>
 <Z-6n-3ObiNNLQzFw@thinkpad> <CAP-5=fUg_QmWBRUM4tc7zF-rCP9D5+=AqP_FPPYiFEybhcvbhA@mail.gmail.com>
In-Reply-To: <CAP-5=fUg_QmWBRUM4tc7zF-rCP9D5+=AqP_FPPYiFEybhcvbhA@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 3 Apr 2025 11:12:30 -0700
X-Gm-Features: AQ5f1Jq6jyhFEA6uwJS18mW1i1oQqxvGXhODTfWOqlCuAbO-N4Tt_U86tEKeiKg
Message-ID: <CAP-5=fUkoiZXL3J7A_pjP07fY+vv3Gs0BHXMXxpo1NOngXKtrA@mail.gmail.com>
Subject: Re: [PATCH v1 02/48] tools headers: Silence -Wshorten-64-to-32 warnings
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
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

On Thu, Apr 3, 2025 at 8:45=E2=80=AFAM Ian Rogers <irogers@google.com> wrot=
e:
>
> On Thu, Apr 3, 2025 at 8:23=E2=80=AFAM Yury Norov <yury.norov@gmail.com> =
wrote:
> >
> > On Thu, Apr 03, 2025 at 07:52:45AM -0700, Ian Rogers wrote:
> > > On Thu, Apr 3, 2025 at 7:26=E2=80=AFAM Yury Norov <yury.norov@gmail.c=
om> wrote:
> > > >
> > > > On Thu, Apr 03, 2025 at 10:08:39AM -0400, Yury Norov wrote:
> > > > > On Tue, Apr 01, 2025 at 11:23:00AM -0700, Ian Rogers wrote:
> > > > > > The clang warning -Wshorten-64-to-32 can be useful to catch
> > > > > > inadvertent truncation. In some instances this truncation can l=
ead to
> > > > > > changing the sign of a result, for example, truncation to retur=
n an
> > > > > > int to fit a sort routine. Silence the warning by making the im=
plicit
> > > > > > truncation explicit.
> > > > > >
> > > > > > Signed-off-by: Ian Rogers <irogers@google.com>
> > > >
> > > > I'm the first person in the To list, but only a couple patches in t=
he
> > > > series are related to my area. If you want to move it with me, can =
you
> > > > send bitmaps, bitfields etc. separately?
> > >
> > > Hi Yury,
> > >
> > > If you think it is worthwhile. I did the series to see how prevalent =
a
> > > bug was in perf's code - inspired by Leo Yan fixing an instance of it=
.
> > > I would prefer not to be on the hook for all the kernel warnings :-)
> > > Perhaps casts to avoid changing bitmap_weight's type. Unfortunately t=
o
> > > get to where the perf issues were I needed to clean up header files.
> > > In the bitmap cases the change is just to make implicit casts explici=
t
> > > and I don't know how much value you see in that.
> >
> > Your changes  are technically correct (except for non-synced kernel and
> > tools), make the code cleaner, at least to me, and address pretty valid
> > compiler's concerns. To me, it's worth to apply.
>
> Ok cool. I'll make a separate patch series for them. Sorry for giving
> you such a long patch series with limited signal to noise.

Posted here:
https://lore.kernel.org/lkml/20250403165702.396388-1-irogers@google.com/

Thanks,
Ian

>
> Thanks,
> Ian
>
> > Thanks,
> > Yury
