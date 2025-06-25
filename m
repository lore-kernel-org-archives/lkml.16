Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8A21D7E5C;
	Wed, 25 Jun 2025 16:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750868643; cv=none; b=IP393e7+w0jPwV08gDo92VLVkuLpiwW0gJeBeZp00Zx41vvkAKwI78oEWe7kV5qwglJGO+T3N2oMwzqmaKSr7s6oO2g1BhPOxOtWpE3DeK4TWZ5E/hA6XPzHlKj9u6ObVsHt7Hc6ypanrvrPiToKIUQ4z+14UbMBAZH9fw64JzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750868643; c=relaxed/simple;
	bh=otyzjEf5d4MxY1jVt/y9LENz8Z/NqhO59NSKBdU814w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MLHj3WYxzsDzX0XO2M9+fKYXvSMw25nWZ+CvCqz6mM06GnzSMTDEta2eBHZ9eY5+jlN8IhMcVZQxZQsYfO0KgonDogyWRDRUR1eH5y0gTfvFj3j8+FC9QDxoYPbJDjlLreojb/hUB3UdMTpSt+6KOJQOes7mzEipfiLXJ16Ow70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RngB5w9X; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RngB5w9X"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b34a78bb6e7so20401a12.3;
        Wed, 25 Jun 2025 09:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750868641; x=1751473441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eYA//BSL3Zf31RPtdc1BM9gQrGLN3UaNTm4hsoDS9bU=;
        b=RngB5w9XZrll32IaAUQ/tvkmCWVw66Pt0vjsLH3e4ySJhVv4qT0cV09MZRm9q4O5F4
         KHIerBIVO/wXF7MW/n9zqERuz4w0RWyP1+cNhl2xib6dAgb7RPAXc2OtIXHhe4LN4fPG
         q26N0JuybyaufUKnBBJjLmCmm+g/aK1U3uH38P3YSzKV0IdaPyAGLQSs9ZEO34m+0pR7
         a0tbNqicArVt8VIWa5l2oAXj/V1XrsUrsNCDmXxFjIa2YA6AmFIvybJsKpztIhxA4FJ5
         uqBaaEPH3J99cbaBVeVI3CFBuRpnI5lNvoeR7WA+nFXheEAEWoHNbb0e5ksbCmSuyl5u
         bEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750868641; x=1751473441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eYA//BSL3Zf31RPtdc1BM9gQrGLN3UaNTm4hsoDS9bU=;
        b=HvCp/zMogFpvk6C8eodbTVtpx2aNmtXfDFz3Ss2uCVJKgBzIsf6pbDQYTzmpOi2ceZ
         AV4fGBKQCexd2/Htx2fsWQ4/bI09W2q6QrafCgGBMSegduPAMXd9RDK0x2je7l+vWkfl
         A1zitTnEoivknSkpynBQ3+0tMhZboO68YAskb7E08+7DwH++nTXMeoXN3zJW540EXN39
         p+fo+H+4V975HYb/2oMMXCdUZbtiFWx3uzttkpv/AXFYJ+t4xeYmFhj5OWDlYDNAlzqy
         a9vaGBFtVt4PhgJQA3ybnNXzpeeM8GESP+CLyX5375z0O9Nioe3yH1kVLJE+Dguq2bVH
         y06A==
X-Forwarded-Encrypted: i=1; AJvYcCWOTQTP8z1GMYLM9JaxT0Eu0rVMGj13/hHKOJaQzZSMxZl0TQGi6n96o7N/z1qHP01y6H5qc4GDB9lFqdw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOYhdJIEYQxwOJ/5bbRceGlK/baSBtENwFMblG5fsRVhU2giJQ
	PiHX/3cituGCFWn6ABM5ZlfPoqlPwy1jj1ZswGDS3nD4UXWYAT4t4iKQ
