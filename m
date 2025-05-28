Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA78B221561
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748465619; cv=none; b=CpUuQ91mh2sR1cl9S8rOyP1udViqju0b7kUi0g9gMgNePxouNA+AjqbqKMLzSLrHSnNpElry1DNj8BHOt6GGjF/9ZFRfBEky6/JXvG4bHc1OOsmZp3A7G9gWqfoMb063719ty3FoS/Qa08unKVZGs9Ge/+j34UYIr8yBY9V5BMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748465619; c=relaxed/simple;
	bh=7IzM7h5L+dgUzAMsJAZp/rkffjiaE+hgQomc7a0kD1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q4FsK1oUQvbsFtRnv93stMkS8dOOMKafFpYRW6+XWDiIgfgd46TiPUQg3bCfTnzjqNlpbTRDlrlfhNveVP9JX57YLyxs7+E+PlmMh7yFhx+lWWDbK/dU9MwteMn0iq7R088PY+gTuphZDBW8NNfE58QIoG10G6J7KvEmkl2wLnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eghXS/MN; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eghXS/MN"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2348a45fc73so53015ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748465617; x=1749070417; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GurTm2N7y0z3rtiw7G6HF7fGb6ar9xO0X9pfPVn2LXY=;
        b=eghXS/MN87Vg7K1bv3wuyQ74AYkkbV9wBbC667XBR1/yt6O1Pd+8SILWAWaCjtIwjz
         cw0MBH923Gu3CvyCzTA9VBZmbOI0btjvhfbjcR0rs5dxNYOs/nS0iLO9IbKHUPyQickv
         d3unzZXu8anKmZ/TplAPQy4k55izGxqBiNsKqfGYBRjiiDyDhYtG7ETPy/DxqTPscdbl
         osE+sxSoMDwzXEWcDEqDDmu0eU6VNSdX6YCYqk57Jeg0jjUJUAmRSZhNRLCWvTFpM+Tx
         2E3qETyixYf/qEECmoDcT3i+F1MUU4iKJM/CsymvxMm1Hs3H6MtGbFbcIsuutLzSJQEH
         k2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748465617; x=1749070417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GurTm2N7y0z3rtiw7G6HF7fGb6ar9xO0X9pfPVn2LXY=;
        b=esLsb1pll/xkrmmjOHR1UiJIwj9NWO1GxRl/zlj8Yd/ADVfTe2IfBOphzdpXhSKs37
         nlf4AYsCSEzs1nOiWZCCYbztRYLQkRLpcsvplGCZK4/PQA0viTivTB26+9x52OjZvSXW
         YGigzatu5Q8WMfrcMmhiA0s/zooK6yVHXvK57+J31burvx5aJdCN7NTJXNtHksZrVKzr
         +thesN0Gn/kc0Azf8YOsFH/VQlJGFRzXxrmR3dJzcm9EU3snoucjvz9v8QutX6TEyMby
         ZayYan+yQFWMyDNAtz5xcZRn+8KHidXIdARMuDtfWVexZxtwXtc+XiAcONQ3FpjaYfgk
         AinQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0Vd417gftGfjBUXih2XSuQfyyumeIyBmaJy6zPq95AvDzRRfb5uSX3ypA3G1gELHbef0LgvfmTixDxQc=@vger.kernel.org
X-Gm-Message-State: AOJu0YysYOO33CACjjE1AHz9oDakN2mjwUU2oZ1eOimvG6Pdd4PFTERN
	aEBU4Yd8xIZLaD9NWyQ45hTK9Uz6blBG2Ktoy/3GGJqdbqNBhMhDao2TB0HztKXZ6tyytZ0nE47
	ylZaI82uO4cDd/yIDTjlMG1BJvRH2o1sm0Rrpi0mz
X-Gm-Gg: ASbGncs287QMjC6jk2GQkyEhw5Anm1GmACPst/s2ZUAz9PDvTZdWyb+EFVzPem1eQNt
	dD/fxCZFh2BOjKLXxgty7r1CJatyETc4TUP9JgnFJmxaCqWKeWYKSFwe/CjPLRanMRwqOCkgbjn
	552Np1GlLAZxqs0JWTJCAO/hZ+Q4/No2Egby4XSnPlC1BoJqZ9yXkBaJg7rzSnN2IYrmHmpepa
