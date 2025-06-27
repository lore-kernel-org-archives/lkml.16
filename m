Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218271ACED5
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 21:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751058173; cv=none; b=VmU79gqV/qXmh2beOYPLew5/Z6jMHA6iB0pPc8sJHXeWv+CsJ/7AzL4spMRroC5fHlOGAe/ZGxf/hY+cvMR9CdA4Psj+ZGgDh82BNQVAyt5QJ9sDXuydt0D75M//MNpclVltq6/Jpj6aFuEPRbrXtbUEMCfPwNHYAYXhJ5FqUTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751058173; c=relaxed/simple;
	bh=ItSIJGKrvn67D4VoacryvL8WyxCA9mhgPnojA/eepVw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eHWKg1mptZB7+qHOW6B/nyLHH6v6eW9+Z62tsAghP7LgEcRqPPpHuCsCwdFgzYSY0anSGBE816FTIGF/ezoSdGdFFMiyNwbESDw9SCxO0KbIjEYglRIvhy09ibGD0r1C0qDJVEMr8bZo8IOSZss0kWeXkgwR+kJ44POc08fpKgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ii977w7F; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ii977w7F"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6fad4a1dc33so2835986d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751058171; x=1751662971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P9YLk/5TTdLYt8yViLvXA0YsEMCQm55CT3LavF8lNgY=;
        b=ii977w7FysVsit1F5uts6RywXQgLrwhICkNVAgMw3Ahtsv1x24yj/ad+wsasTVbiAw
         rMaulU4t7lKX53zTtjCHcsF0TTz02n/zlAX2ToQEslf6fjSdYM7HCr+UUWq5i8ZrsG3T
         j6xG7cNBgERV7XpERaaayJFj/RbiH6sMowQ3XGe6Ai3NlvTyEIYCTs6CbD3jHctr2GM1
         8jeB0XQZZd3A75zukuc+bekn5hE5J06oFhHMKurB3Fh98jmIAJAgaSjskUkvDHhYV9FQ
         Ime3Nm0a1HruKjlgFGQTUBylxKjWuBMLoeD6BpxoxrSAZUk4lYJcHASRV3Z9yulOQliI
         oaig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751058171; x=1751662971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9YLk/5TTdLYt8yViLvXA0YsEMCQm55CT3LavF8lNgY=;
        b=nawBkztDmvMA5JuonEGuw8Eie8iFmHPAhwDVBJ0N+C4ccUOQD7MjmjnOvv/Y47xBIZ
         r2LCz1C0vRn3qOSwJA9IQFddcXQYCijKQdmhDB1s1PjaZtQe2bQjr+J8rLlNWGsdIufw
         H922Ko9Vrpro9TW3JTkf+HbnflUR0poEXW1c6r8UycZYOF/tnaISad5d/QaUpgPIuWee
         RnfTLX9xDYtdGPgnNT6UvwRK1ip2f7AJxZJKEAcmIqQEKfYoylHt4STYx+G/o0ElhUFA
         yXU0uM2sF5wucvRMuayfCiRNj9QjPYXMlb+Xo4R7RmvMQQlk3N4WAlk0WCv7LFAI6jTe
         8PBg==
X-Gm-Message-State: AOJu0Yxqi1d+BD7g44brb0FbhXVMqic8SzA/spbCmp2uJVe/a7WS/j5O
	IlBjmEVBbeJtKJ/JSyFzr1hkWZhM475KkXKJdvFkehhCNBk64H2QoVm4BOOGgGAz
X-Gm-Gg: ASbGncv4vfFL+yJzbFod4JAB8Kupo8BSmbVX9XJAZuPgsIk4xspe7obBDyuR4TaTRBq
	73e1GI5H2CKsQ69iYJlz6J6gHw6wQmOXXhzWhmkjwQvuQOn3VlVOsDQKHNio6ul/2smirWjnI2f
	pDe10NIl2Bl/BdZ8CAdgIkzIgLhNKaCxU94koJaXaJ6fzx4v4A/WOK75jXzQh4YWj3FgxAbLHyM
	WERoPRve7/YYuQ4doBBFaYk1TQR/vBST/83voyd7ro4lbDR9hGj/VVjmp4Q9Gtw9Bvpaf4Vyysc
	ezi/pmWI78RbO39+EC4HKjni+kGxr5Rv9R0CjKs6FFUbOC6rVHr8NEtcqXYP7/HbjkjAEIT6Bw=
	=
X-Google-Smtp-Source: AGHT+IE7XmLeqLTL3tEF2SVJmNia2rGDAkZb9OjXwbP6Aw0NV1oxPShVevsy2hMbsCgvkdcrVqvEgg==
X-Received: by 2002:ad4:5c8a:0:b0:6e4:4274:aaf8 with SMTP id 6a1803df08f44-70001e5bf93mr83405026d6.17.1751058170690;
        Fri, 27 Jun 2025 14:02:50 -0700 (PDT)