X-Gm-Gg: ASbGncthIWMfc2aeTzwBpUOnLbfrfNXjq75t7pR1sV4gntZ91V5I8aJn4JNg3513t2+
	l9XPMDWa695yq+ZKoEaPpCo75VCwxhwpiSymTuA3Tg3IkW6oDELA9DXOK4wTKDDYXCPmI+T3ydc
	smnpadd1G/f3dJ/d1NfaGX7hgN0fIo7sMVblUjqGdT41/dAJ3Lb2ULzOMJKNT1o3SG8OYkNP8Xf
	emw4KmbrQX8Y6Utub+NC5FJ+P+imQcT0B2Uae+rcKrXo4vJ+wPEuoq1Z8kitk7dEfl0YwwB8nGz
	bcHdKOQydJwgHS65verW7fO75SZK/fKWEUBEnk7R+9PW5Umc7bxV
X-Google-Smtp-Source: AGHT+IH/WLwOfBV/ljIC9o2of2pFDDpvmVh09c9chkhARr/X+fx3BRY6DfBA4lJSHsK1+EKlQDMOUw==
X-Received: by 2002:a17:90b:2c84:b0:311:ff02:3fcb with SMTP id 98e67ed59e1d1-315f269ceeamr5048159a91.28.1750868641088;
        Wed, 25 Jun 2025 09:24:01 -0700 (PDT)
Received: from localhost.localdomain ([2409:40f2:116a:400:f32b:ad5e:ec3f:b2dd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5386edbsm2311631a91.6.2025.06.25.09.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:24:00 -0700 (PDT)
From: Sai Vishnu M <saivishnu725@gmail.com>
X-Google-Original-From: Sai Vishnu M
To: corbet@lwn.net,
	mchehab@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	Sai Vishnu M <saivishnu725@gmail.com>
Subject: [PATCH 1/4] scripts: sphinx-pre-install: Add --interactive flag
Date: Wed, 25 Jun 2025 21:52:34 +0530
Message-ID: <20250625162237.3996-1-saivishnu725@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sai Vishnu M <saivishnu725@gmail.com>

Introduce the --interactive flag to enable prompting for package
installation commands. Add $interactive variable and update the usage
message to include the new flag. Check for terminal input (-t STDIN) to
skip interactive feature in a non-interactive session.

Signed-off-by: Sai Vishnu M <saivishnu725@gmail.com>
---
The RFC proposes 4 patches that will integrate the interactive feature
into the sphinx-pre-install script.
Link: https://lore.kernel.org/linux-doc/CAFttn56VFPjikxjhgds6LjphinStm_cN+7ZhAzsieT0gnBqBDQ@mail.gmail.com/

 scripts/sphinx-pre-install | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index ad9945ccb0cf..6e6e5bda6186 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -42,6 +42,7 @@ my $latest_avail_ver;
 my $pdf = 1;
 my $virtualenv = 1;
 my $version_check = 0;
+my $interactive = 0;
 
 #
 # List of required texlive packages on Fedora and OpenSuse
@@ -1002,12 +1003,18 @@ while (@ARGV) {
 		$pdf = 0;
 	} elsif ($arg eq "--version-check"){
 		$version_check = 1;
+	} elsif ($arg eq "--interactive") {
+		# check if the user can interact with the script
+		if (-t STDIN) {
+			$interactive = 1;
+		}
 	} else {
-		print "Usage:\n\t$0 <--no-virtualenv> <--no-pdf> <--version-check>\n\n";
+		print "Usage:\n\t$0 <--no-virtualenv> <--no-pdf> <--version-check> <--interactive>\n\n";
 		print "Where:\n";
 		print "\t--no-virtualenv\t- Recommend installing Sphinx instead of using a virtualenv\n";
 		print "\t--version-check\t- if version is compatible, don't check for missing dependencies\n";
-		print "\t--no-pdf\t- don't check for dependencies required to build PDF docs\n\n";
+		print "\t--no-pdf\t- don't check for dependencies required to build PDF docs\n";
+		print "\t--interactive\t- ask to install missing dependencies\n\n";
 		exit -1;
 	}
 }
-- 
2.49.0

