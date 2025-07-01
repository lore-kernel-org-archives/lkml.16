Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E989242D95
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 06:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751350326; cv=none; b=o7Occ2njHgBvr9J3pufYESkzyY+Mtx0dGpWzQK/5OzEVeGrt2JjMEhL9QLCNyjQECBdpZthjvhw9V0QPBvpJ76nKVCIB7Ur3w3qjnetlytuNrg2tJs5OJ4tcgyH+pMMoapmDdqioxVsgzeSz/23hSsyzH8vqaS4QBsWvPQBiZ/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751350326; c=relaxed/simple;
	bh=saN4FxID72MK9O70x5ti6Buh6RDRMJlJSXECDvQTY9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XC1VgQv3xegqEcDli/RoT2a5VHkEXVnds1Bz281nNut3MQgYgnhA2iN5ZPFiegQQEtQ8bzyMgKoy+sbzrDv0mGIXTnjXFD2GDx+4FugmXKI8jZGqB/JmHFvcoQaRlYXTRnwbhABxQRcaCJ000uURkX+ONhNwMFhiCJxupCpUBJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GtqjqEd8; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GtqjqEd8"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32b2f5d91c8so23811191fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751350322; x=1751955122; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ao18p5od/1iKc/hQOC+lL7oiE1L5SXGy87urySsFyrI=;
        b=GtqjqEd8DQtJO8D3E3+/ZtZ4qvvvvF/b4mWPG3vr8ys8OSyu0PpUEj+UlYZAV3lZZO
         oTZjXVa9L3G1bFrVEW/Xa1uFdbz7JD5HS296WjhTJCgBvCfQ/jSputENiIJnyQQihCHQ
         nWAmlW1w9i0NqEIh5ZTFOHzPfrgkkpp10zncXKO1GNU0nwP5gGdb3Xm5tkhnizK4ZkZj
         vO3IIzjfZEQhCGpQkDYa1x0jzw84txcIRxl8L+yNC0m5y3oAM8S6kTMorf4MEKSHG++i
         gD4XNo1P/dIPVU7GyOH7zfwPLa0SeRbfMFpCQCaWQUrTaTGYrStn3PLDsC+edd7o+fhu
         bhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751350322; x=1751955122;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ao18p5od/1iKc/hQOC+lL7oiE1L5SXGy87urySsFyrI=;
        b=eUJBjHW801+fiq7JPiIjO6Vw1lYkEK+YQdFme1NourS1j6KGP+zg9JZINHv+t+Uy9Z
         KncMc/msIGEpVPJik6rBqhncv49jg+9S+Mq74qHc/wpi3PS0+eU/SaEGm/HST+buHRrH
         W5oWs02V66WxSE+I5j4BLSJgbTxWhJADNpBmhnZcEsiB336OTF+UCmOLzfVwIyZ92/59
         JcsJ5+Pt6zLbgXo+VskwBqFLqUrHxjUgv4VDo0+W0hx1loIoaE0obcVWGLr+wUdmvsSO
         jSr7RrAifBlht/NkXzwfSX/PYrHwJD1ESlqkui1BqPWCcwDHq1CC/CWR/5KXtqPJ2G0r
         izzw==
X-Forwarded-Encrypted: i=1; AJvYcCXHcQgXrpt92n1ac5nnYekvS9+uo+Rpkjr3L7FfCzSipttXufkUPc8dkxN40N8dlaNEd5pyN9KJ0VUgtlU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG1zh7SeulGTqdrlFnSNZVWqq5QtC9dVnNqWRnOa1QAUfe9Lv/
	z4kaNdsjaTHXj77IvehbO1ByzN7W+NYbZK5Qug73l2cFtvcbaZPuYYMUTzuizDFSXh1qKe+hqg/
	WwayQjsXkk1LY167wA5ktP1iqg4bklTo0ufM0wKW6A1P4cJ2olD8MxoeuFY0=
X-Gm-Gg: ASbGnctRZyiNuDCpxPPNfAvpnyDJOMXa5nO/2MHWHhMshXHLJJo6kK7Yjov2dIPB816
	X0SDRPqy9KhfRPPQMmYclvkGq4haZP47sm8COVLr9SpWv4/kjddL+kJ1+UcYNYM1MyebXjA5p4p
	dTE8fFJC1u4EVMtD85Twh+fntHRq6OyM2U8COpU+0kTYBejgnprgM6KBSkJsSiJgYXqRCxzGUZ7
	PKx
