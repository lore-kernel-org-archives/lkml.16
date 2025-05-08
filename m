Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6652222C7
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 08:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746692387; cv=none; b=EBqDBxoIlXuU5E/a0U5EsgQOlRUzJvaPrxyYYJNsyWBOulHTY8bTyd/s1HzWkUvzSDOximfESYK9zlJR+lbu3FPbqCpt7vdiuUCpoR/Ywe8sI2j4gvbn1m9QK19SmeSid2EB3H4H82CwXm3qOh/lDAbHAQ17fs6cSbhhY5jaLrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746692387; c=relaxed/simple;
	bh=74H7Q3gHRu63DXoeT0h1s0Sq+P9K/OWvH+4GYiKmeeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qfOQS8lL9VrjcvbcH3LoULSJBr+WbpdW55LKd+RxX7N6zttWHWo9/vgrVy1MAkZhgiW8BWnCDM0qNDLqaakudCTFP4oqqjQDwNNapuzISxDPEQiv3VNP8ataYMxhNKtmAkUM1llNuG4h5Dibxt2WqioEFI9eE9fj9l9t/dh3+sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4sK65vgR; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4sK65vgR"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c559b3eb0bso51677185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 01:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746692383; x=1747297183; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52VkJWUKu9po56zzc30MFEoaWWTa8U2EUDMrfHIwzGI=;
        b=4sK65vgRY1ZZk9sVWdVWbJdSrwdNMir6kxo/sbnB8YiaJOYEzov/RM3XJrjGhRQXXz
         E2BXhrG7bC26xiVjdB7qzLIPUr5xh043o9avC523oV7CjPWDpPKN5D8VSPfgPvf4IZDr
         OABKEtE9VVLMMlXFZOC+PLwFkDG2iNwZVHio1rw/XnUn484dwEFchSqyEnB9XB8PBfk6
         by0UbwuPSyglApjTgzAs/Zamw+p3Zcg+CvjHXOQz4c7AP/NM0tqEkiE3USuSmjrT72Ui
         mcsl1KFOuVovKyZ8gwO91PK0GxE3PBUcki2cuiVL2GvbNrwAsldTonZJOKtDQB042R4Y
         XLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746692383; x=1747297183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52VkJWUKu9po56zzc30MFEoaWWTa8U2EUDMrfHIwzGI=;
        b=H3invczxL7u/wzso3cM4BvYBvDDCM1Ik76osTXyuEF2DIYQHREwz5PaFD+o8/FFMNP
         CufrDgvHCy6EHjAII0BNunS+n6pSXxXEDta2x0DwXlGWnAKUKU6akWWx7GYpgFAmiQkQ
         FzNXI1lE73NQD3ZTt3b5rBOysQhll6QDrZ6mTnulgnBA/yrE5ttfQwT1wCppFBtML1zz
         LRYx+2+WOJZDLuFIhX2QD+UuVf+T3QbGi+RaWFxOvl6tWMoJ4Vu27FXPFL3Z04SGpgBi
         9F5T5ExJwVfXh2UIsBvk4wcucWo23/bxQH0+ulWj6tpFRu0PjeLO5wVbppbzpw+9SxbM
         TiUg==
X-Forwarded-Encrypted: i=1; AJvYcCXIZuIG0k15HJX105Jkrti+kRaaLuvp7qYp3jEtovw+JnazoboaajxXtMpltU7P5TP3nsrRUvxpMNXMyd4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEL/qENCszo/TR9i1KFvwXF+oB2+Ez17bdOOXdHiEYemaGdTGa
	D98avsGrLcrCkBKj33RLdHUdRa5HIJEWb4SyRB5/hHzZjl+vAZDSANE9E2lZb8n6uv914CEp70B
	NKY7GgwrB71FF2STNNxT82NggJUk0RsCUDoxP
X-Gm-Gg: ASbGncs5+LInky8wJowH+bYbOBJAXaesLjAFbodVlWo34igAOyABNwkImGzgjqbMlnF
	cvjNxwwgHQPNYo+5dY/AeLhVzF2rHM7RSghAtY6qEA3c/Z0ckNCz53KWONdTCkytw8rHU5TtalY
	A4NdBT0EeUrRjP2u0uO7IEpBvz2nL3ghs5OwV9DTIPd7nX2Wxb00Dl
