Received: from mail-qt1-f202.google.com (mail-qt1-f202.google.com [209.85.160.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDD217BB21
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 18:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743098877; cv=none; b=eNB9HqP1wBVllbLonSekGXsYaJj92FJGi59TBEdADA/vnraumQFuOKOJJxVXPwl4nF5oqFifJxGgORnD/8k2yuDTK4AfF4bKYft+uP/lPL3q2fOW5WBSVa4XSud1Hz/3D7Tv2FoVAAIvWSlfd9jmv689Pr43XxeMyIAOaoHntzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743098877; c=relaxed/simple;
	bh=FFw5jVGVjWP/GUcE+gD57gEpEJu0gzTYL/Vm74NKgAE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gcikOasb+cylTKv7NU/qNaDSerqByhzW3IXkPtxOWxE0KQDXpSmemxN9+M35lPYIIxPlyU3CVIWpXAfAp1Q/v0VEKL6SQiG05c0VjRHFn/Bezp3JRCugxeZodwEUBAUc+DFkq7UO9IfnVM2ZbXuUBhe7EBoiaF5ylC5QcxMaOY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0uXjl5rw; arc=none smtp.client-ip=209.85.160.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0uXjl5rw"
Received: by mail-qt1-f202.google.com with SMTP id d75a77b69052e-476a44cec4cso20612901cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 11:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743098874; x=1743703674; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNHhGbcNFe9IvxKegRUJgU6d0SStVr5clQydvbl1alA=;
        b=0uXjl5rwxVBQhweW9GwBi94rXFQmmkxoO2AAeTIBnZd40lrIqaxCtr3ba2Qn56xRRL
         Bflikq4fbnPrBFQlVE0qHj5r9nI8+KidyPNxdxijKukRkf80kjwb8T0Bw9Ughfbb6VoZ
         z5S/LskWMppf3wiZBf5IEDhTcOvIHaAHgdGSu7iF/Deqw6gFsYVFXuFSsT2zxPzpBY+J
         g2RkffkvQNbhKxLIFAdRnuiPu+4jYxmVQv5oMTRPKAWnzPI5xkCBbSrrSdJjrrtUxwQu
         /1A1Mf3f8xyhf0l3kJaW2kTLyt42RLp/tWYNYwS/Ce2MZs0whWd9IGeiO6JC8CO2PzXe
         SnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743098874; x=1743703674;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FNHhGbcNFe9IvxKegRUJgU6d0SStVr5clQydvbl1alA=;
        b=nIgmkoEPtVN6N/6QvQqSpKS/cAyaiuFKUa49aC6Q7GQnf5bxmVMR2gWHOcr/qNe4J/
         YBz733+nmlwcynQ85f2Ya4pSyNecVj+5xfpW4sUeqv6zx1xFyI5IkRD+PSn7omQG0eYi
         y2BMM+bJbXLTxm/785N5FckYzD63igW+D7LSTFSfN5Qfg03gyiV7k9oDXZSKj6GWSOxE
         87m+iA9z2b96ATTduqy44OyzHWRvZGFFEvzh2XVHnojHjexI44eyx7rEoVjhW88cb5QF
         ygAeV1oQ6KxSMTJwFPELAl6r+bmkCs79yCO7a44vN0xhKAv45Rgmi8dpUg0A0If2L232
         dLew==
X-Forwarded-Encrypted: i=1; AJvYcCUDl6dVBB03inIOzPxSeoM3TECf/XZK0L7/eAa3QM3K2sbPHo4yxpXFBdGAmoWC4P6Fu135qOhaGbW7p3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS2meRKe0IDnrnVTrLF3W/Kbjl+irP4ZurSw7TEn2OupXW7ZCI
	TIvkyKgU7talKnNh4BgAP8XseP+MPxRaUlRQbOxvpWGNTZ2iYXn4dZxxxeAC5ybXm7mLZqkFe3B
	pQb0yTr2Z6VkyUd7xAA==
X-Google-Smtp-Source: AGHT+IHhR1AcX7MOyjilKRGwXaffZLhxfuTjulaccN51vv9gMpKZONM4saJU+yWDYPnnHE9lipgeoqVqPn+NMSdW
X-Received: from uau11.prod.google.com ([2002:a05:6130:634b:b0:86f:fad4:5337])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:5a94:b0:476:a967:b242 with SMTP id d75a77b69052e-4776e152be4mr95011791cf.30.1743098874436;
 Thu, 27 Mar 2025 11:07:54 -0700 (PDT)
Date: Thu, 27 Mar 2025 18:07:51 +0000
In-Reply-To: <fg5owc6cvx7mkdq64ljc4byc5xmepddgthanynyvfsqhww7wx2@q5op3ltl2nip>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <fg5owc6cvx7mkdq64ljc4byc5xmepddgthanynyvfsqhww7wx2@q5op3ltl2nip>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250327180753.1458171-1-jthoughton@google.com>
Subject: Re: [PATCH 3/5] cgroup: selftests: Move cgroup_util into its own library
From: James Houghton <jthoughton@google.com>
To: mkoutny@suse.com
Cc: axelrasmussen@google.com, cgroups@vger.kernel.org, dmatlack@google.com, 
	hannes@cmpxchg.org, jthoughton@google.com, kvm@vger.kernel.org, 
	laoar.shao@gmail.com, linux-kernel@vger.kernel.org, mlevitsk@redhat.com, 
	seanjc@google.com, tj@kernel.org, yuzhao@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 2:43=E2=80=AFAM Michal Koutn=C3=BD <mkoutny@suse.co=
m> wrote:
>
> Hello James.
>
> On Thu, Mar 27, 2025 at 01:23:48AM +0000, James Houghton <jthoughton@goog=
le.com> wrote:
> > KVM selftests will soon need to use some of the cgroup creation and
> > deletion functionality from cgroup_util.
>
> Thanks, I think cross-selftest sharing is better than duplicating
> similar code.
>
> +Cc: Yafang as it may worth porting/unifying with
> tools/testing/selftests/bpf/cgroup_helpers.h too
>
> > --- a/tools/testing/selftests/cgroup/cgroup_util.c
> > +++ b/tools/testing/selftests/cgroup/lib/cgroup_util.c
> > @@ -16,8 +16,7 @@
> > =C2=A0#include <sys/wait.h>
> > =C2=A0#include <unistd.h>
> >=20
> > -#include "cgroup_util.h"
> > -#include "../clone3/clone3_selftests.h"
> > +#include <cgroup_util.h>
>
> The clone3_selftests.h header is not needed anymore?

Ah, sorry.

We do indeed still reference `sys_clone3()` from cgroup_util.c, so it shoul=
d
stay in (as "../../clone3/clone3_selftests.h"). I realize now that it compi=
led
just fine because the call to `sys_clone3()` is dropped entirely when
clone3_selftests.h is not included.

So I'll apply the following diff:

diff --git a/tools/testing/selftests/cgroup/lib/cgroup_util.c b/tools/testi=
ng/selftests/cgroup/lib/cgroup_util.c
index d5649486a11df..fe15541f3a07d 100644
--- a/tools/testing/selftests/cgroup/lib/cgroup_util.c
+++ b/tools/testing/selftests/cgroup/lib/cgroup_util.c
@@ -18,6 +18,8 @@
=20
 #include <cgroup_util.h>
=20
+#include "../../clone3/clone3_selftests.h"
+
 /* Returns read len on success, or -errno on failure. */
 static ssize_t read_text(const char *path, char *buf, size_t max_len)
 {
diff --git a/tools/testing/selftests/cgroup/lib/libcgroup.mk b/tools/testin=
g/selftests/cgroup/lib/libcgroup.mk
index 2cbf07337c23f..12323041a5ce6 100644
--- a/tools/testing/selftests/cgroup/lib/libcgroup.mk
+++ b/tools/testing/selftests/cgroup/lib/libcgroup.mk
@@ -6,7 +6,9 @@ LIBCGROUP_O :=3D $(patsubst %.c, $(OUTPUT)/%.o, $(LIBCGROUP=
_C))
=20
 CFLAGS +=3D -I$(CGROUP_DIR)/lib/include
=20
-$(LIBCGROUP_O): $(OUTPUT)/%.o : $(CGROUP_DIR)/%.c
+EXTRA_HDRS :=3D $(selfdir)/clone3/clone3_selftests.h
+
+$(LIBCGROUP_O): $(OUTPUT)/%.o : $(CGROUP_DIR)/%.c $(EXTRA_HDRS)
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
=20
 EXTRA_CLEAN +=3D $(LIBCGROUP_O)
