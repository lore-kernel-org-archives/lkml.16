Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40851FE46D
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 09:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748337542; cv=none; b=DwZLLK2ToYHhthqOroMZH0g/X2ItM84imeAHyp2eKF7wYGhgVRyg5jkGjboQPeEwUy22blA0YUInBfn3QGEf4U8tISrer8vU6Ebdr/e6GK6qdwe0fnMTu/caJ6TnVVwm7Ln6RP+Tag5h83qms/2JsnNRDOfIzpnzsfuhp3Mj3YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748337542; c=relaxed/simple;
	bh=ZcsiE8VsJGY/SJgauAXul2G1y5iuid8pqouGSPzQaOM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=t04nCchBgXlWicXj7fX4LWgj4ycM5tKjj21t8pLpzUWx4CFDXriHBKcfYzw8BDUMQhrYEFG1lsoqw5Y+4QN2lwUbz8uSzsxzYRJv6tbfonMfuZ/AMmbrSO12jd9ybmvSH8eifURRNi/ju44mlr8lX3jNWwVNQWAhM/BpA5NZT2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yuyanghuang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y75tqTOl; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yuyanghuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y75tqTOl"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-31147652b36so2218972a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 02:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748337540; x=1748942340; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5+6sb9vR4ahmHqnY0N3Qi6sQkZ9rrv10CM4PGUMbiSo=;
        b=y75tqTOl3L7sMt7z8IJAZ8pl8dQMAAgt92wXANWZt3h2cA2dWqb3d1h9jT40Yv/8zw
         HcPVrrNvuBDosv0ZWFYt1eke2wcaWoJAewwmz8d/0dv3//bUQWVm4z4rNM3IyeKTLr4W
         2khLrZoSH8rYtJeVHxMHjR7rPeZ39tGDXN0rig34fEvMavirvjAgoVCNUBect0UIBvcw
         ryhNdTz3yB6r7xoZtoPa+ic0vnq5N31HYeb73i77GS6owlXbiIXwe9EUDkbOy8k/H3uW
         Iq6SGZhUkRNdqcE6uUI0XWQbB316x1viI0dzpl17RAVsukawduwvHfG7xZ8+etTJKowA
         Q53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748337540; x=1748942340;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+6sb9vR4ahmHqnY0N3Qi6sQkZ9rrv10CM4PGUMbiSo=;
        b=NSHHuo0xEjvtWNNomLh4wX2T30r0WjRBg3BjSwMENW+GgCgP8z8ox6kwW2wirkxICv
         tef+QTmIeZXuTgP0dGNpCC7G2KqjVfkhFKCitIgPPu+v/oRg6zzkQOqaxcaztgiZzvOD
         wd8598n2qLa6iuvO4QgmHkhSvkgAR+Y9ybo07p9tHFtRcMl1XSWphZlxXMNJPE3viWCg
         sUVx6gBYT3Q83XFzVqeZ17s16LghJ5vWlAYxYVStmrQ3zNzPzssbKMBbPja5Db94UvvB
         0rVLgDWU9lob/LOLGW6O55Z+ivXn0eKRET9qfadX7/L2FiaFPM/dRX3+3dzBi5yAvSyZ
         ounQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH1FXpRoNN1Y5xl2uowctq+WX23c7eQfwOitvAr2eDkRGuvOPyVCpQVsi2PyPGinyHLkoa8Mh8AXqGcVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxPzc9iLPsX3elMpvkfC0INqPwLQgOHvc+XYVNfYT5HdKshX0z
	ehuz19mav7zZSRywpPuZIZfT9FcFk6Rs3y5/6RAv6LEBrSQemuzcpiYhLBjb7D/0Ffp8q5pqxnY
	SKndSeLJO93+w679t9HMmMNZXrg==
