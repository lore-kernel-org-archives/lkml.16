Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D72F24BBFD
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 12:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746188299; cv=none; b=LBVILPOd74B7oSmITYYKD1AaUYOdLQNJsM+QLdihDbj/ZjF+eNdwPlZZ2tiOJz2KfsjSPVWyFyW0TU3WY/22VfxHr1IQFctL3pYN5GkGX7Q8PL+l8u3UFN+hcN9OpFLP3tG8TGRBfdNQnqU75XV0QFZQHQv0R8R0LKzsr8qNzRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746188299; c=relaxed/simple;
	bh=vGE2Q+jxE6JFBFMDR7fs6IEpZuRYN8Hz1ei0pbuERLc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TNCO3oB5ZY7g7x+t2ks3DgqIsj+27hIO5RqGxSk4FryCezcfjrCFv1yMIoU3iqOiZ0v/6ldC443Q5lKivKuu3QWRSGQP7989t1hUqgz8+Dui+F6IlFoHyfcTSTzE4v2Lt6bLs9gFLy84bfYqY6JrV0vOaJMI3PaRQGWZs1x4j4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qSUDdo/V; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qSUDdo/V"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-440a4e2bad7so12328055e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 05:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746188295; x=1746793095; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J4EIqRH8s+HJXS4njQ/v+2ek79fyo/PhNx8U1JoTIak=;
        b=qSUDdo/VPjFGYaD+QtZjS4yzOs4pAZKoD9m9vUR6iniQ/5UDzdShCXE/6Qg91sa4MH
         HLopWUuUutaoWe8Ln+kycZWMc3OXoudKTzJvfVFbUHxgPVtojjk610iCMNXeGgrpfREm
         dGWyywIQudq1BpHae5avHPwZQ4Y4CP4AzCaCaZSPMwjE/bpumIX32xujGIsAIaGNZk6i
         iUiItuWQU5lK0J7o6soH8V31A2Qh7hSbGNifXOrjdHktC0NbkeqR6S9Uc4rF0MzRfbWb
         hTJa8nD5LZx9LXlXNxdq8E4a30JeFIROtssNGmMKHZZ5PKIRdRBhbG5m7/YSL0cG9iD4
         ZkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746188295; x=1746793095;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J4EIqRH8s+HJXS4njQ/v+2ek79fyo/PhNx8U1JoTIak=;
        b=ZSEQ9uJBhTjWgScLJ92p47wMNa+E5Oo79Lw2KtGF3xYoCeqRiQ9JbSEGnOsCDCp3qY
         YVYCGyamsv9zg1b4E743GzTWKfp3hASfYSV511OuDswxF4rA89rhGUgF9bhN0AblcUX3
         X1T24mIyR4xTfg/2H64W5WkRKciQFQPeY7ZaycIvMQ6HAzKCbqltCpxTZsK6TRc2hqLP
         XDoCraCKrB9NLm3bX7rQkR8IzIyoTcfJzS8ISo2xYtCVXvLasfw9it3U1Z0PkNQ/amTf
         rp0jFu9HdE6dbMLtBGO3bdAx2lLTyaZzeT08hCYgDwXj9KpwMr9tPVRMLUnw7jrK5cQH
         rbsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjbrdLJPrR8YdhCy2cgccsS7fkqt+1iKwVHGocu8VRijPNuLqrAyCuSyT5JHdR4nU3VbTF5ytBAJBULfw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya0I+WubDf4oN+fm9dDFOIJMgJghPPD8+ybpGH82RGGkak5sF9
	PW/x3wop4UvnO5pP8GJ0sJM4dGlYu7J2WlQi7YlL7lmRooWMVLk2saxAsoR7rG+qQLvAfTv5H6f
	a2XdfjDViIA==
X-Google-Smtp-Source: AGHT+IFmoIah9vIU+ME6LTH3yaSoPOxR0iqcuVmJEVttYxbVNA2iy85jqW8QzQsVUdCyB+30OgU962ian6s4pg==
X-Received: from wmbjb17.prod.google.com ([2002:a05:600c:54f1:b0:441:bf4e:899c])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8711:b0:439:5f04:4f8d with SMTP id 5b1f17b1804b1-441bb88d42emr21008445e9.12.1746188295600;
 Fri, 02 May 2025 05:18:15 -0700 (PDT)
Date: Fri, 02 May 2025 12:18:13 +0000
In-Reply-To: <20250501163827.2598-1-ujwal.kundur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250501163827.2598-1-ujwal.kundur@gmail.com>
X-Mailer: aerc 0.20.0
Message-ID: <D9LO37W7M7YJ.2R0GAINJRE55C@google.com>
Subject: Re: [PATCH 0/4] selftests/mm/uffd: refactor global variables
From: Brendan Jackman <jackmanb@google.com>
To: Ujwal Kundur <ujwal.kundur@gmail.com>, <akpm@linux-foundation.org>, 
	<peterx@redhat.com>, <shuah@kernel.org>
Cc: <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu May 1, 2025 at 4:38 PM UTC, Ujwal Kundur wrote:
> This patchset refactors non-composite global variables into a common
> struct that can be initialized and passed around per-test instead of
> relying on the presence of global variables.
>
> This allows:
> - Better encapsulation
> - Debugging becomes easier -- local variable state can be viewed per
>   stack frame, and we can more easily reason about the variable
>   mutations
>
> Patch 1 needs to be applied first and can be followed by any of the
> other patches.
> I've ensured that the tests are passing locally (or atleast have the
> same output as the code on master).
>
> Ujwal Kundur (4):
>   selftests/mm/uffd: Refactor non-composite global vars into struct
>   selftests/mm/uffd: Swap global vars with global test options
>   selftests/mm/uffd: Swap global variables with global test opts
>   selftests/mm/uffd: Swap global variables with global test opts

I tested this using this script:

https://github.com/bjackman/linux/blob/523e40a88fac34b17f49614dfb24fd5e18e63685/.github/scripts/run_local.sh

After manually enabling the userfaultfd tests (I disable them in my
crappy CI thing as they are flaky):

https://github.com/bjackman/linux/blob/523e40a88fac34b17f49614dfb24fd5e18e63685/.github/scripts/test.guest.sh#L15

So

Tested-by: Brendan Jackman <jackmanb@google.com>
