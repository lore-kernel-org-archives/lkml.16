Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753B61487D1
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 07:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751094546; cv=none; b=c9rIz/Vy8R5XlT/nlYv5hE9L8oaTb6gOCVBoIzddJXBNeQxeY3qymSqcUjYdwBLnuHFfMejTDmIXNArgknm/mcAYdc8ULIfv51gkj9bSXWRZ4hRrx72U2lOWTf7J/enmO+sW0N1Eif+ggVu4bm+PaXmY+xUf63Cr9YsNiczYP1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751094546; c=relaxed/simple;
	bh=FZHO3p5rhptaXL7q6WsM8ddj9LKX83vhJ8T6/NYaGnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sCn7HHcaqn7Y0DjUfKnb1gry9yytWW/hCCX7zKgTSfkmyT5w8GcYhuyHQHI4h+DjNfnVQwPHb0U6l51vBAGg6B6rerCh/alhOTT2HxWLizqdudaZu85Xq0jjpNT39Z3ylQ2Z+ubotdTt1eDJKlju6rRb8WdyMUWqqQgd5LjFHLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbD9xVd9; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbD9xVd9"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5550dca1241so502103e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 00:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751094540; x=1751699340; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDWWT5HDcnyRmYYzxKLV8ckK9ZEl9QAxckaTYpWLGbY=;
        b=nbD9xVd9GCZF2AuKgjlDqqiVrRdtA+IIapefsU4AavSzFqznRzuW6MN+IcEaWUINZ4
         kdeJS62n/Hh0S5MBqMYUJlCxPZlpfoUMgcpRiGf0bZH3GkXnYenUI2etQWc7xOAEskXg
         qtJ7eMcSWik9bRuclADUK9v551wiGRo6rfDoF7wisHjqwUtuYSoWyDk62hwrhve4tfBu
         zIjaQapJEsfuHC5Lz/ASBQq8tm4al0jyMc63bwRoii/uMBW/mCj8mGoVXSuy0DHJrqU+
         0KFjfzGFx20lQjLbBOcB3L5E4EbRhMYKAi6S7nbbAdkuzlEoLLrOQ2/1XzVGXUtXKB80
         KkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751094540; x=1751699340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDWWT5HDcnyRmYYzxKLV8ckK9ZEl9QAxckaTYpWLGbY=;
        b=QSaFrxCwT+HRr4LghGLV0hFvupJqzPU6EIr/UtRCIA0qSuLbaxm48jYwlGRD2wm1po
         ZXa0cueWHboUyk+A0qdLrnR4O7yBJXlux9vSkiIYrvmla/lOuhQwahus2FLhyKZY1WFp
         RXD0bmhooTp/V6IqiK3VozJQxlSEBgPR7JUSBgQei1RxzLjeGgAWKmwwwhs9H9XIHOBe
         RzXgwbewwMsZzFjVNvJzu2Og1ye4qkB+KoPV6hIDwvEm1rm/ZqyaGGeGBbhouNX0ijZX
         U+nrto2o00IVADjKYDR/PMrAUJWzUAFe2sRpSg3HeK0th2Rn8XWscpQdRcwu9TxOJq0k
         ZTeA==
X-Forwarded-Encrypted: i=1; AJvYcCVER5OdPy1blbvChyvJOvYTJgiZTp8iSu5zURqcZYlbX4nfGzIYsAk3AbhiQvNPKJhapnkYtNGPIL1JtxE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz72jY2Li4zPMeW9Tk7Us6QGdOP+B1QDLGQu0QvN6gBdGQllbe
	jr9FYkoscPxJyc8P8+QT1vdpZYpnTudIAon8OH5ROHd+8Y7Q+hINNzeoHaRg/ZGKHd/PT6Wj6tM
	dCyMKobWYcTokCd8I42YXHY0m2ut4+WZry0DnDDQ=
X-Gm-Gg: ASbGnctCPDiwSYdOQhl3BFltembfbkf1edJZZFh8nnH2q7roOoYGBs5EiGoXpEoqvoi
	PYMFtmeChkLZcKyaIbatXfRGEuj/atd3FxBu0oeuNDSh/JPGfwn46PWmFdi1esbJONBFUIx2Mp2
	3k0j09/tx2RINtdc7GlvfHHhQe7EHo/vuYWfUnmSSUkgCR5wP5WYIX
X-Google-Smtp-Source: AGHT+IE/Qk/QqQuHAsjLa+G2CwTS9aXqktSn+cyuJ+Z52VY+4s3nvzF95EyT15R9UI99V2BNqoLTK20hhDgJv565BIU=
X-Received: by 2002:a05:6512:2212:b0:553:3945:82a3 with SMTP id
 2adb3069b0e04-5550b82b65emr1963119e87.9.1751094539292; Sat, 28 Jun 2025
 00:08:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627155513.25631-1-zhongjinji@honor.com>
In-Reply-To: <20250627155513.25631-1-zhongjinji@honor.com>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Sat, 28 Jun 2025 12:08:41 +0500
X-Gm-Features: Ac12FXzOTAxv6_tufZjnQzDuT2BephiRJkAR981JBorO1h8wOGwCtes1OzH8RY8
Message-ID: <CACzwLxhrx7musbwF7amVAQupXG4xjqFgTdZPmBrj7xAT8JYuRQ@mail.gmail.com>
Subject: Re: [PATCH] mm: vmscan: Page scanning depends on swappiness and refault
To: zhongjinji@honor.com
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, yuzhao@google.com, 
	linux-kernel@vger.kernel.org, yipengxiang@honor.com, liulu.liu@honor.com, 
	feng.han@honor.com, z00025326 <z00025326@hihonor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 8:55=E2=80=AFPM <zhongjinji@honor.com> wrote:
>
> From: z00025326 <z00025326@hihonor.com>
>
> The current MGLRU aging strategy isn=E2=80=99t flexible enough. For examp=
le,
> when the system load and pressure are low, reclaiming more anonymous
> pages might be better. But when the system is under heavy pressure,
> enough file pages are needed for quick reclaim. Right now, when MGLRU
> is on, changing the swappiness value doesn=E2=80=99t really let you prior=
itize
> reclaiming certain types of pages in different situations.
>
> This patch changes the aging strategy to adjust the reclaim ratio based
> on swappiness and refault values, allowing anonymous and file pages to
> age separately. and it can prioritize reclaiming certain types of pages
> and doesn=E2=80=99t have to wait until all the oldest pages are reclaimed=
 before
> moving on to the next aging generation.
>
> Signed-off-by: zhongjinji <zhongjinji@honor.com>

As Andrew pointed out, Documentation/admin-guide/mm/multigen_lru.rst
needs updates explaining how the new per-type aging affects swappiness
behavior. It's also better to split the patch on multiple ones for better
review, like data structure, algorithm changes. Aat least, the separate pat=
ch
for Documentation/ updates.

The patch silently changes averaging behavior without documenting
or commenting the rationale or impact. So the performance comparison is
also needed to present. Like in this patch all mm_stats access becomes 2D,
and adds additional loops and per-type processing. What is the performance
impact?

FWIW, I have commented below some code related details.

