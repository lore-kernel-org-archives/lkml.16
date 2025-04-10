Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7CB1E98E0;
	Thu, 10 Apr 2025 16:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744300815; cv=none; b=TU1JlWctBIKmTUkDXc7EHGf7Oa7EQop6l8qBogiUWuFvm408Js7it35I8h5v4cgMVTFU3p6cyBC/MCZvyR8a02fNUrlE4EPaJRGmMiTJgHfGP29EJwFa8rXbX/yHInqIMOoYlCxGaLmyltFP6p7CrXvQTHh7oAsVnew8hInIi6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744300815; c=relaxed/simple;
	bh=pl9dJD0Qx8fdr7PO+1lN8nE809JuwSMSpc4t1wsrh24=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dazoVUfjpBjcalI7nqAArrVwWR5wy8niJNly/ZWkA5shO+qqbJe4O7L/X3Gz/FUKxMnHfTqcszbRBsxEVS3ZVyZ8uCENT+5mX5MC6/dvZqQsg61B+7GPo2kkFMVK030EcizHW+VtaWdT6TWkF1++LCdFzU+c8TVXpkpBLPtlFgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jk4L0VD2; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jk4L0VD2"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-224341bbc1dso9681085ad.3;
        Thu, 10 Apr 2025 09:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744300813; x=1744905613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qo3jtmdiLQ30YVjIBcjlK7lG5+Fo4/D/zRq2VtRejDA=;
        b=jk4L0VD23zV1rd7SZg0tE0ezcJx/mew4fyO8ro2DgN0/w9SZypHr5HdrfoFAcQYOY7
         GduPlAPXjAkV5q4CMtl2mlj+R/cEwJ2Wy2BWpkLHXAcFWNMe4c+f9qdmqFwbDKcMVQl4
         0qcbKFyX9fi7DiDOuc99noaFuk+emeLPEACdJDMb18dCc0pc5oB9EAeS2hwQ6pGSjNPn
         bJ/bloVifbWahp/81d3B11INgth92UPH0H+n5I6/Wwo2Nlyko+mR4nst2ucC3ROZnOzx
         6CfqU/nGw8HJKbLPEYXBZkiG05gmEfk1XcpkgyMWxslG3UA73WFpdkomyvXBcwfeDpYw
         L2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744300813; x=1744905613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qo3jtmdiLQ30YVjIBcjlK7lG5+Fo4/D/zRq2VtRejDA=;
        b=m9vG4lLGXBH7JKSWxEf8geOEc4lQ1c55KUgIhAqHQOWqcnp5QSKrjyQkvSXPL2/2mR
         19V8jrQbbLpB444uSGIFJ3JWf2A2NSEM2EfMUDdBisrNcZK8jh3urf0M2QY3pvdSnKx7
         woGL9/i6VIC8RgTVUN+1ckiGpAhtpFuhIXQzH2deW/siPHC6a8wJm51AjuAxF4BJPjIC
         FF9qdJiXpI+mJ42STrE2gTYEbQsv0iJ/ewedIQfKyn6SeirzlRrbvkIfIsn7HR8LIBQL
         LBH8XoXZl9YYYOjElbf614BP+FxTTb6hhY+VYaIDPNSYlLCAD5da+Thnai8AQb5Bgfda
         5VxA==
X-Forwarded-Encrypted: i=1; AJvYcCU+W0A7c4t1YvHvqSSHj/3hUGtRiBOLAB0zg6+gT2bkDEI+7NDeUWm7C14mDC20hYtKne8unWuSPwM=@vger.kernel.org, AJvYcCUi5vN3tM1958cSgB8ZsQ6+LT0tscNiQpIHvmAyHEeMQ6wyhAeQKkoueTjtBFfTMrigjJCBaNISm2wJem/4@vger.kernel.org
X-Gm-Message-State: AOJu0YyXtUF++8JJlp6fbYdNhKPR2R5TjrT95gd/IFbO0ksfjLlqNUVO
	eP4O3t0c4N2C+SCBY4cXra3w699zku8eOvULQnO2Jpw9mnBc7q3T