X-Google-Smtp-Source: AGHT+IEKkHTv4glwErR8dVXArbvKUI6+TJ+cA7jQ653G2DWqcR73lUfYneMuq9cYAAq8g6aexkFnA+JWaq+2vaSkJA==
X-Received: from pjqq6.prod.google.com ([2002:a17:90b:5846:b0:311:4c94:2910])
 (user=yuyanghuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3f0d:b0:2f5:88bb:118 with SMTP id 98e67ed59e1d1-31111657d33mr16592647a91.22.1748337540290;
 Tue, 27 May 2025 02:19:00 -0700 (PDT)
Date: Tue, 27 May 2025 18:18:55 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250527091855.340837-1-yuyanghuang@google.com>
Subject: [PATCH net-next] selftest: Add selftest for multicast address notifications
From: Yuyang Huang <yuyanghuang@google.com>
To: Yuyang Huang <yuyanghuang@google.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Maciej=20=C5=BBenczykowski?=" <maze@google.com>, Lorenzo Colitti <lorenzo@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This commit adds a new kernel selftest to verify RTNLGRP_IPV4_MCADDR
and RTNLGRP_IPV6_MCADDR notifications. The test works by adding and
removing a dummy interface and then confirming that the system
correctly receives join and removal notifications for the 224.0.0.1
and ff02::1 multicast addresses.

The test relies on the iproute2 version to be 6.13+.

Tested by the following command:
$ vng -v --user root --cpus 16 -- \
make -C tools/testing/selftests TARGETS=3Dnet TEST_PROGS=3Drtnetlink.sh \
TEST_GEN_PROGS=3D"" run_tests

Cc: Maciej =C5=BBenczykowski <maze@google.com>
Cc: Lorenzo Colitti <lorenzo@google.com>
Signed-off-by: Yuyang Huang <yuyanghuang@google.com>
---
 tools/testing/selftests/net/rtnetlink.sh | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tools/testing/selftests/net/rtnetlink.sh b/tools/testing/selft=
ests/net/rtnetlink.sh
index 2e8243a65b50..9dbcaaeaf8cd 100755
--- a/tools/testing/selftests/net/rtnetlink.sh
+++ b/tools/testing/selftests/net/rtnetlink.sh
@@ -21,6 +21,7 @@ ALL_TESTS=3D"
 	kci_test_vrf
 	kci_test_encap
 	kci_test_macsec
+	kci_test_mcast_addr_notification
 	kci_test_ipsec
 	kci_test_ipsec_offload
 	kci_test_fdb_get
@@ -1334,6 +1335,39 @@ kci_test_mngtmpaddr()
 	return $ret
 }
=20
+kci_test_mcast_addr_notification()
+{
+	local tmpfile
+	local monitor_pid
+	local match_result
+
+	tmpfile=3D$(mktemp)
+
+	ip monitor maddr > $tmpfile &
+	monitor_pid=3D$!
+	sleep 1
+
+	run_cmd ip link add name test-dummy1 type dummy
+	run_cmd ip link set test-dummy1 up
+	run_cmd ip link del dev test-dummy1
+	sleep 1
+
+	match_result=3D$(grep -cE "test-dummy1.*(224.0.0.1|ff02::1)" $tmpfile)
+
+	kill $monitor_pid
+	rm $tmpfile
+	# There should be 4 line matches as follows.
+	# 13: test-dummy1=C2=A0 =C2=A0 inet6 mcast ff02::1 scope global=C2=A0
+	# 13: test-dummy1=C2=A0 =C2=A0 inet mcast 224.0.0.1 scope global=C2=A0
+	# Deleted 13: test-dummy1=C2=A0 =C2=A0 inet mcast 224.0.0.1 scope global=
=C2=A0
+	# Deleted 13: test-dummy1=C2=A0 =C2=A0 inet6 mcast ff02::1 scope global=
=C2=A0
+	if [ $match_result -ne 4 ];then
+		end_test "FAIL: mcast addr notification"
+		return 1
+	fi
+	end_test "PASS: mcast addr notification"
+}
+
 kci_test_rtnl()
 {
 	local current_test
--=20
2.49.0.1204.g71687c7c1d-goog

