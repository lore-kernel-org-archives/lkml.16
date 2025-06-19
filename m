Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC6D1C68F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 00:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750291789; cv=none; b=LxtfMMRdh4VLqo6MKWEuPWw/24t9Q7xS1zPulRgJVcLZgmYHEfKzuBIY+kWEVcGk86+5ZfYCMF+rBKDp9d0L+n5M1fQtelfgW8BXfunY3QcxEv+Fp4+hLREu/HSOnqT2SihhiO6Oi4uMvwpYig+3j86SIi5Gj7Ckzqg2CdaQ+xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750291789; c=relaxed/simple;
	bh=Fj3oZkEhJrCAh4Iz/UdI/QOMi2P7+U3l67G0F7JcskY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WtZg9vCscDstHRBqjPg1BMVpKO5Z/mhBLan/fypYw56s+1mLx1gC886ZwsNMFRjgKa+op+/1sdTqqpt/SpXqzgyCfPbfaCTxIil7UVsn8GFXpoB3I0XHSVwO5X0m3J9H504Qj8EllNN5l24uGNgRL/Ta2FkVYx0Gs54ZCnJAMbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--pmalani.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QYw2jvXZ; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--pmalani.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QYw2jvXZ"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b31bc3128fcso313308a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750291785; x=1750896585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fmBkhKQftrBW4wXUW3woXJtxya0xUCL03sCXfSj3h8=;
        b=QYw2jvXZS0UA7snx0fQqENRLEo7mAF1+BTCvMUZ6/pnVOxKw06isAfFYFOwGBHO5vA
         P1QSF7kd7ocIJtMcsnlgq/dDfvrqjR6K7uGJccVd1Pbv8+tdRoGJLzlK7+1RgFgrb8CX
         Yex8tONxSDdaOA6Go5kc5v04EBzcSNuyDW2zPA/uwrhWy9AiNDhwLqDPiunken7sVx9q
         7dGefFVqUJKt5u/nrot17Cj8eDBMbWmf7neJOKXKaVlGuzz2yKmCtGhyeNDifwtx2b8L
         OfS0cojEQ/KG/27qIYGW9QK3IzJ6GCbiDIaDofPQZsGcr8j08uJ74sR4o15aBDDUn0Vj
         u5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750291785; x=1750896585;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+fmBkhKQftrBW4wXUW3woXJtxya0xUCL03sCXfSj3h8=;
        b=KDYMU6W5akoSBv0x0tGbSQflWszPv4pP5JrHl2cHBjKXMaGHnpR/fHoQ39gxuwxBHH
         qRqHNhk4dZ98QAvS4kmaP+V1gW9V6BashgdjTuyaKBhSzESQAq5VUNwt9or0Nqwtlu7M
         6pt9w2R/vfIi8zzgNC+4LQzEfQLOrBAxUCE8U0KQs+KAqiQqI492S9rQBHph2EJwvahC
         XjVS5G5RrgqtxsESv20qddAeMoKffNhDMjHDypkR9NQ8ESjh0kt1OqiQBLHsyIDbnEnb
         xOA7YsIRxuT8+fdhQgvD84cTj+VDz8TiYWwYsQlZCDM4ZEGG/E0yfvpnJrILEjnCJrmr
         pL+A==
X-Forwarded-Encrypted: i=1; AJvYcCXxLYATO1v6PoMupgD+XEf2EDqqwetXyZ6mUWmmeqtfRODpKZz4T+tJL04ZQsSC/qfqqxsa1gK6wEalFNU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1gwUvu4VSF5Dy7SZc7q/j5pabkM8zUd3PLHYbivjOF4ii/Wrc
	RAv4BskNt/jATjovvUgefH571aSReR42CPmZzNvPIQFp065HxWENCT9K2jNfySKXZ4MRv5WZh0q
	aQmsi3sSQow==
