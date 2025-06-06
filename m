Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C07F215793
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 20:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749240892; cv=none; b=VJAUyzQVtj0sDXddlCjz0os6J/WVe2m5jjPTQoMRXj7aHPab5QQJXBm4OTGb8VMvSiAS7yJljSam29MMYnmFZnxVkVlpVg2EmsHq6APGUJb2oDUj08IccUvSJVX3zVJs5wGWrekJm9iQ3lX3E6EOtk/2977ixSyLHxQj0cPgfv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749240892; c=relaxed/simple;
	bh=EANyIHOVfbr28GA5k/vh10ReQjJLmWpCRBkFKqXMbJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SSpn4L+E226Z7r2lNOYoCvMUSOCayoM+jn7WGWDqoJ+WDJjAY9y8GrFzucQOqRS9bU0jux/VIRn0gp7zdtRqb9u5Wfh+t2y7Zqc40wx1w322SJXdc282lMwvJ7Tc4JBDubu3IdYdHR+QKIhSHkpdI7fYxigleb3IV0J4D6dLYpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ifoZNNLl; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ifoZNNLl"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-adb4e36904bso467953466b.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 13:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749240889; x=1749845689; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EANyIHOVfbr28GA5k/vh10ReQjJLmWpCRBkFKqXMbJA=;
        b=ifoZNNLlZsU2Fv0QkgjIagSEqXX5VIQJ3UDAmtkjGQxzPiP2sepA0EPW5rsYJyZtGM
         L8TCqeooS5i2CWgkebgYzfwZWZxzL3XTEIJmbITi8WPu4BMGYMQ8i6R5KUoCtAoHEklm
         MPrXmduI1AiRghd3CwcsBgJfKqIkHqVORz0Oq2pF9JNsggIW06llH/nPmOoB7Le9Akwj
         FrSw9TXQic4hzfEiUi5RpVPEBOO+Rj2Kwknz2gbRYHntjb3wMc7BE6zOHLd1lit/HxmR
         +tJxFQDTjhNa9DLf4hM3V9eK3M/ERfpIGC5059F/kDqdmCh17tyZG6xR9QyNgy8evdLI
         KcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749240889; x=1749845689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EANyIHOVfbr28GA5k/vh10ReQjJLmWpCRBkFKqXMbJA=;
        b=EtG30FixaKf2hiT4VDb52i4G6Z649OXm9SEOvx5lII1L5i2Rmw+7O7I1LIuT+sfLxd
         RojAmYzzLK66FpShujsaZ6vtSMucJ/v2jFmXOyOR15vgmtdu9Vkx8SF3yiRZxBkIMlCu
         vmUW4Ovyur/maQ09lGECoTPvsMd4OJSVBFhFHQUz/J9oWE4P5X6D5jFSj0wMQIE1qx08
         P5Deow+SYN5tmOOAXLp2XoMZ5EdtfPEek3W9otzP5ivvPWELAbVMvsE9vQR/5n6zI+lh
         7SihK67Gn9iZN9ueqm9GKQQYJvw7c3L1oQYn8mSa7/wUEY3mjtzCnv6LIKoVICphytU2
         S0Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUu1eEpvxHnfUVbRtxi6L6EuLwkn/sRygE518iDLMHEiEQAynAhOazhx2fnBX/FDru8Jx/OZNO3shlBLGI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+QIt4yFR/lbkI/j2BZdLP49VafZIJ3rUezjyYR2R3ftsJMXDA
	BO+6fAJ+a35YiPXXwH3Ch2sMuPg2kovDfAbmalfq4zwsgdf4NQI7LKC1PLNeaXqGSDHvNFuNb2c
	Ljrjg+Vt6I48FEhwhMGOlBslVrbE9f78pMQbsTBKu
X-Gm-Gg: ASbGncvE8QPbLJOFB9fymb5U4RfK9t5Z+A/CSWG/wkdhZ/Tbp/tE2sZanN9AjEnvc9d
	1zuTY6QdX8rMMDCyoRixp4IkKh+RrEq5oK9NoXijcHMbv4DeghDcOXWlGt/tVIQqHgyX5QAN9YB
	1u9xKIb1FV3Ko3z/oR0QogW74o6f6upHiKskTn7zPX2WOB8WFLtDQetl0QO1tDT6yRJhHWl5K6D
	w==
X-Google-Smtp-Source: AGHT+IEBbEM3xolDQ8YXyygvntnqUe0HKnoDL8XvCNP/LU2/8dHYPObttdf1gE3Beh+Jo1+bX7QVa4CuQx1noe6Z8gY=
X-Received: by 2002:a17:907:7ba0:b0:ad8:a2cf:76f2 with SMTP id
 a640c23a62f3a-ade1a9c804fmr402467266b.48.1749240888513; Fri, 06 Jun 2025
 13:14:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604195846.193159-1-zecheng@google.com> <20250604195846.193159-2-zecheng@google.com>
 <20250605142851.GU39944@noisy.programming.kicks-ass.net>
In-Reply-To: <20250605142851.GU39944@noisy.programming.kicks-ass.net>
From: Zecheng Li <zecheng@google.com>
Date: Fri, 6 Jun 2025 16:14:36 -0400
X-Gm-Features: AX0GCFuaSZ3A8OQVzbxck7ZldxGngaP13EE6uqDudDqgirhosvMTf0RnYpMqXIo
Message-ID: <CAJUgMy+-27NsqN=G53i0JRShnbb6=V7YtJEqJxsN27C4S+xiYQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] sched/fair: Embed sched_entity into cfs_rq
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Xu Liu <xliuprof@google.com>, 
	Blake Jones <blakejones@google.com>, Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Thu, Jun 5, 2025 at 10:28=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> This also blows up struct rq for no reason.

I'm working on a v2 change that could avoid this overhead by allocating
struct cfs_rq and struct sched_entity together as a combined struct
(e.g., struct {struct cfs_rq cfs_rq; struct sched_entity se;}) on
non-root task groups. This would allow us to save the extra sched_entity
inside struct rq.

> I would much rather you all investigate if you can make the flattened
> cgroup stuff from Rik work.

The flattened cgroup work seems to be a separate, larger architectural
change. This patch series focuses on micro-architecture optimizations
to existing memory layouts without changing functionality.

Regards,
Zecheng
