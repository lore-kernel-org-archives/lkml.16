Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DD1244695
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745362572; cv=none; b=akBWNvFzHlkcUHkQaR9BckK5gnRJrnrWeYZeyEwXfJoo2BPk3XyxgvpCrqPyfD/3s1HEf/oIejxyGrl3ViW2MkJ/fQqVXy1YCjnU1+Kf9BUFvkhUC5/d4i6rG4panqXoAROYw8xF6uW7UMYRc9Hd0+Z4f841U9u4/KOOFpjJZeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745362572; c=relaxed/simple;
	bh=L2v5eldaI7ubSBd7uPHVJIuI1E3z+Zv3JX7EoYd9LWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/gFYxEiITeWp5Yrahi2u8MEX0TXGtB5C20wcefe5yetRhiQ3hnTcKcTxCnWGmj0iZmiNYxCK+4xdbmUL6s8uSLJTVEJSAUq2Bimr64vqn4WU4pJVkofVC+KKTHpzXjjf1tzSN/m1PBVtFMTko0H9zVcedaClwENdrNXR9Ia+t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OXF/TgIn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXF/TgIn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231FBC4CEE9;
	Tue, 22 Apr 2025 22:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745362572;
	bh=L2v5eldaI7ubSBd7uPHVJIuI1E3z+Zv3JX7EoYd9LWk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=OXF/TgInP9qs4HVOxlJNAoA5zpnPjhiSmE8wntlOU0BTGubZre8WQyXUc/Y7uayvl
	 Zz+8Iqa1KyuNtPCcCct8GLjMxPUIRTj9u2RHiyBDExsCXtkNFnCxMyaVpexSTLm20I
	 Fwk+NuLt3OwzQu7lJFDJHW5n8OjbHs7xYTQl6YzCkcpYZMiBoVqlFj/crMWjMLK6rP
	 5ZG5/1agVBe23I2j5PlzNO0ed/9SWHLJpW4V/BeBfNkSt3qYNVWBUNGbTfZ726RgCw
	 6BFeonZy0SAPrnXDqqxn+EInDDNfuzIVGtceBrs8IomCJh9nRTjwWLa5fQTyzA3zHq
	 FAaoeouaKORBw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id C538ACE0875; Tue, 22 Apr 2025 15:56:11 -0700 (PDT)
Date: Tue, 22 Apr 2025 15:56:11 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Petr Mladek <pmladek@suse.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>
Subject: Re: [PATCH v2 ratelimit 01/14] lib: Add trivial kunit test for
 ratelimit
Message-ID: <4b6df025-bb53-4537-b5ed-7191b20370f5@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
 <20250418171359.1187719-1-paulmck@kernel.org>
 <aAerQXIz8Aebqm8c@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAerQXIz8Aebqm8c@pathway.suse.cz>

On Tue, Apr 22, 2025 at 04:44:17PM +0200, Petr Mladek wrote:
> Hi,
> 
> I have been recently involved in a conversion of printf/scanf
> selftests to KUnit. And I seem that there are some naming
> conventions. Adding Kees into Cc.

Thank you for the review and feedback!  Updated patch is
at the end of this email.

						Thanx, Paul

