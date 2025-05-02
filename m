Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A2579D2
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 17:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746208362; cv=none; b=hGm8lj2vPlLj4x4yYcDsB8sY7UfqcsKuZqu8ieapqkND4rfilBE7iRYWtXhgdIY9+va5byXL18K3Lfi5H+DTQME6G022NeqFuibGU1ja/lT8drQGVvSPnRDhj9pxWdlQhXHXRQ3CBw6o6rPbUjNuJWOuuGwMSe9BM79sxFb5Vm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746208362; c=relaxed/simple;
	bh=TMIgcgfI53ASO5LRhBCN9KJj/SKpPkYNOMudWH8eld0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pdjyQow8GfRreSQVgP+0LQzilMV5fhrCYCcacBhlMAXp8qsA1NTKPI3fYnTKjJYYCViHHfA9HP6f5AoUiiv8zNdWpul1D5KFsHnODILL2FkBD4bI1Q71HIGdTv/eyrOQ7MJPhd+VW/AoNlQhRMS5CoM3KpOoTEo68nzmrYdbq8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Lv0iijAL; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Lv0iijAL"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so3501462a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 10:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746208358; x=1746813158; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L+qzGYQVD+m8VMlSDDggqEimDlE2nd4dP5p1ek457P0=;
        b=Lv0iijALUiEsl0yZupMiadG456MiMb8IUkqk0Q3Bm7foiz6/PsyYPtTGQkO9KbSao9
         Se79DbhhLBmrz1p/+4uqzNq81L20O/Eejx1SwNGehot+S6MA5lDJ4+mrxYok6uWGQcYt
         efUUHmYsUIRp74xuknCzwJoDRG4sAnf0EpY4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746208358; x=1746813158;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+qzGYQVD+m8VMlSDDggqEimDlE2nd4dP5p1ek457P0=;
        b=OE8xF6V8TM9nfZXGvNonE8eQv1ap9QaEK5ql3u2QbHGKuQmtstb4mzWSBH5oMIp5+D
         6nlXDLzD5nTxXFI7IKmxlCLDJBzEqKs2kxwBfis804WVmF3wiVVefQSt7MhEBtWXliHd
         GUDhjZqj6giz/86tOSvnnSfs/Sz5O3XNZpI67bF4IGolf/7giBNLryWuFfUGUu/9oGNy
         +wzjdIUjEgwR8mec/O5h+sTXfp1WYSQ7izev/uzjk8wom34O1CQ5Lswe/Dq0DEuociJ/
         G/DQ5/88UsA5UCpyOkM/HFa3QSn64cMiizbfxv9Hs0MZ/sxn0DW63v9sQJJYsx0aGMUN
         HEkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAt4TqSdblumlW/EJVTYM69SL/Nh52duO+CLii1uNh5yg0i3ZQ3q8qLUh+BeW31I75HmIKQO/tM/15gTc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrw96YLwj44b0oz5ycMgT8WGr/hfwBy/XSt/NkSbX+3cY+AW5F
	o5PBg2ryw0kdA2rVjeaMpVPHBtl0721pj9Zp4uv/8LVgejMQdHkZ1DQto0LGwrcvi9StDHRJBdC
	l4pU=
X-Gm-Gg: ASbGncstlJPTtRDw294KuK+TvGmiEHVP8zWGjrfyOYx92hm1WSsjIuvhdxmoXJaCj1E
	5x8S6sOlshAc/LEJ5L4uvWQaojs+Tkyrrf/mzj8RD0dF4dNMDZBGhHb1M7ATcLtYvCcKy3H0wp9
	6bgA+AwvrihFqsWeb3r5fPNC/q0xraqTFmb3BkpMOxXI9wYuP/rbsm31/YLP1/np+2WagOJhA7E
	6GGWR39In+RWtVRM6mvCXpf9ua1bwjYwqJ0Col4n7CR5sclD7fHqyhxMuuLUSJw0MM46rpP+62X
	t6r4iZEhN6HLGUF6Scz8M6hcBsWXdNDz+r/xuTuV+G7+sU89qH3x1O98g0aWChES6m9tctI+8gJ
	OxCzId+B5ZFhPlQ4=
