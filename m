Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820AC26ACD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 23:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744239899; cv=none; b=mEzXuNuu8D6MQC+sgxOhnNEHT1TPqt9CEycAHJ6yeWQowvo4S8z4hYSOaw7eTdnWGfOOZu3y1b6DrGtCtVwREt8HO1knRzXocruTGtC2EZg5Nl02o2V6quJCOgSXgpx/eKk2cwuVqMAwHSSFViW/uFFftln8+ID/GNJh2ZWlHZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744239899; c=relaxed/simple;
	bh=M8euG6Cb9yLY+gX0DBviI2rTzbf7tBFWu7pJSIj0gW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EM1ZztLQvGlmjCgoFNgnLyBa7/0bwc/CTXsc0LyzNrYMVjqlBJ4Bfal/s/Z9zius9BRix1m8lp8RNyKkTK1LeXnh0HsqI7QtdKFroZpaWCHBhBYPW4tiIR9oEMN0z50o/ksREl5HJwu89RA2wP49hikngeH/dPeCbNnV4omQ+0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rleAVxj1; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rleAVxj1"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e5372a2fbddso175366276.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 16:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744239896; x=1744844696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNjUs6XU2rn1mMk8Yn7hpJsK89wM3eJVH3qeUPXcNVo=;
        b=rleAVxj1Qz71ElaTk0XIWDlkKKPh27yk8yLBW+1kWN6vuJ0Q2BLxxgPki6f624VkUu
         KNfA3+TFZMQSgcibc4xRMazu0uxli/FdsgLgM0aTP5mlWt+XmCCiMTpll1pI5zAmJrsU
         M7jzjcudq4xTQ5O2oEOzK/D3Ye63whYxfa6Aop/Qn+95mFDxdNSmBBY9QzWjayeYLVkX
         l5cZgZVrUPgnEG8Ha5XW3c1OJoIASZ3p4wvcCUtRTietbeUHZEQG6UxeuPjWd2qCNAPW
         GOFuz/h0uBtnjEYl+K0hfRjI9xVHG4+p9nHYAUOuZ5lyWq+IaqaDSoKFW2LEVZ07jSBh
         I05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744239896; x=1744844696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNjUs6XU2rn1mMk8Yn7hpJsK89wM3eJVH3qeUPXcNVo=;
        b=Fn886lnmtGq9Q4gKt84jVfdByQdfzcXwNTzvvzqejIebBRNlgRi1ASIVr8WcvrMUz5
         5itahs61FSrr1OblXq5naSUxbt+CvARmmSgqQcxKWSQR9jJievqrymDtzTK+HNY8Q/Ao
         kVPy5m7oDWKIywtauDrifCIaKi9DTexXC/IxAJrlMnX496Z8F7QkRrDp0u8wGlB2729B
         rv8fwykvFU4IbR8hWt/qo0Hmgq2A+cTO8ShopLMcOpaFFdQq9brKMMPw5hDD5YQDF1zn
         al+mNa25mpGLoeNlujPpYzVfvJzTylco7/UjCvqFy/62LfCtJqrOneyyEYJI07U3MG6P
         dz0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1VL+peO0yMzRTWeZ7DlzbUxBtRrjehRS1SXDCkC9/kePGsX0FJcvDnR925g8zAY5oHu9ac/iumC8u6Ig=@vger.kernel.org
X-Gm-Message-State: AOJu0YztVH6ZVXhnHZA4aur2OTZy3Gor4vP3vd5FX9rKJ1TbdgX/7rYa
	fHmWzA2I3TC3keYphkixshihr1tuhJHtpJKZSHUEB4IEMBg0fxO7lCoSYE/iZyJZsCCDXFkz3AZ
	6QudEhjhLDEMoj3+KPQ5GFeEKkq4Ewrgi7ULm
X-Gm-Gg: ASbGnctEUC2SAFeyYgunociduD4COoxtushIwHkrQeBW/FDDPqqeDgwVzhv4rv8fpEy
	3t4sX9A1nLmOQflqDIggGFM2mHRGfRRaAtZaZgQ7FQmW+bvNs/nLjOj3JyA8cDjoyj28kppb8uW
	AkZRiorB3+gJHp3mAyiI8+6WijXoljnO/2O81QyTYjQepCHoB19NO5