> On Fri 2025-04-18 10:13:46, Paul E. McKenney wrote:
> > Add a simple single-threaded smoke test for lib/ratelimit.c
> > 
> > To run on x86:
> > 
> > 	make ARCH=x86_64 mrproper
> > 	./tools/testing/kunit/kunit.py run --arch x86_64 --kconfig_add CONFIG_TEST_RATELIMIT=y --kconfig_add CONFIG_SMP=y lib_ratelimit
> > 
> > [ paulmck:  Apply timeout feedback from Petr Mladek. ]
> > 
> > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
> > Cc: Mateusz Guzik <mjguzik@gmail.com>
> > Cc: Petr Mladek <pmladek@suse.com>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> > Cc: John Ogness <john.ogness@linutronix.de>
> > Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
> > Cc: Jon Pan-Doh <pandoh@google.com>
> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: Karolina Stolarek <karolina.stolarek@oracle.com>
> > ---
> >  lib/Kconfig.debug    | 11 ++++++
> >  lib/Makefile         |  1 +
> >  lib/test_ratelimit.c | 79 ++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 91 insertions(+)
> >  create mode 100644 lib/test_ratelimit.c
> > 
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 9fe4d8dfe5782..581d6a8489670 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -3232,6 +3232,17 @@ config TEST_OBJPOOL
> >  
> >  	  If unsure, say N.
> >  
> > +config TEST_RATELIMIT
> 
> Most KUnit tests seems to follow the pattern <ITEM>_KUNIT_TEST.
> You might want to use:
> 
> config RATELIMIT_KUNIT_TEST
> 
> > +	tristate "Test module for correctness and stress of ratelimit" if !KUNIT_ALL_TESTS
> 
> 	tristate "KUnit Test for correctness and stress of ratelimit" if !KUNIT_ALL_TESTS
> 
> > +	depends on KUNIT
> > +	default KUNIT_ALL_TESTS
> > +	help
> > +	  This builds the "test_ratelimit" module that should be used
> > +	  for correctness verification and concurrent testings of rate
> > +	  limiting.
> > +
> > +	  If unsure, say N.
> > +
> >  config INT_POW_KUNIT_TEST
> >  	tristate "Integer exponentiation (int_pow) test" if !KUNIT_ALL_TESTS
> >  	depends on KUNIT
> > --- /dev/null
> > +++ b/lib/test_ratelimit.c
> 
> The commit db6fe4d61ece241 ("lib: Move KUnit tests into tests/ subdirectory")
> moved many kunit test modules to lib/tests.
> 
> Also they renamed the printf/scanf test modules to <item>_kunit.c,
> so this probably should be:
> 
>  lib/tests/ratelimit_kunit.c
> 
> > @@ -0,0 +1,79 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#include <kunit/test.h>
> > +
> > +#include <linux/ratelimit.h>
> > +#include <linux/module.h>
> > +
> > +/* a simple boot-time regression test */
> > +
> > +#define TESTRL_INTERVAL (5 * HZ)
> > +static DEFINE_RATELIMIT_STATE(testrl, TESTRL_INTERVAL, 3);
> > +
> > +#define test_ratelimited(test, expected) \
> > +	KUNIT_ASSERT_EQ(test, ___ratelimit(&testrl, "test_ratelimit_smoke"), (expected));
> > +
> > +static void test_ratelimit_smoke(struct kunit *test)
> > +{
> > +	// Check settings.
> > +	KUNIT_ASSERT_GE(test, TESTRL_INTERVAL, 100);
> > +
> > +	// Test normal operation.
> > +	test_ratelimited(test, true);
> > +	test_ratelimited(test, true);
> > +	test_ratelimited(test, true);
> > +	test_ratelimited(test, false);
> > +
> > +	schedule_timeout_idle(TESTRL_INTERVAL - 40);
> > +	test_ratelimited(test, false);
> > +
> > +	schedule_timeout_idle(50);
> > +	test_ratelimited(test, true);
> > +
> > +	schedule_timeout_idle(2 * TESTRL_INTERVAL);
> > +	test_ratelimited(test, true);
> > +	test_ratelimited(test, true);
> > +
> > +	schedule_timeout_idle(TESTRL_INTERVAL - 40);
> > +	test_ratelimited(test, true);
> > +	schedule_timeout_idle(50);
> > +	test_ratelimited(test, true);
> > +	test_ratelimited(test, true);
> > +	test_ratelimited(test, true);
> > +	test_ratelimited(test, false);
> > +
> > +	// Test disabling.
> > +	testrl.burst = 0;
> > +	test_ratelimited(test, false);
> > +	testrl.burst = 2;
> > +	testrl.interval = 0;
> > +	test_ratelimited(test, true);
> > +	test_ratelimited(test, true);
> > +	test_ratelimited(test, true);
> > +	test_ratelimited(test, true);
> > +	test_ratelimited(test, true);
> > +	test_ratelimited(test, true);
> > +	test_ratelimited(test, true);
> > +
> > +	// Testing re-enabling.
> 
> BTW: I had to add the following sleep to make sure that the next call
>      was past the interval. Otherwise, the test failed.
> 
> 	schedule_timeout_idle(TESTRL_INTERVAL);
> 
> That said, this was needed when testing the original ___ratelimit()
> implementation. It is not needed with the entire patchset applied.
> I guess that it was solved by the 11th patch "[PATCH 11/14] ratelimit:
> Force re-initialization when rate-limiting re-enabled".

Yes, the intent is that the series fixes this test failure.

> > +	testrl.interval = TESTRL_INTERVAL;
> > +	test_ratelimited(test, true);
> > +	test_ratelimited(test, true);
> > +	test_ratelimited(test, false);
> > +	test_ratelimited(test, false);
> > +}
> > +
> > +static struct kunit_case sort_test_cases[] = {
> > +	KUNIT_CASE(test_ratelimit_smoke),
> 
> The test printed:
> 
> [   75.479585]     # test_ratelimit_smoke: Test should be marked slow (runtime: 25.326793644s)
> 
> The warning has gone when using:
> 
> 	KUNIT_CASE_SLOW(test_ratelimit_smoke),
> 
> > +	{}
> > +};
> > +
> > +static struct kunit_suite ratelimit_test_suite = {
> > +	.name = "lib_ratelimit",
> > +	.test_cases = sort_test_cases,
> > +};