Received: from pop-os.. ([177.21.141.235])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7730aea1sm26887116d6.112.2025.06.27.14.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 14:02:50 -0700 (PDT)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: apw@canonical.com,
	joe@perches.com,
	dwaipayanray1@gmail.com,
	lukas.bulwahn@gmail.com
Cc: linux-kernel@vger.kernel.org,
	Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Subject: [RESEND PATCH] checkpatch: check format of Vec<String> in modules
Date: Fri, 27 Jun 2025 18:02:22 -0300
Message-Id: <20250627210222.105038-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement a check to ensure that the author, firmware, and alias fields
of the module! macro are properly formatted.

* If the array contains more than one value, enforce vertical
  formatting.
* If the array contains only one value, it may be formatted on a single
  line
* If the array is not indentation aligned, enforce indentation alignment

Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
---
 scripts/checkpatch.pl | 77 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 664f7b7a622c..c8341c7a2bac 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2796,6 +2796,12 @@ sub process {
 	$realcnt = 0;
 	$linenr = 0;
 	$fixlinenr = -1;
+
+	my %array_parse_module;
+	my $expected_spaces;
+	my $spaces;
+	my $herevet_space_add;
+
 	foreach my $line (@lines) {
 		$linenr++;
 		$fixlinenr++;
@@ -2872,6 +2878,11 @@ sub process {
 			$realfile =~ s@^([^/]*)/@@ if (!$file);
 			$in_commit_log = 0;
 			$found_file = 1;
+
+			%array_parse_module = ();
+			$expected_spaces = undef;
+			$spaces = undef;
+
 		} elsif ($line =~ /^\+\+\+\s+(\S+)/) {
 			$realfile = $1;
 			$realfile =~ s@^([^/]*)/@@ if (!$file);
@@ -3588,6 +3599,72 @@ sub process {
 # ignore non-hunk lines and lines being removed
 		next if (!$hunk_line || $line =~ /^-/);
 
+# check if the field is about author, firmware or alias from module! macro and find malformed arrays
+		my $inline = 0;
+		my $key = "";
+		my $add_line = $line =~ /^\+/;
+
+		if ($line =~ /\b(authors|alias|firmware)\s*:\s*\[/) {
+			$inline = 1;
+			$array_parse_module{$1} = 1;
+		}
+
+		my @keys = keys %array_parse_module;
+		if (@keys) {
+			$key = $keys[0];
+		}
+
+		if (!$expected_spaces && !$add_line && $key && !$inline) {
+			if ($line =~ /^([\t ]+)(\s)/) {
+				$expected_spaces = $1;
+			}
+		}
+
+		if ($add_line && $key) {
+			my $herevet = "$here\n" . cat_vet($rawline) . "\n";
+
+			my $counter = () = $line =~ /"/g;
+			my $more_than_one = $counter > 2;
+			if ($more_than_one) {
+				WARN("ARRAY_MODULE_MACRO",
+				     "Prefer each array element on a separate line\n". $herevet);
+			} elsif ($inline && $line !~ /\]/ && $line !~ /,/ && $line =~ /"/) {
+				WARN("ARRAY_MODULE_MACRO",
+				     "Prefer to declare ] on the same line\n" . $herevet);
+			} elsif (!$inline && $line =~ /\]/ && $line =~ /\"/) {
+				WARN("ARRAY_MODULE_MACRO",
+				     "Prefer a new line after the last value and before ]\n" . $herevet);
+			} elsif ($inline && $line =~ /,/ && $line !~ /\]/) {
+				WARN("ARRAY_MODULE_MACRO",
+				     "Prefer a new line after [\n" . $herevet);
+			}
+
+			my $line_cmp = $line;
+			$line_cmp =~ s/\+/ /;
+			$spaces = -1;
+			if ($line_cmp =~ /^([\t ]+)(\s)/) {
+				$spaces = $1;
+			}
+
+			$herevet_space_add = $herevet;
+		}
+
+		if ($expected_spaces && $spaces) {
+			if ($spaces ne $expected_spaces) {
+				WARN("ARRAY_MODULE_MACRO",
+				     "Prefer aligned parameters\n" . $herevet_space_add);
+			}
+
+			$spaces = undef;
+		}
+
+		#END OF ANALYZE FIELD
+		if ($line =~ /\]/) {
+			delete $array_parse_module{$key};
+			$expected_spaces = undef;
+			$spaces = undef;
+		}
+
 #trailing whitespace
 		if ($line =~ /^\+.*\015/) {
 			my $herevet = "$here\n" . cat_vet($rawline) . "\n";
-- 
2.34.1

