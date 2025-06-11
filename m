Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FA8185E4A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749609010; cv=none; b=dGhrw7STcRPB0PY7u0DyCsEC/+kaHF+ZHh3I1/GzDBfI5mooGfDEtBctQuxImWNxzDTC+8QpI7PRj3yQNZewAcFA+5HqE930YH36sjkk5DLRvjSITiJZybqxdcZZc1qPvg21TgFkAiwYMG7b4/8YYpLQ2N6gqTSqJLYcpVVz7eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749609010; c=relaxed/simple;
	bh=ItSIJGKrvn67D4VoacryvL8WyxCA9mhgPnojA/eepVw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mCXOB3PqOOurfl7Giz6EWV5TcAsvul6MoanH+hiNt9ey2FjZxxP8DaBVRmQY3lwYuGwVapi2cDiJ7rNOjgMeKazRMr6Cjt7ZO+/5SMx3kX+ezsbschOBr+A4/Fr8B4S3SsxI5OtQ9olX3Ey2t0FYaMQX1+oh2UDC//7OKJpecXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/CW6Ef2; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/CW6Ef2"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-52eec54acf4so1736065e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 19:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749609008; x=1750213808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P9YLk/5TTdLYt8yViLvXA0YsEMCQm55CT3LavF8lNgY=;
        b=m/CW6Ef2m9MjXcnLQNr/AvSjza541dc9kv7SSuT9FzwaCNe8KG1h4HmIVlU1m/jFPE
         DM0YyIoGI8uyjTlCHsD5/Y7VIkyq1SRIurVtBN/491CdhfTeJol3vv2ywYx+x7XUj1Jr
         oByTxF2CGjPmdYefJJlzA+qSSIoa/lmsdTNP2WSjOALCTFyNZJCe8zpzKwSnkVOl/6si
         KgLQjgHUHN2FPWpsjSzsYAp+mpuVgbdD6YCi72aYbhdwOOBm4WrE6FmRej9qTZTcAPSJ
         8fqQTDuGQGfaNq2kpsNKZgN5ONW5GzOYc6CsuREe4ZgV7U8NbM8IZX2iJ5ICvYb2VVPJ
         7ryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749609008; x=1750213808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9YLk/5TTdLYt8yViLvXA0YsEMCQm55CT3LavF8lNgY=;
        b=nE+Wfic9/r85AZ6BZOls0teBT/SlmREOJ4IXDQasJhTOxR4w9J5xdKbG99jAlVSp1V
         qD8my+C+xH/RJ7J2pG/Z4VQv/2KDuykv/Dt9YapzIfk9+/BeswKO8TNQG+2TgCw4yuCz
         CdOCqOxZXbCU/0LEJq7iGipbon498WYxXagF4BvVQG5zxZdgn7FDSsRVN5f5/GrgvXSS
         gSVsfJbiuv33tdhbXgN2ZaR52E5C0Dwfq8SXANs1pWjxgjeiOEDxNe2XHtbBJ1zVXE6q
         dnQxXGp7DyH6U7IiVmjcItZkgZwqJ+dCVTl18M5oYCUwdnGeEvy4Tk7uoYquM1YfaK64
         FEPw==
X-Gm-Message-State: AOJu0YzFz9qst183Vd55aklxTjbhE+sAt8123MkB40MOB1Klumu45b98
	qZiiBJcylTvEoU8SDB/C6Hb+6Pw+W1BnO0R1nfyQUWoPeRChsTg9YQtJ
X-Gm-Gg: ASbGncu3jLwwJVajfW/EiIDBz5dWifUK8iH0yS/LcmdfhHC5ypDOOHwVhxHRxDPlsNN
	iugVjTbBA5ZeUQLmoxoHTLeF8ViKkB+/oeeQ9cAgxtnAx+PlAca5HdG0VcfJoxUdYezTQdMouV/
	wT3dQ2GLeCako0NxDTkI0RRPxBRM/UImXMNrbjRo7oDjM22kEwq/fq0UH180DxvLkvSZ9HwBP3M
	pV8er+CRM9T9/AvlZGmQB7cergQAQT4RBY6KNm90kBW+TDLicgBS6fkCb5bNZbuk5mfgSHmj+7e
	cWNyqUw/P8u+QGLdKsA04Fif+584FyHCS5kx+ROhO2Pcr/jGXvPljZRJM3l9Ig==
X-Google-Smtp-Source: AGHT+IG8a3zP8QTFEEDo2UUysGkxGvofU2gNT0imu90su3GHZwOIX/460x8RlTvlwmIU+7iTh4msFg==
X-Received: by 2002:a05:6122:179b:b0:531:1904:203a with SMTP id 71dfb90a1353d-53122088c3amr1700694e0c.0.1749609008062;
        Tue, 10 Jun 2025 19:30:08 -0700 (PDT)
Received: from pop-os.. ([201.49.69.163])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53123354196sm471613e0c.15.2025.06.10.19.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 19:30:07 -0700 (PDT)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: apw@canonical.com,
	joe@perches.com,
	dwaipayanray1@gmail.com,
	lukas.bulwahn@gmail.com
Cc: linux-kernel@vger.kernel.org,
	Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Subject: [RESEND PATCH] checkpatch: check format of Vec<String> in modules
Date: Tue, 10 Jun 2025 23:30:01 -0300
Message-Id: <20250611023001.203156-1-trintaeoitogc@gmail.com>
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

