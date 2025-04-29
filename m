Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2640570813
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745888632; cv=none; b=o1ZNHN+SNNTwuIkiIIVMvR3Y0hdPenfr24CNzVEiGBaUbRvvCYZ1JxByBJsH2WYnRJdzjJt2hWpapM6extB21lerDIxcHV61K1Oqqj+Sh3dTdS2IqtZrKnx1JuC++W4lw4ZX/glg1J2iwSfRwdX3e5vs6zx8x6jetjp1ATfGC+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745888632; c=relaxed/simple;
	bh=NMyHvEndM32QeMidto5Mn6t7yVRhd/4xcM1I2rtn6KQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CzH/flbyM62O6KhsP4DRXb1Or/Z0V8BxsRH1UO5zftWeY/9H+of8zdTce/M+ELShd8G1GkvBbCCYVB4Uv39KAk/sN4OhkUZakaT20neTOGNAEsD7QY3zccPpIJNp8g4nCezr0rlHq5sQRkKvvS7Wjn5v3q7BPlqz9XxlRFF4S2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bB08tbqF; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bB08tbqF"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2254bdd4982so78250525ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 18:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745888628; x=1746493428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0N6vnpk8vIOh+0TQjKECTwgmvexWONMh7U9hSe/aVEc=;
        b=bB08tbqFKJCwNBJmMDpLUVxAl/VNkoGE8dwGSIu4xCZwN9YaJ2cIhzJ1mizLdY++He
         Vpl+wVOLchq2KF5FftvwNdMH+lOm5wEYVo0YhIMK0usrkc4svAgdpOAr0a90IcNh7iDt
         JHJp+XL4WhtuXNon7hQDxuWjXdr0mblEjH2nKkoM5Xfei1+QDMyrhbcD8I5Oa7ng15O5
         6Dxbb1qSUSGTqFl7SithGLL8pRYJtRXwvGqEKccsW/+FfrvM2lhY/NV7fRBsDiOEG9tU
         sNdszg3Um1rIebIGqIyMGffuIJbRoOWcrC9IRAnU2p2X50ygGb5D8LoCd6xrbVleKpI7
         oqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745888628; x=1746493428;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0N6vnpk8vIOh+0TQjKECTwgmvexWONMh7U9hSe/aVEc=;
        b=qBOOiUwM4VYDhocZt32W5Q1CCXmtDBKILpcmRWQIgmsm8kCSf10qHH3UAmTj/+UJy3
         iSpJmiSLMPIC6idIoROeZzfhDrn7UQkurffvTn4FxHBTEL0QsgzAyJQDjHZ7HqCwUstJ
         qMYFtjn0VQKrWbIfyE5l+LWrkdJbqC1+HjOv0iGJvgycTzzF8GoYTigYpubAAtMRIytY
         OFH+5YLTBL1MptaUWmHcPWHOB4kWCewfbZjSTh0xOGJGfXe7k6w8zXfe1f2RD+WQfwVS
         UsyEMlIflKB4atk9SCNyj51Ou7OB5X2Swhgna4XUTp/rovLf8go84odnghqJ+iVr5Iq+
         txIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ9U4dIgL7tSQRCIMjzWL12PDtO/taXOP9v6Zp3jX2uZ7R4+ffDsARIue7AIunTYqehqO3C4Qg8fmhVU4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCyQTplZdYgCCuO8SKgPropO3Yh6bqAcOpTUAIvoa68HmkZ52B
	qwjNE7jYWEnZc2IMOI2Sr5nUzj9PB1NAV/v67RPARD4SSAtpEc6pmaZVzMTzs61QyuLFS3+Il+u
	Gnw==
X-Google-Smtp-Source: AGHT+IHM/661ZgZTepSBi2SA8Zn8aAamYmT/Kekoyia+DCTLnkUFlpflJKv4vilM+e8xUe42MNChePiEZoA=
X-Received: from plqw20.prod.google.com ([2002:a17:902:a714:b0:220:e952:af68])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:da88:b0:224:5a8:ba2c
 with SMTP id d9443c01a7336-22de703cff0mr15246705ad.52.1745888628471; Mon, 28
 Apr 2025 18:03:48 -0700 (PDT)
