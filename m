Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D321E1401C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 21:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749505892; cv=none; b=TvR3jOy6vFoOLV9DA9FKYh0RNtF6kHd5KbvTHV7h2KHJzI4wEM4CQVCf620nLHiJRts+2HBjTWwh6Wd4g5IBw9CzlI9/jknWAHSa5uqBmJJhWjQ9xhQBjeo6JffiOca6aKHg80DKgZ8g+0U7/j+WPJ5TFMzsauUCtlzM8CItWHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749505892; c=relaxed/simple;
	bh=1XejrdKzfG+S+dKLoMUktsIfTpGHbkAmCsku48IhsjE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dg5tCn8C1SrN8CSwlNdq33EOow9LmkWWx/7T9VbrgnSGGptVTeLFMVULUtjkUswZwciVCBm3V6BXaTzjnmc4yxvHD7BnulgOx6P1kvQOhew3PI0vj9JD4TfZ0ksLg84ef1ZhZSTqW5eCcOaVbkLxupjJBHMBN6YV+Dr5K5od5wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf13.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id EC7A712043D;
	Mon,  9 Jun 2025 21:51:24 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf13.hostedemail.com (Postfix) with ESMTPA id D856C2000D;
	Mon,  9 Jun 2025 21:51:22 +0000 (UTC)
Date: Mon, 9 Jun 2025 17:52:51 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Prakash Sangappa <prakash.sangappa@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "kprateek.nayak@amd.com"
 <kprateek.nayak@amd.com>, "vineethr@linux.ibm.com" <vineethr@linux.ibm.com>
Subject: Re: [PATCH V5 1/6] Sched: Scheduler time slice extension
Message-ID: <20250609175251.1fc90ca5@gandalf.local.home>
In-Reply-To: <20250609165532.3265e142@gandalf.local.home>
References: <20250603233654.1838967-1-prakash.sangappa@oracle.com>
	<20250603233654.1838967-2-prakash.sangappa@oracle.com>
	<20250604103106.1465f847@gandalf.local.home>
	<20250604145433.KCPMF8zm@linutronix.de>
	<80120491-7F90-4171-9FB8-9FE89B09F728@oracle.com>
	<20250604192327.sVjt6c4u@linutronix.de>
	<20250609165532.3265e142@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/4U9gXFqnKprDQBn=dzk5+MO"
X-Rspamd-Queue-Id: D856C2000D
X-Stat-Signature: 1q57xdt95r7sguupnawzesakmbfx4p4b
X-Rspamd-Server: rspamout05
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19dDbLr4Wpdafp3ubvrWL9m3iUhBDWHwcA=
X-HE-Tag: 1749505882-498941
X-HE-Meta: U2FsdGVkX19k9+wEgzLh+B0lgzCdTRA175NSqbtei7CDNSk8lJDMLp5bbXaQ4xukJbiZr1DuXQJ6UOLFxjAF+cDCvyxWKkftUsasKLQhE6JbN47/L96Z8cDzIXUuHIjApWWadJf2M0+GziNpg+9y7U2FWASvai8Jsx4eONUPL44NltUuqtuXj5t3iSWWuZRVoageDf2+jSCm+k/oigHZ7iBmuh0e7Ms66C66yfW7iG64MidJ0bVqguzEOtNVA3lNp2JN6wtAgdhV65VCKmzafkbcnuyCAFa/xukI17ZlFjKIH1nXZ0tL9w+zz9P9oGNglW8At7pw5BNyDNh5uNQ9eMS3VizB+OsVQ2QZOTjv7XPThC66Knh+fzIyuLp8aso/u5UpZlYhmMc=

--MP_/4U9gXFqnKprDQBn=dzk5+MO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, 9 Jun 2025 16:55:32 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> So I applied your patches and fixed up my "extend-sched.c" program to use
> your method. I booted on bare-metal PREEMPT_RT and ran:

In case anyone else wants to play, I'm attaching the source of extend-sched.c

I ran it with: sleep 5; ./extend-sched

