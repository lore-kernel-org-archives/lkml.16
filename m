Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664501C549F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 03:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750305082; cv=none; b=Kbf6wqzy3wKAl6MPTOUi/60AchKdswGK4T7q6VUKJt7pg22Q7zB7JJbmUfZsKqfPIbQsIFq02cHx1qEbfq39PLGDvAH20tdH6XXympXTcLgNZrKnAyIzJDtI4GQxcammekYGu6vTm4TRcVxUfZQHUEmwuqeFTqN2/UPHTRcFyE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750305082; c=relaxed/simple;
	bh=VpNyW0ROWgfUYLE5WLLIP0usn2NYLRidluOWP+fdkZQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Yt906NXhP0mK0JhcsvkfGqwsQx0/DxPh3/TEt7ahx/w6MaXMi+OJ2XwKKUZvDgKOm0Cz4nIc6SntcxGu2ScK6IZ5hJJ2f61HX8YgIU90GB82Lr073UkWXvfAfrKOEbF7+l0GyHneb9mdlFEW3mS20buxURHO3HW7Ekj3GexkURk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yuyanghuang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wp/wHoUl; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yuyanghuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wp/wHoUl"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2f103f6074so292907a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750305080; x=1750909880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XGFmtrSOLZS5chqBC2J4MeJGoAaFVE8hTVr40c3kU0c=;
        b=wp/wHoUlLGqB/5VwqbixVu7v69a8iMdnJd+5cLLB6ZMVzgh1DjHrSszdBOGXgoUGtG
         TJNtN08V5XBzvfMIpDs3L8ibTRzNW/7sLl0pA6FewvfdhawVfkyEF9FVU7gQX8KtC38a
         eHDvxGCfSjbg9IensjwxsXC43L2PJAs5q+T527a5/U23CA71AzfyGJEEFdDu0xSsu1H6
         U+hEPnICJfyjVOXFRY6iEIL841jjplMaTkbgOm2GdSLoISyh7WEwFZgLSLLI2pPdVy02
         oK1P1vntKBYJG5okJNzmqlIBuCTU+EMhwbkc7YToYvX4aA3PotD0kaRoKQDFkhNdHdGt
         hwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750305080; x=1750909880;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGFmtrSOLZS5chqBC2J4MeJGoAaFVE8hTVr40c3kU0c=;
        b=Te0vr+UsmoN97vgKpIOx0x4j+sMDcsuowc9ab3A8kOSVRxrV1fuCZWfhWat5cIz9jc
         Z2NJ7S1R3pKbJfTTOxzzO5btMRwAfPdgDtL5ZAv/aQT5YvNpGsAb9wH4EzutdN50gvm5
         lKW4o3hjSJKIBu5dhgoox5W47JztRqKSJJsjhP0ZsW9BkZMR71tT6yVOwMrh/KFnRUu0
         helzl2gzKLgmH4JXivzVRFBm2aKuJO7EtoYmEYjbzFdNr3l4g6lKj6ySCjLrhELIRAYD
         NosTLBbA8FuQVl/R306rUkVVSRtIvR1fLwhWomKFTtHxTPIa2Rq2cCdOEfgQjyseFGgF
         c1yQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+lixUszhIgyH2oLNnELEnLEmngvIckEoD1atj1x1AgKs3LYEHaqC2ZjzwTMuFGHl5HmjoqHgIlxxA/0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrpbdo98u5BmrWQIRuhZTrR54oDN26YrOtMobUpQtkbxf/f/sP
	o5fC6SIJPU4aJuaqvLIzeA8qiBaFzM8pUijvIup6RUP4fKftHlNl/9tpa7P0W4HlXGwAt78eZmy
	1yugBOPOqh0e67xt8JmWcZtkO6Q==
