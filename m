Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41A34A28
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 22:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748472908; cv=none; b=Ivf8eMelDZhVRji6PwBIBJEiUbwzTouz1Xy64iF3QMWqzVqD/3sd86ixnOxlRtaKnip0wfLRVTxCtX+sjxlEn4ByMuB2bg2lY3LMIzGF0mFoyblPyg+7mky1WYRR4af2/Q7Wdixtk/F5gaw+0vhHK/R8kZJQZeWoRu/QTCGsql0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748472908; c=relaxed/simple;
	bh=x3KbN76dwRtEOLE9p4Tew6nTNR4f2t9O3il/q0LmBcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lw3fmRRfOpZoTiCo0QmdRe6uQuVRIseAANfoOZIuGS/o0nz0T9LLN9Xp4FKWeOYoS38Zss+Ca2nnSri4yCHRlDNbs+9VT4738zSyc5Nqt51EY/YZvWITtglnhGiz98Fh6NCSMvVQk+MUR+V9snOCdzzWGzsUqu59caelSle9R44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DC16C4CEE3;
	Wed, 28 May 2025 22:55:07 +0000 (UTC)
Date: Wed, 28 May 2025 18:56:08 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Costa Shulyupin
 <costa.shul@redhat.com>, Tiezhu Yang <yangtiezhu@loongson.cn>, Tomas Glozar
 <tglozar@redhat.com>, John Kacur <jkacur@redhat.com>
Subject: [GIT PULL] tracing/tools: Updates for v6.16
Message-ID: <20250528185608.1e195e94@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Linus,

tracing tools updates for v6.16:

- Set distinctive value for failed tests

  When running "make check" that performs tests on rtla the failure is
  checked by examining the output. Instead have the tool return an error
  status if it exceeds the threadhold.

- Define __NR_sched_setattr for LoongArch

  Define __NR_sched_setattr to allow this to build for LoongArch.

- Define _GNU_SOURCE for timerlat_bpf.c

  Due to modifications of struct sched_attr in utils.h when _GNU_SOURCE is
  not defined, this can cause errors for timerlat_bpf_init() and breakage in
  BPF sample collection mode.


Please pull the latest trace-tools-v6.16 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-tools-v6.16

Tag SHA1: 26e2922fd750bf47b25f705233be4c89528535f2
Head SHA1: 8020361d51eea5145402e450d91b083bccdcd874


Costa Shulyupin (1):
      rtla: Set distinctive exit value for failed tests

Tiezhu Yang (1):
      rtla: Define __NR_sched_setattr for LoongArch

Tomas Glozar (1):
      rtla: Define _GNU_SOURCE in timerlat_bpf.c

----
 tools/tracing/rtla/src/osnoise_hist.c  |  5 +++--
 tools/tracing/rtla/src/osnoise_top.c   |  5 +++--
 tools/tracing/rtla/src/timerlat_bpf.c  |  1 +
 tools/tracing/rtla/src/timerlat_hist.c |  5 +++--
 tools/tracing/rtla/src/timerlat_top.c  |  5 +++--
 tools/tracing/rtla/src/utils.c         |  2 ++
 tools/tracing/rtla/src/utils.h         |  6 ++++++
 tools/tracing/rtla/tests/engine.sh     |  7 +++++--
 tools/tracing/rtla/tests/hwnoise.t     |  4 ++--
 tools/tracing/rtla/tests/osnoise.t     |  6 +++---
 tools/tracing/rtla/tests/timerlat.t    | 12 ++++++------
 11 files changed, 37 insertions(+), 21 deletions(-)
---------------------------
diff --git a/tools/tracing/rtla/src/osnoise_hist.c b/tools/tracing/rtla/src/osnoise_hist.c
index d9d15c8f27c7..8d579bcee709 100644
--- a/tools/tracing/rtla/src/osnoise_hist.c
+++ b/tools/tracing/rtla/src/osnoise_hist.c
@@ -766,8 +766,8 @@ int osnoise_hist_main(int argc, char *argv[])
 	struct osnoise_params *params;
 	struct osnoise_tool *record = NULL;
 	struct osnoise_tool *tool = NULL;
+	enum result return_value = ERROR;
 	struct trace_instance *trace;