Then switched over to cyclic test, counted to five and it was pretty
noticeable when it triggered.

To build, simply do:

  $ cd linux.git
  $ mkdir /tmp/extend
  $ cp tools/testing/selftests/rseq/rseq-abi.h /tmp/extend
  $ cd /tmp/extend

  [ download extend-sched.c here ]

  $ gcc extend-sched.c -o extend-sched


-- Steve

--MP_/4U9gXFqnKprDQBn=dzk5+MO
Content-Type: text/x-c++src
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=extend-sched.c


// Run with: GLIBC_TUNABLES=glibc.pthread.rseq=0 

#define _GNU_SOURCE
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <pthread.h>
#include <unistd.h>
#include <sys/time.h>

#ifdef ENABLE_TRACEFS
#include <tracefs.h>
#else
static inline void tracefs_printf(void *inst, const char *fmt, ...) { }
static inline void tracefs_print_init(void *inst) { }
#endif

#include <sys/rseq.h>
#include "rseq-abi.h"

static bool no_rseq;
static bool extend_wait;

/* In case we want to play with priorities */
static int busy_prio = 0;
static int lock_prio = 0;

static int loop_spin = 15000;

//#define barrier() asm volatile ("" ::: "memory")
#define rmb() asm volatile ("lfence" ::: "memory")
#define wmb() asm volatile ("sfence" ::: "memory")

#define NR_BUSY_THREADS 5

static pthread_barrier_t pbarrier;

static __thread struct rseq_abi *rseq_map;

static void init_extend_map(void)
{
	if (no_rseq)
		return;

	rseq_map = (void *)__builtin_thread_pointer() + __rseq_offset;
}

struct data;

struct thread_data {
	unsigned long long			x_count;
	unsigned long long			total;
	unsigned long long			max;
	unsigned long long			min;
	unsigned long long			total_wait;
	unsigned long long			max_wait;
	unsigned long long			min_wait;
	unsigned long long			contention;
	unsigned long long			extended;
	struct data				*data;
	int					cpu;
};

struct data {
	unsigned long long		x;
	unsigned long			lock;
	struct thread_data		*tdata;
	bool				done;
};

static inline unsigned long
cmpxchg(volatile unsigned long *ptr, unsigned long old, unsigned long new)
{
        unsigned long prev;

	asm volatile("lock; cmpxchg %b1,%2"
		     : "=a"(prev)
		     : "q"(new), "m"(*(ptr)), "0"(old)
		     : "memory");
        return prev;
}

static void extend(void)
{
	if (no_rseq)
		return;

	rseq_map->flags |= 1 << 3;
}

static int unextend(void)
{
	int flags;
	if (no_rseq)
		return 0;

	flags = rseq_map->flags;
	rseq_map->flags &= ~((1 << 3) | (1 << 4));
	if (!(flags & (1 << 4)))
		return 0;

	tracefs_printf(NULL, "Yield!\n");
	sched_yield();
		return 1;
}

#define sec2usec(sec) (sec * 1000000ULL)
#define usec2sec(usec) (usec / 1000000ULL)

static unsigned long long get_time(void)
{
	struct timeval tv;
	unsigned long long time;

	gettimeofday(&tv, NULL);

	time = sec2usec(tv.tv_sec);
	time += tv.tv_usec;

	return time;
}

static void do_sleep(unsigned usecs)
{
	struct timespec ts;

	ts.tv_sec = 0;
	ts.tv_nsec = usecs * 1000;
	nanosleep(&ts, NULL);
}

