Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418AF205AD2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744768415; cv=none; b=u9FCt0MqjODGxFrfci01Y6i+N3O6+R+mPbGj1/cQWhRpNtpipQNgc1k3E5sEs02HeMvUzEitQqYpV5j77veHAREDd3tV75ftF3EP0L6+kApPvDatlLBTZah52LQ8Fu45ipuEuTQhkawrckxqwnYzX/97+S+gJj4nTmeaao8ymC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744768415; c=relaxed/simple;
	bh=e19ozdcE7IbomEf30Wwf0grmgEk+1M/Dzc+QxYejxr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pKv/widwD/USH7q5iXgVksIOdfmbHCSkNLkOWLK2HXwUdQkb3lGexoL9yCZVdP5zSqevVWBaG2pNkn9T8d9e6wce+jb4DLrZW502e7yc0G4ySnCRWrY3uA0gOI8I6Izgnb2nJb7/0zHZMxGtikJTnKnY3m69ikwbnvXi+wZJHBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUELQYeX; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUELQYeX"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so10155235a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744768411; x=1745373211; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e19ozdcE7IbomEf30Wwf0grmgEk+1M/Dzc+QxYejxr8=;
        b=ZUELQYeXRiEOBrYwOerzKFIcP/Rfd1GNy4j/ZIh94q0t5b+LFAnVbw3Vpd3TUqqt1v
         +VomHJvQ5j8U4xv+5rys9dBpIaUEOE814HxW4NcmKzm3+oiWYnfiv+6610uWOXC+3WFs
         EA3o421ilvE1Po6/in2ExbjhB0e6pElWGw3wv0ZODOME3un23wo1a8VYP9CX9uqGfZ/f
         v18UdZ3FbNz1BeCohIiD0nEehxq02A3slQ5aaW4k/JUGbM6gwhO7hZ9jNhi3jaZe25Y6
         j3qcDghdr4EpJEiXMYf+QkDgrckmZ8wnFtGJgisvZn21bfRcG3McAUop73fiDMXlAsdI
         1osg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744768411; x=1745373211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e19ozdcE7IbomEf30Wwf0grmgEk+1M/Dzc+QxYejxr8=;
        b=MSUfJ1fN1xX3NboOR7jBn5NT0EwH/6PSaG4lE9iuFOufquka5ehuIxecPnQspJW3YJ
         /zwKgtFFtKdv/PqOC+nuedwAmGPb/TJ70V1YansY99OcBPRRNuSrDwi8quP+0yxOJKEE
         EQH9y+vO3QjyKnrucacpYkjf5bOx1B/WQjCkS8f/wO0oD86hye5WaB3TBLC5KyBu2n6b
         tZPw2TH1k78x/2drpYOMOxSPr21mEW6e3gDl7lAmkAWn/UwUtFudiertnNhEpt/gFqx5
         5sP9h7+eIdYT82L2HGU3F3y96Ar7exVMaZvArz8SXn/iCI5KroRj3REFqVP/D1T/26xy
         KLPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzYclIz1GM6AAGle9BckVD5ZnNZtnP/aqCP/k3a/BDqm+Hqe5v3TT+jGSPki8CIL3iGJYPpC/xOlHvwoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YydQg5eqrmyel4StMObqlax3dcosrpkTZE5611RFC8rv1Ga+srr
	AAi5Vhf08T2bcK95iaDf9eLSWrAsWb5ygCXlpDw8h530/pFTsxyAKV4gJqkd6cuH7JJXMewdibh
	jKJPEpuztdwc74ttT058qxOa6gis=
X-Gm-Gg: ASbGncvN7g11mWTb3lvZgj0H+hW8krQ9y1obHqac2wF/2Cc+VzDfbnJIAv1RLqu7F+c
	PJIl1TsbjYMeDM1W17c7dPMdUls7YvOBCTJ2WAcdcI0HwVBcuJgzSyfq/6MBVETmRTOoho8eD8Z
	MDZX0ytkzkx7tlVjYJr8JRCc0=
