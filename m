Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1214F1F560E
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739188651; cv=none; b=LXsvqvSRW4OTko7N2EJX/lDMhYqPpDr2gyifQnqRh4+JyhgU+pKPGnN5g+/DgQE9nJAhtvrtH795P4q2+YDKOG+KIeLCQjIo2pa8DtDDeZQPUUrsGAFEXTnzBEkg+MTHloHeQwh47RJZdCNKofY10yw3KuWu5/ppW3eEwSquVik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739188651; c=relaxed/simple;
	bh=oMySDRJ1QcW10QlgKdMX24iySk7iQTg/ty46AMQU2Vw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PwFA/3CyMaR89I/bP/E6DpiUDuzGTyDNyvM5jp7Nf9TuQUL2okyLecbTZccucMSIKPQacXB2mSX7E7t8fEtW+j1ugM8UBQvFfqoJtXi6GU8gTOoceGgfVGUlvHOMXgYPUyYUwlVhO8HL4uGNpmFU3OZy/VYnon/DtA3BGjOgZ2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=F7+2ktOD; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="F7+2ktOD"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54504f29000so1872291e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 03:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1739188647; x=1739793447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LgAZGxaGXXHdg9p2e7i/rWupwIQDPEMecy8bcT/VaIY=;
        b=F7+2ktODYWh+9rzrBmcQt5K0moRT9dyLhFQmboE7g5EIo5CMtQld6lzPMZjN9SJw+n
         d/V4PYyY2hpzl8Btjs+9anZA/cfSy1VoOx5vCsU0D2ht0xyogP5gD6qMmfJ5rTjSNeZK
         cqA044HgAfXZcN6MH7+RlFGu/OaZFyM7tPwek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739188647; x=1739793447;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LgAZGxaGXXHdg9p2e7i/rWupwIQDPEMecy8bcT/VaIY=;
        b=gKyMpyu6IXLjEDihoS0h+iL1rmbgn+DAR79yfuVEAm7S20elHH3yZzOFe0wpkSlcAA
         IqZjmdxlAim3mByHrao/KVe0bqIk8E3cVk9OOrqkxuxOu6Mke5yfUOA2AZ+Q8L3oDume
         mkxcBUCiaRFebbt8cB5YUJSjGFCzHSw0mRUy4S2lobldjrrc6oQs5kdAKjA5TFtuY+IL
         2aPSyn3DHNSqAJIn1CcM3YB2hoOthmXUcUuS1n8yyPcuhxLJzbsI+5T6jvdjkPKDq9Gc
         CnjcnUadk80Tq5nEOxJa92LxkQhJzIUcoZJLXmcDs5stnXGqezLzlBO/Ih/Xj5ARSggG
         6NUA==
X-Forwarded-Encrypted: i=1; AJvYcCU6jM3f56kMOigpl0aJoMsVj4BwHbOx5YhVde+wtBWSYBy5RkhCNnxfIMU9CGpY137BxlCZaeT9Y3CntAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGpsD8+opy4R/xnh++xws1oOPEjxOaaQmEjqA33VfAY8nq1eu9
	kXwem3TZNVdrs13yvHBpPWUagpqbEMoeHU/aAcshs/thgQrFD/7M2/0I8ITUQ0Q=
X-Gm-Gg: ASbGncvN4/P3Y0RU3qmAYfATDVV9PWUdngK/om3flWvV5eO/2pl8ygsL3CkflMOohcF
	cPjIawoTzfvgfBjsFprmbxnek3+zMah/7oTuy+H1pA6662U2GiUbn2xvzXhbtptpp7WvuSoziYp
	pfxZWPsT/ga/63mgf14YkLKJCDgf3gjB0awT6YyhqkKw/vuFD1FFxNx2Y6nhdy57RDDzzS/DuEc
	eegwiXSNZ2SIG8N/YsPcZwGoVLOisd1Wd5XbfWdBhgmLrLeXBJamJtXqCt3VaU3sl4qXUo9DbVN
	7OngfRoJ4CPCaASl
X-Google-Smtp-Source: AGHT+IH+7FONk/VJFEpkU60nbg63IQFPnZ85ky0jleZfgFgfCz78Hw77TLpcoEYvC1YKyflH95Q44w==
X-Received: by 2002:ac2:4a7a:0:b0:545:441:52d2 with SMTP id 2adb3069b0e04-5450441541fmr2265850e87.23.1739188646839;
        Mon, 10 Feb 2025 03:57:26 -0800 (PST)
Received: from localhost ([81.216.59.226])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-54410555884sm1228761e87.102.2025.02.10.03.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:57:26 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Tamir Duberstein <tamird@gmail.com>
Cc: David Gow <davidgow@google.com>,  Petr Mladek <pmladek@suse.com>,
  Steven Rostedt <rostedt@goodmis.org>,  Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,  Sergey Senozhatsky
 <senozhatsky@chromium.org>,  Andrew Morton <akpm@linux-foundation.org>,
  Shuah Khan <shuah@kernel.org>,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/2] printf: convert self-test to KUnit