Date: Mon, 28 Apr 2025 18:03:46 -0700
In-Reply-To: <20250414200929.3098202-5-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250414200929.3098202-1-jthoughton@google.com> <20250414200929.3098202-5-jthoughton@google.com>
Message-ID: <aBAlcrTtBDeQCL0X@google.com>
Subject: Re: [PATCH v3 4/5] KVM: selftests: Build and link selftests/cgroup/lib
 into KVM selftests
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: kvm@vger.kernel.org, Maxim Levitsky <mlevitsk@redhat.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, mkoutny@suse.com, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Yu Zhao <yuzhao@google.com>, David Matlack <dmatlack@google.com>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025, James Houghton wrote:
> libcgroup.o is built separately from KVM selftests and cgroup selftests,
> so different compiler flags used by the different selftests will not
> conflict with each other.

This fails to build on some of my systems.  And it generates a warning, whi=
ch
thanks to me building KVM selftests with -Werror, is the only such warning =
in
all of KVM selftests.

tools/testing/selftests/cgroup/lib/cgroup_util.c:511:17: warning: ignoring =
return value of =E2=80=98read=E2=80=99 declared with attribute =E2=80=98war=
n_unused_result=E2=80=99 [-Wunused-result]
  511 |                 read(fd, buf, sizeof(buf));
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~

In file included from /usr/include/fcntl.h:314,
                 from tools/testing/selftests/cgroup/lib/cgroup_util.c:6:
In function =E2=80=98open=E2=80=99,
    inlined from =E2=80=98get_temp_fd=E2=80=99 at tools/testing/selftests/c=
group/lib/cgroup_util.c:493:9:
/usr/include/x86_64-linux-gnu/bits/fcntl2.h:50:11: error: call to =E2=80=98=
__open_missing_mode=E2=80=99 declared with attribute error: open with O_CRE=
AT or O_TMPFILE in second argument needs 3 arguments
   50 |           __open_missing_mode ();
      |           ^~~~~~~~~~~~~~~~~~~~~~


Given that the code in question has nothing to do with cgroups and is used =
only
by test_memcontrol.c, my vote is to move it into test_memcontrol.c and let =
the
cgroups folks sort things out at their leisure (if it even ever becomes an =
issue
for them).

E.g. slot this is before making cgroup_util.c a library?

--
From: Sean Christopherson <seanjc@google.com>
Date: Mon, 28 Apr 2025 17:38:14 -0700
Subject: [PATCH] selftests: cgroup: Move memcontrol specific helpers out of
 common cgroup_util.c

Move a handful of helpers out of cgroup_util.c and into test_memcontrol.c
that have nothing to with cgroups in general, in anticipation of making
cgroup_util.c a generic library that can be used by other selftests.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/cgroup/cgroup_util.c  | 78 -------------------
 tools/testing/selftests/cgroup/cgroup_util.h  |  5 --
 .../selftests/cgroup/test_memcontrol.c        | 78 +++++++++++++++++++
 3 files changed, 78 insertions(+), 83 deletions(-)

diff --git a/tools/testing/selftests/cgroup/cgroup_util.c b/tools/testing/s=
elftests/cgroup/cgroup_util.c
index 1e2d46636a0c..023a87ff7ebc 100644
--- a/tools/testing/selftests/cgroup/cgroup_util.c
+++ b/tools/testing/selftests/cgroup/cgroup_util.c
@@ -488,84 +488,6 @@ int cg_run_nowait(const char *cgroup,
 	return pid;
 }