X-Google-Smtp-Source: AGHT+IGM23sLf3wLQ803UemeVVGbbUgwU5vRyURy70VFL+W4kX1OCLxHFSliEZi4iM/4QCILajW9/w==
X-Received: by 2002:a05:6402:2694:b0:5f8:77e2:b819 with SMTP id 4fb4d7f45d1cf-5fa7891665amr3097544a12.23.1746208357930;
        Fri, 02 May 2025 10:52:37 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77b8fbadsm1524684a12.50.2025.05.02.10.52.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 10:52:37 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac29fd22163so391688966b.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 10:52:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4jtbrIFnoN2tjwfMGgxVIisoAsvPWxD/hjHdv6ntxUZGpyi1oMN9A3Db6lk2JGkGYTM6CIPVW6qbFJNo=@vger.kernel.org
X-Received: by 2002:a17:907:728a:b0:ac7:d7f3:86c6 with SMTP id
 a640c23a62f3a-ad17ad3a86cmr353817166b.9.1746208356936; Fri, 02 May 2025
 10:52:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429213817.65651-1-cpru@amazon.com> <20250430100259.GK4439@noisy.programming.kicks-ass.net>
 <B27ECDA1-632D-44CD-AB99-B7A9C27393E4@amazon.com>
In-Reply-To: <B27ECDA1-632D-44CD-AB99-B7A9C27393E4@amazon.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 2 May 2025 10:52:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgb5WcfMEgsOQg4wzVWuYNgCL-e17YX33ZET_G3-ZCo7g@mail.gmail.com>
X-Gm-Features: ATxdqUHYMChzuFnxzpibzLtkTrwHUQOJbZWvS4aZuUPZ8wK3AkEbViB7psNkIbY
Message-ID: <CAHk-=wgb5WcfMEgsOQg4wzVWuYNgCL-e17YX33ZET_G3-ZCo7g@mail.gmail.com>
Subject: Re: EEVDF regression still exists
To: "Prundeanu, Cristian" <cpru@amazon.com>
Cc: Peter Zijlstra <peterz@infradead.org>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	"Mohamed Abuelfotoh, Hazem" <abuehaze@amazon.com>, "Saidi, Ali" <alisaidi@amazon.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, "Blake, Geoff" <blakgeof@amazon.com>, 
	"Csoma, Csaba" <csabac@amazon.com>, "Doebel, Bjoern" <doebel@amazon.de>, 
	Gautham Shenoy <gautham.shenoy@amd.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	Joseph Salisbury <joseph.salisbury@oracle.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-tip-commits@vger.kernel.org" <linux-tip-commits@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 May 2025 at 10:25, Prundeanu, Cristian <cpru@amazon.com> wrote:
>
> Another, more recent observation is that 6.15-rc4 has worse performance than
> rc3 and earlier kernels. Maybe that can help narrow down the cause?
> I've added the perf reports for rc3 and rc2 in the same location as before.

The only _scheduler_ change that looks relevant is commit bbce3de72be5
("sched/eevdf: Fix se->slice being set to U64_MAX and resulting
crash"). Which does affect the slice calculation, although supposedly
only under special circumstances.

Of course, it could be something else.

For example, we have a AMD performance regression in general due to
_another_ CPU leak mitigation issue, but that predates rc3 (happened
during the merge window), so that one isn't relevant, but maybe
something else is..

Although honestly, that slice calculation still looks just plain odd.
It defaults the slice to zero, so if none of the 'break' conditions in
the first loop happens, it will reset the slice to that zero value and
then the

        slice = cfs_rq_min_slice(cfs_rq);

ion that second loop looks like it might just pick up that zero value again.

I clearly don't understand the code.

             Linus
