Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307591C5D77
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750282645; cv=none; b=BqiUXhmbpB3tuzsMKISmMPG11bEduEdvO6BbBQvQX6z+t0tB365gx77kPE3RrpfnZYNNsXgJaVaqNRxFoL12iqkjU0JudaODQUpGVRVJQ/+TcyRcp6Sxnkt1Jll12Vx9pB2O5cmpOyVvPnyAGaxo5naRbGJ+TWrvog60vQPLXYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750282645; c=relaxed/simple;
	bh=0nLykyHDo/NBCRKGGbQVzK74nliv3FeNynAPfHJ83DE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h3K7L4l2blpyg2GHVXMkYUoNApft1lvC48PAd8K5RrjcPkOSv8TBDbjJ6SWML1leHQ2cUnKGUerB1O/68Mpg52iGQ3tjCYn37PiHenDQG9zzt6U0PkTqHyYj2I744cmBfZhnMWt2kpnYXYm9FxmMbwU8FYBlNv6B1KDsyIZgIQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v8WfwrRf; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v8WfwrRf"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6faf66905baso1204606d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750282642; x=1750887442; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDFiH5/OdaF1aK29qzbe1l3iMYenx07WJsTXhV4HLSk=;
        b=v8WfwrRfWa9A2FMRJawZQB1TKo7mDbUW+oTM30gxbkj7iHDn42A0CpKO8TFGu9LOmB
         Ur+JzEgip6d6G89FURnaieab0v4wVLpkuFGmd0H7zd/r43sZwjrav6Pi+uRcVz/0q3ok
         lrr7GBcy8X2q3ai/IdYdjZoNuAxbQXV92y8zCamsXA0ImB8s6H/l20DIJ/MMWgXkL0el
         68l1tSsl5emtnMLQ5Gg/T7TeX8ujhmyQelNv5oJJFLbAMcOnjAtBgYgH12GTNNLcuGm6
         Qq+Pie2Huh711DRzP8l5PiKi2JFiWUFPJEf3yOPlnO98DupdW2pEktBPmUoIqYp5S7aw
         b7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750282642; x=1750887442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aDFiH5/OdaF1aK29qzbe1l3iMYenx07WJsTXhV4HLSk=;
        b=UuFFp1s2loJSpN92hxbwiKHJrZ415P8HFQSOYEUOli/gHETf1agyUrcNy9f/Ej2GKU
         QO5CVz3VeB+YGEGz15a3dYTad6X7aBX2c+8RxV6WuGuQBfFv19AnE59tgDsf5FNrHDZh
         qpL5h3m4BpNYNpdcvqeRB33TVTxZsqtHPZ2Qwh0m7/9oa/eruDkvEO6OoaPFhzp6LCbH
         ThLn6SszpLkMzf3fiPN/XIyQNmq8UzsWbPPWJvX2vqvR1bHfSjsycquEiWLCftQue4wa
         4aFXYOxXs/KwClQmZ2yPGxe7/w40N7Tm1ZUYToU3DSn6ygJFv+VoQubk3HCrW6ctL/m+
         RMqg==
X-Forwarded-Encrypted: i=1; AJvYcCUQSA79iNujjgdwQW+PIcakdlFnwwLyxMp2oE376gGzzQoIOZf+MZOvi1R0SQQYuk0Mfjl1fV4OQqBTqG4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwz7XHkKrwnVUFYb6I67MoU577tRZp8KKwTSgCDiIqH8gVNy2b
	gB+TUD8pJc0XW7l2At9JJk8k5y9g139DvHnUj3xj92jLHKlQk2n8vpddDBaCkb3i7wvtvsKWmWG
	gsBDbmJ9M1Mpqnt8J0XT06s5QAIisjQ+FkNGWELPO
