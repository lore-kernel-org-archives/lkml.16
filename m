Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7873A28BAAA
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 09:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749029301; cv=none; b=ZY7rCjW3PAdhloWYlduH0g4hjgn5ByfrrOP3tmExxfbRd7xIAVxmgv8cWXka4j1dzJeMmVgumSagB/df77F6UB6dEPY5Fyw2XC+dfk6lxN7Ya3u+D6SRU856wm1uwqq5NTBWcxEMk600xMeGxtIYXlDkWXyC4OdI78OGYYS5r8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749029301; c=relaxed/simple;
	bh=pMwa4OdpDdxtD2PPfR1t9O9JyCBu0XuEKVBEOTPK0hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tOzhY23hRQYn4OJiWhKGU+Ra5g71WNn+i0unYtO5vmMnnzh6iJk7mqgcEymgiDD31xgx8uB5DgYYq4BVQGSG0oqQiqSzumnhSVDy6KbgY6ez9OMUzZWeDSY9JA/KxHjt5/+FIO6pPPxow1X1Dnbq1U1nvgrdKEbE7nEppLkcXGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kXA9ozeK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=n0AedUES; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kXA9ozeK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="n0AedUES"
Date: Wed, 4 Jun 2025 11:28:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749029296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fr6kz7XKB4gl4naxOYMi5UqLlxfAkJW6m8GcgTkeie0=;
	b=kXA9ozeK1Zsxug4MB56t4F36cTdvEoUsGb5ddU6t7dNopwC7FZhLVrHbzaCbhUfGRO2mPE
	P8ipE2YIWxucKuTXlNJKzTxOks6qHvHHwNDk2W/INMJFk3M1yuvSitXwaBM1sd3HXMXNzX
	j/KGAygrqtLWjPGIdxFtzrRfSc/qAbnCvYnDFmCmdWI+4Pv0rDAjG6x7IxvMeYzBq/z+6a
	owfJYOhk2evA/N64TV7wh5x/AoD0p2+PqKnf1/14GMdjPxy2w1ePa4r29ZCn1onewkHPHy
	eRkEM/lhVQCr0KX7AxAYTLSqBzI826cZ2erlR5/7aNFl0REfy+m7q+CvnYbCxg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749029296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fr6kz7XKB4gl4naxOYMi5UqLlxfAkJW6m8GcgTkeie0=;
	b=n0AedUEScbOuWoXDmOI07ul6g+JKSYoN0oAIDk1XrQ5dQHXIptSInCueHDVJHLPkNfDOUO
	4zS6Wp3FGHYpVUBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Chris Mason <clm@meta.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: futex performance regression from "futex: Allow automatic
 allocation of process wide futex hash"
Message-ID: <20250604092815.UtG-oi0v@linutronix.de>
References: <3ad05298-351e-4d61-9972-ca45a0a50e33@meta.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3ad05298-351e-4d61-9972-ca45a0a50e33@meta.com>

On 2025-06-03 15:00:43 [-0400], Chris Mason wrote:
> Hi everyone,
Hi,

> While testing Peter's latest scheduler patches against current Linus
> git, I found a pretty big performance regression with schbench:
>=20
> https://github.com/masoncl/schbench
>=20
> The command line I was using:
>=20
> schbench -L -m 4 -M auto -t 256 -n 0 -r 60 -s 0
>=20
=E2=80=A6
> schbench uses one futex per thread, and the command line ends up
> allocating 1024 threads, so the default bucket size used by this commit
> is just too small.  Using 2048 buckets makes the problem go away.

There is also this pthread_mutex_t but yeah

> On my big turin system, this commit slows down RPS by 36%.  But even a
> VM on a skylake machine sees a 29% difference.
>=20
> schbench is a microbenchmark, so grain of salt on all of this, but I
> think our defaults are probably too low.

we could=20

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index abbd97c2fcba8..9046f3d9693e7 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -1687,7 +1687,7 @@ int futex_hash_allocate_default(void)
 	scoped_guard(rcu) {
 		threads =3D min_t(unsigned int,
 				get_nr_threads(current),
-				num_online_cpus());
+				num_online_cpus() * 2);
=20
 		fph =3D rcu_dereference(current->mm->futex_phash);
 		if (fph) {

which would increase it to 2048 as Chris asks for.
Then there the possibility of=20

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index abbd97c2fcba8..a19a96cc09c9e 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -1680,6 +1680,8 @@ int futex_hash_allocate_default(void)
 {
 	unsigned int threads, buckets, current_buckets =3D 0;
 	struct futex_private_hash *fph;
+	bool current_immutable =3D false;
+	unsigned int flags =3D 0;
=20
 	if (!current->mm)
 		return 0;
@@ -1695,6 +1697,7 @@ int futex_hash_allocate_default(void)
 				return 0;
=20
 			current_buckets =3D fph->hash_mask + 1;
+			current_immutable =3D fph->immutable;
 		}
 	}
