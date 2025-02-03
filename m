Received: from buffalo.tulip.relay.mailchannels.net (buffalo.tulip.relay.mailchannels.net [23.83.218.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FF51E7C03;
	Mon,  3 Feb 2025 20:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738613520; cv=pass; b=Vxy8S587vH5cOO+E2YsbryLWTFBuY+E5zgM9v+CLHYgwjbUW36ekiszhf5//Ia7YOjUTEYPMq+KmhWWK//zPjgqkxX+aTtvhR2KknPcNTW1zdRo7evtOFBFKlnTWUNx+3X3PrLSwaujtqNw1kBsqq2GjHgt15qUmG/eJAG7nfjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738613520; c=relaxed/simple;
	bh=k98bQzDI9RwM3220WwTRBw0NBLkW7u2Vfu4HJD6Ly7U=;
	h=From:To:Cc:Subject:Message-ID:MIME-Version:Date; b=dIjPy2xxtwq2UhIAoJQX+0JDCaSP588Y41PYk5h+w3wEVbhE8lgMSsQBuzTRRMVX9ABdVwa1gnv/1JBeFonEdg4FACFllnGbcMHNwccTuGforZf9npx75N/8dGbDxZJWJTvlKA+yS14Zicc4EpKpzYWIkAD+ULaIUOD4EAgeEvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai; spf=pass smtp.mailfrom=invicto.ai; dkim=fail (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b=AaXCNLBA reason="key not found in DNS"; arc=pass smtp.client-ip=23.83.218.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invicto.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b="AaXCNLBA"
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 61B1122C57;
	Mon,  3 Feb 2025 20:11:56 +0000 (UTC)
Received: from nl-srv-smtpout6.hostinger.io (trex-6.trex.outbound.svc.cluster.local [100.127.143.53])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id EFC8B22F37;
	Mon,  3 Feb 2025 20:11:54 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1738613515; a=rsa-sha256;
	cv=none;
	b=jwnycTtzplSqmoVJ/SpKSBeeiisFrvXNUxns6RwY8UPPPLbyx74Z2rKQ5NkRoIODbsiua/
	HPRd+Mvf9I9wW0uN5rGUKMNeF468/FdWYaLO4DY9EcM/u1WTNgFTL9EZ2j3B1x0b4DLyOo
	OfK1MGF0sxl+yGTLwNR/3apUN2j+8NwrhljhA3rQh1n7xUT2AiJh1YT4JVymw4Evak6rye
	dCyZ+AUMnBG+7XmQcaaNMxlDtWZKitvrTS3skYt2fz+YhTVNtSn6lBIjsjcTbvEDfQkJXW
	+BsvB/dzbXPPpNVp2frYhoJ20iMt4dbD40lf6QkGwnlmkPAVtBY2xcAglfEi0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1738613515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=Ab6R3x0iq4MlY/imzAVkZkBE2JedJ/qGVM3bp8PX4R0=;
	b=4ihuR+WXOxh/wRH8M1GFHHd+fqpyhb7MNXy4acVTeCpo4iQW/CWnVqxpPiZEO04h7nHgta
	NKGk3dFijNIeZRNJdI0+qa34iR5yqXflhHDDGJs5hYTZWtXRl3LPDZEW7R3dMjH58tB7IY
	zSlBfsXVaTOwFS1CG59FmMqHXRMYXgf1JQShXVXn8k8BB+NgDVhQR1qkP+G1B3mHwzuZOQ
	Anjx3/CVArAg8AtXS8Hhbndz9mQSneAm3Qur4ljfLdSIatdc0PQ37/bJq0o8SzVstge6ea
	FOU6rPPlpAUDA6w+6Iusa29tX5EXAAFUrVpFFsqKXgcEyf8EWFGTqpI6yBPKFA==
ARC-Authentication-Results: i=1;
	rspamd-8586946c78-bl7zc;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=kurti@invicto.ai
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|kurti@invicto.ai
X-MailChannels-Auth-Id: hostingeremail
X-Harbor-Power: 2562e9661c947542_1738613516153_2978833233
X-MC-Loop-Signature: 1738613516153:1895777589
X-MC-Ingress-Time: 1738613516153
Received: from nl-srv-smtpout6.hostinger.io (nl-srv-smtpout6.hostinger.io
 [45.87.82.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.127.143.53 (trex/7.0.2);
	Mon, 03 Feb 2025 20:11:56 +0000
From: albankurti <kurti@invicto.ai>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=invicto.ai;
	s=hostingermail-a; t=1738613513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ab6R3x0iq4MlY/imzAVkZkBE2JedJ/qGVM3bp8PX4R0=;
	b=AaXCNLBAoBQsG0FrVrsIan6JtSNgNnk5bigaCgo2z+yHHLqb1poY9XmAhyEMhR6ab/4qlv
	J0I7orOtsgrWc0RrChANovN9cOdErrE4tecAiykpZkRaK1RNS5HhKXwlGeiyjK+fuoJVXv
	kczamorWzs4z/NDRKmpHMBLeFWpEwZP5XcZUJ00IdSi0je/0lb2HQcvaJymp0x9EKM6P94
	k+s3yFbHob16/uhXnnlW6Fvy9Zidp1eUlZHk3QfYU/OaO55aX0fPO9aB98BDvLP/uwAWWb
	3yvhI31cqEeuyUsfL7CZ+8IN+RPBtGyFtXJVr9cFbejMLp6Oih/Py3UFUiJuNw==
To: Joe Perches <joe@perches.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alban Kurti <kurti@invicto.ai>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 1/1 RESEND] checkpatch: add warning for pr_* and dev_* macros without a trailing newline
Message-ID: <20250203201149.330117-1-kurti@invicto.ai>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Mon, 03 Feb 2025 20:11:51 +0000 (UTC)
X-CM-Envelope: MS4xfG9gGM85xtaTTr7ofso7RCr3HVElrYIZhOSrBSVDkbfO7XLzxulvadJq7HQZf2Em7qdejlBIeIHwNEpkQZ87MmBl19aMlNAxZlM0s9xlJgLWv3hG1ZXo HtpB6rURIJDoY5LJPx3AjOfPq4SBFG78CUkpxmuJUUD3beXPxF65O97yfX5xaY98HzV9TC8+fa2LTayMBltlfCxEORhGbCvn4KaVz8cv9OGkRZ1Xl6IIXvbV IDePpooDuOFz3HVB8e0SHP0vdoypWUUvQEPnDl2a0nbYlrXryFKwfXujFZwunZNiaJ0AVKhBwCCcCPL4s00F3Ylcttmf6wVMLklAj/yInFUy2u8+mZkmxf5L cWeezpBh
X-CM-Analysis: v=2.4 cv=Pr3BbBM3 c=1 sm=1 tr=0 ts=67a12309 a=6u68u+YV8u36k7dRtz0iGQ==:117 a=6u68u+YV8u36k7dRtz0iGQ==:17 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=cCfJtRbQlw7MZNJxVPUA:9
X-AuthUser: kurti@invicto.ai

Add a new check in scripts/checkpatch.pl to detect usage of pr_(level)
and dev_(level) macros (for both C and Rust) when the string literal
does not end with '\n'. Missing trailing newlines can lead to incomplete
log lines that do not appear properly in dmesg or in console output.
To show an example of this working after applying the patch we can run
the script on the commit that likely motivated this need/issue:
  ./scripts/checkpatch.pl --strict -g f431c5c581fa176f608ba3fdebb3c1051bad5774

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1140
Signed-off-by: albankurti <kurti@invicto.ai>
---
 scripts/checkpatch.pl | 48 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9eed3683ad76..86ff666f5017 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3888,6 +3888,54 @@ sub process {
 			}
 		}
 
+# check for pr_* and dev_* logs without a newline for C and Rust files to avoid missing log messages
+    my $macro_pattern_c = qr{
+        \b
+        (
+            pr_(?:emerg|alert|crit|err|warn|notice|info|debug)
+          | dev_(?:emerg|alert|crit|err|warn|notice|info|dbg)
+        )
+        \(\s*
+        "((?:\\.|[^"])*)"
+        \s*
+        (?:,|\))
+    }x;
+
+    my $macro_pattern_rust = qr{
+        \b
+        (
+            pr_(?:emerg|alert|crit|err|warn|notice|info|debug)
+          | dev_(?:emerg|alert|crit|err|warn|notice|info|dbg)
+        )
+        !\s*
+        \(\s*
+        "((?:\\.|[^"])*)"
+        \s*
+        (?:,|\))
+    }x;
+
+    if ($realfile =~ /\.(?:c|h|rs)$/) {
+      my $is_rust = ($realfile =~ /\.rs$/);
+      my $macro_pattern = $is_rust ? $macro_pattern_rust : $macro_pattern_c;
+
+      if ($line =~ /^\+/) {
+        my $cleanline = $line;
+        $cleanline =~ s/^[+\s]+//;
+        $cleanline =~ s/\r?$//;
+
+        if ($cleanline =~ /$macro_pattern/) {
+          my $macro_call = $1;
+          my $string_arg = $2;
+
+          if ($string_arg !~ /\\n$/ && $string_arg !~ /\n$/) {
+            my $lang = $is_rust ? "Rust" : "C";
+            WARN("${lang}_LOG_NO_NEWLINE",
+                 "Usage of $macro_call without a trailing newline. Consider adding '\\n'.\n" . $herecurr);
+          }
+        }
+      }
+    }
+
 # check for .L prefix local symbols in .S files
 		if ($realfile =~ /\.S$/ &&
 		    $line =~ /^\+\s*(?:[A-Z]+_)?SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L/) {
-- 
2.48.1