X-Google-Smtp-Source: AGHT+IFU22NqOrcNrrDUbGRascTT+Mhi+cmhXlTHgSAeExvVan06h8+Zd4mYO4x65UVlu5MRqnLO0LTcgyeAVgm734k=
X-Received: by 2002:a05:6214:4009:b0:6f5:473d:e52c with SMTP id
 6a1803df08f44-6f54c3a777fmr39535526d6.15.1746692382604; Thu, 08 May 2025
 01:19:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507160012.3311104-1-glider@google.com> <20250507160012.3311104-2-glider@google.com>
 <CANpmjNMUFmnVweY5zCkkszD39bhT3+eKk1-Qqc0LZTUdPN0x=Q@mail.gmail.com>
In-Reply-To: <CANpmjNMUFmnVweY5zCkkszD39bhT3+eKk1-Qqc0LZTUdPN0x=Q@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 8 May 2025 10:19:06 +0200
X-Gm-Features: ATxdqUF82TZNZdJ5NZ9DBr61uOEgkzx_derrNzCJpkoQ0suTxw1oBNH06TRw08o
Message-ID: <CAG_fn=VuaiTB11bJraxQjoVxp=0ML7Zoth1CYjczgUof3Rhqmw@mail.gmail.com>
Subject: Re: [PATCH 2/5] kmsan: fix usage of kmsan_enter_runtime() in kmsan_vmap_pages_range_noflush()
To: Marco Elver <elver@google.com>
Cc: dvyukov@google.com, bvanassche@acm.org, kent.overstreet@linux.dev, 
	iii@linux.ibm.com, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 6:09=E2=80=AFPM Marco Elver <elver@google.com> wrote=
:
>
> On Wed, 7 May 2025 at 18:00, Alexander Potapenko <glider@google.com> wrot=
e:
> >
> > Only enter the runtime to call __vmap_pages_range_noflush(), so that er=
ror
> > handling does not skip kmsan_leave_runtime().
> >
> > This bug was spotted by CONFIG_WARN_CAPABILITY_ANALYSIS=3Dy
>
> Might be worth pointing out this is not yet upstream:
> https://lore.kernel.org/all/20250304092417.2873893-1-elver@google.com/

Thanks! I'll update the description (here and in the other patch) and
post v2 later today.

> Also, for future reference, feel free to dump the diff here that added
> the annotations that helped you find the missing kmsan*runtime()
> calls. I'm sure it'd be of interest to others. At one point we may
> upstream those annotations, too, but we'll need Capability Analysis
> upstream first (which is blocked by some Clang improvements that were
> requested).

The diff is below. I added a __no_matter() macro which isn't strictly
necessary (maybe we can remove it altogether), but I thought it'll be
more descriptive.

Author: Alexander Potapenko <glider@google.com>
Date:   Thu Apr 3 15:44:38 2025 +0200

    DO-NOT-SUBMIT: kmsan: enable capability analysis

    Add support for the new capability analysis framework to KMSAN.
    Use the KMSAN_RUNTIME capability token to ensure correctness of
    kmsan_enter_runtime()/kmsan_leave_runtime() usage.

    Cc: Marco Elver <elver@google.com>
    Cc: Bart Van Assche <bvanassche@acm.org>
    Cc: Kent Overstreet <kent.overstreet@linux.dev>
    Signed-off-by: Alexander Potapenko <glider@google.com>

diff --git a/mm/kmsan/Makefile b/mm/kmsan/Makefile
index 91cfdde642d16..94591d612384c 100644
--- a/mm/kmsan/Makefile
+++ b/mm/kmsan/Makefile
@@ -8,6 +8,7 @@ obj-y :=3D core.o instrumentation.o init.o hooks.o
report.o shadow.o
 KMSAN_SANITIZE :=3D n
 KCOV_INSTRUMENT :=3D n
 UBSAN_SANITIZE :=3D n