In-Reply-To: <CAJ-ks9=0+fk22Dx-65a+CSYhy0dnjTJuot9PtgOCi5Th1_wARA@mail.gmail.com>
	(Tamir Duberstein's message of "Fri, 7 Feb 2025 06:27:57 -0500")
References: <20250204-printf-kunit-convert-v1-0-ecf1b846a4de@gmail.com>
	<CAKwiHFi6SUCT7UjUTdKmLJ8kiAEqVg=d6ND60R05MJB85Eoj9w@mail.gmail.com>
	<CAJ-ks9kLmArqqPati8n0dwzhjccLmTuTHtkaSyf_F_1QXzCoRw@mail.gmail.com>
	<87bjvers3u.fsf@prevas.dk>
	<CAJ-ks9=0+fk22Dx-65a+CSYhy0dnjTJuot9PtgOCi5Th1_wARA@mail.gmail.com>
Date: Mon, 10 Feb 2025 12:57:25 +0100
Message-ID: <87y0yeqafu.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07 2025, Tamir Duberstein <tamird@gmail.com> wrote:

> On Fri, Feb 7, 2025 at 5:01=E2=80=AFAM Rasmus Villemoes
> <linux@rasmusvillemoes.dk> wrote:
>>
>> On Thu, Feb 06 2025, Tamir Duberstein <tamird@gmail.com> wrote:
>>
>>
>> I'll have to see the actual code, of course. In general, I find reading
>> code using those KUNIT macros quite hard, because I'm not familiar with
>> those macros and when I try to look up what they do they turn out to be
>> defined in terms of other KUNIT macros 10 levels deep.
>>
>> But that still leaves a few points. First, I really like that "388 test
>> cases passed" tally or some other free-form summary (so that I can see
>> that I properly hooked up, compiled, and ran a new testcase inside
>> test_number(), so any kind of aggregation on those top-level test_* is
>> too coarse).
>
> This one I'm not sure how to address. What you're calling test cases
> here would typically be referred to as assertions, and I'm not aware
> of a way to report a count of assertions.
>

I'm not sure that's accurate.

The thing is, each of the current test() instances results in four
different tests being done, which is roughly why we end up at the 4*97
=3D=3D 388, but each of those tests has several assertions being done -
depending on which variant of the test we're doing (i.e. the buffer
length used or if we're passing it through kasprintf), we may do only
some of those assertions, and we do an early return in case one of those
assertions fail (because it wouldn't be safe to do the following
assertions, and the test as such has failed already). So there are far
more assertions than those 388.

OTOH, that the number reported is 388 is more a consequence of the
implementation than anything explicitly designed. I can certainly live
with 388 being replaced by 97, i.e. that each current test() invocation
would count as one KUNIT case, as that would still allow me to detect a
PEBKAC when I've added a new test() instance and failed to actually run
that.

>> The other thing I want to know is if this would make it harder for me to
>> finish up that "deterministic random testing" thing I wrote [*], but
>> never got around to actually get it upstream. It seems like something
>> that a framework like kunit could usefully provide out-of-the-box (which
>> is why I attempted to get it into kselftest), but as long as I'd still
>> be able to add in something like that, and get a "xxx failed, random
>> seed used was 0xabcdef" line printed, and run the test again setting the
>> seed explicitly to that 0xabcdef value, I'm good.
>>
>> [*] https://lore.kernel.org/lkml/20201025214842.5924-4-linux@rasmusville=
moes.dk/
>
> I can't speak for the framework, but it wouldn't be any harder to do
> in printf itself. I did it this way:
>
> +static struct rnd_state rnd_state;
> +static u64 seed;
> +
>  static int printf_suite_init(struct kunit_suite *suite)
>  {
>   alloced_buffer =3D kmalloc(BUF_SIZE + 2*PAD_SIZE, GFP_KERNEL);
>   if (!alloced_buffer)
>   return -1;
>   test_buffer =3D alloced_buffer + PAD_SIZE;
> +
> + seed =3D get_random_u64();
> + prandom_seed_state(&rnd_state, seed);
>   return 0;
>  }
>
>  static void printf_suite_exit(struct kunit_suite *suite)
>  {
>   kfree(alloced_buffer);
> + if (kunit_suite_has_succeeded(suite) =3D=3D KUNIT_FAILURE) {
> + pr_info("Seed: %llu\n", seed);
> + }
>  }
>
> and the result (once I made one of the cases fail):
>
> printf_kunit: Seed: 11480747578984087668
> # printf: pass:27 fail:1 skip:0 total:28
> # Totals: pass:27 fail:1 skip:0 total:28
> not ok 1 printf
>

OK, that's good. I think one of the problems previously was that there
no longer was such an _init/_exit pair one could hook into to do the
seed logic and afterwards do something depending on the success/fail of
the whole thing; that was all hidden away by some KUNIT_ wrapping.

Is it still possible to trivially make that seed into a module
parameter, and do the "modprobe test_printf seed=3D0xabcd", or otherwise
inject a module parameter when run/loaded via the kunit framework?

Rasmus
