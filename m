Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78704146593
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 02:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749693921; cv=none; b=IVljWOoFJ3qlbAYEueU2G33K6h9pOu+snYgPAflngbZT5f0Rpo5T1T1WEF9/KbmCKPwk0E8WTKz/a7RAWH83QqcAAQcx1L2qnbeXokwBoSao6rH9BYv7wK8qCY/yOuV6h4y7CoTVftaw5R+prmktAgvNJyFUipVqubQJC4PU1rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749693921; c=relaxed/simple;
	bh=2iZcPuSq4u3mT8192xmrQCN4CCRuJttZmz6SuIQVGA0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=FMkS+8GBRGKh4+qw/WVY+acJEg//Xhw99D45bQc8O7HYrg0nCDUD+iDTx5q9AW9LkP19lFOpthu/JKgkO+3h6iM91Lo6RvbbQnjLeP9poLIZl5bzbN1lhpBVEDO8RXd9uaWzyd/jL+R5wlWllMcdoK6AqLb15Xf/ubaCI6SD6vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yuyanghuang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZwziLlIL; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yuyanghuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZwziLlIL"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2fb347b3e4so236972a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 19:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749693919; x=1750298719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xv0JTkG5uyDPWXrF70zjAZrgmUAzL1bZfsQzVGVkSoE=;
        b=ZwziLlIL1AHZZMjgnPzC+FBaJcBX8gdxIDytbptPEOzOHs8s8U4I7Vw/GVaTctviGM
         Xut7t6CoUJU0s1jTwvD1lSebBB6HO2boudzMUSm/XXZ0bb99jRhQFf3HPRun7MBWP00T
         g02oFI14tQ69OkvZNaHD2DamgK/zf6g1XdgV2R0Nb6tuguwlpyzZ/ZeqsF5eRO41X9cP
         JnYqTDxNGV8UBDohnc2J0poea3QN9NvxUVp5aA2x3Zc7Mmge4HzX2U4Xtnn2Hg9/jTLi
         jnOvaU0/Snv6MwoX9IOBLIJAaERsiO8KY5Pero6Ts9IT0kenmvEjla4NpnltrYCEAvMu
         GcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749693919; x=1750298719;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xv0JTkG5uyDPWXrF70zjAZrgmUAzL1bZfsQzVGVkSoE=;
        b=kKRWySYZ8nRT+N6+AfFf60fHMEZ+mTDWfjg9/VdDS1hNceY5owkgarrWB5zRTdsZ8v
         TfwdEeWGwCaNqMWay2r8BotAPudhTUwYmhd5lQ4cOZNOIcgIV3qKrCYCVnZWIJlTSBdE
         Bih4jtVbq77LCx6o0GGfvlSwbowR4KfqAim2t3BWiAasu+9C6w7bSBeZkK8w2oJWea76
         W6RZmV5iAKfGYAap0BVqCMhcDB5RZlC1qkURUmZaHptUh77sS/0KIdKrtp5cy2jBjVjI
         ju+aowkDAYoyDFfro96bJFodmOm9e5IG6inDN5tEth0PC+jGJEkhcGXrFzV9bjPyTzv1
         mTfw==
X-Forwarded-Encrypted: i=1; AJvYcCWsceDurtSOF8o27zlgDcI4tBCn/CM8g6ItbP6sygajXT7ZMO9j21tbDTjw3NIxJvjAiyHmZNfVrcBSUCg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3jgweDyW/MPRCt2mOYxn/9YC7fTJrzhwNmc4nXvHLAyfT8mPf
	wq69fVcCo89CYKbP9dXZT1nHT5llSjBaC47+PD3Xmmut7ALOkxCiWf+N52gByj5SlIwruV1wp1v
	mRcToVGyniKmMeI+7rKLTrPMN4g==
