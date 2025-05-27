Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE46D1990A7
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 19:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748372570; cv=none; b=EkcR5Dlyc1I2GNBfQqetknrYPJ+3eGyU/w2gyhweG6OcNzbHIGb/SxsutW1xe8ue08637ciT6NSin9085Zim8TyEQ7bbtfRxDfoWtbxVNRTBqmOKmTVlbbuXjEFwCW9UCjQaE4b5BYdILsJIFb5SvOFddPpmlztz3qV7VeS8b58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748372570; c=relaxed/simple;
	bh=qc9K1487mDId4n8hDI2Zz9cGxZ+yStXtUqmOpy/e/Yo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JKecaIh7tWuPl/xfrxXefgjBdvxWHm6mh709u3beoJWjeCP8UUnxtfiNpolgAHKkxfAf5J6ol51Lwmf/luvvcaAq/VJwMl82kBuya092ctcTmtUi+5j9JtaAqch2PDE7FUwPdiwjWymcf63w0KlB21si5dW3aRmouKCbztS43JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gboex4u2; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gboex4u2"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c5f720c717so19021885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748372568; x=1748977368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZyIDN9dRHZ7H2gbq+aiFHzFC56nerxuUqfJsbZggCk=;
        b=gboex4u2JK2gCcaF6fAQ71Chv2dEq1yCO+I4/ddHd6LpVpnUN1jkVcxKJOK8cPw8Qu
         /KNuV8QyGoSF6EkXyBGKepskAKLVgEnfmS/GDnhwyMlJUSNEWNbRWGNpxTymRXOYs/dy
         uhpyk9XDh6ZKnzgfXIKH02gJoAdhKHhDHuIZysU0CVN4iyTFYueczoo4LuDmaDWYqpVB
         4j4Av9kfScxyrZIB6SufhN8EmPf0Nmtx9pVM+anITFTl1YIHDAGNloyPs6ckbgLktFLy
         PI9hz0RR9SasmQNW27xYP72tBBt6PqJb1wg+QwthEoro2Bmr+oeLAw0zqKiU1t8cZMeT
         rw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748372568; x=1748977368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZyIDN9dRHZ7H2gbq+aiFHzFC56nerxuUqfJsbZggCk=;
        b=mYDwGjY49odSBAfcYZ4jCE8wKtE6hYwrl3glI5iX1XaOPchl39i6hgljeC3lmkyETB
         ewCpMvv1Np48iVp3QBdScBv8IvA1HtFiFD4EeBI9Pbh8zXa20Xn6hPAR8DsmdURo3m+8
         7jlYJVkue4t1e8MT6P9HfHrrq+drCO5qCGQe6wX15bViPTcz1p4mPiaoRaZrAnQD4bC5
         IkLEtn50hvEq6476yBmSTGg39kQfxETEt16P8eGp1MTNkHj+QmnsOFqnVf42vhKRnNu5
         zGNsTjdpzJx2D8yeZfsrhzXovJREQjMD1aRVQX8PPzVntj3vD0Ir5TZaK+6UB7/wxKF9
         eI6w==
X-Gm-Message-State: AOJu0YwTWrRBowDgb+qlmQq6s9weJrJAMdqgaomAYCAm9R7tQ/KfgJjs
	bbIapr/Lp0b5EIT6fL31od3PIjPwh8gIvzHG7fZsl7ZmTi4ulF9xy91Xdd5G2cAb
X-Gm-Gg: ASbGnctxE41/vs+0B+bqTMFjs522irO5qM6PQoHEej9Xs0F+4zqsnuyTnwoK0VrXuHH
	f5iP3I69kGFZisKkuOUBi1poW7fSCDSXlW4SGRNazR/maBcTaLyl2m49Cd9+aEH/zprL6/bgLCS
	I9l0Ece8K08VaRCDpR1q+WR/PwJI089O1D9FQEop1Q6q4XQDUASFydn4AhJAnGvdIBiQxUVdorr
	fd4JwAWRQ8unJxR8VRhx/s043a3Qa/TDeEOwWqUuUoKVAfpzjFsft5+c9EAMVPnm+lWcc+BbSs6
	e5Bk6E0J+W6b/WVNK3dpRHVKq5d/ZM0FcxgIVJyh1c+C4+625zY=
X-Google-Smtp-Source: AGHT+IHd53OqY0ivtZJePj8KxPCjbVj4oc4Ce9pQyaHwdEAUKC4TpVIZh9DF4Bmxm4VaAAzFNVDRNA==
X-Received: by 2002:a05:620a:2723:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7cf06d88bf9mr238055485a.23.1748372567697;
        Tue, 27 May 2025 12:02:47 -0700 (PDT)
Received: from pop-os.. ([201.49.69.163])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e59cee6cf8sm12909137.13.2025.05.27.12.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 12:02:47 -0700 (PDT)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: apw@canonical.com,
	joe@perches.com,
	dwaipayanray1@gmail.com,
	lukas.bulwahn@gmail.com
Cc: linux-kernel@vger.kernel.org,
	Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Subject: [RESEND PATCH] checkpatch: check format of Vec<String> in modules
Date: Tue, 27 May 2025 16:02:39 -0300
Message-Id: <20250527190239.143112-1-trintaeoitogc@gmail.com>
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
index b3b1939ccd19..5fe90fba29b6 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2778,6 +2778,12 @@ sub process {
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
@@ -2854,6 +2860,11 @@ sub process {
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
@@ -3570,6 +3581,72 @@ sub process {
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