X-Google-Smtp-Source: AGHT+IGrDhpUclWCMg3weePPkPQkDodfRBFmaFjFijxAl1uyWAWaR0AuJmPV+KW63jJ/sOLRVjXXIfLlubvHvqLniNY=
X-Received: by 2002:a05:690c:640f:b0:6f9:441e:6cf0 with SMTP id
 00721157ae682-70549e74cbemr8538627b3.5.1744239896122; Wed, 09 Apr 2025
 16:04:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331213025.3602082-1-jthoughton@google.com>
 <20250331213025.3602082-4-jthoughton@google.com> <CALzav=eUpVLeypEB2q9vgNOmREb0TCOtjGGpj7pH5o5oLvB19w@mail.gmail.com>
In-Reply-To: <CALzav=eUpVLeypEB2q9vgNOmREb0TCOtjGGpj7pH5o5oLvB19w@mail.gmail.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 9 Apr 2025 16:04:19 -0700
X-Gm-Features: ATxdqUGp_zXu7J9NbBDFgMeyjsbAVc6ZBnJUFt-WboY9tx6z9KNw5VDSjcMhEAA
Message-ID: <CADrL8HVo4GvF81dnzvA-a6_XYxqT0CnTwp0Ap8ecW=CeT_2VDQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] cgroup: selftests: Move cgroup_util into its own library
To: David Matlack <dmatlack@google.com>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, mkoutny@suse.com, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Yu Zhao <yuzhao@google.com>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 5:18=E2=80=AFPM David Matlack <dmatlack@google.com> =
wrote:
>
> On Mon, Mar 31, 2025 at 2:30=E2=80=AFPM James Houghton <jthoughton@google=
.com> wrote:
> >
> > KVM selftests will soon need to use some of the cgroup creation and
> > deletion functionality from cgroup_util.
> >
> > Suggested-by: David Matlack <dmatlack@google.com>
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> >  tools/testing/selftests/cgroup/Makefile       | 21 ++++++++++---------
> >  .../selftests/cgroup/{ =3D> lib}/cgroup_util.c  |  2 +-
> >  .../cgroup/{ =3D> lib/include}/cgroup_util.h    |  4 ++--
> >  .../testing/selftests/cgroup/lib/libcgroup.mk | 14 +++++++++++++
> >  4 files changed, 28 insertions(+), 13 deletions(-)
> >  rename tools/testing/selftests/cgroup/{ =3D> lib}/cgroup_util.c (99%)
> >  rename tools/testing/selftests/cgroup/{ =3D> lib/include}/cgroup_util.=
h (99%)
> >  create mode 100644 tools/testing/selftests/cgroup/lib/libcgroup.mk
> >
> > diff --git a/tools/testing/selftests/cgroup/Makefile b/tools/testing/se=
lftests/cgroup/Makefile
> > index 1b897152bab6e..e01584c2189ac 100644
> > --- a/tools/testing/selftests/cgroup/Makefile
> > +++ b/tools/testing/selftests/cgroup/Makefile
> > @@ -21,14 +21,15 @@ TEST_GEN_PROGS +=3D test_zswap
> >  LOCAL_HDRS +=3D $(selfdir)/clone3/clone3_selftests.h $(selfdir)/pidfd/=
pidfd.h
> >
> >  include ../lib.mk
> > +include lib/libcgroup.mk
> >
> > -$(OUTPUT)/test_core: cgroup_util.c
> > -$(OUTPUT)/test_cpu: cgroup_util.c
> > -$(OUTPUT)/test_cpuset: cgroup_util.c
> > -$(OUTPUT)/test_freezer: cgroup_util.c
> > -$(OUTPUT)/test_hugetlb_memcg: cgroup_util.c
> > -$(OUTPUT)/test_kill: cgroup_util.c
> > -$(OUTPUT)/test_kmem: cgroup_util.c
> > -$(OUTPUT)/test_memcontrol: cgroup_util.c
> > -$(OUTPUT)/test_pids: cgroup_util.c
> > -$(OUTPUT)/test_zswap: cgroup_util.c
> > +$(OUTPUT)/test_core: $(LIBCGROUP_O)
> > +$(OUTPUT)/test_cpu: $(LIBCGROUP_O)
> > +$(OUTPUT)/test_cpuset: $(LIBCGROUP_O)
> > +$(OUTPUT)/test_freezer: $(LIBCGROUP_O)
> > +$(OUTPUT)/test_hugetlb_memcg: $(LIBCGROUP_O)
> > +$(OUTPUT)/test_kill: $(LIBCGROUP_O)
> > +$(OUTPUT)/test_kmem: $(LIBCGROUP_O)
> > +$(OUTPUT)/test_memcontrol: $(LIBCGROUP_O)
> > +$(OUTPUT)/test_pids: $(LIBCGROUP_O)
> > +$(OUTPUT)/test_zswap: $(LIBCGROUP_O)
> > diff --git a/tools/testing/selftests/cgroup/cgroup_util.c b/tools/testi=
ng/selftests/cgroup/lib/cgroup_util.c
> > similarity index 99%
> > rename from tools/testing/selftests/cgroup/cgroup_util.c
> > rename to tools/testing/selftests/cgroup/lib/cgroup_util.c
> > index 1e2d46636a0ca..f047d8adaec65 100644
> > --- a/tools/testing/selftests/cgroup/cgroup_util.c
> > +++ b/tools/testing/selftests/cgroup/lib/cgroup_util.c
> > @@ -17,7 +17,7 @@
> >  #include <unistd.h>
> >
> >  #include "cgroup_util.h"
> > -#include "../clone3/clone3_selftests.h"
> > +#include "../../clone3/clone3_selftests.h"
> >
> >  /* Returns read len on success, or -errno on failure. */
> >  static ssize_t read_text(const char *path, char *buf, size_t max_len)
> > diff --git a/tools/testing/selftests/cgroup/cgroup_util.h b/tools/testi=
ng/selftests/cgroup/lib/include/cgroup_util.h
> > similarity index 99%
> > rename from tools/testing/selftests/cgroup/cgroup_util.h
> > rename to tools/testing/selftests/cgroup/lib/include/cgroup_util.h
> > index 19b131ee77072..7a0441e5eb296 100644
> > --- a/tools/testing/selftests/cgroup/cgroup_util.h
> > +++ b/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
> > @@ -2,9 +2,9 @@
> >  #include <stdbool.h>
> >  #include <stdlib.h>
> >
> > -#include "../kselftest.h"
> > -
> > +#ifndef PAGE_SIZE
> >  #define PAGE_SIZE 4096
> > +#endif
> >
> >  #define MB(x) (x << 20)
> >
> > diff --git a/tools/testing/selftests/cgroup/lib/libcgroup.mk b/tools/te=
sting/selftests/cgroup/lib/libcgroup.mk
> > new file mode 100644
> > index 0000000000000..12323041a5ce6
> > --- /dev/null
> > +++ b/tools/testing/selftests/cgroup/lib/libcgroup.mk
> > @@ -0,0 +1,14 @@
> > +CGROUP_DIR :=3D $(selfdir)/cgroup
> > +
> > +LIBCGROUP_C :=3D lib/cgroup_util.c
> > +
> > +LIBCGROUP_O :=3D $(patsubst %.c, $(OUTPUT)/%.o, $(LIBCGROUP_C))
> > +
> > +CFLAGS +=3D -I$(CGROUP_DIR)/lib/include
> > +
> > +EXTRA_HDRS :=3D $(selfdir)/clone3/clone3_selftests.h
> > +
> > +$(LIBCGROUP_O): $(OUTPUT)/%.o : $(CGROUP_DIR)/%.c $(EXTRA_HDRS)
> > +       $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
> > +
> > +EXTRA_CLEAN +=3D $(LIBCGROUP_O)
> > --
> > 2.49.0.472.ge94155a9ec-goog
>
> This works since KVM selftests already have a lib/ directory. But if
> it didn't, the KVM selftests would fail to link against
> lib/cgroup_util.o. To future proof against using this from other
> selftests (or if someone were to add a subdirectory to
> selftests/cgroup/lib), you can add a rule to create any missing
> directories in the $(OUTPUT) path:
>
> LIBCGROUP_O_DIRS :=3D $(shell dirname $(LIBCGROUP_O) | uniq)
>
> $(LIBCGROUP_O_DIRS):
>         mkdir -p $@
>
> Then add $(LIBCGROUP_O_DIRS) as a dependency of $(LIBCGROUP_O).

Indeed, thanks David! Applied your change exactly as described.