X-Google-Smtp-Source: AGHT+IEvB4D58+tkf5rop7CMmq3G6FucfUhW2iS3Dw6SxvYKxxvFGeBBOI0b4ItoAaYTUMcZ6iDgiWlyV/2Yq11rqBY=
X-Received: by 2002:a2e:a015:0:b0:32a:8035:3f65 with SMTP id
 38308e7fff4ca-32cdc54d82emr37145731fa.36.1751350320870; Mon, 30 Jun 2025
 23:12:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aFNYQkbEctT6N0Hb@lappy> <20250623132803.26760-1-dvyukov@google.com>
 <aFsE0ogdbKupvt7o@lappy> <CACT4Y+Y04JC359J3DnLzLzhMRPNLem11oj+u04GoEazhpmzWTw@mail.gmail.com>
 <aFwb_3EE2VMEV_tf@lappy> <CACT4Y+b9u6_wx9BU0hH0L6ogGKN_+R5T7OsgJVFAWm8yeD0E7Q@mail.gmail.com>
 <CACT4Y+b1Sou9bzhsuJ_LAjwCtynWN1iNRnaUkkTecNWxLUfMUw@mail.gmail.com>
 <aF10Cu0GI092Sjr3@lappy> <CACT4Y+ZB45ovD0hX3xX_yTUVSRDc1UCXnVDB57jxyWPPc7k=MA@mail.gmail.com>
 <aGKe0bcv1mzBnnQr@lappy>
