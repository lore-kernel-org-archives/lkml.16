Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com [209.85.222.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62A220101D
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 19:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770440; cv=none; b=hUui/qYtZdMbrHaF2AmA0FBlXiO/bpIIE0198BS/t/YgFOWW7VW/ISUG+bRwcvfEVILU06WIFvbysDvWpjOzuQPTwdtMEP5iHCPZWnG9iVl+NHzBxp+tp8VG9+E09nHzhTJVKSAcyp+ZSCTFCJYHrnq9QlzVlo/3OoJKFnSJcag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770440; c=relaxed/simple;
	bh=amxOjkQ68jSiXOIMKfSrhfbi7f+ELcaOtAJf4MVQ/EM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ECmWUZmVrr7FS266tuA2PbrjdPMViMy5GoSRAgsEYCzjaVB7ecVbGJGVWL0znwEY3iYztgrUbQ0zdZi1CyFQfPg2yiVa5BKeBZX4QBdQnB3CfqGiT0uAzsk8JF9MFB6cGVdQdEN1enEJbSXW5H5az2NJnd+rUGsVxDWHzHGFngY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h8JvuXed; arc=none smtp.client-ip=209.85.222.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h8JvuXed"
Received: by mail-qk1-f202.google.com with SMTP id af79cd13be357-7caef20a528so1576511485a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747770438; x=1748375238; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rqsLb4Go615Rv3sDkm4gh0pD3pm2JY3mUNmzalqtLZc=;
        b=h8JvuXedIGkbAuCu+BVFxJbiEIWm2qqPMB0t+LKdUdsGn3HBXGLzF1U04jEfwbKay+
         celAPNS2opoSatTM6nYeIb5Ou51yZUKPPTYd5KAtOmkj6gBxq3VQFpOBIHVPLF9zDIoO
         TfTkEjqY8lxELX5wllMSEFKTzd27e3i2vDJqZQpmWllD8UNVuETVs7WI1bPpztoYejng
         nOtI7jQ9mJWbYJTW+UgSyFAw1XnCPrL1W4LRErncUmtXwL1RFBkMsPTkyniojfwpLY7/
         oE+LaCuAebfAkyYq7bXQltPZABVs3avg0xcdU4t7WjJgia9vIq4Ct71HsYA7RP9x2y0q
         nbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770438; x=1748375238;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rqsLb4Go615Rv3sDkm4gh0pD3pm2JY3mUNmzalqtLZc=;
        b=E1ZI08Ny8Zg7sgkpOXXE8GZw9NTAlDt6rSlJBFTTKPn6JW18C0LCe+Lep27Ny9u5Sx
         3fCN72njb3qyE9NEDPu9rX8Q+cVsg+LzLE8OeFTcGE9JqGe82h8dhizPRCGrpE/iVe2h
         3mpVprqjRj43dTmgQ32lccWKR8/0F/ch/4Mby7rmAeuWnfiLhbs30FZ6wLmg3bxlFYV1
         Pm+hFsRUKNxyzeMK7SDzgA36f6PEMIx9JK6EUc2a6Y4Fg07wrJWtfNLpHm7J8c/KfftN
         KUwzHmoM35a1T/6FAujcAW6GwrxRRYzyiJzvmHx4+YM3pfgs4rCjwziP/nCzTxlh/oW5
         Becw==
X-Forwarded-Encrypted: i=1; AJvYcCUU2a/dXbHDm/phZIgk4yldQCi5YumT/ms9E9Rp39tqtAGkJcFHsCzbzy2/JpD1dVV08r8c0ksayMppgLI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw4pH0eBsDqrJZDDvHp/mz4e8GSslDsrBoF+r7zJ172P6N2zyy
	pLppz6qw6QI+lJtBanFFeSLQMoIiHE9x5I/+aMCv+5m/V2zwzMNMCtp9ALor79uPnmDoixzBYK+
	w9g==
X-Google-Smtp-Source: AGHT+IEk8HRf1tMAAyBDk6ioHYYDZ8p2tDUMaT/WbcTGVmXyjZj8eY/n+8d58IEwmqQwx1gmDZmsdtEWzw==
X-Received: from qkam16.prod.google.com ([2002:ae9:e710:0:b0:7ce:c22d:6a49])
 (user=rmoar job=prod-delivery.src-stubby-dispatcher) by 2002:a05:620a:4443:b0:7ca:f021:4d3a
 with SMTP id af79cd13be357-7cd47fb274emr2106144085a.39.1747770437675; Tue, 20
 May 2025 12:47:17 -0700 (PDT)
Date: Tue, 20 May 2025 19:47:13 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250520194713.2233351-1-rmoar@google.com>
Subject: [PATCH v2] kunit: tool: add test counts to JSON output
From: Rae Moar <rmoar@google.com>
To: davidgow@google.com, brendan.higgins@linux.dev, skhan@linuxfoundation.org
Cc: dlatypov@google.com, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Rae Moar <rmoar@google.com>
Content-Type: text/plain; charset="UTF-8"

Add the test counts to the JSON output from kunit.py. For example:

...
"git_branch": "kselftest",
"misc":
{
    "tests": 2,
    "passed": 1.
    "failed": 1,
    "crashed": 0,
    "skipped": 0,
    "errors": 0,
}
...

To output the JSON using the following command:
./tools/testing/kunit/kunit.py run example --json

This has been requested by KUnit users. The counts are in a "misc"
field because the JSON output needs to be compliant with the KCIDB
submission guide. There are no counts fields but there is a "misc" field
in the guide.

Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: Rae Moar <rmoar@google.com>
---
 tools/testing/kunit/kunit_json.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/kunit/kunit_json.py b/tools/testing/kunit/kunit_json.py
index 10ff65689dd8..c1463e6819b6 100644
--- a/tools/testing/kunit/kunit_json.py
+++ b/tools/testing/kunit/kunit_json.py
@@ -39,10 +39,20 @@ def _get_group_json(test: Test, common_fields: JsonObj) -> JsonObj:
 		status = _status_map.get(subtest.status, "FAIL")
 		test_cases.append({"name": subtest.name, "status": status})
 
+	test_counts = test.counts
+	counts_json = {
+		"tests": test_counts.total(),
+		"passed": test_counts.passed,
+		"failed": test_counts.failed,
+		"crashed": test_counts.crashed,
+		"skipped": test_counts.skipped,
+		"errors": test_counts.errors,
+	}
 	test_group = {
 		"name": test.name,
 		"sub_groups": sub_groups,
 		"test_cases": test_cases,
+		"misc": counts_json,
 	}
 	test_group.update(common_fields)
 	return test_group

base-commit: c2493384e8110d5a4792fff4b9d46e47b78ea10a
-- 
2.49.0.1112.g889b7c5bd8-goog

