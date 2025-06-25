Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E20D2D5417;
	Wed, 25 Jun 2025 16:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750868653; cv=none; b=igdFKtgAZZAOo+nM1lk/v6H8JiHFtBHAY80LpN0/wS9gCMc8cZYc9jPDjRllkODEOpBstOJrf30cPOnEUIsh1aR4bKlk+XRMQZ21FxZTdV/YwBvne6mHYhtyIWuqybrqKxpYClNrK6Reh1tRZpitoB3nlhIBYQN0wSPMTio6+ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750868653; c=relaxed/simple;
	bh=ywTSbJW8cYBqryUVhQgNGBIBoeuXfaX+z0POB1nDl0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M3OmLkcA5NKT3KBFjVGeD0/Onmun4fDg/UBHAgOazoQHmhbx+DeiaIb01Ni2w4pbRsVJXCNAN9VyZPFcHjszLzbKMwpI4tQ2v7nQN1S7vB4gAf2KeFNZITF/lNe0U4PD3f2I789Reh2ogmJw4AHodlaGwdY7gLRXSIfZxggnARo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RkiFCC9E; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RkiFCC9E"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b34a6d0c9a3so23663a12.3;
        Wed, 25 Jun 2025 09:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750868651; x=1751473451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wMm8hdh+Q/9ZbtfahOgUMAt97QmDshyoisEFWqgnNg=;
        b=RkiFCC9E9wgMGrd1HHAmlgz0S3P02WvIQCa7lnB3u2ErVYTuQtY0ETlttCa9gd4+Gb
         IPAb6hIS/ZtEV7NnJeYyimSBhG9E8KdEMUAUWVzWU1LwBvUT3PbdvtYsX5zXT9lDlfeP
         ggV64bgiGG28fFdKVOdMRC+6H1l5U1uPXgaKyxexXk6k6qM0eR8bHlOS1Vcyx3+FvviA
         SNDVdpphz4XTOLsjCTxuy/YaC3YHuc+av30KvyEsIxXcBQQax/TL5Hq4SZ6EPaMnXZUE
         Vqe7KJOsSEGwnJCavd0oy7xkIVgjVS9lvJXFgEgULAQAPPz18HGZSnaJfdU2yVdvKnj5
         vKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750868651; x=1751473451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3wMm8hdh+Q/9ZbtfahOgUMAt97QmDshyoisEFWqgnNg=;
        b=VXSx+MaKVd3uzADk7LTPxToEJDfFKlHgYTarwgKEntu9bF1/K7C01kBBIEN5rSeyhd
         AhQ/T4/F6gKgQqnb/Gsbli0bTVdw6a7K+YQBpWSRu5TtDBYlZ3b6vxjAYI/j5ba/t+7G
         mP5Ey/GX3R+CDWEGZTskUjKLlFtKjxEcsj/ZIXPZSulwcbO1mJlAI+neRjZtbKKoE8qJ
         vHpSMm5AOrj+zDn7vtEJnKIHXtMJRyadb1Qg9jLlILNZDD2cFOrQrrpkWlnaAI/EEKom
         PelMp87ckKK2rTEknlusZmPxtST6tCFvgjZefNmlCCC90it1gMh36vfrWNK1jpA2URKV
         3WOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnTRLSgQdDcNfrha6BWP/p+w0fj2/x+iKLBZbqb3vKqtMxF8xBjnq8/LgWK6zcCD5jiOQ39uxpamiJaGU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaW2uoi1lVMjhmtnkDoUA/nQMAiHdkz9YJzdBFbC3m4Tatn74+
	dRakAQaQojt2wCyj7C1nmwlrB9gNSqFhZ6edq8fwPLYaXE+RiNNIbKLZ
X-Gm-Gg: ASbGnctGMMo6MJQyBDNPYZo7wporubJotTByI0ed9iKRB1Mdg1gk/lQXvgUEBVaYsee
	z9P+3JO7DOwx9RHp65ENsYE+DXAkwLh34q//KBLQwBjFufNyKdvXwKbJQT0af89pAU2UB6WoeGo
	i4da04r7CaCwtcwxDwsIzdSyF9BN0SWhK654EtCqO4PtLUmag56JnoP4ENpw5i3h+T2+vh/Z/Ng
	+kG/yBFdiMfMFZ/M/ACyqAkL3jjJXlpca2UgwguAwLWSUivjVv+/khwCqOkQ4vX/q2u4L/oQQb/
	kYkgY3cJyUj/frT318HROloawOk2k22oXs9K8bIv5USarpennxw5ReQTdM0YpGE=
X-Google-Smtp-Source: AGHT+IGDwm6wCLum9Gzh8sY5xTz2sH5DgJ2zOfsWrkKOS3YApynTyHXBPuBpCQ9ukE7xH7bR9sLRcg==
X-Received: by 2002:a17:90b:164d:b0:311:a314:c2cf with SMTP id 98e67ed59e1d1-315f26a30ddmr5193570a91.30.1750868651228;
        Wed, 25 Jun 2025 09:24:11 -0700 (PDT)
