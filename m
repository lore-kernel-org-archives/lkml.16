Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EEB276057
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744281812; cv=none; b=a2ybw0QGJKiU1m3tnOCN9gGO8LLSi8IyIRUIpiGMT4XkoXUNJzh+5dKXnHPPrQaNgdlv/EjIWEihkTF7YGRdOgnSbAAHZ+23r1W5L0zFVUMdHEQs6hGntdeBGUV4AoQNmeOpGkVRhcc5jADL59Bldzd8JopwKLL8pe99aVSObl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744281812; c=relaxed/simple;
	bh=pZ5bB8vFUMnyv3cCOmpIUQLd2O2QWg60MWTovyHf87Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j3BBpEmqkRwoAyGarFJXBUJZMHZsP34xGsloi1Oc2yqIuBGT6+VOUjAdVl02bOLB6rDwV/bfOvX2Vt0jJhR8q99vA5mZrBEQcMtECTaZcswng5AyYIAUhOu9A2vtVwGcVUnYpCdI5ETYMJotmADBhPC0ESlg5EaRwMvgyRXub+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KDUKvJO9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KDUKvJO9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744281809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=o8NDC37k3QmU+NUsDCirFAdGiwD0pEhO0xSGio8XM74=;
	b=KDUKvJO9V2F3pHWxnl9FHQjF2fYU7Uxw9qiTJd6lEdjZ7rfTPGcAJihdN0oYY4JTxFxOTo
	TfrrUDMuLlo2ZWperFICrvwadPX/eMLNJ7ty6o6UecstoqJwoahwDq4qEhV46kC9RLp6mh
	VgHHmtECdAalslv5ZfeGX4QMYJnGq0g=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-9JMJmrNRMWqRdHVjZpRkig-1; Thu, 10 Apr 2025 06:43:28 -0400
X-MC-Unique: 9JMJmrNRMWqRdHVjZpRkig-1
X-Mimecast-MFC-AGG-ID: 9JMJmrNRMWqRdHVjZpRkig_1744281807
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac2db121f95so54381566b.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744281807; x=1744886607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o8NDC37k3QmU+NUsDCirFAdGiwD0pEhO0xSGio8XM74=;
        b=Df23qIoYjq6/EB2EEQK/m8rkMkN0e6FFaPzY6XyiJQaCjTFrLprAr26x0BgSj7MFcX
         LcZFtnzt9obNfuA99Wv+lMSU+ve6zPN2jai3ngKIMK18JSeW2t/fhpXfvhSmvWCd7P7L
         NxJ2kqGaWne8979kPZ8it4p5Pqcb3T4HuMiYdBMcassMeKdJvcyq73GTs45odOYNoaLQ
         Fy+Tl7pTe52GZb2M8yx6kw27Rei84Icfdjjl+e6qWTZZmAz3n3dzj+RpacJTLlPvgFJT
         y9xi3448GFl9kuduX8icCUpU+6ATW83HG6pvtE0tFOvtJpwTHGrVoSwht7eDrp7fHhbK
         a0BQ==
X-Gm-Message-State: AOJu0Yxt6dcPQWsUcggCRq3BuvY2BcJuYFHTudkvNP9Qu8aZg8edUf0W
	WYdh6ytHKotf+J/dAZCh6Ac6n3v8utejBetuUTm+4aE5IlMEo8/aNp52+c1vCEvbdZodQcmGt8F
	zXjHBahpc9Sabxiw809PdwW0HfIKVLQ3aw6Dus84qGQpxE/XWdqj/K8SHgPzVBA==
X-Gm-Gg: ASbGncv9t6por8rhUSW/fcWZFQJa3dZKbLvgaZjEDbUsp06B+leEWUvL4pdrYIkQ8FW
	gXbRuNX+aCKloHkz9HjdR8+lVkJKt56OQiDZtJrJJ13c/FaiHJRVauTyHWwbdavyZrqT/JiX6Fk
	o9kydUhz3J5aFEe0MixUUQd9oWfvYwpLNHq0WspJ+580mwrBfnOlY75FKSB3S2x7kMj9qvwKkhG
	SoVt8Gf6yFzQQyEjVfu5/3HSpf6JpznYOThH0FAHSTuIVgdt9vdIa901Cf3YqYQJV8x/t1XIeRE
	vsJGD3Yl
X-Received: by 2002:a17:907:3e11:b0:ac7:ec6f:a7c with SMTP id a640c23a62f3a-acabd1ddb9amr205751866b.13.1744281807222;
        Thu, 10 Apr 2025 03:43:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtZjy9wlPfZmZBnYMu79NO3yotRmZU9d09bLGlKvvf77owRla0L/nGxvLBfyuq+ABs6xAk7w==
X-Received: by 2002:a17:907:3e11:b0:ac7:ec6f:a7c with SMTP id a640c23a62f3a-acabd1ddb9amr205750266b.13.1744281806835;
        Thu, 10 Apr 2025 03:43:26 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb3df5sm249424366b.26.2025.04.10.03.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:43:26 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 4D3D11992280; Thu, 10 Apr 2025 12:43:25 +0200 (CEST)
From: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org
Subject: [PATCH net v2] selftests/tc-testing: Add test for echo of big TC filters
Date: Thu, 10 Apr 2025 12:43:21 +0200
Message-ID: <20250410104322.214620-1-toke@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a selftest that checks whether the kernel can successfully echo a
big tc filter, to test the fix introduced in commit:

369609fc6272 ("tc: Ensure we have enough buffer space when sending filter netlink notifications")

Signed-off-by: Toke Høiland-Jørgensen <toke@redhat.com>
---
v2:
- Move to infra/actions.json

 .../tc-testing/tc-tests/infra/actions.json    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/infra/actions.json b/tools/testing/selftests/tc-testing/tc-tests/infra/actions.json
index 1ba96c467754..d9fc62ab476c 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/infra/actions.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/infra/actions.json
@@ -412,5 +412,27 @@
         "teardown": [
             "$TC qdisc del dev $DUMMY ingress"
         ]
+    },
+    {
+        "id": "33f4",
+        "name": "Check echo of big filter command",
+        "category": [
+            "infra",
+            "u32"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "$TC qdisc add dev $DUMMY parent root handle 10: fq_codel"
+        ],
+        "cmdUnderTest": "bash -c '$TC -echo filter add dev $DUMMY parent 10: u32 match u32 0 0 $(for i in $(seq 32); do echo action pedit munge ip dport set 22; done) | grep \"added filter\"'",
+        "verifyCmd": "",
+        "expExitCode": "0",
+        "matchCount": "0",
+        "matchPattern": "",
+        "teardown": [
+            "$TC qdisc del dev $DUMMY parent root fq_codel"
+        ]
     }
 ]
-- 
2.49.0

