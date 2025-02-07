Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEC01DE3B1
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738921345; cv=none; b=K6EbzQ4yI/Ol0UTGjc/ovxvIrAKlMEdDoSR+WATyBuhZslKntdgP+nd52Z5Quv5GipU4H/RqpXTBpiDzUyTkTqOHaDGcImlSgXv16h+CBqJIA+ni5Ose6BD2ihgpEvttbY1I5asAMBo0OMBgugFllQUbT7J3qcpw3+8bOStlXnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738921345; c=relaxed/simple;
	bh=ofFTj1TCyaZo+iCF/kD699zoLnBmPF0uKOAMou48smo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D7oVs6HvvdaaJNjocSkKKK7oPyK9QWY1RgbQSPJDeUjJOYHP7mg3Q6xmwfjddEscvgzFTCXHKpt9Ia9Qi4l10fwo65AsrYIGu5QcPL8JrSA02qvIHIo7xDPNJYzM8aXbN9raSZt86wBw5zmvziga3W2ZJWb43FQq/e+AVdv1PDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lvaxwmt8; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lvaxwmt8"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2f9d5f8a4b9so2950562a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 01:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738921343; x=1739526143; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ofFTj1TCyaZo+iCF/kD699zoLnBmPF0uKOAMou48smo=;
        b=lvaxwmt8sbPUYDJu+InC/np7gRgchdJlu3bdSNbeG/44enAw7lOkK3NKMuJq1g5nP5
         6ifhul5uyD73nCfaHAB++DotE9bkKOAVWay6t+fvuhGfVTw54GKF6hUweuLE8u7FY8LU
         NQ0nNoPqcZk7Hg8iRKGG+7HMj8cYZWxdojAAzHRjem69mDEkJfxorCPPEb5Z50T+Br4u
         AhbDdgtc1g74bmU0uR4KOo0LWQG28dhZHwSCUb3A5RGpCUA4YFZ2jofXjNLZS0Cd5WVE
         G4bvT/Onq/RGV/9hVSnD52LrskiddR0R0XHE1mdicBv88KVKE8rmAYq44XxjN7Bqo1w9
         a/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738921343; x=1739526143;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ofFTj1TCyaZo+iCF/kD699zoLnBmPF0uKOAMou48smo=;
        b=elEtrZjtDO5yEIhXmjUHmnb1nawkCM/Y0hYu7AUQygNKdDjo+XUHvmnFyTfkRcZqb7
         CF10rdo1MC/D6sphjqp4WgRz18r0T5e5TDIVD/Tx8PIwsRqo5U4TSuvgw5Qziq0No+9t
         obK1S85yOhqVp01VxJH1xKE+zb0pAk5iJO0JDDULcDhB6zB+zeEvUTKqAKB6VHJ0EAC+
         RAsTLGAGVn7pBJPEMZRKQPKuoGQ7egL6lQToqA+nx9o4Y6eXa0/hu3g7JfdGhLuUqQ9u
         iFmf0fd0Nj8YJLhwSswKcLC3AFiZI5mirgqPk8W8/SfM5JegcTjEbw1tDdJLJ1rNr9QO
         mgvw==
X-Forwarded-Encrypted: i=1; AJvYcCUAJnPerMr6t2jF6oMuiBBfC3ynKVJXsfMfja9Vdub33anprdp7ZJzRgA6AbIE6SJTxRxUKqDHAQ+0QNCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUdBlhirc92/OQ/uA0fzfA7O0uqhG8T/+C2xv3NMaPrikmkCQn
	jWcp7hJStqDj3LUBhpn0i76Z+/yLgD9Q8X6xg4mL4mBkzpsY9KiHaJ3j7ukSWTBYoUrdFIOt6gJ
	bu2Up+YVQXkhVw1NpafWWTWq9SJb/tUsRnzF0
X-Gm-Gg: ASbGnctjZfQdNqh/fPcq7eLbkuRSkfgnK9Tvr7ajgabNAb7kUpY9S1L47n+uYWDzsUy
	ui+MIIxYUBYSNd3PzEGb3InOZbJbZMkfOPNQaMLOv4SOVXJ7S+KLLwdkTQ337JmWw+9cK/Nx9/T
	KC8QvFdecqzS6ak4JXlYyDT89VyxuK
X-Google-Smtp-Source: AGHT+IG4ZY4IqMmaYiHGhuhfQn/5+xCxjBM+K68OROGK7+Yzk74KuOTCA8zbxSoW+j9bpj4TSCIuaHZf3rRZy50Wr64=
X-Received: by 2002:a17:90b:3143:b0:2ee:f22a:61dd with SMTP id
 98e67ed59e1d1-2fa243eef9bmr3628490a91.32.1738921343365; Fri, 07 Feb 2025
 01:42:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206175114.1974171-1-bvanassche@acm.org> <CANpmjNOsf1RnYJuZ7pmWVYNqVYMYe+eTL0vhDKU5sLihR9fN-g@mail.gmail.com>
 <90c7a807-b0a0-4b42-866f-f74c5d1c62e5@acm.org> <20250207084223.GX7145@noisy.programming.kicks-ass.net>
 <Z6XM6zjK3mtqYfan@elver.google.com> <20250207090827.GZ7145@noisy.programming.kicks-ass.net>
In-Reply-To: <20250207090827.GZ7145@noisy.programming.kicks-ass.net>
From: Marco Elver <elver@google.com>
Date: Fri, 7 Feb 2025 10:41:47 +0100
X-Gm-Features: AWEUYZlZ64s_-iiKP6W_6Jm5GgDCkTGb1MAvFK0wIx2GPboEISjek7OYIKFBvdE
Message-ID: <CANpmjNPoFMacBc8YhsN0hcw_npCbfixQq44JkXPFdb0uPaNUVA@mail.gmail.com>
Subject: Re: [PATCH RFC 00/33] Compile-time thread-safety checking
To: Peter Zijlstra <peterz@infradead.org>
Cc: Bart Van Assche <bvanassche@acm.org>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, Jann Horn <jannh@google.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 10:08, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Feb 07, 2025 at 10:05:47AM +0100, Marco Elver wrote:
>
> > Yes, you can add multiple guarded_by. But it's just going to enforce
> > that you need to hold both locks before you access the member. If you
> > want the rules to be more complex, the best way to express that is with
> > some helpers. E.g. something like this (tested on top my series)
>
> Oh gawd, this is going to be a pain, isn't it :/

For complex locking patterns, yes. :-/

Which is why I'm proposing it to be opt-in but relatively complete
(most primitives supported), so that either we have time to work out
how to deal with more complex patterns, or just leave some things
opted-out.