-	int return_value = 1;
 	int retval;
 
 	params = osnoise_hist_parse_args(argc, argv);
@@ -889,12 +889,13 @@ int osnoise_hist_main(int argc, char *argv[])
 
 	osnoise_print_stats(params, tool);
 
-	return_value = 0;
+	return_value = PASSED;
 
 	if (osnoise_trace_is_off(tool, record)) {
 		printf("rtla osnoise hit stop tracing\n");
 		save_trace_to_file(record ? record->trace.inst : NULL,
 				   params->trace_output);
+		return_value = FAILED;
 	}
 
 out_hist:
diff --git a/tools/tracing/rtla/src/osnoise_top.c b/tools/tracing/rtla/src/osnoise_top.c
index 3455ee73e2e6..2c12780c8aa9 100644
--- a/tools/tracing/rtla/src/osnoise_top.c
+++ b/tools/tracing/rtla/src/osnoise_top.c
@@ -594,8 +594,8 @@ int osnoise_top_main(int argc, char **argv)
 	struct osnoise_params *params;
 	struct osnoise_tool *record = NULL;
 	struct osnoise_tool *tool = NULL;
+	enum result return_value = ERROR;
 	struct trace_instance *trace;
-	int return_value = 1;
 	int retval;
 
 	params = osnoise_top_parse_args(argc, argv);
@@ -715,12 +715,13 @@ int osnoise_top_main(int argc, char **argv)
 
 	osnoise_print_stats(params, tool);
 
-	return_value = 0;
+	return_value = PASSED;
 
 	if (osnoise_trace_is_off(tool, record)) {
 		printf("osnoise hit stop tracing\n");
 		save_trace_to_file(record ? record->trace.inst : NULL,
 				   params->trace_output);
+		return_value = FAILED;
 	}
 
 out_top:
diff --git a/tools/tracing/rtla/src/timerlat_bpf.c b/tools/tracing/rtla/src/timerlat_bpf.c
index 5abee884037a..0bc44ce5d69b 100644
--- a/tools/tracing/rtla/src/timerlat_bpf.c
+++ b/tools/tracing/rtla/src/timerlat_bpf.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #ifdef HAVE_BPF_SKEL
+#define _GNU_SOURCE
 #include "timerlat.h"
 #include "timerlat_bpf.h"
 #include "timerlat.skel.h"
diff --git a/tools/tracing/rtla/src/timerlat_hist.c b/tools/tracing/rtla/src/timerlat_hist.c
index 9d9efeedc4c2..36d2294c963d 100644
--- a/tools/tracing/rtla/src/timerlat_hist.c
+++ b/tools/tracing/rtla/src/timerlat_hist.c
@@ -1141,11 +1141,11 @@ int timerlat_hist_main(int argc, char *argv[])
 	struct timerlat_params *params;
 	struct osnoise_tool *record = NULL;
 	struct timerlat_u_params params_u;
+	enum result return_value = ERROR;
 	struct osnoise_tool *tool = NULL;
 	struct osnoise_tool *aa = NULL;
 	struct trace_instance *trace;
 	int dma_latency_fd = -1;
-	int return_value = 1;
 	pthread_t timerlat_u;
 	int retval;
 	int nr_cpus, i;
@@ -1378,7 +1378,7 @@ int timerlat_hist_main(int argc, char *argv[])
 
 	timerlat_print_stats(params, tool);
 
-	return_value = 0;
+	return_value = PASSED;
 
 	if (osnoise_trace_is_off(tool, record) && !stop_tracing) {
 		printf("rtla timerlat hit stop tracing\n");
@@ -1388,6 +1388,7 @@ int timerlat_hist_main(int argc, char *argv[])
 
 		save_trace_to_file(record ? record->trace.inst : NULL,
 				   params->trace_output);
+		return_value = FAILED;
 	}
 
 out_hist:
diff --git a/tools/tracing/rtla/src/timerlat_top.c b/tools/tracing/rtla/src/timerlat_top.c
index 79cb6f28967f..7365e08fe986 100644
--- a/tools/tracing/rtla/src/timerlat_top.c
+++ b/tools/tracing/rtla/src/timerlat_top.c
@@ -985,12 +985,12 @@ int timerlat_top_main(int argc, char *argv[])
 	struct timerlat_params *params;
 	struct osnoise_tool *record = NULL;
 	struct timerlat_u_params params_u;
