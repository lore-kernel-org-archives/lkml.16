Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1462F5316
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 22:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750199656; cv=none; b=CSNoBlmrqhqekOmD3FT1aTFtbVCns8nJVxp35rTHg0ImSf0GSEn0+V1vRybeXE4OCHsvJywRv6VJxTVZSGtxWdxvbN1dS2fljlcvTGOPH1/JTDnVs7GpJ54lryHrGrjTGQ/tlSCWVYWJrwJKGdVFXbOh68tyN7a9Ei2DDDa3weM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750199656; c=relaxed/simple;
	bh=iPhLrwxUZHv2wX6yaulHFVcQvRgI68U4Jl3CtCmOLTk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=JfA24QM/4e7ib/rDiXn8Dv2LTvduoiQ3vivBa4PLr9MhD4GmPFcO/o5QdM9qjhfXz/Inh4MJicMJakFRP2RkzZ0VWpZfu/YlQ+q3XI8tQ95iFzwgssStE2JeugtINxR3FlVSWdRY3fHLkm8ekna2Fi8K50tYYPHd/UNbTb075Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=25poyvlc; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="25poyvlc"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2358de17665so51946125ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750199654; x=1750804454; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M8ZbK17Dj2geGvK5GO30EzDPP51WioqEngR1yRrimxo=;
        b=25poyvlceR9oed0K2aF9CtzLxWYxwdcDUnsm8BGfB0hz/gYIPFss5sUPUGlxKczsYs
         071OePMFAlTKdSvuxNg6R+PcaPzAMGQL98mpiW9KxwgUwdUFovQ+QOvzzeEZ2WStYjQ1
         gWvJ4ELXrtUKSekYPbYIj0DJg7rebpVs+F0gHSCt3okfZQRszT423X9wwO+Z1wFAMFCJ
         QdT3ejiaZA4OxjFX58JNXKA9wElVonKvEsbCgaZAje08eL2aze86AeSUDOh6cdYPxWn2
         v6my9CU9nXqRfV9uDF72bCcR10cL7w95TvXIzxPqoytcjdGCyP5Lrk5JmTcrI6R4CLnx
         mQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750199654; x=1750804454;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M8ZbK17Dj2geGvK5GO30EzDPP51WioqEngR1yRrimxo=;
        b=Yji1Qft67jAUpVl1DwxiXB+2BRYTRpcpGpcnySZ+v1OZKeSh5+/wK6q7ILgzQ5NiKG
         JgyD4L3Zospeg0Nsn8gGW6Az6A+g5mijpCxccfAePJIY4efrRdXxUUlO0NRI2+6B7UGk
         Ia7/8qbmTqmjagxr7Pci9gIjTDArkZpVJN6avt0JSvCZLbrBzJutQxar2hegrC2I43Ut
         K4fwhmT+orHV+elRoAFMnB3tjs5doaCnOtyCUHeGfaLnOVwval9fbcD3oycf9XwJ62xi
         bj2RrME2CpHG9TqdO9+nQ7f3OWO5x2qy9jM0RuOiCggCViyjlaZkn3Hjk9AsJusOl6is
         Yh0w==
X-Forwarded-Encrypted: i=1; AJvYcCVNlp9s+k6ifAgjtAABRIuaBDvZpHrztvyGLBolOGqdjOYMJfTxrBCQiUGV+5NkuiclTo8e4RiMnpT9fsA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2s5qlFON8vWtV1fQQrIDURguyHN1/TFqHv1ZJ8fojHs3GSSHO
	3YkaXphyrXnn+FbXjvAuat4CfeaO0j5KbMdwSrfq1FNvAmU2K1jUnXfQ22s054gX5gnYa1Zl3E0
	j3SUAuJ/icw==
X-Google-Smtp-Source: AGHT+IHn5vHmNdo/1OE/54rCEFOwlR9N/3j9Z7E5HOyKK03PBDryeertL6DY4l2/hbLegD+O1+eWlsl+i8Wp
X-Received: from plkj9.prod.google.com ([2002:a17:902:6909:b0:234:908f:4e22])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:186:b0:234:f182:a759
 with SMTP id d9443c01a7336-2366b13c87bmr258940175ad.28.1750199654477; Tue, 17
 Jun 2025 15:34:14 -0700 (PDT)
Date: Tue, 17 Jun 2025 15:33:53 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250617223356.2752099-1-irogers@google.com>
Subject: [PATCH v2 1/4] perf test: Directory file descriptor leak
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Michael Petlan <mpetlan@redhat.com>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Andi Kleen <ak@linux.intel.com>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add missed close when iterating over the script directories.

Fixes: f3295f5b067d ("perf tests: Use scandirat for shell script finding")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/tests-scripts.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/tests/tests-scripts.c b/tools/perf/tests/tests-scripts.c
index 1d5759d08141..3a2a8438f9af 100644
--- a/tools/perf/tests/tests-scripts.c
+++ b/tools/perf/tests/tests-scripts.c
@@ -260,6 +260,7 @@ static void append_scripts_in_dir(int dir_fd,
 			continue; /* Skip scripts that have a separate driver. */
 		fd = openat(dir_fd, ent->d_name, O_PATH);
 		append_scripts_in_dir(fd, result, result_sz);
+		close(fd);
 	}
 	for (i = 0; i < n_dirs; i++) /* Clean up */
 		zfree(&entlist[i]);
-- 
2.50.0.rc2.761.g2dc52ea45b-goog

