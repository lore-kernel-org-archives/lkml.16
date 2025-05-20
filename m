Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C5925B682
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 05:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747720789; cv=none; b=ohhoTgzDRwd+0zGNNUpzIxIkzMLuqhjrIk7nSU46IEFO2MeGUjl6sq989p/qto5WsQl/evip2Cyp6bpUYQvPee+xS86PxgRSBiTpI/HLrBJq5VapaV2CQIWAozwUgcrNCsXzDjljmB2XyiXMQPX+vkbnFpH+F0/g+ifuYZ/KrpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747720789; c=relaxed/simple;
	bh=HtZ3r2Fkj3SIQiBaksw/po6bDy3r2DetEvEulkhJ2Qg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dmFtOzu/7olGxgcBMS+Xwm518dLPNLfc0LmRhFVzQk7W5Hy4tIEerMGrof9Fhxp6HnEw8+XJrFlZdk8Xra0wjGmKpCBJyh28XL08ohi/BRhDCPNr6ar7BWJSPgfqkT1y3ZLMgPnoPNsD9OCUjDUjkDP/TAPFQvkzQds7QkL0j/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izkB1OJ+; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izkB1OJ+"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f2b04a6169so60836226d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 22:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747720787; x=1748325587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbPvbtnOrmQE+1U2utP3GVC8XV93atGkPO7YSOID2TE=;
        b=izkB1OJ+Rgzsn87q2BGWFPGRFLfRD+l3hC1ZV/p8b3z2rPLn7eYxckC2qby8brmUyv
         jQvVaDhrg5V5oljn6CR3Tl7MHaFKRrdHYjPzcD1pc3mOvC2uFQoBjqqgjNcCagupi9sL
         0YZYSLPaRz2XBrKtkFUns/Oa8nme7R2jDrskuFhNWEWUuw1IsSuYCVJiK61EwW5ejnzB
         6URWgjMlHH35QFDoRXKTXzYUBuVdTEouPIutPSIr7ydxRpAAj7RDejThYgNPiYdBQqJa
         Nk4cOF1y52xEqAgpNfc532ct+UQilR47yN7w21LRYBIXNwiFfEgq9f3j8dmS+IOzJ0Me
         7ZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747720787; x=1748325587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbPvbtnOrmQE+1U2utP3GVC8XV93atGkPO7YSOID2TE=;
        b=HeHNQdeKPSft+FEbJwxqXnNbQHZA5Irsr+RfnSK0vTP61acOBSh/lD8/nug+PD/OWg
         hnJzekVMea6psL2PaagSfFgEdUxZtpL1AVSA2qyeV/mdLzLvJYsJ0OR9GTYgTuwY0Cz5
         LFT/0kc2ByLv0xnk6UTm2bHSIBNdxlRNzT9Lw77bvFnjHLNFre1q0ZvpL4mq89SX1Vae
         ySNmeaSvDfPu+6h3oCLkuKlhqvR0+Dmd6imLbu37S8o9kYPrxF0OR4bkdlo21NjgF/G0
         zsI+dks9R+3pusHtO1asUM6qFrQoFn49fvzkCpyq8t9oep6Absc7Dx2spYAWn1dxdi8S
         RZZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFpT3LVbuRc55AIeUbQQRs03Q4gsF1AEgnJYztQWdl8Kt8XsGDFCF+nxWNyJPmQ8rEIvDSWNPBMgErLeI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6WLSySBONgOFluo3eNUw3MqAAP8SGIfFckBQYu4HU0FeSISWY
	SPs7oLN9dxjmb/qjkcqNsNFo8qi21uR2TIqBY6f6+jjk24YT8v4MnVCYifdEVD+TlWs4qLDZvu1
	0MRtkryF9gFnP6S6UattRZ9Go1UxY+3U=
X-Gm-Gg: ASbGncvebugOYKBdfuWZr9Vmivc35F9w7jcPyBbbDABSNw9cK9qwsmqX8MgOiKturrs
	4w+5GtB73FmaEWrAD7aog1exdwB3Hw2JIaGIxP/omrLruiXsT2n6/kP3LCXakGJJavHLYsAZmc9
	qMs0Gz9n1KrjFhF/Krq9/SCVLWNwthkS+/4en2/6DM73ce
