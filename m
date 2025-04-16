Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD42C10E9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744843494; cv=none; b=hF4Rb8JBySkZAvcw32ijJFhEfC5wXfs+Hk0a24nv7BKMX+p9qPCSlmqi1EsFdVjIVyq4zgXF5sOKsjVu5x6JVsN3thxCcDZrGt6UmB+cvkFRRkuHken6fYPwNermxV6uw+EXMkgU3U/sBCApT+6Fy98TLKcxfundwjX4Xkd3OJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744843494; c=relaxed/simple;
	bh=lWtRiDK4GuYnL50ftDSWuuwiDWAbUTxdlZJqd7w5VfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OcuHwGB7ea7fQ1nChncZ/EfE6x6ZsY5ZkOlhf+ynas4naOPKvCGENVCe4mnIt9AwAPhmbj/kfUUtJUzufpUPb+EOYd/SsK/5t2C0EF3s3bdHSh4muOFbO41tsWxVw3jag4a7d/EaSBSrBd8jYRGVRlzGxNRN+h3Vacbnldy555s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=riotgames.com; spf=pass smtp.mailfrom=riotgames.com; dkim=pass (1024-bit key) header.d=riotgames.com header.i=@riotgames.com header.b=WscGazvc; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=riotgames.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riotgames.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riotgames.com header.i=@riotgames.com header.b="WscGazvc"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22435603572so2018805ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames; t=1744843492; x=1745448292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWtRiDK4GuYnL50ftDSWuuwiDWAbUTxdlZJqd7w5VfM=;
        b=WscGazvc6226NbOTAwwf/iqesoetTwKZgLuK/IZjo6xW+YPKX9tYTqT4jAYcoacPfv
         Wc+0PtgxY8iIXbE2KSlVic/hrFzNCDROkvG7D2CIhB0bwPa8AKuFiXIpNnetnYzQ3LqM
         ORKJnN77DIY4Y+Rt2iPSHfeqlJGYWJhTK5H7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744843492; x=1745448292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWtRiDK4GuYnL50ftDSWuuwiDWAbUTxdlZJqd7w5VfM=;
        b=Lj47fs0RPym8SELGE4S3InLhQiZ1z5AbeMa+WCMIVs7udl2b8wKhVuy0zHPgOowasz
         rbcijQtaJmG9A1RX7a/chIw3vqGJ1Z1zVpdviiZm2Q6AbMFobn8xhE2Y7E55gGWmUPrj
         QBzuc/9Gy7xtlz3suuQqqfhwo1Ttie0XytjR8hZ/VrFxYxtuM06PQ3GiPyzscoSqRi0Y
         zSn5JrfmGEKGZOW5J/OYXK31rhYp8VRsGY+dA0I1mAzM5tHsZYel/fs/FU8hwEprl/x5
         KOgU/rQ16cXHdqoTxyfwqTgOVPCZwi67EU1warFPXcOKErdYQGytoCtXrct+U9l7hbGo
         09dA==
X-Forwarded-Encrypted: i=1; AJvYcCWiqcVkCEhs3WbJplZS4U6PBOpXx++MpBN9/P/xdCm8r1SUik3FbWrj6TVfjcea4tjuf0d7uo2h6yseiNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdDJFpnOQpFqVPPYukdNxJWwbZsYdjjrLiqjfa9aAVlCAuRd/I
	cu1GfGGNgKM1tgHAXmMQ1+KtxY04p81V5CK6IEKI+TF/rnJvxlq/7TFxaqIEb2zuIs3A5J2zYMv
	xLr5mAEOCCNg0Gl9BhltWu9fxrekHcSPi/SHrdA==
X-Gm-Gg: ASbGncs9DlYJE5DlkxuBVWNnQP11nv8Ig/1JKtcgvKVpVueSIR+FfYen7TCXlj+HyHr
	RfJI9TMHEAiZ72HgmHOqlhjTpHCIBF86NBmvtBRUYlcsKMF2ZAVEHvElMwzU3Y6KU7C0qr3qf+x
	WAKJH/zYYQrTRqSaXVDtZ4UA==
