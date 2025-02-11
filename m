Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC9B1F03D3
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263261; cv=none; b=klXxpQ0qM+zKcfRO78g++/LMcYuVjClklDMX+RnN0Q4J18eHn/D8G6g+uV9Lt+6f7+yqWjXwvsZKt6gcrhq3SV86u33rM2YT/J5h3N65DiXCG5alCFjRP9UAulcRjqbWwpSwscD+HAguclRyHxPJNDt4VkISqSWaMPf4I0UlfZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263261; c=relaxed/simple;
	bh=yTNF8m8nxCuxx0EDRShPHz3vJ87Lnbule4bfgDMTId0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JoRnqGUULC6Jl5vEY6+cgnkLtFwcbu7sFl44e9bI94dpyebC10bBA2btdFVLraes+HFQp4heBcTMW8/IrxSrgeBEH04DF6DpyZrduFyA1qxB6nKtSyLzdJvmlBFywRcUelv+txkB0MINCxo1AH0/NcKStt/H8LMWSRm6qpp7RpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=Ha2SiXrw; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="Ha2SiXrw"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-308f71d5efcso11249131fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1739263258; x=1739868058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTNF8m8nxCuxx0EDRShPHz3vJ87Lnbule4bfgDMTId0=;
        b=Ha2SiXrwCKdP9UpWEjOfHcWOjFhy2mbiNqjjBRH1srQUQahhdPi8EMPrg2bMHXs72q
         2srxHPYV0/26AWbs0028Kb7R4w142UIFGYbBpdGF2FEt+VJ3E6Ng594IsDJRvopOm5Ai
         tnEHlDb0duUtjeXyFseaMg6+aAOzOdFjmc+ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739263258; x=1739868058;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yTNF8m8nxCuxx0EDRShPHz3vJ87Lnbule4bfgDMTId0=;
        b=jLN6C0dmcmIqYxVkUftxpbm591LtQobifNn8/2CiTj/ZUcVVbOwZI8KDBqnaOS2nBW
         JG/GnhzY8KevG1ZJP0hi2RqX4owJc5gQg/WtLtL1nHPAImYSUAcAVOAGxU2Ct51Casqn
         Z8fTrMUde+exzDcddr2ZT4W+qJuHjHX2uWlti+8M7G9MVyWweWyIsp3ZYc/MYklJ921o
         pZCBD8GpGlOAM++mk5ijScG7PsNM2/EGmmvgcw03vgPvlwXlLbkPqTglT1EZXmShZWcW
         UiTe1oGix6BzSXKd6Hsc9xYWavHuavM9+3PWz7ErbVlinezcgCbdCBmDrQS/IpzTKQXu
         ZxCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV3O433rWhHuEhWxjcnhlMofGDWuc+Tlza4BGHp56y0t95ZMLjD1a7R4pLe9orKUuD5pOcSA5TPCaG5Ng=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeN32lZORbj+Lvyls7G506afi4D6uoO+01vSs1C8wZQLNKg18H
	A1DwDHdUpwVHLNIrBW7CHwoaJyWDR0BhPdseQq8wlCpHqwSsPKW8caJukI310gM=
X-Gm-Gg: ASbGncvBuuiqwh0QGvOtX2kjDfj+vdlM4f4vwai8BYzV7+DkhuM8vOT64BiEVxdm0V9
	bFSEb5PM3I47YUccun2XT1JZHOZ3f4mgOf6/GZrv2VHvLghESm4aXYT4bEggJbQAkbu/qd/+3HZ
	+Gyh9fKBauVEs2m99Tdmge6bNUlUOe5Nz/zlQTtC6LXR3YDVRzhecMi1ULJr2MeMa8BMsiY/IcY
	V2hrG3YCc+8rouKVJOMfSqNY6NsIutq0lzHBLdmAEnOkaBpqSSHOv5itug0KnVyuT8miJ2XQTpo
	zo7KXKFUdkpfAdv1
X-Google-Smtp-Source: AGHT+IFyuHwShqGtWI3e6boWfgOJuS5V2vIC04DXs22kugVv1qWaggSk2GonF+yQmxK+lPWqPHvn5Q==
X-Received: by 2002:a05:651c:220a:b0:308:f455:1f93 with SMTP id 38308e7fff4ca-308f455212amr16700741fa.27.1739263257028;
        Tue, 11 Feb 2025 00:40:57 -0800 (PST)
Received: from localhost ([81.216.59.226])
        by smtp.gmail.com with UTF8SMTPSA id 38308e7fff4ca-308f84c278fsm2009051fa.23.2025.02.11.00.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 00:40:56 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: David Gow <davidgow@google.com>
Cc: Tamir Duberstein <tamird@gmail.com>,  Petr Mladek <pmladek@suse.com>,
  Steven Rostedt <rostedt@goodmis.org>,  Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,  Sergey Senozhatsky
 <senozhatsky@chromium.org>,  Andrew Morton <akpm@linux-foundation.org>,
  Shuah Khan <shuah@kernel.org>,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/2] printf: convert self-test to KUnit