In-Reply-To: <aGKe0bcv1mzBnnQr@lappy>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 1 Jul 2025 08:11:49 +0200
X-Gm-Features: Ac12FXz_-0__3GT-RPYMP6RFV8zTX8Js5F_ec8oO48aqoqzeHNOQv7m_uFBpLC8
Message-ID: <CACT4Y+ZsVGXg4S=ufZ3yWwKPJ_-dG_bLCaPrKHOXCVgZQd9R6A@mail.gmail.com>
Subject: Re: [RFC 00/19] Kernel API Specification Framework
To: Sasha Levin <sashal@kernel.org>
Cc: kees@kernel.org, elver@google.com, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tools@kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Jun 2025 at 16:27, Sasha Levin <sashal@kernel.org> wrote:
>
> On Fri, Jun 27, 2025 at 08:23:41AM +0200, Dmitry Vyukov wrote:
> >On Thu, 26 Jun 2025 at 18:23, Sasha Levin <sashal@kernel.org> wrote:
> >>
> >> On Thu, Jun 26, 2025 at 10:37:33AM +0200, Dmitry Vyukov wrote:
> >> >On Thu, 26 Jun 2025 at 10:32, Dmitry Vyukov <dvyukov@google.com> wrote:
> >> >>
> >> >> On Wed, 25 Jun 2025 at 17:55, Sasha Levin <sashal@kernel.org> wrote:
> >> >> >
> >> >> > On Wed, Jun 25, 2025 at 10:52:46AM +0200, Dmitry Vyukov wrote:
> >> >> > >On Tue, 24 Jun 2025 at 22:04, Sasha Levin <sashal@kernel.org> wrote:
> >> >> > >
> >> >> > >> >6. What's the goal of validation of the input arguments?
> >> >> > >> >Kernel code must do this validation anyway, right.
> >> >> > >> >Any non-trivial validation is hard, e.g. even for open the validation function
> >> >> > >> >for file name would need to have access to flags and check file precense for
> >> >> > >> >some flags combinations. That may add significant amount of non-trivial code
> >> >> > >> >that duplicates main syscall logic, and that logic may also have bugs and
> >> >> > >> >memory leaks.
> >> >> > >>
> >> >> > >> Mostly to catch divergence from the spec: think of a scenario where
> >> >> > >> someone added a new param/flag/etc but forgot to update the spec - this
> >> >> > >> will help catch it.
> >> >> > >
> >> >> > >How exactly is this supposed to work?
> >> >> > >Even if we run with a unit test suite, a test suite may include some
> >> >> > >incorrect inputs to check for error conditions. The framework will
> >> >> > >report violations on these incorrect inputs. These are not bugs in the
> >> >> > >API specifications, nor in the test suite (read false positives).
> >> >> >
> >> >> > Right now it would be something along the lines of the test checking for
> >> >> > an expected failure message in dmesg, something along the lines of:
> >> >> >
> >> >> >         https://github.com/linux-test-project/ltp/blob/0c99c7915f029d32de893b15b0a213ff3de210af/testcases/commands/sysctl/sysctl02.sh#L67
> >> >> >
> >> >> > I'm not opposed to coming up with a better story...
> >> >
> >> >If the goal of validation is just indirectly validating correctness of
> >> >the specification itself, then I would look for other ways of
> >> >validating correctness of the spec.
> >> >Either removing duplication between specification and actual code
> >> >(i.e. generating it from SYSCALL_DEFINE, or the other way around) ,
> >> >then spec is correct by construction. Or, cross-validating it with
> >> >info automatically extracted from the source (using
> >> >clang/dwarf/pahole).
> >> >This would be more scalable (O(1) work, rather than thousands more
> >> >manually written tests).
> >> >
> >> >> Oh, you mean special tests for this framework (rather than existing tests).
> >> >> I don't think this is going to work in practice. Besides writing all
> >> >> these specifications, we will also need to write dozens of tests per
> >> >> each specification (e.g. for each fd arg one needs at least 3 tests:
> >> >> -1, valid fd, inclid fd; an enum may need 5 various inputs of
> >> >> something; let alone netlink specifications).
> >>
> >> I didn't mean just for the framework: being able to specify the APIs in
> >> machine readable format will enable us to automatically generate
> >> exhaustive tests for each such API.
> >>
> >> I've been playing with the kapi tool (see last patch) which already
> >> supports different formatters. Right now it outputs human readable
> >> output, but I have proof-of-concept code that outputs testcases for
> >> specced APIs.
> >>
> >> The dream here is to be able to automatically generate
> >> hundreds/thousands of tests for each API in an automated fashion, and
> >> verify the results with:
> >>
> >> 1. Simply checking expected return value.
> >>
> >> 2. Checking that the actual action happened (i.e. we called close(fd),
> >> verify that `fd` is really closed).
> >>
> >> 3. Check for side effects (i.e. close(fd) isn't supposed to allocate
> >> memory - verify that it didn't allocate memory).
> >>
> >> 4. Code coverage: our tests are supposed to cover 100% of the code in
> >> that APIs call chain, do we have code that didn't run (missing/incorrect
> >> specs).
> >
> >
> >This is all good. I was asking the argument verification part of the
> >framework. Is it required for any of this? How?
>
> Specifications without enforcement are just documentation :)
>
> In my mind, there are a few reasons we want this:
>
> 1. For folks coding against the kernel, it's a way for them to know that
> the code they're writing fits within the spec of the kernel's API.

How is this different from just running the kernel normally? Running
the kernel normally is simpler, faster, and more precise.

> 2. Enforcement around kernel changes: think of a scenario where a flag
> is added to a syscall - the author of that change will have to also
> update the spec because otherwise the verification layer will complain
> about the new flag. This helps prevent divergence between the code and
> the spec.

It may be more useful to invoke verification, but does not return
early on verification errors, but instead memorize the result, and
still always run the actual syscall normally. Then if verification
produced an error, but the actual syscall has not returned the same
error, then WARN loudly.

This should provide the same value. But also does not rely on
correctly marked manually written tests to test the specification. It
will work automatically with any fuzzing/randomized testing, which I
assume will be more valuable for specification testing.

But then, as Cyril mentioned, this verification layer does not really
need to live in the kernel. Once the kernel has exported the
specification in machine-usable form, the same verification can be
done in user-space. Which is always a good idea.


> 3. Extra layer of security: we can choose to enable this as an
> additional layer to protect us from missing checks in our userspace
> facing API.

This will have additional risks, and performance overhead. Such
mitigations are usually assessed with % of past CVEs this could
prevent. That would allow us to assess cost/benefit.
Intuitively this does not look like worth doing to me.