X-Google-Smtp-Source: AGHT+IF66zV1pqgN2aIRpxtBq0k2LIK+BnL60q836qda3s8pLIoPl4F6+KD3l+xh+yzzMDQPHqydEt4QyNx6dnGdqio=
X-Received: by 2002:a05:6214:27e2:b0:6f5:4055:83d9 with SMTP id
 6a1803df08f44-6f8b2c32c7bmr247622576d6.6.1747720786785; Mon, 19 May 2025
 22:59:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417043457.10632-1-xuewen.yan@unisoc.com> <77de8033-4364-44a5-b21b-ffe511b8f5d3@arm.com>
In-Reply-To: <77de8033-4364-44a5-b21b-ffe511b8f5d3@arm.com>
From: Xuewen Yan <xuewen.yan94@gmail.com>
Date: Tue, 20 May 2025 13:59:36 +0800
X-Gm-Features: AX0GCFuXp-0Jt8EaoVHmOVp6krqXu0HiBP6JiLmDKhIlVKYOhJutpRNS05h6Ab4
Message-ID: <CAB8ipk9bLmnVYnjggw-Ymp6sZiO9SHJ-XZBNRj0Bv3taYSRM2w@mail.gmail.com>
Subject: Re: [PATCH V3 0/2] sched: Align uclamp and util_est
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Xuewen Yan <xuewen.yan@unisoc.com>, vincent.guittot@linaro.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	hongyan.xia2@arm.com, linux-kernel@vger.kernel.org, ke.wang@unisoc.com, 
	di.shen@unisoc.com, kprateek.nayak@amd.com, kuyo.chang@mediatek.com, 
	juju.sung@mediatek.com, qyousef@layalina.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gentle ping if forgotten.

Sorry to ask, but may I know if this patch can be merged into the mainline?

Thanks!

On Tue, Apr 22, 2025 at 11:27=E2=80=AFPM Dietmar Eggemann
<dietmar.eggemann@arm.com> wrote:
>
> On 17/04/2025 06:34, Xuewen Yan wrote:
> > Now, both uclamp and util_est have been adapted for DELAYED_DEQUEUE,
> > and the double enqueue/dequeue issue no longer exists.
> > However, there is still room for optimization in both uclamp and util_e=
st.
> > Previous discussions as following:
> > https://lore.kernel.org/all/CAB8ipk8pEvOtCm-d0o1rsekwxPWUHk9iBGtt9TLTWW=
-iWTQKiA@mail.gmail.com/
> > https://lore.kernel.org/all/84441660bef0a5e67fd09dc3787178d0276dad31.17=
40664400.git.hongyan.xia2@arm.com/T/#u
> > https://lore.kernel.org/all/CAB8ipk9LpbiUDnbcV6+59+Sa=3DAi7tFzO=3D=3D=
=3DmpLD3obNdV4=3DJ-A@mail.gmail.com/T/#u
> > https://lore.kernel.org/all/aa8baf67-a8ec-4ad8-a6a8-afdcd7036771@arm.co=
m/
> > https://lore.kernel.org/all/20250325014733.18405-1-xuewen.yan@unisoc.co=
m/
> >
> > patch[1]: Simply the condition for util_est_dequeue/enqueue;
> > patch[2] aligns uclamp and util_est and call before freq update to impr=
ove
> > the performance and power.
> >
> > Xuewen Yan (2):
> >   sched/util_est: Simply the condition for util_est_dequeue/enqueue
> >   sched/uclamp: Align uclamp and util_est and call before freq update
> >
> >  kernel/sched/core.c | 17 ++++++++++-------
> >  kernel/sched/fair.c |  4 ++--
> >  2 files changed, 12 insertions(+), 9 deletions(-)
> >
> > ---
> > v3:
> > - split previous patch in 2 patches.
> >
> > v2:
> > - simply the util-est's en/dequeue check;
> > ---
>
> LGTM.
>
> Reviewed-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
> Tested-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
>
> I assume you can add Hongyan's test tag from:
> https://lkml.kernel.org/r/be0cace9-d173-4de3-959e-861876ad77fc@arm.com
> as well.
>
