Received: from buffalo.tulip.relay.mailchannels.net (buffalo.tulip.relay.mailchannels.net [23.83.218.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B7223C8D6;
	Fri,  7 Feb 2025 18:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952308; cv=pass; b=S8lscZB4mHMjw4puV/hbmyGeiG1S+nHbDLxJlGS6plg1VymRdxlK+apddHkJmTni30vU6llVPUJ2v+U0cb7POwbLcGv2w2Mbw4xt/JXtl0BKqtVEbP1lSiyQqaEsWb0+26Y961qqPC+W26klc/Lzt7+6SkQVHobPGp5DCF4zcHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952308; c=relaxed/simple;
	bh=d9ZwYPFgYgTL0l+JWyXZofQJ322MEjTvbvfGJVSOHjY=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:Date; b=CaR+AUEDphgzT9KPuf0+v894ctFUHOQTQ4mac6TVGvJ8rxJ+cEmpC/WB6mE5UorwZEtDJCkYid+onKLLWyIkJFW9nAydPLKS9ISzsn4GtanPsaxmVmAVRo+k39WFFTr6NBw/Atn3FUGfmAPS8VrVe0BS9OtnX0vJaGa3ovxkVDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai; spf=pass smtp.mailfrom=invicto.ai; dkim=fail (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b=MwIszzI+ reason="key not found in DNS"; arc=pass smtp.client-ip=23.83.218.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invicto.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b="MwIszzI+"
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id EED1032104E;
	Fri,  7 Feb 2025 18:18:24 +0000 (UTC)
Received: from uk-fast-smtpout10.hostinger.io (100-121-114-237.trex-nlb.outbound.svc.cluster.local [100.121.114.237])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id EF58832117F;
	Fri,  7 Feb 2025 18:18:21 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1738952304; a=rsa-sha256;
	cv=none;
	b=Opdrw2fHHogsTU+pThofy5ylAqvu6d6sqPA/qITpCvHRdse2ExgBguxD2aJLn2OrBu5A1j
	bOeTf8qfjofPe0vKOndD+4l74EgxPV2IeKnIbxpWEAabufxvySINrIWTkT1s72wmg5lQoK
	c2rH2GYnnxqluzVPHDBRfp2hsqnWO2/qGqwjsGWFAbYuKDp2p2Wn0myaicn9mEtFR6lN5Y
	67CoeYT8QwwbmgELbf6I8NfxFuMFtc0s/03haQFDydxODWm8fZqeCy8ql6V5HqGQQrLyZ8
	HOj9jywv2y9VolvTgiSK4LLVDcYgR7BDVRT+LrM4dxQR0n2bKqSpdt61zAE/yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1738952304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=SFzC92NuoYhAUt2IuoMJenAdtbmB93hU6W3PJhkmfW4=;
	b=i8VSvpA3tjMrP+lHj7GqI1WhAuIUNRh3BBHJrlN4Va/DIwcFwbjkEp8yUkF3ADnwodzOfM
	KE7nAndE3dXpdbN7i54GbkvyqADReD/q9zjfQlVHsUBmjCmaEl1qdDEboAb6bMj/QhRLn8
	QPo/0GDLoPboTA/lqZqIAGQlx6q96RWEBDjm0jUk/HaEcuNP1usXePTC8Z/aLg07ctGG2S
	2ipXR2KAw/tk/VCME9SCXoScTyCdOrGLsuqBpWhc+MmzXQysGNIsb0Qd/6y/bO5DJB7A6I
	3zALCm1Q0F6TJAZODyaBBS1luChho9nchPfMxSYwMz0dQAExzIjbThQ6Kbsbhg==
ARC-Authentication-Results: i=1;
	rspamd-68c88d6cff-nll4r;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=kurti@invicto.ai
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|kurti@invicto.ai
X-MailChannels-Auth-Id: hostingeremail
X-Cure-Cooing: 1e554fa455af7171_1738952304693_1261355290
X-MC-Loop-Signature: 1738952304693:1453879646
X-MC-Ingress-Time: 1738952304693
Received: from uk-fast-smtpout10.hostinger.io (uk-fast-smtpout10.hostinger.io
 [145.14.155.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.121.114.237 (trex/7.0.2);
	Fri, 07 Feb 2025 18:18:24 +0000
From: Alban Kurti <kurti@invicto.ai>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=invicto.ai;
	s=hostingermail-a; t=1738952300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SFzC92NuoYhAUt2IuoMJenAdtbmB93hU6W3PJhkmfW4=;
	b=MwIszzI+bD3gEyMmmyTF/FtQ6D9lcCRg4GY62q8n1sckhOLIFcrBFZsqOSKUoX4ECOHG+h
	/fgaymaqHnPuEuhpCI6jnZNaFYZ2krhzRaujQwSEnQdnHXmhe2EUSsUhn+BnojwYpco3Ln
	jovOmTUGz14VRWCjPiqgXjL1pg8mxCkbQob+XeM7pnfgebn/qP5zhGvuS83cOOiXEznkGs
	duS/otXLtrzvyBs7SGK7imPmDTiXd9fZ9RyEJ+Z/OB2G2Xy5BwBEh3g/S49SuUcxEEhJwQ
	ysjZJogYqXJlpQRiW7BZBjfXsdokRANTKOeMx4BahuvF5HerTqF0Jxl2OFSaOw==
Subject: [PATCH v3] checkpatch: add warning for pr_* and dev_* macros
 without a trailing newline
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-checkpatch-newline-v3-1-20d8774f16ea@invicto.ai>
X-B4-Tracking: v=1; b=H4sIAGFOpmcC/x3MQQqAIBBA0avErBMmQ6SuEi3UphwKC40KwrsnL
 d/i/xcSRaYEffVCpIsT76GgrStw3oSFBE/FIFEqlKiF8+TWw5zOi0D3xoEEdlY1CrW2uoESHpF
 mfv7pMOb8Adv/ghdkAAAA
X-Change-ID: 20250207-checkpatch-newline-09b515077b71
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738952298; l=6203;
 i=kurti@invicto.ai; s=20250206; h=from:subject:message-id;
 bh=d9ZwYPFgYgTL0l+JWyXZofQJ322MEjTvbvfGJVSOHjY=;
 b=/7lQr4wu/n7uJ2bP9BVzOS2n2QXQpERRRT999f7oXYLthyVAhJNHNdbQT+D1HnX8A1eqxcrzF
 97f5Fmj1KNeDUCplrn09Qv3UkAVV33IeKpDhKoPBYI2N8N7yRRqUZmw
X-Developer-Key: i=kurti@invicto.ai; a=ed25519;
 pk=D1lKs+JFapuEVI9zJ2QUTLSf5u4aT12tG0ny6vMMuOc=
Date: Fri, 07 Feb 2025 18:18:18 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=H/GJwPYi c=1 sm=1 tr=0 ts=67a64e6c a=9/DLicljd4JGVkZ5BRdAJQ==:117 a=9/DLicljd4JGVkZ5BRdAJQ==:17 a=IkcTkHD0fZMA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=IWu_P5eVJl3gcF7D5EkA:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfGb/YfJJj8tPJ41yCSOy04L3i6wlP235wSdHNSjlbO8aoDscolgNs2n/4G3CAj6NdWGsHTExf4MXTxb/NfZAKrmu560pVgvh2yeMXxmSQzUwWWjH0pwC ma/8oHwrr6dek4pkaoM0AiR5Z0+AoC1n1k4UKsoJdtTY9nwumQYo1w/ISGjpv/owWdoM99n2RH1I+ApmrgAYKNcyhqVwDeYMAGV1r3OwxM+6lBD/uAB0gP+V x+ULYVa5zj1XRfM67/Q+xfUZJjax9AQoQHtYvH6hqfCY0II86yVDEUpotsVCxl1k+RipFuCaBeKppueAThRYD1HLoTx3W7GRqM3XM1A12Q0yls2Fu5VkUxQy ofK4qaiCEcacqUw9yQsf+JoWxHYOC2RlEfTZmNEBS81c+2MpRU6GGGqN4jiycSg6VI3GFQRkYI+TjIgxRbuJXgEAgBNomrx6Ak08UfpF/SRuYGmnhMmM+OSJ AjUyDQRyj1zS/RWJIfpO3m050g3IuIr+ojWGi5KpEUBzFojCsdT6sbB1+kPIqNpV9Lo6hxA4j5BhySuakLyqUKtC4/n4RSjCgAcwmYedds3ydau1CI5ENnZH I6nYzcUbHeJkthJZSjk4lJ0BEUEa7HW9qMLjn6u2EmmvxzwnnEHX7LtOhBcCY5YCQJKkd8/Q7ZgcBEkpZtIy2e6X
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
Changes since v2:
- Added pending_log functionality to account for pr_cont usage with a
  newline
- Better formatted cover and patch
- Link to v2: https://lore.kernel.org/all/20250205120540.387447-1-kurti@invicto.ai/
---
 scripts/checkpatch.pl | 96 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9eed3683ad76caffbbb2418e5dbea7551d374406..e7494920dea47986af0ba668145a19fcc21a3c9b 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -77,6 +77,8 @@ my ${CONFIG_} = "CONFIG_";
 
 my %maybe_linker_symbol; # for externs in c exceptions, when seen in *vmlinux.lds.h
 
+my $pending_log = undef;
+
 sub help {
 	my ($exitcode) = @_;
 
@@ -3898,6 +3900,91 @@ sub process {
 # check we are in a valid source file C or perl if not then ignore this hunk
 		next if ($realfile !~ /\.(h|c|pl|dtsi|dts)$/);
 
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
 # at the beginning of a line any tabs must come first and anything
 # more than $tabsize must use tabs.
 		if ($rawline =~ /^\+\s* \t\s*\S/ ||
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
change-id: 20250207-checkpatch-newline-09b515077b71

Best regards,
-- 
Alban Kurti <kurti@invicto.ai>