static void grab_lock(struct thread_data *tdata, struct data *data)
{
	unsigned long long start_wait, start, end, delta;
	unsigned long long end_wait;
	unsigned long prev;
	bool contention = false;

	start_wait = get_time();

	rmb();
	while (data->lock && !data->done) {
		contention = true;
		rmb();
	}

	tracefs_printf(NULL, "Grab lock\n");
	if (extend_wait)
		extend();
	do {
		if (!extend_wait)
			extend();
		start = get_time();
		prev = cmpxchg(&data->lock, 0, 1);
		if (prev) {
			contention = true;
			if (!extend_wait && unextend())
				tdata->extended++;
			while (data->lock && !data->done)
				rmb();
		}
	} while (prev && !data->done);

	if (contention)
		tdata->contention++;

	if (data->done)
		return;

	end_wait = get_time();

	tracefs_printf(NULL, "Have lock!\n");

	delta = end_wait - start_wait;
	if (!tdata->total_wait || tdata->max_wait < delta)
		tdata->max_wait = delta;
	if (!tdata->total_wait || tdata->min_wait > delta)
		tdata->min_wait = delta;
	tdata->total_wait += delta;

	data->x++;

	if (data->lock != 1) {
		printf("Failed locking\n");
		exit(-1);
	}

	/* Loop */
	for (int i = 0; i < loop_spin; i++)
		wmb();

	prev = cmpxchg(&data->lock, 1, 0);
	end = get_time();
	tracefs_printf(NULL, "released lock!\n");
	if (unextend())
		tdata->extended++;
	if (prev != 1) {
		printf("Failed unlocking\n");
		exit(-1);
	}

	delta = end - start;
	if (!tdata->total || tdata->max < delta) {
		tracefs_printf(NULL, "New max: %lld\n", delta);
		tdata->max = delta;
	}

	if (!tdata->total || tdata->min > delta)
		tdata->min = delta;

	tdata->total += delta;
	tdata->x_count++;
}

static void *busy_thread(void *d)
{
	struct data *data = d;
	int i;

	nice(busy_prio);

	while (!data->done) {
		for (i = 0; i < 100; i++)
			wmb();
		do_sleep(10);
		rmb();
	}
	return NULL;
}

static void *run_thread(void *d)
{
	struct thread_data *tdata = d;
	struct data *data = tdata->data;

	init_extend_map();

	nice(lock_prio);

	pthread_barrier_wait(&pbarrier);

	while (!data->done) {
		grab_lock(tdata, data);
		/* Make slighty different waits */
		/* 100us + cpu * 27us */
		do_sleep(100 + tdata->cpu * 27);
		rmb();
	}
	return NULL;
}