In-Reply-To: <CABVgOS=dfuX+X8=EVHcrCZnbOZj3T+wGD922eoeHb-dcOmmzXw@mail.gmail.com>
	(David Gow's message of "Tue, 11 Feb 2025 15:15:34 +0800")
References: <20250204-printf-kunit-convert-v1-0-ecf1b846a4de@gmail.com>
	<CAKwiHFi6SUCT7UjUTdKmLJ8kiAEqVg=d6ND60R05MJB85Eoj9w@mail.gmail.com>
	<CAJ-ks9kLmArqqPati8n0dwzhjccLmTuTHtkaSyf_F_1QXzCoRw@mail.gmail.com>
	<87bjvers3u.fsf@prevas.dk>
	<CAJ-ks9=0+fk22Dx-65a+CSYhy0dnjTJuot9PtgOCi5Th1_wARA@mail.gmail.com>
	<87y0yeqafu.fsf@prevas.dk>
	<CABVgOS=dfuX+X8=EVHcrCZnbOZj3T+wGD922eoeHb-dcOmmzXw@mail.gmail.com>
Date: Tue, 11 Feb 2025 09:40:55 +0100
Message-ID: <87h650ri08.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11 2025, David Gow <davidgow@google.com> wrote:

> On Mon, 10 Feb 2025 at 19:57, Rasmus Villemoes <linux@rasmusvillemoes.dk>=
 wrote:
>>
>> On Fri, Feb 07 2025, Tamir Duberstein <tamird@gmail.com> wrote:
>>
>> > On Fri, Feb 7, 2025 at 5:01=E2=80=AFAM Rasmus Villemoes
>> > <linux@rasmusvillemoes.dk> wrote:
>> >>
>> >> On Thu, Feb 06 2025, Tamir Duberstein <tamird@gmail.com> wrote:
>> >>
>> >>
>> >> I'll have to see the actual code, of course. In general, I find readi=
ng
>> >> code using those KUNIT macros quite hard, because I'm not familiar wi=
th
>> >> those macros and when I try to look up what they do they turn out to =
be
>> >> defined in terms of other KUNIT macros 10 levels deep.
>> >>
>> >> But that still leaves a few points. First, I really like that "388 te=
st
>> >> cases passed" tally or some other free-form summary (so that I can see
>> >> that I properly hooked up, compiled, and ran a new testcase inside
>> >> test_number(), so any kind of aggregation on those top-level test_* is
>> >> too coarse).
>> >
>> > This one I'm not sure how to address. What you're calling test cases
>> > here would typically be referred to as assertions, and I'm not aware
>> > of a way to report a count of assertions.
>> >
>>
>> I'm not sure that's accurate.
>>
>> The thing is, each of the current test() instances results in four
>> different tests being done, which is roughly why we end up at the 4*97
>> =3D=3D 388, but each of those tests has several assertions being done -
>> depending on which variant of the test we're doing (i.e. the buffer
>> length used or if we're passing it through kasprintf), we may do only
>> some of those assertions, and we do an early return in case one of those
>> assertions fail (because it wouldn't be safe to do the following
>> assertions, and the test as such has failed already). So there are far
>> more assertions than those 388.
>>
>> OTOH, that the number reported is 388 is more a consequence of the
>> implementation than anything explicitly designed. I can certainly live
>> with 388 being replaced by 97, i.e. that each current test() invocation
>> would count as one KUNIT case, as that would still allow me to detect a
>> PEBKAC when I've added a new test() instance and failed to actually run
>> that.
>
> It'd be possible to split things up further into tests, at the cost of
> it being a more extensive refactoring, if having the more granular
> count tracked by KUnit were desired.

I think the problem is that kunit is simply not a good framework to do
these kinds of tests in, and certainly it's very hard to retrofit kunit
after the fact.

It'd also be possible to make
> these more explicitly data driven via a parameterised test (so each
> input/output pair is listed in an array, and automatically gets
> converted to a KUnit subtest).

So that "array of input/output" very much doesn't work for these
specific tests: We really want the format string/varargs to be checked
by the compiler, and besides, there's no way to store the necessary
varargs and generate a call from those in an array. Moreover, we verify a
lot more than just that the correct string is produced; it's also a
matter of the right return value regardless of the passed buffer size, etc.

That's also why is nigh impossible to simply change __test() into
(another) macro that expands to something that defines an individual
struct kunit_case, because the framework is really built around the
notion that each case can be represented by a void function call and the
name of the test is the stringification of the function name.=20

So I don't mind the conversion to kunit if that really helps other
people, as long as the basic functionality is still present and doesn't
impede future extensions - and certainly I don't want to end up in a
situation where somebody adds a new %p extension but cannot really add a
test for it because kunit makes that hard.

But I hope you all agree that it doesn't make much _sense_ to consider
test_number() and test_string() and so on individual "test cases"; the
atomic units of test being done in the printf suite is each invocation
of the __test() function, with one specific format string/varargs
combination.

Rasmus
