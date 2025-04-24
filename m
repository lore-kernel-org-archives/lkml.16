Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF591DE2BF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745476616; cv=none; b=NQQuoQVh0b1ijcIDZ1n+g2PE2lzXHRyyKLdT+Ug4WSdcCXosd/rjIj9I1/sM+jwfAfhaMSCFfpO0YWHnXoUbyK82PQr44VtgyW/dxVAWloxiPlKgWbYsDAJ4tfau7paeSzCn9lCMHE8h0Vx6e10O1SRDXuDcqRVsBhku+n8mITM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745476616; c=relaxed/simple;
	bh=trMyhr5MUHSp84+ytvqPdozLcRm5XKCXzWT6euSVzUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sqwvh8mE0ts20GuNHm81DlVnKlG7iilZpYQIqh+hihK2yTNd3UdIEdU9aUo5q5rBWxRjrvTaH9sQFLbmwE0PxhS/3Zv5Q3YHS159KWAmYN65wOxKVB2ZsC1T9v/QD5J7KrRNfxO2/GKmGptAl9aN/e8Eiru9l+n4yXg6+GSKst0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYkbqfXE; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYkbqfXE"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3081f72c271so658308a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745476614; x=1746081414; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DMr8anHekRP4nWD1QQ2+h9LhG4BXWFQiBGbY5GdEazo=;
        b=JYkbqfXEehP3VH097ZqegTOPPqSrsvmgrwxtRbUS7MiCQvvIP52CNGAfalxEDH3Tya
         TSiFh/2m8p6dff1NX/qTf4GAXXOm5LPgR5N4WDoOByeCTMrU4gEa1agH5lIHujynvKyo
         9RBA5Iy7B8TJsDP/xfeg2ZiivVVdEbJtbP7CjUjEmh8skbvAsx4PQFQxCQ8DifBjlBbV
         u5oMl+FhRm6m0R/XNlRy1j7Nzw+uIN/udtPnI6GYAz5QhXJ1xf2wAGLqwUrR0V0xznLW
         6rC++o8LvJuWcY4XfJfDI2u/qBmr4mvsIP2xb4a1n8Gyne5zpC5IdJRTCqlW5GOUxdOI
         N9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745476614; x=1746081414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMr8anHekRP4nWD1QQ2+h9LhG4BXWFQiBGbY5GdEazo=;
        b=Zg8Bf7uj8ioE2L63lV4wzzKsdI6uNkToHwxacwn3H9fDcVNF54mvoG0Qn0mD+EMneh
         TN8hEM76Ixp1KWozblnY4EjbiGTyFB8XIykZ+oBGHbRVr5/lPK2Rs5jyaGEwfit4lmFY
         D3kPKGNNseKADVKulY+lIiXTRLhpElsuLDbhJHnzfPU17J2zrc5j6bsQEO2nMZk8Q0Uo
         B2ayWamWlFPJ72lZgQYX85MSfx7aPQW8gMx3Fyw6kBwQlphmnfZW/cs9cwPUN0z/HMe7
         xdx2go7kcjFUCTT4s2UqWS0fkjYAtDK+2cYb3mTVZ6zYq2pI4M88TAgBL48ag+YLOQVX
         PMDA==
X-Forwarded-Encrypted: i=1; AJvYcCW7Z2Vyf7W29Fy+ors2gdduJ0VH1N01AFBhyazFTqEO27J7YzFpFonnhr/EpuB6lwlcRB/YL0nNfATjBfE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb9BB9jTi99JSvk0AOB/keuzDOzTAw5W/upENNcJ5GpDfiX49+
	xJMusGsee0EKycxAaPOmgAdpD+wuW4N5j4IRnxZb3eci7K+7UwRstefHR6YxkT+DLV4gKVyQxch
	BAgsTaip83PGYf411N+dN0YJ1k8XEORJz
X-Gm-Gg: ASbGncvl/aomZFHSbZ3s01U7tIEMHLYMOp3oH9CKFzY4IPO6IIGyGnYx1CgSTC0mmCB
	2Jzu43jTH9g1anSbJCY06QQywjEUNzgHbYCoC8Tpelsi7AvEYupTlS/mXsUuALnNvHKyErkRwBy
	ISCe3hUkz9bF1j2nqq6IGRZNkR