+CAPABILITY_ANALYSIS :=3D y

 # Disable instrumentation of KMSAN runtime with other tools.
 CC_FLAGS_KMSAN_RUNTIME :=3D -fno-stack-protector
diff --git a/mm/kmsan/kmsan.h b/mm/kmsan/kmsan.h
index bc3d1810f352c..441c9dd39fe2a 100644
--- a/mm/kmsan/kmsan.h
+++ b/mm/kmsan/kmsan.h
@@ -35,6 +35,9 @@
 #define KMSAN_META_SHADOW (false)
 #define KMSAN_META_ORIGIN (true)

+token_capability(KMSAN_RUNTIME);
+#define __no_matter(X)
+
 /*
  * A pair of metadata pointers to be returned by the instrumentation funct=
ions.
  */
@@ -74,7 +77,7 @@ void kmsan_print_origin(depot_stack_handle_t origin);
  */
 void kmsan_report(depot_stack_handle_t origin, void *address, int size,
                  int off_first, int off_last, const void __user *user_addr=
,
-                 enum kmsan_bug_reason reason);
+                 enum kmsan_bug_reason reason) __must_not_hold(KMSAN_RUNTI=
ME);

 DECLARE_PER_CPU(struct kmsan_ctx, kmsan_percpu_ctx);

@@ -107,6 +110,7 @@ static __always_inline bool kmsan_in_runtime(void)
 }

 static __always_inline void kmsan_enter_runtime(void)
+       __acquires(KMSAN_RUNTIME) __no_capability_analysis
 {
        struct kmsan_ctx *ctx;

@@ -115,6 +119,7 @@ static __always_inline void kmsan_enter_runtime(void)
 }

 static __always_inline void kmsan_leave_runtime(void)
+       __releases(KMSAN_RUNTIME) __no_capability_analysis
 {
        struct kmsan_ctx *ctx =3D kmsan_get_context();

@@ -122,7 +127,8 @@ static __always_inline void kmsan_leave_runtime(void)
 }

 depot_stack_handle_t kmsan_save_stack_with_flags(gfp_t flags,
-                                                unsigned int extra_bits);
+                                                unsigned int extra_bits)
+       __must_hold(KMSAN_RUNTIME);

 /*
  * Pack and unpack the origin chain depth and UAF flag to/from the extra b=
its
@@ -151,19 +157,26 @@ static __always_inline unsigned int
kmsan_depth_from_eb(unsigned int extra_bits)
  * kmsan_internal_ functions are supposed to be very simple and not requir=
e the
  * kmsan_in_runtime() checks.
  */
-void kmsan_internal_memmove_metadata(void *dst, void *src, size_t n);
+void kmsan_internal_memmove_metadata(void *dst, void *src, size_t n)
+       __must_hold(KMSAN_RUNTIME);
 void kmsan_internal_poison_memory(void *address, size_t size, gfp_t flags,
-                                 unsigned int poison_flags);
-void kmsan_internal_unpoison_memory(void *address, size_t size, bool check=
ed);
+                                 unsigned int poison_flags)
+       __must_hold(KMSAN_RUNTIME);
+void kmsan_internal_unpoison_memory(void *address, size_t size, bool check=
ed)
+       __no_matter(KMSAN_RUNTIME);
+
 void kmsan_internal_set_shadow_origin(void *address, size_t size, int b,
-                                     u32 origin, bool checked);
-depot_stack_handle_t kmsan_internal_chain_origin(depot_stack_handle_t id);
+                                     u32 origin, bool checked)
+       __no_matter(KMSAN_RUNTIME);
+depot_stack_handle_t kmsan_internal_chain_origin(depot_stack_handle_t id)
+       __must_hold(KMSAN_RUNTIME);

 void kmsan_internal_task_create(struct task_struct *task);

 bool kmsan_metadata_is_contiguous(void *addr, size_t size);
 void kmsan_internal_check_memory(void *addr, size_t size,
-                                const void __user *user_addr, int reason);
+                                const void __user *user_addr, int reason)
+       __must_not_hold(KMSAN_RUNTIME);

 struct page *kmsan_vmalloc_to_page_or_null(void *vaddr);
 void kmsan_setup_meta(struct page *page, struct page *shadow,