=20
-int get_temp_fd(void)
-{
-	return open(".", O_TMPFILE | O_RDWR | O_EXCL);
-}
-
-int alloc_pagecache(int fd, size_t size)
-{
-	char buf[PAGE_SIZE];
-	struct stat st;
-	int i;
-
-	if (fstat(fd, &st))
-		goto cleanup;
-
-	size +=3D st.st_size;
-
-	if (ftruncate(fd, size))
-		goto cleanup;
-
-	for (i =3D 0; i < size; i +=3D sizeof(buf))
-		read(fd, buf, sizeof(buf));
-
-	return 0;
-
-cleanup:
-	return -1;
-}
-
-int alloc_anon(const char *cgroup, void *arg)
-{
-	size_t size =3D (unsigned long)arg;
-	char *buf, *ptr;
-
-	buf =3D malloc(size);
-	for (ptr =3D buf; ptr < buf + size; ptr +=3D PAGE_SIZE)
-		*ptr =3D 0;
-
-	free(buf);
-	return 0;
-}
-
-int is_swap_enabled(void)
-{
-	char buf[PAGE_SIZE];
-	const char delim[] =3D "\n";
-	int cnt =3D 0;
-	char *line;
-
-	if (read_text("/proc/swaps", buf, sizeof(buf)) <=3D 0)
-		return -1;
-
-	for (line =3D strtok(buf, delim); line; line =3D strtok(NULL, delim))
-		cnt++;
-
-	return cnt > 1;
-}
-
-int set_oom_adj_score(int pid, int score)
-{
-	char path[PATH_MAX];
-	int fd, len;
-
-	sprintf(path, "/proc/%d/oom_score_adj", pid);
-
-	fd =3D open(path, O_WRONLY | O_APPEND);
-	if (fd < 0)
-		return fd;
-
-	len =3D dprintf(fd, "%d", score);
-	if (len < 0) {
-		close(fd);
-		return len;
-	}
-
-	close(fd);
-	return 0;
-}
-
 int proc_mount_contains(const char *option)
 {
 	char buf[4 * PAGE_SIZE];
diff --git a/tools/testing/selftests/cgroup/cgroup_util.h b/tools/testing/s=
elftests/cgroup/cgroup_util.h
index 19b131ee7707..bdc50a8e6b85 100644
--- a/tools/testing/selftests/cgroup/cgroup_util.h
+++ b/tools/testing/selftests/cgroup/cgroup_util.h
@@ -49,11 +49,6 @@ extern int cg_enter_current_thread(const char *cgroup);
 extern int cg_run_nowait(const char *cgroup,
 			 int (*fn)(const char *cgroup, void *arg),
 			 void *arg);
-extern int get_temp_fd(void);
-extern int alloc_pagecache(int fd, size_t size);
-extern int alloc_anon(const char *cgroup, void *arg);
-extern int is_swap_enabled(void);
-extern int set_oom_adj_score(int pid, int score);
 extern int cg_wait_for_proc_count(const char *cgroup, int count);
 extern int cg_killall(const char *cgroup);
 int proc_mount_contains(const char *option);
diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testi=
ng/selftests/cgroup/test_memcontrol.c
index 16f5d74ae762..5414ca4df24c 100644
--- a/tools/testing/selftests/cgroup/test_memcontrol.c
+++ b/tools/testing/selftests/cgroup/test_memcontrol.c
@@ -24,6 +24,84 @@
 static bool has_localevents;
 static bool has_recursiveprot;
=20
+static int get_temp_fd(void)
+{
+	return open(".", O_TMPFILE | O_RDWR | O_EXCL);
+}
+
+static int alloc_pagecache(int fd, size_t size)
+{
+	char buf[PAGE_SIZE];
+	struct stat st;
+	int i;
+
+	if (fstat(fd, &st))
+		goto cleanup;
+
+	size +=3D st.st_size;
+
+	if (ftruncate(fd, size))
+		goto cleanup;
+
+	for (i =3D 0; i < size; i +=3D sizeof(buf))
+		read(fd, buf, sizeof(buf));
+
+	return 0;
+
+cleanup:
+	return -1;
+}
+
+static int alloc_anon(const char *cgroup, void *arg)
+{
+	size_t size =3D (unsigned long)arg;
+	char *buf, *ptr;
+
+	buf =3D malloc(size);
+	for (ptr =3D buf; ptr < buf + size; ptr +=3D PAGE_SIZE)
+		*ptr =3D 0;
+
+	free(buf);
+	return 0;
+}
+
+static int is_swap_enabled(void)
+{
+	char buf[PAGE_SIZE];
+	const char delim[] =3D "\n";
+	int cnt =3D 0;
+	char *line;
+
+	if (read_text("/proc/swaps", buf, sizeof(buf)) <=3D 0)
+		return -1;
+
+	for (line =3D strtok(buf, delim); line; line =3D strtok(NULL, delim))
+		cnt++;
+
+	return cnt > 1;
+}
+
+static int set_oom_adj_score(int pid, int score)
+{
+	char path[PATH_MAX];
+	int fd, len;
+
+	sprintf(path, "/proc/%d/oom_score_adj", pid);
+
+	fd =3D open(path, O_WRONLY | O_APPEND);
+	if (fd < 0)
+		return fd;
+
+	len =3D dprintf(fd, "%d", score);
+	if (len < 0) {
+		close(fd);
+		return len;
+	}
+
+	close(fd);
+	return 0;
+}
+
 /*
  * This test creates two nested cgroups with and without enabling
  * the memory controller.

base-commit: 4a243ec9b255aeb0f033c646148aaf662fd92c64
--