X-Google-Smtp-Source: AGHT+IG2vqbrTFZXjKyrWRszrj/oY7bgBCGfCU2x/BPKW+QyxREhsZRD7r1RL8MK/PqD/nRjG9zuViMNSGPadmmBXvU=
X-Received: by 2002:a17:903:46c5:b0:234:afcf:d9e8 with SMTP id
 d9443c01a7336-23506a33f3amr93055ad.7.1748465616668; Wed, 28 May 2025 13:53:36
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404141118.3895592-1-koichiro.den@canonical.com>
In-Reply-To: <20250404141118.3895592-1-koichiro.den@canonical.com>
From: Yuanchu Xie <yuanchu@google.com>
Date: Wed, 28 May 2025 13:53:19 -0700
X-Gm-Features: AX0GCFuhsPlEnNwmGRcR3NsJ33kdxV-WoaAM9HdU6EYp_SmhqPbFFrw9KL7OtQw
Message-ID: <CAJj2-QGifr5RmzKUB_zL76H_qis5zxR50pOik9n-Mt6-_s_2Bw@mail.gmail.com>
Subject: Re: [PATCH] mm: vmscan: apply proportional reclaim pressure for memcg
 when MGLRU is enabled
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, yuzhao@google.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 7:11=E2=80=AFAM Koichiro Den <koichiro.den@canonical=
.com> wrote:
>
> The scan implementation for MGLRU was missing proportional reclaim
> pressure for memcg, which contradicts the description in
> Documentation/admin-guide/cgroup-v2.rst (memory.{low,min} section).
Nice, this is a discrepancy between the two reclaim implementations.
Thanks for addressing this.

>
> This issue was revealed by the LTP memcontrol03 [1] test case. The
> following example output from a local test env with no NUMA shows
> that prior to this patch, proportional protection was not working:
>
> * Without this patch (MGLRU enabled):
>   $ sudo LTP_SINGLE_FS_TYPE=3Dxfs ./memcontrol03
>     ...
>     memcontrol03.c:214: TPASS: Expect: (A/B/C memory.current=3D25964544) =
~=3D 34603008
>     memcontrol03.c:216: TPASS: Expect: (A/B/D memory.current=3D26038272) =
~=3D 17825792
>     ...
>
> * With this patch (MGLRU enabled):
>   $ sudo LTP_SINGLE_FS_TYPE=3Dxfs ./memcontrol03
>     ...
>     memcontrol03.c:214: TPASS: Expect: (A/B/C memory.current=3D29327360) =
~=3D 34603008
>     memcontrol03.c:216: TPASS: Expect: (A/B/D memory.current=3D23748608) =
~=3D 17825792
>     ...
>
> * When MGLRU is disabled:
>   $ sudo LTP_SINGLE_FS_TYPE=3Dxfs ./memcontrol03
>     ...
>     memcontrol03.c:214: TPASS: Expect: (A/B/C memory.current=3D28819456) =
~=3D 34603008
>     memcontrol03.c:216: TPASS: Expect: (A/B/D memory.current=3D24018944) =
~=3D 17825792
>     ...
>
> Note that the test shows TPASS for all cases here due to its lenient
> criteria. And even with this patch, or when MGLRU is disabled, the
> results above show slight deviation from the expected values, but this
> is due to relatively small mem usage compared to the >> DEF_PRIORITY
> adjustment.
It's kind of disappointing that the LTP test doesn't fail when reclaim
pressure scaling doesn't work. Would you be interested in fixing the
test as well?

