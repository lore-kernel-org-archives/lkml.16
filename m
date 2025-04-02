Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8A71F429C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 22:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743633191; cv=none; b=EE/kGI6wIKi5vjeMBAt/71tHGMErehVUk+xJ7DdjO0xHK/y68OeLeOim1CUzQj35k82s+8L/uqXhkCV0KW2OghjxefGEP64ZiLWTLgL6ufEZIzXfrWRTT5pfREic5FQ9lV1S1qx45dsCs9gVMnKigN2M4K4RAseyZCVimhYW4VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743633191; c=relaxed/simple;
	bh=vpL5MYiXWzk/TTfDMt9SK1ICgCeny9hniT1+NGgwpEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LyV6JMnXy3WS4s35sJ33zbOHschZ9wVY5zezfq6P6KGOyOWbm7qb1LW0g770GvINf3SoPZR1WOwObiB9zWMTojpvkyF/W6NXi7JkHnoRuvZhOWeTs8rVrVyqIsye8tD8tC1wPQIUh5GUoeMB8dLZPyfHjPDBIm3nFe9oAmSNGUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PLZmRflq; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PLZmRflq"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2242ac37caeso235085ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 15:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743633189; x=1744237989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFoV6Jzg/d3+puQvt+e32UWddq8Y5WjF4RLVz5wXa1A=;
        b=PLZmRflqZNKR48f5DMfuCIbGW+t668Er49MVhY8AqRb1GnvlZzHRK6xt2viSpiw1Vr
         oa3sfV8SMn+ZgDZtqpLXwh0vuVFwiVIVTBL6HqK4tnxP+oQotEZDBLIqQVluuEqyrm5V
         5V1H1lyzXqGN3IZ7LRI1Z/OSmQs/UVsFqazfVAQGgeLWDas+h3KmG+rXQzqPsCGcYP0J
         dzswTDSXfVBgWAFY673zu+oSHaCMEO4TuccBWohpPc0UqdOyV8oTzbBiEzf7/dozHmq1
         qfaxe8GgEsOHJq/FP/YPvNpdTNB+P8w33kRLohHJrLd/1ax5pXhyb2zdF6mUn3yjgtHJ
         CVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743633189; x=1744237989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFoV6Jzg/d3+puQvt+e32UWddq8Y5WjF4RLVz5wXa1A=;
        b=RnlMzFHgO6jNWbi0TNROWzxHnQayccPi/LR+YZ3bMWYB+0GieazO8DEXxDMiUlqEDj
         kgKEA5OdRJyY//WSPa0pFIlo4DGfgJXuAkslD36rdz22PsBzAXf2SEGMKHPcawxeHC+I
         7Emtt4/xGZEB2lsEZfZ99m4GszeP4Y90Y/Kq+b3r3HLKNzJWuvqpfQUpuy0WSymjBOBU
         qDDUKKfTEEH0PlIr92uyzEY3gCHD2HifHK+nnRrym8vT+eHQgTHICIyJw8dMpPWB607y
         iFCOWU+A0lluxiQy5VtCUBq7M36gfzafV3E88AGTIp+1ojXNYTMgRHP31Je1wMK53KHH
         J36A==
X-Forwarded-Encrypted: i=1; AJvYcCUaejPE0o7hDtq4a5ZardjcsMQRUUgZdStbwT5sMcIcvoeoa3xb6oU/FHLHPOtuw2KhcHNUoZBC5LRbdgU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ49d05jqTgLwipdr6pPH+vuiYn+HuLj+NGeboLwAdROSWMEx0
	pHM0U+0k/hfeQqqiM46ziv6YF3aiLDDNWsXSe81gXMM/vDL5eKoAwjMFRJm9pbMhFCWaLF0/d26
	XSHByVrvwISJ+6AIbcPUVl8Gqv8UvItyitZAp
X-Gm-Gg: ASbGncscN+9Q3/G9s8d21AZtUi1D4q9+ibSfr/LLp9huBseJVW0Hup99ukgIr5yGudH
	GjGnHnGdbf/+aS6Mcky+kXfkxvpkSxYVQ6h0CA+4vEIDJ+g8Hg9QXSPhet7doiVKr6Gv/HsSFGa
	2gCfzCHPG/SndPdgAgXEZjoTQ/0TGM5MRtaHmCBvgw8hva5rNlvwXmjdXSUnzkOns=
