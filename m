Received: from cockroach.pear.relay.mailchannels.net (cockroach.pear.relay.mailchannels.net [23.83.216.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4F31AA1D5;
	Fri,  7 Feb 2025 18:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.216.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738953560; cv=pass; b=uOAIl2I2HYfodt1jbj5e+vA4lSooH522ooTP68C9baPhs7s91JTOXXWxdbgQCADveSZmclZKY3BJPP6hkd69TL67XnrhAOJld3qIMI+I8ly3E5kuAveI/ZusVlZpdRGChdQ8FkDr+dEaP9CtFOhqBSwNanOi5bxvO/Un3vNJdek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738953560; c=relaxed/simple;
	bh=senRZHmikqaHKI+uFtjbSM9crn5J5rrwh5Sris6YjkU=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:Date; b=SbpgCv1zfhfwze2halQZ5/FpNnq42JgozYdoelF+4GQyL+TcjYzeeD++MUFUn5ko4kNCH3e0Vak9x0bruslgdQuxIGqua0YYWUU2J8my7EMbE4w5EwrHFmc+4yjV0WdeVCsJ5Q0CPA9v72SWijxuooKzJ8FSdTonetupPJRrnas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai; spf=pass smtp.mailfrom=invicto.ai; dkim=fail (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b=c+EzZ/e2 reason="key not found in DNS"; arc=pass smtp.client-ip=23.83.216.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invicto.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b="c+EzZ/e2"
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id B0DA3783815;
	Fri,  7 Feb 2025 18:39:11 +0000 (UTC)
Received: from uk-fast-smtpout10.hostinger.io (100-122-220-145.trex-nlb.outbound.svc.cluster.local [100.122.220.145])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id A07E9783924;
	Fri,  7 Feb 2025 18:39:08 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1738953551; a=rsa-sha256;
	cv=none;
	b=JDl+OPClbVAn6V53psI0nlcbEbTcZShFt7A/J8jhYnoGuawa3pvTt1sILANfVHuxLAYK6p
	9oDAAJNdO9SHjytIEC8aG61nWQ/hCHWbvuNMqMj5CLpp0/eYCd0ofnpgYxLMhl7xjx6WH3
	4UY/lLKMEgJfffZCAxbS18jhClcJ+LpFP/FpL14KItKi243M119x5cKexDrQeA+6loD8Fv
	g+DVPITUC3ufw/ysHerDuqok9Xxu/HK+BZuwlN+rciY6Xgs0TLTmsuX1O3kaFkDyclgwbQ
	VOh8ywjpyCWfX/Jtfyok0rBQlw2VFLuloinRnD6ZMgSrvCfKXPQRiSJ4CHgFSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1738953551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=1YKXbjvV6gbXtK58+tuay73I6NfkNUwulEFMxiG3tUU=;
	b=A1wa1Y7/s87wVxN3iiyQXJieUJ3Kijd4kWQ9mJS1ij/I9DO0wexIuPPOxwsscWNOANA3In
	YppHvEcnPxjlXHTZkHQwv4JNVcufRXU7+u40QOkDb9P/2m59iegI3gC8B05HfvRBpEpHD/
	jDyE0fnvZjb9yECBOsy1DZTEBDVPGGzFvvQYb6AMCvNPZ5YddMRT3q0UoaAZXMvuFf6QPo
	95IrUrGs+O6fGUNxU0fF3Db9GjQSw3Uxxb7/oODsrrcBSqAal5kAHKNmuEMF5o8JE0H6k9
	nBbxbqeQYb6YLiWyH8ksCAgNyoOhk1Unl7IYYesIa8Xr958OsNNAF0f26sI9ww==
ARC-Authentication-Results: i=1;
	rspamd-68c88d6cff-88t9z;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=kurti@invicto.ai
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
X-MC-Relay: Good
X-MailChannels-SenderId: hostingeremail|x-authuser|kurti@invicto.ai
X-MailChannels-Auth-Id: hostingeremail
X-Towering-Spot: 0e47964b51e6e89d_1738953551557_2357726080
X-MC-Loop-Signature: 1738953551557:679016221
X-MC-Ingress-Time: 1738953551557
Received: from uk-fast-smtpout10.hostinger.io (uk-fast-smtpout10.hostinger.io
 [145.14.155.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.122.220.145 (trex/7.0.2);
	Fri, 07 Feb 2025 18:39:11 +0000
From: Alban Kurti <kurti@invicto.ai>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=invicto.ai;
	s=hostingermail-a; t=1738953546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1YKXbjvV6gbXtK58+tuay73I6NfkNUwulEFMxiG3tUU=;
	b=c+EzZ/e2vuTI30sWVadCkbzoV9/Jv+n4B2kiBZje/jbEXV2iTPKBAo0E8OToi8THdcbrRM
	zH4lr1LzPUHBcRkZNluou7pj/gHHHtc07fKI4lyH6Mu/LB+cW1Xlei+5Us2/9QHC8DshJ5
	ZFonINSAstPqBvN9bhCbSxYlzT3MOy4Ykaoo6O41jEXc+aQDpqKeBHASlp624g/xROMYz2
	lO0n2z3mDugHyq1+ooKG7kY2no3lN3iE62YFiReoM/KzAqgxYp3RCyb9G3Bz+s01J28u5Y
	HwTjxPttvpgHnFsyJmFLYk1ZcbtEZGpVHh1kmhgRhclzpkqQ+9tLPJhiJVGDhw==
Subject: [PATCH v4] checkpatch: add warning for pr_* and dev_* macros
 without a trailing newline
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-checkpatch-newline2-v4-1-26d8e80d0059@invicto.ai>
X-B4-Tracking: v=1; b=H4sIAEJTpmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNz3eSM1OTsgsSS5AzdvNTynMy8VCPdNDMDI3PTVGOD1CQzJaDOgqL
 UtMwKsKnRsbW1AKYNWrJlAAAA
X-Change-ID: 20250207-checkpatch-newline2-f60275e30eb6
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
 Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Alban Kurti <kurti@invicto.ai>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738953545; l=6095;
 i=kurti@invicto.ai; s=20250206; h=from:subject:message-id;
 bh=senRZHmikqaHKI+uFtjbSM9crn5J5rrwh5Sris6YjkU=;
 b=p9PK1Pc2VpuhKYKURRyuF3yUqMD4zeiRHJ96w3CuzxeoFLYqlvfdwdpM1HhXVZL4O450baEBX
 wA+Fyu2K7WGAaLMZRhULf+ncWJ+SKfkenopi94k3TRR8vZqO76cfR1z
X-Developer-Key: i=kurti@invicto.ai; a=ed25519;
 pk=D1lKs+JFapuEVI9zJ2QUTLSf5u4aT12tG0ny6vMMuOc=
Date: Fri, 07 Feb 2025 18:39:06 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=H/GJwPYi c=1 sm=1 tr=0 ts=67a6534a a=9/DLicljd4JGVkZ5BRdAJQ==:117 a=9/DLicljd4JGVkZ5BRdAJQ==:17 a=IkcTkHD0fZMA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=RKUNEDuqt85CaGehgjcA:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfCk0GC+bS6pm54mTuNTo2BHupnAhbyX38KlDBAdkvOelVduzyBnKFvlVHgOUXjnvwfUc+R9mk5hzfmRLh18jQhZABQCt6jUY+lOjng0mW/UN6D5SJ0C0 m/UwnqUNFdZZnhKqc2GsQsmB4rwYd6n77Em09ig5dWOJujuJJ6miQMexJRetTugzhvIAYL19dMU39GulrVruP/DABvHbLM/tBaBSw37Ns6+c9w0VM/1a8fZK YWbATvSwrlwX7UqU5EvncANBlXPv3cudz3YwptuuggyR7ZbLpJWKDbdCWBHOP2HmdNQWzmRrMOh3wsvuq6/S+TaNCbtXfXN6htgMyvq4zFNVsR5qrx6mE3cI tZ/khq2VMK1comaRe01OwNr2Ede4fjfaqsMnT9BQRKLGsHtURJEJy5il2PHsiX1NvhCFkeFM0ly+tMeylGcCo6JHX2tulxCOODE6oHXeb0xmvZdNei4WYSZ4 lW5dMaZe0vmo1k//VNz3dtmxTtUJSgOOZ7xby5ZycXvppeIZJE49MFUAsxu3zfNT/g87yFYh0Wph1JVVw5OGOzdiMuoCZ63sn7Otzu5JrqY0icrcWhae/wya qPtqMkWuNgscNko5nwQXWaYvrlR0lgNL2Qr6ra1QkvcJV8HD9IFfrhHeB6u5s1t6HewsMbMs/EvBFAWXg3BAfiL+
X-AuthUser: kurti@invicto.ai

Add a new check in scripts/checkpatch.pl to detect usage of pr_(level)
and dev_(level) macros (for both C and Rust) when the string literal
does not end with '\n'. Missing trailing newlines can lead to incomplete
log lines that do not appear properly in dmesg or in console output.
To show an example of this working after applying the patch we can run
the script on the commit that likely motivated this need/issue:
  ./scripts/checkpatch.pl --strict -g "f431c5c581fa1"

Also, the patch is able to handle correctly if there is a printing call
without a newline which then has a newline printed via pr_cont for
both Rust and C alike. If there is no newline printed and the patch
ends or there is another pr_* call before a newline with pr_cont is
printed it will show a warning. Not implemented for dev_cont because it
is not clear to me if that is used at all.

One false warning that will be generated due to this change is in case
we have a patch that modifies a `pr_* call without a newline` which has a
pr_cont with a newline following it. In this case there will be a
warning but because the patch does not include the following pr_cont it
will warn there is nothing creating a newline. I have modified the
warning to be softer due to this known problem.

I have tested with comments, whitespace, differen orders of pr_* calls
and pr_cont and the only case that I suspect to be a problem is the one
outlined above.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1140
Signed-off-by: Alban Kurti <kurti@invicto.ai>
---
Changes since v3:
- Just reordered the checkpatch.pl code original addition as it did not work properly
- Link to v3: https://lore.kernel.org/all/20250207-checkpatch-newline-v3-1-20d8774f16ea@invicto.ai/
---
 scripts/checkpatch.pl | 96 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9eed3683ad76caffbbb2418e5dbea7551d374406..0e7684d2f0cf30575640d7c4da9e51a13d91463b 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -77,6 +77,8 @@ my ${CONFIG_} = "CONFIG_";
 
 my %maybe_linker_symbol; # for externs in c exceptions, when seen in *vmlinux.lds.h
 
+my $pending_log = undef;
+
 sub help {
 	my ($exitcode) = @_;
 
@@ -3888,6 +3890,91 @@ sub process {
 			}
 		}
 
+# check for pr_* and dev_* logs without a newline for C and Rust files to avoid missing log messages
+  my $pr_cont_pattern = qr{
+      \b
+      pr_cont!?
+      \s*
+      \(
+      \s*
+      "([^"]*)"
+      [^)]*
+      \)
+  }x;
+  my $log_macro_pattern = qr{
+      \b
+      (
+          pr_(?:emerg|alert|crit|err|warn|notice|info|debug)
+        | dev_(?:emerg|alert|crit|err|warn|notice|info|dbg)
+      )
+      (!?)
+      \s*
+      \(
+      \s*
+      "([^"]*)"
+  }x;
+
+  if ($realfile =~ /\.(?:c|h|rs)$/) {
+      if ($rawline =~ /^\+/) {
+          my $cleanline = $rawline;
+          $cleanline =~ s/^[+\s]+//;
+          $cleanline =~ s/\r?$//;
+          $cleanline =~ s{/\*.*?\*/}{}g;
+          $cleanline =~ s{//.*}{}g;
+
+          if ($pending_log) {
+              if ($cleanline =~ /$pr_cont_pattern/) {
+                  my $cont_string_arg = $1;
+                  if ($cont_string_arg =~ /\\n$/) {
+                      $pending_log = undef;
+                  }
+              } elsif ($cleanline =~ /$log_macro_pattern/) {
+                  WARN($pending_log->{lang} . "_LOG_NO_NEWLINE",
+                       "Possible usage of $pending_log->{macro_call} without a trailing newline.\n" .
+                       $pending_log->{herecurr});
+
+                  $pending_log = undef;
+
+                  my $macro_call  = $1;
+                  my $maybe_excl  = $2;
+                  my $string_arg  = $3;
+                  $string_arg =~ s/\s+$//;
+
+                  if ($realfile =~ /\.rs$/ && $maybe_excl ne '!') {
+                      return;
+                  }
+
+                  if ($string_arg !~ /\\n$/ && $string_arg !~ /\n$/) {
+                      $pending_log = {
+                          macro_call => $macro_call,
+                          herecurr => $herecurr,
+                          lang => ($realfile =~ /\.rs$/) ? "Rust" : "C",
+                      };
+                  }
+              }
+          } else {
+              if ($cleanline =~ /$log_macro_pattern/) {
+                  my $macro_call = $1;
+                  my $maybe_excl = $2;
+                  my $string_arg = $3;
+                  $string_arg =~ s/\s+$//;
+
+                  if ($realfile =~ /\.rs$/ && $maybe_excl ne '!') {
+                      return;
+                  }
+
+                  if ($string_arg !~ /\\n$/ && $string_arg !~ /\n$/) {
+                      $pending_log = {
+                          macro_call => $macro_call,
+                          herecurr   => $herecurr,
+                          lang       => ($realfile =~ /\.rs$/) ? "Rust" : "C",
+                      };
+                  }
+              }
+          }
+      }
+  }
+
 # check for .L prefix local symbols in .S files
 		if ($realfile =~ /\.S$/ &&
 		    $line =~ /^\+\s*(?:[A-Z]+_)?SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L/) {
@@ -7678,6 +7765,15 @@ sub process {
 		}
 	}
 
+# pending log means a pr_* without an ending newline has not
+# been followed by a pr_cont call with a newline at the end
+  if ($pending_log) {
+    WARN($pending_log->{lang} . "_LOG_NO_NEWLINE",
+      "Usage of $pending_log->{macro_call} without a trailing newline.\n" .
+      $pending_log->{herecurr});
+    $pending_log = undef;
+  }
+
 	# If we have no input at all, then there is nothing to report on
 	# so just keep quiet.
 	if ($#rawlines == -1) {

---
base-commit: ceff0757f5dafb5be5205988171809c877b1d3e3
change-id: 20250207-checkpatch-newline2-f60275e30eb6

Best regards,
-- 
Alban Kurti <kurti@invicto.ai>

