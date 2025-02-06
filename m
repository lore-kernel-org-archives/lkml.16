Received: from slateblue.cherry.relay.mailchannels.net (slateblue.cherry.relay.mailchannels.net [23.83.223.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFD61A3165;
	Thu,  6 Feb 2025 13:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738848069; cv=pass; b=Q6UWoMVKHnAp3dQ1HK6XSTU4OTtQGwDD4ey/fQRUEiu2vm/0gfbGxSFsh7EuQPXHe78JKesDFfgA22vJEVpxzb2U4fWMAtTMoBT8WburXuMaYiySkLNCOzLBEK9BcRcvh/EYexL60OiGMvw3KHAGicvNr8j63pvoQk+Ho+b35l4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738848069; c=relaxed/simple;
	bh=QQ1sksRTflALfRywfKYPKVjO29Sf5P0qnE52M0N2ncs=;
	h=From:To:Cc:Subject:Message-ID:MIME-Version:Date; b=R+rI+zn0BGdSlb3P1mF3pnwqTyBSx7kmWpXqIxLpze9tSOaa+tr7DXc2XHJoyFsIdYc74MbFTeHbCih4gOrhJkShNLuTomrMmr4Gc8vfY/5Ky+YmSoQRZrEcvqqvYcIvVfFMnhGmAT1PeDf0Z2elTQQfr+EEO1+VvtNOfVTK+H8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai; spf=pass smtp.mailfrom=invicto.ai; dkim=fail (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b=S8/z1DMv reason="key not found in DNS"; arc=pass smtp.client-ip=23.83.223.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invicto.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b="S8/z1DMv"
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id E292116320D;
	Thu,  6 Feb 2025 12:04:16 +0000 (UTC)
Received: from fr-int-smtpout8.hostinger.io (trex-6.trex.outbound.svc.cluster.local [100.127.158.245])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 625FB161A40;
	Thu,  6 Feb 2025 12:04:15 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1738843456; a=rsa-sha256;
	cv=none;
	b=7IIj6Nk6GEeNG6esz0PPXjdK+6ieZWle1uOhye2DNhaa/A3HkLXphtx9Nx1leE7ZmByPz6
	QdFQ/+L/NYh6hSQd0if3s3TPlQmcTzO0sYX0mDgu41kWgs1UBuBoQvi0bgHQprPG4dLMjB
	iicQHPdG0rm431nLkXNf6q9bowDrxY4XdaVv+dOr/fGj4XRVW0q1kbyWwa8nRAjvblQS3k
	LDVr2mHpxqOvESA0AuqaGTz4RFPdzwhy4GjTjUeKC1uwwB+ZSahqxYMA/VljABG77Z5dq/
	gxSGe5gsKJ7r735WG2o4rg0k+jViZ8gYMbfrB29+YPOb7j3FIjVDvd8QjodqPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1738843456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=mjCsJoNg8ewzPGErTYrEIhf6SKdcXmfhMWvqFCbwvHw=;
	b=sBwZzipb9zPKe/V/drhliXJQvzFneIKDgiMzKkq+L8XlnevI3utvhNWylHxqqy+itTDqgX
	DiL0oyIECy7IPXKc64KhDC5vsLTm3Q4A4/XsSignJpzPvemEYQ2uOdl2VKNsaiAJQKAtYr
	Hi+60feOPMpmX6520T9pboHRKsp0tbtsJit58cqxEucVIZkdPkIRoe3WkVERrtnBKIe8jX
	tyWnNwb6pDUldvgps03WbHnddilKI+LGD+uXZOzXymn1Mkcm1IwGPToVHEDkBFiDtDDTSj
	XEeDR6ahsfmBNQtSDqmoiBxBLEKEVG0QEusGpboDQsJlBidFBXFtF072h3TVNg==
ARC-Authentication-Results: i=1;
	rspamd-8586946c78-fkmbs;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=kurti@invicto.ai
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|kurti@invicto.ai
X-MailChannels-Auth-Id: hostingeremail
X-Slimy-Reaction: 3500dae4304d9544_1738843456792_2763434041
X-MC-Loop-Signature: 1738843456792:3983901780
X-MC-Ingress-Time: 1738843456792
Received: from fr-int-smtpout8.hostinger.io (fr-int-smtpout8.hostinger.io
 [89.116.146.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.127.158.245 (trex/7.0.2);
	Thu, 06 Feb 2025 12:04:16 +0000
From: Alban Kurti <kurti@invicto.ai>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=invicto.ai;
	s=hostingermail-a; t=1738843453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mjCsJoNg8ewzPGErTYrEIhf6SKdcXmfhMWvqFCbwvHw=;
	b=S8/z1DMvT5JG1wOtbRVfk8P2iju0xLd8lKxDMmgfkJk/cOeW5pGuPJ2kvwS9hYBjgUZEU5
	HkH2sAw28x4QL0wJxiplq7D292yloFIFj9TXoLi4dAPqipwDDMVP28FGh8ne/FyDD9LAhQ
	Pvr6Q+8kI1qyzdZA9+6HuOtAZPONor8UkCxAPKRjaLO+ICkiezIxjIRZCmmd555Lj08JL2
	HcD+Ses6+JDNqH8R7GnUr5bFreO92N6gPmtLGMawOoc+3k6rrXa2qcvwESF4+2X/bBFFTc
	UIYERKthrDa2PAq8LkvYXzgYV5I4ZQwcvhaYTvGv77xy2jm/fd+11KzKqLV2LA==
To: Joe Perches <joe@perches.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Charalampos Mitrodimas <charmitro@posteo.net>,
	Mugel Ojeda <ojeda@kernel.org>,
	Alban Kurti <kurti@invicto.ai>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 RESEND 1/1] checkpatch: add warning for pr_* and dev_* macros without a trailing newline
Message-ID: <20250206120412.171171-1-kurti@invicto.ai>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Thu, 06 Feb 2025 12:04:13 +0000 (UTC)
X-CM-Envelope: MS4xfJdn7o0qsmaTwgLc2DMlNs9qKtJvh0fViXEaN9Piichtm0kIFevorYTgp0TtcqesuTiI3C1T1FEpUnwKDu1+hMDWFQZTPowv7AKxHH4YaWrS6OiqBiA8 Tz57E0VcRXAW+Ipoa6MPNxyZPd0/V2SPqESwdD5pw1OMBw8C/x7jw16IlJ/4ooZNHAlDAQ+Df8Vj0bPrswFOYYzPRQ+pCYLNHOsZEBWmNDafO0YT7epLDuDe X49NtUSUxRSYuHV0bBtYBwOXeazC8t+QBZRmBFGGCZr5lco+t9DnoZA954yXiFLwKSHgWKXSWCZQY832x3s/4qaHMoYp28dB5wfnEjfXQ0mFnRD+SqWTmk4h mj6988OqznLtxXAYk8bracrDYmOcHVIx86Hn5zZW4rVhdj7Up34=
X-CM-Analysis: v=2.4 cv=PMNd+uqC c=1 sm=1 tr=0 ts=67a4a53d a=9/DLicljd4JGVkZ5BRdAJQ==:117 a=9/DLicljd4JGVkZ5BRdAJQ==:17 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=LxQgENTTcpZERYXGLXgA:9
X-AuthUser: kurti@invicto.ai

Add a new check in scripts/checkpatch.pl to detect usage of pr_(level)
and dev_(level) macros (for both C and Rust) when the string literal
does not end with '\n'. Missing trailing newlines can lead to incomplete
log lines that do not appear properly in dmesg or in console output.
To show an example of this working after applying the patch we can run
the script on the commit that likely motivated this need/issue:
  ./scripts/checkpatch.pl --strict -g f431c5c581fa176f608ba3fdebb3c1051bad5774

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1140
Signed-off-by: Alban Kurti <kurti@invicto.ai>
---
Changelog since v1:
 - Strip comments before matching to avoid false positives.
 - Refactored the macro patterns for clarity.

 scripts/checkpatch.pl | 46 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9eed3683ad76..3256b5f31835 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3888,6 +3888,52 @@ sub process {
 			}
 		}
 
+# check for pr_* and dev_* logs without a newline for C and Rust files to avoid missing log messages
+    my $log_macro_pattern = qr{
+        \b
+        (
+            pr_(?:emerg|alert|crit|err|warn|notice|info|debug)
+          | dev_(?:emerg|alert|crit|err|warn|notice|info|dbg)
+        )
+        (!?)
+        \s*
+        \(
+        \s*
+        "([^"]*)"
+    }x;
+
+    if ($realfile =~ /\.(?:c|h|rs)$/) {
+        if ($rawline =~ /^\+/) {
+            my $cleanline = $rawline;
+
+            $cleanline =~ s/^[+\s]+//;
+            $cleanline =~ s/\r?$//;
+
+            $cleanline =~ s{/\*.*?\*/}{}g;
+            $cleanline =~ s{//.*}{}g;
+
+            if ($cleanline =~ /$log_macro_pattern/) {
+                my $macro_call = $1;
+                my $maybe_excl  = $2;
+                my $string_arg  = $3;
+
+                $string_arg =~ s/\s+$//;
+                if ($realfile =~ /\.rs$/ && $maybe_excl ne '!') {
+                    return;
+                }
+
+                if ($string_arg !~ /\\n$/ && $string_arg !~ /\n$/) {
+                    my $lang = ($realfile =~ /\.rs$/) ? "Rust" : "C";
+                    WARN("${lang}_LOG_NO_NEWLINE",
+                         "Usage of $macro_call without a trailing newline. Consider adding '\\n'.\n" .
+                         $herecurr);
+                }
+            }
+        }
+    }
+
+
 # check for .L prefix local symbols in .S files
 		if ($realfile =~ /\.S$/ &&
 		    $line =~ /^\+\s*(?:[A-Z]+_)?SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L/) {
-- 
2.48.1