X-Google-Smtp-Source: AGHT+IGeD+R7itL1TPM9ELId2uzX7pKMbUUuKfNfuvM39HjMgfv4HNBG65B/Era82HmhwK2fm9Jftl72TclUySUeWKE=
X-Received: by 2002:a17:902:ecc5:b0:215:65f3:27ef with SMTP id
 d9443c01a7336-22977502490mr1273235ad.12.1743633188346; Wed, 02 Apr 2025
 15:33:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401182347.3422199-1-irogers@google.com> <20250401182347.3422199-10-irogers@google.com>
 <20250402143541.GM115840@e132581.arm.com> <CAP-5=fVqax8cxdZ4HLBP4AMxL6jADfYNrORC97T6F23mjf3N1w@mail.gmail.com>
 <20250402163807.GP115840@e132581.arm.com> <20250402230125.366ac21c@pumpkin>
In-Reply-To: <20250402230125.366ac21c@pumpkin>
From: Ian Rogers <irogers@google.com>
Date: Wed, 2 Apr 2025 15:32:57 -0700
X-Gm-Features: AQ5f1JoGDdvG3SyzAeolredX1Q4rcDlM_rn1uPkwDSeBGYU8h0-XIsAUN3GlKck
Message-ID: <CAP-5=fVMk+1+Jv3OavMwHmm1b0YNZPnmETOW7nTbW9-7tS4MNw@mail.gmail.com>
Subject: Re: [PATCH v1 09/48] perf tests: Silence -Wshorten-64-to-32 warnings
To: David Laight <david.laight.linux@gmail.com>
Cc: Leo Yan <leo.yan@arm.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Peter Zijlstra <peterz@infradead.org>, 
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

On Wed, Apr 2, 2025 at 3:01=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Wed, 2 Apr 2025 17:38:07 +0100
> Leo Yan <leo.yan@arm.com> wrote:
>
> > Hi Ian,
> ...
> > If we use casts just to silence warnings, we also lose the opportunity
> > to improve code quality.  The changes in this series that fix type
> > mismatches are good, but I think the use of casts is not particularly
> > helpful - we're simply switching from implicit compiler casts to
> > explicit ones.
>
> It is certainly my experience (a lot of years) that casts between
> integers of different sizes just make code harder to read and possibly
> even more buggy.
>
> If the compiler really knew the valid range of the value (rather than
> just the type) then perhaps a warning that significant bits were being
> discarded might be more reasonable.
> But even then you don't want anything for code like:
>         hi_32 =3D val_64 >> 32;
>         lo_32 =3D val_64;

There is an instance of this in:
https://lore.kernel.org/lkml/20250401182347.3422199-3-irogers@google.com/

The particular problem that Leo Yan [1] found in the code base is if a
compare function like:

  int cmp(long *a, long *b)
  {
      return *a - *b;
  }

which are typically passed to routines like list_sort, qsort or
bsearch. The subtract is potentially 64-bit and the implicit cast to
32-bit loses the sign information. Generally the problem is more
opaque than this as here you can quite easily see the types of "a" and
"b". If we say we don't warn for implicit truncating assignments then:

  int cmp(long *a, long *b)
  {
      int ret =3D *a - *b;
      return ret;
  }

becomes valid, but it is identical and as broken as the code before.
I'm happy for a better alternative than clang's `-Wshorten-64-to-32`
but haven't found it and I agree it's unfortunate for the churn it
kicks up.

As an aside, I wrote a Java check for this as I found a similar bug in
Android. That check found instances where the subtract and truncate
were happening in a cache that would sort elements deleting the
oldest. Unfortunately the truncation meant it could also be deleting
the newest elements. In Java lossy conversions require a cast so I
could target the warning on casts within compare routines. C of course
has given us a good way to shoot ourselves in the foot with implicit
conversion and -Wshorten-64-to-32 seems to be a good way of avoiding
that particular foot cannon. Making ordering routines use a less-than
comparison avoids the problem in C++.

Thanks,
Ian

[1] https://lore.kernel.org/lkml/20250331172759.115604-1-leo.yan@arm.com/
>     David
