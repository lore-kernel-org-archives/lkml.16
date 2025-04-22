Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF7B284B5D;
	Tue, 22 Apr 2025 15:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745336230; cv=none; b=SJ0ip320cEvdvKj9mrOV/XF0pOwjrNBrTLXrmEWcksgdCg5nhM7D0JAqE6PtrHw5A6QlFV88Y40eIM7i7eQbohYiO/w8G7DIqKxDPLDil2eWFRzpg1S6DdY1mlEEN16DeBupp3LGeb9BEXOquDzyAYrLdkN6pRa0mx0sxmTcIPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745336230; c=relaxed/simple;
	bh=hQUaPUMdtvoSyTvGKmf5Oovdbos2wVlpP3qjWWIS4bI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mCFqF7HbBBLdh2Mx0CpVoOfyFBs3On5/VNfsERk+dxX61YnGxgsz40bOxFBVPi7nuXVcQImVcGCSGwQ/JEgCw7TgQ4ZKXbh2mQZ583XRp6OLfS5lf2TovgLJPoDgLZszNLjFFihkXtKLCiSelKEJNXeFwpm644dzKbah/EQ1zgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jurSQIMr; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jurSQIMr"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736b98acaadso5052095b3a.1;
        Tue, 22 Apr 2025 08:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745336228; x=1745941028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TKsyNnHm6WNv4FtZs7UDZw4ADCulN+mYo2PfkLKWdjQ=;
        b=jurSQIMr8fyPrrDR5Li0bEGqIE2gEhk9A3ASOsOGAvyhtPfigX1LAUal1H1ZLGWdMX
         Wfv8G57hMxIeTXWV5ptr6W0//uJjRH3DCutwtIev/jmpE1KdEpk2sNoTDa2hp1rlLPuE
         ie7WjGuz4rbE0zhI0pjbvkGqEXqdaBWD2fjceSShG4ND/vaNNxlIUAQZrymC5OqOTR4A
         jY6PWqdwbQFiBpg3a8ca3y/xqcASVLAxiDBQXbo+LGn8b+R7kiCNmuXcrbrxahNjFgPI
         EalC+IwRjoJTLvRnL3/uE4carCQZK3/J7D25vHnLivkUF1lXMYps76l6Nr+kFfGzl1J4
         BiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745336228; x=1745941028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TKsyNnHm6WNv4FtZs7UDZw4ADCulN+mYo2PfkLKWdjQ=;
        b=nC35K4tI8Pn0s+4geTsHhy7Dr/xISVDGWk9Mv5HAbSbHOomXijI9fXr78Kl7kbOp/R
         mx59UoE8+4Iuc4PrlGmquB/Zg5S/I2o9qzwEQDvaZlO1wHOipsQlvzRpxry+fkEkOgGV
         Nm/58dkFYKVvwIFoUuNFBLFqkhoklkx+/jBPlqinC5BvuAG5FxJSyjQu9/E+1qWn5Wsb
         qKEEHUoTqBTU69bgbYo/NUX/jSfiwMq1GUhp0/jUSYqYufBMVDF3fmWweb6TrOMg+Sny
         5ZPK46dri+VhTy/VKG13itqEDuKZpUSHiX6sbS406mGzayk0ZdW1eRgHDU2Zy2DMLVRM
         tqqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlNTzcxTc9ht4v0PwQEs28i1D+6m/+jUCZKmOVFjnfaALlXFJ5TrvpGXohGrcfbeAWFvon4uoG8dw=@vger.kernel.org, AJvYcCX75T6dvtE3wmwh1eUOcMDOPpiDDKlumtjRFFZPBac2VCEc8TWni7MX6CUkUi5iVgJOuq7ceii9OG7Zu/bo@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj5vR2k/kLAbQrGRvPW+PAtV7pgY+068L52SdDyUaeCFtBATZj
	8nD9CuGIuZWb+jFsQrnCm2ZYxY/k0P/YdZtzSpmkFNoEm5vaQgGN