int main (int argc, char **argv)
{
	unsigned long long total_wait = 0;
	unsigned long long total_held = 0;
	unsigned long long total_contention = 0;
	unsigned long long total_extended = 0;
	unsigned long long max_wait = 0;
	unsigned long long max = 0;
	unsigned long long secs;
	unsigned long long avg_wait;
	unsigned long long avg_secs;
	unsigned long long avg_held;
	unsigned long long avg_held_secs;
	unsigned long long total_count = 0;
	bool verbose = false;
	pthread_t *threads;
	cpu_set_t *save_affinity;
	cpu_set_t *set_affinity;
	size_t cpu_size;
	struct data data;
	int cpus;
	int ch;
	int i;

	while ((ch = getopt(argc, argv, "dwv")) >= 0) {
		switch (ch) {
			case 'd':
				no_rseq = true;
				break;
			case 'w':
				extend_wait = true;
				break;
			case 'v':
				verbose = true;
				break;
			default:
				fprintf(stderr, "usage: extend-sched [-d|-w|-v]\n"
						"  -d: disable rseq\n"
						"  -w: extend while trying to get lock\n"
						"  -v: verbose output\n");
				exit(-1);
		}
	}
	memset(&data, 0, sizeof(data));

	cpus = sysconf(_SC_NPROCESSORS_CONF);

	cpu_size = CPU_ALLOC_SIZE(cpus);
	save_affinity = CPU_ALLOC(cpus);
	set_affinity = CPU_ALLOC(cpus);
	if (!save_affinity || !set_affinity) {
		perror("Allocating CPU sets");
		exit(-1);
	}
	if (sched_getaffinity(0, cpu_size, save_affinity) < 0) {
		perror("Getting affinity");
		exit(-1);
	}

	/* Create two threads for ever CPU. One grabbing the lock, and a busy task */
	threads = calloc(cpus * (NR_BUSY_THREADS + 1), sizeof(*threads));
	if (!threads) {
		perror("threads");
		exit(-1);
	}

	/* Allocate the data for the lock grabbers */
	data.tdata = calloc(cpus, sizeof(*data.tdata));
	if (!data.tdata) {
		perror("Allocating tdata");
		exit(-1);
	}

	tracefs_print_init(NULL);
	pthread_barrier_init(&pbarrier, NULL, cpus + 1);

	/* Save current affinity */
	for (i = 0; i < cpus; i++) {
		int ret;

		/* Set the affinity to this CPU as threads will inherit it */
		CPU_ZERO_S(cpu_size, set_affinity);
		CPU_SET_S(i, cpu_size, set_affinity);
		if (sched_setaffinity(0, cpu_size, set_affinity) < 0) {
			perror("Setting affinity");
			fprintf(stderr, " Setting cpu %d\n", i);
			exit(-1);
		}

		data.tdata[i].data = &data;
		data.tdata[i].cpu = i;

		ret = pthread_create(&threads[i], NULL, run_thread, &data.tdata[i]);
		if (ret < 0) {
			perror("creating lock threads");
			exit(-1);
		}

		for (int n = 1; n <= NR_BUSY_THREADS; n++) {
			ret = pthread_create(&threads[i + cpus * n], NULL, busy_thread, &data);
			if (ret < 0) {
				perror("creating busy threads");
				exit(-1);
			}
		}
	}

	if (sched_setaffinity(0, cpu_size, save_affinity) < 0) {
		perror("Setting saved affinity");
		exit(-1);
	}

	pthread_barrier_wait(&pbarrier);
	sleep(5);

	printf("Finish up\n");
	data.done = true;
	wmb();

	for (i = 0; i < cpus; i++) {
		for (int n = 1; n <= NR_BUSY_THREADS; n++)
			pthread_join(threads[i + cpus * n], NULL);
	}

	for (i = 0; i < cpus; i++) {
		pthread_join(threads[i], NULL);
		if (verbose) {
			printf("thread %i:\n", i);
			printf("   count:\t%lld\n", data.tdata[i].x_count);
			printf("   total:\t%lld\n", data.tdata[i].total);
			printf("     max:\t%lld\n", data.tdata[i].max);
			printf("     min:\t%lld\n", data.tdata[i].min);
			printf("   total wait:\t%lld\n", data.tdata[i].total_wait);
			printf("     max wait:\t%lld\n", data.tdata[i].max_wait);
			printf("     min wait:\t%lld\n", data.tdata[i].min_wait);
			printf("   contention:\t%lld\n", data.tdata[i].contention);
			printf("     extended:\t%lld\n", data.tdata[i].extended);
		}
		total_count += data.tdata[i].x_count;
		total_wait += data.tdata[i].total_wait;
		total_contention += data.tdata[i].contention;
		total_held += data.tdata[i].total;
		total_extended += data.tdata[i].extended;
		if (data.tdata[i].max_wait > max_wait)
			max_wait = data.tdata[i].max_wait;
		if (data.tdata[i].max > max)
			max = data.tdata[i].max;
	}

	secs = usec2sec(total_wait);
	avg_wait = total_count ? total_wait / total_count : 0;
	avg_secs = usec2sec(avg_wait);
	avg_held = total_count ? total_held / total_count : 0;
	avg_held_secs = usec2sec(avg_held);

	printf("Ran for %lld times\n", data.x);
	printf("Total wait time: %llu.%06llu  (avg: %llu.%06llu)\n", secs, total_wait - sec2usec(secs),
				avg_secs, avg_wait - sec2usec(avg_secs));
	printf("Total contetion: %lld\n", total_contention);
	printf("Total extended: %lld\n", total_extended);
	printf("      max wait: %lld\n", max_wait);
	printf("           max: %lld (avg: %llu.%06llu)\n", max, avg_held_secs, avg_held - sec2usec(avg_held_secs));
	return 0;
}

--MP_/4U9gXFqnKprDQBn=dzk5+MO--
