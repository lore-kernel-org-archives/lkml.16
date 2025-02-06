Received: from common.ash.relay.mailchannels.net (common.ash.relay.mailchannels.net [23.83.222.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF0118B477;
	Thu,  6 Feb 2025 12:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738843435; cv=pass; b=cyD+e9L/Cuq4NcPHcDDCS3xWYptEsnoYTgU7Blob51IEQj/E0oyKzc6q5otJ025IC+8u7Ld3vZa8aUoj8+KFu5eQBYXaFZHBsJ1PcmpIa2SfQrawiY5yWI1sO4MuNBq+wLgYEm42uUDWv0sw5Wmwqnx7kfx1vXfEtlpUQVdf87E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738843435; c=relaxed/simple;
	bh=cADbSS5p6b/9O1n4o1RT1/87DI9T5ECYkQOPRJX760Y=;
	h=From:To:Cc:Subject:Message-ID:MIME-Version:Date; b=lhfq7EfizsR7/dx4rnLXDje5UThUNFvqRQwu6wSUcOnRz6UXcbO66TB9Q2HdJuqFwA3oqji/wldN1CPppduzcEFHkPGY70m95HcdVy1HumQOI3n9G3TIY14xpWMmcBZr6KeUp5l9tvo4CqtCGr9ou1IbZXqQD6vYtEfHXN35qsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai; spf=pass smtp.mailfrom=invicto.ai; dkim=fail (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b=N5nN8Sfu reason="key not found in DNS"; arc=pass smtp.client-ip=23.83.222.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invicto.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b="N5nN8Sfu"
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id A2EA78C389E;
	Thu,  6 Feb 2025 12:03:45 +0000 (UTC)
Received: from uk-fast-smtpout10.hostinger.io (100-119-10-57.trex-nlb.outbound.svc.cluster.local [100.119.10.57])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 0EEAA8C34AD;
	Thu,  6 Feb 2025 12:03:43 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1738843425; a=rsa-sha256;
	cv=none;
	b=ay38nT3Y+Khh4LMTYyNlgFjnrDxPT8HPfhyNnM9YaQ4MSYNdDCZYVc77hKDa6okDA5zsJE
	SLFgyUbMBXLUmi2kJXYIXdI5pRZEFoHk2X/KdzyNRKiRT74ZZ22Y8Abx+AmF4HreCJTBcM
	AVsFpKIKXMiwmolOmmJYHGj5f9E6Gxw5zuQC+GC4P92e+HDF1Z2mquBaxobyvXP12Rjd8t
	mb+ArVHTR/V/V4RTnbrM+bpFhCDZbSgWUiwts1NYLSAuoOkF6f8MPW8Wi22r0h2hTf+LoZ
	oqtVcOal+lNbFZTRILujgZ61faut0iA89m1koiq6DSDAaL5SGoVpv+FBwL9Usw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1738843425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=JFx2mV7B/TQDMqt1SyMTvvvJQg17c8AnrF3PckYQmRU=;
	b=5wYC6ZDkUwSM2prwW2JLAItS/B+QG2SYflKG+H+PIrTGyOdWgtSoMOq6wyG4AnC80iUiS8
	cYHEKnahkwj0a8sr2+BpjVuBQQDJpF8b3YduoMuQNPeRBc/NVnCtbLWaY77Jr++PhBR2Wt
	Kp+yDxyP21xeFiMb7Piw0C8rEoyBEax/kJTUWpT52vN/Nss8kVQJngqJ22IoMTNEE1Q9W/
	m1w1k3IXSLVkERZZzJ+V4p+9zj2yNPQHOsqj+0unMN91672Weml4Y/QCMqblJz3k92XwtF
	cRai2qzQexGAKik3Wr9TGAokh/stQzAS81hoCpTPc1RZjqpR/a+l63nXYEE1jg==
ARC-Authentication-Results: i=1;
	rspamd-854f7f575d-7cvmf;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=kurti@invicto.ai
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|kurti@invicto.ai
X-MailChannels-Auth-Id: hostingeremail
X-Whispering-Befitting: 64c9d5c62cdd2652_1738843425421_1987958796
X-MC-Loop-Signature: 1738843425421:4076721496
X-MC-Ingress-Time: 1738843425420
Received: from uk-fast-smtpout10.hostinger.io (uk-fast-smtpout10.hostinger.io
 [145.14.155.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.119.10.57 (trex/7.0.2);
	Thu, 06 Feb 2025 12:03:45 +0000
From: Alban Kurti <kurti@invicto.ai>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=invicto.ai;
	s=hostingermail-a; t=1738843422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JFx2mV7B/TQDMqt1SyMTvvvJQg17c8AnrF3PckYQmRU=;
	b=N5nN8Sfu4F/PCL+taFPUj4X/XcHieOLuJO6VxF49T3F0WJAeTjb0Oe3RQkGikP2bNxfGdP
	N4hQVPDVs1FJP4DHldoYkS3ZNu0I9Cn+/rq/ldcKffWrd3zKSDvbfNAbQkHmeFS0ur3u6t
	UyfqmRnSkr5/6oF1duoRFuSrQzCAJgJ2yIRUxhSAJA615uehMDUMsM8u7nTX/eoikLDvHb
	rEGpwNLZPM7yjSnq/SNBpbUcPRs2weQx28EmsmcdA0eoweYyepKV9TBsjjsWMxWZs6HH5p
	xWJhXeGsvLAzpWxg5hDfGgnPMxk6zFsnnlAKv+giiZQW0nddya0zevUC6YZFJw==
To: Joe Perches <joe@perches.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Charalampos Mitrodimas <charmitro@posteo.net>,
	Mugel Ojeda <ojeda@kernel.org>,
	Alban Kurti <kurti@invicto.ai>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 RESEND 1/1] checkpatch: add warning for pr_* and dev_* macros without a trailing newline
Message-ID: <20250206120341.170683-1-kurti@invicto.ai>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Thu, 06 Feb 2025 12:03:41 +0000 (UTC)
X-CM-Envelope: MS4xfL46Y1G4iJYfXS2uB2etgh9m/UwlNiUd5EcbXs1WSN3MG8YX++4vX3tBCBbEl2yt9X+OL9UBmLZ5E7rnyate3hdeL7DBzqOMKF4TfFlJgHsvixaEMCsH EgnyptIUaVLKpDPkT943XkHouuGmUva0Un7e0KLzTFnH//UpHff8Pxcf4tcMj2DK9njOwf1f7t2jYteXvf/SgfH43KLoCh0xyCAYGQJd10O0878TW30nMt+D GPH0BmTSrE7MWpMNuaSZOvxbCXQCb8VVlbag/lSbuaCj7jyU40QQ8l5Od+5MF/ZeFben4nEsAkyIx7/vI5aVoP0e2IWOK7pQUpEOCYS/ImLlW33VEIEqcoRi FNgV/tCK/NV7o22W5Q30rkJq5uKTF4riI0myWM7raU4FFK9izB8=
X-CM-Analysis: v=2.4 cv=FNtJxPos c=1 sm=1 tr=0 ts=67a4a51e a=9/DLicljd4JGVkZ5BRdAJQ==:117 a=9/DLicljd4JGVkZ5BRdAJQ==:17 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=LxQgENTTcpZERYXGLXgA:9
X-AuthUser: kurti@invicto.ai

Fixes the false positive warning when there is a comment on a pr_ or
dev_ log that ends with \n correctly.
Also contains some improvements on the macro_pattern to make it more
concise.

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