X-Gm-Gg: ASbGncuNleK1YZjM4n2EyCAnXRQ0gz8xQmf3/pqzlqW8KOxUqVCm+1fddN1jCERbOrG
	TE1TD0wuFX//gzutFmiBLY7iROjjrhzvWwevdhurEOSlJHUG9QEkIm0dheXB7a/ItFIXHovNV1h
	HoRBlyJMg5rD1aLGceUEbRV6S23Q0GrK90sU7SD11ncQqmzC/wkIJ17l8VRFqzbCgTWws5Lrux2
	MZE72a0Uc/dGjALFIh92MdQvz6cAkbXtQVwgbeKG238Z/4HzIWfpbVtk7IysVINw7kJ15fhyoxy
	oiRP5ctCAId3onhffQwx19Zz7DvUaFgx4boJYuM06VG3gDrcnmlmsllWFDwU
X-Google-Smtp-Source: AGHT+IEHehU2+04/+vibvXrOevuVLY/ujdBzRKmaVBT6ru2KAnGZbRPUGfgWHd6tZHraor8YOnZxmA==
X-Received: by 2002:a05:6a21:6d84:b0:1f5:7ea8:a791 with SMTP id adf61e73a8af0-203cbc51b0emr22346506637.10.1745336228123;
        Tue, 22 Apr 2025 08:37:08 -0700 (PDT)
