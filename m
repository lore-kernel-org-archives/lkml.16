Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151632D321C
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747956380; cv=none; b=p7I+EaELt1jWzEpkleCckm4xw6r1OWsksg53P2ov5QYBwPl0IgfXelF/o8greEF5NKGcKbxK3HLCmZAQMXDVVi02nfAme0CfX/wtA9wSn3VgYGjnb9VEdgruQxcDglW/2xFOhaI6VEe5mavmAFwjsJSUDzRlIuK1U/4KZiOye6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747956380; c=relaxed/simple;
	bh=yRzc0icmCI3Wfp8FtEoLTbRp1C8aPjfzbWi+UvR2NUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mYJCRLixxORfbB3+0GdsN8H9+QRsSs9/Twx1VOvh0vlkzS5akkgGLKlsAkmdmI2VCNnv2/7WUfsddvhSZeGo2FJptK7QJM/KLjwxn2OPvfg48z8zHaWFudZoM/YmkIWtW/GyAqQEO4/GkyHnmdk1zviKCBoHoWl6536dXZP0Em8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=kjYUwQQ2; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="kjYUwQQ2"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so93759255e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747956377; x=1748561177; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dKVNMuDSduacbIBYKcZNnzCtGR0eRj8WvfLgYTzDz7M=;
        b=kjYUwQQ20ICED7JofCgsYJKVwkIAK+g1K/cv21Gqlg8dz3A43DDvoNoADjh16Vqx/s
         +g1mcOSyxKjsJOb11WY3VYZw5jAy798a3yKVDj/88103NVc4RSQVrMZY+k9Rd1ajOdCL
         XKNsN6xUHgCc3WnXguz9UCsDpXmqC6rHOwpB4n92aJwlBgaVtubRYT2AYwxl47/3JFEa
         FjhOBZfpBQz+mmRoDQiAMpFfOj+7RT4Wf0pR2NLpFGXmASyXVV12MeYxbLVzoROcoHik
         W9e8N+mhsgnWk5Y3wX0bzHBLRJmHraLL9pxvdmMs2RugNAcSQuLhTO0z1spyXjh6b8j2
         oaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747956377; x=1748561177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKVNMuDSduacbIBYKcZNnzCtGR0eRj8WvfLgYTzDz7M=;
        b=QJLa+o/KYsHeBEgP3UCz+rcKhQ/TNVDB+H7N66LTJ1PHwAh8FWM7WB7yHYomv74BlK
         MGn9EWTgBFLQLuwz3eE/3gHzw71u8RN/qSCFoJDzFC/nQGQ2kgbYJi1PkgmA65vzbPgS
         ozddOPGhXWZ23opA4RcFIRTkb6jxMjzbKar4OnJzjg+3Mh+vH2BqKjXhbASHRSkXuttx
         1qXDqcWNeH/PQpZFlCGlfCPuBnI3rtrJpr0VkPr+BsjDb8rR7JNw/qpl/40ToO594nfY
         lBFHXdkcvoAKGFVK+Uvb61YynfgggHIAmeqQgbDxCDU5sWgOJwb6RXbzfnhrrmIs/dkH
         95yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG8xaXS4hgN5Xa/Ac79rJOuNNn5lYuRr35Vwh7gaLL8aZgPHzVqevKOFPofKU8lmyp2DmyiVyImr8Xn+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtWBNKvdEK7JfwRhHuTHqzn2ZsFq7L0Eo1Hj+GkMFz1CbXfVN/
	2jJylOs6RO5V9KWmuiLkOKq+I24BzYZDaCeU7bXQooH5kKXRroHTgNm/K0GbtO7B9BA=
X-Gm-Gg: ASbGncvxdL57jXGnPAC8+la74GSC0p8DZcj06HWvvBKZ/+B3tKqp6tDraJhxXjSlNe+
	luMvpRZUCJJtd2I23ov0+66Nh3pCr4JGGJnwAdqzwpxthID7KArdRufPovGG46LpQA8I0n5J6WR
	NJKA8DqyONlyKZEprt7ic9JPhu3Kli1DcFRTEOWC6g+tCiZMAKBZC+yp8yJth/iVjtfa4GLBap0
	R6O2xeHjKmLLTshwTPqHUG8biAIuPBc2EFTUy6ELg0F+V8Ugyp2RjNuLwF4dpJNw6/RjtG6K+26
	GyzZP2+tGlp4hAh3WY1CedbrDVdokIaqcbF0xXdKEJcZt3glueN5zg==
