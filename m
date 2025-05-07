Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EE728B40E
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746636758; cv=none; b=FGcfDvF+H4ZRSulYmLZjfOcffGgHsI/6xICQanid5GDYGrz4nmglP1y1vGnfxC2q5WDpkeVCmvLak015BonUXCZ2I69tej7KqWbwCDuWsuDO+Jqi/q0OlORkflK8vHtjNCh/flHI1NaqYJbgUOxartITeF29IUPuTgu3lOAKgSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746636758; c=relaxed/simple;
	bh=SvriLAY4tqocWjR67Z1UvWSi8Z2M0izp+2Ews5nyV2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GmFBerVO0t5nOJR6wvEg+MSjNheN7mqbGf4l25OP0zpvb20Vq0BbGw/FbFTxx9IKbAl34aFvBRA0bKyFuxWUui9tHVNv8/X9mWaiB067HjG7TYcXsjVsPzMPKE1uSojUNAX+cAHHsUgiwNsDDO55csEEHyHPDs9Go3hMpo/kBBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KM4jNbh4; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KM4jNbh4"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3da73d35c11so5405ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 09:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746636756; x=1747241556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hv8GwvXmYC8+EkUfOb+Rq82WOJczckO52LbqfSz6J9Q=;
        b=KM4jNbh4F04nSkhn1YSAwNM0YfVgpnH+wIL5cb+Z4BUftWDP58ngGGBnrzGbCGmJeY
         ueD0sCqIJ+7XW7j6PwIn+jCUcVDFEaJzUfKqmcIf+v+v+JtjYW/78l+8AQsUTlBd97ql
         BOW2RjEhvnTDtqSKY+Aa9CYcoqXHvBW29oSexpYVYuHAvnbIukiBl6PL58cDHfszy8Lh
         h9z1ex1N+lquIEDlcbbItBR7qhLn/XzcQA5pdEW/GZeuDTGn1CkGZZUgjzHIZHAUa520
         G1qoenrLmzHq/haRgafrBVn0VCErinNOXdBllB+KOc72Anatwwun4eIJqdZZ5hzLVZFS
         8Rrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746636756; x=1747241556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hv8GwvXmYC8+EkUfOb+Rq82WOJczckO52LbqfSz6J9Q=;
        b=jJfHwU0Cnssm9A6En1mqC19WodUGNt06VUqX7Xgjx86XOApQX74Cg9rXKV6mRumRcz
         DqStT7PzsaEvJJdiDZeDdf07oJTZAqCk6oNDr63Ce4Rc5jNHRBcxImIKCJ3IH0cN0DXZ
         dUwpTsT+rNWxe5/n0RNag/HM1M1Ff4d0Oxi+NOdfhykKt6RVyEtp3JCRMFeur/qKpY8s
         3FZiyVGFJ0MAn+PlRa1tcmmNMn5eASNhpoISAxLVPljLPGMmXl9jsUNyR3WxxRqt5g5g
         UYivlPCUbgkuvdzasZ0ZIgu3OfKxdnclrpjMzhbSbxbtYlcUkqunDi9q958nwf4SrV14
         bvCA==
X-Forwarded-Encrypted: i=1; AJvYcCUNqS+062pnLBXEwsE4NgmKoxBpcUxo1rtWe/EpANSZojwXIPMAssBkt+fF8C4+IrQmRc+K2SSI6vP6ZO8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5+pmz0YlwhlVwb2eT4fiQMVylSq+/9FAc9d252Oy2iSH+FRmy
	6HwjLFyAb633QvSoPjxfB9XAJDn/frNsZA8VfwyiiJb9ZGBciQQHx/vycwF/yr1YdFDNMoXRT9m
	Fpa1pgZRmAoj2Ux/uXABHaIB1HZMZhGNVDaO/
X-Gm-Gg: ASbGncumcHfaiByagi9FUaWIYO5tb+ocoZ6bmD5UbJg121uzPsetlESRKqW/E7vwsGL
	44twc6xHNBHiuAg6rkZWgwhrLhJAuFecdqP8hu+Bdxx/E2QYf05+vt99ttdg6aLfmkZOqn454AA
	Ja6v/LcEsaeTBOGWK1X37Mu99VJrJdT3Kn81mOJfuFF87kdtu41CI=
