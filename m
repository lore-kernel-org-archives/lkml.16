Received: from mail-ot1-f100.google.com (mail-ot1-f100.google.com [209.85.210.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9A928C86F
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926349; cv=none; b=GW3lnCrxIptCDumKBCzpbxL4B2iavqHc3RkxULn74RKupzdGPMkJ/WMkuFFLjHPDB2s3aT/nvCQ6xh09mvxtPfefhLt202MYHC5hu18Nc/doV8KVKimDCjx3BEbGF4YthD+O7i0sy8lOkEeev2ySLVlWGhFhp+h2uBG0hGZeAis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926349; c=relaxed/simple;
	bh=7H2/E89fciRxCRq+D4loQo9VPhae2DqqRu/RRY5fbaw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YjaatowgQldAiV4lyeiEYR3+HwOzbKsz/PaSMmdZWt5+qiee+ptMqz6mgq9ifRVsA33/thueBDn8U0XqkokhAY/90ZFlDAU7RBkp4+1o+eq0Y4izyf/+cIPRoi3IRinP7rPQPfryYCPRbjV6BjZkQDR57ZldebM/h5nVZWRCivI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=UZjVpM9c; arc=none smtp.client-ip=209.85.210.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="UZjVpM9c"
Received: by mail-ot1-f100.google.com with SMTP id 46e09a7af769-72bd78e6963so948804a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1747926345; x=1748531145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PfVvvdWGG0adnBwzws5Hqth/btOaihCNY1aQF7gASIY=;
        b=UZjVpM9cu7Ti7Q8ewkdTEhmJqXeQw69vvPJIGnzX5h7ZrezZAZ5Ibj4oIYXZPR9sWy
         ujHyfYif5Y6xt7mAmrmy3qY1ywPit2EJQX0y0FFWSVgRBdIcMNV3cpYNrgOGguJ3yqls
         ybXYWcyKZ6RK8mUJ9sOErf/9Lvo4O0wVkoqxn9IgG90EJn/CLqmqLnuLxqovuiau4dIN
         vsB+qbXgJTCCFHlxfcpxiVSeC+DxtDwJ/8FMTzQyAGbNfpTs2qjpSLJ2a9J21LjjAZVs
         Nlc66XqKAiF2ii9xSi+jFbtURt32bcM30J22W4K9EuVUnuxUBikoe5a9RgcW4Q8imnDi
         sAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926345; x=1748531145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PfVvvdWGG0adnBwzws5Hqth/btOaihCNY1aQF7gASIY=;
        b=eB0o0PouGddykMK1/+V1xbXfLb55EhKSOOdaByBXKIZiGRnN57GpCblFBP2Icq04lu
         Gyhomp9iJQvP98aiNWAFYdksEHbwviG+vOqNgJS9U4wewNeWiW8/9E2Z6IUcLGZk9OX7
         4DBKcyAqmPAYc0sxTfaimvXrAjOZEz6w7eHLNxoTwt/ujrkJCPXO49varhVFVnLyj9mk
         C1BuQTGfByfpRjVB1kdGtwn0ynVzN0/uBMdkUlpXiWwvGQ0rZJPSjdiKlxuFge+OiBKT
         mwhgWplQpVkV5RhUKQx9UZa1uRGH0lcraNFmbv7GeznFE+ZbehwQgIv26qTi5cPEuoMV
         ABCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2uuElflZ6JU5Iac+6XFfRpo76+txq1KLFHKx6xs3GQ5r3HRRtQWQFRPvgUQFOpO1rOyGuausFnyW+2xI=@vger.kernel.org
X-Gm-Message-State: AOJu0YykDJWCoQGqAd+ADnhrSugdrS9WPJu+X69n0p/Dwo3OMGadFTVD
	FZuOQJplpjxzCWw9s20RGaZyjVILLUBtB0i8mQa5gFrtbxAlq5kTil76OZrWOVQ2SY1P9r34H0j
	jlorCk0anpWhg8AbHwGLZvn0Sv9Wldo0UgcvLZcJ5ZiM6li21OKpH
X-Gm-Gg: ASbGnctaUEXUj4kqPLvyF9p/Zpqb9DAZ2Gdkew2LBalf+AxnLWI4crV7tAXzsJRB/CL
	D7485SRn3yYTZb8HupM327LDtA8q/D2u/lg359EwQEcFYyL1OKijnFK7wAwtPQRXwprX2SMCRrT
	HYPu8VNtCppGu0BX7hsExmJw4IYRqX25bsN4k67qnGQ4bRFnsOrrDJro82NAoQAU3y7A21KGOF9
	aUB+y3DJW/er6+vy2TqqaueKvUd07VNZ9R3U0Se6gVNWnfaYCUcQasi0ZzShtJXQez1wQzFz/JN
	4vq8yuJ6LG2wQC9N1taIAr/Qm/g8GQ==
X-Google-Smtp-Source: AGHT+IEYt0bFnFpqhd2H1XnceM8lYVhuAHUarQy8gh4pLinv73lfLkgJKvqyllIgt5EGZDv1rrVoDWxaCb89
X-Received: by 2002:a05:6870:fe85:b0:2d6:1e7:f583 with SMTP id 586e51a60fabf-2e3c1b8e07dmr5370430fac.3.1747926345338;
        Thu, 22 May 2025 08:05:45 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-609f2fbf362sm587638eaf.12.2025.05.22.08.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 08:05:45 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 90DE9340286;
	Thu, 22 May 2025 09:05:44 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 8A9F5E419EF; Thu, 22 May 2025 09:05:44 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH] trace/io_uring: fix io_uring_local_work_run ctx documentation
Date: Thu, 22 May 2025 09:04:50 -0600
Message-ID: <20250522150451.2385652-1-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment for the tracepoint io_uring_local_work_run refers to a field
"tctx" and a type "io_uring_ctx", neither of which exist. "tctx" looks
to mean "ctx" and "io_uring_ctx" should be "io_ring_ctx".

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 include/trace/events/io_uring.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/trace/events/io_uring.h b/include/trace/events/io_uring.h
index fb81c533b310..178ab6f611be 100644
--- a/include/trace/events/io_uring.h
+++ b/include/trace/events/io_uring.h
@@ -643,11 +643,11 @@ TRACE_EVENT(io_uring_short_write,
 );
 
 /*
  * io_uring_local_work_run - ran ring local task work
  *
- * @tctx:		pointer to a io_uring_ctx
+ * @ctx:		pointer to an io_ring_ctx
  * @count:		how many functions it ran
  * @loops:		how many loops it ran
  *
  */
 TRACE_EVENT(io_uring_local_work_run,
-- 
2.45.2