X-Gm-Gg: ASbGncv0zudFTAlZjAWvi7emnx8Ce4fPk43P+FuVMZMXiURzYZBftXNmrgP+3BGQoQ8
	vjD5WRvtAOtS5Kz2Wk4sxnDCjXpKoj5DIh+pCWeJGcnlzwll8vxUYnFhnWDnnAoMUbEVqXQ/6eZ
	oyGcZtoDQ4u7u9oN2uVXqbBkul8Yt8g+dOHYBJUQOiGAdGBXsNWSSD4/+vb/cvesSAxKRwEuznm
	zRU8hEvffDK7orMEAFVLAixwXwLnPJv7OtoGGb4rqx2OBMKqWpD73wvUQbbbkmy9or6wtEjDOD7
	s1mXIwJQf/BpGJITEdQOdx5tlhMx057OoxPuq1HYvcFuuZMsRxeerX4Vst/LTA==
X-Google-Smtp-Source: AGHT+IGnJBJQib59YV2tKOPvVx8bjO1Oi1ZxGy4LlEUbUkj4ifQE6YltT6IlIPhorHZiQqXMnN4f1g==
X-Received: by 2002:a17:903:2446:b0:224:249f:9723 with SMTP id d9443c01a7336-22b42c2e74fmr47652475ad.51.1744300812602;
        Thu, 10 Apr 2025 09:00:12 -0700 (PDT)
Received: from localhost.localdomain ([2409:40f2:1181:ecab:2ac2:19c7:32de:1c4d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cd1sm32179355ad.150.2025.04.10.09.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:00:12 -0700 (PDT)
From: saivishnu725@gmail.com
To: mchehab@kernel.org
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	saivishnu725 <saivishnu725@gmail.com>
Subject: [PATCH] Add --interactive option to prompt for dependency installation if missing
Date: Thu, 10 Apr 2025 21:24:15 +0530
Message-Id: <20250410155414.47114-1-saivishnu725@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: saivishnu725 <saivishnu725@gmail.com>

Introduce the --interactive flag to enable user prompts before running commands to install missing dependencies.
Asks if the user would like to run the distro appropriate commands if any dependency is not available.

Signed-off-by: saivishnu725 <saivishnu725@gmail.com>
---
 scripts/sphinx-pre-install | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index ad9945ccb0cf..581d694eb0fd 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -42,6 +42,7 @@ my $latest_avail_ver;
 my $pdf = 1;
 my $virtualenv = 1;
 my $version_check = 0;
+my $interactive = 0;
 
 #
 # List of required texlive packages on Fedora and OpenSuse
@@ -338,6 +339,21 @@ sub which($)
 	return undef;
 }
 
+sub run_if_interactive($)
+{
+	my $command = shift;
+
+	if ($interactive) {
+		printf("Do you want to run the command now [Y/n]: ");
+		my $user_input = <STDIN>;
+		chomp $user_input;
+		if ($user_input =~ /Y|y/) {
+			printf("\$ $command\n");
+			system($command);
+		}
+	}
+}
+
 #
 # Subroutines that check distro-specific hints
 #
@@ -374,7 +390,9 @@ sub give_debian_hints()
 
 	return if (!$need && !$optional);
 	printf("You should run:\n") if ($verbose_warn_install);
-	printf("\n\tsudo apt-get install $install\n");
+	my $command = "sudo apt-get install $install";
+	printf("\n\t$command\n");
+	run_if_interactive($command);
 }
 
 sub give_redhat_hints()
@@ -1002,12 +1020,15 @@ while (@ARGV) {
 		$pdf = 0;
 	} elsif ($arg eq "--version-check"){
 		$version_check = 1;
+	} elsif ($arg eq "--interactive") {
+		$interactive = 1;
 	} else {
-		print "Usage:\n\t$0 <--no-virtualenv> <--no-pdf> <--version-check>\n\n";
+		print "Usage:\n\t$0 <--no-virtualenv> <--no-pdf> <--version-check> <--interactive>\n\n";
 		print "Where:\n";
 		print "\t--no-virtualenv\t- Recommend installing Sphinx instead of using a virtualenv\n";
 		print "\t--version-check\t- if version is compatible, don't check for missing dependencies\n";
-		print "\t--no-pdf\t- don't check for dependencies required to build PDF docs\n\n";
+		print "\t--no-pdf\t- don't check for dependencies required to build PDF docs\n";
+		print "\t--interactive\t- Ask to install missing dependencies\n\n";
 		exit -1;
 	}
 }
-- 

This is not the complete patch - I'm sending this to get early feedback before I go further. If this looks good, I plan to follow up with additional patches that will:
1. use the run_if_interactive on the hints for every distro
2. add more quality-to-life features to make the script more useful

Any form of feedback would be helpful! If there is a reason why none of the scripts are interactable, please let me know why.

Sai Vishnu

2.34.1

