Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6421F3D58
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 05:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751347377; cv=none; b=UMG1WXGJyQO/nD82kw6TsrrZZJrsgGPuZ3W3ZYND+dANWVP8CsGTb6PXO9wnLftY3dlufunRjWMBKpURrR60CCX+l95xnUkRXD5jNS5JnFVUEjm4oNNYR2wVJbCdW7LmOL+CRTUHLH1yVHENUT8xaiKf/SL3LOnKJpqVsE7hAU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751347377; c=relaxed/simple;
	bh=5/JwVEuz/UpsEESScBGzFxUIa7q8yQbIgcrUrStPkRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WSmhgw9c2/kzbXRfBtpxiqpXf1eQ/PwgBp4sREVsa1vaXZLporrUmLmG6hsm94yURqB+Z0DL7tRYbyz6FLG3GgDb7z4M4fQ7wdoTM75FSVPnCoPhr0VM9mZI8KSOrWK7p7P0GS7DXYZ9uw6VfBy1+IVkHNipGbCszYAKKR5QcC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IOTNHNCC; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IOTNHNCC"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fadd3ad18eso52651476d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 22:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751347374; x=1751952174; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWbnuDQEG4ZG51rhVoXd9l74zp2+Y+DpuK1YGU3B97M=;
        b=IOTNHNCC5XL6Gpiq9DVCWIg6sbnVAjQ8AwT1wMQfQG2eANrPlz+3PzsKz36GbjRxrm
         JdU+6ZjRre9jbvmwi/jpkUHcTTvx/8zK5d/2WVff1OYLT/H8/TMmIeouKueUXrCl2mA7
         hWhdIqUUFIG1ZZHk9gZ/0Lx6PMIi3hA4InYkXuyCEjHKeW1u0OxOJrjlThtp8J0pbyxc
         ChvGSupNEzG02YetZriIBQd9YlspgRddJp1rlbpNIzOXm92ic+0ACr+kHghRuzsxXOKf
         DSC+P3oszlJln6dCNYsKdYxRD8+nQ63hMulf5NwClbya6lhxKxmPd5dL0Kq0NDX3Sps+
         ohKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751347374; x=1751952174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWbnuDQEG4ZG51rhVoXd9l74zp2+Y+DpuK1YGU3B97M=;
        b=wOpcTDgCTYMiuEUSwO/O8S+jOn8iiQP/VcnnCTv7cIf8n8lUmKsYUlSpEAmtiJecVm
         Wr76PzPIKJGuu8SD39RC3i9yMBnauAsmgw1vUBW+qZVIVIg7nqqcN8YfrUj6WR0PUqsU
         TaN2cJLfFD0tYCrmeMNu4Y756a6efFvgqQGp/LZBZcNllHEgp3+CZavp9VnCsTF5bPjM
         Kd0lHriDO44z0TNhiuKp00pPbXz7iaBsVzzBMdzUPyio9KH+tn4qhUn+vs30Q2CAfKdF
         Mj5jubk+u54H+15dRRIGuFWdwgcpsudiJ94z23uChhhjE/T3Lt/4itUqE65FphgSQ6V0
         40tA==
X-Forwarded-Encrypted: i=1; AJvYcCU/T1eLzKQ/RAXRee8D8jYV/8kCCcvsB8OxHuIdy2P9758mueJftmagL3PZ/4/md6yPsJqjfTqwVRvR9pE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzofByPnSTyCqmDSbqfeuHvWa5KTKzDsdNCfpvRZfWS8eEA8rro
	csP6RMI3p3T9uMTnc4KovO2j9xN6IQd8kz4wVRRX1MG+tNR7LPUnsytLXLP7fXHyK/Lcig4PdGj
	mMEyrS7usdB3zs0/JjyEZsK37rS2ldT4repd2S7f4uzigxpHXybp3SR5GuZM=
X-Gm-Gg: ASbGncs7UCazBIYvM7QtXujNp/816Wjm+h1ZqR8BfreoXDnAvbTCLOz3jVvYaJ1hEtd
	f7YoTDaMtKYLo8ueoLWSnY2IsRJ3FZpUhldahf2+IVw1J8fmvp3m5ZI9IS/ZCTvT807zd3NP2eR
	pwiu8/Q75OPa69xSeCqwAUA3Y4MKQTONjx30GIDsAAFIlu