=20
@@ -1705,10 +1708,13 @@ int futex_hash_allocate_default(void)
 	buckets =3D roundup_pow_of_two(4 * threads);
 	buckets =3D clamp(buckets, 16, futex_hashmask + 1);
=20
-	if (current_buckets >=3D buckets)
-		return 0;
+	if (current_buckets >=3D buckets) {
+		if (current_immutable)
+			return 0;
+		flags =3D FH_IMMUTABLE;
+	}
=20
-	return futex_hash_allocate(buckets, 0);
+	return futex_hash_allocate(buckets, flags);
 }
=20
 static int futex_hash_get_slots(void)

to make hash immutable once the upper limit has been reached. There will
be no more auto-resize. One could argue that if the user did not touch
it, he might not do it at all.

This would avoid the reference accounting. Some testing:

256 cores, 2xNUMA:
| average rps: 1 701 947.02 Futex HBs: 0 immutable: 1
| average rps:   785 446.07 Futex HBs: 1024 immutable: 0
| average rps: 1 586 755.62 Futex HBs: 1024 immutable: 1
| average rps:   736 769.77 Futex HBs: 2048 immutable: 0
| average rps: 1 555 182.52 Futex HBs: 2048 immutable: 1

144 cores, 4xNUMA:
| average rps: 2 691 912.55 Futex HBs: 0 immutable: 1
| average rps: 1 306 443.68 Futex HBs: 1024 immutable: 0
| average rps: 2 471 382.28 Futex HBs: 1024 immutable: 1
| average rps: 1 269 503.90 Futex HBs: 2048 immutable: 0
| average rps: 2 656 228.67 Futex HBs: 2048 immutable: 1

tested with this on top:

diff --git a/schbench.c b/schbench.c
index 1be3e280f5c38..40a5f0091111e 100644
--- a/schbench.c
+++ b/schbench.c
@@ -19,6 +19,8 @@
 #include <unistd.h>
 #include <errno.h>
 #include <getopt.h>
+#include <linux/prctl.h>
+#include <sys/prctl.h>
 #include <sys/time.h>
 #include <time.h>
 #include <string.h>
@@ -42,6 +44,9 @@
=20
 #define USEC_PER_SEC (1000000)
=20
+static int futex_size =3D -1;
+static int futex_flags;
+
 /* -m number of message threads */
 static int message_threads =3D 1;
 /* -t  number of workers per message thread */
@@ -127,7 +132,7 @@ enum {
 	HELP_LONG_OPT =3D 1,
 };
=20
-char *option_string =3D "p:m:M:W:t:Cr:R:w:i:z:A:n:F:Lj:s:J:";
+char *option_string =3D "p:m:M:W:t:Cr:R:w:i:z:A:n:F:Lj:s:J:H:I";
 static struct option long_options[] =3D {
 	{"pipe", required_argument, 0, 'p'},
 	{"message-threads", required_argument, 0, 'm'},
@@ -176,6 +181,29 @@ static void print_usage(void)
 	exit(1);
 }
=20
+#ifndef PR_FUTEX_HASH
+#define PR_FUTEX_HASH                   78
+# define PR_FUTEX_HASH_SET_SLOTS        1
+# define FH_FLAG_IMMUTABLE              (1ULL << 0)
+# define PR_FUTEX_HASH_GET_SLOTS        2
+# define PR_FUTEX_HASH_GET_IMMUTABLE    3
+#endif
+
+static int futex_hash_slots_set(unsigned int slots, int flags)
+{
+	return prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS, slots, flags);
+}
+
+static int futex_hash_slots_get(void)
+{
+	return prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_GET_SLOTS);
+}
+
+static int futex_hash_immutable_get(void)
+{
+	return prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_GET_IMMUTABLE);
+}
+
 /*
  * returns 0 if we fail to parse and 1 if we succeed
  */
@@ -347,6 +375,13 @@ static void parse_options(int ac, char **av)
 				exit(1);
 			}
 			break;
+		case 'H':
+			futex_size =3D atoi(optarg);
+			break;
+		case 'I':
+			futex_flags =3D FH_FLAG_IMMUTABLE;
+			break;
+
 		case '?':
 		case HELP_LONG_OPT:
 			print_usage();
@@ -1811,6 +1846,9 @@ int main(int ac, char **av)
 		}
 	}
=20
+	if (futex_size >=3D 0)
+		futex_hash_slots_set(futex_size, futex_flags);
+
 	requests_per_sec /=3D message_threads;
 	loops_per_sec =3D 0;
 	stopping =3D 0;
@@ -1920,6 +1958,8 @@ int main(int ac, char **av)
 	}
 	free(message_threads_mem);
=20
+	fprintf(stderr, "Futex HBs: %d immutable: %d\n", futex_hash_slots_get(),
+		futex_hash_immutable_get());
=20
 	return 0;
 }


Comments?

> -chris

Sebastian
