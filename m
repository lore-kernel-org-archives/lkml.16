Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7BC28BA8D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 13:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341205; cv=none; b=YfVU0VsUQlxQF1f/k2Yshcvbgs9HC+D6PVaNg+Xw0Tfci75vTg2wVXHmsi4FFs13bhO6aRT/joZonxDQL7VMWR6UlIYfkfmNObS1lG1GKVQYYPUUzwuS2nWqaXaSb7y+liebbfGHqKzhhgIGzVXNrUxx0oTIWBeDWvfjuGqel+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341205; c=relaxed/simple;
	bh=2NqneKlY33z9v6ssom6HUKNEFdIU6yvVwyJlxaLkGow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BDOtiKMXOx6ZHRuzCual8/w+UXsAd+lV8RefEmpTCq+43SoYixHfn1SCJJaxGV1RSbREtK29pFDhE+8UMsrxYjXQ1jECYrXCRTdSXVe+1RHpLKMS1jUQinQ+6Qmjxx3MfdcLrgivRijsD1v/fCSazZ5EwhpxuXsSnz7XLcvl/9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SCZPdIqd; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SCZPdIqd"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-606ddbda275so1634825a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750341202; x=1750946002; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hy3WsHb/OXL1L2Qu4iG3kEVAl7a80hJee5UYV6CVjCI=;
        b=SCZPdIqd8fuLoyqrfgOgSWXrN1CiW5C7bFZjSKM7c3bXPf7dlKDP1CoJSO5hutiQo4
         2D6yNgbPXB+x4ZASldELhIX5hTtdklt1Dj6ovt5py7JiEbL9XTWT6UumZCcF/gcD+Wpq
         6XA0+ZJNWEmoxH2qDgB15viTZJy3u9UsR83GDlrJzies84ViF1jctchQMBeLYlN9ZQBS
         66YuqhhsCH5nCIGzIwmoSvaqh0Xg7slNhsrzuM56KrEUake1F2GSrA3UEZOO6l+CyGyG
         ZCmcYAjVswar0zU7Sh6uTFHBg8UZNxDYO+jeMV4cuxX3yeZXmasp0zuDYlIjj3CP6cjb
         A6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341202; x=1750946002;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hy3WsHb/OXL1L2Qu4iG3kEVAl7a80hJee5UYV6CVjCI=;
        b=fX6grp0zvrAyhhZ7veJECHEg1Kmcy1CukpqoMaKKm9Ywmwbe3AJ+L3Fqt+zVplgx0I
         TBK4rsw5kDl54oyQWj0RbrzlqvwHgf0BKnuPR5qHL1wQhAibCTvSDdAZF8ghe2n11tHO
         E2fH6FhEBr4G1w/e8BIfXvZXhOwgUqG1B7N4sFrgDR/cNZwAexl11BWOkpHOXbVBWOOP
         OT5GW42CykNmzGBMex81myUkx8tNXC7STpRbksvIirITfu+pNh4baRK5KfJrj4Xere9U
         j5s6T7c2yp0GiYh9rJNoPnafhKnBRDE0s9Y+qtvrMQ8uiSSBe+tF0YLDWDB/Sq06mjDw
         IeoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrk2ZV5vzw0TL6iGVSheA74WXUqLs8rnfmCgjpMSwynT5dxVpMvsMyy0tfzqd0y0bVpmHBViM2z7U7C88=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCaDl7nFBa5u4s+ktk8eamyDp4YEEE91od8YPYA5FtSMJiRtwJ
	Rd43W1mrUEznSCaeNsU58FnogkVoJf8dSWgUZcS+Ec5cfuGZZ5bk4TyRGMRyH90yGYzMncYnVff
	F01BcfMMuBlNkme4j1p3aSJy/NbpEMpbvw7Bb3s3+fA==
X-Gm-Gg: ASbGnct8D4/O8oXCx2/Txt0BRT+j/csOCOvD9lDzXPJjGIUY2SHjloiJZ3Kw367NBAU
	e+NIspkerggqIt9dK19ZEZuw3Hgm1GlObKs/DbYUKt7JL5lTn4iE20yaFOD4yBKtK8s3eqQekxS
	3j84RosP83uUor80Qxikk/921wO3lB6HmmIrhhoUwxOCHG0rlasCGzzdQs4HvyKxWLsSbg3tEtl
	cvAUfDDqTQ=
X-Google-Smtp-Source: AGHT+IGxNz0ZAdeuWD3+xXQuKwQDZ26IRJrNyiFoRdmDetWtYHuyjc7xqtlrqOBhPAYdXWgvHHRJG2mKxOWzMUM7eNE=
X-Received: by 2002:a17:907:7fa6:b0:ae0:3f20:68f8 with SMTP id
 a640c23a62f3a-ae03f207cdamr215951966b.39.1750341202056; Thu, 19 Jun 2025
 06:53:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619031942.25474-1-shijie@os.amperecomputing.com>
In-Reply-To: <20250619031942.25474-1-shijie@os.amperecomputing.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 19 Jun 2025 15:53:10 +0200
X-Gm-Features: AX0GCFsv5pewVhcUOfZdaWAwRIdKVrMJ79S3AakigbG_irFgG7F_9rouI3RCU4I
Message-ID: <CAKfTPtBUJa4A2V3XR8EwYVPxiY=ENZr1=Jg5R3E75r5XnrnRPg@mail.gmail.com>
Subject: Re: [PATCH] sched/fair: set the se->vlag strictly following the paper
To: Huang Shijie <shijie@os.amperecomputing.com>
Cc: mingo@redhat.com, peterz@infradead.org, patches@amperecomputing.com, 
	cl@linux.com, yang@os.amperecomputing.com, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Jun 2025 at 05:20, Huang Shijie
<shijie@os.amperecomputing.com> wrote:
>
> From the paper, the lag should follow the limit:
>      -r_max < lag < max(r_max, q)
>
> But current code makes the lag follow the limit:
>      -max(r_max, q) < lag < max(r_max, q)
>
> This patch introduces limit_hi/limit_lo/r_max, and
> make the lag follow the paper strictly.

We don't strictly follow the paper. Typically, paper assumes that a
task will not run more than its slice r before deciding which task is
the next to run. But this is not our case as we must wait for a sched
event like the tick before picking next  task which can be longer than
the slice r

Side note, we don't have a fix definition of the quantum q which is
something between 0 and a tick (and even more currently with run to
parity) as we wait for the next the tick to pick another task

This means that a task can run a full tick period even if its slice is
shorter than the tick period

>
> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
> ---
>  kernel/sched/fair.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 83157de5b808..102d263df330 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -694,14 +694,17 @@ u64 avg_vruntime(struct cfs_rq *cfs_rq)
>   */
>  static void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  {
> -       s64 vlag, limit;
> +       s64 vlag, limit_hi, limit_lo, r_max;
>
>         WARN_ON_ONCE(!se->on_rq);
>
>         vlag = avg_vruntime(cfs_rq) - se->vruntime;
> -       limit = calc_delta_fair(max_t(u64, 2*se->slice, TICK_NSEC), se);
> +       r_max = 2 * se->slice;
>
> -       se->vlag = clamp(vlag, -limit, limit);
> +       limit_hi = calc_delta_fair(max_t(u64, r_max, TICK_NSEC), se);
> +       limit_lo = calc_delta_fair(r_max, se);
> +
> +       se->vlag = clamp(vlag, -limit_lo, limit_hi);
>  }
>
>  /*
> --
> 2.40.1
>