X-Google-Smtp-Source: AGHT+IFBp0y+xZPWqUUpwKS8/d73C1p1eEFAW1eWlQGGguwPVGy64ZLf4FKu7oHpolvJ+WaW+LWyPcSt7P+eJfGJFg==
X-Received: from pgcz18.prod.google.com ([2002:a63:7e12:0:b0:b2c:2139:ff4])
 (user=yuyanghuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:9144:b0:21a:e090:7b88 with SMTP id adf61e73a8af0-21f978a5c8emr2575248637.21.1749693918822;
 Wed, 11 Jun 2025 19:05:18 -0700 (PDT)
Date: Thu, 12 Jun 2025 11:05:14 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250612020514.2542424-1-yuyanghuang@google.com>
Subject: [PATCH net-next, v3] selftest: Add selftest for multicast address notifications
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
make -C tools/testing/selftests TARGETS=3Dnet
TEST_PROGS=3Drtnetlink_notification.sh \
TEST_GEN_PROGS=3D"" run_tests

Cc: Maciej =C5=BBenczykowski <maze@google.com>
Cc: Lorenzo Colitti <lorenzo@google.com>
Signed-off-by: Yuyang Huang <yuyanghuang@google.com>
---

Changelog since v2:
- Move the test case to a separate file.

Changelog since v1:
- Skip the test if the iproute2 is too old.

 tools/testing/selftests/net/Makefile          |   1 +
 .../selftests/net/rtnetlink_notification.sh   | 159 ++++++++++++++++++
 2 files changed, 160 insertions(+)
 create mode 100755 tools/testing/selftests/net/rtnetlink_notification.sh

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests=
/net/Makefile
index 70a38f485d4d..ad258b25bc9d 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -40,6 +40,7 @@ TEST_PROGS +=3D netns-name.sh
 TEST_PROGS +=3D link_netns.py
 TEST_PROGS +=3D nl_netdev.py
 TEST_PROGS +=3D rtnetlink.py
+TEST_PROGS +=3D rtnetlink_notification.sh
 TEST_PROGS +=3D srv6_end_dt46_l3vpn_test.sh
 TEST_PROGS +=3D srv6_end_dt4_l3vpn_test.sh
 TEST_PROGS +=3D srv6_end_dt6_l3vpn_test.sh
diff --git a/tools/testing/selftests/net/rtnetlink_notification.sh b/tools/=
testing/selftests/net/rtnetlink_notification.sh
new file mode 100755
index 000000000000..a2c1afed5023
--- /dev/null
+++ b/tools/testing/selftests/net/rtnetlink_notification.sh
@@ -0,0 +1,159 @@
+#!/bin/bash
+#
+# This test is for checking rtnetlink notification callpaths, and get as m=
uch
+# coverage as possible.
+#
+# set -e
+
+ALL_TESTS=3D"
+	kci_test_mcast_addr_notification
+"
+
+VERBOSE=3D0
+PAUSE=3Dno
+PAUSE_ON_FAIL=3Dno
+
+source lib.sh
+
+# set global exit status, but never reset nonzero one.
+check_err()
+{
+	if [ $ret -eq 0 ]; then
+		ret=3D$1
+	fi
+	[ -n "$2" ] && echo "$2"
+}
+
+run_cmd_common()
+{
+	local cmd=3D"$*"
+	local out
+	if [ "$VERBOSE" =3D "1" ]; then
+		echo "COMMAND: ${cmd}"
+	fi
+	out=3D$($cmd 2>&1)
+	rc=3D$?
+	if [ "$VERBOSE" =3D "1" -a -n "$out" ]; then
+		echo "    $out"
+	fi
+	return $rc
+}
+
+run_cmd() {
+	run_cmd_common "$@"
+	rc=3D$?
+	check_err $rc
+	return $rc
+}
+
+end_test()
+{
+	echo "$*"
+	[ "${VERBOSE}" =3D "1" ] && echo
+
+	if [[ $ret -ne 0 ]] && [[ "${PAUSE_ON_FAIL}" =3D "yes" ]]; then
+		echo "Hit enter to continue"
+		read a
+	fi;
+
+	if [ "${PAUSE}" =3D "yes" ]; then
+		echo "Hit enter to continue"
+		read a
+	fi
+
+}
+
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
+kci_test_rtnl()
+{
+	local current_test
+	local ret=3D0
+
+	for current_test in ${TESTS:-$ALL_TESTS}; do
+		$current_test
+		check_err $?
+	done
+
+	return $ret
+}
+
+usage()
+{
+	cat <<EOF
+usage: ${0##*/} OPTS
+
+        -t <test>   Test(s) to run (default: all)
+                    (options: $(echo $ALL_TESTS))
+        -v          Verbose mode (show commands and output)
+        -P          Pause after every test
+        -p          Pause after every failing test before cleanup (for deb=
ugging)
+EOF
+}
+
+#check for needed privileges
+if [ "$(id -u)" -ne 0 ];then
+	end_test "SKIP: Need root privileges"
+	exit $ksft_skip
+fi
+
+for x in ip;do
+	$x -Version 2>/dev/null >/dev/null
+	if [ $? -ne 0 ];then
+		end_test "SKIP: Could not run test without the $x tool"
+		exit $ksft_skip
+	fi
+done
+
+while getopts t:hvpP o; do
+	case $o in
+		t) TESTS=3D$OPTARG;;
+		v) VERBOSE=3D1;;
+		p) PAUSE_ON_FAIL=3Dyes;;
+		P) PAUSE=3Dyes;;
+		h) usage; exit 0;;
+		*) usage; exit 1;;
+	esac
+done
+
+[ $PAUSE =3D "yes" ] && PAUSE_ON_FAIL=3D"no"
+
+kci_test_rtnl
+
+exit $?
--=20
2.50.0.rc1.591.g9c95f17f64-goog

