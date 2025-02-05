Received: from slateblue.cherry.relay.mailchannels.net (slateblue.cherry.relay.mailchannels.net [23.83.223.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E792288C3;
	Wed,  5 Feb 2025 12:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738757154; cv=pass; b=LrMGCRPZas8x86Bp4SadPpdLawota5OLZ9X4spW2hPmrdVuQUyJ4y5gF3zmuDbWQYwVBYnqZJ0OorT5MRCAYS0sIt9nDlCiHXzGyrPvrala1UuoGZG/jvELoUkIwa4HSZsO3YbxQ+sZPir+otpHS006Tkd4sKL+vX/0NgfO/0dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738757154; c=relaxed/simple;
	bh=n+kV9+UwBTCR/vArvaVKIkc5Gk2J6L2bfQFRy+ydri4=;
	h=From:To:Cc:Subject:Message-ID:MIME-Version:Date; b=bOuxUtlZVWwg5qaFsaiQmy1JP497RlI0UmpIh0C3va25724rns7Ea3GiVg7MmTAp0zVhtOHn/Pw1OWxgUuySKddd9av+npgNXaA85o4VbVaOfaF4UDhCW5/7FkWJg0oGQ4qGqRKVBj2rUz+llQxWkG5kcT7zwTAvRVc+xG1oFCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai; spf=pass smtp.mailfrom=invicto.ai; dkim=fail (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b=PM3LVCfo reason="key not found in DNS"; arc=pass smtp.client-ip=23.83.223.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invicto.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b="PM3LVCfo"
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 84D13323999;
	Wed,  5 Feb 2025 12:05:45 +0000 (UTC)
Received: from uk-fast-smtpout10.hostinger.io (100-125-6-118.trex-nlb.outbound.svc.cluster.local [100.125.6.118])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id DC9D8323510;
	Wed,  5 Feb 2025 12:05:43 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1738757145; a=rsa-sha256;
	cv=none;
	b=X7Pa9SsGpLkYum3OwWmUsIKX0BrSMTi4QKFYiJRM8qKIE2O/lmhqvBPHjN4pQUsSllLO45
	GmGR2AQFlFrJyrYxUc5qVFyiuuSt/SOrjPoW5wKm3YYNYW1VByhdsgkwOF3yyksA3NcHBL
	kRsuZwkgSyWSUY45CKhkQixWLL+sqtjm9pfqHtr7/3xjYOVV+jK6oHup90XIVYd2zt/M+K
	1ACmZqD5UymvhSnA3sXLtaNXR3XAeONXIs1Yx0oTMPTBnwvqixJAFJaNizgxjOyZumXFvZ
	c8d2C8rLyNhDMUqhOJfedLFT+KpYm8pWw4Zy2syBKVVd6ZkxT1NMJHhXTjqdLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1738757145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=Z1U0Xh8r2sAEGksth46gKm60Xdy2Owbvni8DC6du3+E=;
	b=QKqNxd+QxscV9M/e+8alCKAoTrBY0G5zNqUvjjSKxhBpErbEetgPyLcUt1eixvMiBR0lfm
	j6sH6w0Ga5jSxwf0Wqmi6NxDCcf8neECYFz8uIrnAuc0CkqWD9ehro0QnuHGW9YGx4QtNG
	tVbO81ngCOObkLDilfcmQJBJ8Qbs8gTyB+SceUw6CyIWLXsHggj1pz/bptzraR0XNxlucx
	3wRlpKVC6j8cwg+ZY/7+QZHLCyKHr5T/TerzXEo1u1csxNQ5v/CFzEJ9mho8uev11q1fsH
	ugNjR2VepRM4ZcQmQgsAtoCoNv+Jdb3D0v0Ay9Hjl0zJApv+M2sYzx3pbu9BNw==
ARC-Authentication-Results: i=1;
	rspamd-854f7f575d-4l9h2;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=kurti@invicto.ai
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|kurti@invicto.ai
X-MailChannels-Auth-Id: hostingeremail
X-Bitter-Trail: 61e7d66d49c260da_1738757145282_248120685
X-MC-Loop-Signature: 1738757145282:3145241845
X-MC-Ingress-Time: 1738757145281
Received: from uk-fast-smtpout10.hostinger.io (uk-fast-smtpout10.hostinger.io
 [145.14.155.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.125.6.118 (trex/7.0.2);
	Wed, 05 Feb 2025 12:05:45 +0000
From: albankurti <kurti@invicto.ai>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=invicto.ai;
	s=hostingermail-a; t=1738757141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Z1U0Xh8r2sAEGksth46gKm60Xdy2Owbvni8DC6du3+E=;
	b=PM3LVCfo0FMaVKlqYetnMfN1sZi0IrLSACx8/zsgYF0fBMQrRAwQ23mnqtgCETeW+Z1hD4
	AwHFhAFhFpK4vhnIqKICTD6pq4lfsBwQT1zIKNLBX+0t8phWLxFrKUNwbde03WqudLuRwq
	/Sc7DOgojR8E9fvmrT5eT+QTsnBDmnvDajpnAPmYfCnAa54HGdVn+YIj9qShNiiItGDI1e
	9+BeOMujBmeaVv5m1E2li8BKCxD5HfoIKW/CtDPM8NMEeBVtV7MILykjNmnju4x7G2Gg6e
	IjD6X5EJq9NQ+rgdTrfVGR7MsiOZlML8B0M/xP1xdhsNALxYJdXabDIppHvmBQ==
To: Joe Perches <joe@perches.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Charalampos Mitrodimas <charmitro@posteo.net>,
	Alban Kurti <kurti@invicto.ai>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH v2 1/1] checkpatch: strip comments fix
Message-ID: <20250205120540.387447-1-kurti@invicto.ai>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Wed, 05 Feb 2025 12:05:41 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=TtS0hyXh c=1 sm=1 tr=0 ts=67a35415 a=9/DLicljd4JGVkZ5BRdAJQ==:117 a=9/DLicljd4JGVkZ5BRdAJQ==:17 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=n_Y5cSvsXr9sHqn1BKgA:9
X-CM-Envelope: MS4xfLfvwmOMryI8TtL4XBuQfxCZgpj+zHvTAhNtmEbTj86H76nnbA2kPDfCxuKxnIJi7E1elsxAOp5yG42vW3+OU5H0AZbkzL0QDDRGnp5Cre7wcjhALBON 6SIFFj0FzkUohXrSvYf3/kBX9xMNPYRd1w2e3ItziCL+scfJ/UeLL0Cu1V+5rARMNaMJ1JkJoiH6Igmoqv0GEEbRNBi4zMr7hO5LKeI65LgzM5CWU6HUevx4 npSF8sb/29Q8t0iv6XoROrJZVE1gJwmj9fIwR57voyrIuHSKA0mJv22y6R/4XwaDEPBGjA9gtMc3qu1vXnvRzFguDJUZH6Lja4ZSMcgaibbjgeiMrV2ThpJW 1Au0jgoIdr2yaiyvJbJEm4LkEw5eG5UFlvU5yiUG5iyOfnqS78s=
X-AuthUser: kurti@invicto.ai

Fixes the false positive warning when there is a comment on a pr_ or
dev_ log that ends with \n correctly.
Also contains some improvements on the macro_pattern to make it more
concise.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1140
Signed-off-by: albankurti <kurti@invicto.ai>
---
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