X-Google-Smtp-Source: AGHT+IF23yy1W1N8zHOh8gMq28w4MIjirJjRJMlSeq4g96UbuxXrOBHR1of087MhejUrgDtRSKU0t9qMRW/fnb3fU80=
X-Received: by 2002:a17:902:ef0c:b0:220:e362:9b1a with SMTP id
 d9443c01a7336-22c358e8abemr62582075ad.25.1744843491748; Wed, 16 Apr 2025
 15:44:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410070258.276759-1-yangfeng59949@163.com> <CAEf4Bzai7NL-3=1SVi4-WWYWEY6Lzrb8GBfKnt6FG8sNm2OMRQ@mail.gmail.com>
In-Reply-To: <CAEf4Bzai7NL-3=1SVi4-WWYWEY6Lzrb8GBfKnt6FG8sNm2OMRQ@mail.gmail.com>
From: Zvi Effron <zeffron@riotgames.com>
Date: Wed, 16 Apr 2025 15:44:40 -0700
X-Gm-Features: ATxdqUHbv-kzDAdKa3Vm_JbgIrOUv70g1P-9Qv64STJdsSN05EUNDYmZMxFRFuY
Message-ID: <CAC1LvL2SOKojrXPx92J46fFEi3T9TAWb3mC1XKtYzwU=pzTEbQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3] bpf: Remove redundant checks
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Feng Yang <yangfeng59949@163.com>, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, 
	mattbobrowski@google.com, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 2:56=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Thu, Apr 10, 2025 at 12:03=E2=80=AFAM Feng Yang <yangfeng59949@163.com=
> wrote:
> >
> > From: Feng Yang <yangfeng@kylinos.cn>
> >
> > Many conditional checks in switch-case are redundant
> > with bpf_base_func_proto and should be removed.
> >
> > Signed-off-by: Feng Yang <yangfeng@kylinos.cn>
> > Acked-by: Song Liu <song@kernel.org>
> > ---
> > Changes in v3:
> > - Only modify patch description information.
> > - Link to v2: https://lore.kernel.org/all/20250408071151.229329-1-yangf=
eng59949@163.com/
> >
> > Changes in v2:
> > - Only modify patch description information.
> > - Link to v1: https://lore.kernel.org/all/20250320032258.116156-1-yangf=
eng59949@163.com/
> > ---
> > kernel/trace/bpf_trace.c | 72 ----------------------------------------
> > 1 file changed, 72 deletions(-)
> >
>
> All this looks good, I checked that those functions indeed are allowed
> in bpf_base_func_proto. The only (minor) differences are capabilities,
> bpf_base_func_proto() correctly guards some of the helpers with
> CAP_BPF and/or CAP_PERFMON checks, while bpf_tracing_func_proto()
> doesn't seem to bother (which is either a bug or any tracing prog
> implies CAP_BPF and CAP_PERFMON, I'm not sure, didn't check).
>
> But I think we can take it further and remove even more stuff from
> bpf_tracing_func_proto and/or add more stuff into bpf_base_func_proto
> (perhaps as a few patches in a series, so it's easier to review and
> validate).
>
> Basically, except for a few custom implementations that depend on
> tracing program type (like get_stack and others like that), if
> something is OK to call from a tracing program it should be ok to call
> from any program type. And as such it can (should?) be added to
> bpf_base_func_proto, IMO.

Is this true? Does it make sense? (See below.)

> P.S. I'd name the patch/series as "bpf: streamline allowed helpers
> between tracing and base sets" or something like that to make the
> purpose clearer
>
> [...]
>
> > case BPF_FUNC_get_current_uid_gid:
> > return &bpf_get_current_uid_gid_proto;
> > case BPF_FUNC_get_current_comm:
> > return &bpf_get_current_comm_proto;
>
> I'm surprised these two are not part of bpf_base_func_proto, tbh...
> maybe let's move them there while we are cleaning all this up?

Do these make sense in all BPF program types such that they belong in
bpf_base_func_proto? For example, XDP programs don't have a current uid and
gid, do they?

> pw-bot: cr
>
> > - case BPF_FUNC_trace_printk:
> > - return bpf_get_trace_printk_proto();
> > case BPF_FUNC_get_smp_processor_id:
> > return &bpf_get_smp_processor_id_proto;
>
> this one should be cleaned up as well and
> bpf_get_smp_processor_id_proto removed. All BPF programs either
> disable CPU preemption or CPU migration, so bpf_base_func_proto's
> implementation should work just fine (but please do it as a separate
> patch)
>
> > - case BPF_FUNC_get_numa_node_id:
> > - return &bpf_get_numa_node_id_proto;
> > case BPF_FUNC_perf_event_read:
> > return &bpf_perf_event_read_proto;
>
> [...]
>