+	enum result return_value = ERROR;
 	struct osnoise_tool *top = NULL;
 	struct osnoise_tool *aa = NULL;
 	struct trace_instance *trace;
 	int dma_latency_fd = -1;
 	pthread_t timerlat_u;
-	int return_value = 1;
 	char *max_lat;
 	int retval;
 	int nr_cpus, i;
@@ -1197,7 +1197,7 @@ int timerlat_top_main(int argc, char *argv[])
 
 	timerlat_print_stats(params, top);
 
-	return_value = 0;
+	return_value = PASSED;
 
 	if (osnoise_trace_is_off(top, record) && !stop_tracing) {
 		printf("rtla timerlat hit stop tracing\n");
@@ -1207,6 +1207,7 @@ int timerlat_top_main(int argc, char *argv[])
 
 		save_trace_to_file(record ? record->trace.inst : NULL,
 				   params->trace_output);
+		return_value = FAILED;
 	} else if (params->aa_only) {
 		/*
 		 * If the trace did not stop with --aa-only, at least print the
diff --git a/tools/tracing/rtla/src/utils.c b/tools/tracing/rtla/src/utils.c
index 4995d35cf3ec..d6ab15dcb490 100644
--- a/tools/tracing/rtla/src/utils.c
+++ b/tools/tracing/rtla/src/utils.c
@@ -227,6 +227,8 @@ long parse_ns_duration(char *val)
 #  define __NR_sched_setattr	355
 # elif __s390x__
 #  define __NR_sched_setattr	345
+# elif __loongarch__
+#  define __NR_sched_setattr	274
 # endif
 #endif
 
diff --git a/tools/tracing/rtla/src/utils.h b/tools/tracing/rtla/src/utils.h
index 101d4799a009..a2a6f89f342d 100644
--- a/tools/tracing/rtla/src/utils.h
+++ b/tools/tracing/rtla/src/utils.h
@@ -83,3 +83,9 @@ int auto_house_keeping(cpu_set_t *monitored_cpus);
 
 #define ns_to_usf(x) (((double)x/1000))
 #define ns_to_per(total, part) ((part * 100) / (double)total)
+
+enum result {
+	PASSED = 0, /* same as EXIT_SUCCESS */
+	ERROR = 1,  /* same as EXIT_FAILURE, an error in arguments */
+	FAILED = 2, /* test hit the stop tracing condition */
+};
diff --git a/tools/tracing/rtla/tests/engine.sh b/tools/tracing/rtla/tests/engine.sh
index b1697b3e3f52..f2616a8e4179 100644
--- a/tools/tracing/rtla/tests/engine.sh
+++ b/tools/tracing/rtla/tests/engine.sh
@@ -39,6 +39,7 @@ reset_osnoise() {
 }
 
 check() {
+	expected_exitcode=${3:-0}
 	# Simple check: run rtla with given arguments and test exit code.
 	# If TEST_COUNT is set, run the test. Otherwise, just count.
 	ctr=$(($ctr + 1))
@@ -49,7 +50,7 @@ check() {
 		# Run rtla; in case of failure, include its output as comment
 		# in the test results.
 		result=$(stdbuf -oL $TIMEOUT "$RTLA" $2 2>&1); exitcode=$?
-		if [ $exitcode -eq 0 ]
+		if [ $exitcode -eq $expected_exitcode ]
 		then
 			echo "ok $ctr - $1"
 		else
@@ -68,12 +69,14 @@ check_with_osnoise_options() {
 	# Save original arguments
 	arg1=$1
 	arg2=$2
+	arg3=$3
 
 	# Apply osnoise options (if not dry run)
 	if [ -n "$TEST_COUNT" ]
 	then
 		[ "$NO_RESET_OSNOISE" == 1 ] || reset_osnoise
 		shift
+		shift
 		while shift
 		do
 			[ "$1" == "" ] && continue
@@ -84,7 +87,7 @@ check_with_osnoise_options() {
 		done
 	fi
 
-	NO_RESET_OSNOISE=1 check "$arg1" "$arg2"
+	NO_RESET_OSNOISE=1 check "$arg1" "$arg2" "$arg3"
 }
 
 set_timeout() {
diff --git a/tools/tracing/rtla/tests/hwnoise.t b/tools/tracing/rtla/tests/hwnoise.t
index bbed17580537..5f71401a139e 100644
--- a/tools/tracing/rtla/tests/hwnoise.t
+++ b/tools/tracing/rtla/tests/hwnoise.t
@@ -10,11 +10,11 @@ check "verify help page" \
 check "detect noise higher than one microsecond" \
 	"hwnoise -c 0 -T 1 -d 5s -q"
 check "set the automatic trace mode" \
-	"hwnoise -a 5 -d 30s"
+	"hwnoise -a 5 -d 30s" 2
 check "set scheduling param to the osnoise tracer threads" \
 	"hwnoise -P F:1 -c 0 -r 900000 -d 1M -q"
 check "stop the trace if a single sample is higher than 1 us" \
-	"hwnoise -s 1 -T 1 -t -d 30s"
+	"hwnoise -s 1 -T 1 -t -d 30s" 2
 check "enable a trace event trigger" \
 	"hwnoise -t -e osnoise:irq_noise trigger=\"hist:key=desc,duration:sort=desc,duration:vals=hitcount\" -d 1m"
 
diff --git a/tools/tracing/rtla/tests/osnoise.t b/tools/tracing/rtla/tests/osnoise.t
index e5995c03c790..44908fc01abf 100644
--- a/tools/tracing/rtla/tests/osnoise.t
+++ b/tools/tracing/rtla/tests/osnoise.t
@@ -10,9 +10,9 @@ check "verify help page" \
 check "verify the --priority/-P param" \
 	"osnoise top -P F:1 -c 0 -r 900000 -d 1M -q"
 check "verify the --stop/-s param" \
-	"osnoise top -s 30 -T 1 -t"
+	"osnoise top -s 30 -T 1 -t" 2
 check "verify the  --trace param" \
-	"osnoise hist -s 30 -T 1 -t"
+	"osnoise hist -s 30 -T 1 -t" 2
 check "verify the --entries/-E param" \
 	"osnoise hist -P F:1 -c 0 -r 900000 -d 1M -b 10 -E 25"
 
@@ -20,6 +20,6 @@ check "verify the --entries/-E param" \
 # and stopping on threshold.
 # If default period is not set, this will time out.
 check_with_osnoise_options "apply default period" \
-	"osnoise hist -s 1" period_us=600000000
+	"osnoise hist -s 1" 2 period_us=600000000
 
 test_end
diff --git a/tools/tracing/rtla/tests/timerlat.t b/tools/tracing/rtla/tests/timerlat.t
index e939ff71d6be..579c12a85e8f 100644
--- a/tools/tracing/rtla/tests/timerlat.t
+++ b/tools/tracing/rtla/tests/timerlat.t
@@ -21,21 +21,21 @@ export RTLA_NO_BPF=$option
 check "verify help page" \
 	"timerlat --help"
 check "verify -s/--stack" \
-	"timerlat top -s 3 -T 10 -t"
+	"timerlat top -s 3 -T 10 -t" 2
 check "verify -P/--priority" \
 	"timerlat top -P F:1 -c 0 -d 1M -q"
 check "test in nanoseconds" \
-	"timerlat top -i 2 -c 0 -n -d 30s"
+	"timerlat top -i 2 -c 0 -n -d 30s" 2
 check "set the automatic trace mode" \
-	"timerlat top -a 5 --dump-tasks"
+	"timerlat top -a 5 --dump-tasks" 2
 check "print the auto-analysis if hits the stop tracing condition" \
-	"timerlat top --aa-only 5"
+	"timerlat top --aa-only 5" 2
 check "disable auto-analysis" \
-	"timerlat top -s 3 -T 10 -t --no-aa"
+	"timerlat top -s 3 -T 10 -t --no-aa" 2
 check "verify -c/--cpus" \
 	"timerlat hist -c 0 -d 30s"
 check "hist test in nanoseconds" \
-	"timerlat hist -i 2 -c 0 -n -d 30s"
+	"timerlat hist -i 2 -c 0 -n -d 30s" 2
 done
 
 test_end