X-Gm-Gg: ASbGncvLwCyOYik8kxUDmR7l28AIohcsGm2DTYUhoQx0YsTqqIEKfK/AHdbPezoB8lS
	UGLHCpJRriMGQMw5Gi62CGEHg8/z5KfJrp1hZD+0RswU3Q6rBqufUv+fjeHR5SYDg14rIhGs8Vm
	8e5OD/7KlRGDwcTeNfpbSxtSUVvxRaqXl6Uf4BI6aeSH4+QUabsY2ke5PZVeqYGIbp6M5G3Ao3q
	bKMHQ==
X-Google-Smtp-Source: AGHT+IGyQSJ77NjTIHE0Lgcr7KrLnBinFUFSIry4sdxCFtapI99bicl+Nhh5AFyBeRKWvZHdcrTU2QJ/OI7mwnPR90Y=
X-Received: by 2002:a05:6214:801b:b0:6fd:24:b0e0 with SMTP id
 6a1803df08f44-6fd0024bc7cmr11142986d6.6.1750282641978; Wed, 18 Jun 2025
 14:37:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250614084711.2654593-2-davidgow@google.com>
In-Reply-To: <20250614084711.2654593-2-davidgow@google.com>
From: Rae Moar <rmoar@google.com>
Date: Wed, 18 Jun 2025 17:37:11 -0400
X-Gm-Features: Ac12FXxkP4U3QWw_2wzpFcCR3dXdcXADRNCVhYwL4ozoUK7UvCXSr2sbP-sew9A
Message-ID: <CA+GJov7j6hxp=FfupAwZZDGCXE2j3L_87D2MOCK8po5QCW83uw@mail.gmail.com>
Subject: Re: [PATCH] kunit: Adjust kunit_test timeout based on
 test_{suite,case} speed