> ---
>  include/linux/mm_inline.h |  19 +-
>  include/linux/mmzone.h    |  13 +-
>  include/linux/swap.h      |   1 +
>  mm/vmscan.c               | 797 ++++++++++++++++++++++----------------
>  mm/workingset.c           |  10 +-
>  5 files changed, 494 insertions(+), 346 deletions(-)
>
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index 89b518ff097e..4761ea1fbd75 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -161,9 +161,9 @@ static inline int folio_lru_gen(struct folio *folio)
>         return ((flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
>  }
>
> -static inline bool lru_gen_is_active(struct lruvec *lruvec, int gen)
> +static inline bool lru_gen_is_active(struct lruvec *lruvec, int type, in=
t gen)
>  {
> -       unsigned long max_seq =3D lruvec->lrugen.max_seq;
> +       unsigned long max_seq =3D lruvec->lrugen.max_seq[type];
>
>         VM_WARN_ON_ONCE(gen >=3D MAX_NR_GENS);
>
> @@ -193,7 +193,7 @@ static inline void lru_gen_update_size(struct lruvec =
*lruvec, struct folio *foli
>
>         /* addition */
>         if (old_gen < 0) {
> -               if (lru_gen_is_active(lruvec, new_gen))
> +               if (lru_gen_is_active(lruvec, type, new_gen))
>                         lru +=3D LRU_ACTIVE;
>                 __update_lru_size(lruvec, lru, zone, delta);
>                 return;
> @@ -201,20 +201,21 @@ static inline void lru_gen_update_size(struct lruve=
c *lruvec, struct folio *foli
>
>         /* deletion */
>         if (new_gen < 0) {
> -               if (lru_gen_is_active(lruvec, old_gen))
> +               if (lru_gen_is_active(lruvec, type, old_gen))
>                         lru +=3D LRU_ACTIVE;
>                 __update_lru_size(lruvec, lru, zone, -delta);
>                 return;
>         }
>
>         /* promotion */
> -       if (!lru_gen_is_active(lruvec, old_gen) && lru_gen_is_active(lruv=
ec, new_gen)) {
> +       if (!lru_gen_is_active(lruvec, type, old_gen) && lru_gen_is_activ=
e(lruvec, type, new_gen)) {
>                 __update_lru_size(lruvec, lru, zone, -delta);
>                 __update_lru_size(lruvec, lru + LRU_ACTIVE, zone, delta);
>         }
>
>         /* demotion requires isolation, e.g., lru_deactivate_fn() */
> -       VM_WARN_ON_ONCE(lru_gen_is_active(lruvec, old_gen) && !lru_gen_is=
_active(lruvec, new_gen));
> +       VM_WARN_ON_ONCE(lru_gen_is_active(lruvec, type, old_gen) &&
> +               !lru_gen_is_active(lruvec, type, new_gen));
>  }
>
>  static inline unsigned long lru_gen_folio_seq(struct lruvec *lruvec, str=
uct folio *folio,
> @@ -247,7 +248,7 @@ static inline unsigned long lru_gen_folio_seq(struct =
lruvec *lruvec, struct foli
>         else
>                 gen =3D MAX_NR_GENS - folio_test_workingset(folio);
>
> -       return max(READ_ONCE(lrugen->max_seq) - gen + 1, READ_ONCE(lrugen=
->min_seq[type]));
> +       return max(READ_ONCE(lrugen->max_seq[type]) - gen + 1, READ_ONCE(=
lrugen->min_seq[type]));
>  }
>
>  static inline bool lru_gen_add_folio(struct lruvec *lruvec, struct folio=
 *folio, bool reclaiming)
> @@ -284,7 +285,7 @@ static inline bool lru_gen_del_folio(struct lruvec *l=
ruvec, struct folio *folio,
>  {
>         unsigned long flags;
>         int gen =3D folio_lru_gen(folio);
> -
> +       int type =3D folio_is_file_lru(folio);
>         if (gen < 0)
>                 return false;
>
> @@ -292,7 +293,7 @@ static inline bool lru_gen_del_folio(struct lruvec *l=
ruvec, struct folio *folio,
>         VM_WARN_ON_ONCE_FOLIO(folio_test_unevictable(folio), folio);
>
>         /* for folio_migrate_flags() */
> -       flags =3D !reclaiming && lru_gen_is_active(lruvec, gen) ? BIT(PG_=
active) : 0;
> +       flags =3D !reclaiming && lru_gen_is_active(lruvec, type,  gen) ? =
BIT(PG_active) : 0;
>         flags =3D set_mask_bits(&folio->flags, LRU_GEN_MASK, flags);
>         gen =3D ((flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
>
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 283913d42d7b..326310241e1e 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -470,11 +470,11 @@ enum {
>   */
>  struct lru_gen_folio {
>         /* the aging increments the youngest generation number */
> -       unsigned long max_seq;
> +       unsigned long max_seq[ANON_AND_FILE];
>         /* the eviction increments the oldest generation numbers */
>         unsigned long min_seq[ANON_AND_FILE];
>         /* the birth time of each generation in jiffies */
> -       unsigned long timestamps[MAX_NR_GENS];
> +       unsigned long timestamps[ANON_AND_FILE][MAX_NR_GENS];
>         /* the multi-gen LRU lists, lazily sorted on eviction */
>         struct list_head folios[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES]=
;
>         /* the multi-gen LRU sizes, eventually consistent */
> @@ -526,16 +526,17 @@ struct lru_gen_mm_walk {
>         /* the lruvec under reclaim */
>         struct lruvec *lruvec;
>         /* max_seq from lru_gen_folio: can be out of date */
> -       unsigned long seq;
> +       unsigned long seq[ANON_AND_FILE];
>         /* the next address within an mm to scan */
>         unsigned long next_addr;
>         /* to batch promoted pages */
>         int nr_pages[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES];
>         /* to batch the mm stats */
> -       int mm_stats[NR_MM_STATS];
> +       int mm_stats[ANON_AND_FILE][NR_MM_STATS];
> +       /* the type can be aged */
> +       bool can_age[ANON_AND_FILE];
>         /* total batched items */
>         int batched;
> -       int swappiness;
>         bool force_scan;
>  };
>
> @@ -669,7 +670,7 @@ struct lruvec {
>         struct lru_gen_folio            lrugen;
>  #ifdef CONFIG_LRU_GEN_WALKS_MMU
>         /* to concurrently iterate lru_gen_mm_list */
> -       struct lru_gen_mm_state         mm_state;
> +       struct lru_gen_mm_state         mm_state[ANON_AND_FILE];
>  #endif
>  #endif /* CONFIG_LRU_GEN */
>  #ifdef CONFIG_MEMCG
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index bc0e1c275fc0..de88c2e3db1d 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -414,6 +414,7 @@ extern unsigned long try_to_free_pages(struct zonelis=
t *zonelist, int order,
>  #define MEMCG_RECLAIM_PROACTIVE (1 << 2)
>  #define MIN_SWAPPINESS 0
>  #define MAX_SWAPPINESS 200
> +#define BALACNCE_SWAPPINESS 100

Typo: should be BALANCE_SWAPPINESS

>
>  /* Just recliam from anon folios in proactive memory reclaim */
>  #define SWAPPINESS_ANON_ONLY (MAX_SWAPPINESS + 1)
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index f8dfd2864bbf..7e4b2a1ebdc8 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -2358,6 +2358,11 @@ static void prepare_scan_control(pg_data_t *pgdat,=
 struct scan_control *sc)
>          */
>         mem_cgroup_flush_stats_ratelimited(sc->target_mem_cgroup);
>
> +       if (lru_gen_enabled()) {
> +               sc->may_deactivate &=3D ~DEACTIVATE_ANON;
> +               goto lru_gen_prepare;
> +       }
> +
>         /*
>          * Determine the scan balance between anon and file LRUs.
>          */
> @@ -2408,6 +2413,7 @@ static void prepare_scan_control(pg_data_t *pgdat, =
struct scan_control *sc)
>         else
>                 sc->cache_trim_mode =3D 0;
>
> +lru_gen_prepare:
>         /*
>          * Prevent the reclaimer from falling into the cache trap: as
>          * cache pages start out inactive, every cache fault will tip
> @@ -2705,9 +2711,16 @@ static bool should_clear_pmd_young(void)
>   *                          shorthand helpers
>   ***********************************************************************=
*******/
>
> -#define DEFINE_MAX_SEQ(lruvec)                                         \
> -       unsigned long max_seq =3D READ_ONCE((lruvec)->lrugen.max_seq)
> +#define DEFINE_MAX_TYPE_SEQ(lruvec, type)                               =
               \
> +       unsigned long max_seq =3D READ_ONCE((lruvec)->lrugen.max_seq[type=
])

nit: perhaps, rename it to `DEFINE_MAX_SEQ_TYPE` to follow the pattern of
similar macro namings, and to clearly indicate it defines max_seq for a
given type.

> +#define DEFINE_MIN_TYPE_SEQ(lruvec, type)                               =
               \

nit: similar comment as above.

> +       unsigned long min_seq =3D READ_ONCE((lruvec)->lrugen.min_seq[type=
])
>
> +#define DEFINE_MAX_SEQ(lruvec)                                         \
> +       unsigned long max_seq[ANON_AND_FILE] =3D {                       =
 \
> +               READ_ONCE((lruvec)->lrugen.max_seq[LRU_GEN_ANON]),      \
> +               READ_ONCE((lruvec)->lrugen.max_seq[LRU_GEN_FILE]),      \
> +       }
>  #define DEFINE_MIN_SEQ(lruvec)                                         \
>         unsigned long min_seq[ANON_AND_FILE] =3D {                       =
 \
>                 READ_ONCE((lruvec)->lrugen.min_seq[LRU_GEN_ANON]),      \
> @@ -2729,6 +2742,9 @@ static bool should_clear_pmd_young(void)
>  #define for_each_evictable_type(type, swappiness)                      \
>         for ((type) =3D min_type(swappiness); (type) <=3D max_type(swappi=
ness); (type)++)
>
> +#define for_each_gen_type(type)                                         =
                       \
> +       for ((type) =3D LRU_GEN_ANON; (type) < ANON_AND_FILE; (type)++)
> +
>  #define get_memcg_gen(seq)     ((seq) % MEMCG_NR_GENS)
>  #define get_memcg_bin(bin)     ((bin) % MEMCG_NR_BINS)
>
> @@ -2764,12 +2780,15 @@ static int get_swappiness(struct lruvec *lruvec, =
struct scan_control *sc)
>             mem_cgroup_get_nr_swap_pages(memcg) < MIN_LRU_BATCH)
>                 return 0;
>
> +       if ((!sc->priority && swappiness) || sc->file_is_tiny)
> +               return BALACNCE_SWAPPINESS;

This logic needs a comment explaining the rationale. It appears to
force balanced reclaim (50/50 anon/file split) when:
1. Under severe memory pressure (priority 0) with swap enabled
2. When file cache is too small to be effective

Should be documented in code comments, at least.

> +
>         return sc_swappiness(sc, memcg);
>  }
>
>  static int get_nr_gens(struct lruvec *lruvec, int type)
>  {
> -       return lruvec->lrugen.max_seq - lruvec->lrugen.min_seq[type] + 1;
> +       return lruvec->lrugen.max_seq[type] - lruvec->lrugen.min_seq[type=
] + 1;
>  }
>
>  static bool __maybe_unused seq_is_valid(struct lruvec *lruvec)
> @@ -2886,6 +2905,11 @@ static void reset_bloom_filter(struct lru_gen_mm_s=
tate *mm_state, unsigned long
>
>  #ifdef CONFIG_LRU_GEN_WALKS_MMU
>
> +static inline bool walk_mmu_enable(void)
> +{
> +       return true;
> +}

nit: introducing a new inline function just to check the CONFIG is too much=
.

> +
>  static struct lru_gen_mm_list *get_mm_list(struct mem_cgroup *memcg)
>  {
>         static struct lru_gen_mm_list mm_list =3D {
> @@ -2902,17 +2926,17 @@ static struct lru_gen_mm_list *get_mm_list(struct=
 mem_cgroup *memcg)
>         return &mm_list;
>  }
>
> -static struct lru_gen_mm_state *get_mm_state(struct lruvec *lruvec)
> +static struct lru_gen_mm_state *get_mm_state(struct lruvec *lruvec, int =
type)

Adding the type parameter creates a cascade of complexity throughout
the call chain. Every function now needs to know about and pass along
the type parameter.

walk_mm(mm, walk)
for_each_age_able_type(type, can_age)
iterate_mm_list(walk, &mm, type)
get_mm_state(lruvec, type)
reset_mm_stats(walk, type, last)

Consder alternative abstractions not to carry `type` parameter along all
caller functions. Perhaps, similar to the existing `for_each_evictable_type=
`:

#define for_each_mm_state_type(lruvec, state, type) \
for ((type) =3D 0; (type) < ANON_AND_FILE; (type)++) \
if (((state) =3D &(lruvec)->mm_state[type]))

>  {
> -       return &lruvec->mm_state;
> +       return &lruvec->mm_state[type];
>  }
>
> -static struct mm_struct *get_next_mm(struct lru_gen_mm_walk *walk)
> +static struct mm_struct *get_next_mm(struct lru_gen_mm_walk *walk, int t=
ype)
>  {
>         int key;
>         struct mm_struct *mm;
>         struct pglist_data *pgdat =3D lruvec_pgdat(walk->lruvec);
> -       struct lru_gen_mm_state *mm_state =3D get_mm_state(walk->lruvec);
> +       struct lru_gen_mm_state *mm_state =3D get_mm_state(walk->lruvec, =
type);
>
>         mm =3D list_entry(mm_state->head, struct mm_struct, lru_gen.list)=
;
>         key =3D pgdat->node_id % BITS_PER_TYPE(mm->lru_gen.bitmap);
> @@ -2927,7 +2951,7 @@ static struct mm_struct *get_next_mm(struct lru_gen=
_mm_walk *walk)
>
>  void lru_gen_add_mm(struct mm_struct *mm)
>  {
> -       int nid;
> +       int nid, type;
>         struct mem_cgroup *memcg =3D get_mem_cgroup_from_mm(mm);
>         struct lru_gen_mm_list *mm_list =3D get_mm_list(memcg);
>
> @@ -2940,11 +2964,14 @@ void lru_gen_add_mm(struct mm_struct *mm)
>
>         for_each_node_state(nid, N_MEMORY) {
>                 struct lruvec *lruvec =3D get_lruvec(memcg, nid);
> -               struct lru_gen_mm_state *mm_state =3D get_mm_state(lruvec=
);
>
> -               /* the first addition since the last iteration */
> -               if (mm_state->tail =3D=3D &mm_list->fifo)
> -                       mm_state->tail =3D &mm->lru_gen.list;
> +               for_each_gen_type(type) {
> +                       struct lru_gen_mm_state *mm_state =3D get_mm_stat=
e(lruvec, type);
> +
> +                       /* the first addition since the last iteration */
> +                       if (mm_state->tail =3D=3D &mm_list->fifo)
> +                               mm_state->tail =3D &mm->lru_gen.list;
> +               }
>         }
>
>         list_add_tail(&mm->lru_gen.list, &mm_list->fifo);
> @@ -2954,7 +2981,7 @@ void lru_gen_add_mm(struct mm_struct *mm)
>
>  void lru_gen_del_mm(struct mm_struct *mm)
>  {
> -       int nid;
> +       int nid, type;
>         struct lru_gen_mm_list *mm_list;
>         struct mem_cgroup *memcg =3D NULL;
>
> @@ -2970,15 +2997,18 @@ void lru_gen_del_mm(struct mm_struct *mm)
>
>         for_each_node(nid) {
>                 struct lruvec *lruvec =3D get_lruvec(memcg, nid);
> -               struct lru_gen_mm_state *mm_state =3D get_mm_state(lruvec=
);
>
> -               /* where the current iteration continues after */
> -               if (mm_state->head =3D=3D &mm->lru_gen.list)
> -                       mm_state->head =3D mm_state->head->prev;
> +               for_each_gen_type(type) {
> +                       struct lru_gen_mm_state *mm_state =3D get_mm_stat=
e(lruvec, type);
>
> -               /* where the last iteration ended before */
> -               if (mm_state->tail =3D=3D &mm->lru_gen.list)
> -                       mm_state->tail =3D mm_state->tail->next;
> +                       /* where the current iteration continues after */
> +                       if (mm_state->head =3D=3D &mm->lru_gen.list)
> +                               mm_state->head =3D mm_state->head->prev;
> +
> +                       /* where the last iteration ended before */
> +                       if (mm_state->tail =3D=3D &mm->lru_gen.list)
> +                               mm_state->tail =3D mm_state->tail->next;
> +               }
>         }
>
>         list_del_init(&mm->lru_gen.list);
> @@ -3023,57 +3053,63 @@ void lru_gen_migrate_mm(struct mm_struct *mm)
>
>  #else /* !CONFIG_LRU_GEN_WALKS_MMU */
>
> +static inline bool walk_mmu_enable(void)
> +{
> +       return false;
> +}
> +
>  static struct lru_gen_mm_list *get_mm_list(struct mem_cgroup *memcg)
>  {
>         return NULL;
>  }
>
> -static struct lru_gen_mm_state *get_mm_state(struct lruvec *lruvec)
> +static struct lru_gen_mm_state *get_mm_state(struct lruvec *lruvec, int =
type)
>  {
>         return NULL;
>  }
>
> -static struct mm_struct *get_next_mm(struct lru_gen_mm_walk *walk)
> +static struct mm_struct *get_next_mm(struct lru_gen_mm_walk *walk, int t=
ype)
>  {
>         return NULL;
>  }
>
>  #endif
>
> -static void reset_mm_stats(struct lru_gen_mm_walk *walk, bool last)
> +static void reset_mm_stats(struct lru_gen_mm_walk *walk, int type, bool =
last)
>  {
>         int i;
> -       int hist;
> +       int hist, seq =3D walk->seq[type];
>         struct lruvec *lruvec =3D walk->lruvec;
> -       struct lru_gen_mm_state *mm_state =3D get_mm_state(lruvec);
> +       struct lru_gen_mm_state *mm_state =3D get_mm_state(lruvec, type);
>
>         lockdep_assert_held(&get_mm_list(lruvec_memcg(lruvec))->lock);
>
> -       hist =3D lru_hist_from_seq(walk->seq);
> +       hist =3D lru_hist_from_seq(seq);
>
>         for (i =3D 0; i < NR_MM_STATS; i++) {
>                 WRITE_ONCE(mm_state->stats[hist][i],
> -                          mm_state->stats[hist][i] + walk->mm_stats[i]);
> -               walk->mm_stats[i] =3D 0;
> +                          mm_state->stats[hist][i] + walk->mm_stats[type=
][i]);
> +               walk->mm_stats[type][i] =3D 0;
>         }
>
>         if (NR_HIST_GENS > 1 && last) {
> -               hist =3D lru_hist_from_seq(walk->seq + 1);
> +               hist =3D lru_hist_from_seq(seq + 1);
>
>                 for (i =3D 0; i < NR_MM_STATS; i++)
>                         WRITE_ONCE(mm_state->stats[hist][i], 0);
>         }
>  }
>
> -static bool iterate_mm_list(struct lru_gen_mm_walk *walk, struct mm_stru=
ct **iter)
> +static bool iterate_mm_list(struct lru_gen_mm_walk *walk, struct mm_stru=
ct **iter, int type)
>  {
>         bool first =3D false;
>         bool last =3D false;
> +       int seq =3D walk->seq[type];
>         struct mm_struct *mm =3D NULL;
>         struct lruvec *lruvec =3D walk->lruvec;
>         struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
>         struct lru_gen_mm_list *mm_list =3D get_mm_list(memcg);
> -       struct lru_gen_mm_state *mm_state =3D get_mm_state(lruvec);
> +       struct lru_gen_mm_state *mm_state =3D get_mm_state(lruvec, type);
>
>         /*
>          * mm_state->seq is incremented after each iteration of mm_list. =
There
> @@ -3087,9 +3123,9 @@ static bool iterate_mm_list(struct lru_gen_mm_walk =
*walk, struct mm_struct **ite
>          */
>         spin_lock(&mm_list->lock);
>
> -       VM_WARN_ON_ONCE(mm_state->seq + 1 < walk->seq);
> +       VM_WARN_ON_ONCE(mm_state->seq + 1 < seq);
>
> -       if (walk->seq <=3D mm_state->seq)
> +       if (seq <=3D mm_state->seq)
>                 goto done;
>
>         if (!mm_state->head)
> @@ -3111,15 +3147,15 @@ static bool iterate_mm_list(struct lru_gen_mm_wal=
k *walk, struct mm_struct **ite
>                         mm_state->tail =3D mm_state->head->next;
>                         walk->force_scan =3D true;
>                 }
> -       } while (!(mm =3D get_next_mm(walk)));
> +       } while (!(mm =3D get_next_mm(walk, type)));
>  done:
>         if (*iter || last)
> -               reset_mm_stats(walk, last);
> +               reset_mm_stats(walk, type, last);
>
>         spin_unlock(&mm_list->lock);
>
>         if (mm && first)
> -               reset_bloom_filter(mm_state, walk->seq + 1);
> +               reset_bloom_filter(mm_state, seq + 1);
>
>         if (*iter)
>                 mmput_async(*iter);
> @@ -3129,12 +3165,12 @@ static bool iterate_mm_list(struct lru_gen_mm_wal=
k *walk, struct mm_struct **ite
>         return last;
>  }
>
> -static bool iterate_mm_list_nowalk(struct lruvec *lruvec, unsigned long =
seq)
> +static bool iterate_mm_list_nowalk(struct lruvec *lruvec, int type, unsi=
gned long seq)
>  {
>         bool success =3D false;
>         struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
>         struct lru_gen_mm_list *mm_list =3D get_mm_list(memcg);
> -       struct lru_gen_mm_state *mm_state =3D get_mm_state(lruvec);
> +       struct lru_gen_mm_state *mm_state =3D get_mm_state(lruvec, type);
>
>         spin_lock(&mm_list->lock);
>
> @@ -3205,7 +3241,7 @@ static void reset_ctrl_pos(struct lruvec *lruvec, i=
nt type, bool carryover)
>         int hist, tier;
>         struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
>         bool clear =3D carryover ? NR_HIST_GENS =3D=3D 1 : NR_HIST_GENS >=
 1;
> -       unsigned long seq =3D carryover ? lrugen->min_seq[type] : lrugen-=
>max_seq + 1;
> +       unsigned long seq =3D carryover ? lrugen->min_seq[type] : lrugen-=
>max_seq[type] + 1;
>
>         lockdep_assert_held(&lruvec->lru_lock);
>
> @@ -3220,12 +3256,12 @@ static void reset_ctrl_pos(struct lruvec *lruvec,=
 int type, bool carryover)
>
>                         sum =3D lrugen->avg_refaulted[type][tier] +
>                               atomic_long_read(&lrugen->refaulted[hist][t=
ype][tier]);
> -                       WRITE_ONCE(lrugen->avg_refaulted[type][tier], sum=
 / 2);

The averaging behavior is moved from reset_ctrl_pos() to the new
update_avg_status(), AFAIU. Please elaborate why move the averaging logic.

> +                       WRITE_ONCE(lrugen->avg_refaulted[type][tier], sum=
);
>
>                         sum =3D lrugen->avg_total[type][tier] +
>                               lrugen->protected[hist][type][tier] +
>                               atomic_long_read(&lrugen->evicted[hist][typ=
e][tier]);
> -                       WRITE_ONCE(lrugen->avg_total[type][tier], sum / 2=
);
> +                       WRITE_ONCE(lrugen->avg_total[type][tier], sum);
>                 }
>
>                 if (clear) {
> @@ -3341,7 +3377,7 @@ static void reset_batch_size(struct lru_gen_mm_walk=
 *walk)
>                 WRITE_ONCE(lrugen->nr_pages[gen][type][zone],
>                            lrugen->nr_pages[gen][type][zone] + delta);
>
> -               if (lru_gen_is_active(lruvec, gen))
> +               if (lru_gen_is_active(lruvec, type, gen))
>                         lru +=3D LRU_ACTIVE;
>                 __update_lru_size(lruvec, lru, zone, delta);
>         }
> @@ -3352,6 +3388,7 @@ static int should_skip_vma(unsigned long start, uns=
igned long end, struct mm_wal
>         struct address_space *mapping;
>         struct vm_area_struct *vma =3D args->vma;
>         struct lru_gen_mm_walk *walk =3D args->private;
> +       bool *can_age =3D walk->can_age;
>
>         if (!vma_is_accessible(vma))
>                 return true;
> @@ -3369,7 +3406,7 @@ static int should_skip_vma(unsigned long start, uns=
igned long end, struct mm_wal
>                 return true;
>
>         if (vma_is_anonymous(vma))
> -               return !walk->swappiness;
> +               return !can_age[LRU_GEN_ANON];
>
>         if (WARN_ON_ONCE(!vma->vm_file || !vma->vm_file->f_mapping))
>                 return true;
> @@ -3379,9 +3416,9 @@ static int should_skip_vma(unsigned long start, uns=
igned long end, struct mm_wal
>                 return true;
>
>         if (shmem_mapping(mapping))
> -               return !walk->swappiness;
> +               return !can_age[LRU_GEN_ANON];
>
> -       if (walk->swappiness > MAX_SWAPPINESS)
> +       if (!can_age[LRU_GEN_FILE])
>                 return true;
>
>         /* to exclude special mappings like dax, etc. */
> @@ -3494,14 +3531,20 @@ static bool suitable_to_scan(int total, int young=
)
>         return young * n >=3D total;
>  }
>
> -static void walk_update_folio(struct lru_gen_mm_walk *walk, struct folio=
 *folio,
> -                             int new_gen, bool dirty)
> +static void walk_update_folio(struct lru_gen_mm_walk *walk, struct lruve=
c *lruvec,
> +                           struct folio *folio, bool dirty)
>  {
> -       int old_gen;
> +       int type;
> +       int old_gen, new_gen;
> +       unsigned long max_seq;
>
>         if (!folio)
>                 return;
>
> +       type =3D folio_is_file_lru(folio);
> +       max_seq =3D READ_ONCE((lruvec)->lrugen.max_seq[type]);
> +       new_gen =3D lru_gen_from_seq(max_seq);
> +
>         if (dirty && !folio_test_dirty(folio) &&
>             !(folio_test_anon(folio) && folio_test_swapbacked(folio) &&
>               !folio_test_swapcache(folio)))
> @@ -3518,6 +3561,22 @@ static void walk_update_folio(struct lru_gen_mm_wa=
lk *walk, struct folio *folio,
>         }
>  }
>
> +static int get_vma_type(struct vm_area_struct *vma)
> +{
> +       struct address_space *mapping;
> +
> +       if (vma_is_anonymous(vma))
> +               return LRU_GEN_ANON;
> +
> +       if (vma->vm_file && vma->vm_file->f_mapping) {
> +               mapping =3D vma->vm_file->f_mapping;
> +               if (shmem_mapping(mapping))
> +                       return LRU_GEN_ANON;
> +       }
> +
> +       return LRU_GEN_FILE;
> +}
> +
>  static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned lon=
g end,
>                            struct mm_walk *args)
>  {
> @@ -3532,8 +3591,7 @@ static bool walk_pte_range(pmd_t *pmd, unsigned lon=
g start, unsigned long end,
>         struct lru_gen_mm_walk *walk =3D args->private;
>         struct mem_cgroup *memcg =3D lruvec_memcg(walk->lruvec);
>         struct pglist_data *pgdat =3D lruvec_pgdat(walk->lruvec);
> -       DEFINE_MAX_SEQ(walk->lruvec);
> -       int gen =3D lru_gen_from_seq(max_seq);
> +       int type =3D get_vma_type(args->vma);
>         pmd_t pmdval;
>
>         pte =3D pte_offset_map_rw_nolock(args->mm, pmd, start & PMD_MASK,=
 &pmdval, &ptl);
> @@ -3558,7 +3616,7 @@ static bool walk_pte_range(pmd_t *pmd, unsigned lon=
g start, unsigned long end,
>                 pte_t ptent =3D ptep_get(pte + i);
>
>                 total++;
> -               walk->mm_stats[MM_LEAF_TOTAL]++;
> +               walk->mm_stats[type][MM_LEAF_TOTAL]++;
>
>                 pfn =3D get_pte_pfn(ptent, args->vma, addr, pgdat);
>                 if (pfn =3D=3D -1)
> @@ -3572,7 +3630,7 @@ static bool walk_pte_range(pmd_t *pmd, unsigned lon=
g start, unsigned long end,
>                         continue;
>
>                 if (last !=3D folio) {
> -                       walk_update_folio(walk, last, gen, dirty);
> +                       walk_update_folio(walk, walk->lruvec, last, dirty=
);
>
>                         last =3D folio;
>                         dirty =3D false;
> @@ -3582,10 +3640,10 @@ static bool walk_pte_range(pmd_t *pmd, unsigned l=
ong start, unsigned long end,
>                         dirty =3D true;
>
>                 young++;
> -               walk->mm_stats[MM_LEAF_YOUNG]++;
> +               walk->mm_stats[type][MM_LEAF_YOUNG]++;
>         }
>
> -       walk_update_folio(walk, last, gen, dirty);
> +       walk_update_folio(walk, walk->lruvec, last, dirty);
>         last =3D NULL;
>
>         if (i < PTRS_PER_PTE && get_next_vma(PMD_MASK, PAGE_SIZE, args, &=
start, &end))
> @@ -3608,9 +3666,7 @@ static void walk_pmd_range_locked(pud_t *pud, unsig=
ned long addr, struct vm_area
>         struct lru_gen_mm_walk *walk =3D args->private;
>         struct mem_cgroup *memcg =3D lruvec_memcg(walk->lruvec);
>         struct pglist_data *pgdat =3D lruvec_pgdat(walk->lruvec);
> -       DEFINE_MAX_SEQ(walk->lruvec);
> -       int gen =3D lru_gen_from_seq(max_seq);
> -
> +       int type =3D get_vma_type(vma);
>         VM_WARN_ON_ONCE(pud_leaf(*pud));
>
>         /* try to batch at most 1+MIN_LRU_BATCH+1 entries */
> @@ -3663,7 +3719,7 @@ static void walk_pmd_range_locked(pud_t *pud, unsig=
ned long addr, struct vm_area
>                         goto next;
>
>                 if (last !=3D folio) {
> -                       walk_update_folio(walk, last, gen, dirty);
> +                       walk_update_folio(walk, walk->lruvec, last, dirty=
);
>
>                         last =3D folio;
>                         dirty =3D false;
> @@ -3672,12 +3728,12 @@ static void walk_pmd_range_locked(pud_t *pud, uns=
igned long addr, struct vm_area
>                 if (pmd_dirty(pmd[i]))
>                         dirty =3D true;
>
> -               walk->mm_stats[MM_LEAF_YOUNG]++;
> +               walk->mm_stats[type][MM_LEAF_YOUNG]++;
>  next:
>                 i =3D i > MIN_LRU_BATCH ? 0 : find_next_bit(bitmap, MIN_L=
RU_BATCH, i) + 1;
>         } while (i <=3D MIN_LRU_BATCH);
>
> -       walk_update_folio(walk, last, gen, dirty);
> +       walk_update_folio(walk, walk->lruvec, last, dirty);
>
>         arch_leave_lazy_mmu_mode();
>         spin_unlock(ptl);
> @@ -3688,7 +3744,7 @@ static void walk_pmd_range_locked(pud_t *pud, unsig=
ned long addr, struct vm_area
>  static void walk_pmd_range(pud_t *pud, unsigned long start, unsigned lon=
g end,
>                            struct mm_walk *args)
>  {
> -       int i;
> +       int i, type;
>         pmd_t *pmd;
>         unsigned long next;
>         unsigned long addr;
> @@ -3696,7 +3752,7 @@ static void walk_pmd_range(pud_t *pud, unsigned lon=
g start, unsigned long end,
>         DECLARE_BITMAP(bitmap, MIN_LRU_BATCH);
>         unsigned long first =3D -1;
>         struct lru_gen_mm_walk *walk =3D args->private;
> -       struct lru_gen_mm_state *mm_state =3D get_mm_state(walk->lruvec);
> +       struct lru_gen_mm_state *mm_state;
>
>         VM_WARN_ON_ONCE(pud_leaf(*pud));
>
> @@ -3709,13 +3765,15 @@ static void walk_pmd_range(pud_t *pud, unsigned l=
ong start, unsigned long end,
>  restart:
>         /* walk_pte_range() may call get_next_vma() */
>         vma =3D args->vma;
> +       type =3D get_vma_type(vma);
> +       mm_state =3D get_mm_state(walk->lruvec, type);
>         for (i =3D pmd_index(start), addr =3D start; addr !=3D end; i++, =
addr =3D next) {
>                 pmd_t val =3D pmdp_get_lockless(pmd + i);
>
>                 next =3D pmd_addr_end(addr, end);
>
>                 if (!pmd_present(val) || is_huge_zero_pmd(val)) {
> -                       walk->mm_stats[MM_LEAF_TOTAL]++;
> +                       walk->mm_stats[type][MM_LEAF_TOTAL]++;
>                         continue;
>                 }
>
> @@ -3723,7 +3781,7 @@ static void walk_pmd_range(pud_t *pud, unsigned lon=
g start, unsigned long end,
>                         struct pglist_data *pgdat =3D lruvec_pgdat(walk->=
lruvec);
>                         unsigned long pfn =3D get_pmd_pfn(val, vma, addr,=
 pgdat);
>
> -                       walk->mm_stats[MM_LEAF_TOTAL]++;
> +                       walk->mm_stats[type][MM_LEAF_TOTAL]++;
>
>                         if (pfn !=3D -1)
>                                 walk_pmd_range_locked(pud, addr, vma, arg=
s, bitmap, &first);
> @@ -3738,18 +3796,18 @@ static void walk_pmd_range(pud_t *pud, unsigned l=
ong start, unsigned long end,
>                         walk_pmd_range_locked(pud, addr, vma, args, bitma=
p, &first);
>                 }
>
> -               if (!walk->force_scan && !test_bloom_filter(mm_state, wal=
k->seq, pmd + i))
> +               if (!walk->force_scan && !test_bloom_filter(mm_state, wal=
k->seq[type], pmd + i))
>                         continue;
>
> -               walk->mm_stats[MM_NONLEAF_FOUND]++;
> +               walk->mm_stats[type][MM_NONLEAF_FOUND]++;
>
>                 if (!walk_pte_range(&val, addr, next, args))
>                         continue;
>
> -               walk->mm_stats[MM_NONLEAF_ADDED]++;
> +               walk->mm_stats[type][MM_NONLEAF_ADDED]++;
>
>                 /* carry over to the next generation */
> -               update_bloom_filter(mm_state, walk->seq + 1, pmd + i);
> +               update_bloom_filter(mm_state, walk->seq[type] + 1, pmd + =
i);
>         }
>
>         walk_pmd_range_locked(pud, -1, vma, args, bitmap, &first);
> @@ -3800,6 +3858,21 @@ static int walk_pud_range(p4d_t *p4d, unsigned lon=
g start, unsigned long end,
>         return -EAGAIN;
>  }
>
> +static inline bool check_max_seq_valid(struct lruvec *lruvec,
> +                                 bool *can_age, unsigned long *seq)

nit: wrong indentation.

> +{
> +       int type;
> +       bool valid =3D false;
> +       DEFINE_MAX_SEQ(lruvec);
> +
> +       for_each_gen_type(type) {
> +               can_age[type] &=3D seq[type] =3D=3D max_seq[type];
> +               valid |=3D can_age[type];
> +       }
> +
> +       return valid;
> +}
> +
>  static void walk_mm(struct mm_struct *mm, struct lru_gen_mm_walk *walk)
>  {
>         static const struct mm_walk_ops mm_walk_ops =3D {
> @@ -3813,12 +3886,10 @@ static void walk_mm(struct mm_struct *mm, struct =
lru_gen_mm_walk *walk)
>         walk->next_addr =3D FIRST_USER_ADDRESS;
>
>         do {
> -               DEFINE_MAX_SEQ(lruvec);
> -
>                 err =3D -EBUSY;
>
>                 /* another thread might have called inc_max_seq() */
> -               if (walk->seq !=3D max_seq)
> +               if (!check_max_seq_valid(lruvec, walk->can_age, walk->seq=
))
>                         break;
>
>                 /* the caller might be holding the lock for write */
> @@ -3870,7 +3941,7 @@ static void clear_mm_walk(void)
>                 kfree(walk);
>  }
>
> -static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
> +static bool inc_min_seq(struct lruvec *lruvec, int type)
>  {
>         int zone;
>         int remaining =3D MAX_LRU_BATCH;
> @@ -3878,14 +3949,6 @@ static bool inc_min_seq(struct lruvec *lruvec, int=
 type, int swappiness)
>         int hist =3D lru_hist_from_seq(lrugen->min_seq[type]);
>         int new_gen, old_gen =3D lru_gen_from_seq(lrugen->min_seq[type]);
>
> -       /* For file type, skip the check if swappiness is anon only */
> -       if (type && (swappiness =3D=3D SWAPPINESS_ANON_ONLY))
> -               goto done;
> -
> -       /* For anon type, skip the check if swappiness is zero (file only=
) */
> -       if (!type && !swappiness)
> -               goto done;
> -
>         /* prevent cold/hot inversion if the type is evictable */
>         for (zone =3D 0; zone < MAX_NR_ZONES; zone++) {
>                 struct list_head *head =3D &lrugen->folios[old_gen][type]=
[zone];
> @@ -3916,83 +3979,70 @@ static bool inc_min_seq(struct lruvec *lruvec, in=
t type, int swappiness)
>                                 return false;
>                 }
>         }
> -done:
>         reset_ctrl_pos(lruvec, type, true);
>         WRITE_ONCE(lrugen->min_seq[type], lrugen->min_seq[type] + 1);
>
>         return true;
>  }
>
> -static bool try_to_inc_min_seq(struct lruvec *lruvec, int swappiness)
> +static bool try_to_inc_min_seq(struct lruvec *lruvec, int type)
>  {
> -       int gen, type, zone;
> -       bool success =3D false;
> +       int gen, zone;
>         struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> -       DEFINE_MIN_SEQ(lruvec);
> +       DEFINE_MIN_TYPE_SEQ(lruvec, type);
> +       DEFINE_MAX_TYPE_SEQ(lruvec, type);
> +       unsigned long seq =3D max_seq - MIN_NR_GENS + 1;
>
>         VM_WARN_ON_ONCE(!seq_is_valid(lruvec));
>
>         /* find the oldest populated generation */
> -       for_each_evictable_type(type, swappiness) {
> -               while (min_seq[type] + MIN_NR_GENS <=3D lrugen->max_seq) =
{
> -                       gen =3D lru_gen_from_seq(min_seq[type]);
> +       while (min_seq + MIN_NR_GENS <=3D max_seq) {
> +               gen =3D lru_gen_from_seq(min_seq);
>
> -                       for (zone =3D 0; zone < MAX_NR_ZONES; zone++) {
> -                               if (!list_empty(&lrugen->folios[gen][type=
][zone]))
> -                                       goto next;
> -                       }
> -
> -                       min_seq[type]++;
> +               for (zone =3D 0; zone < MAX_NR_ZONES; zone++) {
> +                       if (!list_empty(&lrugen->folios[gen][type][zone])=
)
> +                               goto done;
>                 }
> -next:
> -               ;
> +
> +               min_seq++;
>         }
>
> +done:
>         /* see the comment on lru_gen_folio */
> -       if (swappiness && swappiness <=3D MAX_SWAPPINESS) {
> -               unsigned long seq =3D lrugen->max_seq - MIN_NR_GENS;
> -
> -               if (min_seq[LRU_GEN_ANON] > seq && min_seq[LRU_GEN_FILE] =
< seq)
> -                       min_seq[LRU_GEN_ANON] =3D seq;
> -               else if (min_seq[LRU_GEN_FILE] > seq && min_seq[LRU_GEN_A=
NON] < seq)
> -                       min_seq[LRU_GEN_FILE] =3D seq;
> -       }
> +       if (min_seq > seq)
> +               min_seq =3D seq;
>
> -       for_each_evictable_type(type, swappiness) {
> -               if (min_seq[type] <=3D lrugen->min_seq[type])
> -                       continue;
> +       if (min_seq <=3D lrugen->min_seq[type])
> +               return false;
>
> -               reset_ctrl_pos(lruvec, type, true);
> -               WRITE_ONCE(lrugen->min_seq[type], min_seq[type]);
> -               success =3D true;
> -       }
> +       reset_ctrl_pos(lruvec, type, true);
> +       WRITE_ONCE(lrugen->min_seq[type], min_seq);
>
> -       return success;
> +       return true;
>  }
>
> -static bool inc_max_seq(struct lruvec *lruvec, unsigned long seq, int sw=
appiness)
> +static bool inc_max_seq(struct lruvec *lruvec, unsigned long *seq, bool =
*can_age)
>  {
>         bool success;
>         int prev, next;
>         int type, zone;
>         struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> -restart:
> -       if (seq < READ_ONCE(lrugen->max_seq))
> -               return false;
>
> +restart:
>         spin_lock_irq(&lruvec->lru_lock);
>
>         VM_WARN_ON_ONCE(!seq_is_valid(lruvec));
>
> -       success =3D seq =3D=3D lrugen->max_seq;
> -       if (!success)
> -               goto unlock;
> +       for_each_gen_type(type) {
>
> -       for (type =3D 0; type < ANON_AND_FILE; type++) {
> +               can_age[type] &=3D (seq[type] =3D=3D lrugen->max_seq[type=
]);
> +
> +               if (!can_age[type])
> +                       continue;
>                 if (get_nr_gens(lruvec, type) !=3D MAX_NR_GENS)
>                         continue;
>
> -               if (inc_min_seq(lruvec, type, swappiness))
> +               if (inc_min_seq(lruvec, type))
>                         continue;
>
>                 spin_unlock_irq(&lruvec->lru_lock);
> @@ -4000,16 +4050,23 @@ static bool inc_max_seq(struct lruvec *lruvec, un=
signed long seq, int swappiness
>                 goto restart;
>         }
>
> -       /*
> -        * Update the active/inactive LRU sizes for compatibility. Both s=
ides of
> -        * the current max_seq need to be covered, since max_seq+1 can ov=
erlap
> -        * with min_seq[LRU_GEN_ANON] if swapping is constrained. And if =
they do
> -        * overlap, cold/hot inversion happens.
> -        */
> -       prev =3D lru_gen_from_seq(lrugen->max_seq - 1);
> -       next =3D lru_gen_from_seq(lrugen->max_seq + 1);
> +       success =3D can_age[LRU_GEN_ANON] || can_age[LRU_GEN_FILE];
> +       if (!success)
> +               goto unlock;
> +
> +       for_each_gen_type(type) {
> +
> +               if (!can_age[type])
> +                       continue;
> +               /*
> +                * Update the active/inactive LRU sizes for compatibility=
. Both sides of
> +                * the current max_seq need to be covered, since max_seq+=
1 can overlap
> +                * with min_seq[LRU_GEN_ANON] if swapping is constrained.=
 And if they do
> +                * overlap, cold/hot inversion happens.
> +                */
> +               prev =3D lru_gen_from_seq(lrugen->max_seq[type] - 1);
> +               next =3D lru_gen_from_seq(lrugen->max_seq[type] + 1);
>
> -       for (type =3D 0; type < ANON_AND_FILE; type++) {
>                 for (zone =3D 0; zone < MAX_NR_ZONES; zone++) {
>                         enum lru_list lru =3D type * LRU_INACTIVE_FILE;
>                         long delta =3D lrugen->nr_pages[prev][type][zone]=
 -
> @@ -4021,36 +4078,26 @@ static bool inc_max_seq(struct lruvec *lruvec, un=
signed long seq, int swappiness
>                         __update_lru_size(lruvec, lru, zone, delta);
>                         __update_lru_size(lruvec, lru + LRU_ACTIVE, zone,=
 -delta);
>                 }
> -       }
>
> -       for (type =3D 0; type < ANON_AND_FILE; type++)
>                 reset_ctrl_pos(lruvec, type, false);
> +               WRITE_ONCE(lrugen->timestamps[type][next], jiffies);
> +               /* make sure preceding modifications appear */
> +               smp_store_release(&lrugen->max_seq[type], lrugen->max_seq=
[type] + 1);
> +       }
>
> -       WRITE_ONCE(lrugen->timestamps[next], jiffies);
> -       /* make sure preceding modifications appear */
> -       smp_store_release(&lrugen->max_seq, lrugen->max_seq + 1);
>  unlock:
>         spin_unlock_irq(&lruvec->lru_lock);
>
>         return success;
>  }
>
> -static bool try_to_inc_max_seq(struct lruvec *lruvec, unsigned long seq,
> -                              int swappiness, bool force_scan)
> +static bool can_mm_list_age(struct lruvec *lruvec, struct lru_gen_mm_wal=
k *walk,
> +                 int type, unsigned long seq)
>  {
> -       bool success;
> -       struct lru_gen_mm_walk *walk;
> -       struct mm_struct *mm =3D NULL;
> -       struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> -       struct lru_gen_mm_state *mm_state =3D get_mm_state(lruvec);
> -
> -       VM_WARN_ON_ONCE(seq > READ_ONCE(lrugen->max_seq));
> -
> -       if (!mm_state)
> -               return inc_max_seq(lruvec, seq, swappiness);
> +       struct lru_gen_mm_state *mm_state =3D get_mm_state(lruvec, type);
>
>         /* see the comment in iterate_mm_list() */
> -       if (seq <=3D READ_ONCE(mm_state->seq))
> +       if (seq <=3D READ_ONCE(mm_state->.seq))
>                 return false;
>
>         /*
> @@ -4060,29 +4107,61 @@ static bool try_to_inc_max_seq(struct lruvec *lru=
vec, unsigned long seq,
>          * is less efficient, but it avoids bursty page faults.
>          */
>         if (!should_walk_mmu()) {
> -               success =3D iterate_mm_list_nowalk(lruvec, seq);
> -               goto done;
> +               return iterate_mm_list_nowalk(lruvec, type, seq);
>         }
>
>         walk =3D set_mm_walk(NULL, true);
>         if (!walk) {
> -               success =3D iterate_mm_list_nowalk(lruvec, seq);
> -               goto done;
> +               return iterate_mm_list_nowalk(lruvec, type, seq);
>         }
>
> +       return true;
> +}
> +
> +static bool try_to_inc_max_seq(struct lruvec *lruvec, unsigned long *seq=
,
> +                              bool *can_age, bool force_scan)
> +{
> +       int type;
> +       bool success;
> +       struct lru_gen_mm_walk *walk =3D NULL;
> +       struct mm_struct *mm =3D NULL;
> +       struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> +
> +       if (!walk_mmu_enable())
> +               return inc_max_seq(lruvec, seq, can_age);
> +
> +       for_each_gen_type(type) {
> +               if (!can_age[type])
> +                       continue;
> +               VM_WARN_ON_ONCE(seq[type] > READ_ONCE(lrugen->max_seq[typ=
e]));
> +
> +               can_age[type] =3D can_mm_list_age(lruvec, walk, type, seq=
[type]);
> +       }
> +
> +       success =3D can_age[LRU_GEN_ANON] || can_age[LRU_GEN_FILE];
> +       if (!success || !walk)
> +               goto done;
> +
>         walk->lruvec =3D lruvec;
> -       walk->seq =3D seq;
> -       walk->swappiness =3D swappiness;
>         walk->force_scan =3D force_scan;
>
> +       for_each_gen_type(type) {
> +               walk->seq[type] =3D seq[type];
> +               walk->can_age[type] =3D can_age[type];
> +       }
> +
>         do {
> -               success =3D iterate_mm_list(walk, &mm);
> +               for_each_age_able_type(type, can_age) {
> +                       can_age[type] =3D iterate_mm_list(walk, &mm, type=
);
> +               }
>                 if (mm)
>                         walk_mm(mm, walk);
>         } while (mm);
> +
> +       success =3D can_age[LRU_GEN_ANON] || can_age[LRU_GEN_FILE];
>  done:
>         if (success) {
> -               success =3D inc_max_seq(lruvec, seq, swappiness);
> +               success =3D inc_max_seq(lruvec, seq, can_age);
>                 WARN_ON_ONCE(!success);
>         }
>
> @@ -4132,7 +4211,7 @@ static bool lruvec_is_sizable(struct lruvec *lruvec=
, struct scan_control *sc)
>         for_each_evictable_type(type, swappiness) {
>                 unsigned long seq;
>
> -               for (seq =3D min_seq[type]; seq <=3D max_seq; seq++) {
> +               for (seq =3D min_seq[type]; seq <=3D max_seq[type]; seq++=
) {
>                         gen =3D lru_gen_from_seq(seq);
>
>                         for (zone =3D 0; zone < MAX_NR_ZONES; zone++)
> @@ -4147,7 +4226,8 @@ static bool lruvec_is_sizable(struct lruvec *lruvec=
, struct scan_control *sc)
>  static bool lruvec_is_reclaimable(struct lruvec *lruvec, struct scan_con=
trol *sc,
>                                   unsigned long min_ttl)
>  {
> -       int gen;
> +       int gen, type;
> +       bool reclaimable =3D false;
>         unsigned long birth;
>         int swappiness =3D get_swappiness(lruvec, sc);
>         struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
> @@ -4159,10 +4239,13 @@ static bool lruvec_is_reclaimable(struct lruvec *=
lruvec, struct scan_control *sc
>         if (!lruvec_is_sizable(lruvec, sc))
>                 return false;
>
> -       gen =3D lru_gen_from_seq(evictable_min_seq(min_seq, swappiness));
> -       birth =3D READ_ONCE(lruvec->lrugen.timestamps[gen]);
> +       for_each_evictable_type(type, swappiness) {
> +               gen =3D lru_gen_from_seq(min_seq[type]);
> +               birth =3D READ_ONCE(lruvec->lrugen.timestamps[type][gen])=
;
> +               reclaimable |=3D time_is_before_jiffies(birth + min_ttl);
> +       }
>
> -       return time_is_before_jiffies(birth + min_ttl);
> +       return reclaimable;
>  }
>
>  /* to protect the working set of the last N jiffies */
> @@ -4227,13 +4310,13 @@ bool lru_gen_look_around(struct page_vma_mapped_w=
alk *pvmw)
>         pte_t *pte =3D pvmw->pte;
>         unsigned long addr =3D pvmw->address;
>         struct vm_area_struct *vma =3D pvmw->vma;
> +       int type =3D get_vma_type(vma);
>         struct folio *folio =3D pfn_folio(pvmw->pfn);
>         struct mem_cgroup *memcg =3D folio_memcg(folio);
>         struct pglist_data *pgdat =3D folio_pgdat(folio);
>         struct lruvec *lruvec =3D mem_cgroup_lruvec(memcg, pgdat);
> -       struct lru_gen_mm_state *mm_state =3D get_mm_state(lruvec);
> -       DEFINE_MAX_SEQ(lruvec);
> -       int gen =3D lru_gen_from_seq(max_seq);
> +       struct lru_gen_mm_state *mm_state;
> +       DEFINE_MAX_TYPE_SEQ(lruvec, type);
>
>         lockdep_assert_held(pvmw->ptl);
>         VM_WARN_ON_ONCE_FOLIO(folio_test_lru(folio), folio);
> @@ -4288,7 +4371,7 @@ bool lru_gen_look_around(struct page_vma_mapped_wal=
k *pvmw)
>                         continue;
>
>                 if (last !=3D folio) {
> -                       walk_update_folio(walk, last, gen, dirty);
> +                       walk_update_folio(walk, lruvec, last, dirty);
>
>                         last =3D folio;
>                         dirty =3D false;
> @@ -4299,14 +4382,15 @@ bool lru_gen_look_around(struct page_vma_mapped_w=
alk *pvmw)
>
>                 young++;
>         }
> -
> -       walk_update_folio(walk, last, gen, dirty);
> +       walk_update_folio(walk, lruvec, last, dirty);
>
>         arch_leave_lazy_mmu_mode();
>
>         /* feedback from rmap walkers to page table walkers */
> -       if (mm_state && suitable_to_scan(i, young))
> +       if (walk_mmu_enable() && suitable_to_scan(i, young)) {
> +               mm_state =3D get_mm_state(lruvec, type);
>                 update_bloom_filter(mm_state, max_seq, pvmw->pmd);
> +       }
>
>         return true;
>  }
> @@ -4554,11 +4638,32 @@ static bool isolate_folio(struct lruvec *lruvec, =
struct folio *folio, struct sca
>         return true;
>  }
>
> -static int scan_folios(struct lruvec *lruvec, struct scan_control *sc,
> -                      int type, int tier, struct list_head *list)
> +static int get_tier_idx(struct lruvec *lruvec, int type)
> +{
> +       int tier;
> +       struct ctrl_pos sp, pv;
> +
> +       /*
> +        * To leave a margin for fluctuations, use a larger gain factor (=
2:3).
> +        * This value is chosen because any other tier would have at leas=
t twice
> +        * as many refaults as the first tier.
> +        */
> +       read_ctrl_pos(lruvec, type, 0, 2, &sp);
> +       for (tier =3D 1; tier < MAX_NR_TIERS; tier++) {
> +               read_ctrl_pos(lruvec, type, tier, 3, &pv);
> +               if (!positive_ctrl_err(&sp, &pv))
> +                       break;
> +       }
> +
> +       return tier - 1;
> +}
> +
> +static int isolate_folios(struct lruvec *lruvec, struct scan_control *sc=
,
> +                      int type, struct list_head *list, int nr_to_scan)
>  {
>         int i;
>         int gen;
> +       int tier;
>         enum vm_event_item item;
>         int sorted =3D 0;
>         int scanned =3D 0;
> @@ -4573,6 +4678,7 @@ static int scan_folios(struct lruvec *lruvec, struc=
t scan_control *sc,
>         if (get_nr_gens(lruvec, type) =3D=3D MIN_NR_GENS)
>                 return 0;
>
> +       tier =3D get_tier_idx(lruvec, type);
>         gen =3D lru_gen_from_seq(lrugen->min_seq[type]);
>
>         for (i =3D MAX_NR_ZONES; i > 0; i--) {
> @@ -4602,7 +4708,7 @@ static int scan_folios(struct lruvec *lruvec, struc=
t scan_control *sc,
>                                 skipped_zone +=3D delta;
>                         }
>
> -                       if (!--remaining || max(isolated, skipped_zone) >=
=3D MIN_LRU_BATCH)
> +                       if (!--remaining || max(isolated, skipped_zone) >=
=3D nr_to_scan)
>                                 break;
>                 }
>
> @@ -4612,7 +4718,7 @@ static int scan_folios(struct lruvec *lruvec, struc=
t scan_control *sc,
>                         skipped +=3D skipped_zone;
>                 }
>
> -               if (!remaining || isolated >=3D MIN_LRU_BATCH)
> +               if (!remaining || isolated >=3D nr_to_scan)
>                         break;
>         }
>
> @@ -4636,70 +4742,9 @@ static int scan_folios(struct lruvec *lruvec, stru=
ct scan_control *sc,
>         return isolated || !remaining ? scanned : 0;
>  }
>
> -static int get_tier_idx(struct lruvec *lruvec, int type)
> -{
> -       int tier;
> -       struct ctrl_pos sp, pv;
> -
> -       /*
> -        * To leave a margin for fluctuations, use a larger gain factor (=
2:3).
> -        * This value is chosen because any other tier would have at leas=
t twice
> -        * as many refaults as the first tier.
> -        */
> -       read_ctrl_pos(lruvec, type, 0, 2, &sp);
> -       for (tier =3D 1; tier < MAX_NR_TIERS; tier++) {
> -               read_ctrl_pos(lruvec, type, tier, 3, &pv);
> -               if (!positive_ctrl_err(&sp, &pv))
> -                       break;
> -       }
> -
> -       return tier - 1;
> -}
>
> -static int get_type_to_scan(struct lruvec *lruvec, int swappiness)
> +static int evict_folios(struct lruvec *lruvec, struct scan_control *sc, =
int type, int nr_to_scan)
>  {
> -       struct ctrl_pos sp, pv;
> -
> -       if (swappiness <=3D MIN_SWAPPINESS + 1)
> -               return LRU_GEN_FILE;
> -
> -       if (swappiness >=3D MAX_SWAPPINESS)
> -               return LRU_GEN_ANON;
> -       /*
> -        * Compare the sum of all tiers of anon with that of file to dete=
rmine
> -        * which type to scan.
> -        */
> -       read_ctrl_pos(lruvec, LRU_GEN_ANON, MAX_NR_TIERS, swappiness, &sp=
);
> -       read_ctrl_pos(lruvec, LRU_GEN_FILE, MAX_NR_TIERS, MAX_SWAPPINESS =
- swappiness, &pv);
> -
> -       return positive_ctrl_err(&sp, &pv);
> -}
> -
> -static int isolate_folios(struct lruvec *lruvec, struct scan_control *sc=
, int swappiness,
> -                         int *type_scanned, struct list_head *list)
> -{
> -       int i;
> -       int type =3D get_type_to_scan(lruvec, swappiness);
> -
> -       for_each_evictable_type(i, swappiness) {
> -               int scanned;
> -               int tier =3D get_tier_idx(lruvec, type);
> -
> -               *type_scanned =3D type;
> -
> -               scanned =3D scan_folios(lruvec, sc, type, tier, list);
> -               if (scanned)
> -                       return scanned;
> -
> -               type =3D !type;
> -       }
> -
> -       return 0;
> -}
> -
> -static int evict_folios(struct lruvec *lruvec, struct scan_control *sc, =
int swappiness)
> -{
> -       int type;
>         int scanned;
>         int reclaimed;
>         LIST_HEAD(list);
> @@ -4710,17 +4755,16 @@ static int evict_folios(struct lruvec *lruvec, st=
ruct scan_control *sc, int swap
>         struct reclaim_stat stat;
>         struct lru_gen_mm_walk *walk;
>         bool skip_retry =3D false;
> -       struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
>         struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
>         struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
>
>         spin_lock_irq(&lruvec->lru_lock);
>
> -       scanned =3D isolate_folios(lruvec, sc, swappiness, &type, &list);
> +       scanned =3D isolate_folios(lruvec, sc, type, &list, nr_to_scan);
>
> -       scanned +=3D try_to_inc_min_seq(lruvec, swappiness);
> +       scanned +=3D try_to_inc_min_seq(lruvec, type);
>
> -       if (evictable_min_seq(lrugen->min_seq, swappiness) + MIN_NR_GENS =
> lrugen->max_seq)
> +       if (get_nr_gens(lruvec, type) =3D=3D MIN_NR_GENS)
>                 scanned =3D 0;
>
>         spin_unlock_irq(&lruvec->lru_lock);
> @@ -4787,33 +4831,84 @@ static int evict_folios(struct lruvec *lruvec, st=
ruct scan_control *sc, int swap
>         return scanned;
>  }
>
> -static bool should_run_aging(struct lruvec *lruvec, unsigned long max_se=
q,
> -                            int swappiness, unsigned long *nr_to_scan)
> +static bool should_run_aging(struct lruvec *lruvec, int type, unsigned l=
ong *nr_to_scan)
>  {
> -       int gen, type, zone;
> +       int gen, zone;
> +       unsigned long seq;
>         unsigned long size =3D 0;
>         struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> -       DEFINE_MIN_SEQ(lruvec);
> +       DEFINE_MIN_TYPE_SEQ(lruvec, type);
> +       DEFINE_MAX_TYPE_SEQ(lruvec, type);
>
> -       *nr_to_scan =3D 0;
>         /* have to run aging, since eviction is not possible anymore */
> -       if (evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS > max_se=
q)
> +       if (min_seq + MIN_NR_GENS > max_seq)
>                 return true;
>
> -       for_each_evictable_type(type, swappiness) {
> -               unsigned long seq;
> -
> -               for (seq =3D min_seq[type]; seq <=3D max_seq; seq++) {
> -                       gen =3D lru_gen_from_seq(seq);
> +       for (seq =3D min_seq; seq <=3D max_seq; seq++) {
> +               gen =3D lru_gen_from_seq(seq);
>
> -                       for (zone =3D 0; zone < MAX_NR_ZONES; zone++)
> -                               size +=3D max(READ_ONCE(lrugen->nr_pages[=
gen][type][zone]), 0L);
> -               }
> +               for (zone =3D 0; zone < MAX_NR_ZONES; zone++)
> +                       size +=3D max(READ_ONCE(lrugen->nr_pages[gen][typ=
e][zone]), 0L);
>         }
>
>         *nr_to_scan =3D size;
>         /* better to run aging even though eviction is still possible */
> -       return evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS =3D=
=3D max_seq;
> +       return min_seq + MIN_NR_GENS =3D=3D max_seq;
> +}
> +
> +static inline void update_avg_status(struct lru_gen_folio *lrugen)
> +{
> +       int type, tier;
> +
> +       for_each_gen_type(type) {
> +               for (tier =3D 0; tier < MAX_NR_TIERS; tier++) {
> +                       WRITE_ONCE(lrugen->avg_refaulted[type][tier],
> +                                       lrugen->avg_refaulted[type][tier]=
 / 2);
> +                       WRITE_ONCE(lrugen->avg_total[type][tier],
> +                                       lrugen->avg_total[type][tier] / 2=
);
> +               }
> +       }
> +}
> +
> +static unsigned long get_lru_gen_scan_count(struct lruvec *lruvec, struc=
t scan_control *sc,
> +                       int swappiness, unsigned long *nr_to_scan)
> +{
> +       int tier, type;
> +       unsigned long total_refault, denominator, total_size;
> +       unsigned long refault[ANON_AND_FILE] =3D {0};
> +       unsigned long fraction[ANON_AND_FILE] =3D {0};
> +       struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> +
> +       for_each_gen_type(type) {
> +               int hist =3D lru_hist_from_seq(lrugen->min_seq[type]);
> +
> +               for (tier =3D 0; tier < MAX_NR_TIERS; tier++) {
> +                       refault[type] +=3D lrugen->avg_refaulted[type][ti=
er] +
> +                               atomic_long_read(&lrugen->refaulted[hist]=
[type][tier]);
> +               }
> +
> +       }
> +
> +       total_refault =3D refault[LRU_GEN_ANON] + refault[LRU_GEN_FILE];
> +       total_size =3D nr_to_scan[LRU_GEN_ANON] + nr_to_scan[LRU_GEN_FILE=
];
> +
> +       if (total_refault > total_size * MAX_NR_TIERS)
> +               update_avg_status(lrugen);
> +
> +       for_each_gen_type(type) {
> +               refault[type]  =3D total_refault + refault[type];
> +               fraction[type] =3D (type ? 200 - swappiness : swappiness)=
 * (total_refault + 1);
> +               fraction[type] /=3D refault[type] + 1;
> +       }
> +
> +       denominator =3D fraction[LRU_GEN_ANON] + fraction[LRU_GEN_FILE];
> +
> +       for_each_evictable_type(type, swappiness) {
> +               nr_to_scan[type] =3D nr_to_scan[type] >> sc->priority;
> +               nr_to_scan[type] =3D div64_u64(nr_to_scan[type] * fractio=
n[type], denominator);
> +       }
> +
> +       return nr_to_scan[LRU_GEN_ANON] + nr_to_scan[LRU_GEN_FILE];
>  }
>
>  /*
> @@ -4821,28 +4916,37 @@ static bool should_run_aging(struct lruvec *lruve=
c, unsigned long max_seq,
>   * 1. Defer try_to_inc_max_seq() to workqueues to reduce latency for mem=
cg
>   *    reclaim.
>   */
> -static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *s=
c, int swappiness)
> +static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *s=
c,
> +                     int swappiness, unsigned long *nr_to_scan)
>  {
> +       int type;
>         bool success;
> -       unsigned long nr_to_scan;
> +       unsigned long total =3D 0;
> +       bool can_age[ANON_AND_FILE] =3D {false};
>         struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
>         DEFINE_MAX_SEQ(lruvec);
>
>         if (mem_cgroup_below_min(sc->target_mem_cgroup, memcg))
>                 return -1;
>
> -       success =3D should_run_aging(lruvec, max_seq, swappiness, &nr_to_=
scan);
> +       for_each_evictable_type(type, swappiness) {
> +               can_age[type] =3D should_run_aging(lruvec, type, &nr_to_s=
can[type]);
> +               total +=3D nr_to_scan[type];
> +       }
>
>         /* try to scrape all its memory if this memcg was deleted */
> -       if (nr_to_scan && !mem_cgroup_online(memcg))
> -               return nr_to_scan;
> +       if (total && !mem_cgroup_online(memcg))
> +               return total;
>
> +       success =3D can_age[LRU_GEN_ANON] || can_age[LRU_GEN_FILE];
>         /* try to get away with not aging at the default priority */
> -       if (!success || sc->priority =3D=3D DEF_PRIORITY)
> -               return nr_to_scan >> sc->priority;
> +       if (!success || sc->priority =3D=3D DEF_PRIORITY) {
> +               total =3D get_lru_gen_scan_count(lruvec, sc, swappiness, =
nr_to_scan);
> +               return total;
> +       }
>
>         /* stop scanning this lruvec as it's low on cold folios */
> -       return try_to_inc_max_seq(lruvec, max_seq, swappiness, false) ? -=
1 : 0;
> +       return try_to_inc_max_seq(lruvec, max_seq, can_age, false) ? -1 :=
 0;
>  }
>
>  static bool should_abort_scan(struct lruvec *lruvec, struct scan_control=
 *sc)
> @@ -4878,23 +4982,34 @@ static bool should_abort_scan(struct lruvec *lruv=
ec, struct scan_control *sc)
>
>  static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_cont=
rol *sc)
>  {
> -       long nr_to_scan;
> -       unsigned long scanned =3D 0;
> +       int type;
> +       long to_scan, scanned_total;
> +       unsigned long scanned[ANON_AND_FILE] =3D {0};
> +       unsigned long nr_to_scan[ANON_AND_FILE] =3D {0};
>         int swappiness =3D get_swappiness(lruvec, sc);
>
>         while (true) {
>                 int delta;
> +               bool evict_success =3D false;
>
> -               nr_to_scan =3D get_nr_to_scan(lruvec, sc, swappiness);
> -               if (nr_to_scan <=3D 0)
> +               to_scan =3D get_nr_to_scan(lruvec, sc, swappiness, nr_to_=
scan);
> +               if (to_scan <=3D 0)
>                         break;
>
> -               delta =3D evict_folios(lruvec, sc, swappiness);
> -               if (!delta)
> +               for_each_evictable_type(type, swappiness) {
> +                       if (scanned[type] >=3D nr_to_scan[type])
> +                               continue;
> +
> +                       delta =3D evict_folios(lruvec, sc, type, nr_to_sc=
an[type]);
> +                       scanned[type] +=3D delta;
> +                       evict_success |=3D delta;
> +               }
> +
> +               if (!evict_success)
>                         break;
>
> -               scanned +=3D delta;
> -               if (scanned >=3D nr_to_scan)
> +               scanned_total =3D scanned[LRU_GEN_ANON] + scanned[LRU_GEN=
_FILE];
> +               if (scanned_total > to_scan)
>                         break;
>
>                 if (should_abort_scan(lruvec, sc))
> @@ -4911,7 +5026,7 @@ static bool try_to_shrink_lruvec(struct lruvec *lru=
vec, struct scan_control *sc)
>                 wakeup_flusher_threads(WB_REASON_VMSCAN);
>
>         /* whether this lruvec should be rotated */
> -       return nr_to_scan < 0;
> +       return to_scan < 0;
>  }
>
>  static int shrink_one(struct lruvec *lruvec, struct scan_control *sc)
> @@ -5363,22 +5478,29 @@ static void *lru_gen_seq_next(struct seq_file *m,=
 void *v, loff_t *pos)
>  }
>
>  static void lru_gen_seq_show_full(struct seq_file *m, struct lruvec *lru=
vec,
> -                                 unsigned long max_seq, unsigned long *m=
in_seq,
> -                                 unsigned long seq)
> +                                 unsigned long *max_seq, unsigned long *=
min_seq,
> +                                 int seq_offset)
>  {
>         int i;
> -       int type, tier;
> -       int hist =3D lru_hist_from_seq(seq);
> +       int tier, type;
> +       unsigned long seq;
> +       int hist;
>         struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> -       struct lru_gen_mm_state *mm_state =3D get_mm_state(lruvec);
> +       struct lru_gen_mm_state *mm_state;
>
>         for (tier =3D 0; tier < MAX_NR_TIERS; tier++) {
>                 seq_printf(m, "            %10d", tier);
> +
>                 for (type =3D 0; type < ANON_AND_FILE; type++) {
>                         const char *s =3D "xxx";
>                         unsigned long n[3] =3D {};
>
> -                       if (seq =3D=3D max_seq) {
> +                       seq =3D min_seq[type] + seq_offset;
> +                       hist =3D lru_hist_from_seq(seq);
> +                       if (seq > max_seq[type])
> +                               continue;
> +
> +                       if (seq =3D=3D max_seq[type]) {
>                                 s =3D "RTx";
>                                 n[0] =3D READ_ONCE(lrugen->avg_refaulted[=
type][tier]);
>                                 n[1] =3D READ_ONCE(lrugen->avg_total[type=
][tier]);
> @@ -5395,23 +5517,29 @@ static void lru_gen_seq_show_full(struct seq_file=
 *m, struct lruvec *lruvec,
>                 seq_putc(m, '\n');
>         }
>
> -       if (!mm_state)
> +       if (!walk_mmu_enable())
>                 return;
>
>         seq_puts(m, "                      ");
>         for (i =3D 0; i < NR_MM_STATS; i++) {
>                 const char *s =3D "xxxx";
>                 unsigned long n =3D 0;
> +               for (type =3D 0; type < ANON_AND_FILE; type++) {
> +                       seq =3D min_seq[type] + seq_offset;
> +                       hist =3D lru_hist_from_seq(seq);
> +                       if (seq > max_seq[type])
> +                               continue;
> +                       mm_state =3D get_mm_state(lruvec, type);
> +                       if (seq =3D=3D max_seq[type] && NR_HIST_GENS =3D=
=3D 1) {
> +                               s =3D "TYFA";
> +                               n =3D READ_ONCE(mm_state->stats[hist][i])=
;
> +                       } else if (seq !=3D max_seq[type] && NR_HIST_GENS=
 > 1) {
> +                               s =3D "tyfa";
> +                               n =3D READ_ONCE(mm_state->stats[hist][i])=
;
> +                       }
>
> -               if (seq =3D=3D max_seq && NR_HIST_GENS =3D=3D 1) {
> -                       s =3D "TYFA";
> -                       n =3D READ_ONCE(mm_state->stats[hist][i]);
> -               } else if (seq !=3D max_seq && NR_HIST_GENS > 1) {
> -                       s =3D "tyfa";
> -                       n =3D READ_ONCE(mm_state->stats[hist][i]);
> +                       seq_printf(m, " %10lu%c", n, s[i]);
>                 }
> -
> -               seq_printf(m, " %10lu%c", n, s[i]);
>         }
>         seq_putc(m, '\n');
>  }
> @@ -5419,6 +5547,7 @@ static void lru_gen_seq_show_full(struct seq_file *=
m, struct lruvec *lruvec,
>  /* see Documentation/admin-guide/mm/multigen_lru.rst for details */
>  static int lru_gen_seq_show(struct seq_file *m, void *v)
>  {
> +       int i;
>         unsigned long seq;
>         bool full =3D !debugfs_real_fops(m->file)->write;
>         struct lruvec *lruvec =3D v;
> @@ -5440,34 +5569,29 @@ static int lru_gen_seq_show(struct seq_file *m, v=
oid *v)
>
>         seq_printf(m, " node %5d\n", nid);
>
> -       if (!full)
> -               seq =3D evictable_min_seq(min_seq, MAX_SWAPPINESS / 2);
> -       else if (max_seq >=3D MAX_NR_GENS)
> -               seq =3D max_seq - MAX_NR_GENS + 1;
> -       else
> -               seq =3D 0;
> -
> -       for (; seq <=3D max_seq; seq++) {
> +       for (i =3D 0; i < MAX_NR_GENS; i++) {
>                 int type, zone;
> -               int gen =3D lru_gen_from_seq(seq);
> -               unsigned long birth =3D READ_ONCE(lruvec->lrugen.timestam=
ps[gen]);
> -
> -               seq_printf(m, " %10lu %10u", seq, jiffies_to_msecs(jiffie=
s - birth));
> -
>                 for (type =3D 0; type < ANON_AND_FILE; type++) {
> +
> +                       seq =3D min_seq[type] + i;
> +                       if (seq > max_seq[type])
> +                               continue;
> +                       int gen =3D lru_gen_from_seq(seq);
> +                       unsigned long birth =3D READ_ONCE(lruvec->lrugen.=
timestamps[type][gen]);
>                         unsigned long size =3D 0;
>                         char mark =3D full && seq < min_seq[type] ? 'x' :=
 ' ';
>
>                         for (zone =3D 0; zone < MAX_NR_ZONES; zone++)
>                                 size +=3D max(READ_ONCE(lrugen->nr_pages[=
gen][type][zone]), 0L);
>
> +                       seq_printf(m, " %10lu %10u", seq, jiffies_to_msec=
s(jiffies - birth));
>                         seq_printf(m, " %10lu%c", size, mark);
>                 }
>
>                 seq_putc(m, '\n');
>
>                 if (full)
> -                       lru_gen_seq_show_full(m, lruvec, max_seq, min_seq=
, seq);
> +                       lru_gen_seq_show_full(m, lruvec, max_seq, min_seq=
, i);
>         }
>
>         return 0;
> @@ -5483,36 +5607,50 @@ static const struct seq_operations lru_gen_seq_op=
s =3D {
>  static int run_aging(struct lruvec *lruvec, unsigned long seq,
>                      int swappiness, bool force_scan)
>  {
> +       int type;
>         DEFINE_MAX_SEQ(lruvec);
> +       bool can_age[ANON_AND_FILE] =3D {false};
>
> -       if (seq > max_seq)
> +       for_each_evictable_type(type, swappiness) {
> +               if (seq > max_seq[type])
> +                       continue;
> +               can_age[type] =3D true;
> +       }
> +
> +       if (!can_age[LRU_GEN_ANON] && !can_age[LRU_GEN_FILE])
>                 return -EINVAL;
>
> -       return try_to_inc_max_seq(lruvec, max_seq, swappiness, force_scan=
) ? 0 : -EEXIST;
> +       return try_to_inc_max_seq(lruvec, max_seq, can_age, force_scan) ?=
 0 : -EEXIST;
>  }
>
>  static int run_eviction(struct lruvec *lruvec, unsigned long seq, struct=
 scan_control *sc,
>                         int swappiness, unsigned long nr_to_reclaim)
>  {
> -       DEFINE_MAX_SEQ(lruvec);
> -
> -       if (seq + MIN_NR_GENS > max_seq)
> -               return -EINVAL;
> -
> +       int type, status =3D -EINVAL;
>         sc->nr_reclaimed =3D 0;
>
>         while (!signal_pending(current)) {
>                 DEFINE_MIN_SEQ(lruvec);
> +               DEFINE_MAX_SEQ(lruvec);
>
> -               if (seq < evictable_min_seq(min_seq, swappiness))
> -                       return 0;
> +               status =3D -EINVAL;
>
> -               if (sc->nr_reclaimed >=3D nr_to_reclaim)
> -                       return 0;
> +               for_each_evictable_type(type, swappiness) {
> +                       if (seq + MIN_NR_GENS > max_seq[type])
> +                               continue;
>
> -               if (!evict_folios(lruvec, sc, swappiness))
> -                       return 0;
> +                       if (seq < min_seq[type])
> +                               continue;
>
> +                       status =3D 0;
> +                       if (sc->nr_reclaimed >=3D nr_to_reclaim)
> +                               return 0;
> +
> +                       if (!evict_folios(lruvec, sc, type, nr_to_reclaim=
))
> +                               return 0;
> +               }
> +               if (status < 0)
> +                       return status;
>                 cond_resched();
>         }
>
> @@ -5691,19 +5829,23 @@ void lru_gen_init_lruvec(struct lruvec *lruvec)
>         int i;
>         int gen, type, zone;
>         struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> -       struct lru_gen_mm_state *mm_state =3D get_mm_state(lruvec);
> +       struct lru_gen_mm_state *mm_state;
>
> -       lrugen->max_seq =3D MIN_NR_GENS + 1;
> -       lrugen->enabled =3D lru_gen_enabled();
> +       for_each_gen_type(type) {
> +               lrugen->max_seq[type] =3D MIN_NR_GENS + 1;
> +               for (i =3D 0; i <=3D MIN_NR_GENS + 1; i++)
> +                       lrugen->timestamps[type][i] =3D jiffies;
> +
> +               if (walk_mmu_enable()) {
> +                       mm_state =3D get_mm_state(lruvec, type);
> +                       mm_state->seq =3D MIN_NR_GENS;
> +               }
> +       }
>
> -       for (i =3D 0; i <=3D MIN_NR_GENS + 1; i++)
> -               lrugen->timestamps[i] =3D jiffies;
>
> +       lrugen->enabled =3D lru_gen_enabled();
>         for_each_gen_type_zone(gen, type, zone)
>                 INIT_LIST_HEAD(&lrugen->folios[gen][type][zone]);
> -
> -       if (mm_state)
> -               mm_state->seq =3D MIN_NR_GENS;
>  }
>
>  #ifdef CONFIG_MEMCG
> @@ -5722,26 +5864,29 @@ void lru_gen_init_memcg(struct mem_cgroup *memcg)
>  void lru_gen_exit_memcg(struct mem_cgroup *memcg)
>  {
>         int i;
> -       int nid;
> +       int nid, type;
>         struct lru_gen_mm_list *mm_list =3D get_mm_list(memcg);
>
>         VM_WARN_ON_ONCE(mm_list && !list_empty(&mm_list->fifo));
>
>         for_each_node(nid) {
>                 struct lruvec *lruvec =3D get_lruvec(memcg, nid);
> -               struct lru_gen_mm_state *mm_state =3D get_mm_state(lruvec=
);
> +               struct lru_gen_mm_state *mm_state;
>
>                 VM_WARN_ON_ONCE(memchr_inv(lruvec->lrugen.nr_pages, 0,
>                                            sizeof(lruvec->lrugen.nr_pages=
)));
>
>                 lruvec->lrugen.list.next =3D LIST_POISON1;
>
> -               if (!mm_state)
> +               if (!walk_mmu_enable())
>                         continue;
>
> -               for (i =3D 0; i < NR_BLOOM_FILTERS; i++) {
> -                       bitmap_free(mm_state->filters[i]);
> -                       mm_state->filters[i] =3D NULL;
> +               for_each_gen_type(type) {
> +                       mm_state =3D get_mm_state(lruvec, type);
> +                       for (i =3D 0; i < NR_BLOOM_FILTERS; i++) {
> +                               bitmap_free(mm_state->filters[i]);
> +                               mm_state->filters[i] =3D NULL;
> +                       }
>                 }
>         }
>  }
> diff --git a/mm/workingset.c b/mm/workingset.c
> index 6e7f4cb1b9a7..4d5ef14fc912 100644
> --- a/mm/workingset.c
> +++ b/mm/workingset.c
> @@ -262,7 +262,7 @@ static void *lru_gen_eviction(struct folio *folio)
>   * Fills in @lruvec, @token, @workingset with the values unpacked from s=
hadow.
>   */
>  static bool lru_gen_test_recent(void *shadow, struct lruvec **lruvec,
> -                               unsigned long *token, bool *workingset)
> +                               unsigned long *token, bool *workingset, i=
nt type)
>  {
>         int memcg_id;
>         unsigned long max_seq;
> @@ -274,7 +274,7 @@ static bool lru_gen_test_recent(void *shadow, struct =
lruvec **lruvec,
>         memcg =3D mem_cgroup_from_id(memcg_id);
>         *lruvec =3D mem_cgroup_lruvec(memcg, pgdat);
>
> -       max_seq =3D READ_ONCE((*lruvec)->lrugen.max_seq);
> +       max_seq =3D READ_ONCE((*lruvec)->lrugen.max_seq[type]);
>         max_seq &=3D EVICTION_MASK >> LRU_REFS_WIDTH;
>
>         return abs_diff(max_seq, *token >> LRU_REFS_WIDTH) < MAX_NR_GENS;
> @@ -293,7 +293,7 @@ static void lru_gen_refault(struct folio *folio, void=
 *shadow)
>
>         rcu_read_lock();
>
> -       recent =3D lru_gen_test_recent(shadow, &lruvec, &token, &workings=
et);
> +       recent =3D lru_gen_test_recent(shadow, &lruvec, &token, &workings=
et, type);
>         if (lruvec !=3D folio_lruvec(folio))
>                 goto unlock;
>
> @@ -331,7 +331,7 @@ static void *lru_gen_eviction(struct folio *folio)
>  }
>
>  static bool lru_gen_test_recent(void *shadow, struct lruvec **lruvec,
> -                               unsigned long *token, bool *workingset)
> +                               unsigned long *token, bool *workingset, i=
nt type)
>  {
>         return false;
>  }
> @@ -431,7 +431,7 @@ bool workingset_test_recent(void *shadow, bool file, =
bool *workingset,
>                 bool recent;
>
>                 rcu_read_lock();
> -               recent =3D lru_gen_test_recent(shadow, &eviction_lruvec, =
&eviction, workingset);
> +               recent =3D lru_gen_test_recent(shadow, &eviction_lruvec, =
&eviction, workingset, file);
>                 rcu_read_unlock();
>                 return recent;
>         }
> --
> 2.17.1
>
>