X-Google-Smtp-Source: AGHT+IHk6P3Dbhek/nvVqKBGspo+Pf7s7x7KRyrupTiVsqy2UzwjoFgpSYE3fLh21rGgPLk6dWKYwmGZvVXZ1WAtABc=
X-Received: by 2002:a05:6e02:1c0c:b0:3d8:18f8:fb02 with SMTP id
 e9e14a558f8ab-3da740f0edcmr3325945ab.17.1746636755902; Wed, 07 May 2025
 09:52:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506164740.1317237-1-kan.liang@linux.intel.com> <20250506164740.1317237-2-kan.liang@linux.intel.com>
In-Reply-To: <20250506164740.1317237-2-kan.liang@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 7 May 2025 09:52:24 -0700
X-Gm-Features: ATxdqUGZfF3SPhuNJRBiWU0JCKQyrtzl5Ioq80WzxyQa4_lxXSuGDS4VJRPjkBo
Message-ID: <CAP-5=fXgLJR2EQoK3SVrGWOKVWuZ4+ZVWFHLU8B_w2ibWtFzwg@mail.gmail.com>
Subject: Re: [RFC PATCH 01/15] perf: Fix the throttle logic for a group
To: kan.liang@linux.intel.com
Cc: peterz@infradead.org, mingo@redhat.com, namhyung@kernel.org, 
	mark.rutland@arm.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, eranian@google.com, ctshao@google.com, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 9:48=E2=80=AFAM <kan.liang@linux.intel.com> wrote:
>
> From: Kan Liang <kan.liang@linux.intel.com>
>
> The current throttle logic doesn't work well with a group, e.g., the
> following sampling-read case.
>
> $ perf record -e "{cycles,cycles}:S" ...
>
> $ perf report -D | grep THROTTLE | tail -2
>             THROTTLE events:        426  ( 9.0%)
>           UNTHROTTLE events:        425  ( 9.0%)
>
> $ perf report -D | grep PERF_RECORD_SAMPLE -a4 | tail -n 5
> 0 1020120874009167 0x74970 [0x68]: PERF_RECORD_SAMPLE(IP, 0x1):
> ... sample_read:
> .... group nr 2
> ..... id 0000000000000327, value 000000000cbb993a, lost 0
> ..... id 0000000000000328, value 00000002211c26df, lost 0
>
> The second cycles event has a much larger value than the first cycles
> event in the same group.
>
> The current throttle logic in the generic code only logs the THROTTLE
> event. It relies on the specific driver implementation to disable
> events. However, for all ARCHs, the implementation is similar. It only
> disable the event, rather than the group.
>
> The logic to disable the group should be generic for all ARCHs. Add the
> logic in the generic code. The following patch will remove the buggy
> driver-specific implementation.
>
> The throttle only happens when an event is overflowed. Stop the entire
> group when any event in the group triggers the throttle. Set the
> MAX_INTERRUPTS to the leader event to indicate the group is throttled.
>
> The unthrottled could happen in 3 places.
> - event/group sched. All events in the group are scheduled one by one.
>   All of them will be unthrottled eventually. Nothing needs to be
>   changed.
> - The perf_adjust_freq_unthr_events for each tick. Needs to restart the
>   group altogether.
> - The __perf_event_period(). The whole group needs to be restarted
>   altogether as well.
>
> With the fix,
> $ sudo perf report -D | grep PERF_RECORD_SAMPLE -a4 | tail -n 5
> 0 3573470770332 0x12f5f8 [0x70]: PERF_RECORD_SAMPLE(IP, 0x2):
> ... sample_read:
> .... group nr 2
> ..... id 0000000000000a28, value 00000004fd3dfd8f, lost 0
> ..... id 0000000000000a29, value 00000004fd3dfd8f, lost 0

Thanks Kan! The patches look good to me. As I understand it patches 2
to 15 are just removing the logic where an event is unnecessarily
stopped twice, so is it possible to test just this patch in isolation?
Given the logic is generic it is applied to software events, so you
should be able to repeat the problem with `perf record -e
"{cpu-clock,cpu-clock}:S" ...` possibly by reducing the period or
increasing the frequency. This would be nice to show that it fixes the
problem more generically than just the Intel PMU.

Ian

> Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
> ---
>  kernel/events/core.c | 55 +++++++++++++++++++++++++++++++++-----------
>  1 file changed, 41 insertions(+), 14 deletions(-)
>
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index a84abc2b7f20..eb0dc871f4f1 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -2734,6 +2734,38 @@ void perf_event_disable_inatomic(struct perf_event=
 *event)
>  static void perf_log_throttle(struct perf_event *event, int enable);
>  static void perf_log_itrace_start(struct perf_event *event);
>
> +static void perf_event_group_unthrottle(struct perf_event *event, bool s=
tart_event)
> +{
> +       struct perf_event *leader =3D event->group_leader;
> +       struct perf_event *sibling;
> +
> +       if (leader !=3D event || start_event)
> +               leader->pmu->start(leader, 0);
> +       leader->hw.interrupts =3D 0;
> +
> +       for_each_sibling_event(sibling, leader) {
> +               if (sibling !=3D event || start_event)
> +                       sibling->pmu->start(sibling, 0);
> +               sibling->hw.interrupts =3D 0;
> +       }
> +
> +       perf_log_throttle(leader, 1);
> +}
> +
> +static void perf_event_group_throttle(struct perf_event *event)
> +{
> +       struct perf_event *leader =3D event->group_leader;
> +       struct perf_event *sibling;
> +
> +       leader->hw.interrupts =3D MAX_INTERRUPTS;
> +       leader->pmu->stop(leader, 0);
> +
> +       for_each_sibling_event(sibling, leader)
> +               sibling->pmu->stop(sibling, 0);
> +
> +       perf_log_throttle(leader, 0);
> +}
> +
>  static int
>  event_sched_in(struct perf_event *event, struct perf_event_context *ctx)
>  {
> @@ -4389,10 +4421,8 @@ static void perf_adjust_freq_unthr_events(struct l=
ist_head *event_list)
>                 hwc =3D &event->hw;
>
>                 if (hwc->interrupts =3D=3D MAX_INTERRUPTS) {
> -                       hwc->interrupts =3D 0;
> -                       perf_log_throttle(event, 1);
> -                       if (!event->attr.freq || !event->attr.sample_freq=
)
> -                               event->pmu->start(event, 0);
> +                       perf_event_group_unthrottle(event,
> +                               !event->attr.freq || !event->attr.sample_=
freq);
>                 }
>
>                 if (!event->attr.freq || !event->attr.sample_freq)
> @@ -6421,14 +6451,6 @@ static void __perf_event_period(struct perf_event =
*event,
>         active =3D (event->state =3D=3D PERF_EVENT_STATE_ACTIVE);
>         if (active) {
>                 perf_pmu_disable(event->pmu);
> -               /*
> -                * We could be throttled; unthrottle now to avoid the tic=
k
> -                * trying to unthrottle while we already re-started the e=
vent.
> -                */
> -               if (event->hw.interrupts =3D=3D MAX_INTERRUPTS) {
> -                       event->hw.interrupts =3D 0;
> -                       perf_log_throttle(event, 1);
> -               }
>                 event->pmu->stop(event, PERF_EF_UPDATE);
>         }
>
> @@ -6436,6 +6458,12 @@ static void __perf_event_period(struct perf_event =
*event,
>
>         if (active) {
>                 event->pmu->start(event, PERF_EF_RELOAD);
> +               /*
> +                * We could be throttled; unthrottle now to avoid the tic=
k
> +                * trying to unthrottle while we already re-started the e=
vent.
> +                */
> +               if (event->group_leader->hw.interrupts =3D=3D MAX_INTERRU=
PTS)
> +                       perf_event_group_unthrottle(event, false);
>                 perf_pmu_enable(event->pmu);
>         }
>  }
> @@ -10326,8 +10354,7 @@ __perf_event_account_interrupt(struct perf_event =
*event, int throttle)
>         if (unlikely(throttle && hwc->interrupts >=3D max_samples_per_tic=
k)) {
>                 __this_cpu_inc(perf_throttled_count);
>                 tick_dep_set_cpu(smp_processor_id(), TICK_DEP_BIT_PERF_EV=
ENTS);
> -               hwc->interrupts =3D MAX_INTERRUPTS;
> -               perf_log_throttle(event, 0);
> +               perf_event_group_throttle(event);
>                 ret =3D 1;
>         }
>
> --
> 2.38.1
>