>
> Factor out the proportioning logic to a new function and have MGLRU
> reuse it.
>
> [1] https://github.com/linux-test-project/ltp/blob/master/testcases/kerne=
l/controllers/memcg/memcontrol03.c
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> ---
>  mm/vmscan.c | 148 +++++++++++++++++++++++++++-------------------------
>  1 file changed, 78 insertions(+), 70 deletions(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index b620d74b0f66..c594d8264938 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -2467,6 +2467,69 @@ static inline void calculate_pressure_balance(stru=
ct scan_control *sc,
>         *denominator =3D ap + fp;
>  }
>
> +static unsigned long apply_proportional_protection(struct mem_cgroup *me=
mcg,
> +               struct scan_control *sc, unsigned long scan)
> +{
> +       unsigned long min, low;
> +
> +       mem_cgroup_protection(sc->target_mem_cgroup, memcg, &min, &low);
> +
> +       if (min || low) {
> +               /*
> +                * Scale a cgroup's reclaim pressure by proportioning
> +                * its current usage to its memory.low or memory.min
> +                * setting.
> +                *
> +                * This is important, as otherwise scanning aggression
> +                * becomes extremely binary -- from nothing as we
> +                * approach the memory protection threshold, to totally
> +                * nominal as we exceed it.  This results in requiring
> +                * setting extremely liberal protection thresholds. It
> +                * also means we simply get no protection at all if we
> +                * set it too low, which is not ideal.
> +                *
> +                * If there is any protection in place, we reduce scan
> +                * pressure by how much of the total memory used is
> +                * within protection thresholds.
> +                *
> +                * There is one special case: in the first reclaim pass,
> +                * we skip over all groups that are within their low
> +                * protection. If that fails to reclaim enough pages to
> +                * satisfy the reclaim goal, we come back and override
> +                * the best-effort low protection. However, we still
> +                * ideally want to honor how well-behaved groups are in
> +                * that case instead of simply punishing them all
> +                * equally. As such, we reclaim them based on how much
> +                * memory they are using, reducing the scan pressure
> +                * again by how much of the total memory used is under
> +                * hard protection.
> +                */
> +               unsigned long cgroup_size =3D mem_cgroup_size(memcg);
> +               unsigned long protection;
> +
> +               /* memory.low scaling, make sure we retry before OOM */
> +               if (!sc->memcg_low_reclaim && low > min) {
> +                       protection =3D low;
> +                       sc->memcg_low_skipped =3D 1;
> +               } else {
> +                       protection =3D min;
> +               }
> +
> +               /* Avoid TOCTOU with earlier protection check */
> +               cgroup_size =3D max(cgroup_size, protection);
> +
> +               scan -=3D scan * protection / (cgroup_size + 1);
> +
> +               /*
> +                * Minimally target SWAP_CLUSTER_MAX pages to keep
> +                * reclaim moving forwards, avoiding decrementing
> +                * sc->priority further than desirable.
> +                */
> +               scan =3D max(scan, SWAP_CLUSTER_MAX);
> +       }
> +       return scan;
> +}
> +
>  /*
>   * Determine how aggressively the anon and file LRU lists should be
>   * scanned.
> @@ -2537,70 +2600,10 @@ static void get_scan_count(struct lruvec *lruvec,=
 struct scan_control *sc,
>         for_each_evictable_lru(lru) {
>                 bool file =3D is_file_lru(lru);
>                 unsigned long lruvec_size;
> -               unsigned long low, min;
>                 unsigned long scan;
>
>                 lruvec_size =3D lruvec_lru_size(lruvec, lru, sc->reclaim_=
idx);
> -               mem_cgroup_protection(sc->target_mem_cgroup, memcg,
> -                                     &min, &low);
> -
> -               if (min || low) {
> -                       /*
> -                        * Scale a cgroup's reclaim pressure by proportio=
ning
> -                        * its current usage to its memory.low or memory.=
min
> -                        * setting.
> -                        *
> -                        * This is important, as otherwise scanning aggre=
ssion
> -                        * becomes extremely binary -- from nothing as we
> -                        * approach the memory protection threshold, to t=
otally
> -                        * nominal as we exceed it.  This results in requ=
iring
> -                        * setting extremely liberal protection threshold=
s. It
> -                        * also means we simply get no protection at all =
if we
> -                        * set it too low, which is not ideal.
> -                        *
> -                        * If there is any protection in place, we reduce=
 scan
> -                        * pressure by how much of the total memory used =
is
> -                        * within protection thresholds.
> -                        *
> -                        * There is one special case: in the first reclai=
m pass,
> -                        * we skip over all groups that are within their =
low
> -                        * protection. If that fails to reclaim enough pa=
ges to
> -                        * satisfy the reclaim goal, we come back and ove=
rride
> -                        * the best-effort low protection. However, we st=
ill
> -                        * ideally want to honor how well-behaved groups =
are in
> -                        * that case instead of simply punishing them all
> -                        * equally. As such, we reclaim them based on how=
 much
> -                        * memory they are using, reducing the scan press=
ure
> -                        * again by how much of the total memory used is =
under
> -                        * hard protection.
> -                        */
> -                       unsigned long cgroup_size =3D mem_cgroup_size(mem=
cg);
> -                       unsigned long protection;
> -
> -                       /* memory.low scaling, make sure we retry before =
OOM */
> -                       if (!sc->memcg_low_reclaim && low > min) {
> -                               protection =3D low;
> -                               sc->memcg_low_skipped =3D 1;
> -                       } else {
> -                               protection =3D min;
> -                       }
> -
> -                       /* Avoid TOCTOU with earlier protection check */
> -                       cgroup_size =3D max(cgroup_size, protection);
> -
> -                       scan =3D lruvec_size - lruvec_size * protection /
> -                               (cgroup_size + 1);
> -
> -                       /*
> -                        * Minimally target SWAP_CLUSTER_MAX pages to kee=
p
> -                        * reclaim moving forwards, avoiding decrementing
> -                        * sc->priority further than desirable.
> -                        */
> -                       scan =3D max(scan, SWAP_CLUSTER_MAX);
> -               } else {
> -                       scan =3D lruvec_size;
> -               }
> -
> +               scan =3D apply_proportional_protection(memcg, sc, lruvec_=
size);
>                 scan >>=3D sc->priority;
>
>                 /*
> @@ -4521,8 +4524,9 @@ static bool isolate_folio(struct lruvec *lruvec, st=
ruct folio *folio, struct sca
>         return true;
>  }
>
> -static int scan_folios(struct lruvec *lruvec, struct scan_control *sc,
> -                      int type, int tier, struct list_head *list)
> +static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
> +                      struct scan_control *sc, int type, int tier,
> +                      struct list_head *list)
>  {
>         int i;
>         int gen;
> @@ -4531,7 +4535,7 @@ static int scan_folios(struct lruvec *lruvec, struc=
t scan_control *sc,
>         int scanned =3D 0;
>         int isolated =3D 0;
>         int skipped =3D 0;
> -       int remaining =3D MAX_LRU_BATCH;
> +       int remaining =3D min(nr_to_scan, MAX_LRU_BATCH);
>         struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
>         struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
>
> @@ -4642,7 +4646,8 @@ static int get_type_to_scan(struct lruvec *lruvec, =
int swappiness)
>         return positive_ctrl_err(&sp, &pv);
>  }
>
> -static int isolate_folios(struct lruvec *lruvec, struct scan_control *sc=
, int swappiness,
> +static int isolate_folios(unsigned long nr_to_scan, struct lruvec *lruve=
c,
> +                         struct scan_control *sc, int swappiness,
>                           int *type_scanned, struct list_head *list)
>  {
>         int i;
> @@ -4654,7 +4659,7 @@ static int isolate_folios(struct lruvec *lruvec, st=
ruct scan_control *sc, int sw
>
>                 *type_scanned =3D type;
>
> -               scanned =3D scan_folios(lruvec, sc, type, tier, list);
> +               scanned =3D scan_folios(nr_to_scan, lruvec, sc, type, tie=
r, list);
>                 if (scanned)
>                         return scanned;
>
> @@ -4664,7 +4669,8 @@ static int isolate_folios(struct lruvec *lruvec, st=
ruct scan_control *sc, int sw
>         return 0;
>  }
>
> -static int evict_folios(struct lruvec *lruvec, struct scan_control *sc, =
int swappiness)
> +static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
> +                       struct scan_control *sc, int swappiness)
>  {
>         int type;
>         int scanned;
> @@ -4683,7 +4689,7 @@ static int evict_folios(struct lruvec *lruvec, stru=
ct scan_control *sc, int swap
>
>         spin_lock_irq(&lruvec->lru_lock);
>
> -       scanned =3D isolate_folios(lruvec, sc, swappiness, &type, &list);
> +       scanned =3D isolate_folios(nr_to_scan, lruvec, sc, swappiness, &t=
ype, &list);
>
>         scanned +=3D try_to_inc_min_seq(lruvec, swappiness);
>
> @@ -4804,6 +4810,8 @@ static long get_nr_to_scan(struct lruvec *lruvec, s=
truct scan_control *sc, int s
>         if (nr_to_scan && !mem_cgroup_online(memcg))
>                 return nr_to_scan;
>
> +       nr_to_scan =3D apply_proportional_protection(memcg, sc, nr_to_sca=
n);
> +
>         /* try to get away with not aging at the default priority */
>         if (!success || sc->priority =3D=3D DEF_PRIORITY)
>                 return nr_to_scan >> sc->priority;
> @@ -4856,7 +4864,7 @@ static bool try_to_shrink_lruvec(struct lruvec *lru=
vec, struct scan_control *sc)
>                 if (nr_to_scan <=3D 0)
>                         break;
>
> -               delta =3D evict_folios(lruvec, sc, swappiness);
> +               delta =3D evict_folios(nr_to_scan, lruvec, sc, swappiness=
);
>                 if (!delta)
>                         break;
>
> @@ -5477,7 +5485,7 @@ static int run_eviction(struct lruvec *lruvec, unsi=
gned long seq, struct scan_co
>                 if (sc->nr_reclaimed >=3D nr_to_reclaim)
>                         return 0;
>
> -               if (!evict_folios(lruvec, sc, swappiness))
> +               if (!evict_folios(MAX_LRU_BATCH, lruvec, sc, swappiness))
>                         return 0;
Right now this change preserves the current behavior, but given this
is only invoked from the debugfs interface, it would be reasonable to
also change this to something like nr_to_reclaim - sc->nr_reclaimed so
the run_eviction evicts closer to nr_to_reclaim number of pages.
Closer to what it advertises, but different from the current behavior.
I have no strong opinion here, so if you're a user of this proactive
reclaim interface and would prefer to change it, go ahead.

>
>                 cond_resched();
> --
> 2.45.2
>
>

Reviewed-by: Yuanchu Xie <yuanchu@google.com>
