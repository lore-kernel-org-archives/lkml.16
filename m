Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB7F233732
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 07:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743578442; cv=none; b=Iq3ionO9jzShL6gdrLApWBkgKBbxIwbNIZv6GvZSN6soa9nW/XUzEQ2TMXambI1LZUdR0b0nKhtvqIEMt415wctZfmToG1lXRTNrXL+ax1u6TTe30HeJr4I7WWwWU8w62vcbnGSYrfS3MiWFvp+7CDcMp7mKOmQgcBNyXJrSbPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743578442; c=relaxed/simple;
	bh=0MDNHCK3VkRwh2BYBJWxYBpWRqft3Wr/rGV8AuF6Ucs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzld/Gt1dQ3Mg0TECoPhNN1a3okiBEjDuytic3ufwMZecXfCWL8emNbwPjWEKXh/Mol50lkE6euVbZz8OldDKxBf+mzY7F0cD+MZmuKFSMA1QhPeEx2/VzwfMIbYTFA4W+DNV62H7ziyja2svnOblro3fq9SVhuvNP5I34Lvqzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Wl2+76ZL; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Wl2+76ZL"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso3500025e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 00:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743578439; x=1744183239; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EIdJj957E0zfMC1C52ln0X1wpZ+moU8YgwfPLRZy4XE=;
        b=Wl2+76ZLFt9/UsQSkbfnVRXQAO6ntU1Lmk5ZVjmb6m9eKnfdc1lgCwzC01hxPx3qmO
         wy56iy/hrhM+l8VyVddblGs1jFgW3dU7WAIV+RX2FMXXKpDuxwC4xCTClLpp06nH3+e/
         b/ROjl3lOVjhC++ZlFdKsd/Egw+5GLXwxmTuS3qiZb1TGrK0/rudWYnQDpzZd2yN07iI
         QxO0I+JWhtKo88a5lWUDRTZ7Dzeig0O3/Am1zBGNvsTleMLhHFexcO4ienZGhQlVN0w3
         Ck7S3Rbk3fetxe9R7sYPb6WzlODo/6aDHsmX3XzSmt+kDOLQwJvgpZY2IBnVcq0My/Lz
         88uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743578439; x=1744183239;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EIdJj957E0zfMC1C52ln0X1wpZ+moU8YgwfPLRZy4XE=;
        b=u0pe6xg4Gl3cSW26wm4zugAdGZ6I8Og/Ekmrw6Ydaw1G+Bt4roZFKC48MQC1dPpLZk
         i8x/l2/0TKwKB4yVkbbeo4agj6eq5YihoGaLt+5Gs6EVoEm96yZ+4Pkm1jSBDJnMO+Uq
         JpeoKRXgtA1tzFy0nDKlKULtaC5WZyZUFuPbcR6+LwnZm/qTgx8gzAg58pBiexyMsP4I
         H19tFIqzmpNA7YnzxdFh0T6d5QMl3dKzADJEBdkPVC9hKewLfjONCcNd3DhX+mCHw07y
         GojKofW7yAcN1dLFyaDFVk0USQvvP6Ifn6c8nviwenDc47tE+Pi/NOMiMjOswfUmd7nL
         CAdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjVmSLGpMe2z0sVQzixxknsqwSpdnFTnGnzZ7Ob3XlF1X0uhQmPGAf0caqL5HHaYEW8/nN6u22Q83qUuo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhHS8OxX6scdLwm3opAyCGDzR6yXVTB82smcCX7NevouGPa/yi
	Qy7CHal7l1TU4B6kHSPOHTtXh92cZwLSi7Qtf0GZnj7e+ataR+mzLb1ZtuF6hUc=
X-Gm-Gg: ASbGncsHx2QhZ2r6CJPrjA3LekNTPBwGQeLdvou72+J9n+zTmCwUtr1GK56mjC9XdYr
	163n3Tc5gedL0O6T8B9jBxkujemao4V2+32HcwQFG5QznaluW9cT288A7LfxyOLSo/br6mJ6Acg
	f8mHiQAmUDn0stMaSI9rPgJYTbvGJ7rjW1qfxEfOU0ZObrK5IyI+mkV/v1+TFYGdL4+X+SgciWz
	nMam6JTttbMvUNmCNMUnVn7TcfIlKiGGP5LXdvAGShaPmcIrby7gXY83IdkyoodUM4pPwm0Gq/v
	gaJUwzLkG9y8RXuhpgruVKg2YZIG3WBg59Yjg8NAaqUGoqeC8fb0rxAgyg==
X-Google-Smtp-Source: AGHT+IE2L4my6sPk4at5ftAoG0v5WbxGaVF/fk8d5mLzPcR4uQonJ76hNjwuuSa/akA9CASfpugANw==
X-Received: by 2002:a05:600c:1e0e:b0:43d:16a0:d98d with SMTP id 5b1f17b1804b1-43eb71d7d27mr7335715e9.15.1743578438623;
        Wed, 02 Apr 2025 00:20:38 -0700 (PDT)
Received: from localhost (109-81-92-185.rct.o2.cz. [109.81.92.185])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43eb5fcd3d7sm11659375e9.12.2025.04.02.00.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:20:38 -0700 (PDT)
Date: Wed, 2 Apr 2025 09:20:37 +0200
From: Michal Hocko <mhocko@suse.com>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	linux-trace-kernel@vger.kernel.org, peterz@infradead.org,
	mingo@kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, oleg@redhat.com, brauner@kernel.org,
	glider@google.com, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org
Subject: Re: [PATCH] exit: add trace_task_exit() tracepoint before
 current->mm is reset
Message-ID: <Z-zlRSo6G1xWcd7I@tiehlicka>
References: <20250401184021.2591443-1-andrii@kernel.org>
 <20250401173249.42d43a28@gandalf.local.home>
 <CAEf4BzYB1dvFF=7x-H3UDo4=qWjdhOO1Wqo9iFyz235u+xp9+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEf4BzYB1dvFF=7x-H3UDo4=qWjdhOO1Wqo9iFyz235u+xp9+g@mail.gmail.com>

On Tue 01-04-25 15:04:11, Andrii Nakryiko wrote:
> On Tue, Apr 1, 2025 at 2:31 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > On Tue,  1 Apr 2025 11:40:21 -0700
> > Andrii Nakryiko <andrii@kernel.org> wrote:
> >
> > Hi Andrii,
> >
> > > It is useful to be able to access current->mm to, say, record a bunch of
> > > VMA information right before the task exits (e.g., for stack
> > > symbolization reasons when dealing with short-lived processes that exit
> > > in the middle of profiling session). We currently do have
> > > trace_sched_process_exit() in the exit path, but it is called a bit too
> > > late, after exit_mm() resets current->mm to NULL, which makes it
> > > unsuitable for inspecting and recording task's mm_struct-related data
> > > when tracing process lifetimes.
> >
> > My fear of adding another task exit trace event is that it will get a
> > bit confusing as that we now have trace_sched_process_exit() and also
> > trace_task_exit() with slightly different semantics.
> >
> > How about adding a trace_exit_mm()? Add that to the exit_mm() code?
> 
> This is kind of the worst of both worlds, no? We still have a new
> tracepoint, but this one can't tell if it's a `group_dead` situation
> or not... I can pass group_dead into exit_mm(), but it will be just
> for the sake of that new tracepoint.

Is it important to tell the difference between thread and the
whole process group exiting?

Please keep in mind that even group exit doesn't really imply the mm is
going away (clone allows CLONE_VM without CLONE_SIGNAL - i.e. mm could
be shared outside of thread group).
-- 
Michal Hocko
SUSE Labs