X-Google-Smtp-Source: AGHT+IG6EHMwWLdGi5KKzk4nvM0cwE/VEL6TR7m61EKgB/eRoEgtVitn+rOSsP5hXJxsGHaL7N+kKQ==
X-Received: by 2002:a05:600c:8411:b0:442:e9ec:4654 with SMTP id 5b1f17b1804b1-44b6d1d39b6mr6921755e9.8.1747956377309;
        Thu, 22 May 2025 16:26:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:c7c:75ac:6300:c05a:35d:17ae:e731])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6f04334sm117825395e9.10.2025.05.22.16.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 16:26:17 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Fri, 23 May 2025 00:25:07 +0100
Subject: [PATCH v3 1/7] perf: Increase the maximum number of branches
 remove_loops() can process.
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-b4-ctr_upstream_v3-v3-1-ad355304ba1c@rivosinc.com>
References: <20250523-b4-ctr_upstream_v3-v3-0-ad355304ba1c@rivosinc.com>
In-Reply-To: <20250523-b4-ctr_upstream_v3-v3-0-ad355304ba1c@rivosinc.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Beeman Strong <beeman@rivosinc.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, Rajnesh Kanwal <rkanwal@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747956375; l=1919;
 i=rkanwal@rivosinc.com; s=20250522; h=from:subject:message-id;
 bh=yRzc0icmCI3Wfp8FtEoLTbRp1C8aPjfzbWi+UvR2NUk=;
 b=eXHAPMGQUlSkoKw/ZujHfDdVrgUDThW/41UrEOojqu5cpgpKRvW3csxhNcSG5dQjunGp++UGp
 BxjZ3PfI7eeCjvpIQxYxdbhtwmDvg9UZA3QLufVRs12DfstYvvJmpYm
X-Developer-Key: i=rkanwal@rivosinc.com; a=ed25519;
 pk=aw8nvncslGKHEmTBTJqvkP/4tj6pijL8fwRRym/GuS8=

RISCV CTR extension supports a maximum depth of 256 last branch records.
Currently remove_loops() can only process 127 entries at max. This leads
to samples with more than 127 entries being skipped. This change simply
updates the remove_loops() logic to be able to process 256 entries.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 tools/perf/util/machine.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 2d51badfbf2e2d1588fa4fdd42ef6c8fea35bf0e..5414528b9d336790decfb42a4f6a4da6c6b68b07 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -2176,25 +2176,32 @@ static void save_iterations(struct iterations *iter,
 		iter->cycles += be[i].flags.cycles;
 }
 
-#define CHASHSZ 127
-#define CHASHBITS 7
-#define NO_ENTRY 0xff
+#define CHASHBITS 8
+#define NO_ENTRY 0xffU
 
-#define PERF_MAX_BRANCH_DEPTH 127
+#define PERF_MAX_BRANCH_DEPTH 256
 
 /* Remove loops. */
+/* Note: Last entry (i==ff) will never be checked against NO_ENTRY
+ * so it's safe to have an unsigned char array to process 256 entries
+ * without causing clash between last entry and NO_ENTRY value.
+ */
 static int remove_loops(struct branch_entry *l, int nr,
 			struct iterations *iter)
 {
 	int i, j, off;
-	unsigned char chash[CHASHSZ];
+	unsigned char chash[PERF_MAX_BRANCH_DEPTH];
 
 	memset(chash, NO_ENTRY, sizeof(chash));
 
-	BUG_ON(PERF_MAX_BRANCH_DEPTH > 255);
+	BUG_ON(PERF_MAX_BRANCH_DEPTH > 256);
 
 	for (i = 0; i < nr; i++) {
-		int h = hash_64(l[i].from, CHASHBITS) % CHASHSZ;
+		/* Remainder division by PERF_MAX_BRANCH_DEPTH is not
+		 * needed as hash_64 will anyway limit the hash
+		 * to CHASHBITS
+		 */
+		int h = hash_64(l[i].from, CHASHBITS);
 
 		/* no collision handling for now */
 		if (chash[h] == NO_ENTRY) {

-- 
2.43.0