To: David Gow <davidgow@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Ujwal Jain <ujwaljain@google.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 14, 2025 at 4:47=E2=80=AFAM David Gow <davidgow@google.com> wro=
te:
>
> From: Ujwal Jain <ujwaljain@google.com>
>
> Currently, the in-kernel kunit test case timeout is 300 seconds. (There
> is a separate timeout mechanism for the whole test execution in
> kunit.py, but that's unrelated.) However, tests marked 'slow' or 'very
> slow' may timeout, particularly on slower machines.
>
> Implement a multiplier to the test-case timeout, so that slower tests
> have longer to complete:
> - DEFAULT -> 1x default timeout
> - KUNIT_SPEED_SLOW -> 3x default timeout
> - KUNIT_SPEED_VERY_SLOW -> 12x default timeout

Hello!

This change is looking great to me. No major concerns with the code
and the tests are all passing.

Just a few thoughts: I am wondering where the multipliers of 3 and 12
came from? Are there specific tests that need those timeout amounts?
And then given this changes the behavior of tests marked as slow and
very_slow, we should update the documentation. And if possible, we
should also add tests to check this feature.

Otherwise, this looks good to me!

Thanks!
-Rae

Reviewed-by: Rae Moar <rmoar@google.com>

>
> A further change is planned to allow user configuration of the
> default/base timeout to allow people with faster or slower machines to
> adjust these to their use-cases.
>
> Signed-off-by: Ujwal Jain <ujwaljain@google.com>
> Co-developed-by: David Gow <davidgow@google.com>
> Signed-off-by: David Gow <davidgow@google.com>
> ---
>  include/kunit/try-catch.h  |  1 +
>  lib/kunit/kunit-test.c     |  9 +++++---
>  lib/kunit/test.c           | 46 ++++++++++++++++++++++++++++++++++++--
>  lib/kunit/try-catch-impl.h |  4 +++-
>  lib/kunit/try-catch.c      | 29 ++----------------------
>  5 files changed, 56 insertions(+), 33 deletions(-)
>
> diff --git a/include/kunit/try-catch.h b/include/kunit/try-catch.h
> index 7c966a1adbd3..d4e1a5b98ed6 100644
> --- a/include/kunit/try-catch.h
> +++ b/include/kunit/try-catch.h
> @@ -47,6 +47,7 @@ struct kunit_try_catch {
>         int try_result;
>         kunit_try_catch_func_t try;
>         kunit_try_catch_func_t catch;
> +       unsigned long timeout;
>         void *context;
>  };
>
> diff --git a/lib/kunit/kunit-test.c b/lib/kunit/kunit-test.c
> index d9c781c859fd..387cdf7782f6 100644
> --- a/lib/kunit/kunit-test.c
> +++ b/lib/kunit/kunit-test.c
> @@ -43,7 +43,8 @@ static void kunit_test_try_catch_successful_try_no_catc=
h(struct kunit *test)
>         kunit_try_catch_init(try_catch,
>                              test,
>                              kunit_test_successful_try,
> -                            kunit_test_no_catch);
> +                            kunit_test_no_catch,
> +                            300 * msecs_to_jiffies(MSEC_PER_SEC));
>         kunit_try_catch_run(try_catch, test);
>
>         KUNIT_EXPECT_TRUE(test, ctx->function_called);
> @@ -75,7 +76,8 @@ static void kunit_test_try_catch_unsuccessful_try_does_=
catch(struct kunit *test)
>         kunit_try_catch_init(try_catch,
>                              test,
>                              kunit_test_unsuccessful_try,
> -                            kunit_test_catch);
> +                            kunit_test_catch,
> +                            300 * msecs_to_jiffies(MSEC_PER_SEC));
>         kunit_try_catch_run(try_catch, test);
>
>         KUNIT_EXPECT_TRUE(test, ctx->function_called);
> @@ -129,7 +131,8 @@ static void kunit_test_fault_null_dereference(struct =
kunit *test)
>         kunit_try_catch_init(try_catch,
>                              test,
>                              kunit_test_null_dereference,
> -                            kunit_test_catch);
> +                            kunit_test_catch,
> +                            300 * msecs_to_jiffies(MSEC_PER_SEC));
>         kunit_try_catch_run(try_catch, test);
>
>         KUNIT_EXPECT_EQ(test, try_catch->try_result, -EINTR);
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index 146d1b48a096..002121675605 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -373,6 +373,46 @@ static void kunit_run_case_check_speed(struct kunit =
*test,
>                    duration.tv_sec, duration.tv_nsec);
>  }
>
> +/* Returns timeout multiplier based on speed.
> + * DEFAULT:                1
> + * KUNIT_SPEED_SLOW:        3
> + * KUNIT_SPEED_VERY_SLOW:   12
> + */
> +static int kunit_timeout_mult(enum kunit_speed speed)
> +{
> +       switch (speed) {
> +       case KUNIT_SPEED_SLOW:
> +               return 3;
> +       case KUNIT_SPEED_VERY_SLOW:
> +               return 12;
> +       default:
> +               return 1;
> +       }
> +}
> +
> +static unsigned long kunit_test_timeout(struct kunit_suite *suite, struc=
t kunit_case *test_case)
> +{
> +       int mult =3D 1;
> +       /*
> +        * TODO: Make the default (base) timeout configurable, so that us=
ers with
> +        * particularly slow or fast machines can successfully run tests,=
 while
> +        * still taking advantage of the relative speed.
> +        */
> +       unsigned long default_timeout =3D 300;
> +
> +       /*
> +        * The default test timeout is 300 seconds and will be adjusted b=
y mult
> +        * based on the test speed. The test speed will be overridden by =
the
> +        * innermost test component.
> +        */
> +       if (suite->attr.speed !=3D KUNIT_SPEED_UNSET)
> +               mult =3D kunit_timeout_mult(suite->attr.speed);
> +       if (test_case->attr.speed !=3D KUNIT_SPEED_UNSET)
> +               mult =3D kunit_timeout_mult(test_case->attr.speed);
> +       return mult * default_timeout * msecs_to_jiffies(MSEC_PER_SEC);
> +}
> +
> +
>  /*
>   * Initializes and runs test case. Does not clean up or do post validati=
ons.
>   */
> @@ -527,7 +567,8 @@ static void kunit_run_case_catch_errors(struct kunit_=
suite *suite,
>         kunit_try_catch_init(try_catch,
>                              test,
>                              kunit_try_run_case,
> -                            kunit_catch_run_case);
> +                            kunit_catch_run_case,
> +                            kunit_test_timeout(suite, test_case));
>         context.test =3D test;
>         context.suite =3D suite;
>         context.test_case =3D test_case;
> @@ -537,7 +578,8 @@ static void kunit_run_case_catch_errors(struct kunit_=
suite *suite,
>         kunit_try_catch_init(try_catch,
>                              test,
>                              kunit_try_run_case_cleanup,
> -                            kunit_catch_run_case_cleanup);
> +                            kunit_catch_run_case_cleanup,
> +                            kunit_test_timeout(suite, test_case));
>         kunit_try_catch_run(try_catch, &context);
>
>         /* Propagate the parameter result to the test case. */
> diff --git a/lib/kunit/try-catch-impl.h b/lib/kunit/try-catch-impl.h
> index 203ba6a5e740..6f401b97cd0b 100644
> --- a/lib/kunit/try-catch-impl.h
> +++ b/lib/kunit/try-catch-impl.h
> @@ -17,11 +17,13 @@ struct kunit;
>  static inline void kunit_try_catch_init(struct kunit_try_catch *try_catc=
h,
>                                         struct kunit *test,
>                                         kunit_try_catch_func_t try,
> -                                       kunit_try_catch_func_t catch)
> +                                       kunit_try_catch_func_t catch,
> +                                       unsigned long timeout)
>  {
>         try_catch->test =3D test;
>         try_catch->try =3D try;
>         try_catch->catch =3D catch;
> +       try_catch->timeout =3D timeout;
>  }
>
>  #endif /* _KUNIT_TRY_CATCH_IMPL_H */
> diff --git a/lib/kunit/try-catch.c b/lib/kunit/try-catch.c
> index 6bbe0025b079..d84a879f0a78 100644
> --- a/lib/kunit/try-catch.c
> +++ b/lib/kunit/try-catch.c
> @@ -34,31 +34,6 @@ static int kunit_generic_run_threadfn_adapter(void *da=
ta)
>         return 0;
>  }
>
> -static unsigned long kunit_test_timeout(void)
> -{
> -       /*
> -        * TODO(brendanhiggins@google.com): We should probably have some =
type of
> -        * variable timeout here. The only question is what that timeout =
value
> -        * should be.
> -        *
> -        * The intention has always been, at some point, to be able to la=
bel
> -        * tests with some type of size bucket (unit/small, integration/m=
edium,
> -        * large/system/end-to-end, etc), where each size bucket would ge=
t a
> -        * default timeout value kind of like what Bazel does:
> -        * https://docs.bazel.build/versions/master/be/common-definitions=
.html#test.size
> -        * There is still some debate to be had on exactly how we do this=
. (For
> -        * one, we probably want to have some sort of test runner level
> -        * timeout.)
> -        *
> -        * For more background on this topic, see:
> -        * https://mike-bland.com/2011/11/01/small-medium-large.html
> -        *
> -        * If tests timeout due to exceeding sysctl_hung_task_timeout_sec=
s,
> -        * the task will be killed and an oops generated.
> -        */
> -       return 300 * msecs_to_jiffies(MSEC_PER_SEC); /* 5 min */
> -}
> -
>  void kunit_try_catch_run(struct kunit_try_catch *try_catch, void *contex=
t)
>  {
>         struct kunit *test =3D try_catch->test;
> @@ -85,8 +60,8 @@ void kunit_try_catch_run(struct kunit_try_catch *try_ca=
tch, void *context)
>         task_done =3D task_struct->vfork_done;
>         wake_up_process(task_struct);
>
> -       time_remaining =3D wait_for_completion_timeout(task_done,
> -                                                    kunit_test_timeout()=
);
> +       time_remaining =3D wait_for_completion_timeout(
> +               task_done, try_catch->timeout);
>         if (time_remaining =3D=3D 0) {
>                 try_catch->try_result =3D -ETIMEDOUT;
>                 kthread_stop(task_struct);
> --
> 2.50.0.rc1.591.g9c95f17f64-goog
>