X-Google-Smtp-Source: AGHT+IGD3Qp6FIzJC9ll2LBqkwWJICeLoFZCjvLcF/uO1E3BlzXIrfgQuO3jDutGwzfoa8eIeGzozE7QKJP6L09YJ8w=
X-Received: by 2002:a05:6402:2548:b0:5e7:b092:3114 with SMTP id
 4fb4d7f45d1cf-5f4b720e400mr12006a12.9.1744768411372; Tue, 15 Apr 2025
 18:53:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408154637.1637082-1-nunes.erico@gmail.com>
 <20250408154637.1637082-2-nunes.erico@gmail.com> <CAKGbVbt-Cfp_D3WH3o1Y=UUQzf-sM0uikZXO1MFRxt2P72gjJg@mail.gmail.com>
 <e24e5e05-5ffd-440f-b9d9-8a0f792cc7c8@amd.com> <CAKGbVbthUxOxtZ+baT=vrNE1u6fzN48K1G5dtZBqfTBc7jEuYA@mail.gmail.com>
 <0f43ad99-27f6-4c1c-915f-2b7163195f07@amd.com> <CAK4VdL38fkraY2sujHCVnuhLJ8pQ4f-MejUcfsFTbdxusys3Kg@mail.gmail.com>
In-Reply-To: <CAK4VdL38fkraY2sujHCVnuhLJ8pQ4f-MejUcfsFTbdxusys3Kg@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Wed, 16 Apr 2025 09:53:19 +0800
X-Gm-Features: ATxdqUHz59yqYDYZeJV48fS7GlYJXdTkuU_VYZn0rvFkG6wJAO1neOoLyfWt3zU
Message-ID: <CAKGbVbttU7Ru7-AuB-+sLCUZRvb8nmGZAE-mwq0WU7-3p=VA=w@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/lima: implement the file flush callback
To: Erico Nunes <nunes.erico@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 9:19=E2=80=AFPM Erico Nunes <nunes.erico@gmail.com>=
 wrote:
>
> On Thu, Apr 10, 2025 at 4:04=E2=80=AFPM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > Am 10.04.25 um 15:56 schrieb Qiang Yu:
> > >>>> This prevents applications with multiple contexts from running int=
o a
> > >>>> race condition between running tasks and context destroy when
> > >>>> terminating.
> > >>>>
> > > If implementing flush callback fix the problem, it must not be when S=
IGKILL.
> >
> > SIGKILL also calls flush (again eventually), but we can detect that in =
the scheduler code.
> >
> > See the code and comment in drm_sched_entity_flush(). We could potentia=
lly improve the comment cause it's not 100% correct, but it should work und=
er all cases.
> >
> > > Could you describe the problem and how this fix solves it? As I don't=
 understand
> > > how the above difference could fix a race bug.
> >
> > That was the point I wasn't sure about either. It should *not* fix any =
race, it's just gives a nicer SIGKILL experience.
>
> Thanks for this feedback. So as mentioned in the initial letter, I'm
> also trying to understand if this is the correct fix.
>
> This problem is unfortunately not trivial to reproduce, there is only
> one application which can reproduce this so far and it is a
> complicated one with multiple contexts and relatively lenghty jobs.
> What I observed so far is that as it is right now, a context might be
> destroyed while a job is running (e.g. by killing the application at
> the right time), and a context destroy appears to release buffers that
> are still being used by the running job which is what causes the read
> faults.

Free buffer in context destroy when job running is the bug, we should
dig into it how it happens. And if multiple context play a key role.

> This added flush made it so that the jobs always finish before the
> context destroy gets called, which prevents the issue for this
> application in my attempts. But I suppose it might also just be that
> it had some more time to finish now. If this is not the correct fix
> then there might be some more missing synchronization between running
> job and context destroy in lima?
>
I'm afraid this patch does not fix the root cause, we should find out
the root cause first. This patch could be added as SIGKILL improvement
later.

> Thanks
>
> Erico