X-Google-Smtp-Source: AGHT+IGwHFGjFUNh199bLDHACwbMp86uGWnYQdiUa3Y7XA1SzRiRfsE0FPtlC2echswDJTSrh8srQKkV2amRC6Ze5w==
X-Received: from pja15.prod.google.com ([2002:a17:90b:548f:b0:312:fb53:41c0])
 (user=yuyanghuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:c107:b0:311:ad7f:3281 with SMTP id 98e67ed59e1d1-313f1ca70acmr35957972a91.12.1750305080597;
 Wed, 18 Jun 2025 20:51:20 -0700 (PDT)
Date: Thu, 19 Jun 2025 12:51:16 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.701.gf1e915cc24-goog
Message-ID: <20250619035116.3761921-1-yuyanghuang@google.com>
Subject: [PATCH net-next, v2] selftest: add selftest for anycast notifications
From: Yuyang Huang <yuyanghuang@google.com>
To: Yuyang Huang <yuyanghuang@google.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Maciej=20=C5=BBenczykowski?=" <maze@google.com>, Lorenzo Colitti <lorenzo@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This commit adds a new kernel selftest to verify RTNLGRP_IPV6_ACADDR
notifications. The test works by adding/removing a dummy interface,
enabling packet forwarding, and then confirming that user space can
correctly receive anycast notifications.

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

Changelog since v1:
- Remote unrelated clean up code.

 .../selftests/net/rtnetlink_notification.sh   | 44 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/rtnetlink_notification.sh b/tools/=
testing/selftests/net/rtnetlink_notification.sh
index 39c1b815bbe4..3f9780232bd6 100755
--- a/tools/testing/selftests/net/rtnetlink_notification.sh
+++ b/tools/testing/selftests/net/rtnetlink_notification.sh
@@ -8,9 +8,11 @@
=20
 ALL_TESTS=3D"
 	kci_test_mcast_addr_notification
+	kci_test_anycast_addr_notification
 "
=20
 source lib.sh
+test_dev=3D"test-dummy1"
=20
 kci_test_mcast_addr_notification()
 {
@@ -18,7 +20,6 @@ kci_test_mcast_addr_notification()
 	local tmpfile
 	local monitor_pid
 	local match_result
-	local test_dev=3D"test-dummy1"
=20
 	tmpfile=3D$(mktemp)
 	defer rm "$tmpfile"
@@ -56,6 +57,47 @@ kci_test_mcast_addr_notification()
 	return $RET
 }
=20
+kci_test_anycast_addr_notification()
+{
+	RET=3D0
+	local tmpfile
+	local monitor_pid
+	local match_result
+
+	tmpfile=3D$(mktemp)
+	defer rm "$tmpfile"
+
+	ip monitor acaddress > "$tmpfile" &
+	monitor_pid=3D$!
+	defer kill_process "$monitor_pid"
+	sleep 1
+
+	if [ ! -e "/proc/$monitor_pid" ]; then
+		RET=3D$ksft_skip
+		log_test "anycast addr notification: iproute2 too old"
+		return "$RET"
+	fi
+
+	ip link add name "$test_dev" type dummy
+	check_err $? "failed to add dummy interface"
+	ip link set "$test_dev" up
+	check_err $? "failed to set dummy interface up"
+	sysctl -qw net.ipv6.conf."$test_dev".forwarding=3D1
+	ip link del dev "$test_dev"
+	check_err $? "Failed to delete dummy interface"
+	sleep 1
+
+	# There should be 2 line matches as follows.
+	# 9: dummy2    inet6 any fe80:: scope global
+	# Deleted 9: dummy2    inet6 any fe80:: scope global
+	match_result=3D$(grep -cE "$test_dev.*(fe80::)" "$tmpfile")
+	if [ "$match_result" -ne 2 ]; then
+		RET=3D$ksft_fail
+	fi
+	log_test "anycast addr notification: Expected 2 matches, got $match_resul=
t"
+	return "$RET"
+}
+
 #check for needed privileges
 if [ "$(id -u)" -ne 0 ];then
 	RET=3D$ksft_skip
--=20
2.50.0.rc2.701.gf1e915cc24-goog