X-Google-Smtp-Source: AGHT+IFRGZh1ipsvgoWb3xe+LChbHfiIZwC43x4KvlpB3ixADI4MvbOX5asjlo5RBRIIuzw+0m39mBy3lWWq
X-Received: from pjj15.prod.google.com ([2002:a17:90b:554f:b0:312:14e5:174b])
 (user=pmalani job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2787:b0:236:9402:a622
 with SMTP id d9443c01a7336-2369402a9b9mr94092355ad.34.1750291785183; Wed, 18
 Jun 2025 17:09:45 -0700 (PDT)
Date: Thu, 19 Jun 2025 00:09:17 +0000
In-Reply-To: <20250619000925.415528-1-pmalani@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250619000925.415528-1-pmalani@google.com>
X-Mailer: git-send-email 2.50.0.rc2.701.gf1e915cc24-goog
Message-ID: <20250619000925.415528-3-pmalani@google.com>
Subject: [PATCH v2 2/2] cpufreq: CPPC: Dont read counters for idle CPUs
From: Prashant Malani <pmalani@google.com>
To: Ben Segall <bsegall@google.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CPU FREQUENCY SCALING FRAMEWORK" <linux-pm@vger.kernel.org>, Mel Gorman <mgorman@suse.de>, 
	Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Valentin Schneider <vschneid@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Prashant Malani <pmalani@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

AMU performance counters tend to be inaccurate when measured on idle CPUs.
On an idle CPU which is programmed to 3.4 GHz (verified through firmware),
here is a measurement and calculation of operating frequency:

t0: ref=3D899127636, del=3D3012458473
t1: ref=3D899129626, del=3D3012466509
perf=3D40

For reference, when we measure the same CPU with stress-ng running, we have
a more accurate result:
t0: ref=3D30751756418, del=3D104490567689
t1: ref=3D30751760628, del=3D104490582296
perf=3D34

(t0 and t1 are 2 microseconds apart)

In the above, the prescribed method[1] of calculating frequency from CPPC
counters was used.

The follow-on effect is that the inaccurate frequency is stashed in the
cpufreq policy struct when the CPU is brought online. Since CPUs are mostly
idle when they are brought online, this means cpufreq has an inaccurate
view of the programmed clock rate.

Consequently, if userspace tries to actually set the frequency to the
previously erroneous rate (4 GHz in the above example), cpufreq returns
early without calling in to the CPPC driver to send the relevant PCC
command; it thinks the CPU is already at that frequency.

Update the CPPC get_rate() code to skip sampling counters if we know a CPU
is idle, and go directly to the fallback response of returning the
=E2=80=9Cdesired=E2=80=9D frequency. The code intends to do that anyway if =
the counters
happen to return an =E2=80=9Cidle=E2=80=9D reading.

[1] https://docs.kernel.org/admin-guide/acpi/cppc_sysfs.html#computing-aver=
age-delivered-performance

Signed-off-by: Prashant Malani <pmalani@google.com>
---

Changes in v2:
- Add sched.h header for usage when compiled as module.

 drivers/cpufreq/cppc_cpufreq.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.=
c
index b7c688a5659c..5ed04774e569 100644
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@ -18,6 +18,7 @@
 #include <linux/cpufreq.h>
 #include <linux/irq_work.h>
 #include <linux/kthread.h>
+#include <linux/sched.h>
 #include <linux/time.h>
 #include <linux/vmalloc.h>
 #include <uapi/linux/sched/types.h>
@@ -753,6 +754,10 @@ static unsigned int cppc_cpufreq_get_rate(unsigned int=
 cpu)
=20
 	cpufreq_cpu_put(policy);
=20
+	/* Idle CPUs have unreliable counters, so skip to the end. */
+	if (idle_cpu(cpu))
+		goto out_invalid_counters;
+
 	ret =3D cppc_get_perf_ctrs_sample(cpu, &fb_ctrs_t0, &fb_ctrs_t1);
 	if (ret) {
 		if (ret =3D=3D -EFAULT)
--=20
2.50.0.rc2.701.gf1e915cc24-goog