------------------------------------------------------------------------

lib: Add trivial kunit test for ratelimit

Add a simple single-threaded smoke test for lib/ratelimit.c

To run on x86:

        make ARCH=x86_64 mrproper
        ./tools/testing/kunit/kunit.py run --arch x86_64 --kconfig_add CONFIG_RATELIMIT_KUNIT_TEST=y --kconfig_add CONFIG_SMP=y lib_ratelimit

This will fail on old ___ratelimit(), and subsequent patches provide
the fixes that are required.

[ paulmck:  Apply timeout and kunit feedback from Petr Mladek. ]

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Jon Pan-Doh <pandoh@google.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Karolina Stolarek <karolina.stolarek@oracle.com>

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 9fe4d8dfe5782..c239099218c2b 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3232,6 +3232,17 @@ config TEST_OBJPOOL
 
 	  If unsure, say N.
 
+config RATELIMIT_KUNIT_TEST
+	tristate "KUnit Test for correctness and stress of ratelimit" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This builds the "test_ratelimit" module that should be used
+	  for correctness verification and concurrent testings of rate
+	  limiting.
+
+	  If unsure, say N.
+
 config INT_POW_KUNIT_TEST
 	tristate "Integer exponentiation (int_pow) test" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/lib/tests/Makefile b/lib/tests/Makefile
index 5a4794c1826e7..1c7c2d20fe501 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -45,5 +45,6 @@ obj-$(CONFIG_STRING_KUNIT_TEST) += string_kunit.o
 obj-$(CONFIG_STRING_HELPERS_KUNIT_TEST) += string_helpers_kunit.o
 obj-$(CONFIG_USERCOPY_KUNIT_TEST) += usercopy_kunit.o
 obj-$(CONFIG_UTIL_MACROS_KUNIT) += util_macros_kunit.o
+obj-$(CONFIG_RATELIMIT_KUNIT_TEST) += test_ratelimit.o
 
 obj-$(CONFIG_TEST_RUNTIME_MODULE)		+= module/
diff --git a/lib/tests/test_ratelimit.c b/lib/tests/test_ratelimit.c
new file mode 100644
index 0000000000000..0374107f5ea89
--- /dev/null
+++ b/lib/tests/test_ratelimit.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <kunit/test.h>
+
+#include <linux/ratelimit.h>
+#include <linux/module.h>
+
+/* a simple boot-time regression test */
+
+#define TESTRL_INTERVAL (5 * HZ)
+static DEFINE_RATELIMIT_STATE(testrl, TESTRL_INTERVAL, 3);
+
+#define test_ratelimited(test, expected) \
+	KUNIT_ASSERT_EQ(test, ___ratelimit(&testrl, "test_ratelimit_smoke"), (expected))
+
+static void test_ratelimit_smoke(struct kunit *test)
+{
+	// Check settings.
+	KUNIT_ASSERT_GE(test, TESTRL_INTERVAL, 100);
+
+	// Test normal operation.
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, false);
+
+	schedule_timeout_idle(TESTRL_INTERVAL - 40);
+	test_ratelimited(test, false);
+
+	schedule_timeout_idle(50);
+	test_ratelimited(test, true);
+
+	schedule_timeout_idle(2 * TESTRL_INTERVAL);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+
+	schedule_timeout_idle(TESTRL_INTERVAL - 40);
+	test_ratelimited(test, true);
+	schedule_timeout_idle(50);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, false);
+
+	// Test disabling.
+	testrl.burst = 0;
+	test_ratelimited(test, false);
+	testrl.burst = 2;
+	testrl.interval = 0;
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+
+	// Testing re-enabling.
+	testrl.interval = TESTRL_INTERVAL;
+	test_ratelimited(test, true);
+	test_ratelimited(test, true);
+	test_ratelimited(test, false);
+	test_ratelimited(test, false);
+}
+
+static struct kunit_case sort_test_cases[] = {
+	KUNIT_CASE_SLOW(test_ratelimit_smoke),
+	{}
+};
+
+static struct kunit_suite ratelimit_test_suite = {
+	.name = "lib_ratelimit",
+	.test_cases = sort_test_cases,
+};
+
+kunit_test_suites(&ratelimit_test_suite);
+
+MODULE_DESCRIPTION("___ratelimit() KUnit test suite");
+MODULE_LICENSE("GPL");
