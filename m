Received: from shrimp.cherry.relay.mailchannels.net (shrimp.cherry.relay.mailchannels.net [23.83.223.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD3D13D897;
	Thu,  6 Feb 2025 12:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738845969; cv=pass; b=KaUBEM7gtsYhG7l1vBHoxnkM+bn20fG00l5eBFIXE7trbTm6Oh2Cc/dq4C+7bqTZxlvuLkHsb7JojBNtnxz4F3F6cqL0ZDOBCt8hbst6dmCaSrzP9AJ0U7PeVzejvwwTKsy5Weh5KRgGdggXEx7Cl6nVcL3SIhOuAtJf5BUMl0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738845969; c=relaxed/simple;
	bh=QQ1sksRTflALfRywfKYPKVjO29Sf5P0qnE52M0N2ncs=;
	h=From:To:Cc:Subject:Message-ID:MIME-Version:Date; b=nQjxNAA5cDpqbtXtSMlBe8ltNmFv5IgPBeA3HGbHjaVv7i7IX8+/ZOc0nbWqAce+FaqDLpl/PtEer6ATn5GI2CrdCh24iBf4vjnSxhxP4DXLJlr1UNDGP4+axPYUsyWyQ8M4KgpdbuPtAu907NCQAjG77rsJ6wnxsos3TB/V5EY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai; spf=pass smtp.mailfrom=invicto.ai; dkim=fail (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b=mzDGu2iO reason="key not found in DNS"; arc=pass smtp.client-ip=23.83.223.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invicto.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b="mzDGu2iO"
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 1EC69162E05;
	Thu,  6 Feb 2025 12:09:16 +0000 (UTC)
Received: from uk-fast-smtpout10.hostinger.io (trex-2.trex.outbound.svc.cluster.local [100.126.220.89])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id B7EFB162AE8;
	Thu,  6 Feb 2025 12:09:14 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1738843755; a=rsa-sha256;
	cv=none;
	b=JvFaC/1/Cm2HFRwZxWBizVQh5kBG1pT7AvTmQs6KaasISBzdbxZaEajNMi+jvI94O5uUI6
	dE60EfqdFKk3Plm0uwlqfZ3AH4IUDNu0Et83mV4+S/6OhWs8j1/tQnCQaOr5l6obXLAtyC
	yILENWuYGx7wahbNU2X7z5fjFzvBcORCxKDV7k6pn/9k23lujwTx6mhdCHIc/bAq1dDQmN
	PzyuYGIG90TQf88BCtydaceEOboYWxkachoTxsZ4saGgOOAKiFGaS+0/iBz4Uanpk7Z7i+
	FzDyZH7deyf8Cfa1WPc1QvLG0djmjNpWQSgziwG9Z0M+aGU/ZRCe1QPDxqh3vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1738843755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=mjCsJoNg8ewzPGErTYrEIhf6SKdcXmfhMWvqFCbwvHw=;
	b=5zMDl4DYw2WsZ08VPpOoBF16cctcSli4fyzdqzn9DDNL2wXHjtpqZp1Pht8JxLNPtu74G0
	+yjRNYOjQP4s+lcl1GzN1qvuD4m0eJ/dLdcko08ruGba0khrOmdSXyzN+sd0uLuntqXUCO
	7JwpFAeGHhUiLdHw7f0vDzrLPEr3ESaaynr8CQOp9Ns48O0DeK6Jn+OZHqh+VEvGrhCoF2
	4NU2Yi3KebMrJCwhaeeavoEPyPpdYcnfXmfwzwJIL8X2akLS3xsQq8KCug/sDGul93rjCx
	DE1fy9kQ5Vn3/lnNxN43i1N7Ala5faBBUKFi1fc7v7NikmjaKx1vrzsWfFdNvg==
ARC-Authentication-Results: i=1;
	rspamd-8586946c78-dhq8j;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=kurti@invicto.ai
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|kurti@invicto.ai
X-MailChannels-Auth-Id: hostingeremail
X-Bubble-Harmony: 7d9b63892e486f84_1738843755997_742268085
X-MC-Loop-Signature: 1738843755997:3344615492
X-MC-Ingress-Time: 1738843755997
Received: from uk-fast-smtpout10.hostinger.io (uk-fast-smtpout10.hostinger.io
 [145.14.155.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.126.220.89 (trex/7.0.2);
	Thu, 06 Feb 2025 12:09:15 +0000
From: Alban Kurti <kurti@invicto.ai>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=invicto.ai;
	s=hostingermail-a; t=1738843752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mjCsJoNg8ewzPGErTYrEIhf6SKdcXmfhMWvqFCbwvHw=;
	b=mzDGu2iOu8yEAWYa73iApjt912QTkT2IpCcdLHUuJ5+9gY2Q/9YSuQcT7rvyYc41ElkSwT
	Q38jDLpSEeT20qZCUVO158SCUi3kskDQ8BJ5YZPIgPNfC1oK2mjkxo7t0tWEqUosxrHh++
	WCDFqdWIFhcOEVzTAmlYJL9Q/5oGkJ6M0usgGAy1pzhyEtQODu2B1s4h60dGdwsrNd9/5g
	0Rlym78hyjthyQGKwGZR4X7+0t83nwhfShpuNpeXmYGdjGqfMD3t3WAVFq98bLaWL9k39W
	mGDMuVIVGS/JP/TKf7pMUqWNxPFZxMJHn61lbfHdCKCQAQWcMeRAdB7eUxBgQw==
To: Joe Perches <joe@perches.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Charalampos Mitrodimas <charmitro@posteo.net>,
	Mugel Ojeda <ojeda@kernel.org>,
	Alban Kurti <kurti@invicto.ai>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 RESEND 1/1] checkpatch: add warning for pr_* and dev_* macros without a trailing newline
Message-ID: <20250206120911.175884-1-kurti@invicto.ai>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Thu, 06 Feb 2025 12:09:12 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=FNtJxPos c=1 sm=1 tr=0 ts=67a4a668 a=9/DLicljd4JGVkZ5BRdAJQ==:117 a=9/DLicljd4JGVkZ5BRdAJQ==:17 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=LxQgENTTcpZERYXGLXgA:9
X-CM-Envelope: MS4xfGp4E+hgyP0+9EfzfyO/dQYsOyTvP9OmiKBfvxVIOKCssFx5cpK4+mP23vEfegNxU5jsgksSFBIw47F9X69j4OKl6v4KHxn9UmjK3B+v6qwvswqGX31w y2CZT6lH9HaH/zmTAzSDwpENNd1EVSiel12ECV01mR4AKZ7RVu0KJuUpsGSB0cOXXGEvM5yFKY/VCl6luwmZ2TtRZTxGmnijK0W0thE73V2aOB5OiMUSfBcb tZl2j08tdIMuJDaV7flp0FQLMlEocNf7cGr0ikxXpN1cYIEMk0ojBG8KrLlF0gqOpV9YnUuT1oLqNm6NTOy0jWyOm8VmNEPlKqj6yt3myDk53NcnmN74iUyO dtPxbXou5qXRPlg4YLfbZdWXwkEv+FvMEqtHaxYnNZVIB6+Qb4o=
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

