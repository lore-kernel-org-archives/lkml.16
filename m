Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com [209.85.222.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D66272E4E
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 20:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747426657; cv=none; b=YehktjCA9x4iE5J2wabLfWQQexFk6Y+B12R/lamc2n172N/6QLG+9FsoZbynCVDhK8EDrihkXbCnfiaSPDtczRfQXn/an+8+AGzvPNPtk1kKrV5/K0No4tDRNQO4AhfMFuX2t3vZ2WNvzp3/+qDuZCpFVNBdaLzLQt7HpsWs28c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747426657; c=relaxed/simple;
	bh=Bu/MHyg4YHVuyS3LOBxtHZLr7L1GcDOPIZ8uDIhpLxE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ohIo4fcrWHd1iRWB36PMQdUGNVRKbCliCKIT3pOsypBGU9B+ak9QCSbH1sIN+DUD9KiGkHCnpd4ml2SGbU+8gDal7VHrm87v5s/b4otcptNge5SyNh8TFYnC0ZtvGmZQ8aShY8zz5/XeSr5IA8CPUOUj/FPKDMxgSvxcRUYvqW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wA7+KUkT; arc=none smtp.client-ip=209.85.222.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wA7+KUkT"
Received: by mail-qk1-f201.google.com with SMTP id af79cd13be357-7c95556f824so252119685a.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 13:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747426655; x=1748031455; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9CHB9wwhPWWYDPfcbzkF4W4PL5+L+ibby6qD0MEp0ho=;
        b=wA7+KUkTZfDZHWUzAQZEc/j43NZtxeO0xvYKRFAOOEBw5HhFLqRCLmVhZyU6AUXsmE
         sbeXGCG/+E1XAxoNMHWt8uLAplyuiG0eD0FDOWCA9iePoWTcTR4NYLpiC73paNcVSGJA
         vdKUgUfbS2ZWV5cKMPuCoiyeFt95o8b3fyH7aSqhTaq3Ddlkl0whTqHjImQZDvl8Ci7+
         /KEa0vsg5oKet608rnx199jPnO0NDkMcEXd6QUgFctxdD1vVVKGxVaO/Ghk1C5yX3Umj
         GMrQTwkd+W9Eo48NmhDVTlWAtDD4gaU95aRuawDMWGakd0avlm8UhYOfQ/aB8XiqL5Fy
         cPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747426655; x=1748031455;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9CHB9wwhPWWYDPfcbzkF4W4PL5+L+ibby6qD0MEp0ho=;
        b=GdYEeJDDfD3RjcqYKqUep9q5mdFNRm3D51WqY6JY7NAyUsZfN5gaoZP72MOvrOwY4i
         Sz19s2Rz+HReJWg3asl3ryrcs5weaY08mw+6Q/ufC4aF1a3JiHvZ4gNWTBgxFD4FKlQf
         SYaSDswgBjT5wxckmhsT1/VMooG+QSiSgRWS5e7x7BFyLy3hw2Htb4pP3vTDUHhzgMWb
         v2MBn3TBmgPDsCmKic9s5oNlnT4u3xZORKQqkJ8eQlnPGKCXyyeIEXooS0cfuJs6ID4F
         L8c1VF+6fvrXSMqShzAXeb1R/LLYgvqdcl4JfRCgH0FIci6NBWmINmsPh2LfdtYyvgHW
         Nj2A==
X-Forwarded-Encrypted: i=1; AJvYcCUbhY11zzTNf+RHWONq6n0jrbL1lrDXZRkVS0vzY5zyc3HATYM1OELPoE+63+vCN3AiTjEcIVlQs3fPJis=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ2ei/lec9IXF6AAD83WAtrIQFiL4WcykWZrFrorOiz6ait2z9
	lcsdjdvpoWqr+Ms7sHMI2dhLpUHlR4VlxayyCiwvW21gvL/BcF/gvyQi4K6UgsLcC4svVFDEw5+
	xAA==
X-Google-Smtp-Source: AGHT+IGFEFtE0VXSdQwE4QdE7XZfEG6vLdmjRQWUL17HoHMazJClUlrpqfyCzriA1nm9WNAdMI+aZK50Dw==
X-Received: from qknqj9.prod.google.com ([2002:a05:620a:8809:b0:7cd:177:9ba4])
 (user=rmoar job=prod-delivery.src-stubby-dispatcher) by 2002:a05:620a:1a26:b0:7c5:592c:c27
 with SMTP id af79cd13be357-7cd46721b89mr656986685a.21.1747426654978; Fri, 16
 May 2025 13:17:34 -0700 (PDT)
Date: Fri, 16 May 2025 20:16:15 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516201615.1237037-1-rmoar@google.com>
Subject: [PATCH] kunit: tool: add test counts to JSON output
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

Signed-off-by: Rae Moar <rmoar@google.com>
---
 tools/testing/kunit/kunit_json.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/kunit/kunit_json.py b/tools/testing/kunit/kunit_json.py
index 10ff65689dd8..80fa4e354a17 100644
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
+		"misc": counts_json
 	}
 	test_group.update(common_fields)
 	return test_group

base-commit: c2493384e8110d5a4792fff4b9d46e47b78ea10a
-- 
2.49.0.1101.gccaa498523-goog

