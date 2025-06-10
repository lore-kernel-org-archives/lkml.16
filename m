Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5DE28C021
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548451; cv=none; b=ETzL7YVaL80NjQpqDWXKVCCxe2+ZFPnxDatO66WUcG8xLjKwufojqi3/wdB1mghD71MXRXeB/LA5/5Om4coWhuflNxYnCZx2czLnLR+G0kFUb5Yz97QmC/3IfQFSkbC3ESrxc7bopvpKomC6Yl4givhcFcKKFLjteKtD/9M3KCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548451; c=relaxed/simple;
	bh=Ay5oQohGM+cVjnNWHVNcpUKrCpFL8jgt+c4zZIHKDB0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=DHWqbH/XI66x8oUAxkJUtwO9z9olD5Fr5TtiTYOsfCamiP18FrMljEDr7Aa72FVZ15Myw/LXAVuLMyCYefqotFT6bCJJFvuDMHJLCfYWaGpDT4d3PA5BR4Yr7JDp+snmaPN2CcbOBgEb64TyH+4zyxeEaKunelwc0d2k1ajN6sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yuyanghuang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HzN+yh8v; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yuyanghuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HzN+yh8v"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-235c897d378so49841885ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749548449; x=1750153249; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4xOt1jqHtKfWjw2Okk5Lx4VTTX7yg4srSCqsBU9bfdk=;
        b=HzN+yh8vBao3UrbjV8zQ3qtyO/iV9GD7JC+7CmOV2g4QYiRrpuuYCpovywO8iI/Awv
         6Ru8HuKJ88jE9+mDpZzoPx3kYMpVrK5A5b/lDGaNtmQDFaBfLfclqzdHIc3jrgWLG90Z
         f8k/bYfv3c2Q9vPUYRR/e3SBpvPQBP41OtMxVOeO+b6YQAojrotIv/9cWxA6iAKlrAjG
         zQh3XtQkx0UonaBONHfNs20D2amV4tk8iRxkfOInyKy2e7j/cgFP9fHMHwlOYhEsRT63
         uJD6JfhFIoCZPziSWqnU9gbP11S/G0HKwXD/guK77nuUxqPEgIKt6jvdih6SKz47SIIU
         0Gjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548449; x=1750153249;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xOt1jqHtKfWjw2Okk5Lx4VTTX7yg4srSCqsBU9bfdk=;
        b=QF47EhRStsLp7gNsgynzTZ7SqAcLueUPO7S1wIVX8jbiwwfjm8+L8zuuae5HmPydbG
         48vxUGRprrLwk1VsfBaXfxHo0CYNu3qY82tjo1hTLnuhvvoN53akG6xPsPF9ewRV3b7V
         zoev3eOi9FmdadeK5teJX5aH3r2wTxdPqnD2eXwbRkLKQohwMJ2FMGTV9DLFPonI8081
         0nlBs5dMa1DOHQqdN+6udRGSY3g6PAX94qThJs62PJ0ksmNUdInosfPUXR2+gmqv180P
         D/vYPmCRanacaBew+9bMhtEh6/MuNR4MraHqQtvLlKMxzXgzCsknK5NlaYFb1RPUANOx
         08mA==
X-Forwarded-Encrypted: i=1; AJvYcCX0KuYdQwH1KZOfM0lcRAQnby6JZwYmV2uaAB8CBJlARkaVSQw//sQ0pmxutqAcw+pv800o1pX/iTwKRHw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxOukzeUs67QFsD1TQIivMIn9rnTs3dY7yyLv2WL82CtA1MdQs
	IisyAzvt57vq4qtM8wghURMyZxuBFeDiFaUIaSrkYeb9py4aowiyNTOVy4fC6wa6DvFZlxK6ru3
	fn6ErZCnHwxWWp9kqXxCEqsmntg==
X-Google-Smtp-Source: AGHT+IHsPq+vdV/YlOTd0sWoiyauA4/hsj5ntF/YMP67oggciRP0ROMwuW5E9EMI6TMVeBy2YCAWZSfoy5JflTd8og==
X-Received: from pjz3.prod.google.com ([2002:a17:90b:56c3:b0:311:c20d:676d])
 (user=yuyanghuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:76c1:b0:235:f4f7:a62b with SMTP id d9443c01a7336-236383918d9mr19990545ad.41.1749548449493;
 Tue, 10 Jun 2025 02:40:49 -0700 (PDT)
Date: Tue, 10 Jun 2025 18:40:45 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250610094045.3829667-1-yuyanghuang@google.com>
Subject: [PATCH net-next, v2] selftest: Add selftest for multicast address notifications
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

Changelog since v1:
- Skip the test if the iproute2 is too old.

 tools/testing/selftests/net/rtnetlink.sh | 39 ++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tools/testing/selftests/net/rtnetlink.sh b/tools/testing/selft=
ests/net/rtnetlink.sh
index 2e8243a65b50..74d4afb55d7c 100755
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
@@ -1334,6 +1335,44 @@ kci_test_mngtmpaddr()
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
+	if [ ! -e "/proc/$monitor_pid" ]; then
+		end_test "SKIP: mcast addr notification: iproute2 too old"
+		rm $tmpfile
+		return $ksft_skip
+	fi
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