X-Google-Smtp-Source: AGHT+IGpzxDBrBogoKoyLkPPHM6iDSYvJhIuC7y6ZVpwiIprRtjwSBjJSKv3onzP0yROztlsN5fAxejSDBAAeoyetgE=
X-Received: by 2002:a05:6214:5007:b0:6fd:ace:4cf8 with SMTP id
 6a1803df08f44-700035b781dmr234492016d6.30.1751347373427; Mon, 30 Jun 2025
 22:22:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520082435.2255639-1-tzungbi@kernel.org> <CAGS_qxrcH0+mJTO4nJqXnk2Bh7oO_PEur=ytcxL8wxJNCu20Tw@mail.gmail.com>
 <aGIvjrrSRPJQpNy7@google.com>
In-Reply-To: <aGIvjrrSRPJQpNy7@google.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Tue, 1 Jul 2025 14:22:40 +0900
X-Gm-Features: Ac12FXxgYKxYb9vyVEWPlAfSA3bOrsnLZpveKjlL5T8zEbkPuStK5k7jGoQ6Uo0
Message-ID: <CAGS_qxpqQ1Z5QOxmXoXQyFBygdfW+1R=g9f=bbJo54Ex8LA7Kw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] platform/chrome: Add Kunit tests for protocol
 device drivers
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, brendan.higgins@linux.dev, davidgow@google.com, 
	rmoar@google.com, rostedt@goodmis.org, mhiramat@kernel.org, naveen@kernel.org, 
	anil.s.keshavamurthy@intel.com, davem@davemloft.net, 
	chrome-platform@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 3:32=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Tue, May 20, 2025 at 09:04:53AM -0700, Daniel Latypov wrote:

(snip)

>
> > We have these drawbacks with the current ftrace stubs:
> > * doesn't compile on all arches
> > * silently doesn't work on inlined functions <=3D=3D scariest one to me
>
> I see. I did some experiments and realized that kprobe stubs also share
> the same concern. Thus I'm wondering if there is a way that kprobe stub
> detects the redirection may fail, at least it can skip the test case
> (e.g. register_kprobe() returns -ENOENT when it can't find the symbol
> via kprobe_lookup_name()). But it seems no way if the target function
> is partially inlined.

Yeah, any such approach will need to be cautious of inlining, so
they'd have to always be "for power users only: only use this if you
understand the risk"
Skipping when we can detect the user is obviously doing the wrong
thing makes that a *bit* more palatable.

It's not like static stubs can detect at runtime if you've failed to
add the necessary corresponding KUNIT_STATIC_STUB_REDIRECT() either,
for example.

But I still personally lean slightly against adding either kprobe or
ftrace stubs, see below.

>
> > You mention you don't like how static stubs requires modifying the
> > code-under-test.
> > Since it gets eliminated by the preprocessor unless you're compiling
> > for KUnit, is the concern more so about how it conceptually feels
> > wrong to do so?
> > For the Android GKI kernel, they have (or had) KUnit enabled so there
> > is potentially concern about real runtime cost there, not sure if you
> > have something similar in mind.
>
> Not exactly. Ideally, I think we shouldn't modify the CUT. I'm wondering
> if there is a way to not change the CUT but also break the external
> dependencies.
>
> > But stepping back, ftrace_stubs technically require modifying the code
> > to make sure funcs are marked as `noinline`, which this patch series
> > does not do.
...
> They could be partially inlined even though they are exported symbols.

So to summarize, right now we're stuck with having to modify the code.
(Unless someone can come up with something really clever, but not too cleve=
r)

To make it concrete, the current approach would look like:

int func(char* arg1, int arg2) {
  KUNIT_STATIC_STUB_REDIRECT(func, arg1, arg2);
  ... // unchanged
}

vs an ftrace/kprobe approach that needs a conditional `noinline`

KUNIT_STUBBABLE int func(char* arg1, int arg2) {
  ... // unchanged
}

The latter is definitely simpler and less burdensome.
But I don't know if it's simpler enough to warrant a second
implementation existing for me personally.

E.g. we already have some people who justifiably say it's too hard to
figure out KUnit, so this is another decision point where a user might
get stuck with "how should I know which one I should use?" and give
up.

Compatibility tangent:
A smaller annoyance is KUNIT_STATIC_STUB_REDIRECT and KUNIT_STUBBABLE
are incompatible (and always will be?)

E.g. imagine a func has KUNIT_STUBBABLE on it, but a person authoring
a new test wants needs to run without kprobe support, so they must add
KUNIT_STATIC_STUB_REDIRECT.
I can imagine an author deciding to make the func have *both* macros on it.=
..
That feels like a worst case outcome from the perspective of "we
shouldn't modify the CUT just for the sake of tests" :\

To be clear, the right approach in this scenario is to 1) swap to
KUNIT_STATIC_STUB_REDIRECT and update the previous tests to use static
stubs, 2) then add your new tests.
But I can imagine that won't always happen, esp. if it crosses
maintainer boundaries.