Received: from localhost.localdomain ([2409:40f2:116a:400:f32b:ad5e:ec3f:b2dd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5386edbsm2311631a91.6.2025.06.25.09.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:24:10 -0700 (PDT)
From: Sai Vishnu M <saivishnu725@gmail.com>
X-Google-Original-From: Sai Vishnu M
To: corbet@lwn.net,
	mchehab@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	Sai Vishnu M <saivishnu725@gmail.com>
Subject: [PATCH 4/4] scripts: sphinx-pre-install: Integrate interactive mode
Date: Wed, 25 Jun 2025 21:52:37 +0530
Message-ID: <20250625162237.3996-4-saivishnu725@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625162237.3996-1-saivishnu725@gmail.com>
References: <20250625162237.3996-1-saivishnu725@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sai Vishnu M <saivishnu725@gmail.com>

Replace direct printf calls with run_if_interactive for installation
commands across all distro-specific hint subroutines, enabling user
prompts in interactive mode.

Signed-off-by: Sai Vishnu M <saivishnu725@gmail.com>
---
Patch series history:
1 -> implement the --interactive flag
2 -> add run_if_interactive subroutine
3 -> add fallback to unrecognized distributions

Testing:
========

Tested: Debian, Ubuntu, Fedora, openSUSE Tumbleweed, Mageia.
Skipped: Gentoo (setup complexity but similarity in modification to others)
Steps taken:
1. Podman to download the containers:
	podman pull docker.io/debian:bookworm
	podman pull docker.io/ubuntu:24.04
	podman pull docker.io/fedora:40
	podman pull docker.io/opensuse/tumbleweed:latest
	podman pull docker.io/mageia:9
	podman pull docker.io/gentoo/stage3:latest

2. Copy the script and related files to a temporary folder
	mkdir -p /tmp/sphinx-test/Documentation/
	cp ./scripts/sphinx-pre-install /tmp/sphinx-test
	cp ./Documentation/conf.py /tmp/sphinx-test/Documentation
	cd /tmp/sphinx-test

3. Connect to the containers
	podman run -it --rm -v $(pwd):/work:z CONTAINER:VERSION bash
	Ex: podman run -it --rm -v $(pwd):/work:z debian:bookworm bash
	
4. Install perl and dependencies
	# Debian/Ubuntu
	apt-get update && apt-get install -y perl sudo
	# Fedora
	dnf install -y perl sudo
	# OpenSUSE
	zypper install -y perl sudo
	# Mageia
	dnf install -y perl sudo
	# Gentoo (requires more setup)
	emerge-webrsync && emerge dev-lang/perl

5. Run the script
	a. Interactive
		cd /work; perl sphinx-pre-install --interactive
	b. Non Interactive
		cd /work; perl sphinx-pre-install

 scripts/sphinx-pre-install | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index 87eef15650f2..c2e10170e6c1 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -436,7 +436,8 @@ sub give_debian_hints()
 
 	return if (!$need && !$optional);
 	printf("You should run:\n") if ($verbose_warn_install);
-	printf("\n\tsudo apt-get install $install\n");
+	my $command = "sudo apt-get install $install";
+	run_if_interactive($command);
 }
 
 sub give_redhat_hints()
@@ -514,11 +515,13 @@ sub give_redhat_hints()
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
 
@@ -567,7 +570,8 @@ sub give_opensuse_hints()
 
 	return if (!$need && !$optional);
 	printf("You should run:\n") if ($verbose_warn_install);
-	printf("\n\tsudo zypper install --no-recommends $install\n");
+	my $command = "sudo zypper install --no-recommends $install";
+	run_if_interactive($command);
 }
 
 sub give_mageia_hints()
@@ -612,7 +616,8 @@ sub give_mageia_hints()
 
 	return if (!$need && !$optional);
 	printf("You should run:\n") if ($verbose_warn_install);
-	printf("\n\tsudo $packager_cmd $install\n");
+	my $command = "sudo $packager_cmd $install";
+	run_if_interactive($command);
 }
 
 sub give_arch_linux_hints()
@@ -643,7 +648,8 @@ sub give_arch_linux_hints()
 
 	return if (!$need && !$optional);
 	printf("You should run:\n") if ($verbose_warn_install);
-	printf("\n\tsudo pacman -S $install\n");
+	my $command = "sudo pacman -S $install";
+	run_if_interactive($command);
 }
 
 sub give_gentoo_hints()
@@ -679,13 +685,16 @@ sub give_gentoo_hints()
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
 
-	printf("\tsudo emerge --ask $install\n");
+	my $command = "sudo emerge --ask $install";
+	run_if_interactive($command);
 
 }
 
-- 
2.49.0

