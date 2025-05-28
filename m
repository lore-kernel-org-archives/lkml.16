Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2B5212FAD
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748463360; cv=none; b=BNJbiejFU8NFaC+FlNaTm8A5RK9yn+clhOdbT9YSf9Tjm3TBI1rgi5l6Bl1ocAP2QYpwCR/LpLb9mHkZunSPV9K96ui5vli4upVfi0Y0DwKQRUAWBziARlmhkrGGEUBwemNwJ8vEOhOjaPSHQ4brRoVK3eTscCIcZL30pRNMnKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748463360; c=relaxed/simple;
	bh=NbmK55wDrn+sdJFyfMhr8lBswjRVmpVCl5OREk53Tyg=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=sK6sssMOwO70L1iFvKTtidXOwcbAVPdu/6Ln8e0Wu2S06cLrXeiOFHNXQuzrZcLHiGbStmK31PmQeE3+aiGPPVaO/xc3gI3pnWKRCN07YfQVo/T5oudHRCbHN15tT+K2bydtrZ19x8Sy10wkIe6UqM+uuziIYFb5EmAG+nyv7As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D21C4CEEB;
	Wed, 28 May 2025 20:15:59 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uKNCu-0000000AmUz-2pG9;
	Wed, 28 May 2025 16:17:00 -0400
Message-ID: <20250528201700.526132429@goodmis.org>
User-Agent: quilt/0.68
Date: Wed, 28 May 2025 16:16:44 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Tomas Glozar <tglozar@redhat.com>,
 John Kacur <jkacur@redhat.com>,
 Daniel Bristot de Oliveira <bristot@kernel.org>,
 "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
 Eder Zulian <ezulian@redhat.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Jan Stancek <jstancek@redhat.com>,
 Costa Shulyupin <costa.shul@redhat.com>
Subject: [for-next][PATCH 1/3] rtla: Set distinctive exit value for failed tests
References: <20250528201643.598382331@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Costa Shulyupin <costa.shul@redhat.com>

A test is considered failed when a sample trace exceeds the threshold.
Failed tests return the same exit code as passed tests, requiring test
frameworks to determine the result by searching for "hit stop tracing"
in the output.

Assign a distinct exit code for failed tests to enable the use of shell
expressions and seamless integration with testing frameworks without the
need to parse output.

Add enum type for return value.

Update `make check`.

Cc: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: John Kacur <jkacur@redhat.com>
Cc: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Cc: Eder Zulian <ezulian@redhat.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jan Stancek <jstancek@redhat.com>
Link: https://lore.kernel.org/20250417185757.2194541-1-costa.shul@redhat.com
Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
Reviewed-by: Tomas Glozar <tglozar@redhat.com>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 tools/tracing/rtla/src/osnoise_hist.c  |  5 +++--
 tools/tracing/rtla/src/osnoise_top.c   |  5 +++--
 tools/tracing/rtla/src/timerlat_hist.c |  5 +++--
 tools/tracing/rtla/src/timerlat_top.c  |  5 +++--
 tools/tracing/rtla/src/utils.h         |  6 ++++++
 tools/tracing/rtla/tests/engine.sh     |  7 +++++--
 tools/tracing/rtla/tests/hwnoise.t     |  4 ++--
 tools/tracing/rtla/tests/osnoise.t     |  6 +++---
 tools/tracing/rtla/tests/timerlat.t    | 12 ++++++------
 9 files changed, 34 insertions(+), 21 deletions(-)

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
-- 
2.47.2


