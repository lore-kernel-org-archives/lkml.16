Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27025277803
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744210294; cv=none; b=BkonTHKbuiHl5LF65Dlu9LPa2tRqVP/d/AmzKuBDRpTmAhI3/yE9/n4xrvfyzUzSCyo7nbdPWUUJNRE6zk5zGsLc1j4xIFr7zzVyAs1v2Z6i+rEUkCqoLnJqql/3Wx0hcqa1WZow2xM0I+h9UnFFRpQ/Dvki04zTjaHAOV4jB58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744210294; c=relaxed/simple;
	bh=4DUob6+eMdIz5RoHjq05jW8GZiksk7IQ/Wo8KKlT220=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gv4W+4WX2Jrci0zCKTpafafQEzjfu4NFkfqdvuSUukoGvIjCUhZPlgNC1lyycC9p+hqZ4rXaDsYe/JmZCsz9jt8lOaCm7OSLEScnD4vnl83GwDrR1YK8HTPnK/x30kRFEuBUNNwQPehwwA6xPGC1QLX6gJTVcKyd6c79TOpfk7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gS3C6qk7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gS3C6qk7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744210292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WBh/oxXtw+maKeUB3gFYpOwHzm3sbyiLyYnxbG7BaBM=;
	b=gS3C6qk7rlYeiJALHCldKpwWgNmjol5hhHiq9tjX7j72Z5fIk7aTkENCCEOLdKFKNTVTId
	NK8HWdFx2ES5tx1q2O5LkPH+HniIpmtM8GhiWp3DLiqhCJmahZmjZxqNJmiXLlEDOUF7Ym
	dGWmMa6zEk84zRb2QU3HdC25NoxYou4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-9c1vqYOtPfStxVuUDRWfWg-1; Wed, 09 Apr 2025 10:51:31 -0400
X-MC-Unique: 9c1vqYOtPfStxVuUDRWfWg-1
X-Mimecast-MFC-AGG-ID: 9c1vqYOtPfStxVuUDRWfWg_1744210290
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac293748694so158334366b.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 07:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744210289; x=1744815089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WBh/oxXtw+maKeUB3gFYpOwHzm3sbyiLyYnxbG7BaBM=;
        b=na19KZPp2l9LqqxdvVzQ+LOPCH+WzRJcEkTw1hn1J9xkndVyF2vuLz1AFkKtnD9BRQ
         CyfzxPidmgh3WUt+C/h/8lZaw4fMaA3d2bvikhaEap/YNCWAwNXZJw/VzcMjBA+aIZvS
         m8a/uO3dSvLc/aC3OMlVNn4F7USqcXJ3Tm5RUUx+1mwXFoKEijuRYkwdmAx5Q5BQrd4n
         CSzUg1I0vVcnSxCqgdRlYsNIJaor6wl6SSfYEYsyqAt7rBzk7CYtbqvezODd9VeDe0Kn
         TctNUwoLpzTqPLe2WW0L6vnN1jodYRDUTpI9rvQuKEwp17H39d6yVeBjDyinLaszUdDB
         LM5w==
X-Gm-Message-State: AOJu0YyYArtHMUfOHTTThHz2YvVMkRmqKYFM7EEQewHSb+gPwF6jR6vP
	6/Wsx2VPAySiZ9Ighmsva7SuzHphbDSYdDbW7UbIh1rvvMcN0qOoIYvnbqFDRhoADeXnHs57Syn
	+NKGFHhHx8ZmaVndZBZ/Nrg2D8M2+m+kIhpV0gSqoJzv0X1lERiiQWOEwPpO1OQ==
X-Gm-Gg: ASbGncvSciThWXA+fiqklnYZqq613B6RoXE26Vbrv9fKucI2uUOIhuVoRJyR6zqqJ+1
	Y1vFnFUIv948sg3/inuejFFVpe6El+JxpZAJjLpBp18nhAYKucpUSoFjW6oCcQzUBl7LtGRQvgL
	WwCLYgMecvhxqzVenFH0ZkF+MeqGZxGWSRuyedylbDKl9SbOjPvixD4eWc6PrzyGmjtgauMFFmt
	zIZZ51UunMI6NdizRcQKKnHiiPoEtb5S6ras2wlY/AmSfKp4u8txsufI6r5iG9/9nf+zjWsznsN
	T7Ctfb6l+ahGQdw0+L2L5bcybG7tIz8Pd8fC
X-Received: by 2002:a17:907:706:b0:ac7:95b0:d0fb with SMTP id a640c23a62f3a-aca9b6bc5f3mr342547866b.34.1744210289579;
        Wed, 09 Apr 2025 07:51:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy9g+DIrOAE96RAAhVeZY/4RHlv/rCrPjYfagAafONsEIrunVZvC7JorsmpzIoJdHOpPNMcw==
X-Received: by 2002:a17:907:706:b0:ac7:95b0:d0fb with SMTP id a640c23a62f3a-aca9b6bc5f3mr342545466b.34.1744210289199;
        Wed, 09 Apr 2025 07:51:29 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be9632sm112413866b.66.2025.04.09.07.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:51:28 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 6C98F19920EC; Wed, 09 Apr 2025 16:51:27 +0200 (CEST)
From: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org
Subject: [PATCH net] selftests/tc-testing: Add test for echo of big TC filters
Date: Wed,  9 Apr 2025 16:51:22 +0200
Message-ID: <20250409145123.163446-1-toke@redhat.com>
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
 .../tc-testing/tc-tests/filters/u32.json      | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/filters/u32.json b/tools/testing/selftests/tc-testing/tc-tests/filters/u32.json
index b2ca9d4e991b..67117f86fef0 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/filters/u32.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/filters/u32.json
@@ -353,5 +353,27 @@
         "teardown": [
             "$TC qdisc del dev $DEV1 parent root drr"
         ]
+    },
+    {
+        "id": "33f4",
+        "name": "Check echo of big filter command",
+        "category": [
+            "filter",
+            "u32"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "$TC qdisc add dev $DEV1 parent root handle 10: fq_codel"
+        ],
+        "cmdUnderTest": "bash -c '$TC -echo filter add dev $DEV1 parent 10: u32 match u32 0 0 $(for i in $(seq 32); do echo action pedit munge ip dport set 22; done) | grep \"added filter\"'",
+        "verifyCmd": "",
+        "expExitCode": "0",
+        "matchCount": "0",
+        "matchPattern": "",
+        "teardown": [
+            "$TC qdisc del dev $DEV1 parent root fq_codel"
+        ]
     }
 ]
-- 
2.49.0

