Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFBA2500D0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691979; cv=none; b=Vs0epflU5r3nDVy2SylsT0zbQ9MvwmDr58DNFouvzhh8IthinKumZzi+Xk57D/2Gng5BsgVuLJu583lHC1UjCswjWq0eCmu9wippOc76wa+iiLX3JQx/f6I7FwdSsPOGhXQzbgKGHyJ0vYccnsO8vGZgTlqHJHtOIQH7n4dGAf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691979; c=relaxed/simple;
	bh=y/OB6K/Bt9NHwRPTlL/+qoZXBtgHIxGLUDZgy2E3y7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+uNtmUK2VEXTjQtH1ovcZ2kBDJSZuzzl5xM6IsRqQ2gxQ+F37A/Me6NQClW7ds78NBvY7uSmBfiEQgYpS8aDlnLbEeYMeBKk9mkb1JDdpRB9Z21/3ufHEsjGRA+sjFMnMN0coZuSVTqRpWNKitkedTndy1jbUyZAAjb+x1eYlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p9vh2Kug; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p9vh2Kug"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2264c9d0295so467435ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743691977; x=1744296777; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/OB6K/Bt9NHwRPTlL/+qoZXBtgHIxGLUDZgy2E3y7U=;
        b=p9vh2KugLICC88VACCLx97S8CKRoAqKDKfpV4wClzstSr5hSOvQdbw2pIOW9bLOhxN
         mKWZy0Uo1nFv83KOgqP4GbzJD3kP4N13LoSka7annmAjCoQQ5wa9SHlK316W+psePYN/
         9mLl5lGxqEXkSpEBy/JAE5sLZS2JBrOx8MNSn6rsWnLSUJjISiIOsCMEtvmHKqJclwO5
         DNJVRsdBvl0BW6BHvjpuxEX+3H+paqQoNnnBl/E/e/KGAtyRJzIYHhouoCWWsLaPaCqf
         C6hUhrLRhR/v593XKWZJYcBCbMfTUSpswTit5b27QyJExBvFeGjamdiV0GyZyxPHMIQS
         WRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743691977; x=1744296777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/OB6K/Bt9NHwRPTlL/+qoZXBtgHIxGLUDZgy2E3y7U=;
        b=tvJcs+B5cDHnJ31gN0EpHj2W8v1Aj5Z+RsKgF8Rw8VSFj2xUQPdBeIupNs86WPBSma
         MYMyN8+r/nJUmh8n10VYOA0vu/KYPIj4oBejq5WfJJVcSVJTHWsc+kViflXWM9ZdIAGk
         kluS9h9bTX70qnTzfpS/tWUA5xJ0Z48SZtOwakFxSyidwC6CEHdxYFc5cj6Gfi4ybJW1
         IYDGGA0z2H/OseZp1zucDQ5CfBwz/sGT+bI1CBobjdrWousOh5TeWng/h/N5fUCMBVWp
         9ZCBXDCMYsGT/bLFm1i9oP/vi/iIhQrEZk2a907vGHEL8Wpa81vZU6Yil6O7NN5fR4VM
         jYjg==
X-Forwarded-Encrypted: i=1; AJvYcCUzW7AsLjRoEPzAKDqCLO/aWKLFiazLSmfcVBHeqSfXsjeJQu3vhwh833xOOc+mlZN/uyDIx2pITEoy+uc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywggmd1/eo9doYwM+suA0R9JzDyi2vOQDbBE82fx1FANnP3Cw+I
	CimD5Hi2YL4mRfVXfsA37XaBuBkygdxKY4WYT3EP4hrSu0Su/WtKItk6OZ9xHM7CEl9Z8M7sQa8
	NovR46GITEJJ6wdKH6mpf9jLO+qfLOrpWA+5p
X-Gm-Gg: ASbGnculWjs3bDNxjOLcMIZnqcWZBY3OFRg+FVBysit7QEA30+Joq5jt++0QC0FWMTc
	jFpqB+5sT+9tlXPnS8FWQ/0bZvyssqOcRc2gzhkZKh1tX6PmPczp1/mHsKl0KehSJ+6KEKIURk4
	3z33ObGwmdHljGgYxCsEZz4XILHKI37RnnQWmyhkAt4Y4KlNKKZChqAGUJxPbbP1w=
X-Google-Smtp-Source: AGHT+IGBznY/8m5rawZtAo3k2V++TsAKT/0vx3dFqX9aObHv2lNamccGJt6Wk28kpxn8mM8r33MXa1pRk8VeuY1C0/k=
X-Received: by 2002:a17:903:2284:b0:21f:9f4:4a03 with SMTP id
 d9443c01a7336-22978359fc0mr2645425ad.21.1743691976467; Thu, 03 Apr 2025
 07:52:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401182347.3422199-1-irogers@google.com> <20250401182347.3422199-3-irogers@google.com>
 <Z-6WY4a6RV1bEbNU@thinkpad> <Z-6aoJ3ohVHPsF0A@thinkpad>
In-Reply-To: <Z-6aoJ3ohVHPsF0A@thinkpad>
From: Ian Rogers <irogers@google.com>
Date: Thu, 3 Apr 2025 07:52:45 -0700
X-Gm-Features: AQ5f1JpXXdneR9py5d-4DyJqYcvkSLXJ0YA323VzpF-AA2iLPosnMDICafKsgoE
Message-ID: <CAP-5=fU6E1_8Vzki1dVyb8hDEYOXaSNSrJJkR6AOU8xqvknT8w@mail.gmail.com>
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

On Thu, Apr 3, 2025 at 7:26=E2=80=AFAM Yury Norov <yury.norov@gmail.com> wr=
ote:
>
> On Thu, Apr 03, 2025 at 10:08:39AM -0400, Yury Norov wrote:
> > On Tue, Apr 01, 2025 at 11:23:00AM -0700, Ian Rogers wrote:
> > > The clang warning -Wshorten-64-to-32 can be useful to catch
> > > inadvertent truncation. In some instances this truncation can lead to
> > > changing the sign of a result, for example, truncation to return an
> > > int to fit a sort routine. Silence the warning by making the implicit
> > > truncation explicit.
> > >
> > > Signed-off-by: Ian Rogers <irogers@google.com>
>
> I'm the first person in the To list, but only a couple patches in the
> series are related to my area. If you want to move it with me, can you
> send bitmaps, bitfields etc. separately?

Hi Yury,

If you think it is worthwhile. I did the series to see how prevalent a
bug was in perf's code - inspired by Leo Yan fixing an instance of it.
I would prefer not to be on the hook for all the kernel warnings :-)
Perhaps casts to avoid changing bitmap_weight's type. Unfortunately to
get to where the perf issues were I needed to clean up header files.
In the bitmap cases the change is just to make implicit casts explicit
and I don't know how much value you see in that.

Thanks,
Ian

> Thanks,
> Yury