Received: from localhost.localdomain ([2409:40f2:2090:5195:af7e:b86:9290:86c3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db14488casm7521240a12.56.2025.04.22.08.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 08:37:07 -0700 (PDT)
From: saivishnu725@gmail.com
To: mchehab@kernel.org
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sai Vishnu M <saivishnu725@gmail.com>
Subject: [PATCH] add --interactive feature
Date: Tue, 22 Apr 2025 21:05:56 +0530
Message-Id: <20250422153555.85219-1-saivishnu725@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sai Vishnu M <saivishnu725@gmail.com>

This patch introduces an interactive mode to the sphinx-pre-install script
that guides users through missing dependency installation for convenience.

- Adds `--interactive` flag to trigger prompt-based guidance
- Handles cases where stdin is not available
- Implements default behavior for invalid or no input
- Improves messages for unknown distros and errors

RFC: https://lore.kernel.org/linux-doc/20250410155414.47114-1-saivishnu725@gmail.com/T/#u
Signed-off-by: Sai Vishnu M <saivishnu725@gmail.com>
---
 scripts/sphinx-pre-install | 185 ++++++++++++++++++++++++++++++++-----
 1 file changed, 160 insertions(+), 25 deletions(-)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index ad9945ccb0cf..a3fbe920bb44 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -42,6 +42,7 @@ my $latest_avail_ver;
 my $pdf = 1;
 my $virtualenv = 1;
 my $version_check = 0;
+my $interactive = 0;
 
 #
 # List of required texlive packages on Fedora and OpenSuse
@@ -338,12 +339,96 @@ sub which($)
 	return undef;
 }
 
+sub run_if_interactive($)
+{
+	my $command = shift;
+	printf("\n\t$command\n");
+
+	if($interactive) {
+		printf("Run the command now? [Y/n, default:Y]: ");
+		my $user_input = <STDIN>;
+		chomp $user_input;
+		# Default = Y
+		if ($user_input eq '' or $user_input =~ /^y(es)?$/i) {
+			system($command) == 0 or warn "Failed to run the command";
+		}
+	}
+}
+
+sub fallback_unknown_distro()
+{
+	# Fall-back to generic hint code for other distros
+	# That's far from ideal, specially for LaTeX dependencies.
+	my %map = (
+		"sphinx-build" => "sphinx"
+	);
+	check_missing_tex(2) if ($pdf);
+	check_missing(\%map);
+	print "I don't know distro $system_release.\n";
+	print "So, I can't provide you a hint with the install procedure.\n";
+	print "There are likely missing dependencies.\n";
+}
+
+# checks if a package exists in path
+sub is_in_path($)
+{
+    my $cmd = shift;
+    for my $dir (split /:/, $ENV{PATH}) {
+        return 1 if -x "$dir/$cmd";
+    }
+    return 0;
+}
+
+# adding a check in --interactive
+# Reason: Selecting an incorrect distribution in cases where the user's distribution is unrecognized may lead to unexpected behavior.
+sub check_user_choice($)
+{
+	my $package_manager = shift;
+	if ($interactive) {
+		# checks if the package manager exists. hence, confirming the distribution
+		if (!is_in_path($package_manager)) {
+			print "$package_manager not found\n";
+			fallback_unknown_distro();
+			return 0;
+		}
+		return 1; # package_manager found
+	}
+	return 1; # non-interactive
+}
+
+# checks if either of the package manager exists
+sub check_user_choice_two($$)
+{
+	my ($pm1, $pm2) = @_;
+	if ($interactive) {
+		my $found = 0;
+		# checks if either of the package managers exists. hence, confirming the distribution
+		if(is_in_path($pm1)) {
+			$found = 1;
+		}
+		if(is_in_path($pm2)) {
+			$found = 1;
+		}
+		if(!$found) {
+			print "both $pm1 and $pm2 not found\n";
+			fallback_unknown_distro();
+			return 0; # package_manager not found
+		}
+		return 1; # package_manager found
+	}
+	return 1; # non-interactive
+}
+
 #
 # Subroutines that check distro-specific hints
 #
 
 sub give_debian_hints()
 {
+	if (!check_user_choice("apt-get")) {
+		return;
+	}
+
 	my %map = (
 		"python-sphinx"		=> "python3-sphinx",
 		"yaml"			=> "python3-yaml",
@@ -374,11 +459,16 @@ sub give_debian_hints()
 
 	return if (!$need && !$optional);
 	printf("You should run:\n") if ($verbose_warn_install);
-	printf("\n\tsudo apt-get install $install\n");
+	my $command = "sudo apt-get install $install";
+	run_if_interactive($command);
 }
 
 sub give_redhat_hints()
 {
+	if (!check_user_choice_two("dnf", "yum")) {
+		return;
+	}
+
 	my %map = (
 		"python-sphinx"		=> "python3-sphinx",
 		"yaml"			=> "python3-pyyaml",
@@ -452,16 +542,21 @@ sub give_redhat_hints()
 	if (!$old) {
 		# dnf, for Fedora 18+
 		printf("You should run:\n") if ($verbose_warn_install);
-		printf("\n\tsudo dnf install -y $install\n");
+		my $command = "sudo dnf install -y $install";
+		run_if_interactive($command);
 	} else {
 		# yum, for RHEL (and clones) or Fedora version < 18
 		printf("You should run:\n") if ($verbose_warn_install);
-		printf("\n\tsudo yum install -y $install\n");
+		my $command = "sudo yum install -y $install";
+		run_if_interactive($command);
 	}
 }
 
 sub give_opensuse_hints()
 {
+	if (!check_user_choice("zypper")) {
+		return;
+	}
 	my %map = (
 		"python-sphinx"		=> "python3-sphinx",
 		"yaml"			=> "python3-pyyaml",
@@ -505,11 +600,16 @@ sub give_opensuse_hints()
 
 	return if (!$need && !$optional);
 	printf("You should run:\n") if ($verbose_warn_install);
-	printf("\n\tsudo zypper install --no-recommends $install\n");
+	my $command = "sudo zypper install --no-recommends $install";
+	run_if_interactive($command);
+
 }
 
 sub give_mageia_hints()
 {
+	if (!check_user_choice_two("dnf", "urpmi")) {
+		return;
+	}
 	my %map = (
 		"python-sphinx"		=> "python3-sphinx",
 		"yaml"			=> "python3-yaml",
@@ -538,7 +638,6 @@ sub give_mageia_hints()
 		$noto_sans = "google-noto-sans-cjk-ttc-fonts";
 	}
 
-
 	if ($pdf) {
 		check_missing_file(["/usr/share/fonts/google-noto-cjk/NotoSansCJK-Regular.ttc",
 				    "/usr/share/fonts/TTF/NotoSans-Regular.ttf"],
@@ -550,11 +649,17 @@ sub give_mageia_hints()
 
 	return if (!$need && !$optional);
 	printf("You should run:\n") if ($verbose_warn_install);
-	printf("\n\tsudo $packager_cmd $install\n");
+	my $command = "sudo $packager_cmd $install";
+	run_if_interactive($command);
+
 }
 
 sub give_arch_linux_hints()
 {
+	if (!check_user_choice("pacman")) {
+		return;
+	}
+
 	my %map = (
 		"yaml"			=> "python-yaml",
 		"virtualenv"		=> "python-virtualenv",
@@ -581,11 +686,16 @@ sub give_arch_linux_hints()
 
 	return if (!$need && !$optional);
 	printf("You should run:\n") if ($verbose_warn_install);
-	printf("\n\tsudo pacman -S $install\n");
+	my $command = "sudo pacman -S $install";
+	run_if_interactive($command);
 }
 
 sub give_gentoo_hints()
 {
+	if (!check_user_choice("emerge")) {
+		return;
+	}
+
 	my %map = (
 		"yaml"			=> "dev-python/pyyaml",
 		"virtualenv"		=> "dev-python/virtualenv",
@@ -617,14 +727,15 @@ sub give_gentoo_hints()
 	my $portage_cairo = "/etc/portage/package.use/graphviz";
 
 	if (qx(grep imagemagick $portage_imagemagick 2>/dev/null) eq "") {
-		printf("\tsudo su -c 'echo \"$imagemagick\" > $portage_imagemagick'\n")
+		my $imagemagick_command = "sudo su -c 'echo \"$imagemagick\" > $portage_imagemagick'";
+		run_if_interactive($imagemagick_command);
 	}
 	if (qx(grep graphviz $portage_cairo 2>/dev/null) eq  "") {
-		printf("\tsudo su -c 'echo \"$cairo\" > $portage_cairo'\n");
+		my $portage_command = "sudo su -c 'echo \"$cairo\" > $portage_cairo'";
+		run_if_interactive($portage_command);
 	}
-
-	printf("\tsudo emerge --ask $install\n");
-
+	my $command = "sudo emerge --ask $install";
+	run_if_interactive($command);
 }
 
 sub check_distros()
@@ -678,19 +789,35 @@ sub check_distros()
 		give_gentoo_hints;
 		return;
 	}
+	# if the distro is not recognised
+	# but it is derived from the available options
+	if ($interactive) {
+		my @distros = (
+			{ name => "Debian/Ubuntu", func => \&give_debian_hints },
+			{ name => "RedHat/CentOS/Fedora", func => \&give_redhat_hints },
+			{ name => "OpenSUSE", func => \&give_opensuse_hints },
+			{ name => "Mageia", func => \&give_mageia_hints },
+			{ name => "Arch Linux", func => \&give_arch_linux_hints },
+			{ name => "Gentoo", func => \&give_gentoo_hints },
+		);
+		print "Which distro is your OS based on?\n";
+		for my $i (0 .. $#distros) {
+			printf("[%d] %s\n", $i + 1, $distros[$i]->{name});
+		}
+		print "[0] Others\n";
 
-	#
-	# Fall-back to generic hint code for other distros
-	# That's far from ideal, specially for LaTeX dependencies.
-	#
-	my %map = (
-		"sphinx-build" => "sphinx"
-	);
-	check_missing_tex(2) if ($pdf);
-	check_missing(\%map);
-	print "I don't know distro $system_release.\n";
-	print "So, I can't provide you a hint with the install procedure.\n";
-	print "There are likely missing dependencies.\n";
+		print "Select a number: ";
+		my $choice = <STDIN>;
+		chomp $choice;
+
+		if ($choice =~ /^\d+$/ && $choice >= 1 && $choice <= scalar(@distros)) {
+			$distros[$choice - 1]->{func}->();
+		} else {
+			fallback_unknown_distro();
+		}
+	} else {
+		fallback_unknown_distro();
+	}
 }
 
 #
@@ -1002,12 +1129,20 @@ while (@ARGV) {
 		$pdf = 0;
 	} elsif ($arg eq "--version-check"){
 		$version_check = 1;
+	} elsif ($arg eq "--interactive") {
+		# check if the user can interact with the script
+		if (-t STDIN) {
+			$interactive = 1;
+		} else {
+    		print "Non-interactive environment\n";
+		}
 	} else {
 		print "Usage:\n\t$0 <--no-virtualenv> <--no-pdf> <--version-check>\n\n";
 		print "Where:\n";
 		print "\t--no-virtualenv\t- Recommend installing Sphinx instead of using a virtualenv\n";
 		print "\t--version-check\t- if version is compatible, don't check for missing dependencies\n";
-		print "\t--no-pdf\t- don't check for dependencies required to build PDF docs\n\n";
+		print "\t--no-pdf\t- don't check for dependencies required to build PDF docs\n";
+		print "\t--interactuve\t- Ask to intsall missing dependencies\n\n";
 		exit -1;
 	}
 }
-- 
2.34.1