X-Google-Smtp-Source: AGHT+IGJ7EPYDDfAUb6KExNX6tFV2UpbCWv+6nWjqGSXexAT+Sf/gZInut5xly25mEsD1piooV1e508g2jz1P8FzaGM=
X-Received: by 2002:a17:90a:d648:b0:2ee:f677:aa14 with SMTP id
 98e67ed59e1d1-309ed27050fmr2474976a91.13.1745476613954; Wed, 23 Apr 2025
 23:36:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422124843.17188-1-aha310510@gmail.com> <e7c9e904-c284-45ab-8022-2009a976a894@lucifer.local>
In-Reply-To: <e7c9e904-c284-45ab-8022-2009a976a894@lucifer.local>
From: Jeongjun Park <aha310510@gmail.com>
Date: Thu, 24 Apr 2025 15:36:46 +0900
X-Gm-Features: ATxdqUEIRWgDLWLcCTlxbC2V6RqRg8EVz_agV42o-T4YljB-eVpK4-Mo7p5QWKM
Message-ID: <CAO9qdTH=tk4dSjULYS-yR+YOri8=55af8L+M6FRB-hsPRz6qww@mail.gmail.com>
Subject: Re: [PATCH v2] ipc: fix to protect IPCS lookups using RCU
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, willy@infradead.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+a2b84e569d06ca3a949c@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
>
> You sent this mail twice by mistake, and didn't link to the original
> thread, since you sent v1 2 months ago it's really useful to provide a link
> (here it's [0] ).
>
> [0]: https://lore.kernel.org/all/20250214180157.10288-1-aha310510@gmail.com/
>
> Your description is entirely missing any 'a syzkaller report encountered an
> issue whereby [blah blah blah]'. Please add this.
>
> On Tue, Apr 22, 2025 at 09:48:43PM +0900, Jeongjun Park wrote:
> > idr_for_each() is protected by rwsem, but this is not enough. If it is not
> > protected by the RCU read-critical region, when we call radix_tree_node_free()
> > via call_rcu() to free the struct radix_tree_node, the node will be freed
> > immediately, and when we read the next node in radix_tree_for_each_slot(),
> > we can read the already freed memory.
>
> What is calling call_rcu(), or radix_tree_for_each_slot() etc.? Presumably
> idr_for_each? Maybe worth saying soe xplicitly.
>
> >
> > Therefore, we need to add code to make sure that idr_for_each() is protected
> > within the RCU read-critical region when we call it in shm_destroy_orphaned().
> >
> > Reported-by: syzbot+a2b84e569d06ca3a949c@syzkaller.appspotmail.com
>
> In Matthew's reply to you in the original thread he says 'if anybody is
> wondering what the hell this is about [link]'. It would have been useful to
> include this link here [1].
>
> [1]: https://lore.kernel.org/linux-kernel/67af13f8.050a0220.21dd3.0038.GAE@google.com/
>
> > Fixes: b34a6b1da371 ("ipc: introduce shm_rmid_forced sysctl")
> > Cc: Matthew Wilcox <willy@infradead.org>
>
> You're cc-ing more people than this? There's no need for you to manually
> add Cc: lines anyway. But this is just incorrect.
>
> > Signed-off-by: Jeongjun Park <aha310510@gmail.com>
>
> Matthew seemed more aware of the behaviour in this code so I'm going to
> keep my review to process nits mostly.
>
> Others can actually review the change... But it seems you are doing what
> Matthew suggested broadly.
>
> Have you run with lockdep (i.e. CONFIG_PROVE_LOCKING) enabled? What testing
> have you done?
>
> Presumably it's ok to order the rcu read critical section and rwsem locks
> this way?

To test if this patch is the correct one, I applied this patch and
CONFIG_PROVE_LOCKING and reproduced the backtrace in the syzbot report [0]
through test.c

Unfortunately, I think I need to supplement test.c more to reproduce the
KASAN crash log, but I was able to successfully call idr_for_each()
similer to the syzbot backtrace.

Fortunately, the test results showed that there were no particular
problems related to RCU, and considering that shm_destroy_orphaned() and
proc_ipc_dointvec_minmax_orphans() are only called through proc_handler,
it can be confirmed that there are no particular problems with the patch.

I'll send you the v3 patch after fixing the other things you advised.

Regards,

Jeongjun Park

[0]: https://syzkaller.appspot.com/bug?extid=a2b84e569d06ca3a949c

test.c:
```c
// gcc -o test test.c

#define _GNU_SOURCE

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <sched.h>
#include <fcntl.h>
#include <err.h>
#include <ctype.h>
#include <errno.h>
#include <time.h>
#include <inttypes.h>
#include <math.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/types.h>
#include <sys/syscall.h>

#define KEY_ID 43214321
#define SHM_SIZE 4096
#define SHM_COUNT 100

#define FAIL_IF(x) if ((x)) { \
    perror(#x); \
    return -1; \
}

void write_file(const char *filename, char *text) {

    int fd = open(filename, O_RDWR);

    write(fd, text, strlen(text));
    close(fd);
}

void setup_ns(void) {

    uid_t uid = getuid();
    gid_t gid = getgid();
    char buffer[0x100];

    if (unshare(CLONE_NEWUSER | CLONE_NEWNS | CLONE_NEWIPC)) {
        perror(" [-] unshare(CLONE_NEWUSER | CLONE_NEWNS | CLONE_NEWIPC)");
exit(EXIT_FAILURE);
}

    write_file("/proc/self/setgroups", "deny");
    snprintf(buffer, sizeof(buffer), "0 %d 1", uid);
    write_file("/proc/self/uid_map", buffer);
    snprintf(buffer, sizeof(buffer), "0 %d 1", gid);
    write_file("/proc/self/gid_map", buffer);
}

int main() {
    setup_ns();

    int key_id, shm_id;

    for (int i = 0; i < SHM_COUNT; i++) {
        key_id = i + KEY_ID;
        shm_id = shmget((key_t)key_id, SHM_SIZE, IPC_CREAT | 0666);
        if (shm_id == -1)
            FAIL_IF("main: shmget error\n");
        void *shmaddr = shmat(shm_id, (void*)0, 0);
        if (shmaddr == -1)
            FAIL_IF("main: shmat error\n");

        int fd = open("/proc/sys/kernel/shm_rmid_forced", O_RDWR);
        if (fd <  0)
            FAIL_IF("open /proc/sys/kernel/shm_rmid_forced error\n");

        write(fd, "1", 1);
        close(fd);
    }

    return 0;
}
```

>
> > ---
> > v2: Change description and coding style
>
> Actually you completely change what you're doing here, this is a completely
> inaccurate changelog, before you dropped the rwsem, now you don't!! You
> should note this (i.e. - what it is you're actually doing...)
>
> Not sure what on earth you are changing in the coding style? You're adding
> braces and 2 lines of code?
>
> I don't think you really need to note a change in description, that's
> implicit.
>
> Also a:
>
> v1:
> https://lore.kernel.org/all/20250214180157.10288-1-aha310510@gmail.com/
>
> Is vital esp. after such a delay, as noted above.
>
> > ---
> >  ipc/shm.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/ipc/shm.c b/ipc/shm.c
> > index 99564c870084..492fcc699985 100644
> > --- a/ipc/shm.c
> > +++ b/ipc/shm.c
> > @@ -431,8 +431,11 @@ static int shm_try_destroy_orphaned(int id, void *p, void *data)
> >  void shm_destroy_orphaned(struct ipc_namespace *ns)
> >  {
> >       down_write(&shm_ids(ns).rwsem);
> > -     if (shm_ids(ns).in_use)
> > +     if (shm_ids(ns).in_use) {
> > +             rcu_read_lock();
> >               idr_for_each(&shm_ids(ns).ipcs_idr, &shm_try_destroy_orphaned, ns);
> > +             rcu_read_unlock();
> > +     }
> >       up_write(&shm_ids(ns).rwsem);
> >  }
> >
> > --
